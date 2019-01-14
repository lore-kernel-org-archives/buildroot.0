From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 14 Jan 2019 21:27:00 +0800
Subject: [Buildroot] [PATCH v3 1/1] package/zbar: switch to linuxtv zbar fork
Message-ID: <1547472420-16625-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

The zbar upstream previously used has been abandoned since 2012.
The linuxtv fork appears to be the most actively maintained fork.
Removed all patches which are merged upstream or fixed upstream.
Changed configure flags to match new upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - update to latest upstream
  - removed all patches

Changes v1 -> v2:
  - regenerate patch series
  - add details to commit message
---
 ...onf-by-reducing-the-warning-error-checkin.patch | 26 -------
 ...n-protoype-to-be-compatible-with-recent-l.patch | 27 --------
 .../zbar/0003-Disable-building-documentation.patch | 27 --------
 ...p-logical-not-operations-into-parentheses.patch | 80 ----------------------
 package/zbar/Config.in                             |  2 +-
 package/zbar/zbar.hash                             |  2 +-
 package/zbar/zbar.mk                               | 12 ++--
 7 files changed, 9 insertions(+), 167 deletions(-)
 delete mode 100644 package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
 delete mode 100644 package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
 delete mode 100644 package/zbar/0003-Disable-building-documentation.patch
 delete mode 100644 package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch

diff --git a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch b/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
deleted file mode 100644
index 57fbeb1..0000000
--- a/package/zbar/0001-Fix-autoreconf-by-reducing-the-warning-error-checkin.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e593d6529cff515d94d80a24b5f3a953fd46004c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 19 Dec 2015 18:56:36 +0100
-Subject: [PATCH] Fix autoreconf by reducing the warning/error checking
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 256aedb..e0b6046 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
- AC_INIT([zbar], [0.10], [spadix at users.sourceforge.net])
- AC_CONFIG_AUX_DIR(config)
- AC_CONFIG_MACRO_DIR(config)
--AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
-+AM_INIT_AUTOMAKE([1.10 foreign subdir-objects std-options dist-bzip2])
- AC_CONFIG_HEADERS([include/config.h])
- AC_CONFIG_SRCDIR(zbar/scanner.c)
- LT_PREREQ([2.2])
--- 
-2.6.4
-
diff --git a/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch b/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
deleted file mode 100644
index 82dd4e9..0000000
--- a/package/zbar/0002-Fix-function-protoype-to-be-compatible-with-recent-l.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5dc8322b4f9a3de29b3da70b69e16356a2a1764c Mon Sep 17 00:00:00 2001
-From: Viacheslav Volkov <sv99@inbox.ru>
-Date: Sat, 19 Dec 2015 19:07:09 +0100
-Subject: [PATCH] Fix function protoype to be compatible with recent libjpeg
-
-Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- zbar/jpeg.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/zbar/jpeg.c b/zbar/jpeg.c
-index 972bfea..fdd1619 100644
---- a/zbar/jpeg.c
-+++ b/zbar/jpeg.c
-@@ -68,7 +68,7 @@ void init_source (j_decompress_ptr cinfo)
-     cinfo->src->bytes_in_buffer = img->datalen;
- }
- 
--int fill_input_buffer (j_decompress_ptr cinfo)
-+boolean fill_input_buffer (j_decompress_ptr cinfo)
- {
-     /* buffer underrun error case */
-     cinfo->src->next_input_byte = fake_eoi;
--- 
-2.6.4
-
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
index 54441a8..2093076 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 38f8535a3c4c526ecaa968a992efcbf7392623e68db45dc2f181d4c9d3002d69 zbar-854a5d97059e395807091ac4d80c53f7968abb8f.tar.gz
+sha256 115486dfb314da0dab26c745ab3056eb56f16f74a9fddda89a1ea9d0d51007ae zbar-006b465a267ad3c6c754b88bbe77bb1c1f49f40b.tar.gz
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index c8fc899..b3b16e1 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# github have some additional commits for compiling with recent kernel
-ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
-ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
+ZBAR_VERSION = 006b465a267ad3c6c754b88bbe77bb1c1f49f40b
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
