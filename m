From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 14:41:34 +0200
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
 3.2.2
Message-ID: <20190430123739.8AC4883B69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a28f22383f07b7ea96ee1d63ee2fbeadaec5444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches 0001 and 0002 which are included in the new version.

Add hash for the license file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mes-libsoxr-is-built-to-rely-on-libavutil.patch | 63 ----------------------
 ...ion-of-HAVE_LIBSOXR-with-using-pkg_config.patch | 35 ------------
 package/shairport-sync/shairport-sync.hash         |  3 +-
 package/shairport-sync/shairport-sync.mk           |  2 +-
 4 files changed, 3 insertions(+), 100 deletions(-)

diff --git a/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch b/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
deleted file mode 100644
index 32c52add33..0000000000
--- a/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 5101ab2d13e2b89ea3c1276df5fb7413634eeccd Mon Sep 17 00:00:00 2001
-From: Mike Brady <mikebrady@eircom.net>
-Date: Sat, 25 Aug 2018 13:08:37 +0100
-Subject: [PATCH] Sometimes libsoxr is built to rely on libavutil. If libavutil
- is detected, link to it when building libsoxr. Add pgk_config support to soxr
- selection.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The Buildroot autobuilder detected a build issue [0] when building
-shairport-sync statically:
-
-```
-arm-buildroot-linux-uclibcgnueabi/sysroot/usr//lib/libsoxr.a(soxr.c.o): In function `soxr_create':
-soxr.c:(.text+0xd4c): undefined reference to `av_get_cpu_flags'
-collect2: error: ld returned 1 exit status
-```
-
-A quick look at the soxr source code shows that `soxr_create()` might use
-`av_get_cpu_flags()` depending on the architecture.
-
-For the sake of simplicity link with `-lavutil` if it is found when using soxr.
-
-Even better, as soxr provides a pkg-config file, this should be prefered.
-
-[0] http://autobuild.buildroot.org/results/53d/53d21686780aa2485745b59e812b6280dd39f1c5
-
-Upstream status: 5101ab2d13e2b89ea3c1276df5fb7413634eeccd
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0c917a4..2b6fddb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -176,7 +176,20 @@ AC_ARG_WITH(ssl, [ choose --with-ssl=openssl, --with-ssl=mbedtls or --with-ssl=p
- # Look for soxr flag
- AC_ARG_WITH(soxr, [  --with-soxr = choose libsoxr for high-quality interpolation], [
-   AC_MSG_RESULT(>>Including support for soxr-based interpolation)
--  AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!))], )
-+  if  test "x${with_pkg_config}" = xyes ; then
-+    PKG_CHECK_MODULES(
-+        [SOXR], [soxr],
-+        [LIBS="${SOXR_LIBS} ${LIBS}"])
-+  else
-+    AC_CHECK_LIB([avutil],[av_get_cpu_flags])
-+    if  test "x${ac_cv_lib_avutil_av_get_cpu_flags}" = xyes ; then
-+      # soxr may link against libavutil, depending on the architecture, but for the sake of simplicity link with it if it is found
-+      AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!), [-lavutil])
-+    else
-+      AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!))
-+    fi
-+  fi
-+], )
- 
- # Look for metadata flag -- set flag for conditional compilation
- AC_ARG_WITH(metadata, [  --with-metadata = include support for a metadata feed], [
--- 
-2.18.0
diff --git a/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
deleted file mode 100644
index 66ce961ab1..0000000000
--- a/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9 Mon Sep 17 00:00:00 2001
-From: Mike Brady <mikebrady@eircom.net>
-Date: Sat, 8 Sep 2018 15:06:18 +0100
-Subject: [PATCH] Include a definition of HAVE_LIBSOXR with using pkg_config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit e047dee241fe0660d92311a124757065c6c4c93d adds an upstream patch
-to fix a build issue with soxr.  The patch also adds detecting soxr
-using pkg-config. Upstream detected a config issue [1], where the
-resulting binary lacks soxr support, although libsoxr was correctly
-detected.
-
-Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index ceec4af..690a774 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -180,6 +180,7 @@ AC_ARG_WITH(soxr, [  --with-soxr = choose libsoxr for high-quality interpolation
-     PKG_CHECK_MODULES(
-         [SOXR], [soxr],
-         [LIBS="${SOXR_LIBS} ${LIBS}"])
-+    AC_DEFINE([HAVE_LIBSOXR],[1],[Define to 1 if you are including support for soxr interpolation])
-   else
-     AC_CHECK_LIB([avutil],[av_get_cpu_flags])
-     if  test "x${ac_cv_lib_avutil_av_get_cpu_flags}" = xyes ; then
--- 
-2.18.0
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 076f0a2132..6f73d109e4 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  1fe16856ec828704b086c571038a3b2eb907a3cf0a3847ed1b721b517554659d  shairport-sync-3.2.1.tar.gz
+sha256  4f1ee142b887842727ae0c310e21c83ea2386518e841a25c7ddb015d08b54eba  shairport-sync-3.2.2.tar.gz
+sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index f1857b0dae..5f93f1b8ea 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.2.1
+SHAIRPORT_SYNC_VERSION = 3.2.2
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
