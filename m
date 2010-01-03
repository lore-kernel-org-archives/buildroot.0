From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  3 Jan 2010 19:51:48 +0100
Subject: [Buildroot] [PATCH 2/3] readline: convert to autotools
	infrastructure
In-Reply-To: <1262544709-2771-1-git-send-email-llandwerlin@gmail.com>
References: <1262544709-2771-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1262544709-2771-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/readline/readline.mk |  107 ++++++++---------------------------------
 1 files changed, 21 insertions(+), 86 deletions(-)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 34c02d8..641cd71 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -3,89 +3,24 @@
 # build GNU readline
 #
 #############################################################
-READLINE_VERSION:=5.2
-READLINE_SITE:=$(BR2_GNU_MIRROR)/readline
-READLINE_SOURCE:=readline-$(READLINE_VERSION).tar.gz
-READLINE_DIR:=$(BUILD_DIR)/readline-$(READLINE_VERSION)
-READLINE_CAT:=$(ZCAT)
-READLINE_BINARY:=libhistory.a
-READLINE_SHARED_BINARY:=libhistory.so
-READLINE_TARGET_BINARY:=usr/lib/$(READLINE_BINARY)
-READLINE_TARGET_SHARED_BINARY:=usr/lib/$(READLINE_SHARED_BINARY)
-
-$(DL_DIR)/$(READLINE_SOURCE):
-	$(call DOWNLOAD,$(READLINE_SITE),$(READLINE_SOURCE))
-
-readline-source: $(DL_DIR)/$(READLINE_SOURCE)
-
-$(READLINE_DIR)/.unpacked: $(DL_DIR)/$(READLINE_SOURCE)
-	mkdir -p $(READLINE_DIR)
-	tar -C $(BUILD_DIR) -zxf $(DL_DIR)/$(READLINE_SOURCE)
-	toolchain/patch-kernel.sh $(READLINE_DIR) package/readline/ readline??-???
-	$(CONFIG_UPDATE) $(READLINE_DIR)
-	$(CONFIG_UPDATE) $(READLINE_DIR)/support
-	touch $@
-
-$(READLINE_DIR)/.configured: $(READLINE_DIR)/.unpacked
-	(cd $(READLINE_DIR); rm -rf config.cache; \
-		bash_cv_func_sigsetjmp=yes \
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
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--with-shared \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-	)
-	touch $@
-
-$(READLINE_DIR)/$(READLINE_BINARY): $(READLINE_DIR)/.configured
-	$(MAKE) -C $(READLINE_DIR) SHLIB_LIBS="-lncurses"
-	ls $(READLINE_DIR)/$(READLINE_BINARY)
-	touch -c $@
-
-$(STAGING_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/.configured
-	$(MAKE) -C $(READLINE_DIR) install
-	touch -c $@
-
-# Install to Staging area
-$(STAGING_DIR)/usr/include/readline/readline.h: $(READLINE_DIR)/$(READLINE_BINARY)
-	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
-	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(READLINE_DIR) install
-	touch -c $@
-
-# Install to Target directory
-$(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY): $(READLINE_DIR)/$(READLINE_BINARY)
-	# make sure we don't end up with lib{readline,history}...old
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
-	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
-	$(MAKE1) DESTDIR=$(TARGET_DIR) \
-		-C $(READLINE_DIR) install-shared uninstall-doc
-	chmod 775 $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
-	$(STRIPCMD) $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
-
-readline: ncurses $(STAGING_DIR)/usr/include/readline/readline.h $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
-
-readline-clean:
-	-$(MAKE) -C $(READLINE_DIR) DESTDIR=$(STAGING_DIR) uninstall
-	-$(MAKE) -C $(READLINE_DIR) DESTDIR=$(TARGET_DIR) uninstall
-	-$(MAKE) -C $(READLINE_DIR) clean
-
-readline-dirclean:
-	rm -rf $(READLINE_DIR)
-
-ifeq ($(BR2_PACKAGE_READLINE),y)
-TARGETS+=readline
-endif
+READLINE_VERSION = 5.2
+READLINE_SOURCE = readline-$(READLINE_VERSION).tar.gz
+READLINE_SITE = $(BR2_GNU_MIRROR)/readline
+READLINE_INSTALL_STAGING = YES
+READLINE_INSTALL_TARGET = YES
+
+READLINE_DEPENDENCIES = ncurses
+
+READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes
+
+define READLINE_INSTALL_TARGET_CMDS
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(@D) install-shared uninstall-doc
+	chmod 775 $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) \
+		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
+		$(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) \
+		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
+endef
+
+$(eval $(call AUTOTARGETS,package,readline))
-- 
1.6.5.7
