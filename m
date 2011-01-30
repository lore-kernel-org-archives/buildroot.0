From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 11:05:50 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-config: rework
	--with-sysroot patch so it doesn't break target build
Message-ID: <20110130100955.79B298D1F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=02d605cd556107d9e1a4f0c9ae9ee3403fd1a170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't currently autoreconf pkg-config for the target as we don't need
--with-sysroot support, which means PKG_CONFIG_SYSROOT=NULL wasn't
passed, breaking the build.

Fix it by reworking the patch to only pass this if --with-sysroot is given,
and handle the not set case in main.c.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pkg-config-0.25-add-with-sysroot.patch         |   32 ++++++++++++-------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch b/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
index 0fdcd25..e8431ed 100644
--- a/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
+++ b/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
@@ -6,28 +6,29 @@ The environment variable overrides this default setting if set.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
- Makefile.am  |    6 ++++++
+ Makefile.am  |    6 +++++-
  configure.in |    6 ++++++
- main.c       |    5 +++--
- 3 files changed, 15 insertions(+), 2 deletions(-)
+ main.c       |    9 +++++++--
+ 3 files changed, 18 insertions(+), 3 deletions(-)
 
 Index: pkg-config-0.25/Makefile.am
 ===================================================================
 --- pkg-config-0.25.orig/Makefile.am
 +++ pkg-config-0.25/Makefile.am
-@@ -31,6 +31,12 @@ AM_CFLAGS=@WARN_CFLAGS@
- INCLUDES=-DPKG_CONFIG_PC_PATH="\"$(pc_path)\"" $(included_glib_includes) \
- 	$(popt_includes)
+@@ -28,8 +28,12 @@ EXTRA_DIST = $(m4_DATA) $(man_MANS) READ
+ bin_PROGRAMS = pkg-config
+ AM_CFLAGS=@WARN_CFLAGS@
  
 +if USE_SYSROOT
-+INCLUDES += -DPKG_CONFIG_SYSROOT="\"$(sysroot)\""
-+else
-+INCLUDES += -DPKG_CONFIG_SYSROOT=NULL
++sysroot_includes = -DPKG_CONFIG_SYSROOT="\"$(sysroot)\""
 +endif
 +
+ INCLUDES=-DPKG_CONFIG_PC_PATH="\"$(pc_path)\"" $(included_glib_includes) \
+-	$(popt_includes)
++	$(popt_includes) $(sysroot_includes)
+ 
  pkg_config_SOURCES= \
  	pkg.h \
- 	pkg.c \
 Index: pkg-config-0.25/configure.in
 ===================================================================
 --- pkg-config-0.25.orig/configure.in
@@ -49,7 +50,14 @@ Index: pkg-config-0.25/main.c
 ===================================================================
 --- pkg-config-0.25.orig/main.c
 +++ pkg-config-0.25/main.c
-@@ -39,7 +39,7 @@
+@@ -36,10 +36,14 @@
+ #undef STRICT
+ #endif
+ 
++#ifndef PKG_CONFIG_SYSROOT
++#define PKG_CONFIG_SYSROOT NULL
++#endif
++
  static int want_debug_spew = 0;
  static int want_verbose_errors = 0;
  static int want_stdout_errors = 0;
@@ -58,7 +66,7 @@ Index: pkg-config-0.25/main.c
  
  void
  debug_spew (const char *format, ...)
-@@ -311,7 +311,8 @@ main (int argc, char **argv)
+@@ -311,7 +315,8 @@ main (int argc, char **argv)
        add_search_dirs(PKG_CONFIG_PC_PATH, G_SEARCHPATH_SEPARATOR_S);
      }
  
-- 
1.7.3.4
