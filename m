Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52FCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DCAC411ED;
	Fri, 12 Jun 2026 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbE3TPKRGh4m; Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCC4411B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264228;
	bh=bJI07oOVaj1BaxKnaWbdk0F9r0oaM1pCuy2IVUbm3is=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FTC9qOsFO027nkwL+BHPFNESxWs1Wazdftke/Cty/AELz+3yGwBQJSZwyGPLtVQMi
	 w8cOu6gTNwExHaLShUTxyIN3czVpU2dQL56po6gKeiTUhUP1T8YhS7syuhhXeZ5/ZP
	 /0oN6YWbpLMsv6Y8K1YjnUEgEZVwMbZquoVIV1OhJx7Syi1ndykho0mNvCitfpo39z
	 UdMXEl3e4kW1vF5HI8TbPMmhEbPhBpvr/iYOxPfozE07+99iaPPHfm7DRGW4vfPUa3
	 awINDvkGfRdlZM0w5BV0vq8SiXqPmUbeZVCJLONXjalkp1hGGbqiki436ROdaT07cL
	 KqxJ0dm106yjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCC4411B2;
	Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86041237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 839E782FD5
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpVvaYJvWdYd for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C99F83300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C99F83300
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C99F83300
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso4545195e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264224; x=1781869024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r+LmLQ15F8FScsrz3EbvQSpOrkaAFq4ydBbCi6S8JHs=;
 b=aXTf2myo1WhmaptBO1I3g66aGzGPzW3k4pC8KNOkEiU6MW+tVW1N9ZYLlBoFiC0AsE
 es8VEYcfjNWWda50wkk89y+HV0tDin7u8CSv3NLUzAY3VRyAmEMuCqjB9Snjz/xtBeRm
 bnzfUmGon+1/IVDIPxK8jVVVhQxyCDIWmcxpQR4FwjvBHj+FIgfDqA6yML0DGg3ImPtV
 U8Bzbf4Ne/B/jICL9IL+X21+iho2xky8lrPwezd9l22ylnC5/06Fsndl9TGjHBEBIxRY
 6J10mDkCl0IYlHs0g1T7BCiaoYAtP4IEVevlCKKmib6GSgKbxymzwF/b5RQ4/HVsx4W4
 93dw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+bmmv8pD5i8NGyva+yphYhMbnuy1lqYg1Eu5rn7b3J3gcVZ/MLhPjTcBp74GrS5QIymhxW5xCPA7o=@buildroot.org
X-Gm-Message-State: AOJu0Yx9WsbJCHGYgoKZsbVWz+9k+Ma9ehhSffioJhlw1uMUHNFZc2oC
 XxCgmIvHp/eVou1PDwOTxj2N1J9fgZ7MuMwq1TDcZRbTXDr7b9PUxml41zChOYJoUU2qe4isPYH
 TIOcN
X-Gm-Gg: Acq92OFrtkgfDjq1EaKtgnQ8Q+9wGYvymhxqBgqT1sV+6qI3+QJpaTShOxINQHexp8o
 Zs1UZ9A+EF7ecdtVRUyBxG1vVPAdVHwXDrzoqvXero8Lxfb73pIKOKBDbc825DNqDKlVBTWK/q3
 m5LX2mSRHMkfTE770azNk6EQCMMqWPNtAE0mnumBqZbwW5wClmIofZ8Q4vRdcfWA5yOLeLB3YHV
 Qm9PEVo9kTEQixoA5ARDk9r9AeJyTqEFwN1JC2CP0CIhcWzCsncLxGshlmRQ1/Zq93ytYAkSJYq
 kbq0nZETMDVkEI2YN/PCRvGWordLm9XSil0iNcr6LHxN4las6QSUeqbrnxuNaVzZB9zOa9y624W
 nqJWselXcxQY2DH/74lyOlkLQPmGX6nB4r+3HLR7vHK6LBLZiL7BKsIR8JBgjYFNCD1Jbm2S7vK
 8ezs1s0uGSfAQ5meyuIulvhmd0xg==
X-Received: by 2002:a05:600c:a310:b0:490:4b89:5362 with SMTP id
 5b1f17b1804b1-490ec508b20mr22473195e9.24.1781264224591; 
 Fri, 12 Jun 2026 04:37:04 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea7c8f49sm67681595e9.6.2026.06.12.04.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:04 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:03 +0200
Message-ID: <20260612113704.251139-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531143820.2967481-2-bernd@kuhls.net>
References: <20260531143820.2967481-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264224; x=1781869024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+LmLQ15F8FScsrz3EbvQSpOrkaAFq4ydBbCi6S8JHs=;
 b=ZKBrkaLetErzf9YXftKnLyvVAECKDzBnfUCG+9daZn2yzpdoxbnBqOHSMevwZlDdpt
 Gt1BlwmYJWXLiRf970EHpfvAXZAMTMWPn/lQNTjiLA5bqC7pcm9gSIwQ8Ma2CQLUMoD/
 crQ5mPfRptkmepA7FDB0/XEB5PEuINQSLpYxkcorME49uXS2yqUU60TaXOTnq4YDc9//
 qxHi5ZCC/BKPESwdphO5m6taR1gJdj1/deCSU9V1qgFDIDy/Ok0nLzUtEw3vaCgNEKAT
 HcCQzrl9ic0E2nmIV+Df4BKTWUdPekuH7kTEtyeHUzScNIr8riA6pwv0IjE3XOGzAcsn
 JKkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZKBrkaLe
Subject: Re: [Buildroot] [PATCH 2/3] package/sane-airscan: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
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
> Fixes a build error
> 
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_ref':
> airscan-http.c:(.text+0x1c88): undefined reference to `__sync_fetch_and_add_4'
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_unref':
> airscan-http.c:(.text+0x1cd0): undefined reference to `__sync_sub_and_fetch_4'
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_ref':
> airscan-trace.c:(.text+0x32c): undefined reference to `__sync_fetch_and_add_4'
> output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_unref':
> airscan-trace.c:(.text+0x358): undefined reference to `__sync_sub_and_fetch_4'
> 
> with this defconfig
> 
> BR2_sparc=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE=y
> BR2_PACKAGE_SANE_AIRSCAN=y
> 
> detected by the Gitlab pipelines while testing to bump of sane-backends
> to 1.4.0 in this series.
> 
> The build error is caused by an upstream commit added in 2020 to version
> 0.99.14:
> https://github.com/alexpevzner/sane-airscan/commit/fccd8402a6bc5fce22805edf4e0fb6b0f24479e7
> so a backport to LTS branches should be considered because the initial
> version of the buildroot package was 0.99.33, added with commit
> f78280bf262ceb1c1abbdade9de77fcc4add74ae.
> 
> An autobuilder error was not recorded yet because it is masked by various
> build errors of the sane-backends package which are resolved by its bump
> to 1.4.0 in this series.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/sane-airscan/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
> index 2324a3f661..63ef06b582 100644
> --- a/package/sane-airscan/Config.in
> +++ b/package/sane-airscan/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
>  	bool "sane-airscan"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
>  	depends on BR2_USE_WCHAR # avahi, gnutls
>  	depends on BR2_USE_MMU # dbus, sane-backends
> @@ -26,5 +27,6 @@ config BR2_PACKAGE_SANE_AIRSCAN
>  
>  comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
>  	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
