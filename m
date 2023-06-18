Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8690AEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B1860E49;
	Sun, 18 Jun 2023 13:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B1860E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XSamW3cyy9O; Sun, 18 Jun 2023 13:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E682E60F66;
	Sun, 18 Jun 2023 13:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E682E60F66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DDE61BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1883440953
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1883440953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DyLCthF6Icug for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:02:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D309241299
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D309241299
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:02:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-988a5383fd4so13966166b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093338; x=1689685338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B5gXLowlJhATNbgtqiFc5eV3CNpG0Qm/9iD6c+Rh3AQ=;
 b=bjTwRyA+sZ5lQzlBN+BLtPtT4d5WlBFy+J5RjgZrQsw2eH/oN0TsywN/v8UbupBsZO
 7JHNS3nk0dRQK3ke2cjcI7LTJS0dkvuizwAsg5UxpvNcK0umbarCGuvGz06xUj/FXBKn
 x3lp9qoKstDGCxGhG6diZJ/lXZG6j3ZWkpI2D3bpgJ/kZ+A/4apd4AOn3tJ6SquPPFri
 aFgr4L9Ar0f9y6667rMb+MAHptj3xZBtngKQB7AHGK5loQrPgnu2DlJJ6+Gu6xaVe4Wh
 7AJY9h6HPNPEJgTNzq9jM1jmMOmJzhyOjWqWsxY030hYj24vIS/auo4TajqiAfj/TzWv
 OHrQ==
X-Gm-Message-State: AC+VfDxKt4Fz+TW2fSgPVJNYjpMLK+1w1/BA5e62xhWa7bjI/xSzOYAP
 ZzZQ9TqhXcP7P0yupWcuEtnRjx6cK7ObffSDaQ8=
X-Google-Smtp-Source: ACHHUZ4nUrjREor76RrXXqyNrVKbBdnsegUaEk2sISkYlPpSB0TT0PvhV8ytBjCYeHj6cv1OSKp+nA==
X-Received: by 2002:a17:907:6d8f:b0:988:aa45:826 with SMTP id
 sb15-20020a1709076d8f00b00988aa450826mr68639ejc.7.1687093337795; 
 Sun, 18 Jun 2023 06:02:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a170906a05700b0094e7d196aa4sm13170682ejb.160.2023.06.18.06.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:02:17 -0700 (PDT)
Message-ID: <dfaf9dc0-179c-5a52-7afc-0153f4698325@mind.be>
Date: Sun, 18 Jun 2023 15:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605064746.1738909-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605064746.1738909-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093338; x=1689685338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B5gXLowlJhATNbgtqiFc5eV3CNpG0Qm/9iD6c+Rh3AQ=;
 b=W9qtUXRkaY552GWKxPTYyr8gErYojvfcNQUBwMj+0Rq/catKloWfYUWidL+KbTMasv
 88PEDZNoA+yCvYqE13ag3KFZwwM9KweAmHs9ZK2Bd/2VNMvNwHYUzWqoM9WwlSET4wwW
 rSGrzlZeA0UAgk+iuSXYBoE6PHjPndm92/6nvDwHc74eMgM8wuu7a0rlNcZRxHtTIIJc
 9byDEvVmVmaMqLppzgxiFsKiL6yF7vcgnjXQoF71v2m5Dy0/NpPUWOfVQPsVnzykqqhu
 /fMd713Z1qyrVgH3YwktZFZRhzR2eEKDedPTQQYXmaEaX/XZN5uEIz50Vb42FLzER4Sb
 9XNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W9qtUXRk
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.70.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 08:47, James Hilliard wrote:
> Link to Rust 1.70.0 announcement: https://blog.rust-lang.org/2023/06/01/Rust-1.70.0.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
>   package/rust-bin/rust-bin.mk   |   2 +-
>   package/rust/rust.hash         |   6 +-
>   package/rust/rust.mk           |   2 +-
>   4 files changed, 131 insertions(+), 131 deletions(-)
> 
> diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
> index 4cb1f0c1cd..f6c72f7555 100644
> --- a/package/rust-bin/rust-bin.hash
> +++ b/package/rust-bin/rust-bin.hash
> @@ -1,129 +1,129 @@
> -# From https://static.rust-lang.org/dist/rust-1.68.2-aarch64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-aarch64-unknown-linux-gnu.tar.xz.asc
> -sha256  1731add9b04d0fcbd096b610a67e1b1ae5740ce1171dd904d944ff504a84bcc7  rust-1.68.2-aarch64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-i686-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-i686-unknown-linux-gnu.tar.xz.asc
> -sha256  cade060a15c5064763cd67ebba418989cdbdfb1dc4b6fe8dd4310f187540f66a  rust-1.68.2-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-mips-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-mips-unknown-linux-gnu.tar.xz.asc
> -sha256  a453eca326c676d6b6deda8c444dfc30288d2ccf66bcbad3fafbbad2d4dc9506  rust-1.68.2-mips-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-mipsel-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-mipsel-unknown-linux-gnu.tar.xz.asc
> -sha256  80694caccab8903456de2b09fce15458e2aaa6dac97e706051a7aaa2df069dd0  rust-1.68.2-mipsel-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-powerpc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-powerpc-unknown-linux-gnu.tar.xz.asc
> -sha256  1cda60a097c983a5da0564aac365b6edb59452ac8474dbb48575c34ddaa1f8d4  rust-1.68.2-powerpc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.asc
> -sha256  8a0062a66a6deedddb47778e3092dddc32a934c3127999a1abde6ff2a39ae7f1  rust-1.68.2-powerpc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.asc
> -sha256  5e305ddc26861daa1516e1eba53ac3372506351950dbf5ada492a7f2fc65cfe5  rust-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.asc
> -sha256  198054527500cb57cc8cad5b24c56e8ab1df6b48ae85b7c41a6ddbf2e008eb00  rust-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-s390x-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-s390x-unknown-linux-gnu.tar.xz.asc
> -sha256  5039fde5d70691cecd21449b543967db6590ddfd2d4b3c2064924bb154866e72  rust-1.68.2-s390x-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.68.2-x86_64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.68.2-x86_64-unknown-linux-gnu.tar.xz.asc
> -sha256  7f0f19d50f32a353ca78bc5d6d7c483efeced684e2c37ff847e4fd9699c7e063  rust-1.68.2-x86_64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-gnu.tar.xz.asc
> -sha256  cbe60945af743804be6822704f986c812dd1fe1d167602aec5350a8f519f9861  rust-std-1.68.2-aarch64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-musl.tar.xz.asc
> -sha256  718c073d24f3627750049bb74420f90d1ac29843ca16933e11aa301a806a0b10  rust-std-1.68.2-aarch64-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabi.tar.xz.asc
> -sha256  59da96890b0a2881799b21a3f49e51f730d67b8dc09b87602dd599e8f980e247  rust-std-1.68.2-arm-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabihf.tar.xz.asc
> -sha256  565730a2ba02357251f9805b5efe0423adf5411892e0d01cf441456234f81e70  rust-std-1.68.2-arm-unknown-linux-gnueabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabihf.tar.xz.asc
> -sha256  4ea9588934eec3d83bee2789f3a15b48aaea05fc8ec1bc175951ec1d0eb6ed22  rust-std-1.68.2-arm-unknown-linux-musleabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabi.tar.xz.asc
> -sha256  fd065db4269b5131c2f52638b8f30d0159109850c74c87bdf4c623dc0b32d5c2  rust-std-1.68.2-arm-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-gnueabi.tar.xz.asc
> -sha256  a7e19b68c44efe52df159f89f8b37790ca613adaa3f77937eb460747552d1e59  rust-std-1.68.2-armv5te-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-musleabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-musleabi.tar.xz.asc
> -sha256  74188e1a1f4f7418d946636b4280c03dc80933f6eedda75ece82b7034f32c6db  rust-std-1.68.2-armv5te-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabihf.tar.xz.asc
> -sha256  2b9b98eaf7d18049e4c8625a4cf3c2d610d905c9478a377c6cc3d48f8b31db32  rust-std-1.68.2-armv7-unknown-linux-gnueabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabi.tar.xz.asc
> -sha256  39009be69f01e30714c657a5f55475ce9f9c6a591cae85b5d7386944a8e87a80  rust-std-1.68.2-armv7-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabihf.tar.xz.asc
> -sha256  05bef3f9e66537d9f1271dd6b6bf2261ba1db52672223712a8eb9178d036ae53  rust-std-1.68.2-armv7-unknown-linux-musleabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabi.tar.xz.asc
> -sha256  b9992ee3b16c7b3b2fcf15339ade26084936d6088f578f8b2fab9b0c5c5b085c  rust-std-1.68.2-armv7-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-gnu.tar.xz.asc
> -sha256  07fc71adf63691ae5e103c57c295e665b6dfc096fe4bedfeb5e1d33c133bb9f4  rust-std-1.68.2-i586-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-musl.tar.xz.asc
> -sha256  884c3b6cbe8d38bb15943917df8bc87470566014ec50200ed70094c12abbb6bd  rust-std-1.68.2-i586-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-gnu.tar.xz.asc
> -sha256  695d4469c131b9993c939db0ce73a3866ab8e69dd657ec3137f3d594857f7812  rust-std-1.68.2-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-musl.tar.xz.asc
> -sha256  216a647fb15ffce5271b82c2c016f01b3d69095ab4635d6a895f9b76b6c1c528  rust-std-1.68.2-i686-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-gnu.tar.xz.asc
> -sha256  4ab007f223cf723f8f7adf26a6014f4f5aa444f88c19daccc5ac81ea30275c66  rust-std-1.68.2-mips-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-musl.tar.xz.asc
> -sha256  0c77f06f410091371b7f6f4952d759fcc0365025213f925afe80e04ab4b53540  rust-std-1.68.2-mips-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-gnuabi64.tar.xz.asc
> -sha256  b1b44819454c920980e66473112003212920136e4904113258566d130686de09  rust-std-1.68.2-mips64-unknown-linux-gnuabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-muslabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-muslabi64.tar.xz.asc
> -sha256  af586b37cac123774addc78d8c4568f22d94cec622ca9de80631f33da2700a6e  rust-std-1.68.2-mips64-unknown-linux-muslabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-gnuabi64.tar.xz.asc
> -sha256  24028147dd7733637cbfe58b7f7acc8e8131ebbb39969a6c3c61ce56203b4af3  rust-std-1.68.2-mips64el-unknown-linux-gnuabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-muslabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-muslabi64.tar.xz.asc
> -sha256  a6ae7b9b1710100f52d96dab59c6e7c46a4b057b8ea3d25b8ea2f792aee2f006  rust-std-1.68.2-mips64el-unknown-linux-muslabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-gnu.tar.xz.asc
> -sha256  c299d65b3594c309d092f6a0fe15c205ab489ffa50910fb8126e944a2727cbe5  rust-std-1.68.2-mipsel-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-musl.tar.xz.asc
> -sha256  a6bbd8949dc8514161de4e367c5255e8b83a3cf78c8426ffacbb6e8077d0e5e0  rust-std-1.68.2-mipsel-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc-unknown-linux-gnu.tar.xz.asc
> -sha256  e75bdc8a6e3f00285a37606240862cdad69a986c3e3d47d6af1376613281233a  rust-std-1.68.2-powerpc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.asc
> -sha256  354322352cd8b661b84f5e97729d5d7adb7df9cb9bfd43cac378271c40214d7f  rust-std-1.68.2-powerpc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.asc
> -sha256  e69c8c1b7b0df839b271a2c12985b1c56565a34f9b357631ed99fa9263f3d326  rust-std-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.asc
> -sha256  8388ac7a5f924d5d6aa441ae97c33c1abf11fd9516f2b9853f7edc0c5d6c453b  rust-std-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-s390x-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-s390x-unknown-linux-gnu.tar.xz.asc
> -sha256  7f909658496692a05dd241c15f79a02f80658d353013dace127fdc69dc5026b4  rust-std-1.68.2-s390x-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-sparc64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-sparc64-unknown-linux-gnu.tar.xz.asc
> -sha256  787f5cbbcec4e75b9beba3804ea05e36b7cb9b164c291cf7ce8f775d05634d61  rust-std-1.68.2-sparc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-gnu.tar.xz.asc
> -sha256  c8a3eaf26b83f1926d86b4db99ca16cbbff8e746e4c63f25f4d75a02a34a3b16  rust-std-1.68.2-x86_64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-musl.tar.xz.asc
> -sha256  6c2a91e60f4be6538fdb0e4ff0344038f282c23808ca018f526ec586f4ba43ab  rust-std-1.68.2-x86_64-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz.asc
> +sha256  a36e20a55e39c857f9ec69b146ae04572d5e666e76ff2dd6422cc8f575aed1c7  rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-i686-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-i686-unknown-linux-gnu.tar.xz.asc
> +sha256  e3fb7f9d825e1bd1720765a358361ba4517584f6d0c1a1d80b2230e2f97c9b88  rust-1.70.0-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-mips-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-mips-unknown-linux-gnu.tar.xz.asc
> +sha256  c77505fd6ef54e9ff2819e876a67acb8fe5aa1628e9ebe7c1931ce7d0b41b247  rust-1.70.0-mips-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-mipsel-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-mipsel-unknown-linux-gnu.tar.xz.asc
> +sha256  7771203dfd675fc7425508a106973725d976fb7334b35facb96f164934044bd0  rust-1.70.0-mipsel-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-powerpc-unknown-linux-gnu.tar.xz.asc
> +sha256  a98a6606a23622d608159f71cc870748c0b406e89d5ff5bf58fb5365ef0e4d40  rust-1.70.0-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.asc
> +sha256  2ca5701b4ea5555afd6cc4d1063097e52828583f2c205c7b23717074d91a4096  rust-1.70.0-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
> +sha256  41093804c33ea79f8643566ad6cfff5c4f0755418d73abcdf774c870dd8a2e0e  rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
> +sha256  2da9c69e6ce28da52a2b5ec78db090f41a393bf4b290012058be4f09559662a3  rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-s390x-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-s390x-unknown-linux-gnu.tar.xz.asc
> +sha256  34bfb5bb95b3f107e82b260a108df796bcf57a5eecda0efac5fd997ed4d3ae88  rust-1.70.0-s390x-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz.asc
> +sha256  991b59d1d0cd0dfcb2463bd79d2df1a235380f725557cdee831ee3c1d87a3122  rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-gnu.tar.xz.asc
> +sha256  966e85187b6b76dc520b23aadc886c5fe54b209a21c68f959ff00ef8542b7f9f  rust-std-1.70.0-aarch64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-musl.tar.xz.asc
> +sha256  277c2313f0ee420851c4009f15ba4d474000e0495deef38b0b636d6837e4f15f  rust-std-1.70.0-aarch64-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabi.tar.xz.asc
> +sha256  a6bf20e4eb5b88cd193ea2a126efe1a33651dc0be47080488be2cfff41c29272  rust-std-1.70.0-arm-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabihf.tar.xz.asc
> +sha256  6ad1231aeb34fef9c9db267859b0db3c6846bbade8227e6c9f456b6264c1278c  rust-std-1.70.0-arm-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabihf.tar.xz.asc
> +sha256  0b021ad310e638e90ae64b60c5a898f2f30ec77fcc1622e3775abb5476200de4  rust-std-1.70.0-arm-unknown-linux-musleabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabi.tar.xz.asc
> +sha256  f72c1983fcd90c338c62747b15964103518ec377530df2e71e35f7ea16eeede8  rust-std-1.70.0-arm-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
> +sha256  93929160b961ea6feb0dd0c64aa0571e1e2dc3024a4e2d7ae9ab5f75b1950fd9  rust-std-1.70.0-armv5te-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-musleabi.tar.xz.asc
> +sha256  4c4614c95bbd62665258248cc59d03d0d36e2034971892bd8f01659cdb953740  rust-std-1.70.0-armv5te-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
> +sha256  9baaca8ed2a71040480654a1ff3c9917e017ddfe78030b054ad82aed9b94c11e  rust-std-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabi.tar.xz.asc
> +sha256  3edd71ce8102783c99b9b6661577ac1acf6a633156234ee220a20aa3d7190ebb  rust-std-1.70.0-armv7-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabihf.tar.xz.asc
> +sha256  aaceb71de5268510cbfb59c356ef2f7fb539f89b57116a2d3a513d06c411bb35  rust-std-1.70.0-armv7-unknown-linux-musleabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabi.tar.xz.asc
> +sha256  f9d5ce6b4bff635151579726ebf264b905679f42917283fa1268d86f7c82a55f  rust-std-1.70.0-armv7-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-gnu.tar.xz.asc
> +sha256  f52e3ac35157e90f86e5ca6c177a43774425c24a51b15655ed61f6209c7db6f0  rust-std-1.70.0-i586-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-musl.tar.xz.asc
> +sha256  1a42665bb54eeff908f833dca12e917d6ce87140139ec56702b9d88cda61be79  rust-std-1.70.0-i586-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-gnu.tar.xz.asc
> +sha256  0e5543c35196ca5b08f1b7e49fa3f3b671444d75648504cdbcfd854e2e7efd2d  rust-std-1.70.0-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-musl.tar.xz.asc
> +sha256  19ef3b0f6e52f81cd17f0d98a692c48fe02e85570d1e36b6369a7294ae875e2a  rust-std-1.70.0-i686-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-gnu.tar.xz.asc
> +sha256  0cd85a53e328b1c445a8ec13af87f74280c1d344744076b102227f626456caec  rust-std-1.70.0-mips-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-musl.tar.xz.asc
> +sha256  5e1abc99236050e0371ffdce8f4924e7fe46957daa7509cabc21355f62ee05e7  rust-std-1.70.0-mips-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
> +sha256  9624b99d806b64e11916b78afac1fac7561578c23b1321486f73f22f5e7d8710  rust-std-1.70.0-mips64-unknown-linux-gnuabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-muslabi64.tar.xz.asc
> +sha256  de3adfd43245dadff1fdb172250189f85dbcbc848badf29d5512d5bd10ff8e53  rust-std-1.70.0-mips64-unknown-linux-muslabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
> +sha256  55153a84e1a00d8426b08bb745de7eae8bd34dc65ece529a46c2b76448404338  rust-std-1.70.0-mips64el-unknown-linux-gnuabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
> +sha256  39edcc0d4cc184ec320c710b41cc7401ab6f2408da3d8a6bc9c1a836429d429f  rust-std-1.70.0-mips64el-unknown-linux-muslabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-gnu.tar.xz.asc
> +sha256  58bf8a6407d92cd4786991f1cbdec7380001e07c057c3a8946c2e54593bb7f8c  rust-std-1.70.0-mipsel-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-musl.tar.xz.asc
> +sha256  4dd7f934ab4d21f933e5287b7ea194d34e36b6d5a17a5a7ef3bf0b705c59f8ca  rust-std-1.70.0-mipsel-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc-unknown-linux-gnu.tar.xz.asc
> +sha256  101f358b08381b9c37c2f061bac1ff3e60c6036be20059c451f322a55f72376b  rust-std-1.70.0-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.asc
> +sha256  468672f84e5b140269e188b836ec82494d65c18bda8b7cf1f9bf6fce19f222ab  rust-std-1.70.0-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
> +sha256  bbd882f9ec7f01a732ecc60cf50b7d8a10cd52c3de41c205f62938b6dc2b4dbc  rust-std-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
> +sha256  cdecf32e245898306a27a0b164451b2ee9a2122176ce3a65f2ec73c200986dc3  rust-std-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-s390x-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-s390x-unknown-linux-gnu.tar.xz.asc
> +sha256  7084afbe9fb1a0e8a0c3e760f45475ebba400b72030ae8359bdccef67cb48992  rust-std-1.70.0-s390x-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-sparc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-sparc64-unknown-linux-gnu.tar.xz.asc
> +sha256  b06933f6f94cd30e1c2415b37db97a94533a727aa5d32a34ee80c6742ee418d2  rust-std-1.70.0-sparc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-gnu.tar.xz.asc
> +sha256  0c0129717da1e27ccf2c56da950d2fe56973f71beec9e80ae6904b282d2f0ee9  rust-std-1.70.0-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-musl.tar.xz.asc
> +sha256  7ebaba08385d1ec87d0a27ca8b4e1eb454374da18ffa12621bd1578973754101  rust-std-1.70.0-x86_64-unknown-linux-musl.tar.xz
>   # Locally generated
>   sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index c5fdd9a862..78e3631761 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating this version, check whether support/download/cargo-post-process
>   # still generates the same archives.
> -RUST_BIN_VERSION = 1.68.2
> +RUST_BIN_VERSION = 1.70.0
>   RUST_BIN_SITE = https://static.rust-lang.org/dist
>   RUST_BIN_LICENSE = Apache-2.0 or MIT
>   RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> index 40ab7dedc6..1ceed7683c 100644
> --- a/package/rust/rust.hash
> +++ b/package/rust/rust.hash
> @@ -1,6 +1,6 @@
> -# From https://static.rust-lang.org/dist/rustc-1.68.2-src.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rustc-1.68.2-src.tar.xz.asc
> -sha256  ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0  rustc-1.68.2-src.tar.xz
> +# From https://static.rust-lang.org/dist/rustc-1.70.0-src.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rustc-1.70.0-src.tar.xz.asc
> +sha256  bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843bfbaf5c34639  rustc-1.70.0-src.tar.xz
>   # Locally generated
>   sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 27eb11f095..d4566b3142 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating this version, check whether support/download/cargo-post-process
>   # still generates the same archives.
> -RUST_VERSION = 1.68.2
> +RUST_VERSION = 1.70.0
>   RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>   RUST_SITE = https://static.rust-lang.org/dist
>   RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
