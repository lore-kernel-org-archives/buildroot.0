Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BA2C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 14:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9155B60ACC;
	Tue, 30 Apr 2024 14:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUgomC8syrn3; Tue, 30 Apr 2024 14:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFABD60AA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFABD60AA8;
	Tue, 30 Apr 2024 14:54:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 601DA1BF330
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 14:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A40B4018E
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 14:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1KVy5ELtpHw for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 14:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7D5940187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D5940187
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7D5940187
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:54:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UEsnCW122708;
 Tue, 30 Apr 2024 09:54:49 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UEsngh085709
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Apr 2024 09:54:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 09:54:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 09:54:48 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UEsmi6072403;
 Tue, 30 Apr 2024 09:54:48 -0500
Date: Tue, 30 Apr 2024 09:54:48 -0500
To: Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240430145448.yhg6r64ohsfofeqv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240429092326.3247116-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429092326.3247116-1-p-bhagat@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714488889;
 bh=mBFABAeS57L3wvK38upiW9Lbxe3Q2zIJYzwU/rOanoM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dTuyrsi/aZmDz1sT4v97EDe9RAxDBvUqhOOpMAzGMBt5/yaTxpiPSs0yv7rnpFx6p
 YbSusKbmucsrtrQ5SnYu7HbztYYWeGxAdHAYMvzGZa24QAMz6wf0JYlRHPsAO8utZ8
 H9DJ6SKWZwQM0aRct3wL/HFc1z4vi5o2CuWYYMuI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dTuyrsi/
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Gyan Gupta <g-gupta@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Syed Mohammed Khasim <khasim@ti.com>,
 buildroot@buildroot.org, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On April 29, 2024 thus sayeth Paresh Bhagat via buildroot:
> This commit introduces a new fragment config aimed at integration of TI trees
> into the existing configuration for am62x-sk. The fragment config is designed 
> to be merged with the current ti_am62x_sk_defconfig, enabling transition from 
> mainline to TI versions for U-boot and kernel.
> 
> The fragment config will be merged with existing ti_my_am62x_sk_defconfig
> using merge-config.sh script present in support/kconfig using following
> command.
> 
> ./support/kconfig/merge-config.sh configs/ti_am62x_sk_defconfig configs/ti_am62x_sk.config
> 
> It effectively changes uboot and kernel source from mainline version to TI 
> version hosted here
> 
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.1.y
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/?h=ti-u-boot-2023.04
> 
> Furthermore, as ti-uboot 2023.04 is used, kernel Image and dtb is expected 
> in rootfs/boot/ and rootfs/boot/dtb/ti respectively. So add a new post-build
> script to copy these files to desired location. 
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Thanks for the patch. My worry is these changes will only be needed for 
the brief time the 9.2 SDK is relevant. The 10.X SDK is just around the 
corner and will break all of this with its new baseline.

It may be easier to keep these configs all in a custom BR2_EXTERNAL 
overlay and keep buildroot pointed to pure sources of these packages

~Bryan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
