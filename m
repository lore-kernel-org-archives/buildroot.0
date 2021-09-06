Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51936C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:33:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E513360F45
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E513360F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D5E6080E;
	Mon,  6 Sep 2021 13:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuoXsrvo7OqJ; Mon,  6 Sep 2021 13:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0833C6080C;
	Mon,  6 Sep 2021 13:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054EE1BF2BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E85ED4045A
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TeRG1HaNs1FC for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 13:32:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C56B440109
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 13:32:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y34so13528277lfa.8
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7xTDhyuR50cwOwWME6UgEndRQFyUhxeuIe6ipXZu0Dg=;
 b=Q24cBP+V9uvT12tlo026tJXgYq8SSK+bRAdrYLMHnhvjvvVDFQ5B8l91B423N3jroo
 CEJHm/qkgqVmF7iQ4ZWrwG4my8FgA6AETozBVFmlQ49eaQY3YdPpAm9+8lf0IhAdiBAC
 Vhv2UnOMZ9w5YY9IwCMYnXYzzImAw1K8eUQNqPxgzafx6Jg3mxG2CLmg81uhEYTB4iAe
 evJEdG3kq7AuMXcUz6Cn5W+XHjqkxrM88p0Oj7HdsaimZhM/dkptRlLjCegVD5SbwRAf
 C3Y1gSCXsZJW5l0p4YrUByDA9f2B8SNvOTXZrG/6i0HVkWpmSlGNaUJ5WFS69YtA9eDO
 fuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7xTDhyuR50cwOwWME6UgEndRQFyUhxeuIe6ipXZu0Dg=;
 b=kbiebbYvoV1cDEiy//Fn6BEl3RRK5k/OQndGq6r4LrKE41OpygXoWru/leWc0CHGa5
 iIsu0qMd+6l4PeKpwoPbWFDR3eubkHA85HbDEcZ2/uINuZl1xlcZ9l2vtRyIavEP3pQj
 SGxuRKDoeSqyJh9gGoCTS3YHW/bMHsKuloT1AttL++kWqBvIO33q4cIcATA/MRsyOpec
 5EmkY5H3VCcr0W6uzK9wInjnNsQ356pD9tE2AiMU61/w59x57VM5bpCKgxNnSI3deJdq
 LKFrtuPrJn39qPImh37ElTOSl6CGelw8ZRfL57imSWHRrWOS0baA483KX225+7jUrs0A
 urcQ==
X-Gm-Message-State: AOAM532stSGeYKRO1P4Vu1fwvDTgc+K4NLQ8w/H1Wghz648oJK4QeggI
 Q69rk/oY5I2j2P7XWHpH5W0IcfzfF4MNwXpA8mig5kWGFPY=
X-Google-Smtp-Source: ABdhPJywKiIraPeTBLWGtLmLOZRL1cunndQrXSlgqW5SUHMHERTJdCq7TKXuzOkTv52mlW2rKpv4BCzpm/O4nfNUoPI=
X-Received: by 2002:a05:6512:1326:: with SMTP id
 x38mr9436369lfu.591.1630935175803; 
 Mon, 06 Sep 2021 06:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
In-Reply-To: <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Sep 2021 15:32:44 +0200
Message-ID: <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
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
 buildroot <buildroot@buildroot.org>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Fabio,

Am Mo., 6. Sept. 2021 um 14:25 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Hi Heiko,
>
> On Mon, Sep 6, 2021 at 6:42 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > New U-Boot version support building the flash.bin bootimage using
> > binman. For that the imx specific firmware files like (LP)DDR and HDMI
> > firmware has to be located in the u-boot builddirectory.
> >
> > Xavier Roumegue already posted a patchset [1] to add this support but did no
> > follow up version after getting review comments.
> >
> > I have taken up these comments and prepared the patchset.
> >
> > [1] https://lists.buildroot.org/pipermail/buildroot/2020-November/599906.html
> >
> > Heiko Thiery (3):
> >   package/freescale-imx/firmware-imx: copy all (lp)ddr files
> >     unconditionaly
> >   boot/uboot: copy ATF bl31 binary to uboot package dir
> >   boot/uboot: copy IMX firmware files to uboot package dir
>
> Thanks for working on this.
>
> Would you have a git tree with all the required Buildroot patches to
> get a bootable imx8mm image?

What board are you exactly asking for? the nxp imx8mm evk? I have a
tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.

Maybe this also answers your question ;-/

[1] https://github.com/hthiery/buildroot/tree/uboot-imx

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
