From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 14 Jan 2019 08:14:16 +0800
Subject: [Buildroot] [PATCH v2 1/1] package/zbar: switch to linuxtv zbar fork
Message-ID: <1547424856-31004-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

The zbar upstream previously used has been abandoned since 2012.
The linuxtv fork appears to be the most actively maintained fork.
Removed Wrap logical not operations into parentheses patch which is upstream.
Replaced Disable building documentation patch with patch adding --disable-doc
configure flag.
Added Ignore ENOTTY errors when calling VIDIOC_S_CROP patch.
Added release video buffers after probing and request them again when needed
patch.
Changed configure flags to match new upstream.
Regenerated and rebased patch series on top of new zbar upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - regenerate patch series
  - add details to commit message
---
 ...onf-by-reducing-the-warning-error-checkin.patch | 17 ++---
 ...n-protoype-to-be-compatible-with-recent-l.patch |  5 +-
 ...-doc-configure-option-to-disable-building.patch | 56 +++++++++++++++
 .../zbar/0003-Disable-building-documentation.patch | 27 --------
 ...-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch | 30 ++++++++
 ...p-logical-not-operations-into-parentheses.patch | 80 ----------------------
 ...eo-buffers-after-probing-and-request-them.patch | 51 ++++++++++++++
 package/zbar/Config.in                             |  2 +-
 package/zbar/zbar.hash                             |  2 +-
 package/zbar/zbar.mk                               | 12 ++--
 10 files changed, 158 insertions(+), 124 deletions(-)
 create mode 100644 package/zbar/0003-Add-disable-doc-configure-option-to-disable-building.patch
 delete mode 100644 package/zbar/0003-Disable-building-documentation.patch
 create mode 100644 package/zbar/0004-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch
 delete mode 100644 package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch
 create mode 100644 package/zbar/0005-release-video-buffers-after-probing-and-request-them.patch

diff --git a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
index 57fbeb1..f826f74 100644
--- a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
+++ b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
@@ -1,26 +1,27 @@
-From e593d6529cff515d94d80a24b5f3a953fd46004c Mon Sep 17 00:00:00 2001
+From e623cf9708884e728bbb403f1ef0168d897dc7aa Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 19 Dec 2015 18:56:36 +0100
 Subject: [PATCH] Fix autoreconf by reducing the warning/error checking
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 256aedb..e0b6046 100644
+index a03d10e..6476a20 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
- AC_INIT([zbar], [0.10], [spadix at users.sourceforge.net])
+@@ -5,7 +5,7 @@ m4_ifndef([AC_LANG_DEFINES_PROVIDED],
+           [m4_define([AC_LANG_DEFINES_PROVIDED])])
  AC_CONFIG_AUX_DIR(config)
  AC_CONFIG_MACRO_DIR(config)
--AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
-+AM_INIT_AUTOMAKE([1.10 foreign subdir-objects std-options dist-bzip2])
+-AM_INIT_AUTOMAKE([1.13 -Werror foreign subdir-objects std-options dist-bzip2])
++AM_INIT_AUTOMAKE([1.13 foreign subdir-objects std-options dist-bzip2])
+ m4_pattern_allow([AM_PROG_AR])
  AC_CONFIG_HEADERS([include/config.h])
  AC_CONFIG_SRCDIR(zbar/scanner.c)
- LT_PREREQ([2.2])
 -- 
-2.6.4
+2.7.4
 
diff --git a/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch b/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
index 82dd4e9..5aca5ed 100644
--- a/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
+++ b/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
@@ -1,10 +1,11 @@
-From 5dc8322b4f9a3de29b3da70b69e16356a2a1764c Mon Sep 17 00:00:00 2001
+From c87f955f7e6fb117d5b3eb7e4014def92ad916e3 Mon Sep 17 00:00:00 2001
 From: Viacheslav Volkov <sv99@inbox.ru>
 Date: Sat, 19 Dec 2015 19:07:09 +0100
 Subject: [PATCH] Fix function protoype to be compatible with recent libjpeg
 
 Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  zbar/jpeg.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,5 +24,5 @@ index 972bfea..fdd1619 100644
      /* buffer underrun error case */
      cinfo->src->next_input_byte = fake_eoi;
 -- 
-2.6.4
+2.7.4
 
diff --git a/package/zbar/0003-Add-disable-doc-configure-option-to-disable-building.patch b/package/zbar/0003-Add-disable-doc-configure-option-to-disable-building.patch
new file mode 100644
index 0000000..314b0f7
--- /dev/null
+++ b/package/zbar/0003-Add-disable-doc-configure-option-to-disable-building.patch
@@ -0,0 +1,56 @@
+From ffc5b9979e0cd81f15b89872c0d34a47bc9c766a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 14 Jan 2019 07:17:51 +0800
+Subject: [PATCH] Add --disable-doc configure option to disable building docs
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ Makefile.am  |  2 ++
+ configure.ac | 10 ++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index df3d79d..b4cae8a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -45,7 +45,9 @@ if HAVE_NPAPI
+ include $(srcdir)/plugin/Makefile.am.inc
+ endif
+ include $(srcdir)/test/Makefile.am.inc
++if HAVE_DOC
+ include $(srcdir)/doc/Makefile.am.inc
++endif
+ 
+ EXTRA_DIST += zbar.ico zbar.nsi
+ 
+diff --git a/configure.ac b/configure.ac
+index 6476a20..afccc3a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -177,6 +177,15 @@ or configure --disable-pthread to skip threaded support.])])
+    AC_DEFINE([__USE_UNIX98], [1], [used only for pthread debug attributes])
+ ])
+ 
++dnl doc
++AC_ARG_ENABLE([doc],
++  [AS_HELP_STRING([--disable-doc],
++    [disable building docs])],
++  [],
++  [enable_doc="yes"])
++
++AM_CONDITIONAL([HAVE_DOC], [test "x$enable_doc" != "xno"])
++
+ dnl video
+ AC_ARG_ENABLE([video],
+   [AS_HELP_STRING([--disable-video],
+@@ -602,6 +611,7 @@ echo "please verify that the detected configuration matches your expectations:"
+ echo "------------------------------------------------------------------------"
+ echo "X                 --with-x=$have_x"
+ echo "pthreads          --enable-pthread=$enable_pthread"
++echo "doc               --enable-doc=$enable_doc"
+ echo "v4l               --enable-video=$enable_video"
+ AS_IF([test "x$enable_video" != "xyes"],
+   [echo "        => zbarcam video scanner will *NOT* be built"])
+-- 
+2.7.4
+
diff --git a/package/zbar/0003-Disable-building-documentation.patch b/package/zbar/0003-Disable-building-documentation.patch
deleted file mode 100644
index 729f926..0000000
--- a/package/zbar/0003-Disable-building-documentation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 58027d5bb0492142a5b72ded772d3a1be9fa8d87 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 20 Dec 2015 12:05:57 +0100
-Subject: [PATCH] Disable building documentation
-
-The documentation requires xmlto, and we don't need it in Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e18499a..db4411f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -45,7 +45,6 @@ if HAVE_NPAPI
- include $(srcdir)/plugin/Makefile.am.inc
- endif
- include $(srcdir)/test/Makefile.am.inc
--include $(srcdir)/doc/Makefile.am.inc
- 
- EXTRA_DIST += zbar.ico zbar.nsi
- 
--- 
-2.6.4
-
diff --git a/package/zbar/0004-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch b/package/zbar/0004-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch
new file mode 100644
index 0000000..2be3bea
--- /dev/null
+++ b/package/zbar/0004-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch
@@ -0,0 +1,30 @@
+From 96212f8b18045d1a7f2ae25d891f67a7de4b1e76 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 13 Jan 2019 18:37:36 +0800
+Subject: [PATCH] Ignore ENOTTY errors when calling VIDIOC_S_CROP
+
+Silences this error:
+ERROR: zbar video in v4l2_reset_crop():
+    system error: setting default crop window (VIDIOC_S_CROP): Inappropriate ioctl for device (25)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ zbar/video/v4l2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zbar/video/v4l2.c b/zbar/video/v4l2.c
+index 1d685e9..ad6adf4 100644
+--- a/zbar/video/v4l2.c
++++ b/zbar/video/v4l2.c
+@@ -569,7 +569,7 @@ static inline int v4l2_reset_crop (zbar_video_t *vdo)
+     memset(&crop, 0, sizeof(crop));
+     crop.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+     crop.c = ccap.defrect;
+-    if(v4l2_ioctl(vdo->fd, VIDIOC_S_CROP, &crop) < 0 && errno != EINVAL)
++    if(v4l2_ioctl(vdo->fd, VIDIOC_S_CROP, &crop) < 0 && errno != EINVAL && errno != ENOTTY)
+         return(err_capture(vdo, SEV_ERROR, ZBAR_ERR_SYSTEM, __func__,
+                            "setting default crop window (VIDIOC_S_CROP)"));
+     return(0);
+-- 
+2.7.4
+
diff --git a/package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch b/package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch
deleted file mode 100644
index 6d39b1b..0000000
--- a/package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 7e69cdc8dfdf07701ba551985ee49d48e64d730f Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 25 Jan 2016 11:58:59 +0000
-Subject: [PATCH] Wrap logical not operations into parentheses
-
-Otherwise it fails like this:
-
-zbar/decoder/ean.c: In function 'ean_part_end4':
-zbar/decoder/ean.c:297:13: error: logical not is only applied to the
-left hand side of comparison [-Werror=logical-not-parentheses]
-     if(!par == fwd) {
-
-This patch has been sent upstream as a pull request:
-
-  https://github.com/ZBar/ZBar/pull/9
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- zbar/decoder/ean.c  | 4 ++--
- zbar/qrcode/qrdec.c | 8 ++++----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/zbar/decoder/ean.c b/zbar/decoder/ean.c
-index c20f538..41d1493 100644
---- a/zbar/decoder/ean.c
-+++ b/zbar/decoder/ean.c
-@@ -294,7 +294,7 @@ static inline zbar_symbol_type_t ean_part_end4 (ean_pass_t *pass,
-         /* invalid parity combination */
-         return(ZBAR_NONE);
- 
--    if(!par == fwd) {
-+    if((!par) == fwd) {
-         /* reverse sampled digits */
-         unsigned char tmp = pass->raw[1];
-         pass->state |= STATE_REV;
-@@ -380,7 +380,7 @@ static inline zbar_symbol_type_t ean_part_end7 (ean_decoder_t *ean,
-         /* invalid parity combination */
-         return(ZBAR_NONE);
- 
--    if(!par == fwd) {
-+    if((!par) == fwd) {
-         unsigned char i;
-         pass->state |= STATE_REV;
-         /* reverse sampled digits */
-diff --git a/zbar/qrcode/qrdec.c b/zbar/qrcode/qrdec.c
-index d8fa802..5d3d265 100644
---- a/zbar/qrcode/qrdec.c
-+++ b/zbar/qrcode/qrdec.c
-@@ -1219,8 +1219,8 @@ static int qr_finder_quick_crossing_check(const unsigned char *_img,
-    _x1<0||_x1>=_width||_y1<0||_y1>=_height){
-     return -1;
-   }
--  if(!_img[_y0*_width+_x0]!=_v||!_img[_y1*_width+_x1]!=_v)return 1;
--  if(!_img[(_y0+_y1>>1)*_width+(_x0+_x1>>1)]==_v)return -1;
-+  if((!_img[_y0*_width+_x0])!=_v||(!_img[_y1*_width+_x1])!=_v)return 1;
-+  if((!_img[(_y0+_y1>>1)*_width+(_x0+_x1>>1)])==_v)return -1;
-   return 0;
- }
- 
-@@ -1261,7 +1261,7 @@ static int qr_finder_locate_crossing(const unsigned char *_img,
-       x0[1-steep]+=step[1-steep];
-       err-=dx[steep];
-     }
--    if(!_img[x0[1]*_width+x0[0]]!=_v)break;
-+    if((!_img[x0[1]*_width+x0[0]])!=_v)break;
-   }
-   /*Find the last crossing from _v to !_v.*/
-   err=0;
-@@ -1273,7 +1273,7 @@ static int qr_finder_locate_crossing(const unsigned char *_img,
-       x1[1-steep]-=step[1-steep];
-       err-=dx[steep];
-     }
--    if(!_img[x1[1]*_width+x1[0]]!=_v)break;
-+    if((!_img[x1[1]*_width+x1[0]])!=_v)break;
-   }
-   /*Return the midpoint of the _v segment.*/
-   _p[0]=(x0[0]+x1[0]+1<<QR_FINDER_SUBPREC)>>1;
--- 
-2.4.10
-
diff --git a/package/zbar/0005-release-video-buffers-after-probing-and-request-them.patch b/package/zbar/0005-release-video-buffers-after-probing-and-request-them.patch
new file mode 100644
index 0000000..2f2bc2c
--- /dev/null
+++ b/package/zbar/0005-release-video-buffers-after-probing-and-request-them.patch
@@ -0,0 +1,51 @@
+From e686c110cccc167251979c0b7d33c4eb124ff4e6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 13 Jan 2019 18:05:27 +0800
+Subject: [PATCH] release video buffers after probing and request them again
+ when needed
+
+Patch adapted from https://bugs.archlinux.org/task/44091
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ zbar/video/v4l2.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/zbar/video/v4l2.c b/zbar/video/v4l2.c
+index ad6adf4..ca52e4c 100644
+--- a/zbar/video/v4l2.c
++++ b/zbar/video/v4l2.c
+@@ -243,6 +243,21 @@ static int v4l2_mmap_buffers (zbar_video_t *vdo)
+     return(0);
+ }
+ 
++static int v4l2_request_buffers (zbar_video_t *vdo)
++{
++    struct v4l2_requestbuffers rb;
++    memset(&rb, 0, sizeof(rb));
++    rb.count = vdo->num_images;
++    rb.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
++    rb.memory = V4L2_MEMORY_USERPTR;
++    if(v4l2_ioctl(vdo->fd, VIDIOC_REQBUFS, &rb) < 0)
++        return(err_capture(vdo, SEV_ERROR, ZBAR_ERR_SYSTEM, __func__,
++                           "requesting video frame buffers (VIDIOC_REQBUFS)"));
++    if(rb.count)
++        vdo->num_images = rb.count;
++    return(0);
++}
++
+ static int v4l2_set_format (zbar_video_t *vdo,
+                             uint32_t fmt)
+ {
+@@ -334,6 +349,8 @@ static int v4l2_init (zbar_video_t *vdo,
+ 
+     if(vdo->iomode == VIDEO_MMAP)
+         return(v4l2_mmap_buffers(vdo));
++    if(vdo->iomode == VIDEO_USERPTR)
++        return(v4l2_request_buffers(vdo));
+     return(0);
+ }
+ 
+-- 
+2.7.4
+
diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index 05c9b76..0f4d115 100644
--- a/package/zbar/Config.in
+++ b/package/zbar/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_ZBAR
 	help
 	  QR and barcode scanner
 
-	  http://zbar.sourceforge.net/
+	  https://git.linuxtv.org/zbar.git/about/
 
 comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 54441a8..9323337 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 38f8535a3c4c526ecaa968a992efcbf7392623e68db45dc2f181d4c9d3002d69 zbar-854a5d97059e395807091ac4d80c53f7968abb8f.tar.gz
+sha256 4919f11265156730790e8355f6b2ca5667767d7b45e9278ba294680b6b4f6014 zbar-14900c67eccfb97e152063296f20cd32aa787578.tar.gz
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index c8fc899..5fc68b8 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# github have some additional commits for compiling with recent kernel
-ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
-ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
+ZBAR_VERSION = 14900c67eccfb97e152063296f20cd32aa787578
+ZBAR_SITE = git://linuxtv.org/zbar.git
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
 ZBAR_INSTALL_STAGING = YES
@@ -15,10 +14,13 @@ ZBAR_DEPENDENCIES = libv4l jpeg
 # add host-gettext for AM_ICONV macro
 ZBAR_DEPENDENCIES += host-gettext
 ZBAR_CONF_OPTS = \
+	--disable-doc \
 	--without-imagemagick \
 	--without-qt \
+	--without-qt5 \
 	--without-gtk \
-	--without-python \
-	--without-x
+	--without-python2 \
+	--without-x \
+	--without-java
 
 $(eval $(autotools-package))
-- 
2.7.4
