From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] mii-diag: convert to gentargets
	and bump to 2.11.3
Message-ID: <20101214003641.700848E2DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9962388776d4250451d64001335440c38975ac47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[ Thomas: minor fixes. ]

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    4 +-
 package/mii-diag/Config.in             |    2 +-
 package/mii-diag/mii-diag-strchr.patch |    3 +
 package/mii-diag/mii-diag.mk           |   72 ++++++++++---------------------
 4 files changed, 29 insertions(+), 52 deletions(-)

diff --git a/CHANGES b/CHANGES
index 79dac1b..c56fa75 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,8 +6,8 @@
 	Updated/fixed packages: at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
 	hostapd, i2c-tools, input-tools, libconfig, ltp-testsuite, m4,
-	openssh, openssl, openvpn, pango, qt, rsync, sdl_gfx,
-	sdl_sound, udev, usbutils, xz, zlib
+	mii-diag, openssh, openssl, openvpn, pango, qt, rsync,
+	sdl_gfx, sdl_sound, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
diff --git a/package/mii-diag/Config.in b/package/mii-diag/Config.in
index ea5fae4..ca48ba2 100644
--- a/package/mii-diag/Config.in
+++ b/package/mii-diag/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_MIIDIAG
+config BR2_PACKAGE_MII_DIAG
 	bool "mii-diag"
 	help
 	  mii-diag allows you to manipulate the MII registers of
diff --git a/package/mii-diag/mii-diag-strchr.patch b/package/mii-diag/mii-diag-strchr.patch
index 537c042..fcfeb3c 100644
--- a/package/mii-diag/mii-diag-strchr.patch
+++ b/package/mii-diag/mii-diag-strchr.patch
@@ -1,3 +1,6 @@
+Use the strrchr() function instead of the deprecated rindex()
+function.
+
 --- mii-diag-2.11.orig/mii-diag.c.orig	2008-06-25 11:08:52.000000000 +1000
 +++ mii-diag-2.11.orig/mii-diag.c	2005-03-27 03:56:33.000000000 +1000
 @@ -174,7 +174,7 @@
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index ba01c0e..01a8b5f 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -3,59 +3,33 @@
 # mii-diag
 #
 #############################################################
-MIIDIAG_VERSION:=2.11
-MIIDIAG_DEBIAN_PATCH_LEVEL:=2
-MIIDIAG_SOURCE:=mii-diag_$(MIIDIAG_VERSION).orig.tar.gz
-MIIDIAG_PATCH_FILE=mii-diag_$(MIIDIAG_VERSION)-$(MIIDIAG_DEBIAN_PATCH_LEVEL).diff.gz
-MIIDIAG_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
-MIIDIAG_DIR:=$(BUILD_DIR)/mii-diag-$(MIIDIAG_VERSION)
-MIIDIAG_CAT:=$(ZCAT)
-MIIDIAG_BINARY:=usr/sbin/mii-diag
+MII_DIAG_VERSION = 2.11
+MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
+MII_DIAG_PATCH   = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
+MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 
-ifneq ($(MIIDIAG_PATCH_FILE),)
-MIIDIAG_PATCH=$(DL_DIR)/$(MIIDIAG_PATCH_FILE)
-$(MIIDIAG_PATCH):
-	$(call DOWNLOAD,$(MIIDIAG_SITE),$(MIIDIAG_PATCH_FILE))
-endif
+define MII_DIAG_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
 
-$(DL_DIR)/$(MIIDIAG_SOURCE):
-	$(call DOWNLOAD,$(MIIDIAG_SITE),$(MIIDIAG_SOURCE))
+MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
 
-$(MIIDIAG_DIR)/.unpacked: $(DL_DIR)/$(MIIDIAG_SOURCE) $(MIIDIAG_PATCH)
-	mkdir -p $(MIIDIAG_DIR)
-	$(MIIDIAG_CAT) $(DL_DIR)/$(MIIDIAG_SOURCE) | tar --strip 1 -C $(MIIDIAG_DIR) $(TAR_OPTIONS) -
-ifneq ($(MIIDIAG_PATCH_FILE),)
-	(cd $(MIIDIAG_DIR) && $(MIIDIAG_CAT) $(MIIDIAG_PATCH) | patch -p1)
-endif
-	toolchain/patch-kernel.sh $(MIIDIAG_DIR) package/mii-diag/ mii-diag-\*.patch*
-	touch $@
+define MII_DIAG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-$(MIIDIAG_DIR)/.configured: $(MIIDIAG_DIR)/.unpacked
-	touch $@
+define MII_DIAG_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
 
-$(MIIDIAG_DIR)/mii-diag: $(MIIDIAG_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR)
+define MII_DIAG_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/mii-diag
+endef
 
-$(TARGET_DIR)/$(MIIDIAG_BINARY): $(MIIDIAG_DIR)/mii-diag
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR) DESTDIR=$(TARGET_DIR) install
-	$(STRIPCMD) $@
-	touch $@
+define MII_DIAG_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-mii-diag: $(TARGET_DIR)/$(MIIDIAG_BINARY)
-
-mii-diag-source: $(DL_DIR)/$(MIIDIAG_SOURCE) $(MIIDIAG_PATCH)
-
-mii-diag-clean:
-	-$(MAKE) -C $(MIIDIAG_DIR) clean
-
-mii-diag-dirclean:
-	rm -rf $(MIIDIAG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MIIDIAG),y)
-TARGETS+=mii-diag
-endif
+$(eval $(call GENTARGETS,package,mii-diag))
-- 
1.7.2.2
