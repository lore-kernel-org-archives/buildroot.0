Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AC4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29AF6105A
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E29AF6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8739A404C7;
	Tue,  7 Sep 2021 08:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edSLWkJ2nHrp; Tue,  7 Sep 2021 08:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95C7E40252;
	Tue,  7 Sep 2021 08:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3FE1BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0653440252
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjg5RLXQrqCr for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBEE440119
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:36:31 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so1407566pjb.1
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MnrX5ZhDDoDEIBXl8IrGvgl9cuc14XD0VEqnfvYyurs=;
 b=NEwhORWeZyRB9WQZuybAoEJB8NKNHaP/4wOxuleWYP4OghHuaPcvagiuIrx9YQa/hm
 f5rtkVn9SzbZJDbqLBH4YFdrH3rkimTDUKQ5PmWJG6HMtXr5hJFTWfLfKvws6e9HWvXZ
 0bHFafGSC8aGH6tHWvBzYHy9Nn1XmQOSsedIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MnrX5ZhDDoDEIBXl8IrGvgl9cuc14XD0VEqnfvYyurs=;
 b=KvdNUrobzJGKbWDwGsQEsMbjTw5bDGrRCvESAte45lQdzwgBc/YEZAxsvA8tyo2B3R
 mLgmhVA2eNhOvL2A16e7TRjt5je4d/4H1aoz1YBt0cOta5Hx+d7ccR5XznXgqNVjM9I/
 LFRvG5bSbGq7Ld/YSOVYZpnvu3lKI2YWooUGYzAoUygvY+5JbIQ5ut2ks19i4t+QhRKY
 SG4k9jMKxlvP52ZOrqeqC/RyX51Wm6wesH2a+UjOizPdm3C66amGsRQ1SJ2IwCZCdYr2
 rQ9kttoNuZ1DTZa++xxlgBCwrALm3X23q/RAvG0cIb3DWLxUTz+kreEwgMhFMylieF0i
 lkZQ==
X-Gm-Message-State: AOAM531vRf9hHlVxoOX9kS3x8zP1WHykaDRoR2gl+flT9OPkBCBNzbAl
 aDYed3LXJgHhotzW0uwwJ3ZXmg==
X-Google-Smtp-Source: ABdhPJz2A28Q3fLFdXodVUa04JGAj95HhzTlfNysxr/Y1XzLEfIrC7zgBw6mGHcZmSKb2GLITYDO8w==
X-Received: by 2002:a17:902:7882:b0:131:2e12:c928 with SMTP id
 q2-20020a170902788200b001312e12c928mr14101675pll.74.1631003791215; 
 Tue, 07 Sep 2021 01:36:31 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id l6sm10063825pff.74.2021.09.07.01.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:36:30 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:36:26 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <YTckin7wSQXI4a/c@p1g2>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
 <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
 <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
 <CAEyMn7ZKBHc8eCn=Uf_RsmRFrnMAOLVf7m_90fRZi8bCVcZscQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7ZKBHc8eCn=Uf_RsmRFrnMAOLVf7m_90fRZi8bCVcZscQ@mail.gmail.com>
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

Hi Thiery,

On Tue, Sep 07, 2021 at 08:36:30AM +0200, Heiko Thiery wrote:
> Hi Fabio,
> 
> Am Mo., 6. Sept. 2021 um 17:23 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
> >
> > Hi Heiko,
> >
> > On Mon, Sep 6, 2021 at 10:32 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > > What board are you exactly asking for? the nxp imx8mm evk? I have a
> > > tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.
> > >
> > > Maybe this also answers your question ;-/
> > >
> > > [1] https://github.com/hthiery/buildroot/tree/uboot-imx
> >
> > This helps, thanks.

I've tried this series with our U-Boot (2020.07 based) and it doesn't
work for me as using UBOOT_FORMAT_CUSTOM isn't sufficient as it only
copies the binaries selected but doesn't use it as target [1].

So I wonder, which U-Boot version are you using? Is the flash.bin
created automatically when issuing 'make all'?
In my version of U-Boot it requires to use 'make flash.bin' otherwise it
simply doesn't generate flash.bin.

I believe we would still need a new U-Boot target name [2] but I'd like
to understand how it worked for you

Regards,
Gary

[1] https://github.com/buildroot/buildroot/blob/master/boot/uboot/uboot.mk#L135
[2] http://patchwork.ozlabs.org/project/buildroot/patch/20201125183017.15585-5-xroumegue@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
