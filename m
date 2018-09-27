From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 23:21:09 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] sdl2: add upstream patch
 to fix DirectFB renderer handling
Message-ID: <20180927212035.A2348890D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a24cc1cce7ecdac39cdbab650495494f133e56ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The configure script enables the DirectFB video driver, but forgets to
enable the renderer driver, causing SDL_CreateRenderer() to fail. Add an upstream patch to fix this.

[Peter: reword/extend commit text,
	add git formatted patch from https://github.com/spurious/SDL-mirror]
Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit d1144944565f0a852cddbb1dd6f8f012c304dc0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...irectFB-renderer-not-being-enabled-in-aut.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/sdl2/0001-Fixed-the-DirectFB-renderer-not-being-enabled-in-aut.patch b/package/sdl2/0001-Fixed-the-DirectFB-renderer-not-being-enabled-in-aut.patch
new file mode 100644
index 0000000000..53926c03b5
--- /dev/null
+++ b/package/sdl2/0001-Fixed-the-DirectFB-renderer-not-being-enabled-in-aut.patch
@@ -0,0 +1,42 @@
+From a0acea5bcce3f47badbfeeab7bc2e36eba08fd84 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Mon, 27 Aug 2018 11:51:05 -0700
+Subject: [PATCH] Fixed the DirectFB renderer not being enabled in autoconf
+ builds
+
+Upstream-url: https://hg.libsdl.org/SDL/raw-rev/751cdc74d55c
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure    | 3 +++
+ configure.in | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/configure b/configure
+index e88b38001..40ac14d21 100755
+--- a/configure
++++ b/configure
+@@ -21501,6 +21501,9 @@ fi
+ 
+ $as_echo "#define SDL_VIDEO_DRIVER_DIRECTFB 1" >>confdefs.h
+ 
++
++$as_echo "#define SDL_VIDEO_RENDER_DIRECTFB 1" >>confdefs.h
++
+             SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
+             EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
+ 
+diff --git a/configure.in b/configure.in
+index 5bf5d717b..ce1d57ea1 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2163,6 +2163,7 @@ AC_HELP_STRING([--enable-directfb-shared], [dynamically load directfb support [[
+                               , enable_directfb_shared=yes)
+ 
+             AC_DEFINE(SDL_VIDEO_DRIVER_DIRECTFB, 1, [ ])
++            AC_DEFINE(SDL_VIDEO_RENDER_DIRECTFB, 1, [ ])
+             SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
+             EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
+ 
+-- 
+2.11.0
+
