Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580EEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:38:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D689C61507
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D689C61507
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7093E421EE;
	Fri,  1 Oct 2021 14:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ict3gB1kv85B; Fri,  1 Oct 2021 14:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7019421DA;
	Fri,  1 Oct 2021 14:38:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC9E21BF424
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E1740130
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjmfGA543Tns for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 14:38:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A27EA400C1
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 14:38:15 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so2020043pjb.3
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NjwlXuenriLbhAngfWkQaRJHQEmBzPgYspCB9Jvb7FE=;
 b=oACxPLDau8lVm2I9D4k+Dwv6+fQX2Tcp5HrCn3//T1fiZLITWSKIK/+rAqck8+x1+7
 kPA1qsT9xk5A2FGIideGWcOInTtbtnx5GGzfZZXvVSFUdS3gcPc6BgP4OwRPlr17dDAK
 gACV91dh/jDpr8pqFDgvFG98kyhNNatPkNQxk6O0/WPC1+HOb43HN9nz4ZPsbFXcDM8V
 5Oig4ZEZh/Syi5HhpURI2KjLHqChzlu7p/igDU+Y6UlaCFvCqNnOkum286bctwibQFVo
 /Q/YEFJ06VeV03iUjb2CeHJu4x3wdLebSnJ4PvR2qjO3QxW2IOKCf9Bh7lCc6JnJguuH
 wHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NjwlXuenriLbhAngfWkQaRJHQEmBzPgYspCB9Jvb7FE=;
 b=LXF3E6lO32PFPTG32f9DuiNF1iblHsTrpS2cMpK1ayxoY5YwOtEXtiKYYYywtCtVBf
 w/ct/EzS9gFVeuerjhP639xTypObrhUTW925n4woi8E3hek74f0jRFtkndlEjmqGILgn
 nYaTnkqB+8OScDp0jm+1qySio7XXy5sFBv3ot/rYsqGumgi5GFBAQKrwIk69grPQ1djE
 LeqU2g0nMwwIZ6jyPvAXX49ZmPH2HxRME2iUPfqvwxChlQRyaLdXeEUkx3YQd938lDPp
 /Dwes5chY2pfSLn975SsMHYhu/8XKv7baBbo+cigO9MrmUIp3xm9EAlrLHEa70zD98sF
 Wk2g==
X-Gm-Message-State: AOAM530vN9deUEKK8zNoTelmxUycZW61PfGSYUwUS1czJXVj4uAm+lnW
 KvTm51BuALOW4YrcmOpZ/FAnCY3VDbMK6JlQ0XaMk7Ge3y4tSw==
X-Google-Smtp-Source: ABdhPJy0w5kmBtYJL7res1z89EH2cFBtNqbQFvST8S8r7XXAlwnC6W4nl1oalvinuYCC+rgxXbMaW84v44RcQvRN3XQ=
X-Received: by 2002:a17:90b:f98:: with SMTP id
 ft24mr13729079pjb.66.1633099094839; 
 Fri, 01 Oct 2021 07:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
 <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
 <CAJ+vNU16uqMnCDBmOMnVyLtLHzU=K61YU2Rtx_3BWYzLzMBaPQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU16uqMnCDBmOMnVyLtLHzU=K61YU2Rtx_3BWYzLzMBaPQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 1 Oct 2021 07:38:03 -0700
Message-ID: <CAJ+vNU3qyPwoSy2YfH7yjTSkX6A=mWV6iqk8difayO0MFU42VQ@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 30, 2021 at 8:21 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Wed, Sep 29, 2021 at 7:13 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Tim,
> >
> > On Wed, Sep 29, 2021 at 10:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > >
> > > Greetings,
> > >
> > > I see the buildroot has the ability to build dtb's from the kernel
> > > source (BR2_LINUX_KENREL_DTS*) but I haven't seen any configs that
> > > instruct buildroot to copy the dtb's or kernel image to the root
> > > filesystem.
> > >
> > > Is there a config for this and if not what do people usually do for this?
> >
> > It is BR2_LINUX_KERNEL_INSTALL_TARGET=y.
> >
> > configs/wandboard_defconfig is an example that selects
> > BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > and install zImage and dtbs into the rootfs.
> >
>
> Thanks Fabio, I didn't see it because I had BR2_TARGET_ROOTFS_INITRAMFS=y.
>
> BR2_LINUX_KERNEL_INSTALL_TARGET only installs the kernel image. It
> looks like perhaps to install dtbs you need
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh".
> It seems to me installing of the dtbs to the rootfs should be moved
> into a defconfig like the kernel image for those who are trying to
> simply generate a tarball but not an image?
>

Fabio,

Digging into the image creation used for freescale_imx8mmevk_defconfig
things seem flawed to me or at least limited.

I'm still trying to wrap my head around what
BR2_LINUX_KERNEL_INTREE_DTS_NAME is trying to accomplish but one thing
I see is that board/freescale/common/imx/imx8-bootloader-prepare.sh
and board/freescale/common/imx/post-image.sh are creating images
assuming the U-Boot dtb and the Linux kernel dtb are one and the same
which is wrong. There are specific details that differ between the two
especially if you are trying to boot different kernels with differing
support. It's always best to decouple these. The other thing I'm
noticing is that these scripts assume one dtb per image which is
limiting. It looks like imx8mm-venice is the only U-Boot board that
supports multiple dtbs for imx8mm but for imx6 there are many.

So I think we need a way to make linux.mk copy desired kernel dtbs to
BINARIES_DIR separate from desired u-boot dtbs. This means we probably
need different DTB defines for each.

I also don't see any bootscript creation facility in buildroot which
seems to be something that may be desirable as well. For example the
freescale_imx8mmevk_defconfig only boots because it's U-Boot default
environment tries distro-config first which requires a bootscript then
falls back to a hard-coded loading of the kernel/fdt from the
filesystem thus no bootscript is needed. I'm not sure how many boards
in U-Boot have a hard coded fallback like that?

Best regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
