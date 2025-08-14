Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC150CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C652D80DEE;
	Thu, 14 Aug 2025 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3vY69k6APH5; Thu, 14 Aug 2025 20:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687EB80DD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687EB80DD8;
	Thu, 14 Aug 2025 20:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D01341BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C27F2402D0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq0v8Css-DQN for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A46A4022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A46A4022A
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A46A4022A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:47 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6188b6e79a0so1939938a12.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203505; x=1755808305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncZRDAJ3H+hvsFJoEAIW0hS5H37bUMhePmP07NbmXEQ=;
 b=Hs1etdAHJoIOZKfTRiiCJ72OLS4KCNgGSbt83WiqWfPv2TCGIWH3hwTy/nJY7x4OJx
 nsTQ0EwJvcfjZNqE+JNMoIKAtOWxMFVQ+EXZISFPH21YNaJcVmPiqCJ3Lxfuj7awf7H0
 DAIYEkimlI2jdpFgGfDutO2XgApywmwCrQHi7X1431VoDA6+hm1OgNHhidCpUfme8P+R
 xHgFovPDJD8UMLNcMtFo4kvtI4N2PheVWzmQkGl7Yk2jJpm6WwewalBAdiEDUPhrSCw3
 YYVFGJnMX+dujDeKUF20qzCk2l4UDf2Lexbizn1hwe+hYT5NJspDiW15HZs8G/VaXDTz
 iHvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/nwue1QkGDQBsmmXksZAnXGXnPpNcQYciVC0462UgKC06RqNbQU1nii4/bxHWj8dQyKGPUQimWo8=@buildroot.org
X-Gm-Message-State: AOJu0Yz9z9mQAnGf9bPlGLWC17u5l42JVAp3puss9QOiZ5DcgscpwOAe
 XI68tFCdEDuNsR0E8BvW27h6JcnvbNwGJCjM83nOqDoMtZvJk5NHaGwWS2e1MIHT69PD3M1U4vr
 b+vlRjB8=
X-Gm-Gg: ASbGncscy+YkJSOu4SOZdcYhQjp+5mPetaUMCmw4SNNRGsCgaeE14dhDn5uxVxUyUeh
 a8+1m8YbY2hTUnQMG4Mytas0pj6vgGNXubj8dyKT9txNg4XYJlfei47OnLSZOesDVT4Cv7u0Bg6
 GqNFRAaw03yjYWhMJl4XSzwb/jR5UIdRWyofgmiUzAGgLsuBFmywTG/VNqNMo21ezLlDO+rR5Ju
 aEHB0wpjQioQ8LZQlTRYSMPKLwUUD8hEx5N3veNmp5n+z8HU0lBBYWSAWpsguOLwtcJ+1EGN88b
 GWcO5aPedYuUv8QMJX4xMXvnAjQRRsaCoNN4ne2Xrfjcaw9CieX5L+Nllbs9PcvNTHdDdzvvcSK
 9izwjlcGAoEft3g==
X-Google-Smtp-Source: AGHT+IEQfaJf8JEf+eo/Xxfq8qKWaxORZX/zdHTbOYVrccRif4A1atBwV5IrkHB84adssV6Qz6mGKA==
X-Received: by 2002:a17:906:6a13:b0:afa:1453:662c with SMTP id
 a640c23a62f3a-afcb939530bmr395520566b.8.1755203505429; 
 Thu, 14 Aug 2025 13:31:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3b58sm2646584566b.58.2025.08.14.13.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:45 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:44 +0200
Message-ID: <20250814203144.2815219-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714145242.27516-1-fl@n621.de>
References: <20250714145242.27516-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203505; x=1755808305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncZRDAJ3H+hvsFJoEAIW0hS5H37bUMhePmP07NbmXEQ=;
 b=UTp/fkV/WkpvrhZF0vaSnLQmAVy8D2NRHPyPsMtl91RyN87epRTeWJQbVVCTuKRcNF
 jie8EQuaT5flX5hwjemb9PLE+R17f0XbBpSEfQiBZ3qHtT7sxS/z1geeS9mVjgsN7IBd
 hvpqilmm+k+fmNX4Y6jFCkHBwM9uOjRV4+6DBlhR0mtYbGFHPwTWLNwvS8B63YvfjKRo
 SCcgYulIBz6tKevTcqFAcqgszPETc3Ny42zukq/Csz8svqRvOcyVB0EpbXKRbHujQrPo
 0TKcUgf/cqMS6jaMyUcoUtRD5jJFA/nWWR0t6EEQ5P1Hifn6nBZkuDTkC4VUc1ELiFhi
 /5Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UTp/fkV/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: make pre-built compiler
 provide target support too
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
> All Go packages must depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS,
> which ensures that we do have a Go compiler available for that target.
> 
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is currently restricted to the
> availability of a full host Go compiler bootstrap. However, there are
> architectures like AArch64 for which a full bootstrap is not supported.
> 
> Thus, currently, on an AArch64 host, we can't build Go packages (for
> target or host), because we can't bootstrap a Go compiler.
> 
> However, note that a single Go compiler can generate code for all the
> architectures supported by Go and for some host architectures, there are
> pre-built toolchains available. When host-go-bin was added in commit
> 7b2a164b7460 ("package/go/go-bin: new host-go provider"), the host
> dependency was properly accounted for: It is already possible to build
> host-go packages with go-bin. However, the fact that a Go compiler, in
> addition to its native target, can also generate code for all supported
> architectures, was missed at the time.
> 
> Thus, we can fix this problem by relaxing the condition under which
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is set to allowing go-bin
> along with go-bootstrap. This allows a situation where the host can't
> bootstrap, but for which there is a pre-built toolchain to build Go
> packages for a supported target.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> Cc: Yann E. MORIN <yann.morin@orange.com>
> Cc: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> v1->v2:
>  - Reworded commit message after discussion with Romain and Yann.
> 
>  package/go/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 7e354b3298..a42e37f90b 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,7 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
