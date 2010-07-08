From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] ruby: convert to autotools and
	fix build
Message-ID: <20100708115824.BBE1A8269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8bd423159927d40647e47681a74e483fef178677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ruby is converted to the autotools infrastructure, and the dependency
on host-ruby is added since a ruby interpreter is needed to build a
ruby interpreter. Fortunately, this is taken into account in the ruby
build process, and it first start to build a mini-interpreter that is
used to build the rest. However, this doesn't take the
cross-compilation case into account, so we have to build ruby for the
host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |   71 +++++---------------------------------------------
 1 files changed, 7 insertions(+), 64 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4ae76c1..07e5472 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,69 +6,12 @@
 RUBY_VERSION:=1.9.1-p129
 RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
 RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.9
-RUBY_DIR:=$(BUILD_DIR)/ruby-$(RUBY_VERSION)
-RUBY_CAT:=$(ZCAT)
-RUBY_BINARY:=ruby
-RUBY_TARGET_BINARY:=usr/bin/ruby
+RUBY_AUTORECONF=YES
+RUBY_DEPENDENCIES=host-ruby
+RUBY_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+RUBY_MAKE_ENV=$(TARGET_MAKE_ENV)
 
-$(DL_DIR)/$(RUBY_SOURCE):
-	 $(call DOWNLOAD,$(RUBY_SITE),$(RUBY_SOURCE))
+RUBY_CONF_OPT = --disable-install-doc
 
-ruby-source: $(DL_DIR)/$(RUBY_SOURCE)
-
-$(RUBY_DIR)/.unpacked: $(DL_DIR)/$(RUBY_SOURCE)
-	$(RUBY_CAT) $(DL_DIR)/$(RUBY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(RUBY_DIR) package/ruby/ ruby-\*.patch
-	(cd $(RUBY_DIR); autoreconf)
-	touch $(RUBY_DIR)/.unpacked
-
-$(RUBY_DIR)/.configured: $(RUBY_DIR)/.unpacked
-	(cd $(RUBY_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--disable-install-doc \
-		$(DISABLE_IPV6) \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $(RUBY_DIR)/.configured
-
-$(RUBY_DIR)/$(RUBY_BINARY): $(RUBY_DIR)/.configured
-	$(MAKE) -C $(RUBY_DIR)
-
-$(TARGET_DIR)/$(RUBY_TARGET_BINARY): $(RUBY_DIR)/$(RUBY_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(RUBY_DIR) install
-	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-ruby: $(TARGET_DIR)/$(RUBY_TARGET_BINARY)
-
-ruby-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(RUBY_DIR) uninstall
-	-$(MAKE) -C $(RUBY_DIR) clean
-
-ruby-dirclean:
-	rm -rf $(RUBY_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_RUBY),y)
-TARGETS+=ruby
-endif
+$(eval $(call AUTOTARGETS,package,ruby))
+$(eval $(call AUTOTARGETS,package,ruby,host))
-- 
1.7.1
