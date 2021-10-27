Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDECCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 03:27:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9F160E8C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 03:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B9F160E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A04F2400D2;
	Wed, 27 Oct 2021 03:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYT6pD5dGmTu; Wed, 27 Oct 2021 03:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED72E400CF;
	Wed, 27 Oct 2021 03:27:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1940D1BF32D
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 03:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1566F403AF
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 03:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ruSAi12zVuR for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 03:27:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41910403AB
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 03:27:13 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id d63so1966332iof.4
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brOKF2mA6/ZaJc342k27n4GjpPKIGFRwsJourANnXm0=;
 b=XUQOrCHnvdR4FRnX0CdGO+Yk8aHV5txMcdf1N1QJT+hz/3Iw4qMQibmZnTbqe9ybdF
 hq7zYy/mkbPmitJLGBAOtcQdyHPoaovS+jdfVkRTld/IxvkaqvQO52/rzSbZsrJy0hVI
 QRS0xoyB78bZ92IA3Vpn0TjnySAFpU3C8rnY/YiRNP9fI67t5pbF28BXThg5OGLrDpwE
 6fAXcESa0s6sP5DhX6ZpWIONmd3Uf3ccIS6EpD1HZeg2U2oJxgCU0RcG540tiSuD9ryY
 wALfbUmv9+0ugf5YA3RQphaq5C2/Z89J96Lh1r1BcBuEBw2qMZRi3Z5E1L2YGpqqNgt+
 8i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brOKF2mA6/ZaJc342k27n4GjpPKIGFRwsJourANnXm0=;
 b=4MNKIYNzhe1KLzy8vBYcl1rlqugQCx83cYtDh6mSPBg+Do60iXuU+EpgNw7s9+tRop
 nav8mjPhTog6bwqpRpHghGEmbK5y/Rk487p/aJ50NxP9maqcN6fDuoS7qCLu4PnKrsjF
 kxAgewaouX9vpg2Cx8Y4g+C/h6r6w75o80KOXL/7+Z/uCHdh1UnY0cg3HWps5mKKbUr/
 oHRrTR8bhMWbWL+VuOW7Qc3EwGcsmt8C8qMKuoU2DWv2yiAzoyJDIwtQVx1DWQeq1/K7
 KJL3iQymagXsR4RKK8+WB4vlpYUFSkTebNDvF6f6jMFgS3HKPmiSyhB+mX4ZXN3ubAZ5
 gXJg==
X-Gm-Message-State: AOAM531naGxyU8r74XkoROhzE8goq2e6tJYPnzySGpV/531voxjH3qVK
 hM2EF3qV+eTioKmEL7Bo1u8JWNyJHnWRcrGCYcU=
X-Google-Smtp-Source: ABdhPJx6YHSxIELNXMImmJjGkLHUN/1kQRY4IO0f7DehMNXktGhOw4UzBEtNSi9s0KdCI6hvAO6JLMAR5rOZtPnN4sQ=
X-Received: by 2002:a05:6638:2581:: with SMTP id
 s1mr18078653jat.35.1635305231848; 
 Tue, 26 Oct 2021 20:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-4-damien.lemoal@wdc.com>
In-Reply-To: <20211026071728.954356-4-damien.lemoal@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Oct 2021 13:26:46 +1000
Message-ID: <CAKmqyKNsp-sptsCb0mH_fw=wP0B1Qnjo8D4MY8Kp=549Wf4P3g@mail.gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [Buildroot] [PATCH v5 03/10] package/Makefile.in: Fix NOMMU
 RISC-V 64-bits toolchain base name
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 26, 2021 at 5:25 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> From: Christoph Hellwig <hch@lst.de>
>
> Using *-uclinux-* seems like an only partially followed convention.
> And at least RISC-V 64-bits gcc does not know about uclinux tuples.
> So switch back to the normal "linux" one for now.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> [Damien]
> * Make the change conditional on BR2_RISCV_64 being "y".
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/Makefile.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 04347d2d84..dae7a859fd 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -39,8 +39,9 @@ endif
>  # Compute GNU_TARGET_NAME
>  GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
>
> -# FLAT binary format needs uclinux
> -ifeq ($(BR2_BINFMT_FLAT),y)
> +# FLAT binary format needs uclinux, except RISC-V 64-bits which needs
> +# the regular linux name.
> +ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
>  TARGET_OS = uclinux
>  else
>  TARGET_OS = linux
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
