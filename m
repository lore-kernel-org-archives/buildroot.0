Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A42FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 07:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D44B2408B0;
	Tue,  8 Nov 2022 07:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D44B2408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoR5aLfsoSiX; Tue,  8 Nov 2022 07:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6CF8402C3;
	Tue,  8 Nov 2022 07:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6CF8402C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAF9B1BF35E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DFEE41484
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFEE41484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_sFmfMVePCG for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 07:29:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FAD4151D
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41FAD4151D
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 07:29:09 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso12587999pjc.5
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 23:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bg6MFikvhO0eX0642omQl4nTPzr9n+qKPjRJHrqTr2I=;
 b=pWxsdx+F014Bf4AvQxXpny1wzAZmBqVeGSG/zUFhTgH3DpcMH46SevF7ofPQiwwlYm
 NkuRnX0JF9bWy5sy6BE+unHOOW1DbBOrUoiCI7TJk2/6SE8EY0+otyLn0HqeLuLQcuK4
 KpESgOgDjpjnu+THGQbqqA37xAQucnZwJSoIYBIE7DXKNDiWucXDx0GUJgsQAJqS9w1f
 DM5q272rDitqfV2hK3Q09MZ4NYdGOyyqn5tzZFZvs6tkBZlDbNjjaulC6UHy37dlnAUd
 Z+vrvV5IFyuk15K3OCxdEssOvS52lcq6alaTnbBJOveo+Jb98AsGzL0uP3VVtdNnLxVY
 +x0A==
X-Gm-Message-State: ACrzQf1D1aMe29UQ4Xv+oZ+svO/CC0v1WTPuB53rzxORN8dRUv1ky3jY
 iF/GXbCVUdAXMcQAvzm+yABqrGYkwYnIF6Fy1CNy6LCg0+g=
X-Google-Smtp-Source: AMsMyM5QtZOyB/mqIAfCrDNDwcEthlUOEQwilWHJYREa01Vtlh5dP+trHvBzACy7RzEokfw0CCzT2ivzUAX/uoNBPOU=
X-Received: by 2002:a17:902:dac3:b0:186:a437:f4b8 with SMTP id
 q3-20020a170902dac300b00186a437f4b8mr54447575plx.70.1667892548565; Mon, 07
 Nov 2022 23:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20221106102046.13138-1-heiko.thiery@gmail.com>
 <20221107202044.GK3918838@scaer>
In-Reply-To: <20221107202044.GK3918838@scaer>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 8 Nov 2022 08:28:55 +0100
Message-ID: <CAEyMn7Y3UgT-8dYY5rbnzcPfbGmqRVXG=joWx1fSSCC=WiFzbg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bg6MFikvhO0eX0642omQl4nTPzr9n+qKPjRJHrqTr2I=;
 b=fICteZzHZuTwF3YKqIo1KEXaAsxPLUkgepznBt3qQ4xhsoQw60+PVtu6Qae9FVmrXu
 uT27iWHfbiVMMH/N8vuu1hLmKNRo+0izDDr6ABJyzGMWr5JDQfoTeqgHJuxKBsvzfbaD
 du2NwUQZZapgHhoiA6bcHd6Si4FhMSvIWUVRCZTGLre6NfwEOGwE+DW8DoXEELpYV+U5
 TxE35B5BtDXkVeFzF7NwE6o3u7rR6YaooXBQsU+6kdE+hkR8Qty+lFQAV9ZEDFaIUZw8
 PbzKCqe/dyO+niZaTTKAZPxY1roV808QaYpLDqcmutkp2hDWM2W2op+J89BiCWFmDxXE
 f4fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fICteZzH
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: bump
 U-boot to 2022.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

)Hi Yann,

Am Mo., 7. Nov. 2022 um 21:20 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, All,
>
> On 2022-11-06 11:20 +0100, Heiko Thiery spake thusly:
> > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  configs/kontron_bl_imx8mm_defconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> > index ff376662e9..240cb52245 100644
> > --- a/configs/kontron_bl_imx8mm_defconfig
> > +++ b/configs/kontron_bl_imx8mm_defconfig
> > @@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
> >  BR2_TARGET_UBOOT=y
> >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
>
> As far as I can see, the linked build failure is about missing -luuid
> and -lgnutls
>
> I see you added BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y, below, but did you
> forget to add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y too?

The BR2_TARGET_UBOOT_NEEDS_GNUTLS is already in the defconfig but was
not enough. There were some issues with the build system of u-boot.
They were fixed upstream and are now available in the new version.

> Also, is the version bump really required to fix the build issue? If so,
> it should be explained in the commit log, plese.

In the new U-boot release are some patches that fix the issue with:
a638bd349ea438256daf9c1f323402a137c55e03 (kbuild: add
KBUILD_HOSTLDFLAGS to cmd_host-csingle) [1]
31a7688cbe0ed5edf4108a1f7ef4653659610d4b (tools: mkeficapsule: use
pkg-config to get -luuid and -lgnutls) [2]

[1] https://source.denx.de/u-boot/u-boot/-/commit/a638bd349ea438256daf9c1f323402a137c55e03
[2] https://source.denx.de/u-boot/u-boot/-/commit/31a7688cbe0ed5edf4108a1f7ef4653659610d4b

I will explain that in the commit log and send a v2 for that.

-- 
Heiko


>
> Regards,
> Yann E. MORIN.
>
> >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
> >  BR2_TARGET_UBOOT_NEEDS_DTC=y
> >  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> > @@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> >  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> >  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
> >  BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> > +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
> >  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> >  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
> >  BR2_TARGET_UBOOT_SPL=y
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
