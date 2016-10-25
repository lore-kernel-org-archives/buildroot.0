From: Dagg Stompler <daggs@gmx.com>
Date: Tue, 25 Oct 2016 20:54:17 +0300
Subject: [Buildroot] [PATCH v2 3/3] odroid-mali: add support for x11 egl
	implementation
In-Reply-To: <20161025175417.25901-1-daggs@gmx.com>
References: <20161025175417.25901-1-daggs@gmx.com>
Message-ID: <20161025175417.25901-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

allow installation of the x11 egl support required for the X11 ddx
driver.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

v1 -> v2 (Arnout Vandecappelle):
 - fix install folder naming
 - fix dependecies.
 - introduce BR2_PACKAGE_ODROID_MALI_X11 which allows better flow control

 package/odroid-mali/Config.in      | 10 ++++++++++
 package/odroid-mali/odroid-mali.mk | 20 +++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index 2cd8e0d..ee33286 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -5,6 +5,11 @@ config BR2_PACKAGE_ODROID_MALI
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_ODROID_MALI_X11
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_ODROID_MALI_X11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_ODROID_MALI_X11
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_ODROID_MALI_X11
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_ODROID_MALI_X11
 	help
 	  Install the ARM Mali drivers for odroidc2 based systems.
 
@@ -20,6 +25,11 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif
 
+
+config BR2_PACKAGE_ODROID_MALI_X11
+	bool
+	depends on BR2_aarch64 # No 32 bit version available
+
 comment "odroid-mali needs a glibc toolchain"
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
index 7b8e511..ae87f92 100644
--- a/package/odroid-mali/odroid-mali.mk
+++ b/package/odroid-mali/odroid-mali.mk
@@ -11,22 +11,32 @@ ODROID_MALI_LICENSE_FILES = README.md
 
 ODROID_MALI_INSTALL_STAGING = YES
 ODROID_MALI_PROVIDES = libegl libgles
+ODROID_MALI_SRC_ARCH = mali_libs
 
-ifeq ($(BR2_aarch64),y)
-ODROID_MALI_INSTALL_ARCH = mali_libs
+ifeq ($(BR2_PACKAGE_ODROID_MALI_X11),y)
+ODROID_MALI_SRC_FOLDER = x11
+# The X11 version of the headers include X11/Xlib.h and X11/Xutil.h
+ODROID_MALI_DEPENDENCIES += libdrm
+ODROID_MALI_DEPENDENCIES += xlib_libX11
+ODROID_MALI_DEPENDENCIES += xlib_libXdamage
+ODROID_MALI_DEPENDENCIES += xlib_libXext
+ODROID_MALI_DEPENDENCIES += xlib_libXfixes
 else
-ODROID_MALI_INSTALL_ARCH = 32bit_libs
+ODROID_MALI_SRC_FOLDER = fbdev
+ifneq ($(BR2_aarch64),y)
+ODROID_MALI_SRC_ARCH = 32bit_libs
+endif
 endif
 
 define ODROID_MALI_INSTALL_LIBS
-	cp -dpfr $(@D)/fbdev/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
+	cp -dpfr $(@D)/$(ODROID_MALI_SRC_FOLDER)/$(ODROID_MALI_SRC_ARCH)/lib* $(1)/usr/lib/
 endef
 
 define ODROID_MALI_INSTALL_STAGING_CMDS
 	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
 	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
 	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
-	cp -dpfr $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
+	cp -dpfr $(@D)/$(ODROID_MALI_SRC_FOLDER)/mali_headers/* $(STAGING_DIR)/usr/include
 endef
 
 define ODROID_MALI_INSTALL_TARGET_CMDS
-- 
2.10.1
