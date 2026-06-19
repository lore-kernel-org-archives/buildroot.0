Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F76CCD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 17:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CC3C84E62;
	Fri, 19 Jun 2026 17:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1J-Cuo64F48S; Fri, 19 Jun 2026 17:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E239884E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781890243;
	bh=oqEbS+H7plk8ddr8rcw+rRsIlG38Lwvr4Q1NcAwvvDY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jOB4uQnIxVROsVLWt87TmZxd6aVZc/9T09XqatDDGxG+Q10J2jfbS3PfHg1QqwLTp
	 g30p525ZO6rRJqXkt8o0oXMb9mRYYxcYXM6ltH/JiE70sk2k4cRfeEc2qqAUb5MpOM
	 p1/9Sbgsn7hTGTJ7m2JizAe+phAyHW5x+Ry3UAYGf5Whn0B+h5Ash6I/mosvsvTmss
	 3jz+KcU5B6gLxd2r0y8HQXpieyDD6RMtbGH9KoSWDEoGmy8vJsK8XzJt7f9FwYlMiI
	 aEB7AUnC6rZ3QO8uxyTAQaD1X4SuUkeExUHojcDclfyzBJo7uT+k2GyyiWGVltq8c5
	 8HkRLwDREd6lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E239884E79;
	Fri, 19 Jun 2026 17:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99C5D279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87ACF41317
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTLZiirYWUrq for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 17:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7164405EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7164405EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7164405EF
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:30:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a031f.dip0.t-ipconnect.de [91.58.3.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79D33A4C060A
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 19:30:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36798)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wad36-0000000089t-263D
 for buildroot@buildroot.org; Fri, 19 Jun 2026 17:30:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 19:30:36 +0200
Message-ID: <20260619173036.3338267-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781890237;
 bh=MZrw2542vzbRHQHthQKVBbEH9zvoq1gloYS57pNvH4U=;
 h=From:To:Subject:Date:From;
 b=Ux5zHpISTnNXm2pXWTKr1tVK7Bz7JF4wT5KIz3i5lls4gH/n8cM/ukKB/BmgI48P2
 //bx+ggARlEFCJCE7+EwzD77Qa90KKE0PbYPGV7R2xDQw/uMQi328CPJYnbRHEoxZF
 JcT+jE2p7+h5pFzbuXbR6xa3j8v/DnE4c9sMjaKov6FIfJX1099xUyKA4FrLpVOgYA
 DcINcI+ewBQp9+p7vTkHZBouSVH4r1lzUSMM6fqrYMfSL81LpUmUc1W9AfPq1oFqVC
 dVnwZ0JcRBEk1RCB5X7bEGDQJ8wNbpBxkQbLYjVqraq5ARMN2BLJCAaZeQwvRYGUkO
 8Tn5NQB0ajTCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ux5zHpIS
Subject: [Buildroot] [PATCH 1/1] package/tiff: add upstream patch to fix
 CVE-2026-36849
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://seclists.org/oss-sec/2026/q2/952

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7f9b1ca287845761d704f77588c0962b4fe36f22
with the exception of an unrelated build error with the
bootlin-arcle-hs38-uclibc toolchain and ghostscript.

 ...mpressionRatio-and-use-it-in-_TIFFRe.patch | 652 ++++++++++++++++++
 package/tiff/tiff.mk                          |   3 +
 2 files changed, 655 insertions(+)
 create mode 100644 package/tiff/0001-Add-TIFFGetMaxCompressionRatio-and-use-it-in-_TIFFRe.patch

diff --git a/package/tiff/0001-Add-TIFFGetMaxCompressionRatio-and-use-it-in-_TIFFRe.patch b/package/tiff/0001-Add-TIFFGetMaxCompressionRatio-and-use-it-in-_TIFFRe.patch
new file mode 100644
index 0000000000..c0690b00c6
--- /dev/null
+++ b/package/tiff/0001-Add-TIFFGetMaxCompressionRatio-and-use-it-in-_TIFFRe.patch
@@ -0,0 +1,652 @@
+From 6500c4c8abec718fc380191cefab4af8ac689c4c Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 21 Apr 2026 19:52:02 +0200
+Subject: [PATCH] Add TIFFGetMaxCompressionRatio() and use it in
+ _TIFFReadEncoded[Tile|Strip)AndAllocBuffer()
+
+```rst
+
+.. c:function:: uint64_t TIFFGetMaxCompressionRatio(TIFF *tif);
+
+Description
+-----------
+
+:c:func:`TIFFGetMaxCompressionRatio` returns the maximum compression ratio
+for the current codec, which is typically achieved for a uncompressed buffer
+with all bytes at zero.
+
+This function can be used to determine if the compressed size of a strip or tile
+is realistic compared to the expected uncompressed size, to prevent some
+denial-of-service scenarios.
+
+Depending on the codec, it may take into account the strip or tile size,
+number of samples per pixel, etc.
+
+Some codecs don't implement that method, or only for a subset of configurations,
+and may return 0 when the maximum compression ratio is unknown.
+
+Return values
+-------------
+
+0 is returned if no maximum compression ratio is known.
+1 is returned when there is no compression.
+Values strictly bigger than 1 are returned when a maximum compression ratio is
+known.
+```
+
+Fixes #781
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/commit/eedba405d3695b52faae65994c5904f228eca0bf
+CVE: CVE-2026-36849
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for tiff 4.7.1]
+---
+ doc/Makefile.am                              |  1 +
+ doc/conf.py                                  |  1 +
+ doc/functions/TIFFGetMaxCompressionRatio.rst | 40 ++++++++++++++++++++
+ doc/functions/libtiff.rst                    |  2 +
+ libtiff/libtiff.def                          |  1 +
+ libtiff/libtiff.map                          |  4 ++
+ libtiff/tif_compress.c                       | 22 +++++++++++
+ libtiff/tif_fax3.c                           | 34 +++++++++++++++++
+ libtiff/tif_jpeg.c                           | 25 ++++++++++++
+ libtiff/tif_lerc.c                           | 11 ++++++
+ libtiff/tif_lzma.c                           | 13 +++++++
+ libtiff/tif_lzw.c                            | 12 ++++++
+ libtiff/tif_packbits.c                       |  8 ++++
+ libtiff/tif_pixarlog.c                       | 10 +++++
+ libtiff/tif_read.c                           | 37 +++++++++++-------
+ libtiff/tif_webp.c                           |  9 +++++
+ libtiff/tif_zip.c                            |  8 ++++
+ libtiff/tiffio.h                             |  1 +
+ libtiff/tiffiop.h                            |  5 ++-
+ 19 files changed, 230 insertions(+), 14 deletions(-)
+ create mode 100644 doc/functions/TIFFGetMaxCompressionRatio.rst
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 543e6c9b..8db4e1f5 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -191,6 +191,7 @@ rst_sources = \
+ 	functions/TIFFReadFromUserBuffer.rst \
+ 	functions/TIFFSetTagExtender.rst \
+ 	functions/TIFFStrileQuery.rst \
++	functions/TIFFGetMaxCompressionRatio.rst \
+ 	libtiff.rst \
+ 	multi_page.rst \
+ 	images.rst
+diff --git a/doc/conf.py b/doc/conf.py
+index 343eeef3..2fd31cf0 100644
+--- a/doc/conf.py
++++ b/doc/conf.py
+@@ -137,6 +137,7 @@ man_pages = [
+     ('functions/TIFFFieldWriteCount', 'TIFFFieldWriteCount', 'get number of values to be written to field', author, '3tiff'),
+     ('functions/TIFFFlush', 'TIFFFlush', 'flush pending writes to an open TIFF file', author, '3tiff'),
+     ('functions/TIFFGetField', 'TIFFGetField', 'get the value(s) of a tag in an open TIFF file', author, '3tiff'),
++    ('functions/TIFFGetMaxCompressionRatio', 'TIFFGetMaxCompressionRatio', 'return maximum compression ratio for current codec', author, '3tiff'),
+     ('functions/TIFFmemory', 'TIFFmemory', 'memory management-related functions for use with TIFF files', author, '3tiff'),
+     ('functions/TIFFMergeFieldInfo', 'TIFFMergeFieldInfo', 'add application-defined TIFF tags to the list of known libtiff tags', author, '3tiff'),
+     ('functions/TIFFOpen', 'TIFFOpen', 'open a TIFF file for reading or writing', author, '3tiff'),
+diff --git a/doc/functions/TIFFGetMaxCompressionRatio.rst b/doc/functions/TIFFGetMaxCompressionRatio.rst
+new file mode 100644
+index 00000000..274788cd
+--- /dev/null
++++ b/doc/functions/TIFFGetMaxCompressionRatio.rst
+@@ -0,0 +1,40 @@
++TIFFGetMaxCompressionRatio
++==========================
++
++.. versionadded:: 4.7.2
++
++Synopsis
++--------
++
++.. highlight:: c
++
++::
++
++    #include <tiffio.h>
++
++.. c:function:: uint64_t TIFFGetMaxCompressionRatio(TIFF *tif);
++
++Description
++-----------
++
++:c:func:`TIFFGetMaxCompressionRatio` returns the maximum compression ratio
++for the current codec, which is typically achieved for a uncompressed buffer
++with all bytes at zero.
++
++This function can be used to determine if the compressed size of a strip or tile
++is realistic compared to the expected uncompressed size, to prevent some
++denial-of-service scenarios.
++
++Depending on the codec, it may take into account the strip or tile size,
++number of samples per pixel, etc.
++
++Some codecs don't implement that method, or only for a subset of configurations,
++and may return 0 when the maximum compression ratio is unknown.
++
++Return values
++-------------
++
++0 is returned if no maximum compression ratio is known.
++1 is returned when there is no compression.
++Values strictly bigger than 1 are returned when a maximum compression ratio is
++known.
+diff --git a/doc/functions/libtiff.rst b/doc/functions/libtiff.rst
+index bfc13bce..5fafb57c 100644
+--- a/doc/functions/libtiff.rst
++++ b/doc/functions/libtiff.rst
+@@ -268,6 +268,8 @@ will work.
+     * - :c:func:`TIFFGetFieldDefaulted`
+       - return tag value in current directory with default value set if the
+         value is not already set and a default is defined
++    * - :c:func:`TIFFGetMaxCompressionRatio`
++      - return maximum compression ratio for current codec
+     * - :c:func:`TIFFGetMapFileProc`
+       - returns a pointer to memory mapping method
+     * - :c:func:`TIFFGetMode`
+diff --git a/libtiff/libtiff.def b/libtiff/libtiff.def
+index 20f1ff56..a9f18ca2 100644
+--- a/libtiff/libtiff.def
++++ b/libtiff/libtiff.def
+@@ -54,6 +54,7 @@ EXPORTS	TIFFAccessTagMethods
+ 	TIFFGetField
+ 	TIFFGetFieldDefaulted
+ 	TIFFGetMapFileProc
++	TIFFGetMaxCompressionRatio
+ 	TIFFGetMode
+ 	TIFFGetReadProc
+ 	TIFFGetSeekProc
+diff --git a/libtiff/libtiff.map b/libtiff/libtiff.map
+index 45641920..a9a767b8 100644
+--- a/libtiff/libtiff.map
++++ b/libtiff/libtiff.map
+@@ -222,3 +222,7 @@ LIBTIFF_4.6.1 {
+ LIBTIFF_4.7.1 {
+     TIFFOpenOptionsSetWarnAboutUnknownTags;
+ } LIBTIFF_4.6.1;
++
++LIBTIFF_4.7.2 {
++    TIFFGetMaxCompressionRatio;
++} LIBTIFF_4.7.1;
+diff --git a/libtiff/tif_compress.c b/libtiff/tif_compress.c
+index c6e17d3e..6d79bf7b 100644
+--- a/libtiff/tif_compress.c
++++ b/libtiff/tif_compress.c
+@@ -139,6 +139,18 @@ static int _TIFFtrue(TIFF *tif)
+ }
+ static void _TIFFvoid(TIFF *tif) { (void)tif; }
+ 
++static uint64_t _TIFFDefaultGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    return 0; /* unknown */
++}
++
++static uint64_t _TIFFGetMaxCompressionRatioOne(TIFF *tif)
++{
++    (void)tif;
++    return 1; /* no compression */
++}
++
+ void _TIFFSetDefaultCompressionState(TIFF *tif)
+ {
+     tif->tif_fixuptags = _TIFFNoFixupTags;
+@@ -160,6 +172,7 @@ void _TIFFSetDefaultCompressionState(TIFF *tif)
+     tif->tif_cleanup = _TIFFvoid;
+     tif->tif_defstripsize = _TIFFDefaultStripSize;
+     tif->tif_deftilesize = _TIFFDefaultTileSize;
++    tif->tif_getmaxcompressionratio = _TIFFDefaultGetMaxCompressionRatio;
+     tif->tif_flags &= ~(TIFF_NOBITREV | TIFF_NOREADRAW);
+ }
+ 
+@@ -168,6 +181,8 @@ int TIFFSetCompressionScheme(TIFF *tif, int scheme)
+     const TIFFCodec *c = TIFFFindCODEC((uint16_t)scheme);
+ 
+     _TIFFSetDefaultCompressionState(tif);
++    if (scheme == COMPRESSION_NONE)
++        tif->tif_getmaxcompressionratio = _TIFFGetMaxCompressionRatioOne;
+     /*
+      * Don't treat an unknown compression scheme as an error.
+      * This permits applications to open files with data that
+@@ -177,6 +192,13 @@ int TIFFSetCompressionScheme(TIFF *tif, int scheme)
+     return (c ? (*c->init)(tif, scheme) : 1);
+ }
+ 
++uint64_t TIFFGetMaxCompressionRatio(TIFF *tif)
++{
++    if (tif->tif_getmaxcompressionratio)
++        return tif->tif_getmaxcompressionratio(tif);
++    return 0;
++}
++
+ /*
+  * Other compression schemes may be registered.  Registered
+  * schemes can also override the builtin versions provided
+diff --git a/libtiff/tif_fax3.c b/libtiff/tif_fax3.c
+index 34e1c788..10b6aa9f 100644
+--- a/libtiff/tif_fax3.c
++++ b/libtiff/tif_fax3.c
+@@ -1500,6 +1500,18 @@ static void Fax3PrintDir(TIFF *tif, FILE *fd, long flags)
+         (*sp->printdir)(tif, fd, flags);
+ }
+ 
++static uint64_t Fax3GetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    /* 1024x1024: 36 */
++    /* 4096x4096: 100 */
++    /* 16383x16383: 163 */
++    /* 65536x65536: 200 */
++    /* 200000x200000: 208 */
++
++    return 250;
++}
++
+ static int InitCCITTFax3(TIFF *tif)
+ {
+     static const char module[] = "InitCCITTFax3";
+@@ -1564,6 +1576,7 @@ static int InitCCITTFax3(TIFF *tif)
+     tif->tif_encodetile = Fax3Encode;
+     tif->tif_close = Fax3Close;
+     tif->tif_cleanup = Fax3Cleanup;
++    tif->tif_getmaxcompressionratio = Fax3GetMaxCompressionRatio;
+ 
+     return (1);
+ }
+@@ -1713,6 +1726,12 @@ static int Fax4PostEncode(TIFF *tif)
+     return (1);
+ }
+ 
++static uint64_t Fax4GetMaxCompressionRatio(TIFF *tif)
++{
++    return isTiled(tif) ? tif->tif_dir.td_tilewidth
++                        : tif->tif_dir.td_imagewidth;
++}
++
+ int TIFFInitCCITTFax4(TIFF *tif, int scheme)
+ {
+     (void)scheme;
+@@ -1735,6 +1754,7 @@ int TIFFInitCCITTFax4(TIFF *tif, int scheme)
+         tif->tif_encodestrip = Fax4Encode;
+         tif->tif_encodetile = Fax4Encode;
+         tif->tif_postencode = Fax4PostEncode;
++        tif->tif_getmaxcompressionratio = Fax4GetMaxCompressionRatio;
+         /*
+          * Suppress RTC at the end of each strip.
+          */
+@@ -1806,6 +1826,18 @@ static int Fax3DecodeRLE(TIFF *tif, uint8_t *buf, tmsize_t occ, uint16_t s)
+     return (1);
+ }
+ 
++static uint64_t Fax3RLEGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    /* 1024x1024: 43 */
++    /* 4096x4096: 128 */
++    /* 16383x16383: 171 */
++    /* 65536x65536: 205 */
++    /* 200000x200000: 211 */
++
++    return 250;
++}
++
+ int TIFFInitCCITTRLE(TIFF *tif, int scheme)
+ {
+     (void)scheme;
+@@ -1814,6 +1846,7 @@ int TIFFInitCCITTRLE(TIFF *tif, int scheme)
+         tif->tif_decoderow = Fax3DecodeRLE;
+         tif->tif_decodestrip = Fax3DecodeRLE;
+         tif->tif_decodetile = Fax3DecodeRLE;
++        tif->tif_getmaxcompressionratio = Fax3RLEGetMaxCompressionRatio;
+         /*
+          * Suppress RTC+EOLs when encoding and byte-align data.
+          */
+@@ -1832,6 +1865,7 @@ int TIFFInitCCITTRLEW(TIFF *tif, int scheme)
+         tif->tif_decoderow = Fax3DecodeRLE;
+         tif->tif_decodestrip = Fax3DecodeRLE;
+         tif->tif_decodetile = Fax3DecodeRLE;
++        tif->tif_getmaxcompressionratio = Fax3RLEGetMaxCompressionRatio;
+         /*
+          * Suppress RTC+EOLs when encoding and word-align data.
+          */
+diff --git a/libtiff/tif_jpeg.c b/libtiff/tif_jpeg.c
+index aba5f99b..635e9cee 100644
+--- a/libtiff/tif_jpeg.c
++++ b/libtiff/tif_jpeg.c
+@@ -2793,6 +2793,30 @@ static int JPEGInitializeLibJPEG(TIFF *tif, int decompress)
+     return 1;
+ }
+ 
++static uint64_t JPEGGetMaxCompressionRatio(TIFF *tif)
++{
++    JPEGState *sp = JState(tif);
++    if ((tif->tif_dir.td_photometric == PHOTOMETRIC_YCBCR) &&
++        (tif->tif_dir.td_planarconfig == PLANARCONFIG_CONTIG) &&
++        (tif->tif_dir.td_samplesperpixel == 3))
++    {
++        if (sp->h_sampling == 2 && sp->v_sampling == 2)
++        {
++            if (tif->tif_dir.td_bitspersample == 12)
++                return 768;
++            else
++                return 512;
++        }
++
++        return 0; /* unknown */
++    }
++
++    if (tif->tif_dir.td_bitspersample == 12)
++        return 384;
++    else
++        return 256;
++}
++
+ /* Common to tif_jpeg.c and tif_jpeg_12.c */
+ static void TIFFInitJPEGCommon(TIFF *tif)
+ {
+@@ -2829,6 +2853,7 @@ static void TIFFInitJPEGCommon(TIFF *tif)
+     tif->tif_encoderow = JPEGEncode;
+     tif->tif_encodestrip = JPEGEncode;
+     tif->tif_encodetile = JPEGEncode;
++    tif->tif_getmaxcompressionratio = JPEGGetMaxCompressionRatio;
+     tif->tif_cleanup = JPEGCleanup;
+ 
+     tif->tif_defstripsize = JPEGDefaultStripSize;
+diff --git a/libtiff/tif_lerc.c b/libtiff/tif_lerc.c
+index 76d1a7b4..a5aad2de 100644
+--- a/libtiff/tif_lerc.c
++++ b/libtiff/tif_lerc.c
+@@ -1477,6 +1477,16 @@ static int LERCVGetField(TIFF *tif, uint32_t tag, va_list ap)
+     return 1;
+ }
+ 
++static uint64_t LERCGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++
++    /* LERC compression ratio can grow to several millions */
++    /* eg. 5703725 for Lerc deflate on 16383x16383 array */
++    /* or 3829644 for regular Lerc */
++    return 0;
++}
++
+ int TIFFInitLERC(TIFF *tif, int scheme)
+ {
+     static const char module[] = "TIFFInitLERC";
+@@ -1527,6 +1537,7 @@ int TIFFInitLERC(TIFF *tif, int scheme)
+     tif->tif_encodestrip = LERCEncode;
+     tif->tif_encodetile = LERCEncode;
+ #endif
++    tif->tif_getmaxcompressionratio = LERCGetMaxCompressionRatio;
+     tif->tif_cleanup = LERCCleanup;
+ 
+     /* Default values for codec-specific fields */
+diff --git a/libtiff/tif_lzma.c b/libtiff/tif_lzma.c
+index 9834ae2c..46b556b8 100644
+--- a/libtiff/tif_lzma.c
++++ b/libtiff/tif_lzma.c
+@@ -454,6 +454,17 @@ static const TIFFField lzmaFields[] = {
+      FALSE, "LZMA2 Compression Preset", NULL},
+ };
+ 
++static uint64_t LZMAGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    /* 1024x1024: 3800 */
++    /* 4096x4096: 6534 */
++    /* 16383x16383: 6846 */
++    /* 65536x65536: 6874 */
++
++    return 7000;
++}
++
+ int TIFFInitLZMA(TIFF *tif, int scheme)
+ {
+     static const char module[] = "TIFFInitLZMA";
+@@ -529,6 +540,8 @@ int TIFFInitLZMA(TIFF *tif, int scheme)
+     tif->tif_encodestrip = LZMAEncode;
+     tif->tif_encodetile = LZMAEncode;
+     tif->tif_cleanup = LZMACleanup;
++    tif->tif_getmaxcompressionratio = LZMAGetMaxCompressionRatio;
++
+     /*
+      * Setup predictor setup.
+      */
+diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
+index 4bf845b3..a0a0cbf0 100644
+--- a/libtiff/tif_lzw.c
++++ b/libtiff/tif_lzw.c
+@@ -1397,6 +1397,17 @@ static void LZWCleanup(TIFF *tif)
+     _TIFFSetDefaultCompressionState(tif);
+ }
+ 
++static uint64_t LZWGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    /* 1024x1024: 562 */
++    /* 4096x4096: 1243 */
++    /* 16383x16383: 1353 */
++    /* 65536x65536: 1362 */
++
++    return 1400;
++}
++
+ int TIFFInitLZW(TIFF *tif, int scheme)
+ {
+     static const char module[] = "TIFFInitLZW";
+@@ -1430,6 +1441,7 @@ int TIFFInitLZW(TIFF *tif, int scheme)
+     tif->tif_encodestrip = LZWEncode;
+     tif->tif_encodetile = LZWEncode;
+ #endif
++    tif->tif_getmaxcompressionratio = LZWGetMaxCompressionRatio;
+     tif->tif_cleanup = LZWCleanup;
+     /*
+      * Setup predictor setup.
+diff --git a/libtiff/tif_packbits.c b/libtiff/tif_packbits.c
+index d7db9b64..6250d06e 100644
+--- a/libtiff/tif_packbits.c
++++ b/libtiff/tif_packbits.c
+@@ -312,6 +312,12 @@ static int PackBitsDecode(TIFF *tif, uint8_t *op, tmsize_t occ, uint16_t s)
+     return (1);
+ }
+ 
++static uint64_t PackBitsGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    return 64;
++}
++
+ int TIFFInitPackBits(TIFF *tif, int scheme)
+ {
+     (void)scheme;
+@@ -325,6 +331,8 @@ int TIFFInitPackBits(TIFF *tif, int scheme)
+     tif->tif_encodestrip = PackBitsEncodeChunk;
+     tif->tif_encodetile = PackBitsEncodeChunk;
+ #endif
++    tif->tif_getmaxcompressionratio = PackBitsGetMaxCompressionRatio;
++
+     return (1);
+ }
+ #endif /* PACKBITS_SUPPORT */
+diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c
+index 30905480..06ecf1d8 100644
+--- a/libtiff/tif_pixarlog.c
++++ b/libtiff/tif_pixarlog.c
+@@ -1601,6 +1601,15 @@ static const TIFFField pixarlogFields[] = {
+     {TIFFTAG_PIXARLOGQUALITY, 0, 0, TIFF_ANY, 0, TIFF_SETGET_INT, FIELD_PSEUDO,
+      FALSE, FALSE, "", NULL}};
+ 
++static uint64_t PixarLogGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    /* cf https://zlib.net/zlib_tech.html */
++    const uint64_t MAX_DEFLATE_RATIO = 1032;
++
++    /* security margin as I don't understand what this codec does */
++    return MAX_DEFLATE_RATIO * (uint64_t)4;
++}
+ int TIFFInitPixarLog(TIFF *tif, int scheme)
+ {
+     static const char module[] = "TIFFInitPixarLog";
+@@ -1648,6 +1657,7 @@ int TIFFInitPixarLog(TIFF *tif, int scheme)
+     tif->tif_encodetile = PixarLogEncode;
+     tif->tif_close = PixarLogClose;
+     tif->tif_cleanup = PixarLogCleanup;
++    tif->tif_getmaxcompressionratio = PixarLogGetMaxCompressionRatio;
+ 
+     /* Override SetField so we can handle our private pseudo-tag */
+     sp->vgetparent = tif->tif_tagmethods.vgetfield;
+diff --git a/libtiff/tif_read.c b/libtiff/tif_read.c
+index a2bb3046..a5c01921 100644
+--- a/libtiff/tif_read.c
++++ b/libtiff/tif_read.c
+@@ -603,13 +603,31 @@ tmsize_t _TIFFReadEncodedStripAndAllocBuffer(TIFF *tif, uint32_t strip,
+     if (!TIFFFillStrip(tif, strip))
+         return ((tmsize_t)(-1));
+ 
+-    *buf = _TIFFmallocExt(tif, bufsizetoalloc);
++    /* Sanity checks to avoid excessive memory allocation */
++    /* Max compression ratio experimentally determined. Might be fragile...
++     * Only apply this heuristics to situations where the memory allocation
++     * would be big, to avoid breaking nominal use cases.
++     */
++    const uint64_t maxCompressionRatio = TIFFGetMaxCompressionRatio(tif);
++    if (maxCompressionRatio > 0 && bufsizetoalloc > 100 * 1000 * 1000 &&
++        (uint64_t)tif->tif_rawdatasize <
++            (uint64_t)this_stripsize / maxCompressionRatio)
++    {
++        TIFFErrorExtR(tif, TIFFFileName(tif),
++                      "Likely invalid strip byte count for strip %u. "
++                      "Uncompressed strip size is %" PRIu64 ", "
++                      "compressed one is %" PRIu64,
++                      strip, (uint64_t)this_stripsize,
++                      (uint64_t)tif->tif_rawdatasize);
++        return ((tmsize_t)(-1));
++    }
++
++    *buf = _TIFFcallocExt(tif, 1, bufsizetoalloc);
+     if (*buf == NULL)
+     {
+         TIFFErrorExtR(tif, TIFFFileName(tif), "No space for strip buffer");
+         return ((tmsize_t)(-1));
+     }
+-    _TIFFmemset(*buf, 0, bufsizetoalloc);
+ 
+     if ((*tif->tif_decodestrip)(tif, *buf, this_stripsize, plane) <= 0)
+         return ((tmsize_t)(-1));
+@@ -1072,17 +1090,10 @@ tmsize_t _TIFFReadEncodedTileAndAllocBuffer(TIFF *tif, uint32_t tile,
+          * Only apply this heuristics to situations where the memory allocation
+          * would be big, to avoid breaking nominal use cases.
+          */
+-        const int maxCompressionRatio =
+-            td->td_compression == COMPRESSION_ZSTD ? 33000
+-            : td->td_compression == COMPRESSION_JXL
+-                ?
+-                /* Evaluated on a 8000x8000 tile */
+-                25000 * (td->td_planarconfig == PLANARCONFIG_CONTIG
+-                             ? td->td_samplesperpixel
+-                             : 1)
+-                : td->td_compression == COMPRESSION_LZMA ? 7000 : 1000;
+-        if (bufsizetoalloc > 100 * 1000 * 1000 &&
+-            tif->tif_rawdatasize < tilesize / maxCompressionRatio)
++        const uint64_t maxCompressionRatio = TIFFGetMaxCompressionRatio(tif);
++        if (maxCompressionRatio > 0 && bufsizetoalloc > 100 * 1000 * 1000 &&
++            (uint64_t)tif->tif_rawdatasize <
++                (uint64_t)tilesize / maxCompressionRatio)
+         {
+             TIFFErrorExtR(tif, TIFFFileName(tif),
+                           "Likely invalid tile byte count for tile %u. "
+diff --git a/libtiff/tif_webp.c b/libtiff/tif_webp.c
+index c06ce163..15660f6a 100644
+--- a/libtiff/tif_webp.c
++++ b/libtiff/tif_webp.c
+@@ -844,6 +844,14 @@ static const TIFFField TWebPFields[] = {
+      FIELD_PSEUDO, TRUE, FALSE, "WEBP exact lossless", NULL},
+ };
+ 
++static uint64_t TWebPGetMaxCompressionRatio(TIFF *tif)
++{
++    /* lossy compression: */
++    /* return (tif->tif_dir.td_samplesperpixel == 4) ? 2199 : 1685; */
++    /* lossless compression: */
++    return (tif->tif_dir.td_samplesperpixel == 4) ? 104194 : 78146;
++}
++
+ int TIFFInitWebP(TIFF *tif, int scheme)
+ {
+     static const char module[] = "TIFFInitWebP";
+@@ -907,6 +915,7 @@ int TIFFInitWebP(TIFF *tif, int scheme)
+     tif->tif_encodestrip = TWebPEncode;
+     tif->tif_encodetile = TWebPEncode;
+     tif->tif_cleanup = TWebPCleanup;
++    tif->tif_getmaxcompressionratio = TWebPGetMaxCompressionRatio;
+ 
+     return 1;
+ bad:
+diff --git a/libtiff/tif_zip.c b/libtiff/tif_zip.c
+index 8abf88ae..c7f02ac0 100644
+--- a/libtiff/tif_zip.c
++++ b/libtiff/tif_zip.c
+@@ -698,6 +698,13 @@ static void TIFF_zfree(void *opaque, void *ptr)
+     _TIFFfreeExt((TIFF *)opaque, ptr);
+ }
+ 
++static uint64_t ZIPGetMaxCompressionRatio(TIFF *tif)
++{
++    (void)tif;
++    /* cf https://zlib.net/zlib_tech.html */
++    return 1032;
++}
++
+ int TIFFInitZIP(TIFF *tif, int scheme)
+ {
+     static const char module[] = "TIFFInitZIP";
+@@ -764,6 +771,7 @@ int TIFFInitZIP(TIFF *tif, int scheme)
+     tif->tif_encodestrip = ZIPEncode;
+     tif->tif_encodetile = ZIPEncode;
+     tif->tif_cleanup = ZIPCleanup;
++    tif->tif_getmaxcompressionratio = ZIPGetMaxCompressionRatio;
+     /*
+      * Setup predictor setup.
+      */
+diff --git a/libtiff/tiffio.h b/libtiff/tiffio.h
+index f9c206e3..eb4cec64 100644
+--- a/libtiff/tiffio.h
++++ b/libtiff/tiffio.h
+@@ -584,6 +584,7 @@ extern int TIFFReadRGBAImageOriented(TIFF *, uint32_t, uint32_t, uint32_t *,
+                                          tmsize_t cc);
+     extern tmsize_t TIFFWriteRawTile(TIFF *tif, uint32_t tile, void *data,
+                                      tmsize_t cc);
++    extern uint64_t TIFFGetMaxCompressionRatio(TIFF *tif);
+     extern int TIFFDataWidth(
+         TIFFDataType); /* table of tag datatype widths within TIFF file. */
+     extern void TIFFSetWriteOffset(TIFF *tif, toff_t off);
+diff --git a/libtiff/tiffiop.h b/libtiff/tiffiop.h
+index 80c04c27..e21513ad 100644
+--- a/libtiff/tiffiop.h
++++ b/libtiff/tiffiop.h
+@@ -94,6 +94,7 @@ typedef int (*TIFFSeekMethod)(TIFF *, uint32_t);
+ typedef void (*TIFFPostMethod)(TIFF *tif, uint8_t *buf, tmsize_t size);
+ typedef uint32_t (*TIFFStripMethod)(TIFF *, uint32_t);
+ typedef void (*TIFFTileMethod)(TIFF *, uint32_t *, uint32_t *);
++typedef uint64_t (*TIFFGetMaxCompressionRatioMethod)(TIFF *);
+ 
+ struct TIFFOffsetAndDirNumber
+ {
+@@ -216,7 +217,9 @@ struct tiff
+     TIFFVoidMethod tif_cleanup;       /* cleanup state routine */
+     TIFFStripMethod tif_defstripsize; /* calculate/constrain strip size */
+     TIFFTileMethod tif_deftilesize;   /* calculate/constrain tile size */
+-    uint8_t *tif_data;                /* compression scheme private data */
++    /* returns maximum compression ratio for current compression method */
++    TIFFGetMaxCompressionRatioMethod tif_getmaxcompressionratio;
++    uint8_t *tif_data; /* compression scheme private data */
+     /* input/output buffering */
+     tmsize_t tif_scanlinesize;  /* # of bytes in a scanline */
+     tmsize_t tif_scanlineskew;  /* scanline skew for reading strips */
+-- 
+2.47.3
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e64a6baf83..8c8824b1da 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,6 +13,9 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# 0001-Add-TIFFGetMaxCompressionRatio-and-use-it-in-_TIFFRe.patch
+TIFF_IGNORE_CVES += CVE-2026-36849
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
