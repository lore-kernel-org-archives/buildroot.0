Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ACCC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19CE2404A4;
	Mon, 19 Aug 2024 10:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6NT6VoG0bFK; Mon, 19 Aug 2024 10:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B9340492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B9340492;
	Mon, 19 Aug 2024 10:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D648E1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1F9E40492
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLdRGmyr6CTb for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28ACE40450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28ACE40450
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28ACE40450
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:01:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5F681C000A;
 Mon, 19 Aug 2024 10:01:22 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:01:21 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20240819120121.50ed89ad@booty>
In-Reply-To: <CH2PR12MB500412028C07F3C30A5DEDD5F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
 <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <D3BGZWZ19TUJ.3MA2J962PXN6E@collins.com>
 <CH2PR12MB500412028C07F3C30A5DEDD5F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724061683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2JPcpsbqdUFQETl6UGDzkTRXvMWVdNeNbLYWjarYso=;
 b=JXtwJ0HJW+w5GvWBWQdOgeTO260qohL1RY9QwgCg0sGLkKGecrGQyB4SvL1VzAuos9Mt5A
 9BKPDABMWSi8wS6KzccQgcsJNaPWcaFk9LB3qwC9i0oRVcVXv+liJiryHsR7oSjhhWGemV
 ZWhhJFjv81FjJy2xmG5tjZtkt/F1V3N+P1DnzrnYVNlrKVlfu49/hO3yCl99IjckXbZ6Be
 KMfF2EDGRA2y3Nz7LXhXr2m/zU32QnmFfdFDcfS8NovnVDRo0e+I1gRZYXbZ3jwx9tKzP4
 H1aj/MXt3XZvER33RybyZVCdcGeHzxJ5RYA3NAh4oAGhB3ZElfj7GAHWNLOnag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JXtwJ0HJ
Subject: Re: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nea, Michal, Brandon, Thomas, Peter,

On Fri, 9 Aug 2024 15:19:30 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Brandon,
> 
> > Hi Brandon,
> >  
> > > This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> > >
> > > Xilinx Evaluation Boards:
> > > configs/versal_vck190_defconfig
> > > configs/versal_vpk180_defconfig
> > > configs/zynq_microzed_defconfig
> > > configs/zynq_zc702_defconfig
> > > configs/zynq_zc706_defconfig
> > > configs/zynq_zed_defconfig
> > > configs/zynqmp_kria_kd240_defconfig
> > > configs/zynqmp_kria_kr260_defconfig
> > > configs/zynqmp_kria_kv260_defconfig
> > > configs/zynqmp_zcu102_defconfig
> > > configs/zynqmp_zcu104_defconfig
> > > configs/zynqmp_zcu106_defconfig  
> >  
> > > I attempted to boot this patch on a zcu106, but I get no output over the
> > > uart port from anything, U-Boot SPL, ATF, etc. So this board may be
> > > broken on master.  
> >  
> > > Can you verify if it works on your end?  
> >
> > I can help you with this problem.  It is because there are two different
> > versions of the zcu106 having different DDR memories.  This is because the
> > DDR that came on the revA version of the board became obsolete.
> >
> > I left the revA device tree in buildroot as I know this is the version of the
> > zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
> > the newer version of the zcu106.
> >
> > To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
> > correct spl psu_init routine will run.
> >
> > Please implement the following in your zcu106 defconfig:
> >
> > - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
> > + BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0
> >
> > This will build in the correct psu_init_gpl.c from the two choices below:
> > https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
> > https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA
> >
> > You can read about this issue for the zcu102 and zcu106 here:
> > https://support.xilinx.com/s/article/71961?language=en_US  
> 
> > Thank you! Switching to the rev1.0 devicetree does let my board boot.  
> 
> Great!
> 
> >
> > Do you have any opinions for how this can be better handled in buildroot to
> > support both versions of the zcu102 and zcu106?  
> 
> > My preference would be to having two defconfigs, as they are effectively
> > different boards. But given Thomas would prefer not adding new
> > defconfigs, documenting it in the defconfig as you did is a good idea.  
> 
> As I mentioned in my previous response, I will move this documentation to the
> readme.txt file.  It makes more sense there.

I agree the readme file seems the most appropriate.

> > At the moment, the older version of the zcu106 is supported and the newer
> > version of the zcu102 is supported in buildroot natively.  
> 
> > Would it be prudent to default the zcu106 to the newest revision? Is
> > there any idea of if the zcu106 revA or rev1.0 is more widely used?  
> 
> Now that I think about it, you are absolutely right.  Not only are all new
> boards using the rev1.0 DDR memories, but I have to believe the vast majority
> of boards out there are on the new memory at this point.
> 
> The only reason I kept the zcu106 on revA was because I knew that Peter's
> zcu106 has revA DDR memory.  That is probably not the best reason to keep the
> zcu106 defconfig on revA.  Sorry Peter!
> 
> So unless anyone objects, I plan to do the following.
> 
> 1. Migrate the zynqmp_zcu106_defconfig to rev1.0 DDR memory.
> 
> 2. Document the revA/rev1.0 issue in the board/zynqmp/readme.txt, so that
> users of the old boards have at least a chance of finding that they need to
> change the u-boot device_tree config for revA DDR memory.

Would it be possible to have a single psu_init_gpl.c that works for
both revisions, albeit with non-optimal performance for both? I don't
know what the differences are between the two revisions, but if it is a
matter of timings it should be possible.

Custom designs will use a custom psu_init_gpl.c anyway, so that
wouldn't affect performance of industrial products.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
