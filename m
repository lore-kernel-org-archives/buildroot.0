From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:25 +0200
Subject: [Buildroot] [PATCH/next v2 13/23] package/vlc: bump version to 3.0.3
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc depends on gcc-4.9+:
https://mailman.videolan.org/pipermail/vlc-devel/2016-September/109452.html

Added fix for stack-protector detection.

Disabled all new optional dependencies for now, subsequent patches will
enable dependencies with buildroot packages present.

Removed gles1 configure option after
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=6c4bb081844c51a9a1b1cdb44fc5f42e5a879327

Renamed mmal configure options after
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=bdb1d86acfb0d0068e57281b6fbfc52345960d29
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=1d2b56c68bbc3287e17f6140bdf8c8c3efe08fdc

Renamed avahi configure option after
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=55280fa62cb68b71767778c56250352b4840b69a

Removed directfb support after being dropped upstream:
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=8e1a0e876615da31321203090daa7c8699b6406d

Renamed matroska configure option after
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=156ceb73e2f46618a6cffb081e71e368a315ec3e

Replaced qt4 support with qt5:
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=1c221a77d92935866e897254c07e1d12a4b95ae0

Removed sdl support:
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=4b8a2755fe8c0e3e1e9c52483b22c26e24fd5527

Removed --enable-xcb in BR2_PACKAGE_XCB_UTIL_KEYSYMS block, it is
already present in the BR2_PACKAGE_LIBXCB block.

Rebased patches
- 0001-Disable-building-of-statically-linked-vlc-binary.patch
- 0007-Don-t-assume-strerror_l-is-available.patch
- 0009-x264-drop-148-build-support-and-fix-10bit-support.patch
  also renamed from 0013

Removed patches
- 0002-configure.ac-add-check-for-libgcrypt-config-program.patch
  not needed anymore after upstream commit
  http://git.videolan.org/?p=vlc.git;a=commitdiff;h=f94ac7241f33b6896a8e12ae4e3e43d9fd7fb6cc
- 0004-Drop-error-implicit-function-declaration-compile-fla.patch
- 0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
  removed, qt4 is not supported anymore
- 0008-fix-fallback-code-and-add-required-realtime-library-.patch
- 0009-Changes-for-ffmpeg-3.0.patch
- 0010-Fix-build-when-using-C99-and-C-11.patch
- 0011-compat-fix-static_assert.patch
- 0012-Fix-build-with-libupnp-above-1.6.23.patch

New patches
- 0002-lua53_compat.patch to fix lua-5.3 support
- 0004-qt-fix-build-against-Qt-5.11.patch
- 0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
- 0008-posix-clock.patch
- 0010-freerdp-2.patch
  fixes support for freerdp >= 2.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ding-of-statically-linked-vlc-binary.patch |  15 +-
 ...d-check-for-libgcrypt-config-program.patch |  46 ---
 package/vlc/0002-lua53_compat.patch           |  35 ++
 ...cit-function-declaration-compile-fla.patch |  32 --
 .../0004-qt-fix-build-against-Qt-5.11.patch   |  29 ++
 ...me-X11-is-available-when-Qt5-is-used.patch |  28 --
 ...r-using-uClibc-by-adding-sys-types.h.patch |  44 +++
 ...Don-t-assume-strerror_l-is-available.patch |  15 +-
 ...e-and-add-required-realtime-library-.patch |  40 ---
 package/vlc/0008-posix-clock.patch            | 179 ++++++++++
 package/vlc/0009-Changes-for-ffmpeg-3.0.patch | 309 ------------------
 ...build-support-and-fix-10bit-support.patch} |  45 ++-
 ...10-Fix-build-when-using-C99-and-C-11.patch |  30 --
 package/vlc/0010-freerdp-2.patch              | 138 ++++++++
 .../vlc/0011-compat-fix-static_assert.patch   |  36 --
 ...-Fix-build-with-libupnp-above-1.6.23.patch |  64 ----
 package/vlc/Config.in                         |   9 +-
 package/vlc/vlc.hash                          |  13 +-
 package/vlc/vlc.mk                            |  87 +++--
 19 files changed, 525 insertions(+), 669 deletions(-)
 delete mode 100644 package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
 create mode 100644 package/vlc/0002-lua53_compat.patch
 delete mode 100644 package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
 create mode 100644 package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
 delete mode 100644 package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
 create mode 100644 package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
 delete mode 100644 package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
 create mode 100644 package/vlc/0008-posix-clock.patch
 delete mode 100644 package/vlc/0009-Changes-for-ffmpeg-3.0.patch
 rename package/vlc/{0013-x264-drop-148-build-support-and-fix-10bit-support.patch => 0009-x264-drop-148-build-support-and-fix-10bit-support.patch} (84%)
 delete mode 100644 package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
 create mode 100644 package/vlc/0010-freerdp-2.patch
 delete mode 100644 package/vlc/0011-compat-fix-static_assert.patch
 delete mode 100644 package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch

diff --git a/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch b/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
index 4caa170b02..7e653a917b 100644
--- a/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
+++ b/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
@@ -13,7 +13,7 @@ diff --git a/Makefile.am b/Makefile.am
 index febdc63fe4..dca6354ec9 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -933,7 +933,7 @@ libvlc: libvlccore
+@@ -108,7 +108,7 @@ libvlc: libvlccore
  	cd lib && $(MAKE) $(AM_MAKEFLAGS) libvlc.la
  
  core: libvlc vlc$(EXEEXT)
@@ -26,15 +26,14 @@ diff --git a/bin/Makefile.am b/bin/Makefile.am
 index 869ac561dc..5e48b70d0a 100644
 --- a/bin/Makefile.am
 +++ b/bin/Makefile.am
-@@ -1,7 +1,7 @@
- # Building vlc
- #
+@@ -6,7 +6,7 @@
+ noinst_PROGRAMS = vlc-osx-static
+ else
  bin_PROGRAMS = vlc
 -noinst_PROGRAMS = vlc-static
 +noinst_PROGRAMS =
- noinst_DATA =
- vlclib_PROGRAMS = vlc-cache-gen
- EXTRA_PROGRAMS = vlc-wrapper
+ endif
+ endif
+ EXTRA_DIST = vlc_win32_rc.rc.in
 -- 
 2.14.3
-
diff --git a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
deleted file mode 100644
index c1cb2fa10e..0000000000
--- a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c0fb6c7662d7b514f20cbb92ab0b2e535cd3bb49 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 8 Feb 2014 14:33:27 +0100
-Subject: [PATCH] configure.ac: add check for libgcrypt-config program
-
-This allows to override the default libgcrypt-config location (which is
-useful when cross-compiling), instead of using the one from the host
-system.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[yann.morin.1998 at free.fr: adapt from 2.1.6 to 2.2.0; fix quoting in
- AC_PATH_PROG]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure.ac | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b49281cd77..b3841ea77b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4056,16 +4056,17 @@ dnl
- AC_ARG_ENABLE(libgcrypt,
-   [  --disable-libgcrypt     gcrypt support (default enabled)])
- AS_IF([test "${enable_libgcrypt}" != "no"], [
-+  AC_PATH_PROG([GCRYPT_CONFIG],[libgcrypt-config],[libgcrypt-config])
-   AC_CHECK_DECL([GCRYCTL_SET_THREAD_CBS], [
--    libgcrypt-config --version >/dev/null || \
-+    ${GCRYPT_CONFIG} --version >/dev/null || \
-         AC_MSG_ERROR([gcrypt.h present but libgcrypt-config could not be found])
-     AC_CHECK_LIB(gcrypt, gcry_control, [
-       have_libgcrypt="yes"
--      GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
--      GCRYPT_LIBS="`libgcrypt-config --libs`"
-+      GCRYPT_CFLAGS="`${GCRYPT_CONFIG} --cflags`"
-+      GCRYPT_LIBS="`${GCRYPT_CONFIG} --libs`"
-     ], [
-       AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or pass --disable-libgcrypt.])
--    ], [`libgcrypt-config --libs`])
-+    ], [`${GCRYPT_CONFIG} --libs`])
-   ], [
-     AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or pass --disable-libgcrypt.])
-   ], [#include <gcrypt.h>]
--- 
-2.14.3
-
diff --git a/package/vlc/0002-lua53_compat.patch b/package/vlc/0002-lua53_compat.patch
new file mode 100644
index 0000000000..31347913f3
--- /dev/null
+++ b/package/vlc/0002-lua53_compat.patch
@@ -0,0 +1,35 @@
+commit 41caaa08cde60c4fec4bf2e5f9610e2a1b9e6a23
+Author: Vinson Lee <vlee@freedesktop.org>
+Date:   Thu Feb 5 14:48:53 2015 -0800
+
+    lua: Define LUA_COMPAT_APIINTCASTS for Lua >= 5.3.0 compatibility.
+    
+    In Lua 5.3.0, luaL_checkint was deprecated.
+    
+    This patch fixes this build error with Lua 5.3.0.
+    
+    lua/demux.c: In function ?vlclua_demux_peek?:
+    lua/demux.c:55:5: error: implicit declaration of function ?luaL_checkint? [-Werror=implicit-function-declaration]
+         int n = luaL_checkint( L, 1 );
+         ^
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
+
+Downloaded from
+https://github.com/archlinuxarm/PKGBUILDs/blob/master/extra/vlc/lua53_compat.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/modules/lua/vlc.h b/modules/lua/vlc.h
+index efd94f1..85c7fc1 100644
+--- a/modules/lua/vlc.h
++++ b/modules/lua/vlc.h
+@@ -38,6 +38,7 @@
+ #include <vlc_stream.h>
+ #include <vlc_demux.h>
+ 
++#define LUA_COMPAT_APIINTCASTS
+ #define LUA_COMPAT_MODULE
+ #include <lua.h>        /* Low level lua C API */
+ #include <lauxlib.h>    /* Higher level C API */
diff --git a/package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch b/package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
deleted file mode 100644
index 62666b3dae..0000000000
--- a/package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d4806743a059ec6720b5c29e7345390978614fc9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 1 May 2018 22:29:29 +0200
-Subject: [PATCH] Drop error-implicit-function-declaration compile flag
-
-Fix compile warning being treated as error:
-
-codec/svg.c: In function 'DecodeBlock':
-codec/svg.c:240:5: error: implicit declaration of function 'rsvg_handle_render_cairo' [-Werror=implicit-function-declaration]
-cc1: some warnings being treated as errors
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9a37656ddd..b14ba46797 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -867,7 +867,7 @@ dnl
- dnl  Compiler warnings
- dnl
- 
--RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var error-implicit-function-declaration])
-+RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var])
- RDC_PROG_CC_FLAGS([-pipe])
- AC_LANG_PUSH([C++])
- RDC_PROG_CXX_WFLAGS([all extra sign-compare undef pointer-arith volatile-register-var])
--- 
-2.14.3
-
diff --git a/package/vlc/0004-qt-fix-build-against-Qt-5.11.patch b/package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
new file mode 100644
index 0000000000..0ddd3d7f8c
--- /dev/null
+++ b/package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
@@ -0,0 +1,29 @@
+From: Dominique Leuenberger <dimstar@opensuse.org>
+Date: Thu, 17 May 2018 17:40:37 +0200
+Subject: qt: fix build against Qt 5.11
+
+Qt 5.11 is in RC phase now, and some headers need to be explicitly
+included in order to build successfully.
+
+Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
+
+Downloaded from
+https://sources.debian.org/src/vlc/3.0.3-1-3/debian/patches/0003-qt-fix-build-against-Qt-5.11.patch/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/gui/qt/components/simple_preferences.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/gui/qt/components/simple_preferences.cpp b/modules/gui/qt/components/simple_preferences.cpp
+index a89935d..43d9410 100644
+--- a/modules/gui/qt/components/simple_preferences.cpp
++++ b/modules/gui/qt/components/simple_preferences.cpp
+@@ -36,6 +36,7 @@
+ #include <QString>
+ #include <QFont>
+ #include <QToolButton>
++#include <QButtonGroup>
+ #include <QSignalMapper>
+ #include <QVBoxLayout>
+ #include <QScrollArea>
diff --git a/package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch b/package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
deleted file mode 100644
index 0a07dd735d..0000000000
--- a/package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f87ef7f97e7e35cc1c922d5a3ff2a2275da7c22e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 1 May 2018 22:30:39 +0200
-Subject: [PATCH] Don't assume X11 is available when Qt5 is used
-
-libX11 is an optional dependency for the qt4 module.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/gui/qt4/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/gui/qt4/Makefile.am b/modules/gui/qt4/Makefile.am
-index 1a564cf1ea..4d12501eb7 100644
---- a/modules/gui/qt4/Makefile.am
-+++ b/modules/gui/qt4/Makefile.am
-@@ -22,7 +22,7 @@ else
- if HAVE_WIN32
- libqt4_plugin_la_LIBADD += -lole32 -lcomctl32 -luuid
- else
--libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB) -lX11
-+libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB)
- endif
- endif
- if HAVE_DARWIN
--- 
-2.14.3
-
diff --git a/package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch b/package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
new file mode 100644
index 0000000000..6f4558ceb8
--- /dev/null
+++ b/package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
@@ -0,0 +1,44 @@
+From 393474c609e2b4641c9f75a5e8c5099c3d72352b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 2 Apr 2016 16:49:54 +0200
+Subject: [PATCH] Fix build error using uClibc by adding sys/types.h
+
+Fixes
+
+  CC       core.lo
+In file included from libvlc_internal.h:35:0,
+                 from core.c:28:
+../include/vlc/libvlc_media.h:313:18: error: expected declaration specifiers or '...' before '*' token
+ typedef ssize_t (*libvlc_media_read_cb)(void *opaque, unsigned char *buf,
+                  ^
+../include/vlc/libvlc_media.h:423:36: error: unknown type name 'libvlc_media_read_cb'
+                                    libvlc_media_read_cb read_cb,
+                                    ^
+Bug was reported to trac:
+https://trac.videolan.org/vlc/ticket/16768
+
+This patch was suggested by courmisch in the trac ticket.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Patch sent upstream:
+ https://mailman.videolan.org/pipermail/vlc-devel/2016-April/106952.html]
+---
+ include/vlc/libvlc_media.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/vlc/libvlc_media.h b/include/vlc/libvlc_media.h
+index 3e7c637..7caa65e 100644
+--- a/include/vlc/libvlc_media.h
++++ b/include/vlc/libvlc_media.h
+@@ -26,6 +26,8 @@
+ #ifndef VLC_LIBVLC_MEDIA_H
+ #define VLC_LIBVLC_MEDIA_H 1
+ 
++#include <sys/types.h>  /* for ssize_t */
++
+ # ifdef __cplusplus
+ extern "C" {
+ # endif
+-- 
+2.8.0.rc3
+
diff --git a/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
index e587b05d27..b1df2b4729 100644
--- a/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
+++ b/package/vlc/0007-Don-t-assume-strerror_l-is-available.patch
@@ -21,15 +21,15 @@ diff --git a/configure.ac b/configure.ac
 index b14ba46797..15cb4edcfd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -537,7 +537,7 @@ need_libc=false
+@@ -590,7 +590,7 @@
+ need_libc=false
  
  dnl Check for usual libc functions
- AC_CHECK_DECLS([nanosleep],,,[#include <time.h>])
--AC_CHECK_FUNCS([daemon fcntl fstatvfs fork getenv getpwuid_r isatty lstat memalign mmap open_memstream openat pread posix_fadvise posix_madvise setlocale stricmp strnicmp strptime uselocale])
-+AC_CHECK_FUNCS([daemon fcntl fstatvfs fork getenv getpwuid_r isatty lstat memalign mmap open_memstream openat pread posix_fadvise posix_madvise setlocale strerror_l stricmp strnicmp strptime uselocale])
- AC_REPLACE_FUNCS([atof atoll dirfd fdopendir flockfile fsync getdelim getpid gmtime_r lldiv localtime_r nrand48 poll posix_memalign rewind setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strsep strtof strtok_r strtoll swab tdestroy strverscmp])
- AC_CHECK_FUNCS(fdatasync,,
-   [AC_DEFINE(fdatasync, fsync, [Alias fdatasync() to fsync() if missing.])
+-AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
++AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
+ AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
+ AC_REPLACE_FUNCS([gettimeofday])
+ AC_CHECK_FUNC(fdatasync,,
 diff --git a/src/posix/error.c b/src/posix/error.c
 index db51004601..b4aa6fb3ca 100644
 --- a/src/posix/error.c
@@ -54,4 +54,3 @@ index db51004601..b4aa6fb3ca 100644
  
 -- 
 2.14.3
-
diff --git a/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch b/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
deleted file mode 100644
index d9f4241309..0000000000
--- a/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b5d4edd81bcb685cbea61b01d54afa1fe200b7d2 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 26 Aug 2016 15:11:25 +0200
-Subject: [PATCH] fix fallback code and add required realtime library to link
- command
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- configure.ac       | 1 +
- src/posix/thread.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 15cb4edcfd..16e44a8c61 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -121,6 +121,7 @@ case "${host_os}" in
-     ;;
-   linux*)
-     SYS=linux
-+    AC_CHECK_LIB([rt], [posix_spawnp], [VLC_ADD_LIBS([libvlccore],[-lrt])], [], [])
-     ;;
-   bsdi*)
-     SYS=bsdi
-diff --git a/src/posix/thread.c b/src/posix/thread.c
-index 07fa71eb3e..8b8595fcb8 100644
---- a/src/posix/thread.c
-+++ b/src/posix/thread.c
-@@ -85,7 +85,7 @@ static clockid_t vlc_clock_id;
- 
- static void vlc_clock_setup_once (void)
- {
--# if (_POSIX_MONOTONIC_CLOCK == 0)
-+# if (_POSIX_MONOTONIC_CLOCK == 0) && (_POSIX_CLOCK_SELECTION > 0)
-     long val = sysconf (_SC_MONOTONIC_CLOCK);
-     assert (val != 0);
-     vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
--- 
-2.14.3
-
diff --git a/package/vlc/0008-posix-clock.patch b/package/vlc/0008-posix-clock.patch
new file mode 100644
index 0000000000..a7f8246851
--- /dev/null
+++ b/package/vlc/0008-posix-clock.patch
@@ -0,0 +1,179 @@
+From: R?mi Denis-Courmont <remi@remlab.net>
+Date: Wed, 18 Apr 2018 17:23:57 +0000 (+0300)
+Subject: posix: remove ancient run-time fallback to real-time clock
+X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=951ceb9e13d6f89a3bd20402f9604b53bc931725
+
+posix: remove ancient run-time fallback to real-time clock
+
+For hysterical raisins, GNU/Linux and possibly some other OSes still
+report that monotonic clock must be checked at run-time, although I
+doubt that VLC or even current glibc would run on such old kernel.
+
+Drop that to simplify and avoid the systematic one-time init check.
+
+Downloaded from upstream commit to fix build error on m68k:
+
+posix/thread.c:79:5: warning: #warning Monotonic clock not available. Expect timing issues. [-Wcpp]
+ #   warning Monotonic clock not available. Expect timing issues.
+     ^~~~~~~
+posix/thread.c: In function ?vlc_clock_setup_once?:
+posix/thread.c:88:18: error: lvalue required as left operand of assignment
+     vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+diff --git a/src/posix/thread.c b/src/posix/thread.c
+index e849abc5bb..3002949774 100644
+--- a/src/posix/thread.c
++++ b/src/posix/thread.c
+@@ -51,62 +51,16 @@
+ # include <sys/pset.h>
+ #endif
+ 
+-#if !defined (_POSIX_TIMERS)
+-# define _POSIX_TIMERS (-1)
+-#endif
+-#if !defined (_POSIX_CLOCK_SELECTION)
+-/* Clock selection was defined in 2001 and became mandatory in 2008. */
+-# define _POSIX_CLOCK_SELECTION (-1)
+-#endif
+-#if !defined (_POSIX_MONOTONIC_CLOCK)
+-# define _POSIX_MONOTONIC_CLOCK (-1)
+-#endif
+-
+-#if (_POSIX_TIMERS > 0)
+ static unsigned vlc_clock_prec;
+ 
+-# if (_POSIX_MONOTONIC_CLOCK > 0) && (_POSIX_CLOCK_SELECTION > 0)
+-/* Compile-time POSIX monotonic clock support */
+-#  define vlc_clock_id (CLOCK_MONOTONIC)
+-
+-# elif (_POSIX_MONOTONIC_CLOCK == 0) && (_POSIX_CLOCK_SELECTION > 0)
+-/* Run-time POSIX monotonic clock support (see clock_setup() below) */
+-static clockid_t vlc_clock_id;
+-
+-# else
+-/* No POSIX monotonic clock support */
+-#   define vlc_clock_id (CLOCK_REALTIME)
+-#   warning Monotonic clock not available. Expect timing issues.
+-
+-# endif /* _POSIX_MONOTONIC_CLOKC */
+-
+ static void vlc_clock_setup_once (void)
+ {
+-# if (_POSIX_MONOTONIC_CLOCK == 0)
+-    long val = sysconf (_SC_MONOTONIC_CLOCK);
+-    assert (val != 0);
+-    vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
+-# endif
+-
+     struct timespec res;
+-    if (unlikely(clock_getres (vlc_clock_id, &res) != 0 || res.tv_sec != 0))
++    if (unlikely(clock_getres(CLOCK_MONOTONIC, &res) != 0 || res.tv_sec != 0))
+         abort ();
+     vlc_clock_prec = (res.tv_nsec + 500) / 1000;
+ }
+ 
+-static pthread_once_t vlc_clock_once = PTHREAD_ONCE_INIT;
+-
+-# define vlc_clock_setup() \
+-    pthread_once(&vlc_clock_once, vlc_clock_setup_once)
+-
+-#else /* _POSIX_TIMERS */
+-
+-# include <sys/time.h> /* gettimeofday() */
+-
+-# define vlc_clock_setup() (void)0
+-# warning Monotonic clock not available. Expect timing issues.
+-#endif /* _POSIX_TIMERS */
+-
+ static struct timespec mtime_to_ts (mtime_t date)
+ {
+     lldiv_t d = lldiv (date, CLOCK_FREQ);
+@@ -233,14 +187,11 @@ void vlc_cond_init (vlc_cond_t *p_condvar)
+ {
+     pthread_condattr_t attr;
+ 
+-    if (unlikely(pthread_condattr_init (&attr)))
+-        abort ();
+-#if (_POSIX_CLOCK_SELECTION > 0)
+-    vlc_clock_setup ();
+-    pthread_condattr_setclock (&attr, vlc_clock_id);
+-#endif
+-    if (unlikely(pthread_cond_init (p_condvar, &attr)))
++    if (unlikely(pthread_condattr_init (&attr))
++     || unlikely(pthread_condattr_setclock(&attr, CLOCK_MONOTONIC))
++     || unlikely(pthread_cond_init (p_condvar, &attr)))
+         abort ();
++
+     pthread_condattr_destroy (&attr);
+ }
+ 
+@@ -629,44 +580,27 @@ void vlc_control_cancel (int cmd, ...)
+ 
+ mtime_t mdate (void)
+ {
+-#if (_POSIX_TIMERS > 0)
+     struct timespec ts;
+ 
+-    vlc_clock_setup ();
+-    if (unlikely(clock_gettime (vlc_clock_id, &ts) != 0))
++    if (unlikely(clock_gettime(CLOCK_MONOTONIC, &ts) != 0))
+         abort ();
+ 
+     return (INT64_C(1000000) * ts.tv_sec) + (ts.tv_nsec / 1000);
+-
+-#else
+-    struct timeval tv;
+-
+-    if (unlikely(gettimeofday (&tv, NULL) != 0))
+-        abort ();
+-    return (INT64_C(1000000) * tv.tv_sec) + tv.tv_usec;
+-
+-#endif
+ }
+ 
+ #undef mwait
+ void mwait (mtime_t deadline)
+ {
+-#if (_POSIX_CLOCK_SELECTION > 0)
+-    vlc_clock_setup ();
++    static pthread_once_t vlc_clock_once = PTHREAD_ONCE_INIT;
++
+     /* If the deadline is already elapsed, or within the clock precision,
+      * do not even bother the system timer. */
++    pthread_once(&vlc_clock_once, vlc_clock_setup_once);
+     deadline -= vlc_clock_prec;
+ 
+     struct timespec ts = mtime_to_ts (deadline);
+ 
+-    while (clock_nanosleep (vlc_clock_id, TIMER_ABSTIME, &ts, NULL) == EINTR);
+-
+-#else
+-    deadline -= mdate ();
+-    if (deadline > 0)
+-        msleep (deadline);
+-
+-#endif
++    while (clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &ts, NULL) == EINTR);
+ }
+ 
+ #undef msleep
+@@ -674,15 +608,7 @@ void msleep (mtime_t delay)
+ {
+     struct timespec ts = mtime_to_ts (delay);
+ 
+-#if (_POSIX_CLOCK_SELECTION > 0)
+-    vlc_clock_setup ();
+-    while (clock_nanosleep (vlc_clock_id, 0, &ts, &ts) == EINTR);
+-
+-#else
+-    while (nanosleep (&ts, &ts) == -1)
+-        assert (errno == EINTR);
+-
+-#endif
++    while (clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, &ts) == EINTR);
+ }
+ 
+ unsigned vlc_GetCPUCount(void)
diff --git a/package/vlc/0009-Changes-for-ffmpeg-3.0.patch b/package/vlc/0009-Changes-for-ffmpeg-3.0.patch
deleted file mode 100644
index a765a0a6c4..0000000000
--- a/package/vlc/0009-Changes-for-ffmpeg-3.0.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-From 960c98831ca75b08168530f1c74af07901e01963 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 1 May 2018 22:32:02 +0200
-Subject: [PATCH] Changes for ffmpeg 3.0
-
-This file is a copy of debian/patches/04_ffmpeg-3.0.diff, to be found in
-http://www.deb-multimedia.org/pool/main/v/vlc-dmo/vlc-dmo_2.2.4.orig.tar.gz
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac                    | 14 +++++++-------
- modules/codec/avcodec/audio.c   |  2 +-
- modules/codec/avcodec/encoder.c | 20 ++++++++++----------
- modules/codec/avcodec/vaapi.c   |  2 +-
- modules/codec/avcodec/video.c   | 14 +++++++-------
- modules/demux/avformat/demux.c  | 10 +++++-----
- 6 files changed, 31 insertions(+), 31 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 16e44a8c61..6886b2b872 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2319,7 +2319,7 @@ AC_ARG_ENABLE(avcodec,
- AS_IF([test "${enable_avcodec}" != "no"], [
-   PKG_CHECK_MODULES(AVCODEC,[libavcodec >= 53.34.0 libavutil >= 51.22.0], [
-     PKG_CHECK_EXISTS([libavutil < 55],, [
--      AC_MSG_ERROR([libavutil versions 55 and later are not supported.])
-+      AC_MSG_WARN([libavutil versions 55 and later are not supported.])
-     ])
-     VLC_SAVE_FLAGS
-     CPPFLAGS="${CPPFLAGS} ${AVCODEC_CFLAGS}"
-@@ -2329,7 +2329,7 @@ AS_IF([test "${enable_avcodec}" != "no"], [
-     VLC_RESTORE_FLAGS
-     have_avcodec="yes"
-   ],[
--    AC_MSG_ERROR([${AVCODEC_PKG_ERRORS}. Pass --disable-avcodec to ignore this error.])
-+    AC_MSG_WARN([${AVCODEC_PKG_ERRORS}. Pass --disable-avcodec to ignore this error.])
-   ])
- ], [
-   have_avcodec="no"
-@@ -2378,7 +2378,7 @@ AS_IF([test "${have_vaapi}" = "yes" -a "${have_avcodec}" = "yes"], [
-   case "${avfork}" in
-     ffmpeg)
-       PKG_CHECK_EXISTS([libavcodec >= 57.10.100], [
--        AC_MSG_ERROR([VA API requires FFmpeg libavcodec < 57.10 or libav.])
-+        AC_MSG_WARN([VA API requires FFmpeg libavcodec < 57.10 or libav.])
-       ])
-       ;;
-   esac
-@@ -2412,7 +2412,7 @@ AS_IF([test "${enable_dxva2}" != "no"], [
-     case "${avfork}" in
-       ffmpeg)
-         PKG_CHECK_EXISTS([libavcodec >= 57.10.100], [
--          AC_MSG_ERROR([DXVA2 requires FFmpeg libavcodec < 57.10 or libav.])
-+          AC_MSG_WARN([DXVA2 requires FFmpeg libavcodec < 57.10 or libav.])
-         ])
-         ;;
-     esac
-@@ -2504,7 +2504,7 @@ AS_IF([test "${enable_avformat}" != "no"], [
-       ])
-       VLC_RESTORE_FLAGS
-     ],[
--      AC_MSG_ERROR([${AVFORMAT_PKG_ERRORS}. Pass --disable-avformat to ignore this error.])
-+      AC_MSG_WARN([${AVFORMAT_PKG_ERRORS}. Pass --disable-avformat to ignore this error.])
-   ])
- ])
- AM_CONDITIONAL([HAVE_AVFORMAT], [test "${enable_avformat}" != "no"])
-@@ -2533,7 +2533,7 @@ then
-       ])
-       VLC_RESTORE_FLAGS
-     ],[
--      AC_MSG_ERROR([${SWSCALE_PKG_ERRORS}. Pass --disable-swscale to ignore this error. Proper software scaling and some video chroma conversion will be missing.])
-+      AC_MSG_WARN([${SWSCALE_PKG_ERRORS}. Pass --disable-swscale to ignore this error. Proper software scaling and some video chroma conversion will be missing.])
-   ])
- fi
- 
-@@ -3176,7 +3176,7 @@ AS_IF([test "${have_vdpau}" = "yes" -a "${have_avcodec}" = "yes"], [
-     libav) av_vdpau_ver="55.26.0" ;;
-     ffmpeg) av_vdpau_ver="55.42.100"
-       PKG_CHECK_EXISTS([libavcodec >= 57.10.100], [
--        AC_MSG_ERROR([VDPAU requires FFmpeg libavcodec < 57.10 or libav.])
-+        AC_MSG_WARN([VDPAU requires FFmpeg libavcodec < 57.10 or libav.])
-       ])
-       ;;
-   esac
-diff --git a/modules/codec/avcodec/audio.c b/modules/codec/avcodec/audio.c
-index 7068499d82..b5347ac896 100644
---- a/modules/codec/avcodec/audio.c
-+++ b/modules/codec/avcodec/audio.c
-@@ -39,7 +39,7 @@
- #include <libavcodec/avcodec.h>
- #include <libavutil/mem.h>
- 
--#include <libavutil/audioconvert.h>
-+#include <libavutil/channel_layout.h>
- 
- #include "avcodec.h"
- 
-diff --git a/modules/codec/avcodec/encoder.c b/modules/codec/avcodec/encoder.c
-index 457078a06f..2bfc0c05f2 100644
---- a/modules/codec/avcodec/encoder.c
-+++ b/modules/codec/avcodec/encoder.c
-@@ -41,7 +41,7 @@
- #include <vlc_cpu.h>
- 
- #include <libavcodec/avcodec.h>
--#include <libavutil/audioconvert.h>
-+#include <libavutil/channel_layout.h>
- 
- #include "avcodec.h"
- #include "avcommon.h"
-@@ -311,7 +311,7 @@ int OpenEncoder( vlc_object_t *p_this )
-     else if( !GetFfmpegCodec( p_enc->fmt_out.i_codec, &i_cat, &i_codec_id,
-                              &psz_namecodec ) )
-     {
--        if( FindFfmpegChroma( p_enc->fmt_out.i_codec ) == PIX_FMT_NONE )
-+        if( FindFfmpegChroma( p_enc->fmt_out.i_codec ) == AV_PIX_FMT_NONE )
-             return VLC_EGENERIC; /* handed chroma output */
- 
-         i_cat      = VIDEO_ES;
-@@ -555,7 +555,7 @@ int OpenEncoder( vlc_object_t *p_this )
- 
-         if( p_codec->pix_fmts )
-         {
--            const enum PixelFormat *p = p_codec->pix_fmts;
-+            const enum AVPixelFormat *p = p_codec->pix_fmts;
-             for( ; *p != -1; p++ )
-             {
-                 if( *p == p_context->pix_fmt ) break;
-@@ -1017,7 +1017,7 @@ errmsg:
-         }
-     }
- 
--    p_sys->frame = avcodec_alloc_frame();
-+    p_sys->frame = av_frame_alloc();
-     if( !p_sys->frame )
-     {
-         goto error;
-@@ -1048,7 +1048,7 @@ static void vlc_av_packet_Release(block_t *block)
- {
-     vlc_av_packet_t *b = (void *) block;
- 
--    av_free_packet(&b->packet);
-+    av_packet_unref(&b->packet);
-     free(b);
- }
- 
-@@ -1088,7 +1088,7 @@ static block_t *EncodeVideo( encoder_t *p_enc, picture_t *p_pict )
-     AVFrame *frame = NULL;
-     if( likely(p_pict) ) {
-         frame = p_sys->frame;
--        avcodec_get_frame_defaults( frame );
-+        av_frame_unref( frame );
-         for( i_plane = 0; i_plane < p_pict->i_planes; i_plane++ )
-         {
-             p_sys->frame->data[i_plane] = p_pict->p[i_plane].p_pixels;
-@@ -1188,7 +1188,7 @@ static block_t *EncodeVideo( encoder_t *p_enc, picture_t *p_pict )
-             av_pkt.duration / p_sys->p_context->time_base.den, p_sys->p_context );
-     if( unlikely(p_block == NULL) )
-     {
--        av_free_packet( &av_pkt );
-+        av_packet_unref( &av_pkt );
-         return NULL;
-     }
- 
-@@ -1329,7 +1329,7 @@ static block_t *handle_delay_buffer( encoder_t *p_enc, encoder_sys_t *p_sys, int
-     //How much we need to copy from new packet
-     const int leftover = leftover_samples * p_sys->p_context->channels * p_sys->i_sample_bytes;
- 
--    avcodec_get_frame_defaults( p_sys->frame );
-+    av_frame_unref( p_sys->frame );
-     p_sys->frame->format     = p_sys->p_context->sample_fmt;
-     p_sys->frame->nb_samples = leftover_samples + p_sys->i_samples_delay;
- 
-@@ -1451,7 +1451,7 @@ static block_t *EncodeAudio( encoder_t *p_enc, block_t *p_aout_buf )
-     while( ( p_aout_buf->i_nb_samples >= p_sys->i_frame_size ) ||
-            ( p_sys->b_variable && p_aout_buf->i_nb_samples ) )
-     {
--        avcodec_get_frame_defaults( p_sys->frame );
-+        av_frame_unref( p_sys->frame );
-         if( p_sys->b_variable )
-             p_sys->frame->nb_samples = p_aout_buf->i_nb_samples;
-         else
-@@ -1514,7 +1514,7 @@ void CloseEncoder( vlc_object_t *p_this )
-     encoder_t *p_enc = (encoder_t *)p_this;
-     encoder_sys_t *p_sys = p_enc->p_sys;
- 
--    /*FIXME: we should use avcodec_free_frame, but we don't require so new avcodec that has it*/
-+    /*FIXME: we should use av_frame_free, but we don't require so new avcodec that has it*/
-     av_freep( &p_sys->frame );
- 
-     vlc_avcodec_lock();
-diff --git a/modules/codec/avcodec/vaapi.c b/modules/codec/avcodec/vaapi.c
-index 1d8f7fa97b..d9643d061c 100644
---- a/modules/codec/avcodec/vaapi.c
-+++ b/modules/codec/avcodec/vaapi.c
-@@ -595,7 +595,7 @@ static int Create( vlc_va_t *p_va, AVCodecContext *ctx,
-         return err;
- 
-     /* Only VLD supported */
--    p_va->pix_fmt = PIX_FMT_VAAPI_VLD;
-+    p_va->pix_fmt = AV_PIX_FMT_VAAPI_VLD;
-     p_va->setup = Setup;
-     p_va->get = Get;
-     p_va->release = Release;
-diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
-index ce5254423e..fd72d8d8e2 100644
---- a/modules/codec/avcodec/video.c
-+++ b/modules/codec/avcodec/video.c
-@@ -108,8 +108,8 @@ static int lavc_GetFrame(struct AVCodecContext *, AVFrame *, int);
- static int  ffmpeg_GetFrameBuf    ( struct AVCodecContext *, AVFrame * );
- static void ffmpeg_ReleaseFrameBuf( struct AVCodecContext *, AVFrame * );
- #endif
--static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *,
--                                          const enum PixelFormat * );
-+static enum AVPixelFormat ffmpeg_GetFormat( AVCodecContext *,
-+                                          const enum AVPixelFormat * );
- 
- static uint32_t ffmpeg_CodecTag( vlc_fourcc_t fcc )
- {
-@@ -236,7 +236,7 @@ int InitVideoDec( decoder_t *p_dec, AVCodecContext *p_context,
-     p_sys->p_codec = p_codec;
-     p_sys->i_codec_id = i_codec_id;
-     p_sys->psz_namecodec = psz_namecodec;
--    p_sys->p_ff_pic = avcodec_alloc_frame();
-+    p_sys->p_ff_pic = av_frame_alloc();
-     p_sys->b_delayed_open = true;
-     p_sys->p_va = NULL;
-     vlc_sem_init( &p_sys->sem_mt, 0 );
-@@ -448,7 +448,7 @@ int InitVideoDec( decoder_t *p_dec, AVCodecContext *p_context,
-     if( ffmpeg_OpenCodec( p_dec ) < 0 )
-     {
-         msg_Err( p_dec, "cannot open codec (%s)", p_sys->psz_namecodec );
--        avcodec_free_frame( &p_sys->p_ff_pic );
-+        av_frame_free( &p_sys->p_ff_pic );
-         vlc_sem_destroy( &p_sys->sem_mt );
-         free( p_sys );
-         return VLC_EGENERIC;
-@@ -849,7 +849,7 @@ void EndVideoDec( decoder_t *p_dec )
-     wait_mt( p_sys );
- 
-     if( p_sys->p_ff_pic )
--        avcodec_free_frame( &p_sys->p_ff_pic );
-+        av_frame_free( &p_sys->p_ff_pic );
- 
-     if( p_sys->p_va )
-         vlc_va_Delete( p_sys->p_va );
-@@ -1336,8 +1336,8 @@ static void ffmpeg_ReleaseFrameBuf( struct AVCodecContext *p_context,
- }
- #endif
- 
--static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
--                                          const enum PixelFormat *pi_fmt )
-+static enum AVPixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
-+                                          const enum AVPixelFormat *pi_fmt )
- {
-     decoder_t *p_dec = p_context->opaque;
-     decoder_sys_t *p_sys = p_dec->p_sys;
-diff --git a/modules/demux/avformat/demux.c b/modules/demux/avformat/demux.c
-index a99bdfa5b7..4e27d07d36 100644
---- a/modules/demux/avformat/demux.c
-+++ b/modules/demux/avformat/demux.c
-@@ -734,14 +734,14 @@ static int Demux( demux_t *p_demux )
-     }
-     if( pkt.stream_index < 0 || pkt.stream_index >= p_sys->i_tk )
-     {
--        av_free_packet( &pkt );
-+        av_packet_unref( &pkt );
-         return 1;
-     }
-     const AVStream *p_stream = p_sys->ic->streams[pkt.stream_index];
-     if( p_stream->time_base.den <= 0 )
-     {
-         msg_Warn( p_demux, "Invalid time base for the stream %d", pkt.stream_index );
--        av_free_packet( &pkt );
-+        av_packet_unref( &pkt );
-         return 1;
-     }
-     if( p_stream->codec->codec_id == AV_CODEC_ID_SSA )
-@@ -749,7 +749,7 @@ static int Demux( demux_t *p_demux )
-         p_frame = BuildSsaFrame( &pkt, p_sys->i_ssa_order++ );
-         if( !p_frame )
-         {
--            av_free_packet( &pkt );
-+            av_packet_unref( &pkt );
-             return 1;
-         }
-     }
-@@ -757,7 +757,7 @@ static int Demux( demux_t *p_demux )
-     {
-         if( ( p_frame = block_Alloc( pkt.size ) ) == NULL )
-         {
--            av_free_packet( &pkt );
-+            av_packet_unref( &pkt );
-             return 0;
-         }
-         memcpy( p_frame->p_buffer, pkt.data, pkt.size );
-@@ -838,7 +838,7 @@ static int Demux( demux_t *p_demux )
-     else
-         block_Release( p_frame );
- 
--    av_free_packet( &pkt );
-+    av_packet_unref( &pkt );
-     return 1;
- }
- 
--- 
-2.14.3
-
diff --git a/package/vlc/0013-x264-drop-148-build-support-and-fix-10bit-support.patch b/package/vlc/0009-x264-drop-148-build-support-and-fix-10bit-support.patch
similarity index 84%
rename from package/vlc/0013-x264-drop-148-build-support-and-fix-10bit-support.patch
rename to package/vlc/0009-x264-drop-148-build-support-and-fix-10bit-support.patch
index b9e3272fd4..ffa2abd36f 100644
--- a/package/vlc/0013-x264-drop-148-build-support-and-fix-10bit-support.patch
+++ b/package/vlc/0009-x264-drop-148-build-support-and-fix-10bit-support.patch
@@ -1,7 +1,7 @@
-From 5d003fa5df276b62efe82329ef9ce2fd30a34f46 Mon Sep 17 00:00:00 2001
 From: Ilkka Ollakka <ileoo@videolan.org>
-Date: Sat, 24 Mar 2018 11:23:33 +0200
-Subject: [PATCH] x264: drop <148 build support and fix 10bit support
+Date: Sat, 24 Mar 2018 11:23:33 +0000 (+0200)
+Subject: x264: drop <148 build support and fix 10bit support
+X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=a8953ba707cca1f2de372ca24513296bcfcdaaa8
 
 x264: drop <148 build support and fix 10bit support
 
@@ -9,19 +9,17 @@ Drop old #if as 148 is not that recent anymore.
 
 fixes #19581
 
-Rebased upstream commit
+Downloaded from upstream commit
 http://git.videolan.org/?p=vlc.git;a=commitdiff;h=a8953ba707cca1f2de372ca24513296bcfcdaaa8
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- modules/codec/x264.c | 65 ++++++++--------------------------------------------
- 1 file changed, 10 insertions(+), 55 deletions(-)
 
 diff --git a/modules/codec/x264.c b/modules/codec/x264.c
-index be5d0006de..96a4b08524 100644
+index e02048f075..bcf3c89a10 100644
 --- a/modules/codec/x264.c
 +++ b/modules/codec/x264.c
-@@ -83,13 +83,7 @@ static void x264_log( void *, int i_level, const char *psz, va_list );
+@@ -84,13 +84,7 @@ static void x264_log( void *, int i_level, const char *psz, va_list );
      "I-frames, but do not start a new GOP." )
  
  #define OPENGOP_TEXT N_("Use recovery points to close GOPs")
@@ -35,7 +33,7 @@ index be5d0006de..96a4b08524 100644
  
  #define BLURAY_TEXT N_("Enable compatibility hacks for Blu-ray support")
  #define BLURAY_LONGTEXT N_("Enable hacks for Blu-ray support, this doesn't enforce every aspect of Blu-ray compatibility\n" \
-@@ -471,16 +465,10 @@ vlc_module_begin ()
+@@ -469,16 +463,10 @@ vlc_module_begin ()
      add_integer( SOUT_CFG_PREFIX "min-keyint", 25, MIN_KEYINT_TEXT,
                   MIN_KEYINT_LONGTEXT, true )
  
@@ -52,7 +50,7 @@ index be5d0006de..96a4b08524 100644
  
      add_integer( SOUT_CFG_PREFIX "scenecut", 40, SCENE_TEXT,
                   SCENE_LONGTEXT, true )
-@@ -500,13 +488,8 @@ vlc_module_begin ()
+@@ -498,13 +486,8 @@ vlc_module_begin ()
                   B_BIAS_LONGTEXT, true )
          change_integer_range( -100, 100 )
  
@@ -66,14 +64,14 @@ index be5d0006de..96a4b08524 100644
          change_string_list( bpyramid_list, bpyramid_list )
  
      add_bool( SOUT_CFG_PREFIX "cabac", true, CABAC_TEXT, CABAC_LONGTEXT,
-@@ -543,22 +526,18 @@ vlc_module_begin ()
+@@ -541,22 +524,18 @@ vlc_module_begin ()
      add_bool( SOUT_CFG_PREFIX "interlaced", false, INTERLACED_TEXT, INTERLACED_LONGTEXT,
                true )
  
 -#if X264_BUILD >= 111
      add_integer( SOUT_CFG_PREFIX "frame-packing", -1, FRAMEPACKING_TEXT, FRAMEPACKING_LONGTEXT, true )
          change_integer_list( framepacking_list, framepacking_list_text )
-         change_integer_range( -1, 5)
+         change_integer_range( -1, 6)
 -#endif
  
      add_integer( SOUT_CFG_PREFIX "slices", 0, SLICE_COUNT, SLICE_COUNT_LONGTEXT, true )
@@ -89,8 +87,8 @@ index be5d0006de..96a4b08524 100644
  
  
  /* Ratecontrol */
-@@ -843,20 +822,14 @@ static int  Open ( vlc_object_t *p_this )
-     fullrange = var_GetBool( p_enc, SOUT_CFG_PREFIX "fullrange" );
+@@ -842,20 +821,14 @@ static int  Open ( vlc_object_t *p_this )
+     fullrange |= p_enc->fmt_in.video.b_color_range_full;
      p_enc->fmt_in.i_codec = fullrange ? VLC_CODEC_J420 : VLC_CODEC_I420;
      p_sys->i_colorspace = X264_CSP_I420;
 -#if X264_BUILD >= 118
@@ -103,7 +101,7 @@ index be5d0006de..96a4b08524 100644
  # ifdef MODULE_NAME_IS_x26410b
 -        if( mask == 0)
 -        {
--            msg_Err( p_enc, "Only high bith depth encoding supported, bit depth:%d", x264_bit_depth);
+-            msg_Err( p_enc, "Only high bit depth encoding supported, bit depth:%d", x264_bit_depth);
 -            return VLC_EGENERIC;
 -        }
 +    const int mask = X264_CSP_HIGH_DEPTH;
@@ -115,7 +113,7 @@ index be5d0006de..96a4b08524 100644
  
          if( !strcmp( psz_profile, "high10" ) )
          {
-@@ -879,7 +852,6 @@ static int  Open ( vlc_object_t *p_this )
+@@ -878,7 +851,6 @@ static int  Open ( vlc_object_t *p_this )
              msg_Err( p_enc, "Only high-profiles and 10-bit are supported");
              return VLC_EGENERIC;
          }
@@ -123,7 +121,7 @@ index be5d0006de..96a4b08524 100644
  # endif
      }
  # ifdef MODULE_NAME_IS_x26410b
-@@ -890,7 +862,6 @@ static int  Open ( vlc_object_t *p_this )
+@@ -889,7 +861,6 @@ static int  Open ( vlc_object_t *p_this )
      }
  # endif
      free( psz_profile );
@@ -131,7 +129,7 @@ index be5d0006de..96a4b08524 100644
  
      p_enc->pf_encode_video = Encode;
      p_enc->pf_encode_audio = NULL;
-@@ -913,6 +884,10 @@ static int  Open ( vlc_object_t *p_this )
+@@ -912,6 +883,10 @@ static int  Open ( vlc_object_t *p_this )
  #else
      x264_param_default( &p_sys->param );
      x264_param_default_preset( &p_sys->param, psz_preset, psz_tune );
@@ -142,7 +140,7 @@ index be5d0006de..96a4b08524 100644
  #endif
      free( psz_preset );
      free( psz_tune );
-@@ -1045,10 +1020,8 @@ static int  Open ( vlc_object_t *p_this )
+@@ -1089,10 +1064,8 @@ static int  Open ( vlc_object_t *p_this )
      if( fabs( var_GetFloat( p_enc, SOUT_CFG_PREFIX "aq-strength" ) - 1.0) > 0.005 )
         p_sys->param.rc.f_aq_strength = var_GetFloat( p_enc, SOUT_CFG_PREFIX "aq-strength" );
  
@@ -153,7 +151,7 @@ index be5d0006de..96a4b08524 100644
  
      if( var_GetBool( p_enc, SOUT_CFG_PREFIX "verbose" ) )
          p_sys->param.i_log_level = X264_LOG_DEBUG;
-@@ -1064,26 +1037,14 @@ static int  Open ( vlc_object_t *p_this )
+@@ -1108,26 +1081,14 @@ static int  Open ( vlc_object_t *p_this )
  
      i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "keyint" );
      if( i_val > 0 && i_val != 250 ) p_sys->param.i_keyint_max = i_val;
@@ -181,7 +179,7 @@ index be5d0006de..96a4b08524 100644
      i_val = var_GetInteger( p_enc, SOUT_CFG_PREFIX "bframes" );
      if( i_val >= 0 && i_val <= 16 && i_val != 3 )
          p_sys->param.i_bframe = i_val;
-@@ -1121,14 +1082,12 @@ static int  Open ( vlc_object_t *p_this )
+@@ -1165,14 +1126,12 @@ static int  Open ( vlc_object_t *p_this )
      if( i_val >= 1 && i_val != 7 )
          p_sys->param.analyse.i_subpel_refine = i_val;
  
@@ -196,7 +194,7 @@ index be5d0006de..96a4b08524 100644
  
      //TODO: psz_val == NULL ?
      psz_val = var_GetString( p_enc, SOUT_CFG_PREFIX "me" );
-@@ -1486,11 +1445,7 @@ static block_t *Encode( encoder_t *p_enc, picture_t *p_pict )
+@@ -1531,11 +1490,7 @@ static block_t *Encode( encoder_t *p_enc, picture_t *p_pict )
      int i_nal=0, i_out=0, i=0;
  
      /* init pic */
@@ -208,6 +206,3 @@ index be5d0006de..96a4b08524 100644
      if( likely(p_pict) ) {
         pic.i_pts = p_pict->date;
         pic.img.i_csp = p_sys->i_colorspace;
--- 
-2.14.3
-
diff --git a/package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch b/package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
deleted file mode 100644
index 8f12f5325e..0000000000
--- a/package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 55e3ac26c1238df4c85877c32763a02c00da1345 Mon Sep 17 00:00:00 2001
-From: Thomas Guillem <thomas@gllm.fr>
-Date: Thu, 30 Apr 2015 13:29:50 +0200
-Subject: [PATCH] Fix build when using C99 and C++11
-
-Fix build when using C99 and C++11
-
-Indeed, C99 doesn't have static_assert and C++11 has it.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/vlc_fixups.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
-index 997f600d6a..0d4fcd0c8d 100644
---- a/include/vlc_fixups.h
-+++ b/include/vlc_fixups.h
-@@ -239,7 +239,7 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
- }
- #endif
- 
--#if !defined (HAVE_STATIC_ASSERT)
-+#if !defined (HAVE_STATIC_ASSERT) && !defined(__cpp_static_assert)
- # define _Static_assert(x, s) ((void) sizeof (struct { unsigned:-!(x); }))
- # define static_assert _Static_assert
- #endif
--- 
-2.14.3
-
diff --git a/package/vlc/0010-freerdp-2.patch b/package/vlc/0010-freerdp-2.patch
new file mode 100644
index 0000000000..98dead8fad
--- /dev/null
+++ b/package/vlc/0010-freerdp-2.patch
@@ -0,0 +1,138 @@
+Add support for freerdp2
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/media-video/vlc/files/vlc-2.2.8-freerdp-2.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -1957,7 +1957,7 @@ PKG_ENABLE_MODULES_VLC([VNC], [vnc], [li
+ 
+ dnl  RDP/Remote Desktop access module
+ dnl
+-PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp >= 1.0.1], (RDP/Remote Desktop client support) )
++PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp2 >= 1.0.1], (RDP/Remote Desktop client support) )
+ 
+ dnl
+ dnl  Real RTSP plugin
+--- a/modules/access/rdp.c	2017-12-25 17:45:32.964429170 +0100
++++ b/modules/access/rdp.c	2017-12-25 17:53:15.114093670 +0100
+@@ -45,18 +45,6 @@
+ # include <freerdp/version.h>
+ #endif
+ 
+-#if !defined(FREERDP_VERSION_MAJOR) || \
+-    (defined(FREERDP_VERSION_MAJOR) && !(FREERDP_VERSION_MAJOR > 1 || (FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR >= 1)))
+-# define SoftwareGdi sw_gdi
+-# define Fullscreen fullscreen
+-# define ServerHostname hostname
+-# define Username username
+-# define Password password
+-# define ServerPort port
+-# define EncryptionMethods encryption
+-# define ContextSize context_size
+-#endif
+-
+ #include <errno.h>
+ #ifdef HAVE_POLL
+ # include <poll.h>
+@@ -140,6 +128,7 @@
+     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
+     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
+     rdpGdi *p_gdi = p_context->gdi;
++    unsigned bytesPerPixel;
+ 
+     if ( p_sys->es )
+     {
+@@ -149,19 +138,23 @@
+ 
+     /* Now init and fill es format */
+     vlc_fourcc_t i_chroma;
+-    switch( p_gdi->bytesPerPixel )
++    switch( p_gdi->dstFormat )
+     {
+         default:
+-        case 16:
++            msg_Dbg( p_vlccontext->p_demux, "unhandled dstFormat %x bpp", p_gdi->dstFormat);
++        case PIXEL_FORMAT_BGR16:
+             i_chroma = VLC_CODEC_RGB16;
++            bytesPerPixel = 16;
+             break;
+-        case 24:
++        case PIXEL_FORMAT_BGR24:
+             i_chroma = VLC_CODEC_RGB24;
++            bytesPerPixel = 24;
+             break;
+-        case 32:
++        case PIXEL_FORMAT_BGRA32:
+             i_chroma = VLC_CODEC_RGB32;
++            bytesPerPixel = 32;
+             break;
+     }
+     es_format_t fmt;
+     es_format_Init( &fmt, VIDEO_ES, i_chroma );
+ 
+@@ -172,7 +165,7 @@
+     fmt.video.i_height = p_gdi->height;
+     fmt.video.i_frame_rate_base = 1000;
+     fmt.video.i_frame_rate = 1000 * p_sys->f_fps;
+-    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * p_gdi->bytesPerPixel;
++    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * bytesPerPixel;
+ 
+     if ( p_sys->p_block )
+         p_sys->p_block = block_Realloc( p_sys->p_block, 0, p_sys->i_framebuffersize );
+@@ -233,28 +226,19 @@
+     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
+ 
+     msg_Dbg( p_vlccontext->p_demux, "connected to desktop %dx%d (%d bpp)",
+-#if defined(FREERDP_VERSION_MAJOR) && (FREERDP_VERSION_MAJOR > 1 || (FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR >= 1))
+              p_instance->settings->DesktopWidth,
+              p_instance->settings->DesktopHeight,
+              p_instance->settings->ColorDepth
+-#else
+-             p_instance->settings->width,
+-             p_instance->settings->height,
+-             p_instance->settings->color_depth
+-#endif
+              );
+ 
+     p_instance->update->DesktopResize = desktopResizeHandler;
+     p_instance->update->BeginPaint = beginPaintHandler;
+     p_instance->update->EndPaint = endPaintHandler;
+ 
+-    gdi_init( p_instance,
+-                CLRBUF_16BPP |
+-#if defined(FREERDP_VERSION_MAJOR) && defined(FREERDP_VERSION_MINOR) && \
+-    !(FREERDP_VERSION_MAJOR > 1 || (FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR >= 2))
+-                CLRBUF_24BPP |
+-#endif
+-                CLRBUF_32BPP, NULL );
++    if ( p_instance->settings->ColorDepth > 16 )
++        gdi_init( p_instance, PIXEL_FORMAT_XRGB32);
++    else
++        gdi_init( p_instance, PIXEL_FORMAT_RGB16);
+ 
+     desktopResizeHandler( p_instance->context );
+     return true;
+@@ -428,10 +412,6 @@
+     if ( p_sys->f_fps <= 0 ) p_sys->f_fps = 1.0;
+     p_sys->i_frame_interval = 1000000 / p_sys->f_fps;
+ 
+-#if FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR < 2
+-    freerdp_channels_global_init();
+-#endif
+-
+     p_sys->p_instance = freerdp_new();
+     if ( !p_sys->p_instance )
+     {
+@@ -506,9 +486,6 @@
+ 
+     freerdp_disconnect( p_sys->p_instance );
+     freerdp_free( p_sys->p_instance );
+-#if FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR < 2
+-    freerdp_channels_global_uninit();
+-#endif
+ 
+     if ( p_sys->p_block )
+         block_Release( p_sys->p_block );
diff --git a/package/vlc/0011-compat-fix-static_assert.patch b/package/vlc/0011-compat-fix-static_assert.patch
deleted file mode 100644
index 7ad2414e46..0000000000
--- a/package/vlc/0011-compat-fix-static_assert.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6b9c7e7595f8e36d3b221bedb623fa5334f62ce0 Mon Sep 17 00:00:00 2001
-From: Thomas Guillem <thomas@gllm.fr>
-Date: Mon, 14 Dec 2015 09:08:25 +0100
-Subject: [PATCH] compat: fix static_assert
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-compat: fix static_assert
-
-It was not possible to use it outside of functions.
-
-Signed-off-by: R?mi Denis-Courmont <remi@remlab.net>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/vlc_fixups.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
-index 0d4fcd0c8d..0990915e5f 100644
---- a/include/vlc_fixups.h
-+++ b/include/vlc_fixups.h
-@@ -240,7 +240,9 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
- #endif
- 
- #if !defined (HAVE_STATIC_ASSERT) && !defined(__cpp_static_assert)
--# define _Static_assert(x, s) ((void) sizeof (struct { unsigned:-!(x); }))
-+# define STATIC_ASSERT_CONCAT_(a, b) a##b
-+# define STATIC_ASSERT_CONCAT(a, b) STATIC_ASSERT_CONCAT_(a, b)
-+# define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
- # define static_assert _Static_assert
- #endif
- 
--- 
-2.14.3
-
diff --git a/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch b/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
deleted file mode 100644
index 58ae02e35c..0000000000
--- a/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7ce9c408aea03da5787d952747df3be687c92da1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Dec 2017 12:26:33 +0100
-Subject: [PATCH] Fix build with libupnp above 1.6.23
-
-Starting from this release, libupnp has its own compat functions,
-backport patch from mainstream:
-https://github.com/videolan/vlc/commit/f9c5a343f1a8cad9c2c153f9c05e4e7201675a43#diff-2e66eb8b4fb06845a6426bd4a541d2f7
-
-Move UpnpEventPtr declaration in upnp.hpp as done in:
-https://github.com/videolan/vlc/commit/3eb4e03512f45c1fa27c7f9a6759e8e7d3905720#diff-ac39568c5e5e1c68776a93dfe0b3c1e6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/services_discovery/upnp.cpp | 5 +----
- modules/services_discovery/upnp.hpp | 6 ++++++
- 2 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/modules/services_discovery/upnp.cpp b/modules/services_discovery/upnp.cpp
-index 9b6ed8727a..cf846602b8 100644
---- a/modules/services_discovery/upnp.cpp
-+++ b/modules/services_discovery/upnp.cpp
-@@ -40,11 +40,10 @@
- #include <assert.h>
- #include <limits.h>
- 
--#if UPNP_VERSION < 10800
-+#if UPNP_VERSION < 10623
- /*
-  * Compat functions and typedefs for libupnp prior to 1.8
-  */
--typedef void* UpnpEventPtr;
- typedef Upnp_Discovery UpnpDiscovery;
- typedef Upnp_Action_Complete UpnpActionComplete;
- typedef Upnp_Event UpnpEvent;
-@@ -74,8 +73,6 @@ static const char* UpnpEventSubscribe_get_SID_cstr( const UpnpEventSubscribe* p_
- {
-   return p_s->Sid;
- }
--#else
--typedef const void* UpnpEventPtr;
- #endif
- 
- /*
-diff --git a/modules/services_discovery/upnp.hpp b/modules/services_discovery/upnp.hpp
-index 23fe4db9ab..c369a04da6 100644
---- a/modules/services_discovery/upnp.hpp
-+++ b/modules/services_discovery/upnp.hpp
-@@ -33,6 +33,12 @@
- 
- #include <vlc_common.h>
- 
-+#if UPNP_VERSION < 10800
-+typedef void* UpnpEventPtr;
-+#else
-+typedef const void* UpnpEventPtr;
-+#endif
-+
- // Classes
- class Container;
- 
--- 
-2.14.3
-
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 78769ac27b..70e1ca41a1 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
@@ -27,7 +28,9 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 
-comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
+comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 02b70ef943..ee1b0862fe 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,8 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.8/vlc-2.2.8.tar.xz.sha256
-sha256 9bf046848fb56d93518881b39099b8288ee005d5ba0ddf705b6f6643b8d562ec vlc-2.2.8.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/2.2.8/vlc-2.2.8.tar.xz.sha1
-sha1 b960ec5bdb9a51da285430fc68962927ccc87187 vlc-2.2.8.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/2.2.8/vlc-2.2.8.tar.xz.md5
-md5 b721fddf65aaf64eeee5629aa9bf7c9e vlc-2.2.8.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.3/vlc-3.0.3.tar.xz.sha256
+sha256 9ba8b04bdb13f7860a2041768ac83b47b397a36549c71c530b94028a3cfd5b51 vlc-3.0.3.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.3/vlc-3.0.3.tar.xz.sha1
+sha1 dd1b7350bb0a7848e172e9dbbe0705ec5bb3d48c vlc-3.0.3.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.3/vlc-3.0.3.tar.xz.md5
+md5 cf01d4755c719fe1c8605ceb40d8f1d2 vlc-3.0.3.tar.xz
+# Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9a8ee56256..91e96516ac 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.8
+VLC_VERSION = 3.0.3
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -22,6 +22,10 @@ VLC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
 VLC_CONF_OPTS += --disable-optimizations
 endif
 
+# configure check for -fstack-protector-strong is broken
+VLC_CONF_ENV += \
+	ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+
 # VLC defines two autoconf functions which are also defined by our own pkg.m4
 # from pkgconf. Unfortunately, they are defined in a different way: VLC adds
 # --enable- options, but pkg.m4 adds --with- options. To make sure we use
@@ -36,25 +40,59 @@ VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
 VLC_CONF_OPTS += \
 	--disable-a52 \
 	--disable-addonmanagermodules \
+	--disable-aom \
+	--disable-archive \
+	--disable-aribb25 \
+	--disable-aribsub \
+	--disable-asdcp \
+	--disable-bpg \
 	--disable-caca \
 	--disable-chromaprint \
+	--disable-chromecast \
+	--disable-crystalhd \
+	--disable-dc1394 \
 	--disable-dca \
+	--disable-decklink \
+	--disable-dsm \
+	--disable-dv1394 \
+	--disable-fluidlite \
 	--disable-fluidsynth \
-	--disable-gles1 \
+	--disable-gme \
 	--disable-goom \
+	--disable-gst-decode \
+	--disable-harfbuzz \
 	--disable-jack \
 	--disable-jpeg \
+	--disable-kai \
 	--disable-kate \
+	--disable-kva \
+	--disable-libplacebo \
+	--disable-libva \
+	--disable-linsys \
 	--disable-mfx \
-	--disable-mmal-codec \
-	--disable-mmal-vout \
+	--disable-microdns \
+	--disable-mmal \
+	--disable-mpg123 \
 	--disable-mtp \
+	--disable-nfs \
+	--disable-notify \
 	--disable-projectm \
 	--disable-schroedinger \
+	--disable-secret \
+	--disable-soxr \
+	--disable-shine \
 	--disable-shout \
+	--disable-skins2 \
+	--disable-sndio \
+	--disable-spatialaudio \
+	--disable-srt \
+	--disable-telx \
+	--disable-tiger \
 	--disable-twolame \
 	--disable-vdpau \
 	--disable-vsxu \
+	--disable-wasapi \
+	--disable-wayland \
 	--disable-x262 \
 	--disable-zvbi \
 	--enable-run-as-root
@@ -88,12 +126,12 @@ else
 VLC_CONF_OPTS += --disable-alsa
 endif
 
-# bonjour support needs avahi-client, which needs avahi-daemon and dbus
+# avahi support needs avahi-client, which needs avahi-daemon and dbus
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
-VLC_CONF_OPTS += --enable-bonjour
-VLC_DEPENDENCIES += avahi dbus
+VLC_CONF_OPTS += --enable-avahi
+VLC_DEPENDENCIES += avahi
 else
-VLC_CONF_OPTS += --disable-bonjour
+VLC_CONF_OPTS += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
@@ -103,14 +141,6 @@ else
 VLC_CONF_OPTS += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-VLC_CONF_OPTS += --enable-directfb
-VLC_CONF_ENV += ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-VLC_DEPENDENCIES += directfb
-else
-VLC_CONF_OPTS += --disable-directfb
-endif
-
 ifeq ($(BR2_PACKAGE_FAAD2),y)
 VLC_CONF_OPTS += --enable-faad
 VLC_DEPENDENCIES += faad2
@@ -145,7 +175,10 @@ VLC_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_FREERDP),y)
+VLC_CONF_OPTS += --enable-freerdp
 VLC_DEPENDENCIES += freerdp
+else
+VLC_CONF_OPTS += --disable-freerdp
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -240,10 +273,10 @@ VLC_CONF_OPTS += --disable-mad
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMATROSKA),y)
-VLC_CONF_OPTS += --enable-mkv
+VLC_CONF_OPTS += --enable-matroska
 VLC_DEPENDENCIES += libmatroska
 else
-VLC_CONF_OPTS += --disable-mkv
+VLC_CONF_OPTS += --disable-matroska
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
@@ -398,24 +431,13 @@ else
 VLC_CONF_OPTS += --disable-pulse
 endif
 
-ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
+ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS)$(BR2_PACKAGE_QT5SVG),yy)
 VLC_CONF_OPTS += --enable-qt
-VLC_CONF_ENV += \
-	ac_cv_path_MOC=$(HOST_DIR)/bin/moc \
-	ac_cv_path_RCC=$(HOST_DIR)/bin/rcc \
-	ac_cv_path_UIC=$(HOST_DIR)/bin/uic
-VLC_DEPENDENCIES += qt
+VLC_DEPENDENCIES += qt5base qt5svg
 else
 VLC_CONF_OPTS += --disable-qt
 endif
 
-ifeq ($(BR2_PACKAGE_SDL_X11),y)
-VLC_CONF_OPTS += --enable-sdl
-VLC_DEPENDENCIES += sdl
-else
-VLC_CONF_OPTS += --disable-sdl
-endif
-
 ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
 VLC_CONF_OPTS += --enable-sdl-image
 VLC_DEPENDENCIES += sdl_image
@@ -473,10 +495,7 @@ VLC_CONF_OPTS += --disable-x265
 endif
 
 ifeq ($(BR2_PACKAGE_XCB_UTIL_KEYSYMS),y)
-VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += xcb-util-keysyms
-else
-VLC_CONF_OPTS += --disable-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-- 
2.18.0
