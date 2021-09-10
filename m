Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278B5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEFD36109F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEFD36109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D66460B60;
	Fri, 10 Sep 2021 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qj-OMcdBGBwr; Fri, 10 Sep 2021 14:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C4260725;
	Fri, 10 Sep 2021 14:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDD6C1BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC263606A7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yl15vWysLF5j for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:32:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B4460725
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:32:23 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id p15so3527524ljn.3
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JrkcAud8JCnvlYwdWpdWku7Dd7tRPzlAHE+LwXFKZXQ=;
 b=DGaKMeEuVjuKRF6k9nnB4jpdVRaX3Nco+OcfOa2nxKNgRr2cdlpMscC9zxgKRrhhrI
 EP8dgR+4QOtCFQGBc0TAYg+UziPuoZVnTCQqIMxzoo1Rh+OM3dvwmOiY5QPjXJyZ/hdp
 TPIl91PFyqL7OJydhQedNLKPf44awV31bs3xNr1YD1tGzzdKvy6AvZRZEeApa89Nd9xS
 haH9A/d7K20IOuRWbwid6XDsf7Y4Fjo07Coa6eCtlyukbntVi1FMCbqrpWFTCJCCReXt
 uzfTk+sGVD4HnxzLIb3tgFEocNbx2NvanGypLxohZHQvn2oQj5V2nO1LwRlVdNupIjO+
 0ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JrkcAud8JCnvlYwdWpdWku7Dd7tRPzlAHE+LwXFKZXQ=;
 b=akgySzABw9L9JecA8Jp33gY1FBDM+LdXxwx931H5WEAd49i7/nAtR0Gnr7ILJ90OM1
 i8+c6rds83oN2TGdKovLuwJEDEE23l7a9Yp5y7OR2cpmSx4xw9Iisj7otIO/XMiNgfeU
 7ndHeAhMUiLN/BqOyldtB2cpDBU4NIz+2IGmqafGoijJUHBpA82X5l6yIhLHkG2JH7AK
 bYEibM8rZYQ+rRM0qPBBK2TQuOAOxtmhmWss/v5RgcJL/BejLJLqu+n5TPnimoGdI/4m
 ftmmHXOQRSocjirSpiaRtVPEwuhk4Y6gke9iFXWwW3Nke2Bht9X0MN7xCk0rRMk1i23+
 /5wQ==
X-Gm-Message-State: AOAM530G8bkq2SJKIZH77luuO5rvT8caONxk+yl0UJgylOuFF6f1qfOp
 CPLGHGH6Rx0dFdNSm/fDVHKmpdL5iQTya48HaCA=
X-Google-Smtp-Source: ABdhPJy9H3pjImYrqG9bFzKbP/y/JXTLXaY5wJ3dkq3rCZrJUUJM5hp/O1J1UWmJFmSLGHBVoB1r5ibe6ITM4BI25bA=
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr4406377ljc.382.1631284341794; 
 Fri, 10 Sep 2021 07:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-4-heiko.thiery@gmail.com>
In-Reply-To: <20210910140925.28138-4-heiko.thiery@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Sep 2021 11:32:10 -0300
Message-ID: <CAOMZO5DTLDxEqG6MqVtN003fDqfXbZEm3LWdReLTZGzMi07Tmg@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 3/3] boot/uboot: copy IMX firmware files
 to uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Fri, Sep 10, 2021 at 11:10 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> If the U-Boot image is to be built with binman and one of the i.MX
> firmware files (ddr, hdmi) is used, the files are expected in the
> toplevel directory.

I would remove binman from the description as this is not binman related.
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

> +config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
> +       bool "U-Boot needs firmware-imx"
> +       depends on BR2_PACKAGE_FIRMWARE_IMX
> +       depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
> +               BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
> +       help
> +         Some IMX platforms (such as iMX8m, iMX8mq, iIMX8mm, iIMX8mn)
> +         encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
> +         This option makes sure the imx firmware gets built prior to

The imx firmwares are binaries, so they are not built. Please adjust it to:

"This option makes sure that the imx firmwares are copied into the U-Boot
source directory".

> +         U-Boot and copies the files from the buildroot binary dir
> +         into the U-Boot source dir.
> +
>  menu "U-Boot binary format"
>
>  config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1a840d9cc1..cf8d6b1f39 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -180,6 +180,33 @@ UBOOT_DEPENDENCIES += opensbi
>  UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
>  endif
>
> +# New U-Boot versions can create the IMX specific boot images

s/New/Mainline

> +# and needs the some NXP firmware blobs.

s/needs the some/need some

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
