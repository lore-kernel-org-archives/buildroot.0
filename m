From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:35:22 +0200
Subject: [Buildroot] [git commit] gst-fsl-plugins: Refresh one patch to fix
	build
Message-ID: <20140406123648.99A3B9C5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55cd252cc02333948debad6d3f9ed4b384d14344
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following patch application error when building for i.MX6:

  Applying gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch using patch:
  patching file configure.ac
  Hunk #1 succeeded at 178 with fuzz 2 (offset 5 lines).
  patching file libs/Makefile.am
  Hunk #1 FAILED at 12.
  1 out of 1 hunk FAILED -- saving rejects to file libs/Makefile.am.rej
  Patch failed!  Please fix gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch!

Signed-off-by: Vincent Stehl?? <vincent.stehle@freescale.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Eric Nelson <eric.nelson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...sl-linkage-add-lrt-for-shared-memory-func.patch |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
index 863f1b6..e58467e 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
@@ -15,7 +15,7 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  2 files changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f7907a7..9f834df 100755
+index a5d1655..7b5a7a6 100755
 --- a/configure.ac
 +++ b/configure.ac
 @@ -173,6 +173,9 @@ AC_CHECK_LIB(ipu, mxc_ipu_lib_task_init, [IPU_LIBS=-lipu], [echo "No libipu arou
@@ -25,19 +25,19 @@ index f7907a7..9f834df 100755
 +AC_SEARCH_LIBS([shm_open], [rt], [SHM_LIBS="-lrt"])
 +AC_SUBST(SHM_LIBS)
 +
- FSL_MM_CORE_CFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec 2>/dev/null`
- FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`"
- FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslparser 2>/dev/null`"
+ dnl of the POSIX Real-Time Extensions.
+ AC_CHECK_LIB(rt, clock_gettime)
+ AC_SUBST(RT_CFLAGS)
 diff --git a/libs/Makefile.am b/libs/Makefile.am
-index a68fd4b..7b19b92 100755
+index 2f56bba..5b30657 100755
 --- a/libs/Makefile.am
 +++ b/libs/Makefile.am
-@@ -12,7 +12,7 @@ libgstfsl_ at GST_MAJORMINOR@_la_SOURCES = \
+@@ -42,7 +42,7 @@ libgstfsl_ at GST_MAJORMINOR@_la_CFLAGS  += -DIPULIB
+ endif
  
- libgstfsl_ at GST_MAJORMINOR@_la_CFLAGS  = $(GST_BASE_CFLAGS) $(IPU_CFLAGS) -I../inc/common
  libgstfsl_ at GST_MAJORMINOR@_la_LDFLAGS = -version-info @GSTMXLIBS_VERSION@
--libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS)
-+libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(SHM_LIBS)
+-libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS)
++libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS) $(SHM_LIBS)
  
  libgstfsl_ at GST_MAJORMINOR@includedir = $(includedir)/gstreamer- at GST_MAJORMINOR@/gst/imx-mm
  libgstfsl_ at GST_MAJORMINOR@include_HEADERS = \
