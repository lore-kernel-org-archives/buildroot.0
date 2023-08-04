Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA27C001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 07:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 609EF4026F;
	Fri,  4 Aug 2023 07:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 609EF4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khwCR1zdpGSN; Fri,  4 Aug 2023 07:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB10240BF7;
	Fri,  4 Aug 2023 07:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB10240BF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1088F1BF2BB
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 07:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1E50408A1
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 07:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E50408A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J011mm3XLpGx for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 07:04:36 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757864088F
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 07:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 757864088F
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9b5ee9c5aso27700421fa.1
 for <buildroot@buildroot.org>; Fri, 04 Aug 2023 00:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691132674; x=1691737474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c4dzrcelnHF9d/H3ix4753JBrKgfFPrXhujaQYZqGl8=;
 b=QSWQUQTAqmZN43Mr2LYTVK+Qs+LbDTFMalLENt5t/Aq9Tm8WqmoZX/QdE0J30TYoH7
 vHjXGxnFyRv9iluabmqhWEmN2J1k1LNHj7qenLQXB/Z/XhWYW0H/Y25olFxW0r+4RGTH
 TgQ6UwmRRntq8mdZ1/Hx990zWzIlXluXIRpHwM22wKH2kMDLJBtAk/tO11Lb04nx/hrz
 QFO0w3HYiFrf3R5Rt2pjI7P/m65D4wacVB9v7ZNF4U5MlUnXYKjFe6gIlUbHZMcHnc7R
 4CY4s76aFomPh5Xjhrix/DLXNlDrgldDYoWe036N07SFHmTZ76zyHmf2TRG+qiZJ1b3D
 gcMQ==
X-Gm-Message-State: AOJu0YylotLmFws3BObIRD9i6ZknObjHq1nC0OWS6doAfCuwK9vixJN2
 oHkUIpwZiKxdYiz1xO97fXdPVbo+UJhmBog5yjzoRHbig0s=
X-Google-Smtp-Source: AGHT+IE3Jl5chNJ/Hijjl0CjMHOl51vlj5zBFXCcYJBsts6ZbwRfCurbMBTRWG6uDLbHeID+lJyD4x85frlCJdnFuig=
X-Received: by 2002:a05:651c:106:b0:2b6:d9dd:f65f with SMTP id
 a6-20020a05651c010600b002b6d9ddf65fmr739538ljb.17.1691132673390; Fri, 04 Aug
 2023 00:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230803121003.160501-1-heiko.thiery@gmail.com>
 <20230803194140.GP421096@scaer>
In-Reply-To: <20230803194140.GP421096@scaer>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 4 Aug 2023 09:04:22 +0200
Message-ID: <CAEyMn7ba6E_iRuAPUoZ5dWfNAi3eY7wxHMZ8p=fT=OTjtZjKPA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691132674; x=1691737474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c4dzrcelnHF9d/H3ix4753JBrKgfFPrXhujaQYZqGl8=;
 b=Oj0/4442SORsRIGT0eYkksASmKinCkXrg3fW9+xfOALghDpSBBIVS+KtPcyf0S73b7
 UMUB2wlNK11Yu/QLiU6xWzQH8Eo1ckcXb9puC71ApldRHXtPV5Ubm2P6NU/gAqzZs/ZQ
 ZqCMJLv15d0yzUNkzM91V/mpQG90EvzfP7w2TOSEuMC/VYw/shImffyAsHR5iDFkqjP/
 VJdvebaRKNUo1SKGuaBOHC4u5nEGVNJiZZIi3U9a1FXqOAd3aYCcYAFlJwfkjFnbi+VK
 oNHj2ofnJq2QrWvficRqUnNGJ/Dq9kGEY4bQL/+NG0tVrf1x1BMFPJM6vbU9dIQttMnL
 t4YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Oj0/4442
Subject: Re: [Buildroot] [RFC v2] boot/uboot: add option to install custom
 environment file
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Am Do., 3. Aug. 2023 um 21:41 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, All,
>
> On 2023-08-03 14:10 +0200, Heiko Thiery spake thusly:
> > U-Boot has the capability to set the environment variables via a text file.
> > The text file has to be located in the U-Boot board source directory and
> > selected via the CONFIG_ENV_SOURCE_FILE option. The CONFIG_ENV_SOURCE_FILE
> > must only contain the filename without the '.env' suffix.
> >
> > Thus the buildroot option BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT is added
> > that needs the information about the source of the file in the buildroot
> > environment (BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE).
> >
> > Since the environment file must be located in the U-Boot board source
> > directory. This directory is <SRC>/board/<VENDOR>/<BOARDNAME>.
> >
> > Thes information about vendor name and board name are available in the
> > U-Boot .config file and can be extracted from there to determine the
> > destination directoy.
> >
> > Cc: Michael Walle <michael@walle.cc>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index 8b726eaa57..894a0bd3b2 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -607,6 +607,22 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
> >
> >  endif
> >
> > +config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
> > +     bool "custom environment"
> > +     help
> > +       Provide a custom u-boot environment file. This will be
> > +       copied to the U-Boot source path and enabled via the
> > +       U-Boot config option CONFIG_ENV_SOURCE_FILE. The target
> > +       path will be determined based on the U-Boot configuration.
> > +
> > +if BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
> > +config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE
> > +     string "Custom environment source file"
> > +     help
> > +       Path to U-Boot custom environment file.
> > +
> > +endif
>
> We don't really need a boolean option to guard a single string option. I
> know we tend to do that a lot, but I find that to be an anti-pattern.
>
> In this case, the empty string is as good as saying "no" to the boolean
> option, so we can just live with the sting option, and then (see below)...
>
> (of course, if the empty string _has_ a special meaning, then we'd need
> a boolean, but that's usually not the case in such situations).

Ok, makes sense. Previously I had 2 config options for source and
destination and removed the destination in v2.

> >  config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> >       string "Custom make options"
> >       help
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index b3d26b16fe..35e26ade2d 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -181,6 +181,26 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
> >  endif
> >  endif
> >
> > +#
> > +# Prepare for custom environment
> > +#
> > +ifeq ($(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT),y)
> > +ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE)),)
> > +$(error No custom environment source file specified, check your BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE setting)
> > +endif
>
> ... we don't need to check the sanity of the settings: empty means don't
> use a custom env file, set means use that file as custom env file.

Ok

>
> > +define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
> > +     cp -f $(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE) $(@D)/board/$(shell grep CONFIG_SYS_VENDOR $(@D)/.config | sed 's/.*=//' | sed 's/"//g')/$(shell grep CONFIG_SYS_BOARD $(@D)/.config | sed 's/.*=//' | sed 's/"//g')/
>
> Please split this line into easier-to-parse construct, see below...
>
> > +endef
> > +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
>
> Is it a pre-build or a post-configure hook? I would think it should be a
> post-configure one...

I wanted to do it like the other steps, copy the files to the source
folder before building.

- UBOOT_COPY_ATF_FIRMWARE
- UBOOT_COPY_IMX_FW_FILES

>
> > +
> > +
> > +UBOOT_ENV_FILE_NAME=$(subst .env,,$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE))))
>
> $(patsubst %.env,%,$(notdir $(UBOOT_CUSTOM_ENVIRONMENT_SOURCE)))
>
> > +define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
> > +     $(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
> > +endef
> > +endif
>
> So, the .mk code would look like;
>
>     UBOOT_CUSTOM_ENVIRONMENT_SOURCE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE)))
>     UBOOT_ENV_FILE_NAME=$(patsubst %.env,%,$(notdir $(UBOOT_CUSTOM_ENVIRONMENT_SOURCE)))
>     ifneq ($(UBOOT_CUSTOM_ENVIRONMENT_SOURCE),)
>     define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
>         sys_config=$( ./utils/config --file $(@D)/.config -s CONFIG_SYS_VENDOR ); \

Creating a subshell to get the output of uitls/config does not work
that way. I have to do $(shell ...). But with that it works ;-)

>         sys_board=$( ./utils/config --file $(@D)/.config -s CONFIG_SYS_BOARD ); \
>         cp -f $(UBOOT_CUSTOM_ENVIRONMENT_SOURCE) $(@D)/board/$${sys_config}/$${sys_board}
>     endef
>     UBOOT_POST_CONFIGURE_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
>
>     define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
>         $(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
>     endef
>     endif  # UBOOT_CUSTOM_ENVIRONMENT_SOURCE != ""
>
> Regards,
> Yann E. MORIN.

Many thanks for your comments! I will retest and prepare a v3.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
