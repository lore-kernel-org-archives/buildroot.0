Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA9ACAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1479680D2B;
	Fri, 19 Sep 2025 12:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwoZaKNPdKf4; Fri, 19 Sep 2025 12:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558D98101C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 558D98101C;
	Fri, 19 Sep 2025 12:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3CECD7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5FCE80F7D
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYa8TWcdiCrr for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A57C880F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57C880F75
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A57C880F75
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45f31adf368so14709025e9.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286577; x=1758891377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWE4TM80+J3vBsvjSvm8z3KNJ6Sybkr3wHv74yETLos=;
 b=fZy+XaI3fhxOPz44hK4FypHRIUQUE/dcYwQJz/AfUxNQ6Jqytq3B/BZvzQt4RVFFBo
 47JFa5dXQfWj/esHdmJtTlpjU4JqkcvkdGNo3gZUSYyJ0x5BVdaklCclK4LijC03Balr
 DD7x4kzw9cf4SStuwW1xI7e36m3EnTgkgCQ0RkgokWZf6Xcy3SZaGIm6wszLAoYD1Ldp
 JSjMuaP0WsCLITpx/j2voiwwclo+Y4w1adbpm01KjsqoEB5SURyAlx7+xOzGyX6WiHoo
 MyUCBlFilMLNSFPW61CPTffvpsonTu+Vac8qJ6iXHoIT9xrcGx1jEVPucL5PQPOm2DJi
 Is4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqqN6I8Pg8lko2ZVh653upBKi9I3jySp4Tr4uo2cNNYj0hOalyoRXzxhectqzm8eJUhfV2I/+L850=@buildroot.org
X-Gm-Message-State: AOJu0YzmmpZ0q2KZxUsEf2jaDjRJSv9hTj3BrEZaN2XUMu1a8kTUAJZZ
 t9fVUdQlt5fS1kuB2WHX83XBPEs3/ETfT7vFrfvcQGL1spXI+i/zagIjl/7xRXZ8YG8=
X-Gm-Gg: ASbGnctKvz5j9y9HjOhWNRKTDlGQ0aQE0VYqLEFcLG3nk0l+THXI4ZqjVSTIrYxSbP8
 Ti9uVLepI5fLJ+8og8W/bu4uGYz13s9yX4qwVHKBT2UCZwuaUHZR0STHP+WA2gFTg7L/OP3gyne
 93eS9E4lHWR5De3RUsFI+MGFvU//lnr8qaBTAxGUmQfCl8xK31xuEc1X6i30FK4sQJUGiGqZaa4
 xFNh9EqIfpN1giZLnl0d922v2oABE3BIpeXvAwcUwsOKTgdKp1URmu7qVtPF3ee5yyfCNswJHiT
 UB3NcY6kvuvOwJ1S0UK4JiG6n9bPxRD2Y6LKOeNwTVvoqbHKMwvStcrqbm0fq4elQCfl80EeiEm
 W3HGCQdAKOqGNA+A=
X-Google-Smtp-Source: AGHT+IGliQzRRcno6D91Vpaaq2sukGgwHtXgw6rYQ4s3D52TOQ8ruV+7g6qEGqrxv1F2JvtGKGgSIg==
X-Received: by 2002:a05:600c:c162:b0:45d:e5ff:e38c with SMTP id
 5b1f17b1804b1-467ebbbfcdamr22143715e9.32.1758286576675; 
 Fri, 19 Sep 2025 05:56:16 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f6695a9dsm88026125e9.24.2025.09.19.05.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:16 -0700 (PDT)
To: Bryan Brattlof <bb@ti.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:15 +0200
Message-ID: <20250919125615.136262-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909-ti-k3-boot-firmware-src-v1-1-542b606ef0c7@ti.com>
References: <20250909-ti-k3-boot-firmware-src-v1-1-542b606ef0c7@ti.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286577; x=1758891377; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWE4TM80+J3vBsvjSvm8z3KNJ6Sybkr3wHv74yETLos=;
 b=T8G6Qj8d3GMBo7n1FAKYgJsVn/uWcJ6m7qcM97Fs71kW8cb0grykvJVI09a+tBhtX6
 qIIurcSZrVqrd9Xzm82b68xtys5K+Xv4mkm5h3EXStdcjtlEr6K3Z9as1WyeFA5/g2XF
 LTNq4EJalDSqq4rQpkzA8zoj56yumCsIzNHal/CVcQhk/DL4V48qiY7CqA8+5ltI11Qi
 HI8qd1/D8cy6ulafWDRmBSauOPFyvCYrdKs0iIDMNCtw9y1qrLnub64NqEHG2NsYr7C/
 LtxeR8W+mscMLXSYR+UFrB20x9CVzdt6PTsDH8oE4Vu9XkYi3ObH/vM10ieAXr34S9zY
 hLYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=T8G6Qj8d
Subject: Re: [Buildroot] [PATCH 1/2] boot/ti-k3-boot-firmware: switch to
 github mirror
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
> The git.ti.com cgit server continues to be plagued with reliability
> issues which are reportedly from heavy bot traffic. To combat this the
> system administrators have removed the archived downloads feature from
> this server.
> 
> Switch to TI's Github mirror so new downloads continue to be possible.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> index 571bbf121949dea8f9acb81f7448641eff915891..239694838179862283738c96029b27db4e4c4650 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
> -sha256  f9e09b84e206d605a9fb5691a325dcd4a7d6a3e6bf70a69cbc169d1a5c617804  ti-linux-firmware-11.00.11.tar.xz
> +sha256  e98ae3350964100b6137d32d4874c16229a97b1cc7f8f4f23f8da59a386520c8  ti-k3-boot-firmware-11.00.11.tar.gz
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> index 117c0a9a5ade0c6ab133b7c1b0b7a3e4a966360e..25956be68bd0dfad34f3a26c367dc42504b3ff9e 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
> -TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
> -TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
> +TI_K3_BOOT_FIRMWARE_SITE = $(call github,TexasInstruments,ti-linux-firmware,$(TI_K3_BOOT_FIRMWARE_VERSION))
>  TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
>  TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary
>  TI_K3_BOOT_FIRMWARE_LICENSE_FILES = LICENSE.ti
> 
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
