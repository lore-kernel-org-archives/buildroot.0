From: Martin Banky <martin.banky@gmail.com>
Date: Thu, 30 Sep 2010 14:37:01 +0200
Subject: [Buildroot] [git commit master 1/1] cvs: convert to autotargets
Message-ID: <20100930123758.5E0948B7C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82ab8b3b31b968b11f1e26bd52a63c127d6182cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: no strip, remove _BINARY vars]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 package/cvs/cvs.mk |   91 ++++++++++++++-------------------------------------
 2 files changed, 26 insertions(+), 67 deletions(-)

diff --git a/CHANGES b/CHANGES
index cf85b85..fad49f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -22,7 +22,7 @@
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
-	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
+	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
 	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index e0f97ec..023e93b 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -3,16 +3,15 @@
 # cvs
 #
 #############################################################
-CVS_VERSION:=1.12.13
-CVS_SOURCE:=cvs_$(CVS_VERSION).orig.tar.gz
-CVS_PATCH:=cvs_$(CVS_VERSION)-8.diff.gz
-CVS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs/
-CVS_DIR:=$(BUILD_DIR)/cvs-$(CVS_VERSION)
-CVS_CAT:=$(ZCAT)
-CVS_BINARY:=src/cvs
-CVS_TARGET_BINARY:=usr/bin/cvs
+CVS_VERSION = 1.12.13
+CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
+CVS_PATCH = cvs_$(CVS_VERSION)-12.diff.gz
+CVS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs/
+CVS_DEPENDENCIES = ncurses
 
-CVS_CONFIGURE_ARGS:=--disable-old-info-format-support
+CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
+
+CVS_CONFIGURE_ARGS=--disable-old-info-format-support
 ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
 CVS_CONFIGURE_ARGS+=--enable-server
 else
@@ -22,73 +21,33 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 CVS_CONFIGURE_ARGS+=--with-external-zlib
 endif
 
-$(DL_DIR)/$(CVS_SOURCE):
-	$(call DOWNLOAD,$(CVS_SITE),$(CVS_SOURCE))
+CVS_CONF_OPT = $(CVS_CONFIGURE_ARGS)
 
-ifneq ($(CVS_PATCH),)
-CVS_PATCH_FILE=$(DL_DIR)/$(CVS_PATCH)
-$(CVS_PATCH_FILE):
-	$(call DOWNLOAD,$(CVS_SITE),$(CVS_PATCH))
-endif
-cvs-source: $(DL_DIR)/$(CVS_SOURCE) $(CVS_PATCH_FILE)
+define CVS_BZIP_UNPACK
+	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
+endef
+
+CVS_POST_PATCH_HOOKS += CVS_BZIP_UNPACK
 
-$(CVS_DIR)/.unpacked: $(DL_DIR)/$(CVS_SOURCE) $(CVS_PATCH_FILE)
-	-mkdir $(CVS_DIR)
-	$(CVS_CAT) $(DL_DIR)/$(CVS_SOURCE) | tar -C $(CVS_DIR) $(TAR_OPTIONS) -
-	$(BZCAT) $(CVS_DIR)/cvs-$(CVS_VERSION)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	rm -rf $(CVS_DIR)/cvs-$(CVS_VERSION)
-	$(CONFIG_UPDATE) $(CVS_DIR)
-	$(CONFIG_UPDATE) $(CVS_DIR)/build-aux
-	toolchain/patch-kernel.sh $(CVS_DIR) package/cvs \*$(CVS_VERSION)\*.patch
 ifneq ($(CVS_PATCH),)
-	toolchain/patch-kernel.sh $(CVS_DIR) $(DL_DIR) $(CVS_PATCH)
-	if [ -d $(CVS_DIR)/debian/patches ]; then \
-		(cd $(CVS_DIR)/debian/patches && for i in *; \
+define CVS_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		(cd $(@D)/debian/patches && for i in *; \
 		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
 		 done; \
 		); \
-		toolchain/patch-kernel.sh $(CVS_DIR) $(CVS_DIR)/debian/patches \*; \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
 	fi
+endef
 endif
-	touch $@
-
-$(CVS_DIR)/.configured: $(CVS_DIR)/.unpacked
-	(cd $(CVS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		cvs_cv_func_printf_ptr=yes \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_LARGEFILE) \
-		$(DISABLE_NLS) \
-		$(CVS_CONFIGURE_ARGS) \
-	)
-	touch $@
-
-$(CVS_DIR)/$(CVS_BINARY): $(CVS_DIR)/.configured
-	$(MAKE) -C $(CVS_DIR)
 
-$(TARGET_DIR)/$(CVS_TARGET_BINARY): $(CVS_DIR)/$(CVS_BINARY)
-	install -D $(CVS_DIR)/$(CVS_BINARY) $(TARGET_DIR)/$(CVS_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(CVS_TARGET_BINARY)
+CVS_POST_PATCH_HOOKS += CVS_DEBIAN_PATCHES
 
-cvs: ncurses $(TARGET_DIR)/$(CVS_TARGET_BINARY)
+define CVS_INSTALL_TARGET_CMDS
+	install -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
+endef
 
-cvs-clean:
-	-$(MAKE) -C $(CVS_DIR) clean
-	rm -f $(TARGET_DIR)/$(CVS_TARGET_BINARY)
+$(eval $(call AUTOTARGETS,package,cvs))
 
-cvs-dirclean:
-	rm -rf $(CVS_DIR)
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_CVS),y)
-TARGETS+=cvs
-endif
-- 
1.7.1
