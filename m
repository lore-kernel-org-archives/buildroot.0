Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEA4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:26:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC4360FA0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCC4360FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F1A82E14;
	Fri, 10 Sep 2021 14:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mB3eO_nXKloH; Fri, 10 Sep 2021 14:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D019282D96;
	Fri, 10 Sep 2021 14:26:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 475081BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3643D605CC
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLabCm08V49z for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82DC5605C6
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:26:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id l10so4429142lfg.4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6IS5iKfn5tHskhgG8ieI1ASDeZCcoDYGI3zfVnqFkMk=;
 b=cKPrizeHlRNdKCeMYT1V+btcxgI5KKE7dGpNsvKA+kZPTJwFQCSRRzH7dNNibzkytE
 mTcBrq91KYNnpVy86Du4uV3rxbDxB8JQp2tA+sqbWSWO/IwDKjvLjJpJQ8w7YQMxFY5d
 LZwafWQV1fR/Uvn8cLTN/byGfCSv1R8paiaBfIh076Y9notHgflZeDmuKaPMDZLROoxl
 mlyovXC5DCraO38nR+iE9MLl2k/2/zPNv4nGHQ834HJsQaTZyHH/hDdjpt9JQ/eC3QxG
 dI2AzPIffEAQKQw83RnQtDmcweSfifRCpRONZenTPtEbVer1ZCoVrRnKJtkG8nkf6jgo
 yjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6IS5iKfn5tHskhgG8ieI1ASDeZCcoDYGI3zfVnqFkMk=;
 b=ODxImz4kuoS7N0refpZSRhGmhIoXhhaQcqwHHm4ELuqkXZBVMA3RCFHw0MxE+e0a9u
 joY1DRqbsX/yRHXw9NU77s7/kqmDtyzBE2jzS4itpAv3SxHqPlENP+BPBJ7jGmNbIZTv
 l4BZdj1phqJiYHxGbwixt3/XVFu5k+akGkoEnq3H4G/0WnfhhylpR3h9Wh9n4TA2p+n7
 Ek90jBrUq20z0AhqwbJC2Gtd/Buk3B47vwyxQeBZp12BgfwrNLjC707Gi15ZV/KP/7wS
 nwXrL1hLr+2WimXk2Y0b7IxKqotOYhHm9ypt5LNGT+Fwb5H7tZxLtLFdZXi0Qa9ZM9qF
 KlKQ==
X-Gm-Message-State: AOAM531QbkZaufxnQL+qecoot0J6mt2STZNbYSsTyvo4OhPCKa77CktT
 kidHZHLzOXW0iN0BIVu7N5rDT2QRBb05eQlzkoQ=
X-Google-Smtp-Source: ABdhPJzLEpH+1adiZ3HK3K6vll6jNNi9FF7mI0sxi5k5sHYx9prKUXoiNYNGRb4Y3nuJhrkG7mtaGcHEhMi2FPoIpQ8=
X-Received: by 2002:a05:6512:2385:: with SMTP id
 c5mr4264187lfv.530.1631283989324; 
 Fri, 10 Sep 2021 07:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-2-heiko.thiery@gmail.com>
In-Reply-To: <20210910140925.28138-2-heiko.thiery@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Sep 2021 11:26:18 -0300
Message-ID: <CAOMZO5Duicrg1U_AzOfZ14SpK=QL0YKPZBCMm56m_TvS2p1fOQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/3] package/freescale-imx/firmware-imx:
 copy all (lp)ddr files unconditionaly
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
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Heiko,

On Fri, Sep 10, 2021 at 11:10 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> In mainline u-boot more and more imx8 boards are switched to binman
> to create the imx specific image (flash.bin). To support this the
> (lp)ddr firmware training files are needed. For this to work all files
> should be made available to the U-Boot build.
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
