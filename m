From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 May 2021 09:04:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump version to 3.0.14
Message-ID: <20210513070431.1020998-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002 which was applied upstream:
https://code.videolan.org/videolan/vlc/-/commit/41caaa08cde60c4fec4bf2e5f9610e2a1b9e6a23

Renumbered remaining patches.

Release notes:
https://www.videolan.org/vlc/releases/3.0.13.html
https://www.videolan.org/vlc/releases/3.0.12-update.html

Version 3.0.13 fixes VideoLAN-SB-VLC-3013:
https://www.videolan.org/security/sb-vlc3013.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-automake-add-subdir-objects-option.patch} |  0
 ...OMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch | 41 -------------------
 ...d-use-pkg-config-to-get-tremor-libs.patch} |  0
 ...-using-uClibc-by-adding-sys-types.h.patch} |  0
 ...on-t-assume-strerror_l-is-available.patch} |  0
 ...ent-run-time-fallback-to-real-time-.patch} |  0
 ...ch => 0007-Add-support-for-freerdp2.patch} |  0
 ...-use-AC_PATH_PROG-to-check-for-wayl.patch} |  0
 ...ter-opencv_example.cpp-fix-build-wi.patch} |  0
 package/vlc/vlc.hash                          |  8 ++--
 package/vlc/vlc.mk                            |  2 +-
 11 files changed, 5 insertions(+), 46 deletions(-)
 rename package/vlc/{0003-automake-add-subdir-objects-option.patch => 0002-automake-add-subdir-objects-option.patch} (100%)
 delete mode 100644 package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch
 rename package/vlc/{0004-build-use-pkg-config-to-get-tremor-libs.patch => 0003-build-use-pkg-config-to-get-tremor-libs.patch} (100%)
 rename package/vlc/{0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch => 0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch} (100%)
 rename package/vlc/{0006-Don-t-assume-strerror_l-is-available.patch => 0005-Don-t-assume-strerror_l-is-available.patch} (100%)
 rename package/vlc/{0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch => 0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch} (100%)
 rename package/vlc/{0008-Add-support-for-freerdp2.patch => 0007-Add-support-for-freerdp2.patch} (100%)
 rename package/vlc/{0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch => 0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch} (100%)
 rename package/vlc/{0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch => 0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch} (100%)

diff --git a/package/vlc/0003-automake-add-subdir-objects-option.patch b/package/vlc/0002-automake-add-subdir-objects-option.patch
similarity index 100%
rename from package/vlc/0003-automake-add-subdir-objects-option.patch
rename to package/vlc/0002-automake-add-subdir-objects-option.patch
diff --git a/package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch b/package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch
deleted file mode 100644
index 11eaaf3b20..0000000000
--- a/package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 00135e21bec84a2fe5920d02fa0982ceb9f89a35 Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Thu, 5 Feb 2015 14:48:53 -0800
-Subject: [PATCH] lua: Define LUA_COMPAT_APIINTCASTS for Lua >= 5.3.0
- compatibility.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In Lua 5.3.0, luaL_checkint was deprecated.
-
-This patch fixes this build error with Lua 5.3.0.
-
-lua/demux.c: In function ?vlclua_demux_peek?:
-lua/demux.c:55:5: error: implicit declaration of function ?luaL_checkint? [-Werror=implicit-function-declaration]
-     int n = luaL_checkint( L, 1 );
-     ^
-
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
-[Backport upstream commit 41caaa08cde60c4fec4bf2e5f9610e2a1b9e6a23]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/lua/vlc.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/lua/vlc.h b/modules/lua/vlc.h
-index 71f381d334..b46b5f67a1 100644
---- a/modules/lua/vlc.h
-+++ b/modules/lua/vlc.h
-@@ -38,6 +38,7 @@
- #include <vlc_stream.h>
- #include <vlc_demux.h>
- 
-+#define LUA_COMPAT_APIINTCASTS
- #define LUA_COMPAT_MODULE
- #include <lua.h>        /* Low level lua C API */
- #include <lauxlib.h>    /* Higher level C API */
--- 
-2.14.4
-
diff --git a/package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch b/package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
similarity index 100%
rename from package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch
rename to package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
diff --git a/package/vlc/0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch b/package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
similarity index 100%
rename from package/vlc/0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
rename to package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
diff --git a/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
similarity index 100%
rename from package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
rename to package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
diff --git a/package/vlc/0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch b/package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
similarity index 100%
rename from package/vlc/0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch
rename to package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
diff --git a/package/vlc/0008-Add-support-for-freerdp2.patch b/package/vlc/0007-Add-support-for-freerdp2.patch
similarity index 100%
rename from package/vlc/0008-Add-support-for-freerdp2.patch
rename to package/vlc/0007-Add-support-for-freerdp2.patch
diff --git a/package/vlc/0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
similarity index 100%
rename from package/vlc/0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
rename to package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
diff --git a/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch b/package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
similarity index 100%
rename from package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
rename to package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index f404cbf335..396c3a2ab1 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha256
-sha256  eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879  vlc-3.0.12.tar.xz
-# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha1
-sha1  39ef414a07202ec6569acda4c5d91e8576d453bf  vlc-3.0.12.tar.xz
+# From https://get.videolan.org/vlc/3.0.14/vlc-3.0.14.tar.xz.sha256
+sha256  49b93e5b33deaa37060e6b24a98200cad70c407947f14eb2a8b6a0c64d8535a6  vlc-3.0.14.tar.xz
+# From https://get.videolan.org/vlc/3.0.14/vlc-3.0.14.tar.xz.sha1
+sha1  8a8613f16a9053668d7a7dcfa1e6d8be93af3e89  vlc-3.0.14.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 020c37aa5d..c1e190099e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.12
+VLC_VERSION = 3.0.14
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.29.2
