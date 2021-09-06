Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0180C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:48:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C3C6101C
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31C3C6101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E726640288;
	Mon,  6 Sep 2021 12:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66BF9gL3E4_A; Mon,  6 Sep 2021 12:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FBF540141;
	Mon,  6 Sep 2021 12:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85BDF1BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F1C606CF
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WA4O6wDq8_Fo for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:48:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D9F160666
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 12:48:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id h16so13290554lfk.10
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l5sxOYoKQXnV6H7QI2Bb5mNrrv7ISaudkPiit8wMebA=;
 b=DnUnJxkURtTC+6tlNFoCB8b1daV8aglGLbUc4xGyQY+tlOu6+3APrLRnPUhxijKcWi
 zqJ8A0Tngtf329cXOMnDGtkF7I6M3zl5lWRasq5nY9iBRjR0EPqY22PiJNcqFWIZaTBu
 +u88rH7qAYZ0mFKy9UI5hDLaaegsbReEdYT8RCLkxn9X34025YqlUY00bXHPfCmgi9eD
 Dp1+FqwxUBz4q28vpvIBDoM5lLtsz0RsV6fHJ30oRFFqM/1bwIgmYbLKMLeioGNybaLS
 5ZvGZJOweeoTG1CBm/oXtLsKVoFu71DhcIZmQZoCeaqBdHPlP8OVVGxVfXz3Ne2KpYTX
 uNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l5sxOYoKQXnV6H7QI2Bb5mNrrv7ISaudkPiit8wMebA=;
 b=r7x4e49zFe3PHMmqMgNoV0CytZIWX/GuiwKXGUUa371ZwkwWFfPSbFbpLGDnQdCDwx
 GJX8Ob1orBa6PrSMetss6Tb9QwltXOIWnZOe5iJp8d+1XiQad6BPpkp40tGUXobCdB8U
 7iY6JYZFmo/w81Y1q5mQWLbKyHRxU0b/f8dRDX4Wm4qqMuib47WtrPn77+ZzeSTrXBra
 d4aMspexy3FlMZDTFW+h2hLyOWo+nKPQDagE47CZkSV5oTFLuHEBuQQBxcOgkiaFEdYp
 MF66PebSfNr9x2m8sYGGinDYeswgo7vJeXilOiF/Wxq5KpArYEshsGQEeFIinU36AOKH
 pAYg==
X-Gm-Message-State: AOAM5335cM3v4qIVeHhDnVgOFWMyoZhToR4OtgkrBYpl6iFz+ldOLMEh
 WDHgZ7y5QXbjmxeSo3IMmCefl3B8yCMgrgqffTY=
X-Google-Smtp-Source: ABdhPJwjruj8nxWuOLhUcONe4AHwPhAvLlIIG/Nx6Y7lQtqVB7/DpCLgEq8noia7LVRYgRQ1Yd0ENgmqZSj8gVMCbsw=
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr9693316lfq.79.1630932516401;
 Mon, 06 Sep 2021 05:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-4-heiko.thiery@gmail.com>
 <PAXPR04MB8863813E1952003264B49565A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8863813E1952003264B49565A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 6 Sep 2021 09:48:25 -0300
Message-ID: <CAOMZO5DOMp_JG3TFqv81C_zz1AKXm_6=dwRmwFGQuHC9rgpivw@mail.gmail.com>
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
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Stephane,

On Mon, Sep 6, 2021 at 9:45 AM Stephane Viau (OSS)
<stephane.viau@oss.nxp.com> wrote:

> >+         encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
>
> Are other firmware binaries also concerned (I did not check the U-Boot code) ;
> such as VPU, SDMA, ... ?

U-Boot does not need the VPU and SDMA firmwares, as they are only used
by the kernel.

Regards,

Fabio Estevam
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
