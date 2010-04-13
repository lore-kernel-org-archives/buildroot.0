From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] bison: convert to the autotools
	infrastructure
Message-ID: <20100413195156.D6B1020F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=98611b3a5ec060c8564a0ed7188abbeb15a8dfd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bison/bison.mk |   69 +++--------------------------------------------
 1 files changed, 5 insertions(+), 64 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index f29259f..9e28e85 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -6,70 +6,11 @@
 BISON_VERSION:=2.3
 BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
 BISON_SITE:=$(BR2_GNU_MIRROR)/bison
-BISON_DIR:=$(BUILD_DIR)/bison-$(BISON_VERSION)
-BISON_CAT:=$(BZCAT)
-BISON_BINARY:=src/bison
-BISON_TARGET_BINARY:=usr/bin/bison
 
-$(DL_DIR)/$(BISON_SOURCE):
-	 $(call DOWNLOAD,$(BISON_SITE),$(BISON_SOURCE))
+define BISON_DISABLE_EXAMPLES
+	echo 'all install:' > $(@D)/examples/Makefile
+endef
 
-bison-source: $(DL_DIR)/$(BISON_SOURCE)
+BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
-$(BISON_DIR)/.unpacked: $(DL_DIR)/$(BISON_SOURCE)
-	$(BISON_CAT) $(DL_DIR)/$(BISON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(BISON_DIR)/build-aux
-	touch $@
-
-$(BISON_DIR)/.configured: $(BISON_DIR)/.unpacked
-	(cd $(BISON_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		gt_cv_func_gnugettext2_libintl=yes \
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
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--includedir=/usr/include \
-		$(DISABLE_NLS) \
-	)
-	echo 'all install:' > $(BISON_DIR)/examples/Makefile
-	touch $@
-
-$(BISON_DIR)/$(BISON_BINARY): $(BISON_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(BISON_DIR)
-
-$(TARGET_DIR)/$(BISON_TARGET_BINARY): $(BISON_DIR)/$(BISON_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) install
-	rm -rf $(TARGET_DIR)/share/locale
-	cp -a package/bison/yacc $(TARGET_DIR)/usr/bin/yacc
-
-bison: $(TARGET_DIR)/$(BISON_TARGET_BINARY)
-
-bison-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) uninstall
-	rm -f $(TARGET_DIR)/$(BISON_TARGET_BINARY)
-	-$(MAKE) -C $(BISON_DIR) clean
-
-bison-dirclean:
-	rm -rf $(BISON_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BISON),y)
-TARGETS+=bison
-endif
+$(eval $(call AUTOTARGETS,package,bison))
-- 
1.6.3.3
