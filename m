Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590A7EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA7960BCD;
	Sun, 25 Jun 2023 19:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA7960BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VX4idW3SD3bJ; Sun, 25 Jun 2023 19:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26306606EB;
	Sun, 25 Jun 2023 19:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26306606EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 709C61BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 574CF606D3
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 574CF606D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0yfS-uwZLBhw for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:38:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D7660669
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53D7660669
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:38:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98d34f1e54fso237202566b.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721906; x=1690313906;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ikuGGbswl21P9/Y/n31Tq1oWwYtVUm7gA7X0rb2vYa8=;
 b=lxuJbwj0WwdL6lYvPSL2V4QjYQX/3D72VwqJNv/66Rb3hMGe9/RL/tQ/ULsr1zqOPC
 V8hZQ/gPUbLeoQTOpB8YC5KmK/wR0XoKFmGIRzrrQy01i7/2bKu5/nX/BPzQoWJPbelW
 /Z6bAB2fi55sYIBAGSfE/DAB1FJD6Y9zmTY2Y8The64oBLqLzBMHJ6yxxV4s68hhHyP6
 tKdNNlIZlhG76nQZ6ThTALoKfwii8EVsqqDpiJK32AYyxDI6yVnFZHNGIGG5UhzcNxpg
 fTKJjMmgM9afbYvebEu1Bf+at4NGaEGBaERjt88auIVtSZNWtctqpf9Ju9tE+/y1oikC
 Fvlg==
X-Gm-Message-State: AC+VfDwJkR/LnnNj3OKpVAXcDyExtHKDbH5N7nd35Mvz4Joo5DOamRSV
 kaq4mLIi3yS41Pb9/ffxgKTJJQ==
X-Google-Smtp-Source: ACHHUZ7CbII5z6oGmpyfX0mdNSwoXpWFcWZxs7gglk+5cuWteW5yenSRrVBbjUwkyJHQkiaxxUor5A==
X-Received: by 2002:a17:907:3186:b0:94f:395b:df1b with SMTP id
 xe6-20020a170907318600b0094f395bdf1bmr19015648ejb.21.1687721906548; 
 Sun, 25 Jun 2023 12:38:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a170906414800b0098e2969ed44sm1376175ejk.45.2023.06.25.12.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:38:25 -0700 (PDT)
Message-ID: <1badb5c7-ebd0-87d6-e6e3-3893430eb02c@mind.be>
Date: Sun, 25 Jun 2023 21:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230625165340.306760-1-bernd@kuhls.net>
In-Reply-To: <20230625165340.306760-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721906; x=1690313906;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ikuGGbswl21P9/Y/n31Tq1oWwYtVUm7gA7X0rb2vYa8=;
 b=GfoyZWMld1jhBivtm+ZkGYxh1YClvG/JZyiBTYsMOnl/TZA7a+KolyB9DuNkDsM2JS
 ov1wl6k1pxl2VR0vvwGHilCQoPOPZCRnVDatURb8FkFq3lcLTebAMVAQG8dw8IflIpgC
 hT0fh74DAOx6/XrFbIsvrXMwFQyRow+eJxoJOIkEfXlxXLAN2Eh8MnxsR3VaEKHbjnpo
 bS+CGMZYpyoatAravYDxWXzQUox1qWgjrUnjJC3EUsByw5cIBez2G0IP625uQVrjN5ba
 XJazTEAmpO5WrG4nOoBNfWD/7FaUHunDGNZLgWeAqfZ+tMt/psANQdJFXk8E5Rz0Nw9G
 lk4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GfoyZWMl
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xorgproto: bump version
 to 2023.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 18:53, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-June/003408.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xorgproto/xorgproto.hash | 6 +++---
>   package/x11r7/xorgproto/xorgproto.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
> index 10655f9dd1..37ad9c7c04 100644
> --- a/package/x11r7/xorgproto/xorgproto.hash
> +++ b/package/x11r7/xorgproto/xorgproto.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2023-June/003404.html
> -sha256  6545e41aceba43c13497ac8084dad5db6deef580a5ea7d0bd7872cfd1be72a13  xorgproto-2023.1.tar.xz
> -sha512  342128ca2e9a6806a7ff33f426434bee29626a13a592b9544654a010cb7be208b0862e3cd063773a0003ca0ec7d48361cfcc384fe207efe9ecb6ec3f2b8e7d56  xorgproto-2023.1.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2023-June/003408.html
> +sha256  b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c  xorgproto-2023.2.tar.xz
> +sha512  af0a8c8094fc6a490a886a8c048175762b6334798f2e48b6f6e19a7bb39ddbef05fa1237c4e9d9f1d870d24f5ca7a7c463044c41ceebd108f8ab0816677a582d  xorgproto-2023.2.tar.xz
>   
>   # Locally computed
>   sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
> diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
> index 899f505f1c..f6e5a5a434 100644
> --- a/package/x11r7/xorgproto/xorgproto.mk
> +++ b/package/x11r7/xorgproto/xorgproto.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XORGPROTO_VERSION = 2023.1
> +XORGPROTO_VERSION = 2023.2
>   XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
>   XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
>   XORGPROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
