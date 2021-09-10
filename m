Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D13FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:03:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86939611CC
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86939611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B85360BBC;
	Fri, 10 Sep 2021 16:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KD256oO4uunj; Fri, 10 Sep 2021 16:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F3460C15;
	Fri, 10 Sep 2021 16:03:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3D161BF333
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B001460C15
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LLi-PN--g4G for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 16:03:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F153460BBC
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 16:03:22 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l18so3948737lji.12
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sOIxHoF25X9pJqJyoQT1GDGeXb+cE8WfR2eth5nuSB0=;
 b=c9U1qsn4f7J/pUxRZ+bfchGk0mPmkZBecEtUP5ceua7welyU4WIBKdqO3l9C78dVew
 jk8ZMZmmyrb5NktNvjVIBuA8PW3Hi7DPZXKUsIzEzP3dhh0+WaQluHaiuhk+XZmoGoET
 YvXzV3Vgj+o1vNSvtQK6HeX/MYfsDqsBBHqq2VsFO+fs0kSCYTjC8SvUX1LpkL5ctDPy
 VrPd6WppP1EzK6oe/20nR34GVAnJaTTnUen6sY0xQlJ4fCw4bh+y3IHMwbu6VqHR+BTi
 JjEAtVil2R2Yakmv11Rf2H70Xp2vTpR1yXaNSOnvMT5RThB7gFkaKHGHwRKceB46rRaO
 xx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sOIxHoF25X9pJqJyoQT1GDGeXb+cE8WfR2eth5nuSB0=;
 b=b4/8pnBrnoTVtaU9MhEj4mCn/R8qPMDQKksKNVtmnoG9aLcMKfbKbtpJqLafObc32I
 bi6SzFaNwi7GuEHcjW4AhF5bGb3mLfbyxOLarjLbitU4TEqNwXlTBGNzFj6wsUQzMLdS
 Rg31TTkzz0+KQ2BLnc3tDKnJkqqOKwwJdsYwYMd+H5eSEsnEBfnasoU68k6vS3bTGYIv
 TSMeu2TO6uoDUoNzURnTT89ZfYat71HaIYjB0SmnqB8FWIYyXD25jWD6EWKZG4B3upQ0
 d0RFUksi8/R1cU64YHSeoG92O2HubwHL1t6wEPRYh3ADLjrj0RxqDbk9TpkVG1xq3DyJ
 Wllw==
X-Gm-Message-State: AOAM5301YHE0ajtm9iS+svqlEIuBt1NunEictRFYMeivvH2CyA84SjS8
 +QVldrov9gHto4UOo5SwCWfi7RFCpbCcZl1ROlw=
X-Google-Smtp-Source: ABdhPJyaKiA6KFcDjKkRMUrt7R1C/6l7ufWVWTnwoLvOafROatVGUumHYv0vwPa9JqsEtef+C383nuhDx3zpqvHOdXA=
X-Received: by 2002:a2e:8546:: with SMTP id u6mr4751773ljj.185.1631289800913; 
 Fri, 10 Sep 2021 09:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-3-heiko.thiery@gmail.com>
 <CAOMZO5DZ8881bwgwKw5GwSWzgNPzVMh-oz6KLCLNw-Sb_TMELQ@mail.gmail.com>
In-Reply-To: <CAOMZO5DZ8881bwgwKw5GwSWzgNPzVMh-oz6KLCLNw-Sb_TMELQ@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 10 Sep 2021 18:03:09 +0200
Message-ID: <CAEyMn7bx8OL5wmvHnoUiWzH2oQO1A1PLDO0q1aDko1HetFe-PA@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/uboot: copy ATF bl31 binary to
 uboot package dir
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

Hi Fabio,

Am Fr., 10. Sept. 2021 um 16:27 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> On Fri, Sep 10, 2021 at 11:10 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > If the U-Boot image is to be built with binman and the ATF binary is
> > used, the file is expected in the toplevel directory.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> This applies even if the image is built without binman:

I don't think that's quite right. With the old mainline uboot you
could also build the flash.bin, but that was optional. The make rule
'flash.bin' was not part of 'make all'. But with the change to binman
the files are now necessary, because 'make all' now also builds the
flash.bin.

> Reviewed-by: Fabio Estevam <festevam@gmail.com>

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
