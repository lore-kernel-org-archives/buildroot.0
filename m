Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78343EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE6841F47;
	Fri, 13 Feb 2026 19:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veP3Rp9FPcwt; Fri, 13 Feb 2026 19:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA3642239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011586;
	bh=/D5RJt9gnLNAr5EGKoqkis5sjfYvuMXXecMvE/IWnLk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EtrWWP9x9XbU1mys8wauettHaOR1Ix/WVooMZ73IZsY02uHcGGEOhqYeBmcF+m1i5
	 CXIQs0aGRSD4GJYKhePB3AvmTKaopyzYQmu4mQm+HX/frdwvSO1E2OtkvTtF/AVZoM
	 aIGoHLXE27p1QgQkgphYr6JOAVp1+fjlx3OKGtm7GAhLuX0A6w3KXPTCBreq5AZyuk
	 uhQxewMl/Ti/U1Ey79QMUEUqi4PUhtTy2aJTvQDz3kX1c67LOklIQLNnSef4NWqdks
	 eKqVfUai1aF8z1ajK5YOj1D0Zmd+clTDifDTol6yU10EU5uLoKcMIMPb5agnLy/NqO
	 CGfREsCtuJkPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA3642239;
	Fri, 13 Feb 2026 19:39:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 307C6283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2153742049
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7RhOOoEtYej for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 383194203B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383194203B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 383194203B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so14411345e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011498; x=1771616298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yyN8t/Sew/ladU71afRdC0c5ReVlisDmXT6cT6TAQZU=;
 b=A3VXXON404N7MUYRie+JQR8/MtBHwEXBs6vgF1oxVg1n4e0xiE38nKV0vzwdF0uDx9
 olVrEI3ch1ZEQwaNpzt5AYLdo6W5YVRSXUx+W3yheTXEHUfJhRtrRgyunrzx7LfWb6r+
 /BV89V0pyI+krX91ZiBOf+9qsHuIm9jTWFq4Z6PdD/9ndJ6bl1wQ15jppsSoWrI/ITAb
 IABlIWriDsf2Bg9pF/ypqj4BCzO5OrnyeLhDZcNnPHFyq3rHnp2P3FgW+DvBvx8pA1Ug
 UEkuhlc1oP2i4JgNbId8b2UqbGw5ImwkBVTxShEM4f2Pgk7B03P11d5qXD5ZTlh0+ITm
 8Zxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk2iXxNW7rcPuSksT1Xl19MwjbHacFhtwfofZtPwrPNTcA2VdmnQti32zm1sgT1MiM2dNFryHu/TY=@buildroot.org
X-Gm-Message-State: AOJu0YyMAfkO7naqs7nJxtjpuOo+PH4ebBqs3ytIGB61AWSq7o2E67MP
 jts8nfVCXsiKYgxzXLBMjCHC/T8/bMmwwtoenC/X66CMQRPKWXyfCDfNPGOq66dFOyU=
X-Gm-Gg: AZuq6aKZZ+wMCqxFzB2xF9JbAFp6+etJyn/1Pjzm2jlje5NkpaaBGbcr0Bc6kDbPRhA
 W+6TqFEWYlsG1LfFG0cUCO/ODn1P+9v5GWYMt9//Q3DgPT2PDzj5EI1d4KQgijK/ONSlcF3TNrx
 0waMrHz1cIE71ji+LdY+NHFas/uQwaqziL+PiMrkqK4HynXlSMoocNi6Jknc7S9uofeSPMrVR2b
 0tPTxJAy6SCIdV0UBLNYZQwRlfzExw97uEsFF+dMULTAsOgX72s1gVZg5XGsB/2FyHnYIo1KH1a
 8tsF3vTPpt5Rid4LmRhMq43NXinQTT/fTrUiF0KRjPt1snks4QP68fsaF9AoUwCGzYXjAnhHo5r
 QwsHOk1BRXFpbIljFcsPSmygR0T0dzBTcvVGonfmISCDuKyeZ8GwvCxOJ4hmvtFR0dQ8IF5Nmc9
 5PbUySUEJBsdFohJg=
X-Received: by 2002:a05:600c:8706:b0:480:6999:27ec with SMTP id
 5b1f17b1804b1-48373a0b559mr47464385e9.13.1771011498148; 
 Fri, 13 Feb 2026 11:38:18 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370ac3564sm66179485e9.5.2026.02.13.11.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:17 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 13 Feb 2026 20:38:17 +0100
Message-ID: <20260213193817.41980-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-2-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011498; x=1771616298; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyN8t/Sew/ladU71afRdC0c5ReVlisDmXT6cT6TAQZU=;
 b=UvkW3vq17CS0hlc22xsFOAVtfNUXutQGMqxBylmfHjUEdMYW+NPTay8YDQtocFKpPr
 jTplDHGdeaUtdcgzTGJaPkm04rTqa//qYkbp3NrF9lxOoM52wwcZXMOQqpCINdaGkoUA
 N0CcDebcVAeBI15898QeUm7HWJCm84ow2WHR3shBqx/TBfowFUvfmN1d1Qa3MKnMlsJ4
 mFdE6Nv2fW1awxbpTdNyfq4R0Gh7gQ5OH5ujScAWMtDw/bub+hKyXtrs5YhiGzPvc5+U
 +2XQooGtgJoRodcLGcokHvChodT9+UPSyGtbS96Xn6ih5/0Ww/ildtND8abyuEMXjrOq
 bIJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UvkW3vq1
Subject: Re: [Buildroot] [PATCH 1/5] support/config-fragments/autobuild:
 drop Buildroot ARC toolchains
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
> We're already testing the ARC architecture with one Bootlin toolchain,
> it doesn't make sense to also test with two Buildroot internal
> toolchains the ARC architecture, which is not a primary architecture
> for Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../config-fragments/autobuild/br-arc-full-internal.config    | 3 ---
>  .../config-fragments/autobuild/br-arc-internal-glibc.config   | 4 ----
>  support/config-fragments/autobuild/toolchain-configs.csv      | 2 --
>  3 files changed, 9 deletions(-)
>  delete mode 100644 support/config-fragments/autobuild/br-arc-full-internal.config
>  delete mode 100644 support/config-fragments/autobuild/br-arc-internal-glibc.config
> 
> diff --git a/support/config-fragments/autobuild/br-arc-full-internal.config b/support/config-fragments/autobuild/br-arc-full-internal.config
> deleted file mode 100644
> index 4755c9e45b..0000000000
> --- a/support/config-fragments/autobuild/br-arc-full-internal.config
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -BR2_arcle=y
> -BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/br-arc-internal-glibc.config b/support/config-fragments/autobuild/br-arc-internal-glibc.config
> deleted file mode 100644
> index b9d6857240..0000000000
> --- a/support/config-fragments/autobuild/br-arc-internal-glibc.config
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BR2_arcle=y
> -BR2_archs38=y
> -BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index a559221b99..f5c6c6672a 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -42,8 +42,6 @@ support/config-fragments/autobuild/bootlin-x86-i686-musl.config,x86_64
>  support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
> -support/config-fragments/autobuild/br-arc-full-internal.config,any
> -support/config-fragments/autobuild/br-arc-internal-glibc.config,any
>  support/config-fragments/autobuild/br-arm-basic.config,x86_64
>  support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
>  support/config-fragments/autobuild/br-arm-internal-full.config,any
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
