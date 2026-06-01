Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5880BCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 11:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A1A40ED7;
	Mon,  1 Jun 2026 11:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvPiIQo7JK5v; Mon,  1 Jun 2026 11:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E6A840EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780312280;
	bh=pAFEXNN+iN9RnfV1FIB+Mo08AUKfAJWFLseL1JeHyPw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Bpv6nfcxRFfuMLDgjSHiNhLSDNmQFjWFXMqwZGdXhdNXFF9d8WEM89IEAKsq0hhLv
	 Y4a2ToIL4OxhwJ0ftIIDZ+8leNeFOq3m/1by8gVGpFt35ZeyAk7JhRmPYHyzX+1RZm
	 VX49i/a/+7JPeBCgMqgX4Pqdkh8oKMqMBefbcB83fNb+fGHTX5rkTWvOLUvp4RAhSz
	 5SSOUYL/exYc697v5e4UfUtOH24uzpqv/VfQ1KuKsRk1/rMWvkVLM9p1Eo+gr/itpK
	 WnwqwTjQPjRgY8uab90HWjfEG2Qass/nOCLlJj8JIKalxem7Xo6sjmSgq2dCgdgweL
	 odYbgloYT4ahA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6A840EE3;
	Mon,  1 Jun 2026 11:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 52AF1294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 11:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 4437E84A4E
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 11:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 0l2eO8Rp_f-H for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 11:11:17 +0000 (UTC)
X-Greylist: delayed 484 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Jun 2026 11:11:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60C6C8497B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60C6C8497B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.239;
 helo=out203-205-221-239.mail.qq.com; envelope-from=wjjsn@qq.com;
 receiver=<UNKNOWN> 
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com
 [203.205.221.239])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 60C6C8497B
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 11:11:15 +0000 (UTC)
Received: from MYJGMC.localdomain ([223.160.159.143])
 by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
 id DF3A9685; Mon, 01 Jun 2026 18:55:51 +0800
X-QQ-mid: xmsmtpt1780311351t74w8owsn
Message-ID: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
X-QQ-XMAILINFO: M7W7QqjC7ykdWRF3nLihOgKK/IjshYe6xV3e/l73aEpb3EBvcOe6a8ZJeJatTP
 v1ex7ZkGhZbpRHkg8OP26bz/U1jqjgl1W4dHCxvBVW+higlyIjHgrf4fV8De+JHIsWDCcR3YfKOc
 4fOm3zWkeVL3wuw3RxEVMf7c79hNYiJfomZfQq7UmWJds0jOp8dHTkJC4rsYa5TDwEkEx1Lbaqdt
 O/GTZ5UP6AQWNlrZHw8J83zuPAwTHbSjUbcz7fDsoiR5GvyIrBsJQm8oCGOrgTCYjq+QYlV2Ne5M
 ayeQxSHMIgXLs3poK5YXTO2czfHPdLWu4N58GPYwYeF0P3niJelXV7zi3MvKnShH9CvueyRjqSyW
 D7g1di5xcEFdgYb2zX2LBLAInwRBT8/x1azU6vRh4C1mqtmRGYadExkfy945dSc7Y/b1gpJPXhVD
 PYPre9EZQ5GqKHMF1CfjZ3DHaLDhU3xeE+PmK4Uygb6QJaEwQ5w5Xlol9sOlJdSgoTB+SVGNMGm1
 DJIyBsoleJYhHRiyGIiu+LDwqpqauUgs27fhoUzYeeP+b9y8wQGfxEKSmGVCVJFnPBDWujtN7lel
 HaVHPg48WcQG9nYpuymVjDn00+Kma0X3WwsS1szK/nT2Oo8Ds5SsWJmwtPXJKlqzDqOZkDHQACRP
 k4c2r2MpZirnRNYZEGo5PI6ZjyDzxjc2+OzHaFajbVBukI1f7tRGZEw+PrFBq7nP7HEXZw9nJuOe
 EejVQrUu35bzrLZAgtZOm2wCecGjoeUcZv+Gk8soKYSRJMdYXG+sQdHexwEc12Btq8DReEW2b0WV
 8nvPREbU/cc8iPucMqibMi//WPza6kQjmf3aYC134KSkAdSXeYM2KJ9nJKYDp1aJQSa1H5jzMVdL
 4fFHP/8R8+tcHwb9zGkTer2GQsOZLsM9nsJ88Ev7AXxnJLUcZtuZkrfbLj9almnzZJiJj7LL2cSR
 T4BjASgkMFgmCM3QBAiNjgnUFEMn8kfmH/dHuewOsC6UQd64JOEhoUIz08eSOlZlobJZjynoKrfv
 YpgZNBoqrSizatjjDhu3t55PzJtO6JLyWBE2xpqlRXGFZeI8lL0fD33DGxMj1afYjK5dHf3Q==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>, Pengji Li <wjjsn@qq.com>
Date: Mon,  1 Jun 2026 18:55:49 +0800
X-OQ-MSGID: <20260601105549.197579-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1780312273; bh=Pvo8Nhl8rYuCtUFxkNvAhNWrVZhXs5aVzdQPBrZPQA8=;
 h=From:To:Cc:Subject:Date;
 b=YlU28TCyZcGpacp1u7wmB8NnCI58aTeQ1lNDk14QyiQFRMfmxSP7j35naOtEuugEL
 VEYRnUgGlUBMVFBvL/4givtsYvuBe1ZXpvDRaDXP2Bb2vgd2YcXaeuTvFFmG8UV4Pv
 AOCYBqGYnNE9sqw9lxPBxzLbyKkWNcXET/lMZbR0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qq.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=YlU28TCy
Subject: [Buildroot] [PATCH 1/1] package/opencv4: respect LoongArch SIMD
 selection
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
From: Pengji Li via buildroot <buildroot@buildroot.org>
Reply-To: Pengji Li <wjjsn@qq.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenCV probes the host compiler for LSX/LASX by trying to compile a
small test program with '-mlsx' / '-mlasx'. With Buildroot's toolchain
this probe succeeds even when the target CPU lacks the matching ISA
extension, and the resulting libraries then contain LSX/LASX
instructions. This causes SIGILL at runtime on, e.g., the LA264.

Map Buildroot's BR2_LOONGARCH_SIMD_* selection to OpenCV's
CPU_BASELINE / CPU_DISPATCH knobs:

  BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
  BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
  BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX

The block is gated on BR2_loongarch64, so the existing auto detection
remains in effect for every other architecture.

Signed-off-by: Pengji Li <wjjsn@qq.com>
---
 package/opencv4/opencv4.mk | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 695355c308..0e2567eb6f 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -120,6 +120,41 @@ OPENCV4_CONF_OPTS += \
 	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
 	-DENABLE_VFPV3=OFF
 
+# LoongArch: OpenCV probes the host compiler for LSX/LASX by trying to
+# compile a small test program with '-mlsx' / '-mlasx'. With Buildroot's
+# toolchain this check succeeds even when the target CPU does not have
+# the matching ISA extension, and the resulting OpenCV libraries end up
+# containing LSX/LASX instructions, causing SIGILL at runtime on CPUs
+# such as the LA264.
+#
+# Trust Buildroot's own LoongArch SIMD selection (BR2_LOONGARCH_SIMD_*)
+# as the source of truth and translate it to OpenCV's CPU_BASELINE /
+# CPU_DISPATCH knobs (OpenCV knows LSX and LASX on LoongArch):
+#
+#   BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
+#   BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
+#   BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
+#                              (LASX implies LSX; OpenCV's own upstream
+#                              combination matches BR2's choice above.)
+#
+# We only enter this block on LoongArch, so the existing OpenCV auto
+# detection still applies for all other architectures.
+ifeq ($(BR2_loongarch64),y)
+ifeq ($(BR2_LOONGARCH_SIMD_NONE),y)
+OPENCV4_CONF_OPTS += \
+	-DCPU_BASELINE= \
+	-DCPU_DISPATCH=
+else ifeq ($(BR2_LOONGARCH_SIMD_LSX),y)
+OPENCV4_CONF_OPTS += \
+	-DCPU_BASELINE=LSX \
+	-DCPU_DISPATCH=
+else ifeq ($(BR2_LOONGARCH_SIMD_LASX),y)
+OPENCV4_CONF_OPTS += \
+	-DCPU_BASELINE=LSX \
+	-DCPU_DISPATCH=LASX
+endif
+endif
+
 # Cuda stuff
 OPENCV4_CONF_OPTS += \
 	-DBUILD_CUDA_STUBS=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
