From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 20:22:24 +0200
Subject: [Buildroot] [PATCH v2] mesa3d: bumped to 8.0.5
In-Reply-To: <1356805344-1060-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356805344-1060-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356805344-1060-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 ...patch => mesa3d-0001-Compile-with-uclibc.patch} |   27 ++++++++--------
 package/x11r7/mesa3d/mesa3d-execinfo.patch         |   26 +++++++++++++++
 package/x11r7/mesa3d/mesa3d.mk                     |   33 ++++++++++++++++---
 3 files changed, 66 insertions(+), 20 deletions(-)
 rename package/x11r7/mesa3d/{mesa3d-uclibc-locale.patch => mesa3d-0001-Compile-with-uclibc.patch} (59%)
 create mode 100644 package/x11r7/mesa3d/mesa3d-execinfo.patch

diff --git a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch b/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
similarity index 59%
rename from package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
rename to package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
index 99afe8d..1d474ca 100644
--- a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
+++ b/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
@@ -1,10 +1,9 @@
-[PATCH] Fix compilation on uClibc without locale support
+Compile with uclibc
 
-Based on similar patch from OE:
+Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
 
-http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch?id=e4039eb74b20e96d4b8837cd58cf2d13d091e1ad
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Upstream-Status: Pending
+URL: http://git.openembedded.org/openembedded-core/plain/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 ---
  configure.ac            |    3 +++
  src/glsl/strtod.c       |    2 +-
@@ -15,7 +14,7 @@ diff --git a/configure.ac b/configure.ac
 index fbaa376..454dad2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -450,6 +450,9 @@ AC_SUBST([DLOPEN_LIBS])
+@@ -543,6 +543,9 @@ AC_SUBST([DLOPEN_LIBS])
  dnl See if posix_memalign is available
  AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
  
@@ -29,12 +28,12 @@ diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
 index a876e13..9fce7e9 100644
 --- a/src/glsl/strtod.c
 +++ b/src/glsl/strtod.c
-@@ -44,7 +44,7 @@ double
- double
+@@ -45,7 +45,7 @@ double
  glsl_strtod(const char *s, char **end)
  {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-   !defined(__HAIKU__)
++   !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
     static locale_t loc = NULL;
     if (!loc) {
        loc = newlocale(LC_CTYPE_MASK, "C", NULL);
@@ -42,12 +41,12 @@ diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
 index d3727ef..363bf32 100644
 --- a/src/mesa/main/imports.c
 +++ b/src/mesa/main/imports.c
-@@ -757,7 +757,7 @@ float
- float
+@@ -767,7 +767,7 @@ float
  _mesa_strtof( const char *s, char **end )
  {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-   !defined(ANDROID) && !defined(__HAIKU__)
++   !defined(ANDROID) && !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
     static locale_t loc = NULL;
     if (!loc) {
        loc = newlocale(LC_CTYPE_MASK, "C", NULL);
diff --git a/package/x11r7/mesa3d/mesa3d-execinfo.patch b/package/x11r7/mesa3d/mesa3d-execinfo.patch
new file mode 100644
index 0000000..9a5bfe9
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-execinfo.patch
@@ -0,0 +1,26 @@
+uClibc does not have execinfo.h
+So we skip it's use here.
+
+Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
+
+diff -Naur mesa3d-8.0.5.org/src/gallium/auxiliary/util/u_debug_symbol.c mesa3d-8.0.5/src/gallium/auxiliary/util/u_debug_symbol.c
+--- mesa3d-8.0.5.org/src/gallium/auxiliary/util/u_debug_symbol.c	2012-12-29 00:23:42.597893058 +0200
++++ mesa3d-8.0.5/src/gallium/auxiliary/util/u_debug_symbol.c	2012-12-29 00:26:08.639454184 +0200
+@@ -151,7 +151,7 @@
+ }
+ #endif
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ #include <execinfo.h>
+ 
+ /* This can only provide dynamic symbols, or binary offsets into a file.
+@@ -177,7 +177,7 @@
+       return;
+ #endif
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+    debug_symbol_name_glibc(addr, buf, size);
+    if(buf[0])
+       return;
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index b16d5e6..0285a43 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -4,21 +4,26 @@
 #
 #############################################################
 
-MESA3D_VERSION = 7.10.1
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
+MESA3D_VERSION = 8.0.5
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_AUTORECONF = YES
 MESA3D_INSTALL_STAGING = YES
+MESA3D_LICENSE = MIT (most of the code) and SGI-B-2.0 (rest of the GLES/GL code)
+MESA3D_LICENSE_FILES = doc/license.html include/GL/glu.h
+
 
 MESA3D_CONF_OPT = \
 	--disable-egl \
 	--disable-glu \
-	--disable-glw \
-	--disable-glut \
-	--disable-gallium \
+	--disable-selinux \
+	--disable-gallium-llvm \
+	--disable-gallium-egl \
+	--disable-gallium-gbm \
 	--with-driver=dri \
 	--with-dri-drivers=swrast \
-	--disable-static
+	--disable-static \
+	--with-gallium-drivers=swrast
 
 MESA3D_DEPENDENCIES = \
 	xproto_glproto \
@@ -32,4 +37,20 @@ MESA3D_DEPENDENCIES = \
 	host-libxml2 \
 	host-python
 
+# Build host "builtin_compiler" that is needed by
+# build process, install it and then do cleanup before
+# starting the actual building.
+# Additionally, we will make certain that the 
+# $(HOST_DIR)/usr/bin/builtin_compiler will be used
+# in actual building process.
+
+define	MESA3D_POST_CONFIGURE_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS)  -C $(@D)/src/glsl builtin_compiler
+	$(INSTALL) $(@D)/src/glsl/builtin_compiler  -m 755 $(HOST_DIR)/usr/bin
+	$(MAKE) -C $(@D) clean
+	sed -e "s#\.\/builtin_compiler#$(HOST_DIR)/usr/bin/builtin_compiler#g" -i $(@D)/src/glsl/Makefile
+endef
+
+MESA3D_POST_CONFIGURE_HOOKS += MESA3D_POST_CONFIGURE_CMDS
+
 $(eval $(autotools-package))
-- 
1.7.7.6
