Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF9EC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2635460889;
	Fri,  7 Jun 2024 20:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTj0UkQpdudh; Fri,  7 Jun 2024 20:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB1B60771
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB1B60771;
	Fri,  7 Jun 2024 20:02:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8E31BF475
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94131427F2
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hh0RfLhyDr35 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77DFA427EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DFA427EF
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77DFA427EF
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:02:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457K2JNF014663;
 Fri, 7 Jun 2024 15:02:19 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457K2JaI024541
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2024 15:02:19 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 15:02:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 15:02:18 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457K2IIA020188;
 Fri, 7 Jun 2024 15:02:18 -0500
Date: Fri, 7 Jun 2024 15:02:18 -0500
To: Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240607200218.riixzemkxg2mv2yl@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240607090236.2858457-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607090236.2858457-1-p-bhagat@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717790539;
 bh=I3FJcD2FRO1QYKtjkWenGOMUr7KlOWB9Ec4xUCgxn4k=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=lr4uG9oAsdFhrf+U3+8g1SKk+47qASVx0gGPxUFrZ4SfEvOFVktMEZr2bUacK30cw
 BIctQLkdLWmpUF33OWq0nRHZ/bOQNL5nAT4HG0MpnZ05bVojFTmTeTOUH1Q2zIHe52
 WJ5tr5ziLBnVovsFUS/E0v42ag8JE/DDxCq6xibY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=lr4uG9oA
Subject: Re: [Buildroot] [PATCH v3] boot/ti-k3-boot-firmware: Add config
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

On June  7, 2024 thus sayeth Paresh Bhagat via buildroot:
> Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
> fixed in mk file. Introduce a new config option 
> BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version 
> for ti-k3-boot-firmware using menuconfig.
> 
> This provides greater flexibility for users to select different versions of
> ti-k3-boot-firmware without modfying the build script directly.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> 
> ---
> Changes v2 -> v3:
>   - flexibilty -> flexibility (Suggested by Chirag Shilwant)
> 
> Changes v1 -> v2:
>   - Fix whitespaces/indentation in Config.in file (Suggested by Bryan Brattlof)
> 
>  boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
>  .../ti-k3-boot-firmware.mk                    |  2 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 

Thanks for fixing the white-space stuff

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
