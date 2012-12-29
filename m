From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 03:45:50 +0200
Subject: [Buildroot] [PATCH 2/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356745553-15362-3-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated and renamed version of mesa3d-uclibc-locale.patch for Mesa 8.0.5
URL: http://git.openembedded.org/openembedded-core/plain/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 .../mesa3d/mesa3d-0001-Compile-with-uclibc.patch   |   52 ++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch

diff --git a/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch b/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
new file mode 100644
index 0000000..d39270a
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
@@ -0,0 +1,52 @@
+Compile with uclibc
+
+Upstream-Status: Pending
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
+@@ -543,6 +543,9 @@ AC_SUBST([DLOPEN_LIBS])
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
+@@ -45,7 +45,7 @@ double
+ glsl_strtod(const char *s, char **end)
+ {
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-   !defined(__HAIKU__)
++   !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
+index d3727ef..363bf32 100644
+--- a/src/mesa/main/imports.c
++++ b/src/mesa/main/imports.c
+@@ -767,7 +767,7 @@ float
+ _mesa_strtof( const char *s, char **end )
+ {
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-   !defined(ANDROID) && !defined(__HAIKU__)
++   !defined(ANDROID) && !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+-- 
+1.7.10.4
+
-- 
1.7.7.6
