Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C67DC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D724F40BDB;
	Fri, 10 Jul 2026 13:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMqGSipGlWVO; Fri, 10 Jul 2026 13:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0AA40B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691508;
	bh=vx0k6ig0wK22QwLNR/eUBecF6TZ9FuGv/vWrQOE8oIo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hRMIQXjfHmGJ/pHrbSKA3Nv2svUPexGsqZQWEvBqwBGevRfo/sTzzKgULdigYWTpe
	 uyKj8en9CRe0cNOF2oyK1+rAxVP2lUMs81Fn960d9AA1KpPcdcrd13ym7cKq+BOFhs
	 j1fepdE6Lz1kxNSqw64WRY67M0N2PclxqIUEZNBzNED/N87keIJ+nKSU6Cc5c7NlNG
	 xLGsyLad0PFk8Tm6YkhJd9YhhsH7RruLfoIrzCRsR5G4rJ/BnCuBAQvphGRXOhItZP
	 ezy7yEihGJ3DOxeHnXDl7l4TmoJ/R2lGtuIly5LvDdivX/8fw7c8IEbszbtDfwVLIS
	 8mpBJYNMflOUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0AA40B2F;
	Fri, 10 Jul 2026 13:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E088FA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7192810E9
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYiFxovMDRix for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC9D8810ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC9D8810ED
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC9D8810ED
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so8069725e9.1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691502; x=1784296302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=i+1BvfF6ShdlUPhOovAt4Lir60wT048VKT9391hjDWU=;
 b=IjalfU+ftKZrTUeslBAe2ymsJqz2cwm7nZ5+MBm6Y0B21OGMtZi3Qznj5XVEVFBrJ/
 Vhri8UIq5pZxpvBCEOEVuMdfoHa4ATmAldmnCGNR5oqOHNfI/k+HC25Ua5gD0xN5bJxK
 wg/SfHRAeDVE7k3u+LOgTnKiMtvkm2y/67D7AAxGJircYNcbvgc79NGJ0OH5jsXFsOsm
 Kg7wOnsWKH/u5rSEtSFXgbQW/UcexckYBOZuK852aH7UkdrUHu1XzTerZ5uLJhJTTu5a
 GHBH9K1PGxM46rT40Koj7BE0HXVafFmJgnKKH32C5eeB0PMGh92JY0LX7XWrYC7049Z2
 YC5g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoedhcmRH2t9qTsF/a6/6bZHmN+vXaMCnTPjefDSGxuo5+W1/sPfV84xroFvik3dgt9OfCXYAM8+X4=@buildroot.org
X-Gm-Message-State: AOJu0YwB17VCBQ7vThSK8gIb1UobaNU7RO458FBTENI/bU8q6wfD1Zyl
 j184iTYGSl1SyFYbyG211Omm8nrQYGKTGzA1vkJV4nr/rLwjYSKvTTuIEkKNCm7YnoQ=
X-Gm-Gg: AfdE7clSA5akks33IqkBV9E3GNXMQdYcyJN2leqKzn0+zqNCdBt7QoKYwGUJ8ZYKbp3
 fz8mGRpKovoe2cyOXcf4S3QpUlwsVNd93ZP0Na5K2HEFYRFVsS6W+OCLmA/GvdxctWUrr6qzctx
 kRDIv5vXsnTH0GadYwKxRGjWnLiEghf3aprEy3mCbutTWBKk2hwGo2jXQXyXpundG3KO/rH9Lmh
 4IhwTu9akL5Gjz2pekKN/E9Q7E7hhG7KOVjHoD2cCvu+NjQWMjxUGRlGwfsayfdu0Fa5Gj3q8a4
 erKC0127STxmYu3BMGk2/58zlc8qeLzpqpV/YepHgoaM/WAd7CyFcyp1DDvDBs1OeTewRoLVwST
 fds67LZ3swj2nzoZxe8DLLnqSuliIxdDJLYffgKiedGMMA+MpQsyz8v4ExwyYfQAaApNMDsGQO2
 vrbyT/ww==
X-Received: by 2002:a05:600c:6c55:b0:493:a7bc:5bcf with SMTP id
 5b1f17b1804b1-493e68ddc7bmr85941185e9.24.1783691502275; 
 Fri, 10 Jul 2026 06:51:42 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9b4d850dsm61503332f8f.0.2026.07.10.06.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:42 -0700 (PDT)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:41 +0200
Message-ID: <20260710135141.759238-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260624182117.362190-1-thomas.devoogdt@barco.com>
References: <20260624182117.362190-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691502; x=1784296302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i+1BvfF6ShdlUPhOovAt4Lir60wT048VKT9391hjDWU=;
 b=KMYL8lles1l/+wkretoXVtWvL7Pf/OsVqwZgxIOZ6BbZ9g8eBNHZWxE4XY3oEvASCj
 c1Ei92fJDXafkXrK8q8maVIF+Qyb5nKINPeSwtkBBU8aain1k0fuHdYCXBERvottYmFl
 xTh+DBkEC5A5/OeaxXOf5gElqnRgnEDVbw3S5koxyJtQj4G9jn1Pph8sV5lrrJ9VCb9j
 PD/wgVx25rtpOnHCs2DRMRLg4AL3Aa6UixtuFfk8AQK/uuF09hZNtmugRbEOErBLoxpo
 9eOjXyvgARVUi6CSd4ncI3mxI2KvdF538uqPTsm2bKQmJYUDDch0qBbDV42/5FOefcL/
 24TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KMYL8lle
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.52.4
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
> Release notes:
> 
> https://webkitgtk.org/2026/06/02/webkitgtk2.52.4-released.html
> 
> Fixes the following security issues:
> 
> https://webkitgtk.org/security/WSA-2026-0003.html
> 
> Includes fixes (among others) for CVE-2026-28847, CVE-2026-28883,
> CVE-2026-28901, CVE-2026-28902, CVE-2026-28903, CVE-2026-28904,
> CVE-2026-28905, CVE-2026-28907, CVE-2026-28942, CVE-2026-28946,
> CVE-2026-28947, CVE-2026-28953, CVE-2026-28955, CVE-2026-28958,
> CVE-2026-43658, and CVE-2026-43660.
> 
> Also added 0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch,
> to get webkitgtk compiled when -DUSE_SYSTEM_MALLOC=ON is in use.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  ...6-main-Fails-to-build-with-system-ma.patch | 52 +++++++++++++++++++
>  package/webkitgtk/webkitgtk.hash              |  6 +--
>  package/webkitgtk/webkitgtk.mk                |  2 +-
>  3 files changed, 56 insertions(+), 4 deletions(-)
>  create mode 100644 package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
> 
> diff --git a/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch b/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
> new file mode 100644
> index 00000000000..decdba68148
> --- /dev/null
> +++ b/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
> @@ -0,0 +1,52 @@
> +From 146cdc86b7345ac8f513fdf649979e80db01a2ca Mon Sep 17 00:00:00 2001
> +From: Alberto Garcia <berto@igalia.com>
> +Date: Tue, 2 Jun 2026 07:24:38 -0700
> +Subject: [PATCH] REGRESSION(313606@main): Fails to build with system malloc
> + https://bugs.webkit.org/show_bug.cgi?id=316083
> +
> +Reviewed by Fujii Hironori.
> +
> +Don't add bmalloc_CopyHeaders to LLIntOffsetsExtractor_DEPENDENCIES if
> +USE_SYSTEM_MALLOC is on.
> +
> +* Source/JavaScriptCore/CMakeLists.txt:
> +
> +Canonical link: https://commits.webkit.org/305877.698@webkitglib/2.52
> +
> +Upstream: https://github.com/WebKit/WebKit/commit/a6bc685a685c8f16c919dc6310a62a26971d396e
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + Source/JavaScriptCore/CMakeLists.txt | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
> +index a2a6d724608a..ea9ea17802f2 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -412,8 +412,10 @@ set(LLIntSettingsExtractor_DEPENDENCIES
> +     JavaScriptCore_CopyHeaders
> +     JavaScriptCore_CopyPrivateHeaders
> +     WTF_CopyHeaders
> +-    bmalloc_CopyHeaders
> + )
> ++if (NOT USE_SYSTEM_MALLOC)
> ++    list(APPEND LLIntSettingsExtractor_DEPENDENCIES bmalloc_CopyHeaders)
> ++endif ()
> + WEBKIT_EXECUTABLE(LLIntSettingsExtractor)
> + 
> + # LLIntSettingsExtractor target needs to have a direct or indirect
> +@@ -439,8 +441,10 @@ set(LLIntOffsetsExtractor_DEPENDENCIES
> +     JavaScriptCore_CopyHeaders
> +     JavaScriptCore_CopyPrivateHeaders
> +     WTF_CopyHeaders
> +-    bmalloc_CopyHeaders
> + )
> ++if (NOT USE_SYSTEM_MALLOC)
> ++    list(APPEND LLIntOffsetsExtractor_DEPENDENCIES bmalloc_CopyHeaders)
> ++endif ()
> + WEBKIT_EXECUTABLE(LLIntOffsetsExtractor)
> + 
> + # The build system will execute asm.rb every time LLIntOffsetsExtractor's mtime is newer than
> +-- 
> +2.43.0
> +
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 03b8d0a9bec..f8c0e0297a3 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
> -sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
> -sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.52.4.tar.xz.sums
> +sha1  1bfaa562ae46a420abaad2b3b9175dc823cc7a93  webkitgtk-2.52.4.tar.xz
> +sha256  cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4  webkitgtk-2.52.4.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 54e769d5892..6cab2c6a247 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.52.3
> +WEBKITGTK_VERSION = 2.52.4
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
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
