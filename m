Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8EACD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93DF560FE8;
	Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwXbAEHY6K2k; Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A000660D56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264231;
	bh=LogYeAdJDIhZVXosCvYP7B4R7GPkgSGfGVfbILtxZug=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJ+1y4hk9hI2oZlRfboIjdRgPJRhj4DzTtL2Fc4JgyqXWEMTXo4PBPKHawqXlL5NU
	 NR3D6pTs5pOQL5zXlP5HZe9V0cQgmyzNPs/TPdukVPwqh9oNyyNF6ZYcErkY/WeWbq
	 EY8r/EiNy49JToHlgLETcFCrhpA/eUJvN1211ITY1Dd3FUowLznoNW+pWdJnKkj665
	 g7LZElg5rmxnqUdx85/38By7HDHPNc4/lnUUXGIZwFDAt2fntOSZCgKOIjXBGBpxhz
	 9Qn1MmSPmQQOwwr3fgNY8HAzX3A788eKvi5s9JNhNr17S+0kjrJNJLdiCP9MLNCs3p
	 CaF6qDsheJyvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A000660D56;
	Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4ED212F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB6EF832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6DDWlDNSBGj for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D8B883300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8B883300
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D8B883300
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so576010f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264225; x=1781869025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m6t8KtF2cE59VoYzKxqbxpToKlhhWRJDm7oqYR3jX3c=;
 b=HzWnC69LxC8Ya+ol8AE8ef3m3xCaqEQTP1ZEtv4igZ53lIRa9ba6lX5ikCPh6YoVeh
 VipngJ+Kaxd9EmuCLZxj7QaUkNu6Ee5GLtBzeMeilZy07p1x2vG/Ne7w6jNuKjNh+0cm
 30NzEHIi2Pq9uEZx+w/4xe18oqRBVaYTWQl9bGAj3AqEh7+nLLjAiP1f5fNHR6IwkFrO
 4UAHm+3Xb185Wnc/UXGwK9RgjTPCgwW3rm1pSdMXIcYXZUi/jQWFqJ3izv0Ky82nv9cr
 11aSUDbrlDRJIiTw0KdjJ3nCpXAIeR0vPtGSxjQlwvfXVHV2ziS/cOlSMJnqNs/w9m3+
 BtfQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9T9EXLYMxy8ES4qTeK7e6WhUUNkDCfoVTU47Cok8AQLKXAOsEI6b2px0qAuC55mNLATt+FvBvfckI=@buildroot.org
X-Gm-Message-State: AOJu0YzZXTy5f38Yh1JBrhh0pp4pUbaIgkp9kaIsE5jCWWP47L7vqir4
 z2RfT5zzkgwRvHawDRlwf3uMHSF/xp6nmShFvCu+UV12/HkE+beKoakHY9AyyVLoBog=
X-Gm-Gg: Acq92OFerngcuss4SQwzblH+sIo7s60hL5AndsyhV4+I/tzkArmSz4VbVUO/86BwY05
 ZzGdfXH9yXvpzgh8ye/tBDp938IQ2TgRcYGvOJk+4I/W6CqZTRpSsA7cq0DzYgW/iLsOE6KYhRT
 Nc94+yi6DTyKKtpmnb5ia9oUOOvoxzdzoc/fPGFe9e0RD7QAej+TUWzmwBQGA1OykNXt5OQ+dpQ
 5Gmp2w4nZNV5l/WgXYrbDNaQDtqbjWSS7POPgNTe4iBiPalrHGED6nmcricDbWvuu6YwYeh2K4m
 hBpplciEwKC5CTOIS+7lEcPQgkkVK8BQn180vM4eMfLmYrJoNo3a9guT4veaEGPa72AtyU//Kme
 TYHFjYcblVohuDyFQiiiejzdBW4fqDO8XPRCegX2cu19H12r4+pczz1bd3VYAEdcZqRWdrsarnR
 eYfRu7iI/sgbv0nIU=
X-Received: by 2002:a05:6000:4203:b0:45e:eec6:500c with SMTP id
 ffacd0b85a97d-4606dbb6bb4mr3702069f8f.39.1781264225450; 
 Fri, 12 Jun 2026 04:37:05 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263950sm5096902f8f.7.2026.06.12.04.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:05 -0700 (PDT)
To: Pengji Li <wjjsn@qq.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:04 +0200
Message-ID: <20260612113704.251188-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
References: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264225; x=1781869025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6t8KtF2cE59VoYzKxqbxpToKlhhWRJDm7oqYR3jX3c=;
 b=ZFKad7ioVUW/urnKcxnjzBkIrBadeEA+/SDBTrTJMAixfzdPrU5UVJ2q1qpQ5ittoc
 ZLKiJZAmjcmQNie1xeUxhKaJaXsMd117j5IRA/sdhndRp3AkfC+FPdQm0WmW5o406OSX
 T6Uv+gjh5kKns2Z1mEAq3qHMhU92W2VYPLyTAqIPh+mUyPUxaoBsWyC7mvURX5owWmls
 6p3QDXl5rCW2AX+uPkdiK2ycD5tfiW3wsIDfNaKuwW5th6PFYrREwEOyoLCGwA9xNHmV
 4VkfDGAsbc8Od7zghNzz28nP2kZfv6cdmVI0mGsuDWPmhOtNGMgZQ3b9UKlu6ToQ1YGI
 Dp3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZFKad7io
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: respect LoongArch SIMD
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> OpenCV probes the host compiler for LSX/LASX by trying to compile a
> small test program with '-mlsx' / '-mlasx'. With Buildroot's toolchain
> this probe succeeds even when the target CPU lacks the matching ISA
> extension, and the resulting libraries then contain LSX/LASX
> instructions. This causes SIGILL at runtime on, e.g., the LA264.
> 
> Map Buildroot's BR2_LOONGARCH_SIMD_* selection to OpenCV's
> CPU_BASELINE / CPU_DISPATCH knobs:
> 
>   BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
>   BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
>   BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
> 
> The block is gated on BR2_loongarch64, so the existing auto detection
> remains in effect for every other architecture.
> 
> Signed-off-by: Pengji Li <wjjsn@qq.com>

Applied to 2026.02.x. Thanks

> ---
>  package/opencv4/opencv4.mk | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 695355c308..0e2567eb6f 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -120,6 +120,41 @@ OPENCV4_CONF_OPTS += \
>  	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
>  	-DENABLE_VFPV3=OFF
>  
> +# LoongArch: OpenCV probes the host compiler for LSX/LASX by trying to
> +# compile a small test program with '-mlsx' / '-mlasx'. With Buildroot's
> +# toolchain this check succeeds even when the target CPU does not have
> +# the matching ISA extension, and the resulting OpenCV libraries end up
> +# containing LSX/LASX instructions, causing SIGILL at runtime on CPUs
> +# such as the LA264.
> +#
> +# Trust Buildroot's own LoongArch SIMD selection (BR2_LOONGARCH_SIMD_*)
> +# as the source of truth and translate it to OpenCV's CPU_BASELINE /
> +# CPU_DISPATCH knobs (OpenCV knows LSX and LASX on LoongArch):
> +#
> +#   BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
> +#   BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
> +#   BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
> +#                              (LASX implies LSX; OpenCV's own upstream
> +#                              combination matches BR2's choice above.)
> +#
> +# We only enter this block on LoongArch, so the existing OpenCV auto
> +# detection still applies for all other architectures.
> +ifeq ($(BR2_loongarch64),y)
> +ifeq ($(BR2_LOONGARCH_SIMD_NONE),y)
> +OPENCV4_CONF_OPTS += \
> +	-DCPU_BASELINE= \
> +	-DCPU_DISPATCH=
> +else ifeq ($(BR2_LOONGARCH_SIMD_LSX),y)
> +OPENCV4_CONF_OPTS += \
> +	-DCPU_BASELINE=LSX \
> +	-DCPU_DISPATCH=
> +else ifeq ($(BR2_LOONGARCH_SIMD_LASX),y)
> +OPENCV4_CONF_OPTS += \
> +	-DCPU_BASELINE=LSX \
> +	-DCPU_DISPATCH=LASX
> +endif
> +endif
> +
>  # Cuda stuff
>  OPENCV4_CONF_OPTS += \
>  	-DBUILD_CUDA_STUBS=OFF \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
