Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C7CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:11:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A703E6121F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A703E6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E4361B88;
	Fri, 10 Sep 2021 16:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFgha5Ai2qrK; Fri, 10 Sep 2021 16:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7E461B8E;
	Fri, 10 Sep 2021 16:11:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84B211BF2C7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73DC9401D0
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p38v0pTou9gK for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 16:08:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9293A401B4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 16:08:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s3so3969374ljp.11
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MfO3IdXF/h2hGNPKq609+OO8DaLm97fSumImyg/0aZk=;
 b=YyYYur2Bxe8xZRS2ZqH8q872li1DnMuzPPHiuFWakBleygUHsLPPDhX3E2YRe82Fi2
 BeUY0kIAPxUHOzm3GsLJSU7Xx1k/RsAQ2UWcNZJktn+T4GBMiLrqUZm/Ra3eknf0AACY
 qG8xpM8bVJtBHm6PcSsU6zPUimNfamMmf5mXu4mGnDMNfXnUlT3SDFw3pJLY9d2lUtUp
 Cq6ZLsoTD2wtIALNDvoK/Uq7zSukfZ3abFSJkb8TI9sPHFxglP1PYXI67Do3GK9hzmKy
 R36PL2elUaqkTbjoxZAtG7Gt1kbAAw5zcVC9dVaP5uToAfhhGh9dGtI3QgstWhKnPZbg
 +gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfO3IdXF/h2hGNPKq609+OO8DaLm97fSumImyg/0aZk=;
 b=j6Gp/pU50XXwx8YSNGtMbO6Qy8fWNRSykPS4DzEwBvJjXPktFccNncBQ5/CsALT/Nq
 BXas6qNY8YknUMazQpUb+47QTEEPCsAh9LH1DR/zDfQ8Fy3Bo2zU1+KJjWgxxLkoSzjN
 OVBjMleqibU0cGUTLBCwQfhDw65BqnK8qXHe1GRcBI4zSyhQvER0lU8NxrbQqXumx0ox
 sgnMlf9sF1ix+4pROPrDwLQrL8FIPuv/FFdACBe8wqPAtw1dEpv8qMee9eTzJbQxjWy+
 TVbJVbOez+htASaxovCpP+QnY9xJBzeWh+t8jSPa1oQTYMfgT73yPiInx2a6Lm0cQMHt
 Cnkg==
X-Gm-Message-State: AOAM5321UC6ZY0jyfBg+7sYOskCzBH86960aAS6OoSwisXWjjG+HvYhX
 f/n4BSkZbltOogU01PPY0vTLUT0obWTGuHwtk8s=
X-Google-Smtp-Source: ABdhPJyUh85Y8PbXFpVg2Cuu0wtboxrRVbvJC+J4MHruA9vxxZmu3F0Wk7YoSbsG0CtbmVRhwpvM1qxhkU83ekE8XbE=
X-Received: by 2002:a2e:8014:: with SMTP id j20mr4777800ljg.228.1631290111360; 
 Fri, 10 Sep 2021 09:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-3-heiko.thiery@gmail.com>
 <CAOMZO5DZ8881bwgwKw5GwSWzgNPzVMh-oz6KLCLNw-Sb_TMELQ@mail.gmail.com>
 <CAEyMn7bx8OL5wmvHnoUiWzH2oQO1A1PLDO0q1aDko1HetFe-PA@mail.gmail.com>
In-Reply-To: <CAEyMn7bx8OL5wmvHnoUiWzH2oQO1A1PLDO0q1aDko1HetFe-PA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Sep 2021 13:08:20 -0300
Message-ID: <CAOMZO5BReqW9Q4ydYVytNOkMXWnLzwfr6Q=bLTQv2FM0eAd2pQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
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

Hi Heiko,

On Fri, Sep 10, 2021 at 1:03 PM Heiko Thiery <heiko.thiery@gmail.com> wrote:

> I don't think that's quite right. With the old mainline uboot you
> could also build the flash.bin, but that was optional. The make rule
> 'flash.bin' was not part of 'make all'. But with the change to binman
> the files are now necessary, because 'make all' now also builds the
> flash.bin.

The need for bl31.bin present in the build directory was required even
prior to the binman conversion.

For example, let's take the U-Boot 2021.01 readme for imx8mm evk:
https://source.denx.de/u-boot/u-boot/-/blob/v2021.01/doc/board/freescale/imx8mm_evk.rst
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
