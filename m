From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 00:40:53 +0100
Subject: [Buildroot] [git commit] gst-fsl-plugins: add missing librt linking
	for libgstfsl.
Message-ID: <20140224234126.9AEF79BA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=744c215a0a462ca6b8a9903d4a4239fee1680467
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes runtime failure of gst-fsl-plugins, e.g.

(gst-plugin-scanner:1700): GStreamer-WARNING **: Failed to load
        plugin '/usr/lib/gstreamer-0.10/libmfw_vpu.so':
        /usr/lib/libgstfsl-0.10.so.0: undefined symbol: shm_open)

when compiled with buildroot/glibc toolchain.

See also old buildroot mailing list request [1].

[1] http://lists.busybox.net/pipermail/buildroot/2013-June/073910.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sl-linkage-add-lrt-for-shared-memory-func.patch |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
new file mode 100644
index 0000000..863f1b6
--- /dev/null
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
@@ -0,0 +1,46 @@
+From 1ca4251d1284f2cb56e31aaec4d369809e2139c9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 24 Feb 2014 16:30:39 +0100
+Subject: [PATCH] Fix libgstfsl linkage (add -lrt for shared memory functions).
+
+Fixes runtime failure of gst-fsl-plugins, e.g.:
+(gst-plugin-scanner:1700): GStreamer-WARNING **: Failed to load
+	plugin '/usr/lib/gstreamer-0.10/libmfw_vpu.so':
+	/usr/lib/libgstfsl-0.10.so.0: undefined symbol: shm_open)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac     | 3 +++
+ libs/Makefile.am | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f7907a7..9f834df 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -173,6 +173,9 @@ AC_CHECK_LIB(ipu, mxc_ipu_lib_task_init, [IPU_LIBS=-lipu], [echo "No libipu arou
+ AC_SUBST(IPU_CFLAGS)
+ AC_SUBST(IPU_LIBS)
+ 
++AC_SEARCH_LIBS([shm_open], [rt], [SHM_LIBS="-lrt"])
++AC_SUBST(SHM_LIBS)
++
+ FSL_MM_CORE_CFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec 2>/dev/null`
+ FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`"
+ FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslparser 2>/dev/null`"
+diff --git a/libs/Makefile.am b/libs/Makefile.am
+index a68fd4b..7b19b92 100755
+--- a/libs/Makefile.am
++++ b/libs/Makefile.am
+@@ -12,7 +12,7 @@ libgstfsl_ at GST_MAJORMINOR@_la_SOURCES = \
+ 
+ libgstfsl_ at GST_MAJORMINOR@_la_CFLAGS  = $(GST_BASE_CFLAGS) $(IPU_CFLAGS) -I../inc/common
+ libgstfsl_ at GST_MAJORMINOR@_la_LDFLAGS = -version-info @GSTMXLIBS_VERSION@
+-libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS)
++libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(SHM_LIBS)
+ 
+ libgstfsl_ at GST_MAJORMINOR@includedir = $(includedir)/gstreamer- at GST_MAJORMINOR@/gst/imx-mm
+ libgstfsl_ at GST_MAJORMINOR@include_HEADERS = \
+-- 
+1.8.1.4
+
