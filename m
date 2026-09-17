Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A65AC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7AE80834;
	Thu, 17 Sep 2026 07:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6b8F0EWe3RUO; Thu, 17 Sep 2026 07:53:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5C37C808D8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631624;
	b=iBpWZ7EX4pA2ayM/uli+DyZXoNht+fPU0XXgNXLDcgS31NVgaJEjA5wferGDfh8emwU6
	 N6gFfnLuMaD5W1OcOWWdSNRX7MZwauZ31TE8xrhEfrfa+daRZKubAPIf5WQemqTcx9Odw
	 FMFyqdp3sz+oUmT2aebN57VOnsY6damW3JvdQYf6PN1+Zm6reCFKHfp+wR4rN6Sk4MEeW
	 Lw5ahldbXAzjzom7j6gnn3biwRu+5kCBNFJwn7C1hf6daBjuGi+/L6v3RfQhl2wlDxUu5
	 VVpUIZoAk+ucsIkWJl+2h2FFicYmbEEGAasYgawTZBwWMPp8vcTJi61F4gdrG+u/q5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y1aVt0hweng73Ynv+GaNj1A1XhodqNBIA8866TRgNEY=;
	b=gCf3Og89ccQzTwnPg3ExtJC1aI1yqAoElRx5jeAh7wYlLMw6ADJIUtx74RyQfcHGLsth
	 EHsjzMGpUgYyW9vplREiqM7vTM0XgzMF3yXH/yPnYH4+Rk2GzFTZPeKuUyfRgf4DpiwNP
	 0hHquS3ll2zWFgZlvBop3L8gSGHdEXVMtAr59sGmGSJET+ZiNLoTenwVdEbSZ9D7eJujf
	 NoPCM+Uyr/3P85dvJvdhxVljtCrLoHxmGFOMsxLQC4jOh0lFO/NDwtqdBt/aY2rSLroZu
	 M8lwLver51GudqGWXT1vXvvXdMBX5TKhH8QVtvETPFEPsFotJlfOvDM37+1NkcwBLlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631624;
	bh=Y1aVt0hweng73Ynv+GaNj1A1XhodqNBIA8866TRgNEY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=L3N+3SLYdShuV1oDpXPo+ctV8kCFBj7KlPQf/+EiwDEtv1dbv5DUUJhYF0QmIQoIf
	 OXSewucPt0tSn7LQeAFBaoTrQbh1jD0YCRUhqcwoPb/cQ6bcHMpm7nAbckAE+yedg1
	 mV+BTNw61X1tyun7JbEGu0n1pg8vvUTteIkx2Tv91kVw28YHXcMnwSaDpmFKzozYBY
	 FQp4ZVZwoeYq/rPbe0Flf/XEEnAfVUnhpcctdWvMDDQhEUmV7tvOR0D4+M/0o+HGTX
	 mDTQuv61guqUgvLfMBFO48I/xCLEaah710eIFkIUQLKgyKfkeOUy2aFehg28aLb0Vq
	 C9Wfho8IuAvHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C37C808D8;
	Thu, 17 Sep 2026 07:53:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED26429B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D337D40795
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmwyV4KpG73Y for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:53:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE72F407A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631622;
 b=eJBT8PpuvWHHi7ffuccBll4rXt3Nu25HYKtY/JqW1eSJe7IHXfNH3T3rXZazIqatd/wD
 1fhCv7QwpHJ5PS8kFevyA5IZ6/XJjyE3+moz+YH5Qs0vZPdSecSXjzTZPxjW6cC7Vzwwo
 SHZrUIQ9ifcYDmFuZFmHvVKMEsBPuwwc7BoYhcsNq2ECZEvRdz0QIUViZgg58j/lv0QL4
 TaToz2/SNajaJwqEjwnEqdrc8KDdq0x3mVeFsFUgVkZz6qhHtHyyYDgrbpGkMaXAzVk81
 AvyaYRPTMwAH3fUedMFKmhToCBFcQSkkoxIXR9B65zIo9Qxb9ahqMq/of26uKLglCyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631622;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=yWmyNz9OL8X9wGsGMHyViCGFVC7kW7sWudr3vLlYHmE=;
 b=lQvOzlIKw/jv13VzWd7ekbqfgWSqU3K9+TnatcPL2rg5TI72H22PuD/qttmI5enBTLW8
 /nkUrbSb1w99KTG1SmcnNtmOonS9WTiInYZ6hrtd5vYfV6Pjnzw2z5FFaEG/cHUxkpite
 ASkIo0cn08MpcsSyJH8wA98PkoqwvSnFSjT7momDaPI33lYTJRGgntjZwd6TdxqbUP8L7
 xyr4vWjOEfH9vXY7cUZAF1NdT2ykqjRW7voIvuTrliKGo7z1qJnU45uEYkWPHmhWvQUPI
 TS8YWv8de7rOxof8UWTsl2bWT2047HcqQRYUXKNNXBPYpzOR/k5pCaH31T5/eF/7NAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=ik84dzMj; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE72F407A2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:53:41 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a605844571so726210a12.3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789631619; x=1790236419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yWmyNz9OL8X9wGsGMHyViCGFVC7kW7sWudr3vLlYHmE=;
 b=Uaka9XAkiNj2Evs+wy2V//awioKI2CaFg/5+a8kUJcG+5Ny0W93s4NP/1EWZ8FCp/9
 eTmyNONaNBQYjuWzJJf4lqOdCL+TjWKTOwd6NhO7CgBEZxBN0exDNvwsX4ILaF7nbXG4
 qpINL0grQFTb/VF7Fs1+eE87lvTGyRzSsJzdPW88kGus2NgkD7fuYWIFLIdmwh+CTVDY
 /3rjzdZufdB9rNv0Kd+SD400uL4K1HhEgrq25agsJxEcqkPQKVGtwi2lKoHICkEumwpE
 bDXTL/jx1nQJHqxPvGQuzYjYdFwGBGnD6pq4Zj1AwC17ZDu+Z9e50zxfDPXreufod06z
 szpA==
X-Gm-Message-State: AFuF++mWi3eBy10wrOT7xmNnuUtkerDriCjOFOLxukjMoOUqOWDvIVpZ
 Y8EDu0liv+D2AWQ9Hs2HnrYGwnB6oBurlz6inhGF1JXGEZ1ImqNiB9Y1XgEmdA==
X-Gm-Gg: AYBFou0QW/JpVSs8Gt/2RupGxam9c/PtHFFJ9zusOSaFD+qteFfS95EQ4Y6QRt7M1cN
 i9u+7aN9FQYIfFGWcNBCX80JbC/xHrl9Ycmw98M7tWV7hUFDL50EKeTyXVUb5KYPgM8NyO5iqx4
 /8bToXiUfGcE9k8Y7RDpxjSZ5x0Enm991j/dAqU4K5/TmSUnWRk8f26L71e8/TvDqL1MpSxhZOq
 CKrzntFtVY2keeIHE1FpKeP3Zxh2uPfbOc3GnWiojJY6vKIjC2DkC2U+9l77RTpoV2g+/s4Th9g
 TQJPeVvh8RFpS7Fv2wYDR0kq46EisfdTm8qQIt2u865jXg3O6wFe3tjGgGQSxKg83+Q1dcqAkws
 t1+hjNhZKMNMLWDurtFV65XJF6hj9jE208iMNH35iccb8XbX9MZbmbVuBn19Dt7XJ91yYDGltVi
 exIB51Y2akLp1a+zRSJco/8dq0a2fCrOjCaBBkHjrNGuHwsKHPgPN7HN8TxhY+vVZC1YIYvT38I
 ZswBodDmyvEJPoaGQIXcMvqmtAdk76nkUjwFAdDgk3J7Yo=
X-Received: by 2002:a17:906:4fc5:b0:c26:1649:47b4 with SMTP id
 a640c23a62f3a-c29e5317d1dmr431017966b.42.1789631619377; 
 Thu, 17 Sep 2026 00:53:39 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de454b88sm246492066b.20.2026.09.17.00.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 00:53:38 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:53:26 +0200
Message-Id: <20260917075326.1256294-4-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917075326.1256294-1-yegorslists@gmail.com>
References: <20260917075326.1256294-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/qemu: host-qemu does not support
 XOP capable CPUs
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
x86_core_avx2") excluded BR2_x86_steamroller from
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS. This is still needed, but for a
different reason than AVX, and the exclusion is incomplete.

steamroller is bdver3, and what the Qemu TCG engine cannot emulate
there is not AVX, but the Bulldozer-specific XOP, FMA4, TBM and LWP
extensions. In Qemu 11.0.0 (the version we currently package) and
11.1.1, target/i386/cpu.c has:

  #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
            CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A | \
            CPUID_EXT3_3DNOWPREFETCH | CPUID_EXT3_KERNEL_FEATURES | \
            CPUID_EXT3_CMP_LEG)

CPUID_EXT3_XOP, CPUID_EXT3_FMA4, CPUID_EXT3_TBM and CPUID_EXT3_LWP are
defined in target/i386/cpu.h, but are not part of that mask, i.e. TCG
does not implement them. Binaries using those instructions therefore
die with:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

This affects the whole Bulldozer family, not only steamroller:
bulldozer (bdver1), piledriver (bdver2) and excavator (bdver4) are
equally unsupported, but were never excluded.

Use the newly introduced BR2_X86_CPU_HAS_XOP symbol, which covers all
four variants, instead of listing BR2_x86_steamroller alone. As for
AVX512, this disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/qemu/Config.in.host | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 48979fd7ce..fbc989b003 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -22,10 +22,11 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
-	depends on !BR2_x86_steamroller
-	# The Qemu TCG engine does not implement the AVX512
-	# instruction set, so binaries built for such CPUs cannot be
-	# emulated.
+	# The Qemu TCG engine implements neither the XOP instruction set
+	# nor the other Bulldozer-specific extensions (FMA4, TBM, LWP),
+	# and it does not implement the AVX512 instruction set either,
+	# so binaries built for such CPUs cannot be emulated.
+	depends on !BR2_X86_CPU_HAS_XOP
 	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
