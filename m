Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5664C4320A
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 07:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D41660F02
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 07:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D41660F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCB3608A8;
	Fri,  6 Aug 2021 07:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paEuQjPdNBLf; Fri,  6 Aug 2021 07:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28F896FB8B;
	Fri,  6 Aug 2021 07:33:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E106A1BF83B
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 07:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFA984047A
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 07:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eot4yEeMdcDV for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 07:33:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B128D40472
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 07:33:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h13so9851164wrp.1
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hvXeFgy+cZgsD99gGc4bsn0xRW5LuahqaKYbZtECc6Q=;
 b=K/Pu/+b+JVpqXmRFVSNGD7qSWhiHPBrsNfPbrYJ7kT79md7wtZ15WLJlKpGmUiQ2Iw
 HMbP944YtNQLHCod6EBnlx2pPn+PuzZVENokoFqteoIz0fNcG+MS9n5VLJLq8BoVtw1E
 MRrDLUhlqii/m8Ihd6O0i9+7HHYjnRsOQPDUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hvXeFgy+cZgsD99gGc4bsn0xRW5LuahqaKYbZtECc6Q=;
 b=pI99NMADxj1KiDwyf40HcMGfi82VMQaLBVNJOI5bLSQMHGmtxmwhdC/x44gXdWnRe6
 WxD/e3KZ3h5PqVGFoWB64/mubrtwmWS0+i5+UUM3fb4ShOk86xUaJNFUdznH6rJInik3
 6x3KTwbCVg+v41Nsyx+PO2vwDQXqFxpq0pZ0/zQe97iZt3Aevhqw3BqQO8KZykk/bKSA
 fQDow+1uxdQlWCnUl3dveOO63Fz6TB5dhYolSt4ERrbrWWHGzU1zhLcf2ZoMa99EGg9g
 grzKdZHJbnucOJlioj7YTNR0u9rnt3isRCFc2KFRUIRn8JvaCmjRnX6HqiZNfTgGSaR+
 PD5A==
X-Gm-Message-State: AOAM531A0x2ykxpuUl7Ylfq/JRRtkAAN1HniggEJJ74MjUVpK/iNuOpW
 V2jhkMgK4qWEvJGVcvDT7coAZw==
X-Google-Smtp-Source: ABdhPJzz0X6aCxrOWKAWdHVSd9Uq5cxdeB963XsZkrqykyEfFDJxbtIlrqSPXicUzNhkimds8NeOQg==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr9128146wru.414.1628235196743; 
 Fri, 06 Aug 2021 00:33:16 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id i10sm11269023wmq.21.2021.08.06.00.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 00:33:16 -0700 (PDT)
Date: Fri, 6 Aug 2021 09:33:14 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YQzluoTETdnadPXC@p1g2>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-2-tuzakli.refik@gmail.com>
 <20200210155801.GB335587@p1g2.work>
 <20210805225102.0108f2ac@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805225102.0108f2ac@windsurf>
Subject: Re: [Buildroot] [PATCH v2 2/7] package/freescale-imx/imx-dpu-g2d:
 new package imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series
 instead of imx-vpu or imx-vpu-hantro.With this commit,
 imx-dpu-g2d is added and is enabled for i.MX 8X.
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Thu, Aug 05, 2021 at 10:51:02PM +0200, Thomas Petazzoni wrote:
> Hello Gary,
> 
> On Mon, 10 Feb 2020 16:58:01 +0100
> Gary Bisson <bisson.gary@gmail.com> wrote:
> 
> > Sorry but I disagree with the title/log of this commit.
> > 
> > This has nothing to do with vpu, it's all about g2d which is NXP
> > interface for 2D graphics operations (CSC, rotation etc).
> > 
> > On most platforms (like i.MX6 for instance) there is a 3D GPU and a 2D
> > GPU, so for those Vivante package was providing the libg2d libraries
> > that leveraged the 2D GPU.
> > 
> > Now on newer platform such as i.MX8X, there's no 2D GPU but the display
> > IP (here called DPU) can perform the 2D operations so another package
> > was created.
> > 
> > Here is where the selection is made in Yocto:
> > https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/conf/machine/include/imx-base.inc?h=warrior-4.19.35-1.1.0#n222
> > 
> > So my opinion is that, like Yocto, we should create a virtual g2d
> > package that either be populated by Vivante libs by the platforms that
> > have 2D GPU or by DPU on others.
> 
> Thanks for the explanation, but I do have a number of questions
> following this. Right now the imx-gpu-g2d package is included with:
> 
> if BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
> source "package/freescale-imx/imx-gpu-g2d/Config.in"
> ...
> endif
> 
> So it means it's visible and accessible to all those platforms:
> 
> config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>         bool
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> 
> But you're saying that imx-gpu-g2d only applies to i.MX6. So it seams
> like we would in fact need a BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU_G2D,
> like:

I was saying it only was supported on i.MX6 series, but since then NXP
added the 2D GPU back on several new SoCs.

> config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU_G2D
>         bool
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
> 
> And make imx-gpu-g2d only visible on these ?

I believe I offered something like that in the past but was told to
limit the use of "IMX_HAS_XXX". At the time I believe the reasoning was
that users should know whether they can use g2d or not.

> Could you clarify exactly the list of i.MX6/i.MX7/i.MX8 variants on
> which imx-gpu-g2d makes sense, and on which imx-dpu-g2d makes sense ?
> 
> In Yocto they have this odd:
> 
> MACHINEOVERRIDES_EXTENDER_mx25   = "use-mainline-bsp"
> MACHINEOVERRIDES_EXTENDER_mx6q   = "imxfbdev:imxipu:imxvpu:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx6dl  = "imxfbdev:imxpxp:imxipu:imxvpu:imxgpu:imxgpu2d:imxgpu3d:imxepdc"
> MACHINEOVERRIDES_EXTENDER_mx6sx  = "imxfbdev:imxpxp:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx6sl  = "imxfbdev:imxpxp:imxgpu:imxgpu2d:imxepdc"
> MACHINEOVERRIDES_EXTENDER_mx6sll = "imxfbdev:imxpxp:imxepdc"
> MACHINEOVERRIDES_EXTENDER_mx6ul  = "imxfbdev:imxpxp"
> MACHINEOVERRIDES_EXTENDER_mx6ull = "imxfbdev:imxpxp:imxepdc"
> MACHINEOVERRIDES_EXTENDER_mx6ulz = "imxfbdev:imxpxp:imxepdc"
> MACHINEOVERRIDES_EXTENDER_mx7d   = "imxfbdev:imxpxp:imxepdc"
> MACHINEOVERRIDES_EXTENDER_mx7ulp = "imxfbdev:imxpxp:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8qm  = "imxdrm:imxdpu:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8mm  = "imxdrm:imxvpu:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8mn  = "imxdrm:imxgpu:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8mp  = "imxdrm:imxvpu:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8mq  = "imxdrm:imxvpu:imxgpu:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8qxp = "imxdrm:imxdpu:imxgpu:imxgpu2d:imxgpu3d"
> MACHINEOVERRIDES_EXTENDER_mx8dxl = "imxfbdev"
> 
> But I can't really make much sense out of this.

Well I guess the naming is very confusing, but having imxgpu2d in the
above means that G2D is supported, whether it is with GPU2D or DPU [1].

From that list, if you have both imxgpu2d + imxdpu it means imx-dpu-g2d
is the g2d lib provider[2]. So imx-dpu-g2d is only available for mx8qm
and mx8qxp, all the other platforms with imxgpu2d are using imx-gpu-g2d.

Hope this clarifies things (a bit at least).

Regards,
Gary

[1] https://github.com/Freescale/meta-freescale/blob/hardknott/conf/machine/include/imx-base.inc#L228
[2] https://github.com/Freescale/meta-freescale/blob/hardknott/conf/machine/include/imx-base.inc#L362
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
