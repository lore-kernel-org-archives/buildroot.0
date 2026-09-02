Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A83C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E49808C7;
	Wed,  2 Sep 2026 13:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDkXdPvlaZcC; Wed,  2 Sep 2026 13:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355038;
	bh=lspF2JL83AuPQnpLyNbw0TBM948PPnKI6H3t4vFPV5U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TP5cIYiwDrnzjtP2rqfL3cxPTlPWDhGgAx7iQGRoxANyjTyuucWChEK/nP2qb2Bcq
	 N02pVzurvbpnbwKNVAAKA+sSIxP/Vn782Dt5JWHzYf+CfkJ3ExeH5gAMT/wziYBJY5
	 0jvYCQjeU1WI8dT4qHfm0EZv8wHHLhgWY0jzN3vW51x7sbuNuS88GLNDo1+dzcEIDr
	 SbcBtn4btdpMIy5HtTLkfinkP3WpId2+veellEbJJkCde2z99fmgrOQS0DOOn3sWCD
	 byWaqHLcMp+wvSMbhFTIDq3+AzfnVQPZEbg3Y635fSjqw/unjvBH2R9dE4Kwh9WIYe
	 XNVNCer6LUeSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1F880A8C;
	Wed,  2 Sep 2026 13:17:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8F7498
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 610EE405AC
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZJNJ5-OWBrR for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16ECF40577
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-484392e3d33so639277f8f.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355026; x=1788959826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KdGujmrmVU4f8voQSjZWD1nu3ZW4F/rr9W4ckJfJM4w=;
 b=m+JMSkxWisI8dU1I+CzqUHEtULCU1NRwMHrObdn9CFYefoYz5Xf2QWcEh/zXPWZVnb
 QRVUFULrctEsZFvWgSy7EWsi/Avfj0+uZX5Xbt6Hy2a5qY/zx1QkSsfCTfOcxLKeVQ0R
 kQi8pepqFHZGfwSsMf7LePAxpDqesqsdW129ot4TOjdXNjW6Rvr6p2cLKDdPdFyrfewG
 6lvwoPLQFRAT1/7kIOAsYKrruy35Qh/Evb04O4yveCwOcNWgfHbARRBVkDcWvd64Njm7
 ON1pyaCZCCIdvrQHCdjqrsAtzIE5o1/+ogSLvILK1UMSUwhnD4WFEML2u/jvZW1GGJ4W
 XknQ==
X-Gm-Message-State: AFuF++lDmkQ6IO8ZsgBMyeRfh3CdPPb/51VCp/J85yg5XSoAYZ8N7z+5
 QtDzAypgCCWiFijcWmslhYOsXYjtXwChQiRANkUlLQTV/t1tWzc9URPJPhLlmkHCCyXUCVFXk/+
 Ee3eCcG0=
X-Gm-Gg: AYBFou3qGFIBRPIIWWTa+nRv3olu4sacaG/4ATD4J448Ch68lY7ACarMov/FkSVDvRv
 sjivnep52PMhB/9klrygx+pXTSgtb851hkZQW8qyW5f+nDyojE8wBEXVlsVaCw13mau1Zzi2+Ey
 Hgu1N8savEQlEovy+DZTI/miSNhMswXuFgR4b/jZ5lXEzgvJFutniQgvUD13cgmujSJz6Skr4oC
 mHmrX5HJZJnbWbzgBCSAhvu6i6Idc6xEKieeeZ82An5p69Tps0Wscgl3mVu7+MFQ8widJd2gVVU
 0B3OvULpo0wr6LFNX/uGbRINr+KXOQGUK7znf72GCwXDCGOsfs/B9qVAP/aZCQB26jJC51ZiEpA
 npqWQ5pfXhptr4Lh7PHKcFuQ+benKqUWf1R+UAyTJC/9ZCF2gAdQuE13yljAPjAB4AldFEmCUMj
 UO33sCJUcjqx9M2PAwMb3MwqvakI80JFT9JOdNmFNw5RNtNLXNR4Syfsuj4yG02pe8jwLgMH50q
 TYU
X-Received: by 2002:a5d:591b:0:b0:47f:8d71:210a with SMTP id
 ffacd0b85a97d-484913b978amr6566901f8f.15.1788355025691; 
 Wed, 02 Sep 2026 06:17:05 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:34 +0200
Message-ID: <20260902131640.379588-10-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 09/15] package/clamav: add
 patch for CVE-2026-20244
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
 ...8-fix-32-bit-dmg-mish-size-checks-65.patch | 136 ++++++++++++++++++
 package/clamav/clamav.mk                      |   3 +
 2 files changed, 139 insertions(+)
 create mode 100644 package/clamav/0008-fix-32-bit-dmg-mish-size-checks-65.patch

diff --git a/package/clamav/0008-fix-32-bit-dmg-mish-size-checks-65.patch b/package/clamav/0008-fix-32-bit-dmg-mish-size-checks-65.patch
new file mode 100644
index 0000000000..0ef214947b
--- /dev/null
+++ b/package/clamav/0008-fix-32-bit-dmg-mish-size-checks-65.patch
@@ -0,0 +1,136 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Mon, 22 Jun 2026 10:26:43 -0400
+Subject: Fix 32-bit DMG mish size checks (#65)
+
+DMG mish stripe table validation used size_t arithmetic on 32-bit
+builds, allowing a crafted stripe count to wrap the required decoded
+byte count and let a short table reach the stripe walker.
+
+Calculate the required table size in uint64_t before comparing it with
+the decoded buffer length. Keep related DMG range checks in
+subtraction form and compare stripe sort keys without truncating a
+64-bit subtraction.
+
+Reported-by: Stanley John Tobias
+
+CLAM-2989
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/2a03a9e14c300dcb534dcdc66c3f39462453c4c4
+CVE: CVE-2026-20244
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/dmg.c | 57 ++++++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 49 insertions(+), 8 deletions(-)
+
+diff --git a/libclamav/dmg.c b/libclamav/dmg.c
+index e873f623d2..ab0c75abca 100644
+--- a/libclamav/dmg.c
++++ b/libclamav/dmg.c
+@@ -135,7 +135,13 @@ int cli_scandmg(cli_ctx *ctx)
+         cli_dbgmsg("cli_scandmg: The embedded XML is way larger than necessary, and probably corrupt or tampered with.\n");
+         return CL_EFORMAT;
+     }
+-    if ((hdr.xmlOffset > (uint64_t)maplen) || (hdr.xmlLength > (uint64_t)maplen) || (hdr.xmlOffset + hdr.xmlLength) > (uint64_t)maplen) {
++    /*
++     * Keep the XML range check in subtraction form. Once offset and length are
++     * each known to be no larger than the map, `offset <= maplen - length`
++     * proves that the full range is contained without ever forming a possibly
++     * overflowing offset + length sum.
++     */
++    if ((hdr.xmlOffset > (uint64_t)maplen) || (hdr.xmlLength > (uint64_t)maplen) || (hdr.xmlOffset > (uint64_t)maplen - hdr.xmlLength)) {
+         cli_dbgmsg("cli_scandmg: XML out of range for this file\n");
+         return CL_EFORMAT;
+     }
+@@ -455,6 +461,7 @@ static int dmg_decode_mish(cli_ctx *ctx, unsigned int *mishblocknum, xmlChar *mi
+     size_t base64_len, buff_size, decoded_len;
+     uint8_t *decoded;
+     const uint8_t mish_magic[4] = {0x6d, 0x69, 0x73, 0x68};
++    uint64_t expected_len;
+ 
+     UNUSEDPARAM(ctx);
+ 
+@@ -463,7 +470,13 @@ static int dmg_decode_mish(cli_ctx *ctx, unsigned int *mishblocknum, xmlChar *mi
+     dmg_parsemsg("dmg_decode_mish: len of encoded block %u is %lu\n", *mishblocknum, base64_len);
+ 
+     /* speed vs memory, could walk the encoded data and skip whitespace in calculation */
+-    buff_size = 3 * base64_len / 4 + 4;
++    buff_size = (base64_len / 4) * 3 + 4;
++    if (base64_len % 4) {
++        if (buff_size > SIZE_MAX - 3) {
++            return CL_EFORMAT;
++        }
++        buff_size += 3;
++    }
+     dmg_parsemsg("dmg_decode_mish: buffer for mish block %u is %lu\n", *mishblocknum, (unsigned long)buff_size);
+     decoded = cli_max_malloc(buff_size);
+     if (!decoded)
+@@ -502,13 +515,19 @@ static int dmg_decode_mish(cli_ctx *ctx, unsigned int *mishblocknum, xmlChar *mi
+                mish_set->mish->startSector, mish_set->mish->sectorCount,
+                mish_set->mish->dataOffset, mish_set->mish->blockDataCount);
+ 
+-    /* decoded length should be mish block + blockDataCount * 40 */
+-    if (decoded_len < (sizeof(struct dmg_mish_block) + mish_set->mish->blockDataCount * sizeof(struct dmg_block_data))) {
++    /*
++     * The decoded mish block must contain the fixed header followed by one
++     * stripe record per blockDataCount. Calculate this requirement in a wide
++     * integer domain, then compare decoded_len against that exact byte count.
++     */
++    expected_len = (uint64_t)sizeof(struct dmg_mish_block) +
++                   (uint64_t)mish_set->mish->blockDataCount * (uint64_t)sizeof(struct dmg_block_data);
++    if ((uint64_t)decoded_len < expected_len) {
+         cli_dbgmsg("dmg_decode_mish: mish block %u too small\n", *mishblocknum);
+         free(decoded);
+         mish_set->mish = NULL;
+         return CL_EFORMAT;
+-    } else if (decoded_len > (sizeof(struct dmg_mish_block) + mish_set->mish->blockDataCount * sizeof(struct dmg_block_data))) {
++    } else if ((uint64_t)decoded_len > expected_len) {
+         cli_dbgmsg("dmg_decode_mish: mish block %u bigger than needed, continuing\n", *mishblocknum);
+     }
+ 
+@@ -516,11 +535,28 @@ static int dmg_decode_mish(cli_ctx *ctx, unsigned int *mishblocknum, xmlChar *mi
+     return CL_CLEAN;
+ }
+ 
+-/* Comparator for stripe sorting */
++/**
++ * @brief Compare DMG stripe entries by start sector for sorting.
++ *
++ * The sort only needs the sign of the comparison result, so compare the
++ * 64-bit sector numbers directly and return -1, 0, or 1. This preserves the
++ * full ordering across the entire uint64_t range: no intermediate subtraction
++ * is needed, so there is no unsigned wrap and no truncation to the comparator's
++ * int return type.
++ *
++ * @param stripe_a First DMG stripe entry.
++ * @param stripe_b Second DMG stripe entry.
++ * @return Negative if `stripe_a` starts first, positive if `stripe_b` starts
++ * first, or zero if both start at the same sector.
++ */
+ static int cmp_mish_stripes(const void *stripe_a, const void *stripe_b)
+ {
+     const struct dmg_block_data *a = stripe_a, *b = stripe_b;
+-    return a->startSector - b->startSector;
++    if (a->startSector < b->startSector)
++        return -1;
++    if (a->startSector > b->startSector)
++        return 1;
++    return 0;
+ }
+ 
+ /* Safely track sector sizes for output estimate */
+@@ -969,8 +1005,13 @@ static int dmg_handle_mish(cli_ctx *ctx, unsigned int mishblocknum, char *dir,
+                    " count " STDu64 " source " STDu64 " length " STDu64 "\n",
+                    mishblocknum, i, blocklist[i].type, blocklist[i].startSector, blocklist[i].sectorCount,
+                    blocklist[i].dataOffset, blocklist[i].dataLength);
++        /*
++         * Stripes must reference data before the embedded XML. Check
++         * dataLength against the remaining space before xmlOffset so the range
++         * proof does not depend on dataOffset + dataLength wrapping cleanly.
++         */
+         if ((blocklist[i].dataOffset > xmlOffset) ||
+-            (blocklist[i].dataOffset + blocklist[i].dataLength > xmlOffset)) {
++            (blocklist[i].dataLength > xmlOffset - blocklist[i].dataOffset)) {
+             cli_dbgmsg("dmg_handle_mish: invalid stripe offset and/or length\n");
+             return CL_EFORMAT;
+         }
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 45588d40ad..2f1ba8fb92 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -45,6 +45,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20243
 # 0007-libclamav-fix-7z-substream-count-overflow-53.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20215
 
+# 0008-fix-32-bit-dmg-mish-size-checks-65.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20244
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
