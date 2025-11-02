Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CDCCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D3F84245D;
	Sun,  2 Nov 2025 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTFEqAv-hiP9; Sun,  2 Nov 2025 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951CD42464
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951CD42464;
	Sun,  2 Nov 2025 14:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BCE32A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 14:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 391BA4106A
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bQmJnuhuiHO for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 14:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FECA408FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FECA408FA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FECA408FA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 14:23:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso45741365e9.0
 for <buildroot@buildroot.org>; Sun, 02 Nov 2025 06:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762093414; x=1762698214;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bEHP7UkxDhNg1eTZX1VTXkxGyM/3kIvLSlp5jeqX0ow=;
 b=pvsx3+41Q0bSbsydLjLWkLQJfRsNv+Y5G9YDCC9gm/FEn3l6cahLCwhdXjk63NTuvU
 +RB/ee+48tIowY3ZaLR8aUvE78sacmSgMlz43YRiE6IQTtJqLt6tgHV804MFneT4l7m6
 RPOQXwui7XOz6ggN26QSay+OG+X+8bGZPSPL9eJNKvco9/vi4h7Ywr/WgeUvsH4TFJhA
 SK/UEhMurDAhl8iLLZmGFdINpb67NDWb5wFsaWnFeDZxySlCQpHEMekzjUJlpgQl1vnA
 j13B/vU/sheoyCZ5iXpR6p/BAMTa7afZeBEMAsuY1f3vYcshcSViLYszw3TmN9CCYxgr
 vtKg==
X-Gm-Message-State: AOJu0Yxc+TFLafApn82YVd/z2Lu1rLIGFb5ldjNjjBxFyBrI/NX6zBa8
 YmTzNXPUG41lv3fQIUkmKkrZRdNaW/UcFIEIwrobr6j/pJoXMi1Dqtg8nEiMyMTP
X-Gm-Gg: ASbGncv75r8n53ms9Uap7/E9c/AoqF76hLs4V00ZWBbfC4+FvWWXXkppGRRIBbC5nup
 zIATRUNFZ8vYVBYrAzz4JC6BInEO26J0ym20LHyestt2ETvE8u6MWehQjC3pjRs3zrWb4Ul2rFn
 Lm+fQ/65roAPJq/hPonudqFsTz2cfMXaaTnfNB5vcBpTNRJNBI6QP4qS8NhctdySUZqmfKDzBWl
 H32u4c0xfDxPHz0v4/WdCEWvBwjyc/qDef/lU/lBAg4oP8w8PZSd1gAyTHztJ5shabwTxwk9Ovl
 mdID94s5b1xXpGIWJYZxCCW6nqNq2vHY/REt3c7KaVeHK1kdD9lsAaNeavLgnmw7WouaxUwSOl8
 oL9nV1qOivOPxfXXSFul69hrXskw0ejtTBb/hs5+earMCvnH04YOO2acTvej+MyNtA9gNTE1Cdh
 A9KQ==
X-Google-Smtp-Source: AGHT+IHmAf2Ejovvu52Dc9dJrnfBp2n7CxN/4ncJE0TAaamQ4Aditashs9q8hon7uL4fioOZUs9u2Q==
X-Received: by 2002:a05:600c:3511:b0:476:4efc:8edc with SMTP id
 5b1f17b1804b1-477307d9920mr79974945e9.15.1762093413607; 
 Sun, 02 Nov 2025 06:23:33 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fabe202sm66861905e9.0.2025.11.02.06.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 06:23:33 -0800 (PST)
Date: Sun, 2 Nov 2025 15:23:24 +0100
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Message-ID: <aQdpXKpYYu_QofBs@thinkstation>
References: <20251022-piglit-v1-1-9c1a52af5650@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251022-piglit-v1-1-9c1a52af5650@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762093414; x=1762698214; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bEHP7UkxDhNg1eTZX1VTXkxGyM/3kIvLSlp5jeqX0ow=;
 b=WrAmz8v2cF7ARTk3mXi0c7gcJnKmw0NH+nZofwp+HyVahtYPUhLB1jfJ5PxAyShfSL
 B1b2aLp7F1npNwGiqkVUu86rby6b+Q/jgfwL90LEkDFKRoPiaeKYTs4e7wsc6KobZOnI
 mYCnt1iJKB7fmVr7jZVkqhAES4shliqSHdWRr3XQiWgEK+ZRXsxHfs4myf+TWGlR2mHJ
 x/jnrjHY7XjyeAwtlrtwgb35Sq+ANCr6yTUIFC8tMmGz4GOnzdLgg1nl5PAnkO8oZVu4
 u1YnPO56A5ukvSRmSy+TH+INCJKZSXH0fXNrBkGldhzkqU4NiWJj7+Kb/+IMREpHp0Oh
 n8cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WrAmz8v2
Subject: Re: [Buildroot] [PATCH] package/piglit: bump to
 a70c33045c59310f972dbbdb33f322eb209971bc
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le Wed, Oct 22, 2025 at 11:38:40AM +0200, Raphael Gallais-Pou a =E9crit :
> New dependency since commit 2519c330fba5 ("make: introduce option for
> building vulkan tests") [1].
> =

> Add vulkan-loader new dependency and bump version to commit
> a70c33045c59310f972dbbdb33f322eb209971bc.
> =

> [1] https://gitlab.freedesktop.org/mesa/piglit/-/commit/eec9ea557fe813b96=
3e8aa77a95c4d2e6e432033
> =

> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---

Hi,

Gentle ping on this one.

Thanks for your time,
Best regards,
Rapha=EBl

>  package/piglit/Config.in   | 1 +
>  package/piglit/piglit.hash | 2 +-
>  package/piglit/piglit.mk   | 3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/package/piglit/Config.in b/package/piglit/Config.in
> index 48b7641909b5..3b92443fc56f 100644
> --- a/package/piglit/Config.in
> +++ b/package/piglit/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_PIGLIT
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> +	depends on BR2_PACKAGE_VULKAN_LOADER
>  	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python=
-numpy
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
> diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
> index 2c0b6aa52a46..20c79a4546af 100644
> --- a/package/piglit/piglit.hash
> +++ b/package/piglit/piglit.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918=
  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
> +sha256  e968966faee7d97305c0a526d339102ddfc8435a2c9007c90444cb3303629f6a=
  piglit-a70c33045c59310f972dbbdb33f322eb209971bc-git4.tar.gz
>  sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc=
  COPYING
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643=
  licences/GPL-2
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903=
  licences/GPL-3
> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
> index 4d17405d10ea..76a759cfca40 100644
> --- a/package/piglit/piglit.mk
> +++ b/package/piglit/piglit.mk
> @@ -4,7 +4,7 @@
>  #
>  ########################################################################=
########
>  =

> -PIGLIT_VERSION =3D 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
> +PIGLIT_VERSION =3D a70c33045c59310f972dbbdb33f322eb209971bc
>  PIGLIT_SITE =3D https://gitlab.freedesktop.org/mesa/piglit.git
>  PIGLIT_SITE_METHOD =3D git
>  PIGLIT_LICENSE =3D MIT (code), \
> @@ -23,6 +23,7 @@ PIGLIT_DEPENDENCIES =3D host-pkgconf \
>  	python-mako \
>  	python-numpy \
>  	python-six \
> +	vulkan-loader \
>  	waffle \
>  	zlib
>  =

> =

> ---
> base-commit: c55714aeb9e9bb32b0674b93c4a4cd4b6fa4eb52
> change-id: 20251021-piglit-ebd7afed9982
> =

> Best regards,
> -- =

> Raphael Gallais-Pou <rgallaispou@gmail.com>
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
