Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AD2C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4296F407A1;
	Thu, 17 Sep 2026 09:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IePpxIAB6J2; Thu, 17 Sep 2026 09:14:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F8FF407B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636484;
	b=V6t3OU6AcEbJOfpo8ObU9IiX8cw45tjBfmBefYrsjufiViYbY7gWdl0kDwPq7SGDWgQU
	 7t7L1WugUwoEVaM0rkIAsLYDgj7Gb5zWDOPO1kHSF0Nvm1UH0NUQAhYgpoiBVOhbdfe8g
	 FpfBkUXFSxNwZTB7PMPjHPLBeRv4WVkJeVMKn2B4jxdZ2DzEwazx2q5zwdGWRMebJXpsm
	 6G9YB7WWtjZDujELTbktx6rlx3yIyQF+ExPVhl0BFysLnVAj4BPnV/PXWElPJE8pBWwEd
	 GRIaGXYoAYVhIayq6Kv/vKa31zegJQ5IwBVVS8FhEUwiBiSR9NvdSaROYXNAwmfeUXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fzgUvAQfMadRuj80FetwWdFRmBnGYXOFiS9KEO5yW04=;
	b=dIYuGpDkvWQn+SqNAy3Bqx45oYzzBJKGm09RvM5JQIJyNHSZT21dyjjiukBgdAlRbtrt
	 kJlTd5O3xpmNAl5JWfF3m4KpCCqmcOaspl6AheGlZ5bnFupMhphbnHcJ4wTMS+Pi3TSDz
	 t1CevvFEapNGCV5xOx9z/JOyVEktFjkYE0lfbNs+Oy5K6a/ob5WvPAXheaPgd4en71jJ2
	 SB2qAKZUfCDBfwtBx+I/HkjD9kYxxYaYyJobfAUbs8bE21G7zE6peVYmrS11vXI4j5Gud
	 fqjT5dCKUjfe5Rt+T56Tn8a+afAx+g2W1KjANxbGl5FpabC/Vcq/29ku2qy1T07jbnA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636484;
	bh=fzgUvAQfMadRuj80FetwWdFRmBnGYXOFiS9KEO5yW04=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EiCT0Hqjf9pwzTwopVHYlOgS6khEd/avHNvjOOJXR74sp2ZdiYe5rhjz5pG6L0/c5
	 EQI88fvUZ8TMuDUVQ9vgtaTjKxfG2fdV3XP/Ff7vqlYsSzENRnh7zBmwsm4kqMLCzf
	 VuDcPOnrtxejDt/rFJSsXN7eBEfzPKKMgLzCepXB87lgiIMGnC6ZLOjeJtan+wEVT7
	 UzIr4HJ+sKMHUXdCMwBR0aSuGFtDBWrwzKS7AurEdnD/SzCeP4kTBUMqKx7XkXeb9A
	 8TtKLQfCkygwiIWuHtfTSMPv+1KaN1dVvUGMr7AqnmmjpEbtste2z7hQnB1jzarKYr
	 582nE+XbXhP5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F8FF407B2;
	Thu, 17 Sep 2026 09:14:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B291A32
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA826083A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQNlVnLe5GlB for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A3D1E6082E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636478;
 b=TquRIv7Qmpwd7gTGHbhnHWwVOeWMG0z/V79Z1sGqUuaDr7sE6oYKU9EhIDaSb8x0EQ5v
 0D9yN40Px5SQLxykiu/H6uS+YiShsGvFifzh4d5VRsp+rZfYrvqLxpN62T2KZYDhOULcE
 DBPVuPaQfJivw4xHliePPCE0hKPi+9859n3+vQVlSwi6R4m27OBmslF/DdBxMwu+GYgps
 sz6hY9soPPrdFWV18e4Wyug02zCf4cuPkUmxB6GurmAVTuC5yqiadwvEzop1JYg/FJ/PX
 Dcu28m0aVZv5NBGQ90QYrC6wxhrThQrlATEy9se9p0+peaTGBRyfztJuX4+GQyPcZWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636478;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PwoOBacdMIQ1LaTfLQq/HoHEwOTw6pZJDRbhYej1Eqw=;
 b=Vm1FuXy/of/ohkuypQjVPfva+4jUUDfcdi+jwD0eKQw1bpTcMC6/kfT8r0LSHKMkbx6w
 zCCBQGVTPD8n60u7JBzxg96akG2ZAz52xwpilcaEYiAtM6EuYYSMxCtlvDYEKH6YhXsJ7
 9ZMV8JshVlDZSASYTgiPUlZnSZdkRWiGw7Ek4VXPCucCBCgadTalnWK72xu6iC4sAzN2X
 W7YmBlWBGMzBTOGOqJGmLP9FxWOPUkhzb7XF4z9LHuFyzYFhffEocZurLTloZ4Z9W3v8Q
 OQE9ou0j1xYuZcZ4lNtdCbTxK6tcmtJWgD3TMAErhNY2b9xtwwrME5ofMuUcFN4L7Rg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D1E6082E
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C673796B3D; Thu, 17 Sep 2026 09:13:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 11:13:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d80efe017880884272332b97316748208ec2325
X-Git-Newrev: f91407f0120ac4f3a8d9ea647f1bd44030654f7b
X-Patchwork-Hint: ignore
Message-Id: <20260917091331.C673796B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add BR2_X86_CPU_HAS_XOP
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f91407f0120ac4f3a8d9ea647f1bd44030654f7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 arch/Config.in.x86 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 3c4a725360..51b157409f 100644
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
@@ -604,6 +612,7 @@ config BR2_x86_bulldozer
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_piledriver
 	bool "piledriver"
 	select BR2_X86_CPU_HAS_MMX
@@ -613,6 +622,7 @@ config BR2_x86_piledriver
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_steamroller
 	bool "steamroller"
 	select BR2_X86_CPU_HAS_MMX
@@ -622,6 +632,7 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 config BR2_x86_excavator
 	bool "excavator"
@@ -634,6 +645,7 @@ config BR2_x86_excavator
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_zen
 	bool "zen"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
