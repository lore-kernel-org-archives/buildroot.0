Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22E4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5539A60F45
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5539A60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24EB240466;
	Mon,  6 Sep 2021 13:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRyxaC2pr6-E; Mon,  6 Sep 2021 13:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2302740467;
	Mon,  6 Sep 2021 13:21:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C16581BF2BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCC1A40299
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIEj59EeQ-bJ for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 13:21:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8475440109
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 13:21:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c8so13500270lfi.3
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPzsJ7tTInljcPJjGhdgrc1QREjtqyVkeqTx1toocC4=;
 b=P4qXVW0aVROCWSimuwAS3KrOTG46PyD305dPTgrzgQ2jWDih8j8/0FPLR0xQe/5obW
 pZ8xG5NGMg0HpoLbcHCJyuMlokKxqN08daq/Zqi+AL3PCJz5G3YhrcHRLsoIBnyHAmHm
 3bFoxuAt/jJ9ztj015+U7AmSN0i3P+DCSUb4JvhatzQSissuNllkxOuhMrVZKQ+dgQBC
 SxRkXQk9w3gCojDxOtK/xDEQ6z3VKW60/N+RfvcYXdfyPtmhvY4q9SRKcWqTAGR/RtWp
 /7q4luuIi5W9ks8LNHykIZvEYZm5X5jsrWRPOoaFWza10kXjvlCPPhSwXV3Yb7P+nM3E
 cwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPzsJ7tTInljcPJjGhdgrc1QREjtqyVkeqTx1toocC4=;
 b=nUAqJ+mGcPd4QBkYu1k/dLHv064RC5po2fUuYumMkPBYuNyTO+3woOze9tKvuOS6Mn
 zg3VU+0iyt9D+pr7nt6Qp2zifYGnUiIpX4UtvncnEhmPFEhMrClVroaR/5aj5B+j1DZ8
 t+cMrCb1wFBu4+5V7mGkjRgrFPJ02nbQ4+8IRxdgxrYi4OVlhGRAvKNp9M0OxOpPguAg
 XFl7CUxT0Hz/RHAxLErVE4k5b4iEnxW/VSrElr39+9qVRxFQ+WifpId4zcbIRIAtj6r0
 xtZa7aD+0Yf140N5d1BArRKWXoCb5PCgH75Usfj3MkYgfa++vrK153REpBk6R8BQhEbO
 Dbtw==
X-Gm-Message-State: AOAM53178t7yuJX/1kt/WbQv+4OJv64a13rsd4WpYzTlbD73QRmm7H/0
 vhyIJ+IrZRlqb9yYIq6g0100rPXVnjyvj1e7IWg=
X-Google-Smtp-Source: ABdhPJwoSHCScOx5Wg+GWOPQsJI3lX/V/FsDAWoTwLzqPix/Gbga33rzcUrqMm4ppcDdeGAUa84U4UeLVn9DuUQ0klE=
X-Received: by 2002:a05:6512:5d3:: with SMTP id
 o19mr9020219lfo.470.1630934458366; 
 Mon, 06 Sep 2021 06:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-4-heiko.thiery@gmail.com>
 <PAXPR04MB8863813E1952003264B49565A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
 <CAOMZO5DOMp_JG3TFqv81C_zz1AKXm_6=dwRmwFGQuHC9rgpivw@mail.gmail.com>
 <PAXPR04MB8863B5F17E3C34C5E9E36160A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8863B5F17E3C34C5E9E36160A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Sep 2021 15:20:46 +0200
Message-ID: <CAEyMn7Zj+saDtKQJdDwPRwgXYffU_hOwgmLg=iy13Vm=ghviMA@mail.gmail.com>
To: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
Subject: Re: [Buildroot] [PATCH 3/3] boot/uboot: copy IMX firmware files to
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Stephane,

Am Mo., 6. Sept. 2021 um 14:57 Uhr schrieb Stephane Viau (OSS)
<stephane.viau@oss.nxp.com>:
>
>
> >Hi Stephane,
>
> Hi Fabio,
>
> >
> >On Mon, Sep 6, 2021 at 9:45 AM Stephane Viau (OSS)
> ><stephane.viau@oss.nxp.com> wrote:
> >
> >> >+         encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
> >>
> >> Are other firmware binaries also concerned (I did not check the U-Boot code) ;
> >> such as VPU, SDMA, ... ?
> >
> >U-Boot does not need the VPU and SDMA firmwares, as they are only used
> >by the kernel.
>
> Indeed ; thanks!

As Fabio said, I think only the DDR and the HDMI firmware has to be
integrated into the uboot/spl and is used by binman to package the
e.g. "flash.bin". At least for the imx8mm and the imx8mq based board I
saw that.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
