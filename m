Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5690C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 15:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F3C340834;
	Mon,  8 Apr 2024 15:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZVSUdOznisT; Mon,  8 Apr 2024 15:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2CA740837
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2CA740837;
	Mon,  8 Apr 2024 15:26:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5F41BF375
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 15:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CF3960A51
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 15:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKv5l5VEXUUr for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 15:26:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C880360772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C880360772
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C880360772
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 15:26:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d886f17740so14583401fa.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 08:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712589991; x=1713194791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GKvQPldCjhrGYmxZ5kihxcKlzS0TTdzPjWxboSpwELY=;
 b=fn0W9FWDjZ9c7+T3uu8xpnJqt4znwJdy10SW+YUPa5V42ei1n7ThMyxsGeqduDdnBX
 o+4cgKVwCsQPNum4dM9binHFfXT69Tciw8IfM2UfSgil6OIcUStXCAW2k3yNKNM0flCF
 iSkiMH2TKLXLhr3E+KRzdP+TfmmB0jPD+9nn60E0EE69Er4+YYTXTrWw6WiW014Oigwr
 BBa5cuhSeIkpNYDefLgJjo/Zz+1jTHRlKH00MqiVly1bqjwbNZETNnY+arVsTWJrV+Z6
 MxEh8IkaqH0AcrGkK/282+8hVDsit0yefwK+F7tvPIg54qaND7LFLdajdgx6dZcqVsHa
 SGFw==
X-Gm-Message-State: AOJu0YzVHnG2y3vaSxhR2SUlY5bwUPcipXEql2HCuYNbXtevj3GoTdJp
 4rvZE7NNBFOix/05iisZq6kpF9jNLWrVv8+MyKzelfuo9mSuOstSk3aqszyMo/rRTy8bNw4NzMi
 hWlN6pMSaOwKpTqHFY7b5q33S87Q=
X-Google-Smtp-Source: AGHT+IGGjTHaVLLFevPkgKoubl4F/sr6/Jhmikay2QY6C/xTIJQloiCZEdUhozfjRnU6j1v3rFsXUsEvHTJlcGm4Doc=
X-Received: by 2002:a2e:90d7:0:b0:2d8:81d9:63ae with SMTP id
 o23-20020a2e90d7000000b002d881d963aemr1738458ljg.19.1712589990957; Mon, 08
 Apr 2024 08:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240402153328.1859642-1-bb@ti.com>
In-Reply-To: <20240402153328.1859642-1-bb@ti.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 8 Apr 2024 17:26:18 +0200
Message-ID: <CAEyMn7ZzUAMi5DXOXQ3QpAcKvp=0SbYt1aB7Ofs9=sa1J-S02A@mail.gmail.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712589991; x=1713194791; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GKvQPldCjhrGYmxZ5kihxcKlzS0TTdzPjWxboSpwELY=;
 b=G6tWiKW27phfJIcsrYphR1sm7KMmg8SiwQ3Shvt+TDZLrUZsUOYmcgxYFKl59aGVW6
 NZsR5wLhadUFrQnl/63LBhXNPKsXXi1pfxFUOVQObMQgcjWHKHHkK+DQtUNXmXxqLx0B
 2SznFkLHgA1JGeVuNdrzIMrPeNuzutKqv0RVLhzFoM2zGv+XkWIMHAImhvCzqggJQigb
 3hJk8AU30UIuo5V2QkqWl34xJ23G/PyK2zunzJ+2a5fjoancWGh7R/EbBF56wsMaM+Nb
 gOetkt7S4P4TJ7eVWdhHp+6tlYz48gLlijiBqCaoz2tdi62Wyy/ug44se46W8DeX6vX9
 YcTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G6tWiKW2
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to latest
 version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,


Am Di., 2. Apr. 2024 um 19:59 Uhr schrieb Bryan Brattlof via buildroot
<buildroot@buildroot.org>:
>
> The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> processors. Update to pull in these latest updates.

This update is needed for supporting j722s SoCs.

>
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> index 95131180ef400..2398d02da258a 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
> -sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
> +sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> index 1f8ade207c13a..9332732ad4a32 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> @@ -4,9 +4,7 @@
>  #
>  ################################################################################
>
> -# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
> -# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
> -TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
> +TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
>  TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
>  TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
>  TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
>
> base-commit: d69e13b0e965961019b4aab38e187267af3cab78
> --
> 2.43.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
