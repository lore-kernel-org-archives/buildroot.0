Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B3CEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 620B584815;
	Fri, 13 Feb 2026 19:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8QbAp0e1pQa; Fri, 13 Feb 2026 19:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA1F84816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011524;
	bh=FuHRfUWnzVEcqjJXNmd5f5l/wPx6hqX4ru2AyBSWoag=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M9yiKWHiAhHtpi73pFhIcHKp/+Qot7Me0m7qdeyWncnKK4WeJvDp7sugTdQhDIZsA
	 tskGr1sdm+x2rtzKRsrQYugmgqKu2s8MJqHmspxB5ykodY11KxYF07iArQ+8ir1RC3
	 lSdk/IlDa455Lyn9iM4jrZ1q3Y4esTY4IzTo8kiQl1wtvHI5JIrj5chSa0HjNzBSML
	 oUzD7gLzT+FZgnpKjjGygZWj8pH2BV/om5y3b+7/ABglhesWfpgP1jBOmUMj4hVATZ
	 mU8ZVAe3BlB6uDiPmlaw7aMc9hxEAZBq8hYiPbMiY+nCHmps7CLY+vsIJ/bP4R6MEI
	 txt3olg/XU0pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA1F84816;
	Fri, 13 Feb 2026 19:38:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58388EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4932284723
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNLxQIgI90cR for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 236B28471D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236B28471D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 236B28471D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso2424385f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011461; x=1771616261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8f3PvNjQMEa0syuT2SxEHbNHoSRuf1VK78Va2s6x8Vo=;
 b=HmkY3v+54wv6bhEwtFbV1zREpmXZpgxeeiliUSlGjyccNFs9xB/q4L6FQ2qzSqMSwT
 6umusrFHmWMHR3lodFOPQvtWwwcvjdDUx90djrfluz3v5yyaepx1q5mMl7luvOZOWywZ
 1eqj6zcPPGZ4y5sFb6T2aSsclC+44XqxBBnfQ3mYWPXMPV0RI3hJtkbfRu7+Ff8Ifzh0
 LZnO5aNbVeGLekY3dwXubBeQ39UvGHagWhFEsAfQS8JyZQXwrGhn9LjgW/E+TRz579PR
 HnYa66JpCzrRjE0Pvf/fYVxEN91ays6ZmkEK9ZzbQ2C1wQLopEMIr0iBRV0+QbPYq0Ha
 X0WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkDm34bJ3xE7F+1XL+83i/N6bwtxDxzzD1EY+T7A6qtkHXOYnv7J9o0+k4u14HJ7qlMxhuQTllNfE=@buildroot.org
X-Gm-Message-State: AOJu0YxMtF4wC1Ly6q8SfdHzEMcMMZ/ZQu6SYx64irGpccn9EwYR4Ix9
 kASLVtMqDi2vqmJRObJE0Tpf6JHv5r/+dO7DGIM9Hmv0pj+wA5JSVhcB4d0+6GNpUgk=
X-Gm-Gg: AZuq6aLOSkltYy2dHZ3Imj662599B0tdivdxQa76W7obF3DYPfY83qEAAYmaracDbPQ
 dNxh3QPzs39WsihSYzpQ3of8wsBRiLJ9eJRj7jlZnZq0GOEjcqyoNy/88wF7IUN9YMx1LBLdK4Y
 50pCrLoRhZGBRsouLovNGv8dUoWz9jPTfa+uq421cI+yQOnSlvHfcK/2N0MJeEFEfGB2LzAk+ts
 vfvzAIsWscMsLIoWp9sQccJ4BR6mNZi9E72rz6wzhq5kv7tQDXw7SM1iBvbIGf4zueb5uwRyWAD
 mH8O+McB7IAS4MGgJvwJA/UGBytW6vC/9ECOy7R1LhJMoc0h8k4mHJT6e/CF4iMmY1RVkws7x2H
 NehCMxwCWGTI7StmbSjd1assqclDhctNLRhpu8EZonsq0eO3E44xJ7Db7r2+wmYwwxgU9WWLpo3
 dJ3BRu3nzrEjEd2Jw=
X-Received: by 2002:a05:6000:2902:b0:435:db93:7311 with SMTP id
 ffacd0b85a97d-4379d612aadmr2429349f8f.18.1771011461167; 
 Fri, 13 Feb 2026 11:37:41 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abe3b3sm9397341f8f.18.2026.02.13.11.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:40 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:40 +0100
Message-ID: <20260213193740.40301-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110193254.4079274-1-bernd@kuhls.net>
References: <20260110193254.4079274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011461; x=1771616261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8f3PvNjQMEa0syuT2SxEHbNHoSRuf1VK78Va2s6x8Vo=;
 b=RKMb+kyKXYzfMxxnTJSiZcLuSK4ddHwt0SU5QxcRb1gitYTBoIv/C016xKD1nb6+Vv
 3Xt2PLE0AC4HUYdD6afV8zzvrhaBeKFD95TbZ05mndzskUbqikWLF07ds8bCrwgKG6u7
 eAfrG2PnMXOYEMjGPU5i4D2nga1w4dG5kOvQBTY+1pMep6c4AE/8PJEqRn2dZU56jgDk
 9l4mGlOCwEDd7RN3kf22VV3VDq8XwCyVYJudnW5UsnKNbLUOM2vgaS3Orz070TMJn3cO
 tZndZLKYB9bmQW/Za8RGb0U91oWWcsYL8R832PtqFh2Tn4k/y/ClnecI3Jbuz7k4gqBV
 2iJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RKMb+kyK
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: needs MMU
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
> Buildroot commit e834d23cd792ee57ea80f37ce01d9d50756dba1d bumped ell to
> version 0.79 that includes upstream commits in version 0.72 which make
> use of fork():
> 
> https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=9245dfb84d1e0f58dda102704201d78ddfdfca68
> https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e0628c429d50d50b116717f37a5f5c1f66bef6a2
> 
> Fixes:
> https://autobuild.buildroot.net/results/036/03690fa454ffb1c4c79b182cc3a165555e2c59eb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/bluez5_utils/Config.in | 2 +-
>  package/ell/Config.in          | 2 ++
>  package/iwd/Config.in          | 2 +-
>  package/ofono/Config.in        | 2 +-
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index 49bb719102..2fe25466b4 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
>  	bool "bluez-utils"
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> -	depends on BR2_USE_MMU # dbus
> +	depends on BR2_USE_MMU # dbus, ell
>  	depends on !BR2_STATIC_LIBS # uses dlfcn
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/ell/Config.in b/package/ell/Config.in
> index c7c9164816..124a57f7e9 100644
> --- a/package/ell/Config.in
> +++ b/package/ell/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_ELL
>  	bool "ell"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
>  	depends on BR2_USE_WCHAR
> @@ -9,5 +10,6 @@ config BR2_PACKAGE_ELL
>  	  https://01.org/ell
>  
>  comment "ell needs a toolchain w/ wchar, headers >= 4.12"
> +	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> diff --git a/package/iwd/Config.in b/package/iwd/Config.in
> index e4b0ead882..d8fb6a6ea0 100644
> --- a/package/iwd/Config.in
> +++ b/package/iwd/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_IWD
>  	bool "iwd"
> -	depends on BR2_USE_MMU # dbus
> +	depends on BR2_USE_MMU # dbus, ell
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
> diff --git a/package/ofono/Config.in b/package/ofono/Config.in
> index c1d0cae4ef..c6a45625d9 100644
> --- a/package/ofono/Config.in
> +++ b/package/ofono/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_OFONO
>  	bool "ofono"
>  	depends on BR2_USE_WCHAR # gettext, libglib2, ell
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> -	depends on BR2_USE_MMU # dbus, libglib2
> +	depends on BR2_USE_MMU # dbus, ell, libglib2
>  	depends on !BR2_STATIC_LIBS # dlopen(), ell
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
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
