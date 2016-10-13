From: Dagg Stompler <daggs@gmx.com>
Date: Thu, 13 Oct 2016 20:41:24 +0300
Subject: [Buildroot] [PATCH 2/2] odroid-mali: add support for X11 driver
In-Reply-To: <20161013174124.9639-1-daggs@gmx.com>
References: <20161013174124.9639-1-daggs@gmx.com>
Message-ID: <20161013174124.9639-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

as the X11 odroidc2 driver requires special mali opengl	implmentation,
use the mentoned above mali version if driver is selected.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/odroid-mali/Config.in      |  2 ++
 package/odroid-mali/odroid-mali.mk | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index 2cd8e0d..edda615 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_ODROID_MALI
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
 	help
 	  Install the ARM Mali drivers for odroidc2 based systems.
 
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
index 7b8e511..3649bbc 100644
--- a/package/odroid-mali/odroid-mali.mk
+++ b/package/odroid-mali/odroid-mali.mk
@@ -12,21 +12,36 @@ ODROID_MALI_LICENSE_FILES = README.md
 ODROID_MALI_INSTALL_STAGING = YES
 ODROID_MALI_PROVIDES = libegl libgles
 
+ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2),y)
+ODROID_MALI_INSTALL_FOLDER = x11
+ODROID_MALI_INSTALL_ARCH = mali_libs
+else
+ODROID_MALI_INSTALL_FOLDER = fbdev
 ifeq ($(BR2_aarch64),y)
 ODROID_MALI_INSTALL_ARCH = mali_libs
 else
 ODROID_MALI_INSTALL_ARCH = 32bit_libs
 endif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+ODROID_MALI_DEPENDENCIES += libdrm
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+ODROID_MALI_DEPENDENCIES += xlib_libXdamage
+endif
+
 
 define ODROID_MALI_INSTALL_LIBS
-	cp -dpfr $(@D)/fbdev/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
+	cp -dpfr $(@D)/$(ODROID_MALI_INSTALL_FOLDER)/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
 endef
 
 define ODROID_MALI_INSTALL_STAGING_CMDS
 	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
 	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
 	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
-	cp -dpfr $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
+	cp -dpfr $(@D)/$(ODROID_MALI_INSTALL_FOLDER)/mali_headers/* $(STAGING_DIR)/usr/include
 endef
 
 define ODROID_MALI_INSTALL_TARGET_CMDS
-- 
2.10.1
