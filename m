From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 16:59:44 +0100
Subject: [Buildroot] [git commit] package/libexif: add security fix for
 CVE-2020-0198
Message-ID: <20201109155530.A4A5888275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06066336084e37ae038b67d0fa51411cc281e8e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-fixed-another-unsigned-integer-overflow.patch | 63 ++++++++++++++++++++++
 package/libexif/libexif.mk                         |  2 +
 2 files changed, 65 insertions(+)

diff --git a/package/libexif/0001-fixed-another-unsigned-integer-overflow.patch b/package/libexif/0001-fixed-another-unsigned-integer-overflow.patch
new file mode 100644
index 0000000000..77bdfe89d2
--- /dev/null
+++ b/package/libexif/0001-fixed-another-unsigned-integer-overflow.patch
@@ -0,0 +1,63 @@
+From ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 8 Jun 2020 17:27:06 +0200
+Subject: [PATCH] fixed another unsigned integer overflow
+
+first fixed by google in android fork,
+https://android.googlesource.com/platform/external/libexif/+/1e187b62682ffab5003c702657d6d725b4278f16%5E%21/#F0
+
+(use a more generic overflow check method, also check second overflow instance.)
+
+https://security-tracker.debian.org/tracker/CVE-2020-0198
+
+Downloaded from upstream commit:
+https://github.com/libexif/libexif/commit/ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libexif/exif-data.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 8b280d3..b495726 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -47,6 +47,8 @@
+ #undef JPEG_MARKER_APP1
+ #define JPEG_MARKER_APP1 0xe1
+ 
++#define CHECKOVERFLOW(offset,datasize,structsize) (( offset >= datasize) || (structsize > datasize) || (offset > datasize - structsize ))
++
+ static const unsigned char ExifHeader[] = {0x45, 0x78, 0x69, 0x66, 0x00, 0x00};
+ 
+ struct _ExifDataPrivate
+@@ -327,7 +329,7 @@ exif_data_load_data_thumbnail (ExifData *data, const unsigned char *d,
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail offset (%u).", o);
+ 		return;
+ 	}
+-	if (s > ds - o) {
++	if (CHECKOVERFLOW(o,ds,s)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
+ 		return;
+ 	}
+@@ -420,9 +422,9 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	}
+ 
+ 	/* Read the number of entries */
+-	if ((offset + 2 < offset) || (offset + 2 < 2) || (offset + 2 > ds)) {
++	if (CHECKOVERFLOW(offset, ds, 2)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
+-			  "Tag data past end of buffer (%u > %u)", offset+2, ds);
++			  "Tag data past end of buffer (%u+2 > %u)", offset, ds);
+ 		return;
+ 	}
+ 	n = exif_get_short (d + offset, data->priv->order);
+@@ -431,7 +433,7 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	offset += 2;
+ 
+ 	/* Check if we have enough data. */
+-	if (offset + 12 * n > ds) {
++	if (CHECKOVERFLOW(offset, ds, 12*n)) {
+ 		n = (ds - offset) / 12;
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 				  "Short data; only loading %hu entries...", n);
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index c945c275a7..979d592447 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -12,5 +12,7 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
+# 0001-fixed-another-unsigned-integer-overflow.patch
+LIBEXIF_IGNORE_CVES += CVE-2020-0198
 
 $(eval $(autotools-package))
