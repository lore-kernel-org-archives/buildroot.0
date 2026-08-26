Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC528C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F68180BCC;
	Wed, 26 Aug 2026 12:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lcu2n-FsPttk; Wed, 26 Aug 2026 12:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747828;
	bh=1cBw1w6B4BpASSqWsZitupomVe+vnFpfq2K7ajrw2Zw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h/vm3pBfGleKXUp+t+KVUHah9VBMA0IsMdxEgBdgxyaOTlbEWN+KFE+njZpb7ExbJ
	 XgWBu21KL3X+SjXi9sTkrlgOOJD4SpNOzEZ+t8g3ntHGEYE9Nff+0bOuU6RFzvtEb7
	 qTLLuHZEz+r/uXfUPSNOC2VRdCG1PRR+zTJEfohcoUkqA0WcmtY0Kd6PwkYNsVynek
	 yNbxKwlS+45Bl48Md0OG/vUU/SIK1p7+lHWigUMAvK4pcVZ9PH1ud/p5uS5V5B2mPJ
	 aD9riD4CiWDDiYSRNTZPI5d5/wlhbkYJhoB2C4a5/F1n5p4OMRz7bRF9tBVrqhtbGp
	 IGMknT7urThgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E95680BD4;
	Wed, 26 Aug 2026 12:37:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43F3D396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3602040108
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDxSuiR7Pnvo for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF9B2400AF
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6a0c8283146so1461912a12.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747816; x=1788352616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cN548l4DyeN+N9AwgK3k6oagfF296gwgZUgS8hTD7uk=;
 b=jg3uc9z1DbJGPAOmRlNWcmWu0I3LsBu1+uMO7vy6fXDE13IAFAjkhTAcpnX7Ul4DcS
 Biw5HvVDJud2pn+tPafoc3BoboDOsFnGVpnm4auR65GzqW5+R+LwBaa+/W2I+luycxCg
 TKkkBmHZ1u3LlgDrrjNHleTNys7Qz6TOalEh3lNq+drLH5jAdhq1PsgFh49QFCn+c9b6
 BOi0G9i4owz1JJVfkIKFXC8hNYZvbqugjh4RPHbIkyulDao1xYwsCmQV1zGBoWMWTbS8
 NUigUPw/PPGFmBz2LzsNEqsK29G60n1FTyCAnQ6Ce5vgjnMWNxXNKJDbzGx5KAt/304Y
 A7fg==
X-Gm-Message-State: AFuF++lDvf//3tqcEoxDGaIs8gfvTeBQRK381fFUMPc6O+ULU8tZ/Vqp
 E4sVYuHqJCeR5S96mWCt0kTcAVZE2kd1uVa3yH2w16e6DilhhYKy0lCSZ5DtCMZ5q1SwMU+sHO1
 hHh1LS5s=
X-Gm-Gg: AR+sD11O8sGwISh2Qvr5rIYIsyzT7q41WeguBHW/9zd31pCZyq4L+d8BLBTpWjVM8HY
 yf6tHzRouE4a2PQWLJXLcOlJ+8coQfTlPDZA3VFnHQhbve1Pe/wVIyEWdPBLbhG7bY1vVENxTdA
 ZeQhyklEtI93q/CmVQr2yj+qibjnlcjtEr5JoVB2DHWwPDWCsgNFSNutzkvv9x3B42oRc4EYG1O
 fv9xKItuex0urwbhXAYycSPBAliphOK9tn9PduPg97c3GXODW6aDd8PRcRaGnZJyKq8dz2lFM2a
 g9puFhPVSg8tt61y/2/pWG445ndcwQpcFaiketh6gcVHRDaDGVUdo9oWAEkBkL4QHHVgFcwCTVC
 rRJfF0+Ku/WURkUfMcaI48lkkehn4NBiBqUYnkiowT4BvcH7uP7/euq+qouHaiaP4E5fzNETBxc
 0jmfHmgoHE4L/791kLitjTE+NojeGn/c342e1aDSs7QFJa/qSAGAD4tcW85/Ujlxo1sQAW7yuqp
 n1p
X-Received: by 2002:a05:6402:234d:b0:6a0:a4f5:f4eb with SMTP id
 4fb4d7f45d1cf-6a5df5cdfddmr8007995a12.4.1787747815551; 
 Wed, 26 Aug 2026 05:36:55 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:31 +0200
Message-ID: <20260826123637.410258-11-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 10/16] package/clamav: add patch
 for CVE-2026-20244
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
 ...9-fix-32-bit-dmg-mish-size-checks-65.patch | 136 ++++++++++++++++++
 package/clamav/clamav.mk                      |   3 +
 2 files changed, 139 insertions(+)
 create mode 100644 package/clamav/0009-fix-32-bit-dmg-mish-size-checks-65.patch

diff --git a/package/clamav/0009-fix-32-bit-dmg-mish-size-checks-65.patch b/package/clamav/0009-fix-32-bit-dmg-mish-size-checks-65.patch
new file mode 100644
index 0000000000..0ef214947b
--- /dev/null
+++ b/package/clamav/0009-fix-32-bit-dmg-mish-size-checks-65.patch
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
index 4aa75161a1..ef6d33e96d 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -48,6 +48,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20243
 # 0008-libclamav-fix-7z-substream-count-overflow-53.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20215
 
+# 0009-fix-32-bit-dmg-mish-size-checks-65.patch
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
