From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:24:06 +0200
Subject: [Buildroot] [git commit] libiio: Add a patch to fix compilation
	with old glibc
Message-ID: <20160819092442.0B9D1805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=817938bb1699a972463fd576df981145f87624cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cherry-picked from upstream.

Fixes:

  http://autobuild.buildroot.net/results/fa7f7db861c342f4d189f74b983ae9d2751cf29b/

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-CMake-Link-with-librt-if-found.patch      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libiio/0002-CMake-Link-with-librt-if-found.patch b/package/libiio/0002-CMake-Link-with-librt-if-found.patch
new file mode 100644
index 0000000..2c45016
--- /dev/null
+++ b/package/libiio/0002-CMake-Link-with-librt-if-found.patch
@@ -0,0 +1,30 @@
+From 1bc450179a0819970261e6a29071756d09b71c5f Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul.cercueil@analog.com>
+Date: Fri, 19 Aug 2016 09:00:58 +0200
+Subject: [PATCH] CMake: Link with librt if found
+
+This is required for older versions of glibc.
+
+Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2a339fe..3dd3520 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -113,6 +113,10 @@ add_definitions(-DLIBIIO_VERSION_GIT="${LIBIIO_VERSION_GIT}")
+ if(WITH_LOCAL_BACKEND)
+ 	add_definitions(-DLOCAL_BACKEND=1)
+ 	set(LIBIIO_CFILES ${LIBIIO_CFILES} local.c)
++
++	# Link with librt if present
++	find_library(LIBRT_LIBRARIES rt)
++	set(LIBS_TO_LINK ${LIBS_TO_LINK} ${LIBRT_LIBRARIES})
+ endif()
+ 
+ find_library(LIBUSB_LIBRARIES usb-1.0)
+-- 
+2.8.1
+
