From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 15:03:46 +0100
Subject: [Buildroot] [git commit] odroid-mali: add support for x11 egl
	implementation
Message-ID: <20161218140353.70FE18188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1bf130ca8a52ea4d1ee39fa06abba6fa970b889
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow installation of the x11 egl support required for the X11 ddx
driver. The BR2_PACKAGE_ODROID_MALI_X11 hidden option will be selected
by the X11 DDX driver.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
[Thomas:
 - select BR2_PACKAGE_LIBDRM,
   BR2_PACKAGE_XLIB_{LIBX11,LIBXFIXES,LIBXEXT,LIBXDAMAGE} from
   BR2_PACKAGE_ODROID_MALI_X11 in order to avoid numerous "if" in
   Config.in
 - Use a single assignment to ODROID_MALI_DEPENDENCIES to add the
   dependencies for libdrm and the X11 libraries.
 - Introduce ODROID_MALI_HEADERS_SUBDIR and ODROID_MALI_LIBS_SUBDIR to
   clarify the location of the headers and libraries for the selected
   architecture/display backend in the Mali tree.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-mali/Config.in      |  9 +++++++++
 package/odroid-mali/odroid-mali.mk | 19 +++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index 2cd8e0d..e5c07f2 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -20,6 +20,15 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif
 
+config BR2_PACKAGE_ODROID_MALI_X11
+	bool
+	depends on BR2_aarch64 # No 32 bit version available
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+
 comment "odroid-mali needs a glibc toolchain"
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
index 7b8e511..142fd97 100644
--- a/package/odroid-mali/odroid-mali.mk
+++ b/package/odroid-mali/odroid-mali.mk
@@ -12,21 +12,32 @@ ODROID_MALI_LICENSE_FILES = README.md
 ODROID_MALI_INSTALL_STAGING = YES
 ODROID_MALI_PROVIDES = libegl libgles
 
+ifeq ($(BR2_PACKAGE_ODROID_MALI_X11),y)
+ODROID_MALI_HEADERS_SUBDIR = x11/mali_headers/
+ODROID_MALI_LIBS_SUBDIR = x11/mali_libs/
+# The X11 blobs are linked against those libraries, and the headers
+# include headers from those libraries
+ODROID_MALI_DEPENDENCIES += \
+	libdrm xlib_libX11 xlib_libXdamage \
+	xlib_libXext xlib_libXfixes
+else
+ODROID_MALI_HEADERS_SUBDIR = fbdev/mali_headers/
 ifeq ($(BR2_aarch64),y)
-ODROID_MALI_INSTALL_ARCH = mali_libs
+ODROID_MALI_LIBS_SUBDIR = fbdev/mali_libs/
 else
-ODROID_MALI_INSTALL_ARCH = 32bit_libs
+ODROID_MALI_LIBS_SUBDIR = fbdev/32bit_libs/
+endif
 endif
 
 define ODROID_MALI_INSTALL_LIBS
-	cp -dpfr $(@D)/fbdev/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
+	cp -dpfr $(@D)/$(ODROID_MALI_LIBS_SUBDIR)/lib* $(1)/usr/lib/
 endef
 
 define ODROID_MALI_INSTALL_STAGING_CMDS
 	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
 	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
 	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
-	cp -dpfr $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
+	cp -dpfr $(@D)/$(ODROID_MALI_HEADERS_SUBDIR)/* $(STAGING_DIR)/usr/include
 endef
 
 define ODROID_MALI_INSTALL_TARGET_CMDS
