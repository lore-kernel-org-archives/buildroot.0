From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 16:59:58 +0100
Subject: [Buildroot] [git commit] package/libexif: add security fix for
 CVE-2020-0452
Message-ID: <20201109155530.AAEA98138E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70a036fb307da409652807dc7b7a6d20a8ef0b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fixed-a-incorrect-overflow-check.patch    | 36 ++++++++++++++++++++++
 package/libexif/libexif.mk                         |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/package/libexif/0002-fixed-a-incorrect-overflow-check.patch b/package/libexif/0002-fixed-a-incorrect-overflow-check.patch
new file mode 100644
index 0000000000..1946f78228
--- /dev/null
+++ b/package/libexif/0002-fixed-a-incorrect-overflow-check.patch
@@ -0,0 +1,36 @@
+From 9266d14b5ca4e29b970fa03272318e5f99386e06 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Thu, 5 Nov 2020 09:50:08 +0100
+Subject: [PATCH] fixed a incorrect overflow check that could be optimized
+ away.
+
+inspired by:
+https://android.googlesource.com/platform/external/libexif/+/8e7345f3bc0bad06ac369d6cbc1124c8ceaf7d4b
+
+https://source.android.com/security/bulletin/2020-11-01
+
+CVE-2020-0452
+
+Downloaded from upstream commit, rebased for 0.6.22:
+https://github.com/libexif/libexif/commit/9266d14b5ca4e29b970fa03272318e5f99386e06
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libexif/exif-entry.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/exif-entry.c b/libexif/exif-entry.c
+index 3fc0ff9..4b866ce 100644
+--- a/libexif/exif-entry.c
++++ b/libexif/exif-entry.c
+@@ -1371,8 +1371,8 @@ exif_entry_get_value (ExifEntry *e, char *val, unsigned int maxlen)
+ 	{
+ 		unsigned char *utf16;
+ 
+-		/* Sanity check the size to prevent overflow */
+-		if (e->size+sizeof(uint16_t)+1 < e->size) break;
++		/* Sanity check the size to prevent overflow. Note EXIF files are 64kb at most. */
++		if (e->size >= 65536 - sizeof(uint16_t)*2) break;
+ 
+ 		/* The tag may not be U+0000-terminated , so make a local
+ 		   U+0000-terminated copy before converting it */
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 979d592447..594e8855c5 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -14,5 +14,7 @@ LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
 # 0001-fixed-another-unsigned-integer-overflow.patch
 LIBEXIF_IGNORE_CVES += CVE-2020-0198
+# 0002-fixed-a-incorrect-overflow-check.patch
+LIBEXIF_IGNORE_CVES += CVE-2020-0452
 
 $(eval $(autotools-package))
