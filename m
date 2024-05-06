Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA0CC25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9202381F73;
	Mon,  6 May 2024 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwS5cH8ZBBvI; Mon,  6 May 2024 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77CA581F77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77CA581F77;
	Mon,  6 May 2024 18:01:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16B2F1BF276
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03B8C60774
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_z6wyWZb9ik for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71157605F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71157605F2
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71157605F2
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:01:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446I1BuY110630;
 Mon, 6 May 2024 13:01:11 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446I1BgW010545
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2024 13:01:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 13:01:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 13:01:10 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446I1A3w092557;
 Mon, 6 May 2024 13:01:10 -0500
Date: Mon, 6 May 2024 13:01:10 -0500
To: Bryan Brattlof <bb@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240506180110.c2fz34ezrvzuzf6z@dasso>
References: <20240429092326.3247116-1-p-bhagat@ti.com>
 <20240430145448.yhg6r64ohsfofeqv@bryanbrattlof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430145448.yhg6r64ohsfofeqv@bryanbrattlof.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715018471;
 bh=turZ7ni9ZLVwmxcCsrjo8B6UUJ7I+UMGBnWJyIxl6LY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=pSZNIq6Y1EZh4vgq74yhDhHUPd3DwFMV9KE7zqsG5Pd4QgVBP5nnGxMQe5M3xqLl6
 RbG7ofsGmHT7UB8RJU0R4Gf9W6anZZwSFPVOyMFGqJLUpUIh1g+iVGnQFo+RidDquC
 13p/r5k/t/48tQY5AQG1+vhykYsRyu96GfC+b6Dg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pSZNIq6Y
Subject: Re: [Buildroot] [RFC,
 1/1] configs/am62x-sk: Add fragment for TI tree integration
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Syed Mohammed Khasim <khasim@ti.com>,
 buildroot@buildroot.org, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Apr 30, 2024 at 09:54:48AM -0500, Bryan Brattlof via buildroot wrote:
> On April 29, 2024 thus sayeth Paresh Bhagat via buildroot:
> > This commit introduces a new fragment config aimed at integration of TI trees
> > into the existing configuration for am62x-sk. The fragment config is designed 
> > to be merged with the current ti_am62x_sk_defconfig, enabling transition from 
> > mainline to TI versions for U-boot and kernel.
> > 
> > The fragment config will be merged with existing ti_my_am62x_sk_defconfig
> > using merge-config.sh script present in support/kconfig using following
> > command.
> > 
> > ./support/kconfig/merge-config.sh configs/ti_am62x_sk_defconfig configs/ti_am62x_sk.config

This should be "merge_config.sh".

> > It effectively changes uboot and kernel source from mainline version to TI 
> > version hosted here
> > 
> > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.1.y
> > https://git.ti.com/cgit/ti-u-boot/ti-u-boot/?h=ti-u-boot-2023.04
> > 
> > Furthermore, as ti-uboot 2023.04 is used, kernel Image and dtb is expected 
> > in rootfs/boot/ and rootfs/boot/dtb/ti respectively. So add a new post-build
> > script to copy these files to desired location. 
> > 
> > Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> 
> Thanks for the patch. My worry is these changes will only be needed for 
> the brief time the 9.2 SDK is relevant. The 10.X SDK is just around the 
> corner and will break all of this with its new baseline.
> 
> It may be easier to keep these configs all in a custom BR2_EXTERNAL 
> overlay and keep buildroot pointed to pure sources of these packages

Yes Paresh also from my side thanks for the effort you put into this.
After spending some more time on this I tend to agree with Brian that
this should probably not be directly in the official tree to minimize
churn, plus keeping the official Buildroot upstream-only will motivate
us even more to make sure all our device support goes upstream...

All this being said, there is a very common "real world" customer need/
request for a Buildroot-based solution more closely aligned with TI's
official Yocto SDKs. Ideally I'd like to see us providing something via
BR2_EXTERNAL that is well maintained (like other vendors provide), but
until we can close on the best path forward I've updated my already-
existing E2E FAQ [1] to help customers today setting up such a TI Yocto
SDK v9.2 Baseline Equivalent by adding a simple patch to the tree by
themselves. I plan on maintaining this as needed to accommodate for new
SDK releases (and also so people don't always have to resolve merge
conflicts when applying that patch).

--
Andreas Dannenberg
Texas Instruments Inc

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1226815/faq-buildroot-support-for-sitara-am62x-am62ax-am62px-am64x-devices

> 
> ~Bryan
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
