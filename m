From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:16:57 +0100
Subject: [Buildroot] [git commit] package/sunxi-mali: remove package
Message-ID: <20190315221544.3DFB981481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=732066a54ea708501491077e967957d1ebfa01bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package sunxi-mali-mainline is available for recent kernels.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  9 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/qt5/qt5base/qt5base.mk                     |  2 +-
 .../0001-Add-missing-GLchar-definitions.patch      | 45 -------------
 .../0002-linking-of-test-app-needs-libUMP.patch    | 18 ------
 ...ting-data-types-between-GLES2-gl2.h-and-G.patch | 57 -----------------
 package/sunxi-mali/Config.in                       | 59 -----------------
 package/sunxi-mali/S80mali                         | 54 ----------------
 package/sunxi-mali/egl.pc                          | 12 ----
 package/sunxi-mali/glesv2.pc                       | 12 ----
 package/sunxi-mali/sunxi-mali.hash                 |  2 -
 package/sunxi-mali/sunxi-mali.mk                   | 73 ----------------------
 13 files changed, 10 insertions(+), 335 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2f99dc8ad2..c094f07584 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_PACKAGE_SUNXI_MALI
+	bool "sunxi-mali package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	help
+	  The sunxi-mali package was removed, as the
+	  sunxi-mali-mainline package replaces it for mainline
+	  kernels on Allwinner platforms.
+
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils version 2.29 support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8a57cb2e23..62ad09950b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2029,7 +2029,6 @@ F:	package/a10disp/
 F:	package/glmark2/
 F:	package/libvpx/
 F:	package/mesa3d-demos/
-F:	package/sunxi-mali/
 F:	package/ti-gfx/
 
 N:	Stefan S??rensen <stefan.sorensen@spectralink.com>
diff --git a/package/Config.in b/package/Config.in
index ba961a22b3..b8c57d34eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,7 +519,6 @@ endmenu
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
-	source "package/sunxi-mali/Config.in"
 	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sunxi-mali-mainline-driver/Config.in"
 	source "package/sysstat/Config.in"
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e7f6e658f1..14536980a8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -275,7 +275,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
-else ifeq ($(BR2_PACKAGE_SUNXI_MALI)$(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
 endif
diff --git a/package/sunxi-mali/0001-Add-missing-GLchar-definitions.patch b/package/sunxi-mali/0001-Add-missing-GLchar-definitions.patch
deleted file mode 100644
index a9370b009d..0000000000
--- a/package/sunxi-mali/0001-Add-missing-GLchar-definitions.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 058d5e8cd90d117535b5d314fd9e15c70028ff20 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 21 Apr 2014 19:31:23 +0200
-Subject: [PATCH] Add missing GLchar definitions.
-
-The GLES and GLES2 header files provided by sunxi-mali do not define the
-type "GLchar" and use "char" instead in the prototype of some functions.
-
-This issue has been reported upstream some time ago, but the pull
-request has not been merged yet.  (See
-https://github.com/linux-sunxi/sunxi-mali/pull/8).
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- include/GLES/gl.h   | 1 +
- include/GLES2/gl2.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/include/GLES/gl.h b/include/GLES/gl.h
-index 858f394..a6bb591 100644
---- a/include/GLES/gl.h
-+++ b/include/GLES/gl.h
-@@ -29,6 +29,7 @@ typedef float  GLfloat;
- typedef float  GLclampf;
- typedef signed int  GLfixed;
- typedef signed int  GLclampx;
-+typedef char GLchar;
- 
- typedef int * GLintptr;
- typedef int *  GLsizeiptr;
-diff --git a/include/GLES2/gl2.h b/include/GLES2/gl2.h
-index 59e376c..90d96bb 100644
---- a/include/GLES2/gl2.h
-+++ b/include/GLES2/gl2.h
-@@ -32,6 +32,7 @@ typedef unsigned int     GLuint;
- typedef khronos_float_t  GLfloat;
- typedef khronos_float_t  GLclampf;
- typedef khronos_int32_t  GLfixed;
-+typedef char             GLchar;
- 
- /* GL types for handling large vertex buffer objects */
- typedef khronos_intptr_t GLintptr;
--- 
-1.9.0
-
diff --git a/package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch b/package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch
deleted file mode 100644
index 1c8f7ee21b..0000000000
--- a/package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-linking of test app needs libUMP
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-diff --git a/test/Makefile b/test/Makefile
-index 700416e..92085cb 100644
---- a/test/Makefile
-+++ b/test/Makefile
-@@ -5,7 +5,7 @@
- all: test
- 
- test: ../config.mk test.c
--	$(CC) $(CFLAGS) -o $@ test.c -lEGL -lGLESv2
-+	$(CC) $(CFLAGS) -o $@ test.c -lEGL -lGLESv2 -lUMP
- 
- clean:
- 	rm -f test
-
diff --git a/package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch b/package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch
deleted file mode 100644
index 62e1b17829..0000000000
--- a/package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 5bf4d4f9c759fdb3c0db61a781042223236169c6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 5 Jun 2017 12:40:16 +0200
-Subject: [PATCH] fix conflicting data types between GLES2/gl2.h and GLES/gl.h
-
-When OpenGL ES 1.1 and OpenGL ES 2.0 are used at the same time, the
-build fail since GLintptr and GLsizeiptr data type are not the same in
-GLES2/gl2.h and GLES/gl.h.
-
-Also sync the data type of GLbyte, GLubyte, GLfloat, GLclampf and
-GLfixed.
-
-Fixes:
-http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- include/GLES/gl.h | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/include/GLES/gl.h b/include/GLES/gl.h
-index a6bb591..799408b 100644
---- a/include/GLES/gl.h
-+++ b/include/GLES/gl.h
-@@ -18,22 +18,21 @@ typedef void             GLvoid;
- typedef unsigned int     GLenum;
- typedef unsigned char    GLboolean;
- typedef unsigned int     GLbitfield;
--typedef signed char		   GLbyte;
-+typedef khronos_int8_t   GLbyte;
- typedef short            GLshort;
- typedef int              GLint;
- typedef int              GLsizei;
--typedef unsigned char			GLubyte;
-+typedef khronos_uint8_t  GLubyte;
- typedef unsigned short   GLushort;
- typedef unsigned int     GLuint;
--typedef float  GLfloat;
--typedef float  GLclampf;
--typedef signed int  GLfixed;
-+typedef khronos_float_t  GLfloat;
-+typedef khronos_float_t  GLclampf;
-+typedef khronos_int32_t  GLfixed;
- typedef signed int  GLclampx;
- typedef char GLchar;
- 
--typedef int * GLintptr;
--typedef int *  GLsizeiptr;
--
-+typedef khronos_intptr_t GLintptr;
-+typedef khronos_ssize_t  GLsizeiptr;
- 
- /*************************************************************/
- 
--- 
-2.9.4
-
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
deleted file mode 100644
index 554ee6845c..0000000000
--- a/package/sunxi-mali/Config.in
+++ /dev/null
@@ -1,59 +0,0 @@
-config BR2_PACKAGE_SUNXI_MALI
-	bool "sunxi-mali"
-	depends on BR2_arm
-	# libump package only provide libUMP.so.3 which is used by
-	# libMali for r3p0 and r3p1 Mali kernel module. This version
-	# is only available for ARM EABIhf.
-	# libMali for r2p4 Mali kernel module (available for ARM EABI)
-	# requires libUMP.so.2.
-	depends on BR2_ARM_EABIHF # libUMP.so.3 only
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_LIBUMP
-	help
-	  Install the ARM Mali drivers for sunxi based systems (i.e
-	  systems based on ARM Allwinner SoCs). This driver requires
-	  either the sunxi-kernel with the ARM Mali driver enabled or
-	  the installation of the ARM Mali drivers as an external
-	  module.
-
-	  http://github.com/linux-sunxi/sunxi-mali
-
-if BR2_PACKAGE_SUNXI_MALI
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "sunxi-mali"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "sunxi-mali"
-
-config BR2_PACKAGE_SUNXI_MALI_DBG
-	bool "install malitest and maliver tools"
-	help
-	  Install 3D triangle demo malitest application and the
-	  maliver application which describes the kernel module
-	  version.
-
-choice
-	prompt "Version"
-	default BR2_PACKAGE_SUNXI_MALI_R3P0
-	help
-	  Select the version of the kernel module. For the
-	  sunxi-kernel, the appropriate version number is r3p0. For
-	  other kernels, use the maliver application to determine the
-	  appropriate version.
-
-config BR2_PACKAGE_SUNXI_MALI_R3P0
-	bool "r3p0"
-
-config BR2_PACKAGE_SUNXI_MALI_R3P1
-	bool "r3p1"
-
-endchoice
-
-endif
-
-comment "sunxi-mali needs an EABIhf glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali/S80mali b/package/sunxi-mali/S80mali
deleted file mode 100644
index ecfbab97b4..0000000000
--- a/package/sunxi-mali/S80mali
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh -e
-
-install_driver() {
-	DRIVER=$1
-	OPTS=$2
-
-	modprobe $DRIVER $OPTS
-	maj=$(awk "\$2==\"${DRIVER}\" { print \$1; }" /proc/devices)
-
-	rm -f /dev/${DRIVER}
-
-	mknod /dev/${DRIVER} c $maj 0
-	chmod 600 /dev/${DRIVER}
-}
-
-start() {
-	echo "mali: starting driver"
-
-	BITSPERPIXEL="$(fbset | awk '/geom/ {print $6}')"
-	YRES="$(fbset | awk '/geom/ {print $3}')"
-	# Set RGBA ordering to something the drivers like
-	if [ "$BITSPERPIXEL" = "32" ] ; then
-		fbset -rgba 8/16,8/8,8/0,8/24
-	fi
-	# Try to enable triple buffering when there's enough VRAM
-	fbset -vyres $(( YRES*3 ))
-
-	install_driver mali
-	install_driver ump
-}
-
-stop() {
-	echo "mali: stopping driver"
-
-	rmmod ump
-	rmmod mali
-}
-
-case "$1" in
-start)
-	start
-;;
-stop)
-	stop
-;;
-restart)
-	stop
-	start
-;;
-*)
-	echo "mali: Please use start, stop, or restart."
-	exit 1
-;;
-esac
diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
deleted file mode 100644
index 2823209a72..0000000000
--- a/package/sunxi-mali/egl.pc
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=/usr/
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: egl
-Description: ARM Mali implementation of EGL
-Version: 1.4
-Requires:
-Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
-Cflags: -I${includedir}
-
diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
deleted file mode 100644
index 4702d1394c..0000000000
--- a/package/sunxi-mali/glesv2.pc
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: glesv2
-Description: ARM Mali implementation of OpenGL ESv2
-Version: 2.0
-Requires:
-Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
-Cflags: -I${includedir}
-
diff --git a/package/sunxi-mali/sunxi-mali.hash b/package/sunxi-mali/sunxi-mali.hash
deleted file mode 100644
index 31b5990de3..0000000000
--- a/package/sunxi-mali/sunxi-mali.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 c5f58b2c0533a74f491634ddbd80d888781f4ea29ecc5c24bd7300c02bef1145  sunxi-mali-d343311efc8db166d8371b28494f0f27b6a5872.tar.gz
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
deleted file mode 100644
index 90b580f5f6..0000000000
--- a/package/sunxi-mali/sunxi-mali.mk
+++ /dev/null
@@ -1,73 +0,0 @@
-################################################################################
-#
-# sunxi-mali
-#
-################################################################################
-
-# last sha1 character dropped to ensure unique filename
-SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a5872
-SUNXI_MALI_SITE = https://github.com/linux-sunxi/sunxi-mali
-SUNXI_MALI_SITE_METHOD = git
-
-# Get the sunxi-mali-proprietary libraries
-SUNXI_MALI_GIT_SUBMODULES = YES
-
-SUNXI_MALI_INSTALL_STAGING = YES
-SUNXI_MALI_DEPENDENCIES = libump
-SUNXI_MALI_PROVIDES = libegl libgles
-
-# The options below must be provided in the environment.  Providing these
-# through options overrides the value and prevents the makefiles from
-# appending to these variables.  This is used throughout the sunxi-mali build
-# system.
-#
-# Furthermore, the -lm -dl -lpthread options are included due to a possible bug
-# in the way the linaro 2013.06 toolchain handles shared libraries.
-SUNXI_MALI_MAKE_ENV = \
-	CC="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS) -lm -ldl -lpthread" \
-	$(TARGET_MAKE_ENV)
-
-SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer \
-	ABI=armhf
-
-ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
-SUNXI_MALI_MAKE_OPTS += VERSION=r3p0
-endif
-ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P1),y)
-SUNXI_MALI_MAKE_OPTS += VERSION=r3p1
-endif
-
-define SUNXI_MALI_BUILD_CMDS
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
-	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
-		$(@D)/version/version.c
-endef
-
-define SUNXI_MALI_INSTALL_STAGING_CMDS
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-	# test must be built after install because it depends on headers that are
-	# generated during the install above.
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) test
-	$(INSTALL) -D -m 0644 package/sunxi-mali/egl.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-	$(INSTALL) -D -m 0644 package/sunxi-mali/glesv2.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
-endef
-
-define SUNXI_MALI_INSTALL_TARGET_CMDS
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
-		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-	$(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
-		$(INSTALL) -m 755 $(@D)/version/version $(TARGET_DIR)/usr/bin/maliver; \
-		$(INSTALL) -m 755 $(@D)/test/test $(TARGET_DIR)/usr/bin/malitest
-	)
-endef
-
-define SUNXI_MALI_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/sunxi-mali/S80mali \
-		$(TARGET_DIR)/etc/init.d/S80mali
-endef
-
-$(eval $(generic-package))
