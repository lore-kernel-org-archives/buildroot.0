Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6BC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A395F80EDC;
	Thu, 17 Sep 2026 07:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGe07pntmkJg; Thu, 17 Sep 2026 07:53:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F1D5380EE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631620;
	b=Ji8j4fqubAv5NnFls1UPb6JqdNrEYM7cmA3/y0R2kdZdZoSEbzwCqHyr2mOqXNjSrC8e
	 FgYq84RJjRKDFN5jn+e03gDO1/kqA1SsT0qyliUVgwyQK1NOm7654mVY08PTGp+Gk5rja
	 olbpsSUGGAequIH3ZttAffePnJzZnsQoBl1LSTRgP1CpgF0Xo2XL9cBMmDGlemg1qLH+c
	 PFfAthAx4Y3q+6XbrfujwMYLFkMdL0o0uvY3FDwfNYRmAyTxPsdJxgyaC2fgAIS0XEcDd
	 sEeqwiXW95hFENRZUDgCE19tJsfOVxiMT8ZOvwV4H2ERcNLbdhcOKBQ1U1/KV7/SKOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631620;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VnwGN7TS9Z26g0WnxlZzQb6NDA9lYfRM/KsD2/4Of2c=;
	b=Avt+cczOgBpwaIu4p68755rQHPpB/D19I2P0/Np9P4ENlNluZJnF6/kfboeUxYLB77ze
	 rN4yxMQ3IZFLzBFSocmej6F7DoXRT/NWuVo+GX57BvUb6qTK61GU+VaxZJoeCixdbbgrr
	 DIlvNBTSfrTOjtWOBYLcJaT36L0wX/QWeTFWGdLw6U67EnUWNxDsex+axSPOiPdMJ4WGO
	 76YTvOt+56cgTaSJWhDGHIYEPv5Uf/EBKW6Q8b/dqLhhjST2Aw9otwhdeUwa70CJNDkyj
	 I28V6VlhxCrPq4a7PPauDQ7T+a/UL7xG8EvH3RDai0YgYAjf/alN35M6KEOZRuAyGvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631620;
	bh=VnwGN7TS9Z26g0WnxlZzQb6NDA9lYfRM/KsD2/4Of2c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Op2WkYrSY9P6JHUozBpYOAAVh9aFib0PoREBufKwL+2a0BENPOfJIS5I30AaKCOIw
	 FtKKPcv6ZE63EafKXWLFHJ9rm1wT4K94zt3iRkRxWXDtfnRXyp+vEkFwgNyy8IFmlH
	 VV/xgdgWthLjte2YFommMtQ7dqrUNGp+CGgcPiujw80lDpVBcdN6P86kEmAXhdGnz0
	 wAVxi9PkxOfrjxxCY0tx5MjA8yCcE5QYBv48UTdNL+W0vvPnYl+dT31ImFGF6fo8WS
	 xnnzx1/MiHVg5bLSrsYnTkUVHtW4h5lhyOMReaajsDLEppFvNnLMhQby0uaRUVx0CN
	 0pB5xP5+6b3mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D5380EE8;
	Thu, 17 Sep 2026 07:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D61E52EB
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB7C480EDA
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Awnk1kcWE2i4 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:53:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D036A80834
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631618;
 b=BpPnIPPCtNnurdtmfQd9yYwmB6WXu9U7ae0EvPasAl729oaCpjMV/CGr53l07jtWCSmF
 sgLuwbv+tk6BY7BKjuf6uF7DdrWJUMMCoHH9mzP08w4w33ozDFAHfq0WQMx43vA0/bmxr
 SfhJfAUa6k+sYXTevrNmjsPi/l4+rEHiOR1Ioq8pmAOvG+/CYosibURx53B72KKj01SAu
 GWuIiLemKpwArHoJgPuV5ElTgWPF//lP5WIqs/ix9dS5G+trJnAUClOrcpyc92Mj/mbBb
 asU6P4qIbXj+cp+CDkVzvYlKspdvynnMUrLVriqsYxtbFgN7Y/tXYWOVYAMexz5Zidw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631618;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=YLoVDUJjcyYpSPRYdoWlk+GbE9VEXTkNEHed8CbMEBs=;
 b=BwkblxbBsG1kauD14xTl5Tx/ApGK496PXPT2yciei7OIFpI5Miut1JF5kwMGPv36yLRe
 6LEv3cek7nvwlueDzD3RId9m4XHwsuHRDJKAqpAt3FJqHsRs7QmFu/RMcrh2dcv9ZqZYL
 b8K/iid6we/Vv5+qi/jUH2KuO9ZervuNLwxXDRjE9eG5XIZl7lvJvcm0SgPFKGX48YYY/
 md/kFnNFiQL705Tc5XCTpWyGLVqpFqTei6Kl4ROLvCAuzjgS/J8zcYzHg8wdW7L/ghfGx
 Z+j5dISG6BAAsM6+3MbMsUTmhGhrzzBXQmf52CkY1lNFyHw4MA0pZGHoofuAIE5DVlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=dlZjn1gV; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D036A80834
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:37 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f5603a0so84121566b.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789631615; x=1790236415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YLoVDUJjcyYpSPRYdoWlk+GbE9VEXTkNEHed8CbMEBs=;
 b=G1WIaRTvXYey1XELR3HUuwD0yIy0rqbTIZoECABB95aF+WAEKd8bPO6rSYaRd8kmjr
 y4L/w7ZQZXqtQnalj4hO4YXRJ2R6xYcNWVyejbfBzXOoxH43X6lyT/0RBJ/7qmjnhDbZ
 Zn1scLbbNRZkcqtY6f8pa6UgVH3y/grhn8I4pghpc3BfpbGXY16F2ywLQ81ui9I9o2gI
 z/3itW5xRrX8K+ZBj6byVLzCTgBNe2kPceRzEuhmSKWDCVp/Lne7Fo/8VrQXmN7X57Pp
 VzS8FocOtFbJcoYBA0oUiUI1ULeNZKVU3Hy0s3awhBo0G1YPJywMshdmIDQ1c3dYPB35
 iUiw==
X-Gm-Message-State: AFuF++m1FEyH8OklKMcX8ytU7XkzuvGfV0AveAkhD3v24f+Xmn2lIaTt
 9j4wng4U7eF9hhb5I9c03WrODVvpn8ITrrvwtWMAl14hLXj460a9dXJzKl+IDw==
X-Gm-Gg: AYBFou2RvkVlJuxYnkW/fuYrLyeucZu5FGUmQCDEadCLiHBZvGQV3zmoY9ZNKfQi2/Q
 W7fkidsur9S/xcE0MtimgXpEbE7iE8/F/UtiaryGoEymm7b7wYsowARFOYzngxeaPuCBQ/t81nD
 +jSJxdGfGhLwJsXedCga0JskXMEv3zQ8if6misslOxOoJfXR92PBHwoqqnI7/GGRk8Ovt0Laoph
 wHc3vAfzmsP2HuJm+J9N7CXMf+l91tPmXTyzkNQLei5MgAwqvOndKi1eLLG9EerXNjCxrrKvyoB
 mec1+i7d5lkAiwqYiYy3l8tXxfW8oTQLN/99zMTzmzywkFyvo7FOZlKOCF7gc7ufZT7zP/nsNZd
 FU4/uOkwpOzFZdwhfEvC/A8iLh7HVOCCNJJy/kBozJbEI2uH3sB0ZjQmHxiLe3cA/WHnYF3/teU
 47LDz/Fs9tyWTE78YLFqomx4Bg/p5KyRl+mY92TcAUByQIBXyf+kee8lsvfMy/fnEv6Q5jPrhMR
 F5NkvM0Q3RBf2KHnE/aSFmJglvHuDtqHj9LDPZ6fP1m28TAATJu4Rj4OqI=
X-Received: by 2002:a17:907:1c93:b0:c29:636b:3cbf with SMTP id
 a640c23a62f3a-c29e536342cmr447778066b.46.1789631615159; 
 Thu, 17 Sep 2026 00:53:35 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de454b88sm246492066b.20.2026.09.17.00.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 00:53:34 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:53:24 +0200
Message-Id: <20260917075326.1256294-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917075326.1256294-1-yegorslists@gmail.com>
References: <20260917075326.1256294-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/qemu: drop x86_core_avx2 exclusion
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Romain Naour <romain.naour@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Commit 1f7efaf89f03 ("package/qemu: do not support x86_steamroller or
x86_core_avx2") excluded BR2_x86_core_avx2 from
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS because binaries built for that CPU
variant crashed under qemu-user. This was done at the time of Qemu 4.2,
whose TCG engine did not implement AVX at all.

Since Qemu 7.2, the TCG engine implements AVX, AVX2, F16C, FMA3 and
VAES. In Qemu 11.0.0 (the version we currently package) and 11.1.1,
target/i386/cpu.c has:

  #define TCG_EXT_FEATURES (... | CPUID_EXT_AVX | CPUID_EXT_F16C | \
            CPUID_EXT_FMA | ...)
  #define TCG_7_0_EBX_FEATURES (... | CPUID_7_0_EBX_BMI1 | \
            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_AVX2 | ...)

which covers everything gcc generates for -march=core-avx2.

In addition, the exclusion was inconsistent: gcc's core-avx2 is a
deprecated alias for haswell, both variants select exactly the same
BR2_X86_CPU_HAS_* symbols in arch/Config.in.x86, and haswell was never
excluded. The same goes for broadwell, skylake, zen*, x86-64-v3, ...,
which all enable AVX2 and build fine on the autobuilders.

So drop the BR2_x86_core_avx2 exclusion.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index e5379e7224..48979fd7ce 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -22,7 +22,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
-	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	depends on !BR2_x86_steamroller
 	# The Qemu TCG engine does not implement the AVX512
 	# instruction set, so binaries built for such CPUs cannot be
 	# emulated.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
