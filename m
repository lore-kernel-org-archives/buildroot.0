Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D68CC624DB
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2806880FA3;
	Wed,  2 Sep 2026 13:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id df3UH7xLeud9; Wed,  2 Sep 2026 13:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355044;
	bh=yMvRmr7AVAF8uopanayYEAmQf0Hk3fL7kybU1jjeTl0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AWwuKcTZqIO0lbSm/O+O6URRpJ1Z792Ip3H1lCw70/COHEoZVgJ4Hs87Cwp2GS08B
	 bv+qinIqO4Ioei/+AQxhBXyGRxUaZ09717krv/cPFQ0EOfVKX8DJhU7eli8rxzaUgH
	 II0uj0/EgryLPYmL/rTh4NkYLN8FhM/AbbB3c+HKYV3bQbFA5ZuLOQCAD26N+Q+ts9
	 tRKOqNYuXPZAByrXfdx1Udp83bUyCMfCQtYE0s731v0lImR38JAsTLk69EUt5hIUZ7
	 2XNQAIR0D/lKADEzq//TPrwJTqsSSdrRXsb4OZOdevB8kZQeS5FH9En5HeLgTHq4CT
	 JR0SGgu7ik6zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDA880FAB;
	Wed,  2 Sep 2026 13:17:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A81474AD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E6CF4005A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFCiVcRCHfv7 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27E4E4004D
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so726223f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355030; x=1788959830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xw598v/l9fID6zORFQl3Rug50awXnYAPgC8deXvnK1M=;
 b=pXm7Lf1p0O72C3t6peq8zhV2Z3GBXmXIG5nFYsK0eW/6ZHsCOTfduaVEl+5KZaeKaE
 uBMPzvP2pgyABOkugswzPcerZ4j9156gUSBbMdeENfk2JzcHTyG3+XYTzEEDBGd1PJhQ
 6iqc1s5R3hktFXeypW9WIb9QKVyvoQhLX0kPUoPDXLQEwX9rDsaxyAC3OfASwOePKgQG
 VeC0f9GqbvNgOzaq0+4W4Rjit4HeVaCzz64JsWQqBz7On2m8fE/va/N+GUOqHztYYpJF
 YmFJ1ZC+ikvndLAe15bccipBSB2hfAePnC+Swaf6HDQ+EDXCQfnz9BlQ5k8TPSDAlrh/
 HgUQ==
X-Gm-Message-State: AFuF++lPlihkdkELb7ftK2Cigo7ZwTLXWCK3/JSFmF9da+uhenHt+nuF
 m5IQuVchw2pYSwP4ecgz47EqG888pLjcTuQYaDgcgg/LvnCDWGRSjzkdqz425n/M0uU4xAHfoxf
 w7gGDid4=
X-Gm-Gg: AYBFou3H2m4uI725shr5c7D2fe4rRTK+wom4uJ+dcTesgtyuvI5GedX7pyWi50AW9X4
 b6Mn/zfXvIiqsKK9UUpADD6653acr+QnNM0Lv7eH/JrsuwKJAkDcyESNmVfSUrMi8GZG1Bn9IF1
 ZqBFAmNhZz5MoOIGkD9pcgHziiFYCJitMCFYH62a+TOVs+RMQS3IRmksGGNqrJRbbFDOdgv/Kt2
 OTIN33jacKBu3p1An4X+Hkom0kWGOEg3qONgQT5W2PkkonnLMTo8R98ztoKJO6NRTiBgM3M4vsC
 GBnYOHHRkpck2wyd089J6dWiSPNPdRmFPCGQAD3yGyX0/mqbvyArekNYt7CrfoX2dmo4VGHR89i
 My2dIhKs/gw1bf/qlCmKjQ2uePLXBE49Ya6eRDEve9radVohwjhJCft/QOsn382xc0EZydaP7zd
 1vYEZGMhmVKMsG7m9lw0p3CiDCha4zOLUKdda3dPa+a3eO1iqg7GU/kRdCuX+SeAw12+GGPyaIS
 CvI
X-Received: by 2002:a05:6000:1847:b0:482:fb9e:4e20 with SMTP id
 ffacd0b85a97d-48488dee407mr8269043f8f.6.1788355029859; 
 Wed, 02 Sep 2026 06:17:09 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:40 +0200
Message-ID: <20260902131640.379588-16-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 15/15] package/clamav: add
 patch for CVE-2026-20348
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...xar-limits-against-inflated-toc-size.patch | 277 ++++++++++++++++++
 package/clamav/clamav.mk                      |   3 +
 2 files changed, 280 insertions(+)
 create mode 100644 package/clamav/0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch

diff --git a/package/clamav/0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch b/package/clamav/0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch
new file mode 100644
index 0000000000..962ccfcf40
--- /dev/null
+++ b/package/clamav/0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch
@@ -0,0 +1,277 @@
+From: John Humlick <15677335+jhumlick@users.noreply.github.com>
+Date: Fri, 17 Jul 2026 15:27:26 -0700
+Subject: libclamav: Enforce XAR limits against inflated TOC size
+
+Inflate XAR table-of-contents data incrementally and enforce scan and
+allocation limits against the actual output instead of the declared
+header length. Require the compressed stream to finish before parsing.
+
+Add regression coverage for mismatched TOC lengths, oversized actual
+output, and incomplete compressed streams.
+
+CLAM-3010
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/10ee017ebe51ecd593bf13944a25c6c8fe70aa8a
+CVE: CVE-2026-20348
+[Titouan: fix merge conflict with clamav-1.4.3: drop diff for test file not in tree]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/xar.c | 190 +++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 149 insertions(+), 41 deletions(-)
+
+diff --git a/libclamav/xar.c b/libclamav/xar.c
+index 12f911551..a4fac0b3a 100644
+--- a/libclamav/xar.c
++++ b/libclamav/xar.c
+@@ -34,6 +34,8 @@
+ #include "inflate64.h"
+ #include "lzma_iface.h"
+ 
++#define XAR_TOC_INFLATE_CHUNK_SIZE (64 * 1024)
++
+ /*
+    xar_cleanup_temp_file - cleanup after cli_gentempfd
+    parameters:
+@@ -408,6 +410,124 @@ static int xar_hash_check(int hash, const void *result, const void *expected)
+     return memcmp(result, expected, len);
+ }
+ 
++static cl_error_t xar_inflate_toc(cli_ctx *ctx, const unsigned char *compressed_toc, size_t compressed_length,
++                                  char **toc_out, size_t *toc_length_out)
++{
++    cl_error_t ret = CL_SUCCESS;
++    z_stream strm;
++    char *toc                = NULL;
++    size_t capacity          = XAR_TOC_INFLATE_CHUNK_SIZE;
++    size_t toc_length        = 0;
++    bool inflate_initialized = false;
++
++    memset(&strm, 0, sizeof(strm));
++
++    if (compressed_length > UINT_MAX) {
++        cli_dbgmsg("cli_scanxar: Compressed TOC is too large for zlib.\n");
++        return CL_EFORMAT;
++    }
++
++    toc = cli_max_malloc(capacity);
++    if (toc == NULL) {
++        cli_dbgmsg("cli_scanxar: Failed to allocate the initial TOC buffer.\n");
++        return CL_EMEM;
++    }
++
++    strm.next_in  = (unsigned char *)compressed_toc;
++    strm.avail_in = (uInt)compressed_length;
++
++    if (inflateInit(&strm) != Z_OK) {
++        cli_dbgmsg("cli_scanxar: inflateInit failed.\n");
++        ret = CL_EFORMAT;
++        goto done;
++    }
++    inflate_initialized = true;
++
++    while (true) {
++        uInt avail_in_before;
++        uInt output_available;
++        size_t produced;
++        int zret;
++
++        output_available = (uInt)(capacity - toc_length - 1);
++        strm.next_out    = (unsigned char *)toc + toc_length;
++        strm.avail_out   = output_available;
++        avail_in_before  = strm.avail_in;
++
++        zret     = inflate(&strm, Z_NO_FLUSH);
++        produced = output_available - strm.avail_out;
++
++        if (toc_length > SIZE_MAX - produced) {
++            cli_dbgmsg("cli_scanxar: Decompressed TOC length overflow.\n");
++            ret = CL_EFORMAT;
++            goto done;
++        }
++        toc_length += produced;
++
++        ret = cli_checklimits("cli_scanxar", ctx, toc_length, 0, 0);
++        if (ret != CL_SUCCESS) {
++            goto done;
++        }
++
++        if (zret == Z_STREAM_END) {
++            break;
++        }
++        if (zret != Z_OK) {
++            cli_dbgmsg("cli_scanxar: inflate failed with status %d.\n", zret);
++            ret = CL_EFORMAT;
++            goto done;
++        }
++        if (produced == 0 && strm.avail_in == avail_in_before) {
++            cli_dbgmsg("cli_scanxar: inflate made no progress before reaching the end of the TOC stream.\n");
++            ret = CL_EFORMAT;
++            goto done;
++        }
++
++        if (strm.avail_out == 0) {
++            char *new_toc;
++            size_t new_capacity;
++
++            if (capacity == CLI_MAX_ALLOCATION) {
++                cli_dbgmsg("cli_scanxar: Decompressed TOC exceeds the internal allocation limit.\n");
++                ret = CL_EFORMAT;
++                goto done;
++            }
++
++            new_capacity = capacity + XAR_TOC_INFLATE_CHUNK_SIZE;
++            if (new_capacity < capacity || new_capacity > CLI_MAX_ALLOCATION) {
++                new_capacity = CLI_MAX_ALLOCATION;
++            }
++
++            new_toc = cli_max_realloc(toc, new_capacity);
++            if (new_toc == NULL) {
++                cli_dbgmsg("cli_scanxar: Failed to grow the TOC buffer.\n");
++                ret = CL_EMEM;
++                goto done;
++            }
++            toc      = new_toc;
++            capacity = new_capacity;
++        }
++    }
++
++    if (inflateEnd(&strm) != Z_OK) {
++        cli_dbgmsg("cli_scanxar: inflateEnd failed.\n");
++        ret = CL_EFORMAT;
++        goto done;
++    }
++    inflate_initialized = false;
++
++    toc[toc_length] = '\0';
++    *toc_out        = toc;
++    *toc_length_out = toc_length;
++    toc             = NULL;
++
++done:
++    if (inflate_initialized)
++        inflateEnd(&strm);
++    free(toc);
++    return ret;
++}
++
+ /*
+   cli_scanxar - scan an xar archive.
+   Parameters:
+@@ -427,7 +547,8 @@ int cli_scanxar(cli_ctx *ctx)
+     size_t length, offset, size, at;
+     int encoding;
+     z_stream strm;
+-    char *toc, *tmpname = NULL;
++    char *toc = NULL, *tmpname = NULL;
++    size_t toc_length       = 0;
+     xmlTextReaderPtr reader = NULL;
+     int a_hash, e_hash;
+     unsigned char *a_cksum = NULL, *e_cksum = NULL;
+@@ -435,8 +556,6 @@ int cli_scanxar(cli_ctx *ctx)
+     char e_hash_result[SHA1_HASH_SIZE];
+     char a_hash_result[SHA1_HASH_SIZE];
+ 
+-    memset(&strm, 0x00, sizeof(z_stream));
+-
+     /* retrieve xar header */
+     if (fmap_readn(ctx->fmap, &hdr, 0, sizeof(hdr)) != sizeof(hdr)) {
+         cli_dbgmsg("cli_scanxar: Invalid header, too short.\n");
+@@ -463,46 +582,35 @@ int cli_scanxar(cli_ctx *ctx)
+     /* cli_dbgmsg("hdr.toc_length_decompressed %lu\n", hdr.toc_length_decompressed); */
+     /* cli_dbgmsg("hdr.chksum_alg %i\n", hdr.chksum_alg); */
+ 
+-    /* Uncompress TOC */
+-    strm.next_in = (unsigned char *)fmap_need_off_once(ctx->fmap, hdr.size, hdr.toc_length_compressed);
+-    if (strm.next_in == NULL) {
+-        cli_dbgmsg("cli_scanxar: fmap_need_off_once fails on TOC.\n");
+-        return CL_EREAD;
+-    }
+-    strm.avail_in = hdr.toc_length_compressed;
+-    toc           = cli_max_malloc(hdr.toc_length_decompressed + 1);
+-    if (toc == NULL) {
+-        cli_dbgmsg("cli_scanxar: cli_max_malloc fails on TOC decompress buffer.\n");
+-        return CL_EMEM;
++    /* Check time and file-count limits before inflating. Size limits are
++     * enforced against the actual decompressed TOC length below. */
++    rc = cli_checklimits("cli_scanxar", ctx, 0, 0, 0);
++    if (rc != CL_SUCCESS) {
++        return rc;
+     }
+-    toc[hdr.toc_length_decompressed] = '\0';
+-    strm.avail_out                   = hdr.toc_length_decompressed;
+-    strm.next_out                    = (unsigned char *)toc;
+-    rc                               = inflateInit(&strm);
+-    if (rc != Z_OK) {
+-        cli_dbgmsg("cli_scanxar:inflateInit error %i \n", rc);
+-        rc = CL_EFORMAT;
+-        goto exit_toc;
++
++    if (hdr.toc_length_compressed > SIZE_MAX) {
++        cli_dbgmsg("cli_scanxar: Compressed TOC length cannot be represented safely.\n");
++        return CL_EFORMAT;
+     }
+-    rc = inflate(&strm, Z_SYNC_FLUSH);
+-    if (rc != Z_OK && rc != Z_STREAM_END) {
+-        inflateEnd(&strm);
+-        cli_dbgmsg("cli_scanxar:inflate error %i \n", rc);
+-        rc = CL_EFORMAT;
+-        goto exit_toc;
++
++    /* Uncompress TOC */
++    {
++        const unsigned char *compressed_toc = fmap_need_off_once(ctx->fmap, hdr.size, (size_t)hdr.toc_length_compressed);
++
++        if (compressed_toc == NULL) {
++            cli_dbgmsg("cli_scanxar: fmap_need_off_once fails on TOC.\n");
++            return CL_EREAD;
++        }
++        rc = xar_inflate_toc(ctx, compressed_toc, (size_t)hdr.toc_length_compressed, &toc, &toc_length);
+     }
+-    rc = inflateEnd(&strm);
+-    if (rc != Z_OK) {
+-        cli_dbgmsg("cli_scanxar:inflateEnd error %i \n", rc);
+-        rc = CL_EFORMAT;
+-        goto exit_toc;
++    if (rc != CL_SUCCESS) {
++        return rc;
+     }
+ 
+-    if (hdr.toc_length_decompressed != strm.total_out) {
+-        cli_dbgmsg("TOC decompress length %" PRIu64 " does not match amount decompressed %lu\n",
+-                   hdr.toc_length_decompressed, strm.total_out);
+-        toc[strm.total_out]         = '\0';
+-        hdr.toc_length_decompressed = strm.total_out;
++    if (hdr.toc_length_decompressed != toc_length) {
++        cli_dbgmsg("TOC declared decompress length %" PRIu64 " does not match amount decompressed %zu\n",
++                   hdr.toc_length_decompressed, toc_length);
+     }
+ 
+     /* cli_dbgmsg("cli_scanxar: TOC xml:\n%s\n", toc); */
+@@ -512,7 +620,7 @@ int cli_scanxar(cli_ctx *ctx)
+ 
+     /* scan the xml */
+     cli_dbgmsg("cli_scanxar: scanning xar TOC xml in memory.\n");
+-    rc = cli_magic_scan_buff(toc, hdr.toc_length_decompressed, ctx, NULL, LAYER_ATTRIBUTES_NONE);
++    rc = cli_magic_scan_buff(toc, toc_length, ctx, NULL, LAYER_ATTRIBUTES_NONE);
+     if (rc != CL_SUCCESS) {
+         goto exit_toc;
+     }
+@@ -523,7 +631,7 @@ int cli_scanxar(cli_ctx *ctx)
+             cli_dbgmsg("cli_scanxar: Can't create temporary file for TOC.\n");
+             goto exit_toc;
+         }
+-        if (cli_writen(fd, toc, hdr.toc_length_decompressed) == (size_t)-1) {
++        if (cli_writen(fd, toc, toc_length) == (size_t)-1) {
+             cli_dbgmsg("cli_scanxar: cli_writen error writing TOC.\n");
+             rc = CL_EWRITE;
+             xar_cleanup_temp_file(ctx, fd, tmpname);
+@@ -535,7 +643,7 @@ int cli_scanxar(cli_ctx *ctx)
+             goto exit_toc;
+     }
+ 
+-    reader = xmlReaderForMemory(toc, hdr.toc_length_decompressed, "noname.xml", NULL, CLAMAV_MIN_XMLREADER_FLAGS);
++    reader = xmlReaderForMemory(toc, toc_length, "noname.xml", NULL, CLAMAV_MIN_XMLREADER_FLAGS);
+     if (reader == NULL) {
+         cli_dbgmsg("cli_scanxar: xmlReaderForMemory error for TOC\n");
+         goto exit_toc;
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index a9bc1243c1..9152028b85 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -60,6 +60,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20346
 # 0013-libclamav-harden-mach-o-section-validation-96.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20347
 
+# 0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20348
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
