From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:30:49 +0200
Subject: [Buildroot] [git commit] package/minizip: use pkg-config to find
 zstd
Message-ID: <20200725213108.AAC148871C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ebc22aef0f0ac5e6f7e864ae25559bc44fe252f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build with zstd in version 2.10.0

Fixes:
 - http://autobuild.buildroot.org/results/0fe0ca0a7d39f863614f2aecd9eefc20cd64daf4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../minizip/0001-Use-pkg-config-to-find-ZSTD.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch b/package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch
new file mode 100644
index 0000000000..5866099634
--- /dev/null
+++ b/package/minizip/0001-Use-pkg-config-to-find-ZSTD.patch
@@ -0,0 +1,30 @@
+From 69afd09aee3727f2804e1b063ef50800b22c6bb9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Patrik=20Novotn=C3=BD?= <panovotn@redhat.com>
+Date: Wed, 1 Jul 2020 11:18:08 +0200
+Subject: [PATCH] Use pkg-config to find ZSTD
+
+[Retrieved from: https://github.com/nmoinvaz/minizip/pull/509]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a6deb4ce..987e7947 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -115,7 +115,13 @@ endif()
+ # Check if zstd installation is present
+ if(MZ_ZSTD)
+     if(NOT ZSTD_FORCE_FETCH)
+-        find_package(ZSTD QUIET)
++        find_package(PkgConfig)
++        if(PKGCONFIG_FOUND)
++            pkg_check_modules(ZSTD libzstd)
++        endif()
++        if(NOT ZSTD_FOUND)
++            find_package(ZSTD QUIET)
++        endif()
+     endif()
+     if(ZSTD_FOUND AND NOT ZSTD_FORCE_FETCH)
+         message(STATUS "Using ZSTD")
