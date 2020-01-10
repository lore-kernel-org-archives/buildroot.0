From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Jan 2020 19:26:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: fix static build with
 readline
Message-ID: <20200110182634.3887115-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/88609eefe55af2ca50d43e17d3424b923528b07a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....txt-use-pkg-config-to-find-readline.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/fluidsynth/0001-CMakeLists.txt-use-pkg-config-to-find-readline.patch

diff --git a/package/fluidsynth/0001-CMakeLists.txt-use-pkg-config-to-find-readline.patch b/package/fluidsynth/0001-CMakeLists.txt-use-pkg-config-to-find-readline.patch
new file mode 100644
index 0000000000..2b685e4aad
--- /dev/null
+++ b/package/fluidsynth/0001-CMakeLists.txt-use-pkg-config-to-find-readline.patch
@@ -0,0 +1,49 @@
+From c538c9fa7e392ce16c3354696e7dc7781a78a300 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 10 Jan 2020 08:49:51 +0100
+Subject: [PATCH] CMakeLists.txt: use pkg-config to find readline
+
+Use pkg_check_modules to find readline dependencies such as ncurses and
+fallback on current mechanism.
+
+This will fix the following build failure when building statically:
+
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libreadline.a(display.o): in function `cr':
+display.c:(.text+0x1a0): undefined reference to `tputs'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/88609eefe55af2ca50d43e17d3424b923528b07a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/FluidSynth/fluidsynth/pull/606] 
+---
+ CMakeLists.txt | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d4956b1..3747faa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -629,12 +629,15 @@ endif ( enable-oboe )
+ unset ( WITH_READLINE CACHE )
+ unset ( READLINE_LIBS CACHE )
+ if ( enable-readline )
+-  find_package ( Readline )
+-  set ( FOUND_READLINE ${HAVE_READLINE} )
+-  if ( HAVE_READLINE )
++  pkg_check_modules ( READLINE readline )
++  if ( NOT READLINE_FOUND )
++    find_package ( Readline )
++    set ( READLINE_FOUND ${HAVE_READLINE} )
++  endif ( NOT READLINE_FOUND )
++  if ( READLINE_FOUND )
+     set ( WITH_READLINE 1 )
+     set ( READLINE_LIBS ${READLINE_LIBRARIES} )
+-  endif ( HAVE_READLINE )
++  endif ( READLINE_FOUND )
+ endif ( enable-readline )
+ 
+ unset ( ENABLE_MIXER_THREADS CACHE )
+-- 
+2.24.1
+
-- 
2.24.1
