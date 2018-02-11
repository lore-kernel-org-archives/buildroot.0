From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Feb 2018 17:21:35 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/waffle: new package
In-Reply-To: <20180211162136.15605-1-romain.naour@gmail.com>
References: <20180211162136.15605-1-romain.naour@gmail.com>
Message-ID: <20180211162136.15605-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport an upstream patch fixing a build issue with musl toolchains.
Add a new patch fixing build with Wayand without X11.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: select xlib_libX11 if X11 (ThomasP)
    add OpenGL ES runtime dependency (ThomasP)
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 ++++++++++++++++++++++
 ...rd-cflags-from-.pc-files-to-waffle-cflags.patch | 40 ++++++++++++++++
 package/waffle/Config.in                           | 35 ++++++++++++++
 package/waffle/waffle.hash                         |  3 ++
 package/waffle/waffle.mk                           | 48 +++++++++++++++++++
 7 files changed, 182 insertions(+)
 create mode 100644 package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
 create mode 100644 package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
 create mode 100644 package/waffle/Config.in
 create mode 100644 package/waffle/waffle.hash
 create mode 100644 package/waffle/waffle.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 293bd73797..0e19f6a94e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1519,6 +1519,7 @@ F:	package/supertux/
 F:	package/supertuxkart/
 F:	package/terminology/
 F:	package/upower/
+F:	package/waffle/
 F:	package/xenomai/
 
 N:	Romain Perier <romain.perier@free-electrons.com>
diff --git a/package/Config.in b/package/Config.in
index 19dda8aad9..0622ec49b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1167,6 +1167,7 @@ menu "Graphics"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
+	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
 	source "package/waylandpp/Config.in"
diff --git a/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch b/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
new file mode 100644
index 0000000000..ef54953e34
--- /dev/null
+++ b/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
@@ -0,0 +1,54 @@
+From 117456752cf9ac1f24d3cfd917ad34f670c244b8 Mon Sep 17 00:00:00 2001
+From: Emil Velikov <emil.l.velikov@gmail.com>
+Date: Thu, 19 Mar 2015 22:26:11 +0000
+Subject: [PATCH] third_party/threads: Use PTHREAD_MUTEX_RECURSIVE by default
+
+PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
+Although due to the_GNU_SOURCES define the portable,
+PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
+1998. Simplify things giving us compatibility with musl which
+apparently does not provide the non-portable define.
+
+Inspired by almost identical commit in mesa aead7fe2e2b(c11/threads: Use
+PTHREAD_MUTEX_RECURSIVE by default) by Felix Janda.
+
+Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
+Reviewed-by: Chad Versace <chad.versace@intel.com>
+(Romain: cherry picked from commit 3b9b8f5f6d1b99af43e95ec0868404e552a85b73)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ third_party/threads/threads_posix.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
+index 5835e43..e122bf9 100644
+--- a/third_party/threads/threads_posix.c
++++ b/third_party/threads/threads_posix.c
+@@ -26,6 +26,9 @@
+  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+  * DEALINGS IN THE SOFTWARE.
+  */
++
++#define _GNU_SOURCE
++
+ #include <stdlib.h>
+ #ifndef assert
+ #include <assert.h>
+@@ -150,13 +153,8 @@ int mtx_init(mtx_t *mtx, int type)
+       && type != (mtx_try|mtx_recursive))
+         return thrd_error;
+     pthread_mutexattr_init(&attr);
+-    if ((type & mtx_recursive) != 0) {
+-#if defined(__linux__) || defined(__linux)
+-        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
+-#else
++    if ((type & mtx_recursive) != 0)
+         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
+-#endif
+-    }
+     pthread_mutex_init(mtx, &attr);
+     pthread_mutexattr_destroy(&attr);
+     return thrd_success;
+-- 
+2.14.3
+
diff --git a/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
new file mode 100644
index 0000000000..ffc1b5b8b1
--- /dev/null
+++ b/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
@@ -0,0 +1,40 @@
+From 8b0ae49c8bea78df73c3ecae0059d54a95c561fa Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 24 Dec 2017 00:11:45 +0100
+Subject: [PATCH] cmake: forward cflags from *.pc files to waffle cflags
+
+When building mesa egl without x11 and gles2 the headers need a
+MESA_EGL_NO_X11_HEADERS define to avoid including X11 headers.
+
+This define MESA_EGL_NO_X11_HEADERS  is lost while building waffle
+since CGLAGS defined by pc files are not used.
+
+MESA_EGL_NO_X11_HEADERS is defined in CFLAGS from egl.pc.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/waffle/CMakeLists.txt | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
+index d76e029..2ff72c8 100644
+--- a/src/waffle/CMakeLists.txt
++++ b/src/waffle/CMakeLists.txt
+@@ -5,6 +5,14 @@
+ add_definitions(
+     -DWAFFLE_API_VERSION=${waffle_api_version}
+     -DWAFFLE_API_EXPERIMENTAL
++    ${egl_CFLAGS}
++    ${gbm_CFLAGS}
++    ${gl_CFLAGS}
++    ${GLEXT_CFLAGS}
++    ${libudev_CFLAGS}
++    ${wayland-client_CFLAGS}
++    ${wayland-egl_CFLAGS}
++    ${x11-xcb_CFLAGS}
+     )
+ 
+ include_directories(
+-- 
+2.14.3
+
diff --git a/package/waffle/Config.in b/package/waffle/Config.in
new file mode 100644
index 0000000000..ed30724214
--- /dev/null
+++ b/package/waffle/Config.in
@@ -0,0 +1,35 @@
+comment "waffle needs an OpenGL GL or EGL provider w/ an OpenGL ES provider"
+	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_WAFFLE
+	bool "waffle"
+	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL
+	# OpenGL ES (1,2,3) libraries are loaded at runtime when needed
+	# in addition to LIBGL or LIBEGL.
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	help
+	  Waffle is a cross-platform library that allows one to defer
+	  selection of an OpenGL API and of window system until
+	  runtime. For example, on Linux, Waffle enables an application
+	  to select X11/EGL with an OpenGL 3.3 core profile, Wayland
+	  with OpenGL ES2, and other window system / API combinations.
+
+	  Waffle's immediate goal is to enable Piglit [1] to test
+	  multiple OpenGL flavors in a cross-platform way, and to allow
+	  each Piglit test to choose its OpenGL API and window system
+	  at runtime. A future goal is to enable the ability to record
+	  (with another tool such APITrace [2]) an application's OpenGL
+	  calls on one operating system or window system, and then
+	  replay that trace on a different system.
+
+	  For more information, visit to Waffle's website.
+
+	  [1] http://piglit.freedesktop.org
+	  [2] http://github.com/apitrace/apitrace#readme
+
+	  http://www.waffle-gl.org
diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
new file mode 100644
index 0000000000..5dfb976f2f
--- /dev/null
+++ b/package/waffle/waffle.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-v1.5.2.tar.gz
+sha256 630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
new file mode 100644
index 0000000000..741bc8e349
--- /dev/null
+++ b/package/waffle/waffle.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# waffle
+#
+################################################################################
+
+WAFFLE_VERSION = v1.5.2
+WAFFLE_SITE = $(call github,waffle-gl,waffle,$(WAFFLE_VERSION))
+WAFFLE_INSTALL_STAGING = YES
+WAFFLE_LICENSE = BSD-2-Clause
+WAFFLE_LICENSE_FILES = LICENSE.txt
+
+WAFFLE_DEPENDENCIES = host-pkgconf
+
+WAFFLE_CONF_OPTS = -Dwaffle_build_tests=OFF \
+	-Dwaffle_build_examples=OFF \
+	-Dwaffle_build_manpages=OFF \
+	-Dwaffle_build_htmldocs=OFF
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),yy)
+WAFFLE_DEPENDENCIES += libegl wayland
+WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=ON
+else
+WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_HAS_LIBEGL),yyy)
+WAFFLE_DEPENDENCIES += libegl libxcb xlib_libX11
+WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=ON
+else
+WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_HAS_LIBGL),yyy)
+WAFFLE_DEPENDENCIES += libgl libxcb xlib_libX11
+WAFFLE_CONF_OPTS += -Dwaffle_has_glx=ON
+else
+WAFFLE_CONF_OPTS += -Dwaffle_has_glx=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_HAS_UDEV),yy)
+WAFFLE_DEPENDENCIES += libegl mesa3d udev
+WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=ON
+else
+WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.14.3
