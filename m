Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DBAC98325
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB3440D9C;
	Thu, 24 Sep 2026 18:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnEXZKCas0yn; Thu, 24 Sep 2026 18:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DC46A40DA7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276257;
	b=BMj//ezxzYoSvE4pJB+/uhWO9j52M5cjq9ayW3jIs4WJXw9KmRVjcX1lR7y/1hYrVLjn
	 BUoQ0oycy36v9BouZsnUnaPyRjr4UsxNTvtGZo+wxLd36UxGDEPwZWYYW5Yvzi3+RU4vC
	 EmplShNvzPpAOAyhFExqYr7E4cRiwR7d4lYMRtUbOMUsWsk2x6csYepux01yEP0tb6z1l
	 1lgmEeIQ+gZU/A3dgHJ+hx9Em39LvO1PXt7F/znD6dgro89W0As/RyFFsDydFRgPZdeE0
	 6ge6UPJUETqVnyOgvCTERVdTkCzaW3+70Wst4tnqIKdbphTa4tgJKM1jq82mRaPF49Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Lbw4He62jzqiAsV/fWQm3IbXY7b3ck5+6Zy+FWOguLI=;
	b=oTPt7xXIm8Dg4uWKs5bVtH0SucgUmfY9TLtvNGcva04K03mj70Zx+ncgJsS3YCoufbXx
	 AemwLsr6IZadPfjxmVZKYogbonoxao5h96LN+cgkzqvCaXKVeTNKjtwtM94AaQt25lsUX
	 eZ1Nr1GlQklEn6XbO+xlbzaoShQthWZo5xpJyxIT4QVz9GS4vK9PdUYc8PkfLo62bZAuK
	 FMS+4q/5uCo0sePgxDs7vYP4hQ5LpHkrgs1w6cTjEioe8F1cp9qKL8JiCEuqMFcwg0LYr
	 sqZRfp8n5bbPw26q9exCxhYP5/1UECwQfZaH7PxyS/2y2pOyup1185+ip/3HH3LaXSQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276257;
	bh=Lbw4He62jzqiAsV/fWQm3IbXY7b3ck5+6Zy+FWOguLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNMcxfReEnoCjZBoXsKsJIWUqEnw0oJ4d2CCjmflsoczup1QhkvqyQaEQnAfiVdqS
	 GG0f9VyckOq8w3qfe0ysUk/N0Yvq5Rsa9AjKjip4r011BrdB6xXObqP1+6X093sOCg
	 6DUYyn7zxRv/wR/DfwDk5Bzj1q4qh6As2UbjC4qtifCZhQWt7GvCXMM5iigYxjiPO2
	 wakaaDLURveHM9uOupxKL9d4vmZS8UKf0V9Y6/DbdvtnjRiGjzxKf2ovWauCfYhGa6
	 egFLuOFTQNI70GmhwysOXnMJo1wFMgueGIoFbAk08r/mHnRUjpIm042aWXaxG91MlK
	 Usnm3B1XTaaIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC46A40DA7;
	Thu, 24 Sep 2026 18:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3647D328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB2840AC9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0-CbAiuDQcp for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 03FA140AC0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=hYMBfzlxcuENy7oKeBRDP6XY48OIuY1T5f0ctjMf3KRLBd+nSnAvAggR9+x/4MrhTbFd
 ierHEjUAGMIm6QLMmyiiXoRSx3V0wkg3MW2SXVH0BBaKX2IJE1GKICd2tWuxTGnpulBMM
 VPzc2Nud1fc15e4qHLTdLpUVyEuLAk3c+toi5H2cO5EuX8AUj/9vysDdy0RQQE2kKRPct
 rWCPGdkqVIaZ+nxqVrKaCOKLJ57ld1ueCUnuUKG3J8U5znV2LfpTPMw4FUsDoESbwpkaL
 0iKmtwRfnlCD/EbBn+6EZyY3foEqd8qESEqMjzeIWba5DKSSZeSzoD7H/lc4HFH1jjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=18JXdl8C/zfFrfOvy3MvmaI9OlV6lP0rLovmMPbEnGs=;
 b=g0G5wbgZartgIEg7bfIth9TqxkmzQcZPsWIu8+0MqjkWj9Nqp5dnUfo2sfpPU0CdUPpw
 FEGnCUPWV6rnnbx6kBi8uiUAOVPcmUxxj3dU2Ly9NIonbribJkWcN6OKgeYunlG6i5SwO
 An6TVHUKNK0VkJWa5kLssNJnKywD+4ucbPOkj+uz6tJef4TXVowtBsfpHI1q8grn8dtIA
 ICtJ7MwNBjoUssmXs7hIIdAdi9kpeiCY7HUDA65xeMg/OwTgZq8nkVPCoXZeRHVAH7hPn
 Lqg+pAq3BRa4OMNtFE9aVim3evdSElYwOHNhiBMwinwpNEWIKz/QSC6U2vr+YGcwJ6Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03FA140AC0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B88398385; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:19:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 80707542190f3c16c240d84029c98453ee82b72a
X-Git-Newrev: 9b3f5151f10cd8201f26396cd5c389fe42782cff
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.9B88398385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] arch/Config.in.x86: add
 BR2_X86_CPU_HAS_XOP
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3647770623643062575=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3647770623643062575==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b3f5151f10cd8201f26396cd5c389fe42782cff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The AMD Bulldozer family (bdver1 to bdver4, i.e. bulldozer, piledriver,
steamroller and excavator) is the only x86 family implementing the XOP
instruction set, together with the equally Bulldozer-specific FMA4 and
LWP extensions, and TBM starting with bdver2. All of them were dropped
again with Zen.

This can be verified with:

  $ gcc -march=bdver1 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
    -mfma4      [enabled]
    -mlwp       [enabled]
    -mtbm       [disabled]
    -mxop       [enabled]

  $ gcc -march=bdver2 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
    -mfma4      [enabled]
    -mlwp       [enabled]
    -mtbm       [enabled]
    -mxop       [enabled]

with bdver3 and bdver4 behaving like bdver2.

Add a hidden BR2_X86_CPU_HAS_XOP capability symbol and select it from
those four CPU variants, so that packages which cannot cope with this
instruction set can depend on it, instead of listing the CPU variants
one by one. The first user is host-qemu, whose TCG engine does not
implement XOP.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f91407f0120ac4f3a8d9ea647f1bd44030654f7b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 arch/Config.in.x86 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 34ab056b5f..3870bd6215 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -20,6 +20,14 @@ config BR2_X86_CPU_HAS_AVX
 config BR2_X86_CPU_HAS_AVX2
 	bool
 
+# BR2_X86_CPU_HAS_XOP is selected by the AMD Bulldozer family (bdver1
+# to bdver4), which is the only family implementing XOP. On those CPUs,
+# gcc also enables the equally Bulldozer-specific FMA4 and LWP
+# extensions (and TBM starting with bdver2). Those extensions were
+# dropped again with Zen.
+config BR2_X86_CPU_HAS_XOP
+	bool
+
 # BR2_X86_CPU_HAS_AVX512 implies the following AVX512 extensions:
 #   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
 # This subset is common to Intel Xeon (excl Xeon Phi), AMD Zen 4, and
@@ -602,6 +610,7 @@ config BR2_x86_bulldozer
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_piledriver
 	bool "piledriver"
 	select BR2_X86_CPU_HAS_MMX
@@ -611,6 +620,7 @@ config BR2_x86_piledriver
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_steamroller
 	bool "steamroller"
 	select BR2_X86_CPU_HAS_MMX
@@ -620,6 +630,7 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 config BR2_x86_excavator
 	bool "excavator"
@@ -632,6 +643,7 @@ config BR2_x86_excavator
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_zen
 	bool "zen"

--===============3647770623643062575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3647770623643062575==--
