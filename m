From: Martin Banky <martin.banky@gmail.com>
Date: Thu, 30 Sep 2010 12:03:31 -0700
Subject: [Buildroot] [PATCH 1/6] coreutils: converted to autotarget
In-Reply-To: <1285873416-20755-1-git-send-email-Martin.Banky@gmail.com>
References: <1285873416-20755-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285873416-20755-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/coreutils/coreutils.mk |  107 ++++++++++-----------------------------
 1 files changed, 28 insertions(+), 79 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index f9910c6..078e28f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -3,37 +3,21 @@
 # coreutils
 #
 #############################################################
-COREUTILS_VERSION:=7.4
-COREUTILS_SOURCE:=coreutils-$(COREUTILS_VERSION).tar.gz
-#COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
-COREUTILS_SITE:=$(BR2_GNU_MIRROR)/coreutils
-COREUTILS_CAT:=$(ZCAT)
-COREUTILS_DIR:=$(BUILD_DIR)/coreutils-$(COREUTILS_VERSION)
-COREUTILS_BINARY:=src/vdir
-COREUTILS_TARGET_BINARY:=bin/vdir
-BIN_PROGS:=cat chgrp chmod chown cp date dd df dir echo false hostname \
-	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
-	uname join
+COREUTILS_VERSION = 7.4
+COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.gz
+COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 
-$(DL_DIR)/$(COREUTILS_SOURCE):
-	 $(call DOWNLOAD,$(COREUTILS_SITE),$(COREUTILS_SOURCE))
-
-coreutils-source: $(DL_DIR)/$(COREUTILS_SOURCE)
+# If both coreutils and busybox are selected, make certain coreutils
+# wins the fight over who gets to have their utils actually installed.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+COREUTILS_DEPENDENCIES = busybox
+endif
 
-$(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
-	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils\*.patch
-	$(CONFIG_UPDATE) $(COREUTILS_DIR)/build-aux
-	# ensure rename.m4 file is older than configure / aclocal.m4 so
-	# auto* isn't rerun
-	touch -d '1979-01-01' $(@D)/m4/rename.m4
-	touch $@
+COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostname \
+	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
+	uname join
 
-$(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
-	(cd $(COREUTILS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_strtod=yes \
+COREUTILS_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
 		ac_cv_func_closedir_void=no \
@@ -81,68 +65,33 @@ $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
 		ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
-		gl_cv_c_restrict=no \
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
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--disable-rpath \
-		--disable-dependency-tracking \
-	)
-	touch $@
+		gl_cv_c_restrict=no
 
-$(COREUTILS_DIR)/$(COREUTILS_BINARY): $(COREUTILS_DIR)/.configured
-	$(MAKE) -C $(COREUTILS_DIR)
-	rm -f $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)
+COREUTILS_CONF_OPT = --disable-rpath \
+		--disable-dependency-tracking
 
-$(TARGET_DIR)/$(COREUTILS_TARGET_BINARY): $(COREUTILS_DIR)/$(COREUTILS_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(COREUTILS_DIR) install
+define COREUTILS_TOUCH_RENAME_M4
+	# ensure rename.m4 file is older than configure / aclocal.m4 so
+	# auto* isn't rerun
+	touch -d '1979-01-01' $(@D)/m4/rename.m4
+endef
+
+COREUTILS_POST_PATCH_HOOKS += COREUTILS_TOUCH_RENAME_M4
+
+define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
-	for f in $(BIN_PROGS); do \
+	for f in $(COREUTILS_BIN_PROGS); do \
 		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
 	done
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
 	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
-	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/chroot > /dev/null 2>&1
-	rm -rf $(TARGET_DIR)/share/locale
+endef
 
-# If both coreutils and busybox are selected, make certain coreutils
-# wins the fight over who gets to have their utils actually installed.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-coreutils: busybox $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)
-else
-coreutils: $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)
-endif
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
 
 # If both coreutils and busybox are selected, the corresponding applets
 # may need to be reinstated by the clean targets.
-coreutils-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(COREUTILS_DIR) uninstall
-	-$(MAKE) -C $(COREUTILS_DIR) clean
 
-coreutils-dirclean:
-	rm -rf $(COREUTILS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_COREUTILS),y)
-TARGETS+=coreutils
-endif
+$(eval $(call AUTOTARGETS,package,coreutils))
-- 
1.7.3
