Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F18EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F1A61403;
	Fri, 13 Feb 2026 19:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3KNgPWGsl61; Fri, 13 Feb 2026 19:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B26361459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011614;
	bh=owuDohv5JAbM4JPzvWxE7Lkdie7Unwv5Trmz/3nuhtk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J6+fBKg6VCk1bdqDjdsMcd8rrwINefUYFgbcoCDFClWujFlcXWnH7JVmfccJhcejh
	 426F2KEeAcCPQYZfZ8zeGhz+i0XaxXDsaHr5RVA05BDp052V209cyHIDdt8KDP2JuA
	 BNcISrOlxjNEd+EE2qWnZnvgc+Br3BJANsneuXptIB8r6iCtHf+pI+drfMROIhtv91
	 M4IbjybWtiINEvwpptXsSKSUFfxZol36qIx/uIIa3lCnVMZxfDLD2D2yWNaS+rEkMA
	 GWjATe5u4ZS9rrPtAnI7Qo2boI/NVJ/Jvny7ffKvWVqtYiLmkenCT4YArdx/TcZUfB
	 lnvCD1zNJtYPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B26361459;
	Fri, 13 Feb 2026 19:40:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C0B8EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 529F34133A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txwAE8n96W6E for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41A18412D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A18412D9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41A18412D9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so2258768f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011445; x=1771616245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OQMNpU4Nka74AvDrMT1JpopnY4pSYk9Xhxryusn+MnU=;
 b=NzDoePrBeZOoFwtbhWf6nZdXt4IHYiSXyrFnxPySFejNwk/kkPLKl/EI4L5Y+4q4dD
 S+MPSF8ZqEqmXjVhmLo1hRNXjXktv/5BCuFC6ClPjVgHB4MnOlolxvThflk67w0d8z7p
 tJ2keNqNh5oGP0lkSTRwH5cefpXQYC3UzSb39pL15+q/nLrLJD0GF6FqIxEvGETFkyHh
 vrL4WKG5j1OO+a+MfTpJmnP7022bRvFl4Ah7x6X0pG5HpdmpJt5+kkIsg8fpZBoAtdvS
 7g3WR+9JxyYou7DiR1yhCObnb2/3Aq2PUHOCcHWZTzhYgFE3e7ik0H52niewCL3fSYY1
 kb1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2tx0dSLNMiFHIjGAcoOCm90opf1qlbaYXl37NbvgkI8WCOF7Q2xpqWrwJxdcw+Y1DrryTtKp+QAA=@buildroot.org
X-Gm-Message-State: AOJu0YyeghawJnlI/8vVdWyq8N5A9Z5yWoJ+Wtvr21AjBwexS9V0c9Nq
 dqROkJYFHP6yYt3n5vs1BjquA/sYV5npxB36dXD4LqCr5/DZb45QNJjwVI6VJDYcdOGfZPrOKUf
 GgrwL
X-Gm-Gg: AZuq6aKs8WcYi0x57TCgug0yqfpOdEuslj3VdsaLrJ7i1YlIC/yZlDuQvHr8cYjCwxM
 mwd9Ya7/efgwwebZk/41pG0UUSIA+4VTMc7PcjM28XXMrBfxr7kFCSTBdJmrt1SRB+GabndX2jd
 NO8aQ6jqzhEatTpEVSyhCwWoCff5qdzCOgfPkMskjAChlaanUBFKRkii/3GNiXMetypXmVl6OxK
 ddQXKSR9hU7Ymit41S/eX3xztdr/LysFj4Ti/XGpwPUWX3mCgAHCuRwwlguvYQmXVCs2J38gsg5
 xFFVgRY1GmjouBO0qNl2PDeMm3zng1TBEapWMuU/MaWNRrbgTKcRs/Me9RNtcustKV/jvrlNr6t
 ZJCJ0MIDgnJ7aBo/B2HQK8RFT9s3KYpX1MqhSE4G87f3i8BwCrjjkKX2EYDQyrFFdXDYAGjU+Ww
 Tot7+vaSyk5tEVS18=
X-Received: by 2002:a05:6000:184b:b0:437:7719:ca82 with SMTP id
 ffacd0b85a97d-4379d5db59dmr2842840f8f.3.1771011445090; 
 Fri, 13 Feb 2026 11:37:25 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc8b1sm8097929f8f.23.2026.02.13.11.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:24 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:24 +0100
Message-ID: <20260213193724.39240-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-7-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-7-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011445; x=1771616245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQMNpU4Nka74AvDrMT1JpopnY4pSYk9Xhxryusn+MnU=;
 b=U86NThE2ZDUO27Bf6Pa+xukbmVGqjopN1OkWxQKzh4xwWhigAQCvfjmC3sP1od/n49
 ase26pfnKQuCASN6+uTb2NzhKdA71kv7HbJsagvOmT0vDuuk/K4WE5fMHL0DebuqBuos
 eZ9arF8KDLGnDb3q9ohRuzZ+tt/N0RC4XqintEdazFwtJ4n8Qe8IpVC9HnRFq2ux1iEh
 DMU46RP1c61TmPzEfhF9eFbO24p2BtAptR5SMt/7rFdiYvIwEbnhWGRMzcFCXTuacdhE
 IuuSr8kIH56qtMaYf8gj1LVhlwDtI2dQAJBvlNkLqLBbBR4IZLB4rqCyNxZtjzeoMm5C
 6lhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U86NThE2
Subject: Re: [Buildroot] [PATCH v2 7/7] at91bootstrap3: Add support for
 custom license files
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
> The AT91Bootstrap3 package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo
> ---
>  boot/at91bootstrap3/Config.in         | 19 +++++++++++++++++++
>  boot/at91bootstrap3/at91bootstrap3.mk |  3 ++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index 35bdb28162beda956ff4ffd17772b491bf5f5ca0..987b5eb7efd3d845865d34afaca4f35ae5e88f80 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -66,6 +66,25 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
>  		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
>  	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
>  
> +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_LICENSE_FILES
> +	string "AT91Bootstrap3 license files"
> +	default "LICENSES/MIT.txt"
> +	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the
> +	  AT91Bootstrap3 kernel package.
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
> +	string
> +	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
> +	default "" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
> +	default "LICENSES/MIT.txt"
> +
>  config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
>  	string "custom patch dir"
>  	help
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 4bbe7cc71819bb5841deac0ca9b513e7189796f4..2ed34f3de4d7285f9b14386fe3c21241b65aa4b1 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -25,11 +25,12 @@ endif
>  
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
>  AT91BOOTSTRAP3_LICENSE = MIT
> -AT91BOOTSTRAP3_LICENSE_FILES = LICENSES/MIT.txt
>  else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
>  AT91BOOTSTRAP3_LICENSE = Atmel License
>  endif
>  
> +AT91BOOTSTRAP3_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES))
> +
>  AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
>  AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
>  
> 
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
