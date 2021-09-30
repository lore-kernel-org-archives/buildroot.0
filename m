Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519CCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 15:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D8F619F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 15:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91D8F619F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BBF1425A9;
	Thu, 30 Sep 2021 15:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiUdg7ZoJaMZ; Thu, 30 Sep 2021 15:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5A6425A7;
	Thu, 30 Sep 2021 15:22:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E20E1BF2C2
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 15:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89D7440354
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 15:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJ4tH5DhnNMl for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 15:22:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F8B640346
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 15:22:02 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 om12-20020a17090b3a8c00b0019eff43daf5so5048071pjb.4
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zRZlICZtHycOjS3Y4pZXLbWXPa7BThauEK73YiSXicM=;
 b=LsDelpJLL1GzXiprONHPY/mNit9REcJ9BqzWpiJHfIqiWMIHtDQtnnA4ly7OcTp8gP
 q41s4Y6TD644db/ZjJcZBbzQRquJezdyHjGelRS0rrrined8Xqrj7DPqWaWRj0pWxdPZ
 66YIpC4vvMhBTNniORRZA/2VxHF0xMD56dozVbNOFjlxeGZks2nVPN9KKA9uKxcS5YrO
 PgZysVccUFRzITpQ+xLmUcqiYMhfEGW+Ahw71VHyJT2nSNWVmwFz1s2N3qbRi3JH0XrX
 4hB5/fRKMVKJqGXoAqAhTqoHXWBuHk7a3f0iRyhXoCnQtU6KrTSDguxr4LsHZSk6fhCI
 CXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zRZlICZtHycOjS3Y4pZXLbWXPa7BThauEK73YiSXicM=;
 b=TfzEFQyxLXoyQ9jmop58hGE9Q91MCor0O8Vv/Uhj4nzrxIEWOB6rFcMcdjyojaHcl2
 NwBxBtTc5oy7+VaLbtdgxb8HO0vGEQuNocDITuuAR+qVF10qHHx2Gkxdylrkwbm/sMTc
 3MuFOpNIvXIQ+Bn2mVvTIoWC57JgyySxXhgZhaBiGsZG94d4WBio9SFPSQfY80Co9Mhf
 DW3RYWS9GAWaYkGnxNZQrnUBU0i2ljGSSuZTaEsF5DUMFS8v47g7RfAP40uQ1GYV+srl
 BciAfFN2FYY5p0/NVphIuCSs6gcejMi77Tx10o/RvQP6EOQAFiN3mkEFOSaOUt3v7kPr
 Gz5w==
X-Gm-Message-State: AOAM533EDAFs7h1suOxWWoNA+JZOpBWHmsrEP6jIXXuxf2JGVt2ma82c
 FLxgH38iiS6TJsvGmcuYSnk7r1C/ZgEs6fik+c6hZg==
X-Google-Smtp-Source: ABdhPJy8vhChEGZ/PbKUnvT6t94yoxrCiR9lGgVZG4jkTZBbI/InXN+7PyJm8+EDMbFjdamflBEsHq6YcpE5fsBmYlk=
X-Received: by 2002:a17:90a:dc81:: with SMTP id
 j1mr7124186pjv.155.1633015322008; 
 Thu, 30 Sep 2021 08:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
 <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
In-Reply-To: <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 30 Sep 2021 08:21:50 -0700
Message-ID: <CAJ+vNU16uqMnCDBmOMnVyLtLHzU=K61YU2Rtx_3BWYzLzMBaPQ@mail.gmail.com>
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

On Wed, Sep 29, 2021 at 7:13 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Wed, Sep 29, 2021 at 10:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Greetings,
> >
> > I see the buildroot has the ability to build dtb's from the kernel
> > source (BR2_LINUX_KENREL_DTS*) but I haven't seen any configs that
> > instruct buildroot to copy the dtb's or kernel image to the root
> > filesystem.
> >
> > Is there a config for this and if not what do people usually do for this?
>
> It is BR2_LINUX_KERNEL_INSTALL_TARGET=y.
>
> configs/wandboard_defconfig is an example that selects
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> and install zImage and dtbs into the rootfs.
>

Thanks Fabio, I didn't see it because I had BR2_TARGET_ROOTFS_INITRAMFS=y.

BR2_LINUX_KERNEL_INSTALL_TARGET only installs the kernel image. It
looks like perhaps to install dtbs you need
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh".
It seems to me installing of the dtbs to the rootfs should be moved
into a defconfig like the kernel image for those who are trying to
simply generate a tarball but not an image?

Best regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
