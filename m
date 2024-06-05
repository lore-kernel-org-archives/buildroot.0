Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C627C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20A81419A1;
	Wed,  5 Jun 2024 17:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Csyn3M5pu7vd; Wed,  5 Jun 2024 17:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6CD64199A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6CD64199A;
	Wed,  5 Jun 2024 17:02:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C57591BF5B5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B25D641996
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cI9E9XtLtn3G for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DB8E419A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB8E419A0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DB8E419A0
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:02:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 455H26O0089446;
 Wed, 5 Jun 2024 12:02:06 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 455H26e1039712
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 12:02:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 12:02:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 12:02:05 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 455H25XA079671;
 Wed, 5 Jun 2024 12:02:05 -0500
Date: Wed, 5 Jun 2024 12:02:05 -0500
To: Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240605170205.ac4cmm7q5ondqgiq@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240604061556.3167647-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604061556.3167647-1-p-bhagat@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717606926;
 bh=T/pCH2DWa+bOrWGLy5hKUU1tcldqSR9YMaAGd+XHdIs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=kzIlJQtneJQlYYOXR9ZW4RBI3aPZNOcmcw3vBSpFewsnSEYfZph6ExHG6PzM9ktU/
 poZ3DPofegQvcuT+WUliJsUs2BUAgp24B8Dqwd9+7i4PQYixPhFLQeKyPTZjtpFfVM
 VJtaGOKi6xySw4Icblvnb5MGjbgH7E+AfKxYdfCE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=kzIlJQtn
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: Add config
 option to specify version
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

Hi Paresh,

On June  4, 2024 thus sayeth Paresh Bhagat via buildroot:
> Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
> fixed in mk file. Introduce a new config option 
> BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version
> for ti-k3-boot-firmware using menuconfig.
> 
> This provides greater flexibilty for users to select different versions of
> ti-k3-boot-firmware without modfying the build script directly.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
>  .../ti-k3-boot-firmware.mk                    |  2 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 

Reviewed-by: Bryan Brattlof <bb@ti.com>

Looks great to me! I will say the process is starting internally to move 
away from this linux-firmware fork in favor for sending things to 
linux-firmware directly. My hope is we can begin deprecating this 
package in a few months depending on how things go. 

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
