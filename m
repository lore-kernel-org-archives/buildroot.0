Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117D3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 18:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF3E60F36
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 18:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CF3E60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F52080F6F;
	Sat, 13 Nov 2021 18:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id po8u881iYTA5; Sat, 13 Nov 2021 18:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 989DB80F4A;
	Sat, 13 Nov 2021 18:11:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9021BF863
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 18:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A1D680F4A
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 18:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hWjbXvzEX1Q for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 18:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 623E980F41
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 18:11:55 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id k83so6052650vke.7
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvckwdA62Ive5LA66uh/McveXgU5jZbN++ujmpDJD90=;
 b=XT1IEZr+JdQ9k+LFDM/iANo6uaTnt5Ejkxh/kZgbL5q6cXxUYCCE+j2TqLBziD/Wk+
 hfKzyGUF7MjEGpcQQmmW/v2IJlwBgvlWNPsGRHXk456NSTGj8vRlPBC5+zYkxUSIDReE
 w1pE1FhZvtKJFSKVibcmfJVaAj5Ni+AM7AAxXxtKIXHE9ofQ6yTiKdicSZNN5M7Mfz8F
 YhQgX7i3+tnVLkjWhcPVFdOCdUsOaVVBJ+3jCpCDF6CiqK7CgetQY4w791bmorPEsdT3
 KwUWwWjiqF/A94vwSWu7JZHH6QyLQKXkky9p/e+K2f3v6M08Yecc1GiHmYjohc3c18Pj
 0GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvckwdA62Ive5LA66uh/McveXgU5jZbN++ujmpDJD90=;
 b=65TagnMulTu7vYL1UKKFDWoWgPZ70q5Z5pMx5Y4NNXwQk80Rp57PgVXhB+Jwqmc+UK
 I9xf4zagWidUvgWvXI6/NeIfBmVlsY77UPFkQcH3DhQNtVSfa+FxgoUET/7aAl4lalfW
 g+YyjmgCig5aKJSTdHnF035SXFSmOub2rFX01p6iA8XqJbEvSkrZ3Xunpz+x0kT2fD33
 dZTkDiX3pOi1totStkXIPe4PD7zzysMvF915MPkRVKV2kCUzd55VZDkBKdFlaoFwnFVm
 Az9kuKRv3nZoI25nTgY/uTAXOboHKlRFyVYArUquRm2iscN8zhdd+Y2ekh6WM1qPpdZH
 6aGQ==
X-Gm-Message-State: AOAM532AGXip2KG3ryXRfafJdI3lQ6LynDY5wtcJ7ZRiTQq5MaTCf6Dd
 NTtTtmMssWQrDkoje7zLoGAhmVBwv2C0DPnscdP6VOXFNHU=
X-Google-Smtp-Source: ABdhPJzvo/T1QkKsFVv9UMv+Hrwv0LCGsgH1nNb+yWmRV6qED9qO8IixxamTGX+L7stdNX9DpVCWVmQeU2hOC8TvyK8=
X-Received: by 2002:a05:6122:8cf:: with SMTP id
 15mr37918707vkg.16.1636827114200; 
 Sat, 13 Nov 2021 10:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20211113143857.2741808-1-festevam@gmail.com>
 <20211113180650.45de409e@windsurf>
In-Reply-To: <20211113180650.45de409e@windsurf>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 13 Nov 2021 15:11:43 -0300
Message-ID: <CAOMZO5ACPGfYjga2d8O3SV+cQaM3e9VVPZ_ioR3dpZ84O8J_wg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH RESEND] imx/genimage: Place the rootfs at a
 proper offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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

Hi Thomas,

On Sat, Nov 13, 2021 at 2:06 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> I don't see the relationship between BR2_LINUX_KERNEL_INSTALL_TARGET=y
> and changing the offset of the rootfs to avoid rootfs corruption.
>
> All what BR2_LINUX_KERNEL_INSTALL_TARGET=y does it add the kernel image
> into the /boot directory of the rootfs. It makes the rootfs larger for
> sure, but it would still start at the same place.
>
> Are you sure there's any relationship with
> BR2_LINUX_KERNEL_INSTALL_TARGET=y here?

Yes, this problem only happens with BR2_LINUX_KERNEL_INSTALL_TARGET=y.

When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
board/freescale/common/imx/genimage.cfg.template is used as per the logic
inside board/freescale/common/imx/post-image.sh.

board/freescale/common/imx/genimage.cfg.template correctly puts the
rootfs at a safe offset.

With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
board/freescale/common/imx/genimage.cfg.template_no_boot_part is used and no
offset to the rootfs is given, which may cause U-Boot environment
area to write into the rootfs
area, causing the rootfs corruption.

Please let me know if you need more information as this problem is
easy to reproduce.

Regards,

Fabio Estevam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
