From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:34:44 +0200
Subject: [Buildroot] [git commit] shairport-sync: add upstream patch to fix
 soxr configure issue
Message-ID: <20180910153519.7D0AD83AC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac4bca24adf2a50d1d9ac858cec26fdcd39578ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e047dee241fe0660d92311a124757065c6c4c93d adds an upstream patch
to fix a build issue with soxr.  The patch also adds detecting soxr
using pkg-config. Upstream detected an config issue [1], where the
resulting binary lacks soxr support, although libsoxr was correctly
detected.

This patch adds a define for `HAVE_LIBSOXR` when using pkg-config.

Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9

[1] https://github.com/mikebrady/shairport-sync/issues/740

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ion-of-HAVE_LIBSOXR-with-using-pkg_config.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
new file mode 100644
index 0000000000..66ce961ab1
--- /dev/null
+++ b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
@@ -0,0 +1,35 @@
+From cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9 Mon Sep 17 00:00:00 2001
+From: Mike Brady <mikebrady@eircom.net>
+Date: Sat, 8 Sep 2018 15:06:18 +0100
+Subject: [PATCH] Include a definition of HAVE_LIBSOXR with using pkg_config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit e047dee241fe0660d92311a124757065c6c4c93d adds an upstream patch
+to fix a build issue with soxr.  The patch also adds detecting soxr
+using pkg-config. Upstream detected a config issue [1], where the
+resulting binary lacks soxr support, although libsoxr was correctly
+detected.
+
+Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
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
