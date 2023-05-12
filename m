Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36071C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 16:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C951084B19;
	Fri, 12 May 2023 16:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C951084B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOZ0-PIqEVoc; Fri, 12 May 2023 16:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F103184B15;
	Fri, 12 May 2023 16:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F103184B15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 659A81BF284
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 375C0700E8
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375C0700E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKEMFFPP5saO for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 16:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FEC61545
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05FEC61545
 for <buildroot@buildroot.org>; Fri, 12 May 2023 16:07:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-307d20548adso1263511f8f.0
 for <buildroot@buildroot.org>; Fri, 12 May 2023 09:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683907657; x=1686499657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EXxj0vLJuEv5CwgqDgzO3VJ10J1EbgSUW+IDYmHF0U=;
 b=lhIDVSwDH7LhhpvYVz77DkmGAuTicyLIxWM2ZzFL1Ad9zumXMohdWwfGa49UZGfqdx
 bAvoxuGqGpJBYtCUodHdnEgUdWGzdd65TNrWOP/are9ih8wMvurkAXGfityAZLcpmq1s
 zJlwJkWf2U1nW6dbEf/p+EGHsrotarXSx8pFeuJmvyPTWUDgTToKCEr2eMW981ymcN/3
 pmX410BC2uWyRgosw1Fk0QOsyWpXA8b+JuHzeCv/fIBOtGqhWo92dZroPKcE4wOLHHrC
 rQSQ8jC1ayJeSEvwMY9AH9unvTN8bG8wts71inzi3gpWWKmmrAEmWOs+w3yw2FVfrFze
 QOKw==
X-Gm-Message-State: AC+VfDynTfJC185kpz2YG3lWOMn1JVLzcZowtKSm4JMKhhiAEj0x3zkj
 nxZ/wPtYveQAuy6tmSxMhpll+zp9wVQ=
X-Google-Smtp-Source: ACHHUZ6oBzznrr71KQO1IyywgQR0jpZGH13gkeon9h67Uy9K+IxTAJaDmwF6eOCgiPpgBP96Q5SulA==
X-Received: by 2002:a5d:5007:0:b0:306:46c4:d313 with SMTP id
 e7-20020a5d5007000000b0030646c4d313mr16889682wrt.28.1683907657304; 
 Fri, 12 May 2023 09:07:37 -0700 (PDT)
Received: from p1g2 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr.
 [83.204.213.113]) by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm23881080wrn.93.2023.05.12.09.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 09:07:36 -0700 (PDT)
Date: Fri, 12 May 2023 18:07:35 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <ZF5kR5Ig0Y4kfTEP@p1g2>
References: <VI1P190MB04933DDA75BE1BC9A23B06929FB99@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P190MB04933DDA75BE1BC9A23B06929FB99@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683907657; x=1686499657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7EXxj0vLJuEv5CwgqDgzO3VJ10J1EbgSUW+IDYmHF0U=;
 b=cDLw7HRf1oKQj6W4HQZJ3f8ewVfM1ckPolcLDooPgr48BiKom1qxjUTWTfjyErSV6E
 uTDbPi7nDxhzAjjCHUhlhDcfWTTU+wPEHyEy8QMVPVgHjP//6/MTt5ZXaHUrAJl20k/r
 wll6XSatTQ9VFaS6muUENnLOIdNYQNBXluT7ga8o4oJM6ZC6NCro/oNfd+ktdnBbIg4J
 jQHPnssyt1Y37c9a8dEaUFGp1aeLeSSlHLUknEW23djJ4klJ28MXtevxSBOyMbx3zcRR
 21RTJD8gdcTK6mBkikNzGCjY8xUuSP2U0TVOGa53q5yKdcEVvBC0gpj7F6uWQgID35GH
 H5qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cDLw7HRf
Subject: Re: [Buildroot] [PATCH v3] package/freescale-imx/imx-gpu-viv: fix
 aarch64 framebuffer support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Mon, Mar 13, 2023 at 09:16:31AM +0000, Lang Daniel wrote:
> Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
> the fb folder for aarch64 is no longer included in the archive.
> 
> According to meta-freescale [0] the framebuffer output can be enabled on
> IMX8 by using the wayland libraries together with egl.pc.
> 
> Tested on an imx8mn by running kmscube. EGL and GLES support detected.
> 
> [0]: https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc

A possible improvement, that can be done in a follow-up patch, would be
to remove the examples option when arm64+fb is used. It won't cause any
build issue anyway, just that the examples require a wayland compositor.

> Fixes:
> cp: cannot stat '/home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/*': No such file or directory
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

Reviewed-by: Gary Bisson <bisson.gary@gmail.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
