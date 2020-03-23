From: Michael Fischer <mf@go-sys.de>
Date: Mon, 23 Mar 2020 15:41:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.0.12
Message-ID: <20200323144119.15975-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch 0001: already applied upstream
patch 0002: already applied upstream
Adjust license hash as the copyright year was changed

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...DL_threadprio.c-fix-build-without-th.patch | 35 ----------------
 .../sdl2/0002-fix-busy-loop-in-dlopen.patch   | 41 -------------------
 package/sdl2/sdl2.hash                        |  6 +--
 package/sdl2/sdl2.mk                          |  2 +-
 4 files changed, 4 insertions(+), 80 deletions(-)
 delete mode 100644 package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch
 delete mode 100644 package/sdl2/0002-fix-busy-loop-in-dlopen.patch

diff --git a/package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch b/package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch
deleted file mode 100644
index 1165edc661..0000000000
--- a/package/sdl2/0001-src-core-linux-SDL_threadprio.c-fix-build-without-th.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cb51ec369186628e016a10ccf25b2b26d5d2ef85 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Feb 2020 21:31:36 +0100
-Subject: [PATCH] src/core/linux/SDL_threadprio.c: fix build without threads
-
-Add an include on SDL_error.h to avoid the following build failure
-without threads:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: build/.libs/SDL_threadprio.o: in function `SDL_LinuxSetThreadPriority_REAL':
-SDL_threadprio.c:(.text+0x0): undefined reference to `SDL_Unsupported'
-
-Fixes:
- - http://autobuild.buildroot.org/results/7f7712c5bd47de4a3fcec1e0d0526fd5a3ecd532
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugzilla.libsdl.org/show_bug.cgi?id=4971]
----
- src/core/linux/SDL_threadprio.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/core/linux/SDL_threadprio.c b/src/core/linux/SDL_threadprio.c
-index 162b1a3f1..2cbc4cb48 100644
---- a/src/core/linux/SDL_threadprio.c
-+++ b/src/core/linux/SDL_threadprio.c
-@@ -22,6 +22,7 @@
- 
- #ifdef __LINUX__
- 
-+#include "SDL_error.h"
- #include "SDL_stdinc.h"
- 
- #if !SDL_THREADS_DISABLED
--- 
-2.24.1
-
diff --git a/package/sdl2/0002-fix-busy-loop-in-dlopen.patch b/package/sdl2/0002-fix-busy-loop-in-dlopen.patch
deleted file mode 100644
index e335f95b7e..0000000000
--- a/package/sdl2/0002-fix-busy-loop-in-dlopen.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-
-# HG changeset patch
-# User Paul Cercueil <paul@crapouillou.net>
-# Date 1576820863 28800
-# Node ID 4f5bef55183c677d12a7da8f3392879ed50670a3
-# Parent  01f16d7f36cb9f4fa02016e57fbe915fdea71cc8
-kmsdrm: Fix busy-loop within libc's dlopen()
-For some obscure reason, the order in which the libdrm/libgbm libraries
-are loaded matters.
-
-Without this fix, the first call to check_modesetting() will work and
-load then unload all symbols properly, but the second call to this
-function will lock up as soon as dlopen() is called on libdrm.
-
-Swapping the order in which the libdrm and libgbm libraries are loaded
-is enough to fix (or work around?) this issue.
-
-Fixes #4891:
-https://bugzilla.libsdl.org/show_bug.cgi?id=4891
-
-Upstream: https://hg.libsdl.org/SDL/rev/4f5bef55183c
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-[yann.morin.1998 at free.fr: add upstream commit URL]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-
-diff -r 01f16d7f36cb -r 4f5bef55183c src/video/kmsdrm/SDL_kmsdrmdyn.c
---- a/src/video/kmsdrm/SDL_kmsdrmdyn.c	Thu Dec 19 21:45:44 2019 -0800
-+++ b/src/video/kmsdrm/SDL_kmsdrmdyn.c	Thu Dec 19 21:47:43 2019 -0800
-@@ -50,8 +50,8 @@
- #endif
- 
- static kmsdrmdynlib kmsdrmlibs[] = {
--    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC},
--    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC_GBM}
-+    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC_GBM},
-+    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC}
- };
- 
- static void *
-
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 9e968e0af5..6fdcfc0065 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.10.tar.gz.sig
-sha256 b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57  SDL2-2.0.10.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.12.tar.gz.sig
+sha256 349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863  SDL2-2.0.12.tar.gz
 # Locally calculated
-sha256 a7c8d0b3167c502921192585a582eb8477ad9862330f4d8b9e4a8bb4c1a9d29e  COPYING.txt
+sha256 ae4df3759a726538607b84c00ab8f8a5567d9f38ad5397486eb9b5c5f626caef  COPYING.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index e39c51d4d9..501bb4699d 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.10
+SDL2_VERSION = 2.0.12
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.25.1
