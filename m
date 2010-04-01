From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:33 +0100
Subject: [Buildroot] [PATCH 03/16] mesa3d: bump version and convert to
	autotools
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-3-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note this version requires a recent kernel with KMS support as it is
currently configured

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/mesa3d/Config.in                    |    6 +-
 package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch |   12 ---
 package/x11r7/mesa3d/mesa3d.mk                    |   98 ++-------------------
 3 files changed, 11 insertions(+), 105 deletions(-)
 delete mode 100644 package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch

diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index a875098..52876e3 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
diff --git a/package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch b/package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch
deleted file mode 100644
index caa8b31..0000000
--- a/package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ruN Mesa-7.2.orig/src/mesa/x86/Makefile Mesa-7.2/src/mesa/x86/Makefile
---- Mesa-7.2.orig/src/mesa/x86/Makefile	2008-08-25 16:46:47.000000000 +0200
-+++ Mesa-7.2/src/mesa/x86/Makefile	2009-05-08 08:46:34.000000000 +0200
-@@ -21,7 +21,7 @@
- 
- 
- gen_matypes: gen_matypes.c
--	$(CC) $(INCLUDE_DIRS) $(CFLAGS) gen_matypes.c -o gen_matypes
-+	$(CC_FOR_BUILD) $(INCLUDE_DIRS) $(CFLAGS_FOR_BUILD) gen_matypes.c -o gen_matypes
- 
- # need some special rules here, unfortunately
- matypes.h: ../main/mtypes.h ../tnl/t_context.h gen_matypes
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index a72670e..60242cd 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -3,97 +3,15 @@
 # mesa3d
 #
 #############################################################
-MESA3D_VERSION:=7.2
+MESA3D_VERSION:=7.6.1
 MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
-MESA3D_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mesa3d
-MESA3D_DIR:=$(BUILD_DIR)/Mesa-$(MESA3D_VERSION)
-MESA_TARGET:=linux-dri
+MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 
-ifeq ($(BR2_i386),y)
-MESA_TARGET:=linux-dri-x86
-endif
+MESA3D_AUTORECONF = NO
+MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
+MESA3D_INSTALL_STAGING = YES
+MESA3D_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-ifeq ($(BR2_x86_64),y)
-MESA_TARGET:=linux-dri-x86-64
-endif
-
-ifeq ($(BR2_ppc),y)
-MESA_TARGET:=linux-dri-ppc
-endif
-
-MESA_BUILD_ENV=$(TARGET_CONFIGURE_OPTS)
-MESA_CONFIG_FILE=$(MESA3D_DIR)/configs/$(MESA_TARGET)
-
-MESA_GCCINCLUDE=$(shell $(TARGET_CC) -print-search-dirs|grep '^install:'|sed 's/^install: //')/include
-
-#MESA_DRIVERS= i810 i915 i965 mga mach64 r128 r200 r300 s3v savage sis ffb tdfx trident unichrome
-MESA_DRIVERS=
-
-$(DL_DIR)/$(MESA3D_SOURCE):
-	$(call DOWNLOAD,$(MESA3D_SITE),$(MESA3D_SOURCE))
-
-$(MESA3D_DIR)/.extracted: $(DL_DIR)/$(MESA3D_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MESA3D_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MESA3D_DIR) package/x11r7/mesa3d/ mesa3d\*.patch
-	touch $@
-
-$(MESA3D_DIR)/.configured: $(MESA3D_DIR)/.extracted
-	( export $(TARGET_CONFIGURE_OPTS); \
-		echo "DRI_DIRS = $(MESA_DRIVERS)" && \
-		echo "OPT_FLAGS = $(TARGET_CFLAGS)" && \
-		echo "CC = $(TARGET_CC)" && \
-		echo "CXX = $(TARGET_CXX)" && \
-		echo "PIC_FLAGS = -fPIC" && \
-		echo "SRC_DIRS = glx/x11 mesa glu glut/glx" && \
-		echo "USING_EGL = 0" && \
-		echo "X11_INCLUDES = " && \
-		echo "EXTRA_LIB_PATH = " && \
-		echo "PROGRAM_DIRS =" && \
-		echo "LDFLAGS = $(TARGET_LDFLAGS)" && \
-		echo "MKDEP_OPTIONS = -fdepend -Y$(STAGING_DIR)/usr/include -I$(MESA_GCCINCLUDE)" \
-	) >> $(MESA_CONFIG_FILE)
-	touch $@
-
-$(MESA3D_DIR)/.built: $(MESA3D_DIR)/.configured
-	rm -f $(MESA3D_DIR)/config/current
-	env $(MESA_BUILD_ENV) $(MAKE1) \
-		CC=$(TARGET_CC) CXX=$(TARGET_CXX) CC_FOR_BUILD=/usr/bin/gcc \
-		-C $(MESA3D_DIR) $(MESA_TARGET)
-	touch $@
-
-$(MESA3D_DIR)/.installed: $(MESA3D_DIR)/.built
-	env $(MESA_BUILD_ENV) $(MAKE) \
-		INSTALL_DIR=$(STAGING_DIR)/usr \
-		DRI_DRIVER_INSTALL_DIR=$(STAGING_DIR)/usr/lib/dri \
-		-C $(MESA3D_DIR) install
-	env $(MESA_BUILD_ENV) $(MAKE) \
-		INSTALL_DIR=$(TARGET_DIR)/usr \
-		DRI_DRIVER_INSTALL_DIR=$(TARGET_DIR)/usr/lib/dri \
-		-C $(MESA3D_DIR) install
-	rm -Rf $(TARGET_DIR)/usr/include/GL
-	touch $@
-
-mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess host-xutil_makedepend
-mesa3d-source: $(DL_DIR)/$(MESA3D_SOURCE)
-mesa3d-configure: $(MESA3D_DIR)/.configured
-mesa3d-build: $(MESA3D_DIR)/.built
-mesa3d: mesa3d-depends $(MESA3D_DIR)/.installed
-
-mesa3d-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(MESA3D_DIR) uninstall
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(MESA3D_DIR) uninstall
-	-$(MAKE) -C $(MESA3D_DIR) clean
-
-mesa3d-dirclean:
-	rm -rf $(MESA3D_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MESA3D),y)
-TARGETS+=mesa3d
-endif
-# :mode=makefile:
+MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
 
+$(eval $(call AUTOTARGETS,package/x11r7,mesa3d))
-- 
1.7.0
