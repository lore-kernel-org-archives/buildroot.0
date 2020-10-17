From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:26:50 +0200
Subject: [Buildroot] [git commit] package/transmission: bump version to 3.00
Message-ID: <20201017121520.3CB9682AB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38c8e3201b1866edd789ec20343141ab4ec50301
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patched applied upstream, reformatted hashes.

Updated license hash due to copyright update to 2020:
https://github.com/transmission/transmission/commit/2d940e5cafe01a6ea9285b7d39ccada6e90afab1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ince-1.0.18-has-sys-quota.h-synced-with-G.patch |  29 -----
 package/transmission/0005-libsystemd.patch         | 133 ---------------------
 package/transmission/transmission.hash             |   4 +-
 package/transmission/transmission.mk               |   2 +-
 4 files changed, 3 insertions(+), 165 deletions(-)

diff --git a/package/transmission/0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch b/package/transmission/0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
deleted file mode 100644
index 91a962a6d8..0000000000
--- a/package/transmission/0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8682fe1bad44acc06154003ca9c9163b917bf4e3 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Thu, 29 Sep 2016 19:52:49 +0200
-Subject: [PATCH] uClibc-ng since 1.0.18 has sys/quota.h synced with GNU libc
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
-
-Pull Request:
-https://github.com/transmission/transmission/pull/42
----
- libtransmission/platform-quota.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libtransmission/platform-quota.c b/libtransmission/platform-quota.c
-index 58c518a..57377ef 100644
---- a/libtransmission/platform-quota.c
-+++ b/libtransmission/platform-quota.c
-@@ -284,7 +284,7 @@ getquota (const char * device)
-       spaceused = (int64_t) dq.dqb_curblocks >> 1;
- #elif defined(__APPLE__)
-       spaceused = (int64_t) dq.dqb_curbytes;
--#elif defined(__UCLIBC__)
-+#elif defined(__UCLIBC__) && (__UCLIBC_MAJOR__ == 0 || (__UCLIBC_MAJOR__ == 1 && __UCLIBC_SUBLEVEL__ <= 17))
-       spaceused = (int64_t) btodb(dq.dqb_curblocks);
- #elif defined(__sun) || (defined(_LINUX_QUOTA_VERSION) && _LINUX_QUOTA_VERSION < 2)
-       spaceused = (int64_t) dq.dqb_curblocks >> 1;
--- 
-2.1.4
-
diff --git a/package/transmission/0005-libsystemd.patch b/package/transmission/0005-libsystemd.patch
deleted file mode 100644
index b32aff211d..0000000000
--- a/package/transmission/0005-libsystemd.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 0862099d0bf5a3ec8b2e9d538458d612897741a2 Mon Sep 17 00:00:00 2001
-From: Mike Gelfand <mikedld@mikedld.com>
-Date: Sat, 23 Apr 2016 16:13:25 +0000
-Subject: [PATCH] #5921: Use libsystemd instead of libsystemd-daemon (original
- patches by Sandro Tosi and Mike Gilbert)
-
-In systemd v209, released over two years ago, the various libsystemd-*
-libraries (libsystemd-journal.so, libsystemd-login.so, libsystem-daemon.so,
-libsystemd-id128.so) were merged into a single libsystemd.so library to
-reduce code duplication and avoid cyclic dependencies.
-
-Downloaded from upstream commit:
-https://github.com/transmission/transmission/commit/0862099d0bf5a3ec8b2e9d538458d612897741a2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt        |  4 ++--
- configure.ac          | 16 ++++++++--------
- daemon/CMakeLists.txt |  8 ++++----
- daemon/Makefile.am    |  4 ++--
- daemon/daemon.c       |  2 +-
- 5 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8b324dc..356fc2f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -398,9 +398,9 @@ endif()
- if(WITH_SYSTEMD)
-     tr_get_required_flag(WITH_SYSTEMD SYSTEMD_IS_REQUIRED)
- 
--    pkg_check_modules(SYSTEMD_DAEMON ${SYSTEMD_IS_REQUIRED} libsystemd-daemon)
-+    pkg_check_modules(SYSTEMD ${SYSTEMD_IS_REQUIRED} libsystemd)
- 
--    tr_fixup_auto_option(WITH_SYSTEMD SYSTEMD_DAEMON_FOUND SYSTEMD_IS_REQUIRED)
-+    tr_fixup_auto_option(WITH_SYSTEMD SYSTEMD_FOUND SYSTEMD_IS_REQUIRED)
- endif()
- 
- include_directories(${CMAKE_BINARY_DIR})
-diff --git a/configure.ac b/configure.ac
-index 92e4372..b64f2a3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -240,15 +240,15 @@ dnl
- dnl file monitoring for the daemon
- 
- # Check whether to enable systemd startup notification.
--# This requires libsystemd-daemon.
--AC_ARG_WITH([systemd-daemon], AS_HELP_STRING([--with-systemd-daemon],
-+# This requires libsystemd.
-+AC_ARG_WITH([systemd], AS_HELP_STRING([--with-systemd],
-             [Add support for systemd startup notification (default is autodetected)]),
--            [USE_SYSTEMD_DAEMON=$withval], [USE_SYSTEMD_DAEMON=auto])
--AS_IF([test "x$USE_SYSTEMD_DAEMON" != "xno"], [
--    PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd-daemon],
--        [AC_DEFINE(USE_SYSTEMD_DAEMON,1,[Use systemd startup notification])],
--        [AS_IF([test "x$USE_SYSTEMD_DAEMON" = "xyes"],
--            [AC_MSG_ERROR([systemd startup notification support requested, but libsystemd-daemon not found.])]
-+            [USE_SYSTEMD=$withval], [USE_SYSTEMD=auto])
-+AS_IF([test "x$USE_SYSTEMD" != "xno"], [
-+    PKG_CHECK_MODULES([SYSTEMD], [libsystemd],
-+        [AC_DEFINE(USE_SYSTEMD,1,[Use systemd startup notification])],
-+        [AS_IF([test "x$USE_SYSTEMD" = "xyes"],
-+            [AC_MSG_ERROR([systemd startup notification support requested, but libsystemd not found.])]
-         )]
-     )
- ])
-diff --git a/daemon/CMakeLists.txt b/daemon/CMakeLists.txt
-index e8f8b34..8ec3b95 100644
---- a/daemon/CMakeLists.txt
-+++ b/daemon/CMakeLists.txt
-@@ -1,7 +1,7 @@
- project(trdaemon)
- 
- if(WITH_SYSTEMD)
--    add_definitions(-DUSE_SYSTEMD_DAEMON)
-+    add_definitions(-DUSE_SYSTEMD)
- endif()
- 
- include_directories(
-@@ -37,14 +37,14 @@ add_executable(${TR_NAME}-daemon
-     ${${PROJECT_NAME}_WIN32_RC_FILE})
- 
- set_target_properties(${TR_NAME}-daemon PROPERTIES
--    COMPILE_FLAGS "${SYSTEMD_DAEMON_CFLAGS}"
--    LINK_FLAGS "${SYSTEMD_DAEMON_LDFLAGS}"
-+    COMPILE_FLAGS "${SYSTEMD_CFLAGS}"
-+    LINK_FLAGS "${SYSTEMD_LDFLAGS}"
- )
- 
- target_link_libraries(${TR_NAME}-daemon
-     ${TR_NAME}
-     ${EVENT2_LIBRARIES}
--    ${SYSTEMD_DAEMON_LIBRARIES}
-+    ${SYSTEMD_LIBRARIES}
- )
- 
- tr_win32_app_info(${PROJECT_NAME}_remote_WIN32_RC_FILE
-diff --git a/daemon/Makefile.am b/daemon/Makefile.am
-index 677f765..34d7076 100644
---- a/daemon/Makefile.am
-+++ b/daemon/Makefile.am
-@@ -3,7 +3,7 @@ AM_CPPFLAGS = -I at top_srcdir@ -DEMBEDDED
- AM_CFLAGS = \
-     @LIBEVENT_CFLAGS@ \
-     @LIBCURL_CFLAGS@ \
--    @SYSTEMD_DAEMON_CFLAGS@ \
-+    @SYSTEMD_CFLAGS@ \
-     @ZLIB_CFLAGS@ \
-     @PTHREAD_CFLAGS@
- 
-@@ -29,7 +29,7 @@ LDADD = \
-     @LIBCURL_LIBS@ \
-     @CRYPTO_LIBS@ \
-     @INTLLIBS@ \
--    @SYSTEMD_DAEMON_LIBS@ \
-+    @SYSTEMD_LIBS@ \
-     @ZLIB_LIBS@ \
-     @PTHREAD_LIBS@ \
-     ${LIBM}
-diff --git a/daemon/daemon.c b/daemon/daemon.c
-index 40ac5a6..62ac715 100644
---- a/daemon/daemon.c
-+++ b/daemon/daemon.c
-@@ -33,7 +33,7 @@
- #include <libtransmission/version.h>
- #include <libtransmission/watchdir.h>
- 
--#ifdef USE_SYSTEMD_DAEMON
-+#ifdef USE_SYSTEMD
-  #include <systemd/sd-daemon.h>
- #else
-  static void sd_notify (int status UNUSED, const char * str UNUSED) { }
diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 0d2af32f4f..13cbc969d3 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 35442cc849f91f8df982c3d0d479d650c6ca19310a994eccdaa79a4af3916b7d  transmission-2.94.tar.xz
-sha256 20801783bf59e27d03ed6aab625b32a34e221ae95bf801db87827c8023398495  COPYING
+sha256  9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2  transmission-3.00.tar.xz
+sha256  2b16da5bd02790d1e4d332cfd42b9dfd7d1b0ed3a16a75dc7e76b6ed239fdba9  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 8fbda5eea3..ff3b41c328 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.94
+TRANSMISSION_VERSION = 3.00
 TRANSMISSION_SITE = https://github.com/transmission/transmission-releases/raw/master
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
