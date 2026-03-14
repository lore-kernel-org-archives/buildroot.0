Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D99107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC39160FE4;
	Sat, 14 Mar 2026 07:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9SFlfLN-hej; Sat, 14 Mar 2026 07:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 904F160F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474852;
	bh=fnT5SkHlLR60If+3ZPMcRmmneLg079rbN8muINAoV1E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MCTJ76S6ELVfXzcGqHjutVA93g/JG8hrXdubMM4Wr59ZGl2LOOXrsoBhUmXhguYKt
	 9iO/isXatFofwrL5NKTkc+lKsub9MBU2NMHXGnK53OdvDI1slaHq6msINmh5WzxZCu
	 mIBbjOfduVEG7aVqs368xO/jRQrcIhe8HGBY//CXVHQEfD8gxoOo0o0YkpIbMOuCW+
	 LGdKvhjPx5a9FQAOdHKzvn4EiXsTMk/Me89BG+NBka6ji5TwlyKM1t84hI4W9v9SMq
	 44YcTAwQmdek71OdhsxOIaMKN2oIvsZOpZLyvE2wslc/NommdhCbf8mLIo0VYagTsR
	 biUcD1GMfQteQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 904F160F72;
	Sat, 14 Mar 2026 07:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2269E1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C6840135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKRGCM52G2gF for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18063400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18063400A2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18063400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-485445e80bdso25367885e9.0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474842; x=1774079642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2qvzUbpL292dNmPlWoDgKNO8bRlvE/uTZMVZKxyciz8=;
 b=BQ36/XFVBahUa6UgJ/1dkFtKDskqhLYpzHzbU+onY8y04vEJ2J+fmvkG9K5Ec11V4b
 maB1UEFL+0bc+evpggrFUSiu02tL5RonKbk0KSX/A3DmyBgRKer3pWPJTTQICEo9DMWQ
 cLlxKOlw49Do6pXPNGCLDVP+egNpbCbr2qEan/s2SzRsj/8/smf4+RGP+EPcK1K002ad
 7XAWp0KSlAp4akwX3DjGXAJDcBgvC3nPFlteeb/jKeWk5kfbO+//Yhp/vdAIKXp1fWSq
 RkRPX19Al6ltpHXSjdRWPDNcipILOi0DQhsHc9Bc9XsAK91+t+DTIeBNH2XZ/PJUVfh6
 PCPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYIHAChBJeKxe9j0TinuxI+SrCifZcsJ+hhbXtaEemoX0RA6tTTC0XPLWc6y14omSGkgbmyaDSJ+o=@buildroot.org
X-Gm-Message-State: AOJu0YwdIOfYVgbtC8yn7hymAYwtJ3FZWtyystdDLvJpRaDjRpoej1kP
 kvMWBEBuT6oKoKSXZ/82dPxJmNM+jGAGmCfIIDyQ2BIr2p55W4imFFmgJ2XcJ/8bDbQ=
X-Gm-Gg: ATEYQzxt0ZPXCAB/W2ZbqWVsr6mNO9TamP65SSOCjxDNunTHMOu9wPdz/n+uX70E+hL
 rPOaVZFG8eUHBPEfGJE4rQLIKh/vlsZ9adl57xQppBG9PGByDUsGWC/N8PLT70pDB09uT72CD30
 ugpXutKPSW4DZeayT7Pr3fqBoYX6lNxkemXGAoid6nqU2GXOLpakBjkWzPe6SBYRobX4eV1C9AG
 bSmGLe9XSeVLihG5eo+2nGgGfgODo/NsYIgqAJEJjMDglhBwH5f9EiBijn8gwwrNI/iM6R2y4ef
 cxlcd/q0lF3wtYUBgrKmo2uJsu2IpX1THyMa7F8IgGsx0PxR37DaV2lqh/AdwHgLR7oBaQ3vNNp
 dSXiOldBvNmS+SsGoqsz6+7gNNxpqriSTH2usVKtNbCQS7iNvxoWA1onN8O02YwwyQFSDPl/65s
 3YTSBqcsetP+CZQxg=
X-Received: by 2002:a05:600c:1913:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-485566e2d50mr95869015e9.5.1773474841857; 
 Sat, 14 Mar 2026 00:54:01 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f6e6sm637628135e9.10.2026.03.14.00.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:54:01 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:54:01 +0100
Message-ID: <20260314075401.15271-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307190851.853162-1-bernd@kuhls.net>
References: <20260307190851.853162-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474842; x=1774079642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qvzUbpL292dNmPlWoDgKNO8bRlvE/uTZMVZKxyciz8=;
 b=X0h1+NtLSZ31PDVT3RhPIDbjsk9v8y7gVXyfGFxIeSRkXFygBQ/6P7cnVB6V6R2rIm
 X+4/N2t0G7D2dcAFzN8vbJQCVNYT9ui5Dru2yNbJxAqoN5XJxFFk7QsoVt6fny3f9IXi
 kHyJItmmllK1q5mVAI30jHS9WcbVrBrnLgUgB1Bc4ccTDRCE1bPBxPXeLZQRYROkbvqa
 qIoZAiXvwz7ynMxBjjLt+FTVVJbvKuqv9r0witomk0lNb2KKXS5upMOnEN0xer41sfGU
 uYKVa5kDFZMt2tM0dAZKG6uSoAbIgAOPg0F9C/EiR34RA7g+VV5djhqDggukHdihreTA
 Vq5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X0h1+NtL
Subject: Re: [Buildroot] [PATCH 1/2] package/libvips: fix static build
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
> Buildroot commit 72c7d99e22eb7706e413992cf7084438fea657bb switched the
> build system to meson which causes an error during configure:
> 
> output/build/libvips-8.17.2/meson.build:108:4:
>  ERROR: Problem encountered: GModule is not supported on your system,
>  please reconfigure with -Dmodules=disabled
> 
> using this defconfig:
> 
>   BR2_arm=y
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>   BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>   BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
>   BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
>   BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
>   BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>   # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>   BR2_TOOLCHAIN_EXTERNAL_CXX=y
>   BR2_STATIC_LIBS=y
>   BR2_PACKAGE_LIBVIPS=y
> 
> Added configure options for -Dmodules to fix the problem which was not
> yet caught by the autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  package/libvips/libvips.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index e7641fa8cd..729d5fb9e3 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -31,6 +31,12 @@ LIBVIPS_DEPENDENCIES = \
>  	host-pkgconf expat libglib2 \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
> +ifeq ($(BR2_STATIC_LIBS),)
> +LIBVIPS_CONF_OPTS += -Dmodules=enabled
> +else
> +LIBVIPS_CONF_OPTS += -Dmodules=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  LIBVIPS_CONF_OPTS += -Dintrospection=enabled
>  LIBVIPS_DEPENDENCIES += gobject-introspection
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
