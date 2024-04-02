Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BA0CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A475E60BE9;
	Tue,  2 Apr 2024 21:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBFkb26pUBrw; Tue,  2 Apr 2024 21:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BC60600CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC60600CA;
	Tue,  2 Apr 2024 21:03:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B161BF30C
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1120D41587
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_B54DaQ-qCM for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBFE941581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFE941581
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBFE941581
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:03:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 432L35vd123881;
 Tue, 2 Apr 2024 16:03:05 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 432L35aN073920
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Apr 2024 16:03:05 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 Apr 2024 16:03:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 Apr 2024 16:03:04 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 432L34M8051451;
 Tue, 2 Apr 2024 16:03:04 -0500
Date: Tue, 2 Apr 2024 16:03:04 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240402210304.n332blt4vhp6zewp@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712091785;
 bh=1oQs0pGJYbULjQdNDC7PzVvWXxsxgaJnz2I1fw7bE04=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=C1JF7zdnqJL0Hv0cgjog9Y7hUaK4/exOnVzQbpppnhlalHY171oDvMzVijm65pLr2
 4DnWVqjXKBCOU8F+f8RiZmGpZzcxzMVxj3ZI6SveUvG+Rp6HGK3jUURANs2PlmDH5s
 eIVNlwMawW7qyi1LauJZpPEXLiA8U5XTfiiHW4+E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=C1JF7zdn
Subject: Re: [Buildroot] [PATCH v10 00/12] Add support for AM62x-SK HS-FS
 devices
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, "Yann E . Morin" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On March 30, 2024 thus sayeth Dario Binacchi:
> The SK-AM62B-P1 is the newest version of SK-AM62 which includes
> high-security field-securable (HS-FS) silicon to optionally customize keys
> and encryption for security applications.
> This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS option,
> which, however, was buggy. This series fixes the errors and bumps the Linux
> kernel and U-Boot required for such a new device.
> 
> Furthermore, this version complete the series by updating the
> ti_am64x_sk_defconfig as requested by Romain Naour:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240224205654.1546744-17-dario.binacchi@amarulasolutions.com/
> I have successfully executed compilation tests for all possible combinations of platform and security type:
> am62x -> GP, HS, HS-FS
> am64x -> GP, HS, HS-FS
> 
> The AM62x HS-FS configuration has also been tested on the SK-AM62B-P1 board.
> 
> Version 9 has merged the first 10 patches into the mainline. This version
> therefore contains the remaining patches to which the patch suggested by
> Yann E. Morin has been added ("boot/ti-k3-r5-loader: drop hash for version
> 2022.10" [1]), and has removed the patch "boot/ti-k3-image-gen: remove
> package", which is not strictly required by the series and does not cause
> regressions.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240304153253.732708-6-dario.binacchi@amarulasolutions.com
> 
> Dario Binacchi (12):
>   boot/ti-k3-r5-loader: drop hash for version 2022.10
>   boot/ti-k3-r5-loader: set binman environment
>   boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
>   package/ti-k3: move TI_K3_{SECTYPE,SOC} out of the image-gen scope
>   package/ti-k3: disable HS-FS for AM65 SOC
>   boot/ti-k3/ti-k3-r5-loader: install tiboot3.bin
>   configs/ti_am62x_sk_defconfig: bump U-Boot version to 2024.01
>   configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.18
>   board/ti/am62x-sk: generalize post-build.sh
>   board/ti/am62x-sk: move post-{build,image}.sh to board/ti/common/am6xx
>   configs/ti_am64x_sk_defconfig: bump U-Boot version to 2024.01
>   configs/ti_am64x_sk_defconfig: bump Linux version to 6.6.18

Tested-by: Bryan Brattlof <bb@ti.com>

I built and tested these on the HS-FS and GP variants of AM62x as well 
as the GP variant of the AM64x

These look great to me. Thanks for the dedication getting these merged.

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
