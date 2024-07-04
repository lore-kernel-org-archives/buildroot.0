Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310E5C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 10:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0CF0401FB;
	Thu,  4 Jul 2024 10:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkQD6pLOFgpy; Thu,  4 Jul 2024 10:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768F740965
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 768F740965;
	Thu,  4 Jul 2024 10:18:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50E4C1BF32E
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E3CE6085B
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARxOU57z9nvh for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 10:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0956F60008
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0956F60008
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0956F60008
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 10:18:29 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee7a1ad286so4782971fa.2
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 03:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720088308; x=1720693108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZWTXTm6JB158D5RmkFTcOIonSBgXuHyzOrp2fmAsS74=;
 b=O3kx0q3xTTjvDE1pDXuHv01bMcluHHbHoOr/CmAQ9LMf3yYDT3k/tp6Xk6btcN9j6Z
 0Y3wiEuksEnV/a6F9clBRdCmA7IngHy9fSFOX+Y5RsErRHHhJNLMf6SwSM4NVfZW2KfJ
 Qs1xDknFLSS7EHU2oRoK5pmXuWp9Etg0Fe5TaSNsb1p/rJ8p8NbVSSwk6U99QuE3SYOl
 Iw1FBGb8YMe3lqJDvHLD0xW9OKhIFP25qsWFViLeINbtWaSi99wu4XXQnIFkAV0cE81g
 SYRtZ6ZH7x/yELDsJhyxdgt5TyNQ0UU4EWc1YalpdfSwS/JdR/Ahi1x6akCNohQQZuWP
 GVng==
X-Gm-Message-State: AOJu0YzTc/kL/Vc8LTfpvNjNUai34mz5ubYHYQBjHFYYx2S9kzFj/N16
 nmfCJjk6xWbyTCbxFSdLPbq9LJFwwOcFhQLbmA/Z5YozBpBoheAIpmRpylsCKMlmuSaD/kEANaB
 E6X3te55InUrcRz8G4m7iVjPboMA=
X-Google-Smtp-Source: AGHT+IE6crZJEWcaSVvvPMJiQoRAkwGPUdRL2dogRQtNEz/9zta39iVC1hV8zI6kePGEw5IK11S9opk3nSeBKL7dYm0=
X-Received: by 2002:a2e:9851:0:b0:2ee:64cf:f8f3 with SMTP id
 38308e7fff4ca-2ee8edff039mr8865871fa.33.1720088307451; Thu, 04 Jul 2024
 03:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240626145942.3154406-1-fiona.klute@gmx.de>
In-Reply-To: <20240626145942.3154406-1-fiona.klute@gmx.de>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Jul 2024 12:18:15 +0200
Message-ID: <CAEyMn7YBjQ7gZu3gA9_mZFE=GK77b7bQMifChoRx_i8sh78uMg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720088308; x=1720693108; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWTXTm6JB158D5RmkFTcOIonSBgXuHyzOrp2fmAsS74=;
 b=UcS9wb8eZcIvf82mcz9Z6atsBRjauREimB0Gx/iTmVoT/NdoSj+0kBW6MYDHsFW2fG
 i8S7Z489IzYcnPBF1KgQQM+rvKfji5sPin4mHmYj1UQyzvBIVYkuLPSqNkEZZr9QySo6
 cIHfDDtG+VHB5QDALTl/DiuUdKo5E301RpQ3E56MsJ3kM1DNZFYPYHyYSbjDXx6QZ3JZ
 1K7VBWVxhWz4I6O/gOczSguP+Q9zHF0BXI9Kd32EblL2cI7WQFHR7dMt3J3sNYDROyTU
 YTj50qfpPXjuVkVPM9+tuLo5Eo0Cj0SxFaYb/ljIDPeWWZ1Esgdxc0mkYXykWCoYfrLc
 NXcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UcS9wb8e
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fona,

Am Mi., 26. Juni 2024 um 16:59 Uhr schrieb Fiona Klute <fiona.klute@gmx.de>:
>
> This fixes link time errors, undefined references to various ENGINE_*
> functions (paths shortened to the output directory):
>
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined reference to `ENGINE_load_builtin_engines'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference to `ENGINE_by_id'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference to `ENGINE_ctrl_cmd_string'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference to `ENGINE_init'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference to `ENGINE_ctrl_cmd_string'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined reference to `ENGINE_free'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined reference to `ENGINE_finish'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_cert':
> signature.c:(.text.load_cert+0x114): undefined reference to `ENGINE_ctrl_cmd'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_key':
> signature.c:(.text.load_key+0x124): undefined reference to `ENGINE_load_private_key'
>
> Before linking there were matching implicit declaration warnings
> during compile.
>
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

Tested-by: Heiko Thiery <heiko.thiery@mail.com>

Fixes: http://autobuild.buildroot.net/results/682a4fb0781591650620acfc59dab3dc507db4f7

> ---
> I assume this is a consequence of
> 623d3bbe43e9193aa8e3395367d01af59071b859, previously RAUC built fine
> without the option enabled.
>
>  package/rauc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> index 7451b29a55..69a65d165b 100644
> --- a/package/rauc/Config.in
> +++ b/package/rauc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
>         depends on BR2_USE_WCHAR # glib2
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_LIBOPENSSL_ENGINES
>         select BR2_PACKAGE_SQUASHFS # run-time dependency
>         select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
>         select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
> --
> 2.45.2
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
