From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:27:01 +0200
Subject: [Buildroot] [git commit] package/odroid-mali: remove package
Message-ID: <20190811122543.97F648E602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=336a47daede583e42105fcadb237c6e6c4ac8d54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package is not needed anymore after support for odroid2c was dropped:
https://git.buildroot.net/buildroot/commit/?id=b80712a16ae3deb65331a7923aa878e13e2e66b6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     |  7 +++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/odroid-mali/Config.in        | 34 -----------------------
 package/odroid-mali/odroid-mali.hash |  2 --
 package/odroid-mali/odroid-mali.mk   | 52 ------------------------------------
 6 files changed, 7 insertions(+), 90 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 03d17d1743..10751a9a23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_ODROID_MALI
+	bool "odroid-mali package was removed"
+	select BR2_LEGACY
+	help
+	  Support for odroidc2 based systems was removed, making the
+	  odroid-mali package useless.
+
 config BR2_PACKAGE_KODI_PLATFORM_AML
 	bool "Kodi AMLogic support was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e8ba6cd985..e5f13d2c33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -579,7 +579,6 @@ F:	package/kvm-unit-tests
 
 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/libamcodec/
-F:	package/odroid-mali/
 F:	package/odroid-scripts/
 
 N:	Daniel J. Leach <dleach@belcan.com>
diff --git a/package/Config.in b/package/Config.in
index 5f2191a554..f8e73be744 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -487,7 +487,6 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
-	source "package/odroid-mali/Config.in"
 	source "package/odroid-scripts/Config.in"
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
deleted file mode 100644
index 1c31c2d0e3..0000000000
--- a/package/odroid-mali/Config.in
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_ODROID_MALI
-	bool "odroid-mali"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_aarch64 || BR2_ARM_EABIHF
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
-	help
-	  Install the ARM Mali drivers for odroidc2 based systems.
-
-	  https://github.com/mdrjr/c2_mali
-
-if BR2_PACKAGE_ODROID_MALI
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "odroid-mali"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "odroid-mali"
-
-endif
-
-config BR2_PACKAGE_ODROID_MALI_X11
-	bool
-	depends on BR2_aarch64 # No 32 bit version available
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-
-comment "odroid-mali needs a glibc toolchain"
-	depends on BR2_aarch64 || BR2_ARM_EABIHF
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
deleted file mode 100644
index b71ebab139..0000000000
--- a/package/odroid-mali/odroid-mali.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed hash
-sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-mali-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
deleted file mode 100644
index 86215a1d52..0000000000
--- a/package/odroid-mali/odroid-mali.mk
+++ /dev/null
@@ -1,52 +0,0 @@
-################################################################################
-#
-# odroid-mali
-#
-################################################################################
-
-ODROID_MALI_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
-ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
-ODROID_MALI_LICENSE = Hardkernel EULA
-ODROID_MALI_LICENSE_FILES = README.md
-
-ODROID_MALI_INSTALL_STAGING = YES
-ODROID_MALI_PROVIDES = libegl libgles
-
-ifeq ($(BR2_PACKAGE_ODROID_MALI_X11),y)
-ODROID_MALI_HEADERS_SUBDIR = x11/mali_headers/
-ODROID_MALI_LIBS_SUBDIR = x11/mali_libs/
-# The X11 blobs are linked against those libraries, and the headers
-# include headers from those libraries
-ODROID_MALI_DEPENDENCIES += \
-	libdrm xlib_libX11 xlib_libXdamage \
-	xlib_libXext xlib_libXfixes
-else
-define ODROID_MALI_FIX_EGL_PC
-	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
-		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-endef
-ODROID_MALI_HEADERS_SUBDIR = fbdev/mali_headers/
-ifeq ($(BR2_aarch64),y)
-ODROID_MALI_LIBS_SUBDIR = fbdev/mali_libs/
-else
-ODROID_MALI_LIBS_SUBDIR = fbdev/32bit_libs/
-endif
-endif
-
-define ODROID_MALI_INSTALL_LIBS
-	cp -dpfr $(@D)/$(ODROID_MALI_LIBS_SUBDIR)/lib* $(1)/usr/lib/
-endef
-
-define ODROID_MALI_INSTALL_STAGING_CMDS
-	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
-	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
-	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
-	cp -dpfr $(@D)/$(ODROID_MALI_HEADERS_SUBDIR)/* $(STAGING_DIR)/usr/include
-	$(ODROID_MALI_FIX_EGL_PC)
-endef
-
-define ODROID_MALI_INSTALL_TARGET_CMDS
-	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR))
-endef
-
-$(eval $(generic-package))
