From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:44:53 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libexif: add
 post-0.6.21 upstream security fixes
Message-ID: <20200310223218.ECB7B908FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e065dfda2f18b182ff0b3a7652c46ad9a004f0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2016-6328: A vulnerability was found in libexif.  An integer overflow
  when parsing the MNOTE entry data of the input file.  This can cause
  Denial-of-Service (DoS) and Information Disclosure (disclosing some
  critical heap chunk metadata, even other applications' private data).

- CVE-2017-7544: libexif through 0.6.21 is vulnerable to out-of-bounds heap
  read vulnerability in exif_data_save_data_entry function in
  libexif/exif-data.c caused by improper length computation of the allocated
  data of an ExifMnote entry which can cause denial-of-service or possibly
  information disclosure.

- CVE-2018-20030: An error when processing the EXIF_IFD_INTEROPERABILITY and
  EXIF_IFD_EXIF tags within libexif version 0.6.21 can be exploited to
  exhaust available CPU resources.

- CVE-2019-9278: In libexif, there is a possible out of bounds write due to
  an integer overflow.  This could lead to remote escalation of privilege in
  the media content provider with no additional execution privileges needed.
  User interaction is needed for exploitation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 81a4940d2527ff4c5ad16848ee0154610937c641)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...not-all-buffer-overreads-during-decoding-.patch |  65 +++++++++++
 ...akernotes-make-sure-the-makernote-contain.patch |  41 +++++++
 ...mum-recursion-depth-in-exif_data_load_dat.patch |  30 ++++++
 ...p-recursion-detection-in-exif_data_load_d.patch | 120 +++++++++++++++++++++
 package/libexif/0005-fix-CVE-2019-9278.patch       |  90 ++++++++++++++++
 5 files changed, 346 insertions(+)

diff --git a/package/libexif/0001-fixes-some-not-all-buffer-overreads-during-decoding-.patch b/package/libexif/0001-fixes-some-not-all-buffer-overreads-during-decoding-.patch
new file mode 100644
index 0000000000..c98ed748c5
--- /dev/null
+++ b/package/libexif/0001-fixes-some-not-all-buffer-overreads-during-decoding-.patch
@@ -0,0 +1,65 @@
+From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Tue, 25 Jul 2017 23:44:44 +0200
+Subject: [PATCH] fixes some (not all) buffer overreads during decoding pentax
+ makernote entries.
+
+This should fix:
+https://sourceforge.net/p/libexif/bugs/125/ CVE-2016-6328
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pentax-entry.c
+index d03d159..ea0429a 100644
+--- a/libexif/pentax/mnote-pentax-entry.c
++++ b/libexif/pentax/mnote-pentax-entry.c
+@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 		case EXIF_FORMAT_SHORT:
+ 		  {
+ 			const unsigned char *data = entry->data;
+-		  	size_t k, len = strlen(val);
++		  	size_t k, len = strlen(val), sizeleft;
++
++			sizeleft = entry->size;
+ 		  	for(k=0; k<entry->components; k++) {
++				if (sizeleft < 2)
++					break;
+ 				vs = exif_get_short (data, entry->order);
+ 				snprintf (val+len, maxlen-len, "%i ", vs);
+ 				len = strlen(val);
+ 				data += 2;
++				sizeleft -= 2;
+ 			}
+ 		  }
+ 		  break;
+ 		case EXIF_FORMAT_LONG:
+ 		  {
+ 			const unsigned char *data = entry->data;
+-		  	size_t k, len = strlen(val);
++		  	size_t k, len = strlen(val), sizeleft;
++
++			sizeleft = entry->size;
+ 		  	for(k=0; k<entry->components; k++) {
++				if (sizeleft < 4)
++					break;
+ 				vl = exif_get_long (data, entry->order);
+ 				snprintf (val+len, maxlen-len, "%li", (long int) vl);
+ 				len = strlen(val);
+ 				data += 4;
++				sizeleft -= 4;
+ 			}
+ 		  }
+ 		  break;
+@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 		break;
+ 	}
+ 
+-	return (val);
++	return val;
+ }
+-- 
+2.20.1
+
diff --git a/package/libexif/0002-On-saving-makernotes-make-sure-the-makernote-contain.patch b/package/libexif/0002-On-saving-makernotes-make-sure-the-makernote-contain.patch
new file mode 100644
index 0000000000..84c92593bc
--- /dev/null
+++ b/package/libexif/0002-On-saving-makernotes-make-sure-the-makernote-contain.patch
@@ -0,0 +1,41 @@
+From c39acd1692023b26290778a02a9232c873f9d71a Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Tue, 25 Jul 2017 23:38:56 +0200
+Subject: [PATCH] On saving makernotes, make sure the makernote container tags
+ has a type with 1 byte components.
+
+Fixes (at least):
+	https://sourceforge.net/p/libexif/bugs/130
+	https://sourceforge.net/p/libexif/bugs/129
+
+CVE-2017-7544: libexif through 0.6.21 is vulnerable to out-of-bounds heap
+read vulnerability in exif_data_save_data_entry function in
+libexif/exif-data.c caused by improper length computation of the allocated
+data of an ExifMnote entry which can cause denial-of-service or possibly
+information disclosure.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libexif/exif-data.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 67df4db..91f4c33 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data, ExifEntry *e,
+ 			exif_mnote_data_set_offset (data->priv->md, *ds - 6);
+ 			exif_mnote_data_save (data->priv->md, &e->data, &e->size);
+ 			e->components = e->size;
++			if (exif_format_get_size (e->format) != 1) {
++				/* e->format is taken from input code,
++				 * but we need to make sure it is a 1 byte
++				 * entity due to the multiplication below. */
++				e->format = EXIF_FORMAT_UNDEFINED;
++			}
+ 		}
+ 	}
+ 
+-- 
+2.20.1
+
diff --git a/package/libexif/0003-Reduce-maximum-recursion-depth-in-exif_data_load_dat.patch b/package/libexif/0003-Reduce-maximum-recursion-depth-in-exif_data_load_dat.patch
new file mode 100644
index 0000000000..e662d6bfc9
--- /dev/null
+++ b/package/libexif/0003-Reduce-maximum-recursion-depth-in-exif_data_load_dat.patch
@@ -0,0 +1,30 @@
+From 5d28011c40ec86cf52cffad541093d37c263898a Mon Sep 17 00:00:00 2001
+From: Dan Fandrich <dan@coneharvesters.com>
+Date: Fri, 20 Apr 2018 18:05:19 +0200
+Subject: [PATCH] Reduce maximum recursion depth in exif_data_load_data_content
+
+This only needs to be a small, single digit integer for normal files,
+and reducing the maximum closer to this reduces the time and space
+needed to detect pathological cases.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libexif/exif-data.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 91f4c33..04cdda2 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -378,7 +378,7 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
+ 	  return;
+ 
+-	if (recursion_depth > 30) {
++	if (recursion_depth > 12) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
+ 			  "Deep recursion detected!");
+ 		return;
+-- 
+2.20.1
+
diff --git a/package/libexif/0004-Improve-deep-recursion-detection-in-exif_data_load_d.patch b/package/libexif/0004-Improve-deep-recursion-detection-in-exif_data_load_d.patch
new file mode 100644
index 0000000000..ff991541fe
--- /dev/null
+++ b/package/libexif/0004-Improve-deep-recursion-detection-in-exif_data_load_d.patch
@@ -0,0 +1,120 @@
+From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00 2001
+From: Dan Fandrich <dan@coneharvesters.com>
+Date: Fri, 12 Oct 2018 16:01:45 +0200
+Subject: [PATCH] Improve deep recursion detection in
+ exif_data_load_data_content.
+
+The existing detection was still vulnerable to pathological cases
+causing DoS by wasting CPU. The new algorithm takes the number of tags
+into account to make it harder to abuse by cases using shallow recursion
+but with a very large number of tags.  This improves on commit 5d28011c
+which wasn't sufficient to counter this kind of case.
+
+The limitation in the previous fix was discovered by Laurent Delosieres,
+Secunia Research at Flexera (Secunia Advisory SA84652) and is assigned
+the identifier CVE-2018-20030.
+
+[Peter: drop NEWS change]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libexif/exif-data.c | 45 +++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 37 insertions(+), 8 deletions(-)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index e35403d..a6f9c94 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -35,6 +35,7 @@
+ #include <libexif/olympus/exif-mnote-data-olympus.h>
+ #include <libexif/pentax/exif-mnote-data-pentax.h>
+ 
++#include <math.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -350,6 +351,20 @@ if (data->ifd[(i)]->count) {				\
+ 	break;						\
+ }
+ 
++/*! Calculate the recursion cost added by one level of IFD loading.
++ *
++ * The work performed is related to the cost in the exponential relation
++ *   work=1.1**cost
++ */
++static unsigned int
++level_cost(unsigned int n)
++{
++    static const double log_1_1 = 0.09531017980432493;
++
++	/* Adding 0.1 protects against the case where n==1 */
++	return ceil(log(n + 0.1)/log_1_1);
++}
++
+ /*! Load data for an IFD.
+  *
+  * \param[in,out] data #ExifData
+@@ -357,13 +372,13 @@ if (data->ifd[(i)]->count) {				\
+  * \param[in] d pointer to buffer containing raw IFD data
+  * \param[in] ds size of raw data in buffer at \c d
+  * \param[in] offset offset into buffer at \c d at which IFD starts
+- * \param[in] recursion_depth number of times this function has been
+- * recursively called without returning
++ * \param[in] recursion_cost factor indicating how expensive this recursive
++ * call could be
+  */
+ static void
+ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 			     const unsigned char *d,
+-			     unsigned int ds, unsigned int offset, unsigned int recursion_depth)
++			     unsigned int ds, unsigned int offset, unsigned int recursion_cost)
+ {
+ 	ExifLong o, thumbnail_offset = 0, thumbnail_length = 0;
+ 	ExifShort n;
+@@ -378,9 +393,20 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
+ 	  return;
+ 
+-	if (recursion_depth > 12) {
++	if (recursion_cost > 170) {
++		/*
++		 * recursion_cost is a logarithmic-scale indicator of how expensive this
++		 * recursive call might end up being. It is an indicator of the depth of
++		 * recursion as well as the potential for worst-case future recursive
++		 * calls. Since it's difficult to tell ahead of time how often recursion
++		 * will occur, this assumes the worst by assuming every tag could end up
++		 * causing recursion.
++		 * The value of 170 was chosen to limit typical EXIF structures to a
++		 * recursive depth of about 6, but pathological ones (those with very
++		 * many tags) to only 2.
++		 */
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
+-			  "Deep recursion detected!");
++			  "Deep/expensive recursion detected!");
+ 		return;
+ 	}
+ 
+@@ -422,15 +448,18 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 			switch (tag) {
+ 			case EXIF_TAG_EXIF_IFD_POINTER:
+ 				CHECK_REC (EXIF_IFD_EXIF);
+-				exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o, recursion_depth + 1);
++				exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o,
++					recursion_cost + level_cost(n));
+ 				break;
+ 			case EXIF_TAG_GPS_INFO_IFD_POINTER:
+ 				CHECK_REC (EXIF_IFD_GPS);
+-				exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o, recursion_depth + 1);
++				exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o,
++					recursion_cost + level_cost(n));
+ 				break;
+ 			case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:
+ 				CHECK_REC (EXIF_IFD_INTEROPERABILITY);
+-				exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);
++				exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o,
++					recursion_cost + level_cost(n));
+ 				break;
+ 			case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:
+ 				thumbnail_offset = o;
+-- 
+2.20.1
+
diff --git a/package/libexif/0005-fix-CVE-2019-9278.patch b/package/libexif/0005-fix-CVE-2019-9278.patch
new file mode 100644
index 0000000000..f708b2ae54
--- /dev/null
+++ b/package/libexif/0005-fix-CVE-2019-9278.patch
@@ -0,0 +1,90 @@
+From 75aa73267fdb1e0ebfbc00369e7312bac43d0566 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Sat, 18 Jan 2020 09:29:42 +0100
+Subject: [PATCH] fix CVE-2019-9278
+
+avoid the use of unsafe integer overflow checking constructs (unsigned integer operations cannot overflow, so "u1 + u2 > u1" can be optimized away)
+
+check for the actual sizes, which should also handle the overflows
+document other places google patched, but do not seem relevant due to other restrictions
+
+fixes https://github.com/libexif/libexif/issues/26
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libexif/exif-data.c | 28 ++++++++++++++++++----------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index a6f9c94..6332cd1 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -192,9 +192,15 @@ exif_data_load_data_entry (ExifData *data, ExifEntry *entry,
+ 		doff = offset + 8;
+ 
+ 	/* Sanity checks */
+-	if ((doff + s < doff) || (doff + s < s) || (doff + s > size)) {
++	if (doff >= size) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+-				  "Tag data past end of buffer (%u > %u)", doff+s, size);	
++				  "Tag starts past end of buffer (%u > %u)", doff, size);
++		return 0;
++	}
++
++	if (s > size - doff) {
++		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
++				  "Tag data goes past end of buffer (%u > %u)", doff+s, size);
+ 		return 0;
+ 	}
+ 
+@@ -315,13 +321,14 @@ exif_data_load_data_thumbnail (ExifData *data, const unsigned char *d,
+ 			       unsigned int ds, ExifLong o, ExifLong s)
+ {
+ 	/* Sanity checks */
+-	if ((o + s < o) || (o + s < s) || (o + s > ds) || (o > ds)) {
+-		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+-			  "Bogus thumbnail offset (%u) or size (%u).",
+-			  o, s);
++	if (o >= ds) {
++		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail offset (%u).", o);
++		return;
++	}
++	if (s > ds - o) {
++		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
+ 		return;
+ 	}
+-
+ 	if (data->data) 
+ 		exif_mem_free (data->priv->mem, data->data);
+ 	if (!(data->data = exif_data_alloc (data, s))) {
+@@ -947,7 +954,7 @@ exif_data_load_data (ExifData *data, const unsigned char *d_orig,
+ 	exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", 
+ 		  "IFD 0 at %i.", (int) offset);
+ 
+-	/* Sanity check the offset, being careful about overflow */
++	/* ds is restricted to 16 bit above, so offset is restricted too, and offset+8 should not overflow. */
+ 	if (offset > ds || offset + 6 + 2 > ds)
+ 		return;
+ 
+@@ -956,6 +963,7 @@ exif_data_load_data (ExifData *data, const unsigned char *d_orig,
+ 
+ 	/* IFD 1 offset */
+ 	n = exif_get_short (d + 6 + offset, data->priv->order);
++	/* offset < 2<<16, n is 16 bit@most, so this op will not overflow */
+ 	if (offset + 6 + 2 + 12 * n + 4 > ds)
+ 		return;
+ 
+@@ -964,8 +972,8 @@ exif_data_load_data (ExifData *data, const unsigned char *d_orig,
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 			  "IFD 1 at %i.", (int) offset);
+ 
+-		/* Sanity check. */
+-		if (offset > ds || offset + 6 > ds) {
++		/* Sanity check. ds is ensured to be above 6 above, offset is 16bit */
++		if (offset > ds - 6) {
+ 			exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA,
+ 				  "ExifData", "Bogus offset of IFD1.");
+ 		} else {
+-- 
+2.20.1
+
