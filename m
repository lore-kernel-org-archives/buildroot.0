Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64199C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 06:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D185B40D6B;
	Fri,  9 Aug 2024 06:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXW3PtmNPNx6; Fri,  9 Aug 2024 06:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E9C40D77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E9C40D77;
	Fri,  9 Aug 2024 06:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2D7F1BF294
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 06:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9078960E39
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 06:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCXz0AoRTRa0 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 06:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E613260E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E613260E38
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E613260E38
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 06:30:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2D09FF807;
 Fri,  9 Aug 2024 06:30:14 +0000 (UTC)
Date: Fri, 9 Aug 2024 08:30:13 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20240809083013.05d0d0fc@windsurf>
In-Reply-To: <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
 <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723185015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6nW8hzjTXIjke9bDqsa/dTxNN0mTtCxV30pK0wMtGA=;
 b=dtNlMhKrX6nO7Xb6bFUlo3Fawp0r0m48umJ/7b0bGELPJ4At2kF5wxCYlyrprCnClebs7x
 jYu6HOvVCCuCTYJJaIQvYrbcw4LooazFOWT4y+axxKC50XNy6CFOqREFhFsE0iAe9fdqQE
 tkaG7Pk3v9hAHOaswWSd+AQJM7gb+a3fWiz0NqAomO/9Hbjm8RnOKFN3wpzc1wf75B8WnN
 qWcCJb3FGv2RRxtSjvXg/wLMvn/bhU/x4S16oB/Sc/281yEaUDoA1ov0/Ml74h4vY1tjGf
 3YSddfNPw5KYIr1jLFEus5/tbmF7y0GjCVQCoT3QehRQO/DwQqjYobvN1kYBJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dtNlMhKr
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Aug 2024 03:52:30 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I can help you with this problem.  It is because there are two different
> versions of the zcu106 having different DDR memories.  This is because the
> DDR that came on the revA version of the board became obsolete.
> 
> I left the revA device tree in buildroot as I know this is the version of the
> zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
> the newer version of the zcu106.
> 
> To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
> correct spl psu_init routine will run.
> 
> Please implement the following in your zcu106 defconfig:
> 
> - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
> + BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0
> 
> This will build in the correct psu_init_gpl.c from the two choices below:
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA
> 
> You can read about this issue for the zcu102 and zcu106 here:
> https://support.xilinx.com/s/article/71961?language=en_US
> 
> Do you have any opinions for how this can be better handled in buildroot to
> support both versions of the zcu102 and zcu106?

The only nice option from a Buildroot perspective would be to runtime
detect the board revision in U-Boot and apply the correct DDR
configuration accordingly. This way a single image would work on both
revisions. Having two full defconfigs to address those two board
revisions would be a bit annoying.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
