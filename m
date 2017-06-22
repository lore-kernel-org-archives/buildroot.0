From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Jun 2017 21:08:50 -0300
Subject: [Buildroot] [PATCH] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.3
Message-ID: <1498090130-10654-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0006 is no longer needed as the fix is already upstream. 
Confirmed that the colors are displayed correctly whe running the
Qt5CinematicDemo application on i.mx6.

Patch 0007 is already applied upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...ect-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch | 41 ----------------------
 package/mesa3d/0007-musl.patch                     | 35 ------------------
 package/mesa3d/mesa3d.hash                         | 10 +++---
 package/mesa3d/mesa3d.mk                           |  2 +-
 5 files changed, 7 insertions(+), 83 deletions(-)
 delete mode 100644 package/mesa3d/0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
 delete mode 100644 package/mesa3d/0007-musl.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 4254088..5e64905 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.2
+MESA3D_HEADERS_VERSION = 17.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch b/package/mesa3d/0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
deleted file mode 100644
index a78bd0e..0000000
--- a/package/mesa3d/0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ee18f89c49927f6696df2d557837acc9bfd71f71 Mon Sep 17 00:00:00 2001
-From: "Wladimir J. van der Laan" <laanwj@gmail.com>
-Date: Fri, 3 Feb 2017 09:30:53 +0000
-Subject: [PATCH 2/2] Revert "Subject: [PATCH] etnaviv: add RGBX/RGBA pixel
- formats"
-Organization: O.S. Systems Software LTDA.
-
-This reverts commit 89bb5c79e29613ad9a4e43d670654e98a220fc60.
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- src/gallium/drivers/etnaviv/etnaviv_format.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/src/gallium/drivers/etnaviv/etnaviv_format.c b/src/gallium/drivers/etnaviv/etnaviv_format.c
-index 0794603b2f..693558476b 100644
---- a/src/gallium/drivers/etnaviv/etnaviv_format.c
-+++ b/src/gallium/drivers/etnaviv/etnaviv_format.c
-@@ -141,8 +141,6 @@ static struct etna_format formats[PIPE_FORMAT_COUNT] = {
-    V_(R16G16_SSCALED, SHORT,          NONE),
-    V_(R16G16_FLOAT,   HALF_FLOAT,     NONE),
- 
--   V_(A8B8G8R8_UNORM,   UNSIGNED_BYTE, NONE),
--
-    V_(R8G8B8A8_UNORM,   UNSIGNED_BYTE, A8B8G8R8),
-    V_(R8G8B8A8_SNORM,   BYTE,          A8B8G8R8),
-    _T(R8G8B8X8_UNORM,   X8B8G8R8,      X8B8G8R8),
-@@ -151,9 +149,6 @@ static struct etna_format formats[PIPE_FORMAT_COUNT] = {
-    V_(R8G8B8A8_USCALED, UNSIGNED_BYTE, A8B8G8R8),
-    V_(R8G8B8A8_SSCALED, BYTE,          A8B8G8R8),
- 
--   _T(R8G8B8A8_UNORM, A8B8G8R8, A8B8G8R8),
--   _T(R8G8B8X8_UNORM, X8B8G8R8, X8B8G8R8),
--
-    _T(B8G8R8A8_UNORM, A8R8G8B8, A8R8G8B8),
-    _T(B8G8R8X8_UNORM, X8R8G8B8, X8R8G8B8),
- 
--- 
-2.12.0
-
diff --git a/package/mesa3d/0007-musl.patch b/package/mesa3d/0007-musl.patch
deleted file mode 100644
index 2dd08a1..0000000
--- a/package/mesa3d/0007-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From adadadc151fa8232ecd78649a10496661b98e40d Mon Sep 17 00:00:00 2001
-From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
-Date: Thu, 1 Jun 2017 12:13:18 +0200
-Subject: util/rand_xor: add missing include statements
-
-Fixes for:
-
-src/util/rand_xor.c:60:13: error: implicit declaration of function 'open' [-Werror=implicit-function-declaration]
-    int fd = open("/dev/urandom", O_RDONLY);
-             ^~~~
-src/util/rand_xor.c:60:34: error: 'O_RDONLY' undeclared (first use in this function)
-    int fd = open("/dev/urandom", O_RDONLY);
-                                  ^~~~~~~~
-
-Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
-Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
-[backported from upstream master branch:
- https://cgit.freedesktop.org/mesa/mesa/commit/?id=adadadc151fa8232ecd78649a10496661b98e40d ]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/util/rand_xor.c b/src/util/rand_xor.c
-index de05fa6..de04bbc 100644
---- a/src/util/rand_xor.c
-+++ b/src/util/rand_xor.c
-@@ -25,6 +25,7 @@
- #if defined(__linux__)
- #include <sys/file.h>
- #include <unistd.h>
-+#include <fcntl.h>
- #else
- #include <time.h>
- #endif
--- 
-cgit v0.10.2
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 807c60c..80e8cbd 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-May/000335.html
-md5 4d2eaf5955740b044afd95ed167c906c  mesa-17.1.2.tar.xz
-sha1 9433bd12ac1509d22100c9cd68e15c406daccf2e  mesa-17.1.2.tar.xz
-sha256 0937804f43746339b1f9540d8f9c8b4a1bb3d3eec0e4020eac283b8799798239  mesa-17.1.2.tar.xz
-sha512 9df5e1a0336948a6ba338a9a8499b286543bc079f61f1cf85f6ecf98e05fab9a237777cde0d1e3f2153df9b07515cb8c1a08531d43f053783991ecdd32380d3b  mesa-17.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-June/000337.html
+md5 1946a93d543bc219427e2bebe2ac4752  mesa-17.1.3.tar.xz
+sha1 c79c420d9ecb08ed56d106427528793bdd3ab7ab  mesa-17.1.3.tar.xz
+sha256 5f1ee9a8aea2880f887884df2dea0c16dd1b13eb42fd2e52265db0dc1b380e8c mesa-17.1.3.tar.xz
+sha512 b487d4f3d7717f379e7aaf66958bbef886fbae219e6e0333123c4623dc7db84109aca8cf07be08c0b79a74bdb198c704073fd549c6e85aa952ed3c97da1a8a94 mesa-17.1.3.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 04a7d13..a5ab84b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.2
+MESA3D_VERSION = 17.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.7.4
