From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 20:45:21 +0200
Subject: [Buildroot] [git commit] mesa3d: bump version
Message-ID: <20120922194143.4897F9963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec86b56daf9f4dc157c5b2c383b0eefb45eccd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Allan W. Nielsen. uClibc patch based on patch in OE.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch |   56 +++++++++++++++++++++++
 package/x11r7/mesa3d/mesa3d.mk                  |    3 +-
 2 files changed, 58 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch b/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
new file mode 100644
index 0000000..99afe8d
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
@@ -0,0 +1,56 @@
+[PATCH] Fix compilation on uClibc without locale support
+
+Based on similar patch from OE:
+
+http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch?id=e4039eb74b20e96d4b8837cd58cf2d13d091e1ad
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac            |    3 +++
+ src/glsl/strtod.c       |    2 +-
+ src/mesa/main/imports.c |    2 +-
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fbaa376..454dad2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -450,6 +450,9 @@ AC_SUBST([DLOPEN_LIBS])
+ dnl See if posix_memalign is available
+ AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
+ 
++dnl See if newlocale is available
++AC_CHECK_FUNCS_ONCE(newlocale)
++
+ dnl SELinux awareness.
+ AC_ARG_ENABLE([selinux],
+     [AS_HELP_STRING([--enable-selinux],
+diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
+index a876e13..9fce7e9 100644
+--- a/src/glsl/strtod.c
++++ b/src/glsl/strtod.c
+@@ -44,7 +44,7 @@ double
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
+index d3727ef..363bf32 100644
+--- a/src/mesa/main/imports.c
++++ b/src/mesa/main/imports.c
+@@ -757,7 +757,7 @@ float
+ float
+ _mesa_strtof( const char *s, char **end )
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+-- 
+1.7.10.4
+
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index c52baa3..3c2635e 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-MESA3D_VERSION = 7.6.1
+MESA3D_VERSION = 7.10.1
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+MESA3D_AUTORECONF = YES
 MESA3D_INSTALL_STAGING = YES
 
 MESA3D_CONF_OPT = \
