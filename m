From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:39:29 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/tiff: security
 bump to version 4.0.10
Message-ID: <20190405153704.CE5E281358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f08d01ed05ca7ed2f1f2e8cceacb0d2409a4a7b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Drop patch (already in version)
- Add hash for license file
- Fix around 10 CVEs:
  https://www.cvedetails.com/vulnerability-list/vendor_id-2224/product_id-3881/version_id-216413/
- Add an upstream patch for CVE-2019-6128

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f0d4873b3c2cd9cd98cdf9476463ed210e3560ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mory-leak-that-was-assigned-CVE-2019-6128.patch | 53 ++++++++++++++++
 ..._dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch | 70 ----------------------
 package/tiff/tiff.hash                             |  3 +-
 package/tiff/tiff.mk                               |  2 +-
 4 files changed, 56 insertions(+), 72 deletions(-)

diff --git a/package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch b/package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch
new file mode 100644
index 0000000000..638760b71e
--- /dev/null
+++ b/package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch
@@ -0,0 +1,53 @@
+From 0c74a9f49b8d7a36b17b54a7428b3526d20f88a8 Mon Sep 17 00:00:00 2001
+From: Scott Gayou <github.scott@gmail.com>
+Date: Wed, 23 Jan 2019 15:03:53 -0500
+Subject: [PATCH] Fix for simple memory leak that was assigned CVE-2019-6128.
+
+pal2rgb failed to free memory on a few errors. This was reported
+here: http://bugzilla.maptools.org/show_bug.cgi?id=2836.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.com/libtiff/libtiff/commit/ae0bed1fe530a82faf2e9ea1775109dbf301a971]
+---
+ tools/pal2rgb.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
+index 01d8502e..9492f1cf 100644
+--- a/tools/pal2rgb.c
++++ b/tools/pal2rgb.c
+@@ -118,12 +118,14 @@ main(int argc, char* argv[])
+ 	    shortv != PHOTOMETRIC_PALETTE) {
+ 		fprintf(stderr, "%s: Expecting a palette image.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	if (!TIFFGetField(in, TIFFTAG_COLORMAP, &rmap, &gmap, &bmap)) {
+ 		fprintf(stderr,
+ 		    "%s: No colormap (not a valid palette image).\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	bitspersample = 0;
+@@ -131,11 +133,14 @@ main(int argc, char* argv[])
+ 	if (bitspersample != 8) {
+ 		fprintf(stderr, "%s: Sorry, can only handle 8-bit images.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	out = TIFFOpen(argv[optind+1], "w");
+-	if (out == NULL)
++	if (out == NULL) {
++		(void) TIFFClose(in);
+ 		return (-2);
++	}
+ 	cpTags(in, out);
+ 	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &imagewidth);
+ 	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
+-- 
+2.18.1
+
diff --git a/package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch b/package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch
deleted file mode 100644
index 2be989b9e7..0000000000
--- a/package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6173a57d39e04d68b139f8c1aa499a24dbe74ba1 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Fri, 30 Jun 2017 17:29:44 +0000
-Subject: [PATCH] * libtiff/tif_dirwrite.c: in
- TIFFWriteDirectoryTagCheckedXXXX() functions associated with LONG8/SLONG8
- data type, replace assertion that the file is BigTIFF, by a non-fatal error.
- Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2712 Reported by team
- OWL337
-
-[Peter: drop ChangeLog modification]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libtiff/tif_dirwrite.c | 20 ++++++++++++++++----
- 1 file changed, 23 insertions(+), 4 deletions(-)
-
-diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
-index 2967da58..8d6686ba 100644
---- a/libtiff/tif_dirwrite.c
-+++ b/libtiff/tif_dirwrite.c
-@@ -2111,7 +2111,10 @@ TIFFWriteDirectoryTagCheckedLong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, ui
- {
- 	uint64 m;
- 	assert(sizeof(uint64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	m=value;
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabLong8(&m);
-@@ -2124,7 +2127,10 @@ TIFFWriteDirectoryTagCheckedLong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* di
- {
- 	assert(count<0x20000000);
- 	assert(sizeof(uint64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabArrayOfLong8(value,count);
- 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_LONG8,count,count*8,value));
-@@ -2136,7 +2142,10 @@ TIFFWriteDirectoryTagCheckedSlong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, u
- {
- 	int64 m;
- 	assert(sizeof(int64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	m=value;
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabLong8((uint64*)(&m));
-@@ -2149,7 +2158,10 @@ TIFFWriteDirectoryTagCheckedSlong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* d
- {
- 	assert(count<0x20000000);
- 	assert(sizeof(int64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabArrayOfLong8((uint64*)value,count);
- 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_SLONG8,count,count*8,value));
--- 
-2.11.0
-
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 516cb06266..21eb4bd37a 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 59d7a5a8ccd92059913f246877db95a2918e6c04fb9d43fd74e5c3390dac2910  tiff-4.0.8.tar.gz
+sha256 2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4  tiff-4.0.10.tar.gz
+sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 405cb9251f..aef08b341d 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.0.8
+TIFF_VERSION = 4.0.10
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
