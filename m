From: Dagg Stompler <daggs@gmx.com>
Date: Mon, 17 Apr 2017 09:56:54 +0300
Subject: [Buildroot] [PATCH 2/2] odroid-gl: reorganize structure
In-Reply-To: <20170417065654.28313-1-daggs@gmx.com>
References: <20170417065654.28313-1-daggs@gmx.com>
Message-ID: <20170417065654.28313-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - remove support for 32 bit libs as it is impossible to build a 32 bit odroid image.
 - reorganize structure to support other boards from odroid.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/odroid-gl/Config.in      | 13 +++++++++++--
 package/odroid-gl/odroid-gl.hash |  2 +-
 package/odroid-gl/odroid-gl.mk   | 20 ++++++++++++--------
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/package/odroid-gl/Config.in b/package/odroid-gl/Config.in
index 9c605f6de..72727f41e 100644
--- a/package/odroid-gl/Config.in
+++ b/package/odroid-gl/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_ODROID_GL
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	help
-	  Install the ARM Mali drivers for odroidc2 based systems.
+	  Install the ARM Mali drivers for odorid boards.
 
-	  https://github.com/mdrjr/c2_mali
+	  support list:
+	    c2: https://github.com/mdrjr/c2_mali
 
 if BR2_PACKAGE_ODROID_GL
 
@@ -18,6 +19,14 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "odroid-gl"
 
+choice
+	prompt "odroid board selection"
+
+	config BR2_PACKAGE_ODROID_GL_C2
+		bool "odroid c2 gl"
+
+endchoice
+
 endif
 
 config BR2_PACKAGE_ODROID_GL_X11
diff --git a/package/odroid-gl/odroid-gl.hash b/package/odroid-gl/odroid-gl.hash
index b71ebab13..456944651 100644
--- a/package/odroid-gl/odroid-gl.hash
+++ b/package/odroid-gl/odroid-gl.hash
@@ -1,2 +1,2 @@
 # Locally computed hash
-sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-mali-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
+sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-gl-c2-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
diff --git a/package/odroid-gl/odroid-gl.mk b/package/odroid-gl/odroid-gl.mk
index 0591497ca..40be77f01 100644
--- a/package/odroid-gl/odroid-gl.mk
+++ b/package/odroid-gl/odroid-gl.mk
@@ -4,8 +4,20 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_ODROID_GL_C2),y)
 ODROID_GL_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
 ODROID_GL_SITE = $(call github,mdrjr,c2_mali,$(ODROID_GL_VERSION))
+ODROID_GL_LIBS_SUBDIR = fbdev/mali_libs/
+ODROID_GL_PREFIX = c2
+ifeq ($(BR2_PACKAGE_ODROID_GL_X11),y)
+ODROID_GL_HEADERS_SUBDIR = x11/mali_headers/
+ODROID_GL_LIBS_SUBDIR = x11/mali_libs/
+else
+ODROID_GL_HEADERS_SUBDIR = fbdev/mali_headers/
+endif
+endif
+
+ODROID_GL_SOURCE := odroid-gl-$(ODROID_GL_PREFIX)-$(ODROID_GL_VERSION).tar.gz
 ODROID_GL_LICENSE = Hardkernel EULA
 ODROID_GL_LICENSE_FILES = README.md
 
@@ -13,8 +25,6 @@ ODROID_GL_INSTALL_STAGING = YES
 ODROID_GL_PROVIDES = libegl libgles
 
 ifeq ($(BR2_PACKAGE_ODROID_GL_X11),y)
-ODROID_GL_HEADERS_SUBDIR = x11/mali_headers/
-ODROID_GL_LIBS_SUBDIR = x11/mali_libs/
 # The X11 blobs are linked against those libraries, and the headers
 # include headers from those libraries
 ODROID_GL_DEPENDENCIES += \
@@ -25,12 +35,6 @@ define ODROID_GL_FIX_EGL_PC
 	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 endef
-ODROID_GL_HEADERS_SUBDIR = fbdev/mali_headers/
-ifeq ($(BR2_aarch64),y)
-ODROID_GL_LIBS_SUBDIR = fbdev/mali_libs/
-else
-ODROID_GL_LIBS_SUBDIR = fbdev/32bit_libs/
-endif
 endif
 
 define ODROID_GL_INSTALL_LIBS
-- 
2.12.2
