Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883B1FA3740
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 14:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7084409A6;
	Thu, 27 Oct 2022 14:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7084409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlEl4ecyKSix; Thu, 27 Oct 2022 14:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7ADD40331;
	Thu, 27 Oct 2022 14:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7ADD40331
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10CCD1BF37E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 14:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE145813C0
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 14:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE145813C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jd5Y1yNTwbRO for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 14:34:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA268134E
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DA268134E
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 14:34:12 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id e4so1729066pfl.2
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 07:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VR41dQQnG3Rq3DER3gbuD4FLrHBZ75kDkX6bzP84uEc=;
 b=KS+hDmv7XbwA91g/dqPU3/0K//Dvx+10e8qe0qfgi3rNMANfCnmoPiJVSTczOFxyGk
 HueXvUhiA0ydIE+3SZp1XLVhVkwQG2ZiBApKxAa1+5XkoIeijBnCHy5vGn6V5PTFa6WN
 /U2xEO6xdchfbqrOgkgFXbgymmMQr35dwNzMaNRoHB+zLcm8Lh3cUKav2RWvQ9/13xm8
 o5lcE9fJhiK3azJ5WUt/O955yVnLY25lskbMgDdr11aBpGYrM7XRH7apPpWDyjzqasVP
 EAWmjEoIIhd/7EBPmYeOn4sw4XmK+SPbx8KVBeS5mSu+vbpc96Q6hmlsQH0jGSyti2Ei
 0Ang==
X-Gm-Message-State: ACrzQf3L9XOpYDY8/VvLis+sP71iJouHHB199bty6gW1lin3KUS8PsJP
 UpV1pJQvPa88Lv2gBmsU5KQriSu/LqgZRWQAQoc=
X-Google-Smtp-Source: AMsMyM5s9wljMLcxg/UC4TH36d85w5WqKvG8o1H7ca/h9jBCK6ge4SZN/gPiexRBZKQktDZg3qfRAEfEmaYFm+dGnTU=
X-Received: by 2002:a63:ed01:0:b0:445:4345:4a21 with SMTP id
 d1-20020a63ed01000000b0044543454a21mr42603944pgi.404.1666881251439; Thu, 27
 Oct 2022 07:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221022142040.625468-1-ju.o@free.fr>
 <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
In-Reply-To: <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 27 Oct 2022 16:33:58 +0200
Message-ID: <CAEyMn7akZgR6t5Wvfr93k4xkESRkL6oSB4tR9ibzM2+HE9kOOw@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VR41dQQnG3Rq3DER3gbuD4FLrHBZ75kDkX6bzP84uEc=;
 b=QJfkiIZWv7DLQRjyQvBd59NYoTxfcW75eHp1D0N43fGyGK2M8/s8SzWdtqG4SZt3Lz
 KaM2H32sRlOEravRW7nJQyC68aLrxEWnZypAoBjY3LEnUl+/Den5OaK4pXxvEBwXluA0
 pzN1Pd358nMwd17YZGNXRbFaG6dpSW30ZTBDakoDSuC/OH+QEe5rluOuaByDaUsj53lZ
 WlZO9VXp/3+66kSOpR6r+q3TkqfGjbQawqsJ74Z6naQL+mIiSkB7hBNtXBYlJ8+1ei+C
 +STSS9K+6xLdk+WPcINKfLPLVD8eH7hCiV5l88R21xmqN3q8qMpzNUhglyCOR7AWktCP
 N+Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QJfkiIZW
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8{m, mm}pico: disable ATF SSP
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Do., 27. Okt. 2022 um 16:22 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Hi Julien,
>
> On Sat, Oct 22, 2022 at 11:21 AM Julien Olivain <ju.o@free.fr> wrote:
> >
> > imx8{m,mm}pico configs are currently failing at ATF link with output:
> >
> >     aarch64-buildroot-linux-gnu-ld: asm_stack_protector.o: in function `update_stack_protector_canary':
> >     (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'
> >
> > The ATF version in those configs does not provide platform level
> > support for SSP.
> >
> > This build failure was introduced by commit
> > 09acc7cbc91f50305730ca0690a58fb93529034b
> > "boot/arm-trusted-firmware: fix SSP support". Before this commit,
> > ATF SSP was globally disabled, by default.
> >
> > This commit fixes those build issues by disabling the ATF SSP in the
> > defconfigs.
> >
> > Fixes:
> >   - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498119
> >   - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498120
> >
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
>
> I met the same build error when trying to build kontron_bl_imx8mm_defconfig.
>
> Tried your suggestion and it fixes the build error:
>
> diff --git a/configs/kontron_bl_imx8mm_defconfig
> b/configs/kontron_bl_imx8mm_defconfig
> index ff376662e9e5..b05828981081 100644
> --- a/configs/kontron_bl_imx8mm_defconfig
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -34,6 +34,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>
> Does this need to be fixed globally? I suspect other defconfigs face
> the same error.

I see the same issue with the kontron_pitx_imx8m_defconfig.

-- 
Heiko

>
> Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
