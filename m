Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEDAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03C46610E9
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03C46610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC55E80BB6;
	Tue,  7 Sep 2021 08:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19PARRiHYcZN; Tue,  7 Sep 2021 08:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C7D80B9F;
	Tue,  7 Sep 2021 08:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF8C1BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4168D6068C
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BP6NxiIDwztO for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:43:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E66660602
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:43:55 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x27so18086225lfu.5
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pCCf7wuxy3hDJFcUfGJvwvxPDuQw+bPAvJ6CC4wFr0s=;
 b=IuHx6eOVgaouNF7GY23AAO3rkHtZpyn/DlYAESJEcW93+8zP2H/RUcngHSKN5mNvhy
 HOk2SqXtZHiC4Wusz7t6SbgudKAWL0ilX76dZZSTv1nIYeZjrj4suIz7rNrdoaGZL0UE
 zYhsMClw4uinUityWU+BQH1tgKp7WPwKb2NBYU2galYATB2Cdl7p87/yU+PClAg9grIv
 zWaWtmuAw6oMNtJ+oruIV+FX5zxD1XDNh7WUENJU1qnrL6j8mZlW9oii5KTAj7GE+J6I
 +Os92ZpweMav8LUdZ6kJep5qxM93BxCBAFbIZXHsBojLk/6SnJXaUZyLgBUX0kT5DqQK
 GRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pCCf7wuxy3hDJFcUfGJvwvxPDuQw+bPAvJ6CC4wFr0s=;
 b=BRvW5Imw5uBPUc7rRWOi/iNz/1349d774BpzWQbIss0abTawDCaNkpbN8aIDl9qYIi
 U8vlVy2PtcEyWuqWWPbIaghi9vjdno0E/YsY+XwsIohgtTr23o9TQEcHxsJ4mLs4lPoW
 +BL91Iy93HwhjDsgujG+YBPdTxMERNxEoFQlFlGBq8QscmhhFPNo8KXnEKCA6pM2G9OD
 WL6dQN8VghBUSHR11qW56iYUWSpo11d/fwYmTQ6Ksbhu1R2rDI3JYmO2HEpYrSPxZOfj
 zbiuta8Ha4wTuSXcw3Yt2gPpOt6+s2U41rCdC3Udv2kVynarTXsmQ0ei2P2VwNVdccEO
 Xwrw==
X-Gm-Message-State: AOAM532jwrojj5l1RFZM8ybOrqCKkyyl+pL7H/So1QCtcfP5GahhS2z8
 J3fQsyt6LgtKhN+niTeb5YtFpF+1FLrqYjzpvI4=
X-Google-Smtp-Source: ABdhPJxUM/qcuTo8LHibyjFNhxqq5o6BufvTnl+c1uOz9JYTFJ0+cimi6DkE+kP0dtxRp36SWF4uiy/b8IDp4w36lec=
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr11856011lfq.14.1631004233847; 
 Tue, 07 Sep 2021 01:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
 <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
 <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
 <CAEyMn7ZKBHc8eCn=Uf_RsmRFrnMAOLVf7m_90fRZi8bCVcZscQ@mail.gmail.com>
 <YTckin7wSQXI4a/c@p1g2>
In-Reply-To: <YTckin7wSQXI4a/c@p1g2>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 7 Sep 2021 10:43:43 +0200
Message-ID: <CAEyMn7bqZwYArZ0MV=G95dpuH0U_+YzLO+aV_ZHTDrt=wBiZwg@mail.gmail.com>
To: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 0/3] Add support to build imx8 images using
 mainline uboot
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
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Gary,

Am Di., 7. Sept. 2021 um 10:36 Uhr schrieb Gary Bisson
<gary.bisson@boundarydevices.com>:
>
> Hi Thiery,
>
> On Tue, Sep 07, 2021 at 08:36:30AM +0200, Heiko Thiery wrote:
> > Hi Fabio,
> >
> > Am Mo., 6. Sept. 2021 um 17:23 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
> > >
> > > Hi Heiko,
> > >
> > > On Mon, Sep 6, 2021 at 10:32 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > >
> > > > What board are you exactly asking for? the nxp imx8mm evk? I have a
> > > > tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.
> > > >
> > > > Maybe this also answers your question ;-/
> > > >
> > > > [1] https://github.com/hthiery/buildroot/tree/uboot-imx
> > >
> > > This helps, thanks.
>
> I've tried this series with our U-Boot (2020.07 based) and it doesn't
> work for me as using UBOOT_FORMAT_CUSTOM isn't sufficient as it only
> copies the binaries selected but doesn't use it as target [1].
>
> So I wonder, which U-Boot version are you using? Is the flash.bin
> created automatically when issuing 'make all'?
> In my version of U-Boot it requires to use 'make flash.bin' otherwise it
> simply doesn't generate flash.bin.
>
> I believe we would still need a new U-Boot target name [2] but I'd like
> to understand how it worked for you

Yes, when switching to binman the "make all" target will create the
flash.bin (all output that is defined/described in binman). So in your
case when you use the "old" u-boot way of creating this output we have
to add a new u-boot target in buildroot.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
