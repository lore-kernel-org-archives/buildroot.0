Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F12CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 11:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EA26074E;
	Thu,  4 Apr 2024 11:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcE3ZQWZLdI5; Thu,  4 Apr 2024 11:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0C760B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0C760B36;
	Thu,  4 Apr 2024 11:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E31C51BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 11:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD63182ED2
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 11:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liKXSo9ohg2U for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 11:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A180282EC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A180282EC7
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A180282EC7
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 11:47:14 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so10289571fa.2
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 04:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712231232; x=1712836032;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f3oUtWFX8mI2OJr1/TrFQnFs2X61iDj4hNyOBF5wmy4=;
 b=bo/1kMS/8NtojtrXM/9q6u5CEMkGVvxe5FRiP4Kogy/cguBGBtvDC4R4Edr6/NuQNH
 B/mZUpcQmgkdUv0UPX4Z9hqv9a2kVcwSMizTeRm9uOdkLFYy6F3zHXQq/9s18StyW1i/
 fDSSiKbn9Wp7+fGmcdzZuZgalC+TzJba6ft698psfWXE5uG0BJmf2ZnlYBR+JyY9cgLM
 lEMTKOQnK1MzgeMJHEtD8KXTrsMqjgL6CnGDmKf2tqH7gY6SsBJmS/YD/MTNqOUtJFL+
 YxoTSfXO9l9ydrsXcsuqvyEHyw1tHrrCH2rthUafExYL/5ovWvkWJ71QxZrfJawUJCoP
 D8/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Cq0bZKu5da17tEAD+mbPagN/xDboA9JNfl4LKfxIZCYrua74dxeVPyoUN16XiSW5Q3urfZlSP8s0yM5QPZjYKr/646mLOQ==
X-Gm-Message-State: AOJu0Yzw/jtIOSpObBBKODS0OL09yL53jZu29WeuNueUTo5hLl5OxqkE
 XvgBQzU+mmtROSa5Xu7pjtvJWuU8sNmWbos0ETHvvOUi7x178ACp4o52g+9pc/YhGVfEH2D0W4J
 ZZoFWVM06DZzXO6B/EO6mJdIliXs=
X-Google-Smtp-Source: AGHT+IFmiqtbEpZOK1H8vrEFBmLnIUi1KD9AajPZuAGVSEnJekFEeLi9SplAH/RFT0iWlBnmJNRwQ6C3NHPMMFV4xx4=
X-Received: by 2002:a2e:b04c:0:b0:2d8:2762:54de with SMTP id
 d12-20020a2eb04c000000b002d8276254demr1549296ljl.14.1712231232071; Thu, 04
 Apr 2024 04:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240403195403.1359007-1-romain.naour@smile.fr>
 <CAEyMn7YZB0q1p56F4ECOemAEbJReDUDLUuKBQyp6H016gCL7Fg@mail.gmail.com>
 <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
 <D0BAEFA95U59.21GTZHTZRDS1A@walle.cc>
In-Reply-To: <D0BAEFA95U59.21GTZHTZRDS1A@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Apr 2024 13:46:59 +0200
Message-ID: <CAEyMn7Yoowh--mcB6Qn8rsGh+5AZphqmc-QNcp8oFJnb6g+HNg@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712231232; x=1712836032; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f3oUtWFX8mI2OJr1/TrFQnFs2X61iDj4hNyOBF5wmy4=;
 b=NXl/kMkGhJD6gR752EcGd06M0B/vUrNFbn0PO5vc7lIMX1lWvEpEpAO4dJgznrTmU1
 kxGWm97FpWXD8clg4K5aHinM+BygarV5GA5ufnBJ9T9FWrzAmA1yu5zV7GlQnOJfx9Z2
 2uwCSVBEv67BcMO8cyK66S36rccKMoyzZeO51+MFTs1ad+tdTEgzV9nhinDKaryeV+eO
 MPDPrA5fxPfHCE8xGPrKft5dOPA9L2KHP8O63kFwQkCRnK+qPRLAHwAG+28+JSjwTkOm
 BMFztpH/bk442PUq+x+bcv8YhsL+I1ZzCdCAm0D7SI02XLULtGNiDPwUFm2pH2QBwd8u
 5yIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NXl/kMkG
Subject: Re: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS
 devices
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Do., 4. Apr. 2024 um 13:04 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Hi Romain,
>
> thanks for working on the series!
>
> > > I know there are some discussions ongoing about the handling of the
> > > BR2_PACKAGE_TI_K3_SECTYPE_X and BR2_PACKAGE_TI_K3_SOC_X. I see that
> > > these variables are only used for selecting the right value for
> > > BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.  Since we can set this value
> > > directly for each defconfig I think we can get rid of all this stuff.
> > > Nevertheless there is a problem with the
> > > BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN since it is not possible to
> > > select a value in menuconfig because of the missing help text.
> >
> > It seems easier to select the SoC variant and the Sectype using two boolean than
> > letting the user to provide the right file name in
> > BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN from the defconfig.
>
> Doesn't seem easier to me to update the package each time a new SoC
> is introduced. Besides..
>
> > Is a use case where the we must use a custom tiboot3*.bin name ?
>
> ..you are literally encoding the board name "-evm" of the TI EVM
> into that name. So it is unusable for any other board. E.g.  there
> is already this board upstream:
> https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phycore-som-binman.dtsi#L14
>
> As I said, that filename is just a free form type of filename and
> the dtsi author is free to choose its naming.
>
> IMHO with the removal of the image gen package, there is no need
> for the SOC and SECTYPE choice anymore, as it is just used to
> assemble the board specific filename which will end up being the
> tiboot3.bin. But u-boot is already choosing the default tiboot3.bin
> for you:
> https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phycore-som-binman.dtsi#L60
>
> Sorry for being so persistent, I really don't think this is the
> correct approach. Just defaulting the binary name to tiboot3.bin
> will probably handle most cases and for the oddballs, just set the
> filename in the defconfig.

Michael is right at this point. This option only can select the TI evm
specific tiboot3 files defined in the U-Boot binman dtsi files. I just
checked and in U-Boot are 3 other boards that use different names
than the one used by TI. And at least one other will come in the near future.

>
> -michael


--
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
