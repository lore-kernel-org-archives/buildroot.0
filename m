From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 13 Jan 2019 19:48:30 +0800
Subject: [Buildroot] [PATCH 1/1] package/zbar: switch to linuxtv zbar fork
Message-ID: <1547380110-7761-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

The zbar upstream previously used has been abandoned since 2012.
The linuxtv fork appears to be the most actively maintained fork.
I've resynced patches that wouldn't apply and added a few minor bug fixes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...onf-by-reducing-the-warning-error-checkin.patch | 16 ++---
 ...p-logical-not-operations-into-parentheses.patch | 80 ----------------------
 ...eo-buffers-after-probing-and-request-them.patch | 51 ++++++++++++++
 ...-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch | 26 +++++++
 package/zbar/Config.in                             |  2 +-
 package/zbar/zbar.hash                             |  2 +-
 package/zbar/zbar.mk                               | 11 +--
 7 files changed, 93 insertions(+), 95 deletions(-)
 delete mode 100644 package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch
 create mode 100644 package/zbar/0004-release-video-buffers-after-probing-and-request-them.patch
 create mode 100644 package/zbar/0005-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch

diff --git a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
index 57fbeb1..7e91ee7 100644
--- a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
+++ b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
@@ -1,4 +1,4 @@
-From e593d6529cff515d94d80a24b5f3a953fd46004c Mon Sep 17 00:00:00 2001
+From d14758382fc2c1f2083aa37a0b99fd7081cf2c02 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 19 Dec 2015 18:56:36 +0100
 Subject: [PATCH] Fix autoreconf by reducing the warning/error checking
@@ -9,18 +9,18 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
diff --git a/package/zbar/0004-release-video-buffers-after-probing-and-request-them.patch b/package/zbar/0004-release-video-buffers-after-probing-and-request-them.patch
new file mode 100644
index 0000000..96fa8c5
--- /dev/null
+++ b/package/zbar/0004-release-video-buffers-after-probing-and-request-them.patch
@@ -0,0 +1,51 @@
+From 05e275b246d9b761db9daa314e5f003a66e4530a Mon Sep 17 00:00:00 2001
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
+index 1d685e9..f2fa59f 100644
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
diff --git a/package/zbar/0005-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch b/package/zbar/0005-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch
new file mode 100644
index 0000000..72e99bd
--- /dev/null
+++ b/package/zbar/0005-Ignore-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch
@@ -0,0 +1,26 @@
+From 6d09c0fb5f63a5a2144ebfac6a50bc76cb29a5d5 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 13 Jan 2019 18:37:36 +0800
+Subject: [PATCH] Ignore ENOTTY errors when calling VIDIOC_S_CROP
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ zbar/video/v4l2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zbar/video/v4l2.c b/zbar/video/v4l2.c
+index f2fa59f..ca52e4c 100644
+--- a/zbar/video/v4l2.c
++++ b/zbar/video/v4l2.c
+@@ -586,7 +586,7 @@ static inline int v4l2_reset_crop (zbar_video_t *vdo)
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
index c8fc899..948b6e3 100644
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
@@ -17,8 +16,10 @@ ZBAR_DEPENDENCIES += host-gettext
 ZBAR_CONF_OPTS = \
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
