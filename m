Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D41C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:13:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2819E61108
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2819E61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA03409C5;
	Thu,  7 Oct 2021 20:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1ismY8zvoLC; Thu,  7 Oct 2021 20:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4B9409BA;
	Thu,  7 Oct 2021 20:13:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 434671BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E8AD409BA
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bL_M-5pst2Dg for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 669B5409B4
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:13:14 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso6018520pjb.0
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bF++PH7rFputQa6tGWe9BWlTkH4eBI5JclgYXuGedO0=;
 b=sDPpuF3Ly9Fi4YRZ9112XnMEJYynI73Upbv5GYlEYdt5Phr4qmQ5K28PV/UTDOl7Kl
 W9TZRtVFLZcoaYymCDU4YH3CtLlkniPGfs7EMuAG89N/urFnStQ0nqlzYf591wRURvEh
 I29vu2nMmnCpKRp3xzcUV76sQKkdXq6CEP3713M/74eexOL8hwLyRxVy6WKThTruUBTh
 Hf6DNEGHTDBS/tNNd0lftfNr66g7p63X8g0OkUTLpoStE0Ts3Sm83oL+y08w8ts2qD5r
 R94/L4qsHIcwYS9cMP8kML3pHsyJ+dEEYInmKcdSULBGz5F+VcmgJ9ENXCahKg7JaHXa
 Y71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bF++PH7rFputQa6tGWe9BWlTkH4eBI5JclgYXuGedO0=;
 b=kLBcWtNyK0QSLN72GGo6Rwg5pBH6Wu/D34eSd18ek4I304QZPhRyxmZHgs9JaYjfrw
 7/+Ny60qbWtPW+hSCOcGxVb4a8pXrdAOahwrRdzzLuZKB9qLxvbQsVEev4hxeWPXZXLl
 Ob6D3yDI8tFwTHfC46NLnLQWhTdIpter+1pWfjO2tRKn01K2GyKwjQ5J6Ao30uh5g5vv
 YGROmDUfKM6Pwz99oJFHV9bXAh8YXNNV9+TaNv4HVUcJnSzQcMGobGVOD3ffdavqCN3C
 fepUcBdgJcVxu/XBP9ONQJd+lds0yFiRW9AXctHlrpBPMATUxTyD098qH5LbQx745tAi
 aVtg==
X-Gm-Message-State: AOAM5301q5AGDWNyfkZmHk1wkhkfRHzIKVlw2jAwJnnyBkJH8rklYTT5
 /K2W+DFnd3j02va4/kDZHgb5dHHOracje6fK4G+vxXtoTyI=
X-Google-Smtp-Source: ABdhPJzSxqkCn/SuO+Aa4qFaMDbPC3IcVxK4q9rC2IxKqSYuXiR3Xem6I05NxCVA8L5JN8rNRgj16m702006hE6wGZ0=
X-Received: by 2002:a17:90a:dc81:: with SMTP id
 j1mr7046648pjv.155.1633637593587; 
 Thu, 07 Oct 2021 13:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
 <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
 <CAJ+vNU16uqMnCDBmOMnVyLtLHzU=K61YU2Rtx_3BWYzLzMBaPQ@mail.gmail.com>
 <CAJ+vNU3qyPwoSy2YfH7yjTSkX6A=mWV6iqk8difayO0MFU42VQ@mail.gmail.com>
 <2439f331-726c-4192-b821-addce6518bfc@mind.be>
In-Reply-To: <2439f331-726c-4192-b821-addce6518bfc@mind.be>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 7 Oct 2021 13:13:02 -0700
Message-ID: <CAJ+vNU3fwgap6J7hWqJyRqjen=CP53OAFAMvdt==bN8wyXFo2w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] buildroot config for installing kernel and dtbs to
 rootfs?
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 3, 2021 at 3:52 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 01/10/2021 16:38, Tim Harvey wrote:
> > On Thu, Sep 30, 2021 at 8:21 AM Tim Harvey <tharvey@gateworks.com> wrote:
> >>
> >> On Wed, Sep 29, 2021 at 7:13 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>>
> >>> Hi Tim,
> >>>
> >>> On Wed, Sep 29, 2021 at 10:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >>>>
> >>>> Greetings,
> >>>>
> >>>> I see the buildroot has the ability to build dtb's from the kernel
> >>>> source (BR2_LINUX_KENREL_DTS*) but I haven't seen any configs that
> >>>> instruct buildroot to copy the dtb's or kernel image to the root
> >>>> filesystem.
> >>>>
> >>>> Is there a config for this and if not what do people usually do for this?
> >>>
> >>> It is BR2_LINUX_KERNEL_INSTALL_TARGET=y.
> >>>
> >>> configs/wandboard_defconfig is an example that selects
> >>> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> >>> and install zImage and dtbs into the rootfs.
> >>>
> >>
> >> Thanks Fabio, I didn't see it because I had BR2_TARGET_ROOTFS_INITRAMFS=y.
> >>
> >> BR2_LINUX_KERNEL_INSTALL_TARGET only installs the kernel image. It
> >> looks like perhaps to install dtbs you need
> >> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh".
> >> It seems to me installing of the dtbs to the rootfs should be moved
> >> into a defconfig like the kernel image for those who are trying to
> >> simply generate a tarball but not an image?
> >>
> >
> > Fabio,
> >
> > Digging into the image creation used for freescale_imx8mmevk_defconfig
> > things seem flawed to me or at least limited.
> >
> > I'm still trying to wrap my head around what
> > BR2_LINUX_KERNEL_INTREE_DTS_NAME is trying to accomplish
>
>   Very simple: to use a dts that is in the kernel source.

Ok, I see that the dtb installation to BINARIES_DIR wasn't working for
me because I needed to append the 'freescale' path as the imx8m dtb's
are in arch/arm64/boot/dts/freescale. Once I do that the 'kernel' dtbs
are built and copied to output/images as I was hoping for.

>
> > but one thing
> > I see is that board/freescale/common/imx/imx8-bootloader-prepare.sh
> > and board/freescale/common/imx/post-image.sh are creating images
> > assuming the U-Boot dtb and the Linux kernel dtb are one and the same
> > which is wrong.
>
>   Saying that it is wrong is a bit exaggerated. You can say that they're not
> necessarily the same. The intention is that device trees are OS-independent, so
> the *intention* is that the same device tree works for both U-Boot and the
> kernel. That said, indeed, in practice it is sometimes not the case. That said,
> the parts that are actually used by U-Boot usually don't change any more, so
> usually it's fine to use the kernel's dtb for U-Boot as well. In particular, for
> the imx8mm EVK, this is the case.
>
>
> > There are specific details that differ between the two
> > especially if you are trying to boot different kernels with differing
> > support.
>
>   If you're going to boot two different kernels, you're going to need two
> different Buildroot configurations anyway. So you're also going to have two
> different dtbs. Which one of those you're going to use for U-Boot, or maybe you
> use the dts that comes with U-Boot.
>
>
> > It's always best to decouple these.
>
>   They are decoupled by default. Normally you'd generate a U-Boot binary that
> has the dtb (as specified in the U-Boot config) linked in. I'm not sure why for
> imx8mmevk it's done differently.
>
>
> > The other thing I'm
> > noticing is that these scripts assume one dtb per image which is
> > limiting.
>
>   I think you're not entirely up to speed with what the configs/ and board/
> directories are meant to be. They are just minimal example configurations to get
> a minimal working system on a specific board. The idea is that you start from
> such a config, boot it on the board to be sure you have a working baseline, and
> then start customising. In particular, it is not the intention to use the
> scripts in board/ as-is. You'd make a copy and adapt them to your specific needs.
>
>
> > It looks like imx8mm-venice is the only U-Boot board that
> > supports multiple dtbs for imx8mm but for imx6 there are many.
> >
> > So I think we need a way to make linux.mk copy desired kernel dtbs to
> > BINARIES_DIR separate from desired u-boot dtbs.
>
>   This is already the case - cfr. BR2_TARGET_UBOOT_CUSTOM_DTS_PATH.
>
>   What is maybe missing is to copy the U-Boot dtbs to BINARIES_DIR. Currently,
> it's assumed to be linked in with the U-Boot binary and not copied explicitly.
>
>
> > This means we probably
> > need different DTB defines for each.
> >
> > I also don't see any bootscript creation facility in buildroot which
> > seems to be something that may be desirable as well.
>
>   Do you mean calling mkimage on a U-Boot script? That is done in e.g.
> board/boundarydevices/common/post-build.sh
>
>   We don't have support in the Buildroot config for it, because there's just too
> many different ways that you want to generate boot scripts. It's much more
> flexible to do in a post-image script.
>

Different 'ways' or simply different scripts? It is true that mkimage
needs a SoC specific loadaddr and arch both of which are typically
found in imx related post scripts. However it does appear very few
boards use a bootscript so I can see the argument for leaving this
board specific.

>
> > For example the
> > freescale_imx8mmevk_defconfig only boots because it's U-Boot default
> > environment tries distro-config first which requires a bootscript then
> > falls back to a hard-coded loading of the kernel/fdt from the
> > filesystem thus no bootscript is needed. I'm not sure how many boards
> > in U-Boot have a hard coded fallback like that?
>
>   For most new boards we prefer to use the extlinux.conf approach. But in the
> end, it's mostly up to the person contributing the defconfig to use what they
> prefer.

Can you explain what you mean by extlinux.conf approach?

Best Regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
