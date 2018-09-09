From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  9 Sep 2018 11:43:17 +0200
Subject: [Buildroot] [PATCH] shairport-sync: add upstream patch to fix soxr
 configure issue
Message-ID: <20180909094317.10873-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.
The patch also adds detecting soxr using pkg-config. Upstream detected
an config issue [1], where the resulting binary lacks soxr support, although
libsoxr was correctly detected.

This patch adds a define for `HAVE_LIBSOXR` when using pkg-config.

Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9

[1] https://github.com/mikebrady/shairport-sync/issues/740

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Should be committed to 2018.02.x and 2018.05.x, too.
---
 ...f-HAVE_LIBSOXR-with-using-pkg_config.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch

diff --git a/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
new file mode 100644
index 0000000000..e10142a201
--- /dev/null
+++ b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
@@ -0,0 +1,34 @@
+From cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9 Mon Sep 17 00:00:00 2001
+From: Mike Brady <mikebrady@eircom.net>
+Date: Sat, 8 Sep 2018 15:06:18 +0100
+Subject: [PATCH] Include a definition of HAVE_LIBSOXR with using pkg_config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.
+The patch also adds detecting soxr using pkg-config. Upstream detected
+a config issue [1], where the resulting binary lacks soxr support, although
+libsoxr was correctly detected.
+
+Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index ceec4af..690a774 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -180,6 +180,7 @@ AC_ARG_WITH(soxr, [  --with-soxr = choose libsoxr for high-quality interpolation
+     PKG_CHECK_MODULES(
+         [SOXR], [soxr],
+         [LIBS="${SOXR_LIBS} ${LIBS}"])
++    AC_DEFINE([HAVE_LIBSOXR],[1],[Define to 1 if you are including support for soxr interpolation])
+   else
+     AC_CHECK_LIB([avutil],[av_get_cpu_flags])
+     if  test "x${ac_cv_lib_avutil_av_get_cpu_flags}" = xyes ; then
+-- 
+2.18.0
-- 
2.18.0
