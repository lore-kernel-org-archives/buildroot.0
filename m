Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE28DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:10:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653D76109F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 653D76109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 347BE401D0;
	Fri, 10 Sep 2021 18:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gzuROFLTvyT; Fri, 10 Sep 2021 18:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64469401E3;
	Fri, 10 Sep 2021 18:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A06661BF424
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9049540450
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78McI13JL1uJ for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 18:10:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DA5F40463
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 18:10:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bq5so5733538lfb.9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U4G000zb9mggFMPS1zaypxcNdTd51j8LJ2vzuUSZBEo=;
 b=cVE5bwo4zsB4wK3OH9r8KfmLqxTGHMiwNrdY3TMqoAqxtphViZIZsyef165cDQNHrn
 GZawbJNfsvK4i/RSsBp52Z7vjVsfk2qIENi6MYvYHGjgu0ph1n1HDpdh8XiQNVQKYfto
 i0BZkDyg5ly+y6UYflCz7SEtN1WRZQvUZ3JVNYY2fs1K2D5MDTNGzK8i6MVe+DDBG/d2
 xMBql82K6Lx3h82UT7mnfsWdRWlJtHfBfCD89OLjdR5SG/usdFxh+dGK87W/+wJYu8DF
 HvKscPwK6frpk/OK7k8RXpiCn3UAda7InC56GhN6JuuCJ/HhR6joVS5mV1Dx8t3tHhBx
 0mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U4G000zb9mggFMPS1zaypxcNdTd51j8LJ2vzuUSZBEo=;
 b=oP022q+yVU6fs1tR74y+ivzcK6p2ZswhGL24Ib3QcGYNYPf72+ClVHnQnC8R5JoUfi
 P+m/X6owaVIjyCbZGKK/RE/gcFDt2qaB8n7HML7AOHizbTjQqgEZlBvc9fZHKfDrNkkt
 +iLUbYp/FGrW0W8DbU/ZTsMpVb+vZsM797xDL+Fn2Cti74gENDO3GUR6gxtJTbWWnV5o
 XqQsPU9ICNtIKPyeWIbsEFbL1HmB22UiXNOSTw901HZV8VPzLDNFdP5fhYkY+Rt4INvo
 m0SIbSkyJNCqbMcggiiF3wZwF/75vsjEPo+ZeIVUxH2d321Hms2voN2MMoXfLj+gdSXi
 5GZA==
X-Gm-Message-State: AOAM530En4WpZ4ghndUKNUtcuIo6rb6TUPstGZrRDMWwMEijvJSURhRS
 jidYYlgnpqWeioXd0JuwzKz7wk/xzYPWLGqrcFc=
X-Google-Smtp-Source: ABdhPJw+HNVY8+i9R33283AiGlF/VmtIiUNXCj6N/kXzmfj02D4ZYhOEqKE+i2aQgwzY9E64mUqGYmeLk8IVCnkc0bk=
X-Received: by 2002:a05:6512:2206:: with SMTP id
 h6mr4845332lfu.621.1631297401289; 
 Fri, 10 Sep 2021 11:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-3-heiko.thiery@gmail.com>
 <CAOMZO5DZ8881bwgwKw5GwSWzgNPzVMh-oz6KLCLNw-Sb_TMELQ@mail.gmail.com>
 <CAEyMn7bx8OL5wmvHnoUiWzH2oQO1A1PLDO0q1aDko1HetFe-PA@mail.gmail.com>
 <CAOMZO5BReqW9Q4ydYVytNOkMXWnLzwfr6Q=bLTQv2FM0eAd2pQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BReqW9Q4ydYVytNOkMXWnLzwfr6Q=bLTQv2FM0eAd2pQ@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 10 Sep 2021 20:09:50 +0200
Message-ID: <CAEyMn7brc2iK7gmUUmy39xJbJh78UU==DQs5PN0HtGpp-eVn3g@mail.gmail.com>
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

Am Fr., 10. Sept. 2021 um 18:08 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Hi Heiko,
>
> On Fri, Sep 10, 2021 at 1:03 PM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > I don't think that's quite right. With the old mainline uboot you
> > could also build the flash.bin, but that was optional. The make rule
> > 'flash.bin' was not part of 'make all'. But with the change to binman
> > the files are now necessary, because 'make all' now also builds the
> > flash.bin.
>
> The need for bl31.bin present in the build directory was required even
> prior to the binman conversion.
>
> For example, let's take the U-Boot 2021.01 readme for imx8mm evk:
> https://source.denx.de/u-boot/u-boot/-/blob/v2021.01/doc/board/freescale/imx8mm_evk.rst

ah ok .. I was not aware of that. I just thought this requirement
comes from building via binman.

Thank you

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
