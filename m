Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362DBC3271E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC42C400FE;
	Fri,  5 Jul 2024 20:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzplFqKaDA7A; Fri,  5 Jul 2024 20:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F23F404FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F23F404FC;
	Fri,  5 Jul 2024 20:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83AB61BF28F
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B8C380AAA
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 20:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQTFLGRP-okn for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 20:44:13 +0000 (UTC)
X-Greylist: delayed 1046 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 05 Jul 2024 20:44:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20A2C80AA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A2C80AA2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20A2C80AA2
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 20:44:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 465KQkC0096552;
 Fri, 5 Jul 2024 15:26:46 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 465KQkAF030069
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Jul 2024 15:26:46 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jul 2024 15:26:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jul 2024 15:26:45 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 465KQj0W012507;
 Fri, 5 Jul 2024 15:26:45 -0500
Date: Fri, 5 Jul 2024 15:26:45 -0500
To: Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240705202645.qvockoguuvtvju35@dasso>
References: <20240607090236.2858457-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607090236.2858457-1-p-bhagat@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1720211206;
 bh=/buoVLpLX1F6cwg63YfHivi4PzSEXP7kaYpOnulfK6c=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=cV38zXlm5HFPstFWgILvV0koMkrcKAMMvgzUL36XH6dfHnF3zAm5aoZG+RWVrwDfE
 6tFecXU8KD5guDw5O+FBeiIX1TwEaWJAp1RFV6qVMUhJmKAIJtap4nstHZiL/vet+W
 cIIYrknVtePcVWRa7PbU22j9aHHj63QF8h0MYfTg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=cV38zXlm
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Gyan Gupta <g-gupta@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, buildroot@buildroot.org,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Paresh,
some quick feedback below...

On Fri, Jun 07, 2024 at 02:32:36PM +0530, Paresh Bhagat via buildroot wrote:
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
> diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
> index d80bb4bdb3..1c2382f610 100644
> --- a/boot/ti-k3-boot-firmware/Config.in
> +++ b/boot/ti-k3-boot-firmware/Config.in
> @@ -5,3 +5,33 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE
>  	  This package downloads and installs the TI-specific ti-sysfw
>  	  and ti-dm firmware needed to boot TI K3 platforms (which
>  	  include AM62x, AM64x, AM65x and more).
> +
> +if BR2_TARGET_TI_K3_BOOT_FIRMWARE
> +choice
> +	prompt "ti-k3-boot-firmware version"
> +	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	help
> +	  Select the version of Ti k3 boot firmware you want to use

Ti k3 -> TI K3

> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	bool "09.02.00.009"
> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
> +	bool "Custom version"
> +	help
> +	  This option allows to use a specific official version from
> +	  git.ti.org.

git.ti.org -> git.ti.com

Reviewed-by: Andreas Dannenberg <dannenberg@ti.com>


> +
> +endchoice
> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION_VALUE
> +	string "Custom ti-k3-boot-firmware version"
> +	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_VERSION
> +	string
> +	default "09.02.00.009"     if BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION_VALUE \
> +				if BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
> +
> +endif
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> index 9332732ad4..350381ebbe 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
> +TI_K3_BOOT_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_BOOT_FIRMWARE_VERSION))
>  TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
>  TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
>  TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
