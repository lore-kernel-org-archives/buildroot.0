Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0CEC5DF81
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 22:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57FE960689;
	Wed, 19 Aug 2026 22:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7xH8yoTlgzr; Wed, 19 Aug 2026 22:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787177764;
	bh=kr7Ix9eLM3+Yf9BLIjRMNNs0SwV2L7iRG4A9/LtWIWI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OujFoCJWOHwmpkQd2/wJWR9bQ8hAncHfd5HMZqvKbYngnmZPbtKzofHCi/1lhEWZZ
	 HcR6xudaQUCFO3nNdlnymZ4CEXcd18ZRbgeOhAQHDbZAd3CMCvObwTIXgywXEnF7Nv
	 6GRD3F+MkPAwe3wgZ5kWhC/Klh1VEtrnxpVLa6bZFAIdfzlCL8xiMAL7DUXv30NQAM
	 hIpk+3CUXDClxCg8egodlavP1Z2eKOfvI1XmTrAmXmymxdlPNQerzYsjLABEuWnjXG
	 nx8UazcCvF5njSuIPgGO904gtgUjSfG8ZP3Xnu8o+m8Q1vdKJgZooK190Yu3C4HF/j
	 8ObQMVKc8PaBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9396060E;
	Wed, 19 Aug 2026 22:16:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A52B3A4
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 22:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C16240589
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 22:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wo2dhf2WafN2 for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 22:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C9D540586
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787177758; bh=y+8olNF12JDNvq60gCEnNDIQD5Dk4w1tkTLDLCbLx2M=;
 h=Date:From:To:Subject:From;
 b=B1F+5tXMiMEQcVpj3hQxsHKqu4kyUDoMsfS/owO4B3Ljeby09PAgRizTAOIWwLBrh
 tMxiQfxVnK6hJLMQyPo+0NVxZRRdSGNPrN5XEQsfKyYPlZ4cRixSbhi1c5Cf9UqreU
 CabBtWiysOOYT87B7GJWNrJnIyIecx4ZZRJVqMxXETtMoo76iJIzrCfZ1ajp4AwC9c
 M5rnkBOKmm/EPhfGUsd0bGmBH5lGa9kTlNUaJS2QuEvKfY6JDJomJIPhXjDDHbPFUS
 4Z/eEb0z2RZSbXxGapeQQX4zFUgH6FDzpGdQDYUhbCoKIITwPPK5tkgqKCOmU13u4i
 oDzS5YMs+70/A==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4909D31E0307; Thu, 20 Aug 2026 00:15:58 +0200 (CEST)
Date: Thu, 20 Aug 2026 00:15:58 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoYrHjB83RoRdw1j@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] arch/or1k: fix uClibc issues with fenv enabled
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

OpenRISC architecture can be either soft-float or hard-float, so add the
ability to the user to configure it.

GNU libc has hard-float support since 03 May 2024, see here:
https://sourceware.org/pipermail/glibc-cvs/2024q2/085211.html
There fenv functions f.e. were added to glibc.

uClibc-ng has added fenv functions in commit 8a77b4785acd143d76ccc08142abb39c0100de3d
on 27 April 2025.

musl does not have any or1k architecture specific fenv support.

Tested with all 6 combinations of C libraries and float configurations.

For uClibc-ng fenv support was enabled by commit 4c5039b80ebbe42db35af189afcff7fb7d5cace6
in Buildroot for any hard-float toolchain, so we now need to pass
-mhard-float to gcc compiler to get the predefined preprocessor macro __or1k_hard_float__,
which exposes _FPU_FPCSR_RM_MASK.

Fixes:
 - https://autobuild.buildroot.org/results/a60737adf3fdd26e8d0ae3310bef5c48716889dc

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in.or1k | 9 +++++++++
 package/Makefile.in | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
index f42aef9eef..e626907496 100644
--- a/arch/Config.in.or1k
+++ b/arch/Config.in.or1k
@@ -1,3 +1,12 @@
+config BR2_OR1K_SOFT_FLOAT
+	bool "Use soft-float"
+	select BR2_SOFT_FLOAT
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU)
+	  or a kernel FPU emulator, but you still wish to support
+	  floating point functions, then everything will need to be
+	  compiled with soft floating point support (-msoft-float).
+
 config BR2_ARCH
 	default "or1k"
 
diff --git a/package/Makefile.in b/package/Makefile.in
index eac28b3a96..69859e8ce4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -106,6 +106,14 @@ TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
+# use hard-float option globally for OpenRISC, when not
+# soft-float choosen by the user.
+ifeq ($(BR2_or1k),y)
+ifneq ($(BR2_OR1K_SOFT_FLOAT),y)
+TARGET_ABI += -mhard-float
+endif
+endif
+
 # Use longcalls option for Xtensa globally.
 # The 'longcalls' option allows calls across a greater range of addresses,
 # and is required for some packages. While this option can degrade both
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
