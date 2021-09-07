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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A01C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 09:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB08B610E9
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 09:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB08B610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65D5582A4E;
	Tue,  7 Sep 2021 09:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiazYrxBL8PL; Tue,  7 Sep 2021 09:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22A4828F8;
	Tue,  7 Sep 2021 09:03:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 843C11BF315
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 09:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70D3860BE9
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 09:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brLMPxXJGK9U for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 09:03:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47D3260BDC
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 09:03:31 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s12so15451691ljg.0
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPwr/lTYKJWxNO/sJ9VVBTRkSWz0Rv17X3xmerzPfs8=;
 b=nX7ErmWOzgr6FNyHC7z1NGfayHZekMkd1GO5D9Wsp6Z1q87uEJafiK5jwuXRh+x8yV
 jG1tfacZeKWrsaHjsdy4AqbIIgLAv6woo1KKA1xfU9pOsLRlVnyh3CCRIDQJ/x16sWWb
 nFpU+BX53Fx237kbG6AtnShpFERyvWOiXwK1bJ6si8QsYsEwfpgVLjs07V9O6YJmkqnM
 xV6KRxNsPtmjkAKtGfmI0KMW+/UjLTv2OLGl9DHVkXunZD3DBwrvt4ZAis4r8t90354b
 Gzs5yXhwKDmQfBGhDymGAxxrWVfZAXbM1KtwUsh5rx0FB1vTUIa78antiz2bIdNIuHnQ
 lxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPwr/lTYKJWxNO/sJ9VVBTRkSWz0Rv17X3xmerzPfs8=;
 b=fcNSETXwLrdTKukG6KWu78YlZhKx+Xupvnu2RoV4LhZ6eOZPvJ2EkUr/rZU1w+MASA
 nnYd8jzn401gaZXPtl7LC5lpaF+xD4jopBq4j5UO1VhvPqNFstSSdUBXHBuY+XLpREUw
 vs6oS+eAHVkWoQ/+Z5hjtytjb4cZkqGJheVjtwszHou0F5KB+p+g1alwJHWzDP6Fe5AJ
 HTH7Ok+khhSyj60Gsf16ox5M0ujuXi5uQDgVKw1kCVegYg3aavNaB+HDWBW9cDjplD+E
 HGojFxlsrlBFYQIPaq+FP6OFWlDRchMxmDkK7/Ax1TvOIk4xt9fYLsJkQNz0wXan822X
 LAcw==
X-Gm-Message-State: AOAM530Dfiack6nMFcvGEwrdre5ppdq5lR2O0yjkziTQkifDqyb6NwXz
 d8gXHP6rYsK16KF9vbILhfvtWNGneSMofTSsZGM=
X-Google-Smtp-Source: ABdhPJxWwMszXv7ILZCbYDyBQEZ4i89wEof5fZcVPwLvvg0UkuoB6hcPUkT1s9wbLNEoj0Vi4F8ENiMyflhBBUwy6Og=
X-Received: by 2002:a05:651c:160f:: with SMTP id
 f15mr13989617ljq.276.1631005409195; 
 Tue, 07 Sep 2021 02:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
 <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
 <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
 <CAEyMn7ZKBHc8eCn=Uf_RsmRFrnMAOLVf7m_90fRZi8bCVcZscQ@mail.gmail.com>
 <YTckin7wSQXI4a/c@p1g2>
 <CAEyMn7bqZwYArZ0MV=G95dpuH0U_+YzLO+aV_ZHTDrt=wBiZwg@mail.gmail.com>
 <YTcplRmz8UP33lr1@p1g2>
In-Reply-To: <YTcplRmz8UP33lr1@p1g2>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 7 Sep 2021 11:03:18 +0200
Message-ID: <CAEyMn7ayUhZKzK=_ZushYuQz=wUPP58BgYHnSxf-S=g7WKHJrQ@mail.gmail.com>
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

Am Di., 7. Sept. 2021 um 10:58 Uhr schrieb Gary Bisson
<gary.bisson@boundarydevices.com>:
>
> Hi Thiery,
>
> On Tue, Sep 07, 2021 at 10:43:43AM +0200, Heiko Thiery wrote:
> > Hi Gary,
> >
> > Am Di., 7. Sept. 2021 um 10:36 Uhr schrieb Gary Bisson
> > <gary.bisson@boundarydevices.com>:
> > >
> > > Hi Thiery,
> > >
> > > On Tue, Sep 07, 2021 at 08:36:30AM +0200, Heiko Thiery wrote:
> > > > Hi Fabio,
> > > >
> > > > Am Mo., 6. Sept. 2021 um 17:23 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
> > > > >
> > > > > Hi Heiko,
> > > > >
> > > > > On Mon, Sep 6, 2021 at 10:32 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > > > >
> > > > > > What board are you exactly asking for? the nxp imx8mm evk? I have a
> > > > > > tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.
> > > > > >
> > > > > > Maybe this also answers your question ;-/
> > > > > >
> > > > > > [1] https://github.com/hthiery/buildroot/tree/uboot-imx
> > > > >
> > > > > This helps, thanks.
> > >
> > > I've tried this series with our U-Boot (2020.07 based) and it doesn't
> > > work for me as using UBOOT_FORMAT_CUSTOM isn't sufficient as it only
> > > copies the binaries selected but doesn't use it as target [1].
> > >
> > > So I wonder, which U-Boot version are you using? Is the flash.bin
> > > created automatically when issuing 'make all'?
> > > In my version of U-Boot it requires to use 'make flash.bin' otherwise it
> > > simply doesn't generate flash.bin.
> > >
> > > I believe we would still need a new U-Boot target name [2] but I'd like
> > > to understand how it worked for you
> >
> > Yes, when switching to binman the "make all" target will create the
> > flash.bin (all output that is defined/described in binman). So in your
> > case when you use the "old" u-boot way of creating this output we have
> > to add a new u-boot target in buildroot.
>
> Thanks for the quick reply. Indeed I just saw in your U-Boot tree how
> the binman description was done, it's pretty neat.
> So do you know if the flash.bin target is here to stay in U-Boot or is
> binman to new way to go and flash.bin becomes an outdated target? I know
> it's more of a U-Boot question than Buildroot but just to understand if
> it even makes sense to add the target if it's going to disappear in
> upcoming releases.

As far as I understand the goal is to switch to binman for all boards.
That would mean the flash.bin target will disappear. But what about
having a custom build target in buildroot?

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
