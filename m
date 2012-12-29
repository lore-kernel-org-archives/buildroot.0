From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 03:45:49 +0200
Subject: [Buildroot] [PATCH 1/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356745553-15362-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch |   56 -----------------------
 package/x11r7/mesa3d/mesa3d.mk                  |   34 +++++++++++---
 2 files changed, 28 insertions(+), 62 deletions(-)
 delete mode 100644 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch

diff --git a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch b/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
deleted file mode 100644
index 99afe8d..0000000
--- a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] Fix compilation on uClibc without locale support
-
-Based on similar patch from OE:
-
-http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch?id=e4039eb74b20e96d4b8837cd58cf2d13d091e1ad
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac            |    3 +++
- src/glsl/strtod.c       |    2 +-
- src/mesa/main/imports.c |    2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fbaa376..454dad2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -450,6 +450,9 @@ AC_SUBST([DLOPEN_LIBS])
- dnl See if posix_memalign is available
- AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
- 
-+dnl See if newlocale is available
-+AC_CHECK_FUNCS_ONCE(newlocale)
-+
- dnl SELinux awareness.
- AC_ARG_ENABLE([selinux],
-     [AS_HELP_STRING([--enable-selinux],
-diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
-index a876e13..9fce7e9 100644
---- a/src/glsl/strtod.c
-+++ b/src/glsl/strtod.c
-@@ -44,7 +44,7 @@ double
- double
- glsl_strtod(const char *s, char **end)
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
-index d3727ef..363bf32 100644
---- a/src/mesa/main/imports.c
-+++ b/src/mesa/main/imports.c
-@@ -757,7 +757,7 @@ float
- float
- _mesa_strtof( const char *s, char **end )
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
--- 
-1.7.10.4
-
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index b16d5e6..d676409 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-MESA3D_VERSION = 7.10.1
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
+MESA3D_VERSION = 8.0.5
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_AUTORECONF = YES
 MESA3D_INSTALL_STAGING = YES
@@ -13,12 +13,14 @@ MESA3D_INSTALL_STAGING = YES
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
@@ -32,4 +34,24 @@ MESA3D_DEPENDENCIES = \
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
+	$(MAKE) CC="$(HOSTCC)" CXX="$(HOSTCXX)" CFLAGS="$(HOST_CFLAGS)" CXXFLAGS="$(HOST_CXXFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"  -C $(@D)/src/glsl builtin_compiler
+	$(INSTALL) $(@D)/src/glsl/builtin_compiler  -m 755 $(HOST_DIR)/usr/bin
+	$(MAKE) -C $(@D) clean
+	sed -e "s#\.\/builtin_compiler#$(HOST_DIR)/usr/bin/builtin_compiler#g" -i $(@D)/src/glsl/Makefile
+endef
+
+MESA3D_POST_CONFIGURE_HOOKS += MESA3D_POST_CONFIGURE_CMDS
+
+define	MESA3D_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
 $(eval $(autotools-package))
-- 
1.7.7.6
