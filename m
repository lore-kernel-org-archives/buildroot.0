From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:19:33 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.12.0
Message-ID: <20181023231921.D1CA388651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c00304913bcbdb6b0b41af0e164e173a6cd7d329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches:
- 0001 not needed anymore after upstream commits
https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=11b230ba61c00c69b23c5be592cf88492113355e
https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=9d62b878ce40d9b5f7887c63a4e2498a52253c36

- 0002 was applied upstream
https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=c4c878d2ccb75fa75afe46e0e50ee9975c5c57fc

Added license hash and all tarball hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-cross-compile.patch                       | 50 ----------------------
 .../0002-include-stdint-h.patch                    | 34 ---------------
 .../xdriver_xf86-video-r128.hash                   |  9 +++-
 .../xdriver_xf86-video-r128.mk                     |  3 +-
 4 files changed, 8 insertions(+), 88 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch b/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
deleted file mode 100644
index 7b2ebd4b80..0000000000
--- a/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Fix cross-compile
-
-Original patch for DRI
-http://git.buildroot.net/buildroot/commit/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch?id=c0726391523da6a17ffa8e62681ffa0cc895da8e
-
-Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
-(Added exa.h fix)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
-+++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--	AC_CHECK_FILE([${sdkdir}/dri.h],
-+ 	if test "$cross_compiling" = "no" ; then
-+		AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--	AC_CHECK_FILE([${sdkdir}/sarea.h],
-+		AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--	AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
--	AC_CHECK_FILE([${sdkdir}/damage.h],
-+		AC_CHECK_FILE([${sdkdir}/damage.h],
-                       [have_damage_h="yes"], [have_damage_h="no"])
-+ 	else
-+ 		have_dri_h="yes"
-+ 		have_sarea_h="yes"
-+ 		have_dristruct_h="yes"
-+ 	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
-@@ -121,7 +127,12 @@
- AC_MSG_CHECKING([whether to enable EXA support])
- if test "x$EXA" = xyes; then
-         AC_MSG_RESULT(yes)
--        AC_CHECK_FILE(${sdkdir}/exa.h, [have_exa_h="yes"], [have_exa_h="no"])
-+	if test "$cross_compiling" = "no" ; then
-+		AC_CHECK_FILE(${sdkdir}/exa.h,
-+                      [have_exa_h="yes"], [have_exa_h="no"])
-+	else
-+		have_exa_h="yes"
-+	fi
- else
-         AC_MSG_RESULT(no)
- fi
diff --git a/package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch b/package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch
deleted file mode 100644
index 4c15915b26..0000000000
--- a/package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c4c878d2ccb75fa75afe46e0e50ee9975c5c57fc Mon Sep 17 00:00:00 2001
-From: Stefan Dirsch <sndirsch@suse.de>
-Date: Mon, 25 Jun 2018 15:57:02 +0200
-Subject: Include <stdint.h> in order to declare uint32_t
-
-Apparently this is needed in src/atipcirename.h since xorg-server
-1.20 in order to still build this driver.
-
-Signed-off-by: Stefan Dirsch <sndirsch@suse.de>
-Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=c4c878d2ccb75fa75afe46e0e50ee9975c5c57fc
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/atipcirename.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/atipcirename.h b/src/atipcirename.h
-index e65ae3c..3e7f686 100644
---- a/src/atipcirename.h
-+++ b/src/atipcirename.h
-@@ -34,6 +34,7 @@ enum region_type {
-     REGION_IO 
- };
- 
-+#include <stdint.h>
- #include "xf86Module.h"
- 
- #if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) >= 12
--- 
-cgit v1.1
-
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index b6d8bd8197..eee2865094 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002764.html
-sha256 84da21517f3af7617fdf341e84ccb22444d6cdab1647e4808fa631528b9a77de  xf86-video-r128-6.10.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-October/002926.html
+md5 105ebcfe1bac06fe84645ac3def91184  xf86-video-r128-6.12.0.tar.bz2
+sha1 7cfa41d386fa43b5d30299203e4845d8afba4899  xf86-video-r128-6.12.0.tar.bz2
+sha256 801c86882cbd2bbb3084d471dcc5cfee2c1754dcbfb4dc446676d58a6bd9e057  xf86-video-r128-6.12.0.tar.bz2
+sha512 0e667e2cfa8a87a00846361d86528c93754c403c812b66798953fa4c857b2143b2c4c44885da467e7f910d8cb910b69492cdcb6f25e2197bae6617364d152e38  xf86-video-r128-6.12.0.tar.bz2
+# Locally computed
+sha256 69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 9dd9ef25e4..455cfbad86 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.10.2
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.0
 XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
