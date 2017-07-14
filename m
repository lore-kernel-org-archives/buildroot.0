From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 19:31:03 +0200
Subject: [Buildroot] [git commit] tiff: add upstream security fix for
	CVE-2017-10688
Message-ID: <20170714173227.AC73C821DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=544ac6bca09edabb587db42ccb3ae51df58a3a56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-10688 - n LibTIFF 4.0.8, there is a assertion abort in the
TIFFWriteDirectoryTagCheckedLong8Array function in tif_dirwrite.c.  A
crafted input will lead to a remote denial of service attack.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ..._dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch b/package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch
new file mode 100644
index 0000000..2be989b
--- /dev/null
+++ b/package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch
@@ -0,0 +1,70 @@
+From 6173a57d39e04d68b139f8c1aa499a24dbe74ba1 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Fri, 30 Jun 2017 17:29:44 +0000
+Subject: [PATCH] * libtiff/tif_dirwrite.c: in
+ TIFFWriteDirectoryTagCheckedXXXX() functions associated with LONG8/SLONG8
+ data type, replace assertion that the file is BigTIFF, by a non-fatal error.
+ Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2712 Reported by team
+ OWL337
+
+[Peter: drop ChangeLog modification]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libtiff/tif_dirwrite.c | 20 ++++++++++++++++----
+ 1 file changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 2967da58..8d6686ba 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -2111,7 +2111,10 @@ TIFFWriteDirectoryTagCheckedLong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, ui
+ {
+ 	uint64 m;
+ 	assert(sizeof(uint64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	m=value;
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabLong8(&m);
+@@ -2124,7 +2127,10 @@ TIFFWriteDirectoryTagCheckedLong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* di
+ {
+ 	assert(count<0x20000000);
+ 	assert(sizeof(uint64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabArrayOfLong8(value,count);
+ 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_LONG8,count,count*8,value));
+@@ -2136,7 +2142,10 @@ TIFFWriteDirectoryTagCheckedSlong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, u
+ {
+ 	int64 m;
+ 	assert(sizeof(int64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	m=value;
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabLong8((uint64*)(&m));
+@@ -2149,7 +2158,10 @@ TIFFWriteDirectoryTagCheckedSlong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* d
+ {
+ 	assert(count<0x20000000);
+ 	assert(sizeof(int64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabArrayOfLong8((uint64*)value,count);
+ 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_SLONG8,count,count*8,value));
+-- 
+2.11.0
+
