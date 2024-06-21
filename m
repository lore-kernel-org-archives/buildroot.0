Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C45AC2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 11:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65CE1413D2;
	Fri, 21 Jun 2024 11:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZpLCz9lJQ5P; Fri, 21 Jun 2024 11:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 156904016B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 156904016B;
	Fri, 21 Jun 2024 11:37:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAE0A1BF33B
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 11:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7D024016B
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 11:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-05JIExd0Vj for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 11:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=c-shilwant@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26B81400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B81400F2
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26B81400F2
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 11:37:48 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LBblhL024058;
 Fri, 21 Jun 2024 06:37:47 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LBbl8k002306
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Jun 2024 06:37:47 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 06:37:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 06:37:47 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.238])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LBbibD019572;
 Fri, 21 Jun 2024 06:37:44 -0500
Message-ID: <5e50a369-53bc-422d-8dca-491a3d25ce7d@ti.com>
Date: Fri, 21 Jun 2024 17:07:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <buildroot@buildroot.org>
References: <20240607090236.2858457-1-p-bhagat@ti.com>
Content-Language: en-US
In-Reply-To: <20240607090236.2858457-1-p-bhagat@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718969867;
 bh=SdDQyRAEHcUDiIf9WA5Tp2MJLUsdHDX63Siel3EieP8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=IH/1R3klGmehQl1WD0uE4cuFP0nufGVB3BSxoln0h9RziieQ7Rz7/PdWfdBj9eg7R
 XvhAR74mZRL0Z1cO1dauoKbOTZ1kG0P3AgyyyGJyyrs42FZGjMF6TfWKxdq8hJaDxi
 HwmivK1qjmS1efzj1MvP8f/X8po4wfoWWYWngvKo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=IH/1R3kl
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
From: Chirag Shilwant via buildroot <buildroot@buildroot.org>
Reply-To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
On 07/06/24 14:32, Paresh Bhagat wrote:
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



Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> Changes v2 -> v3:
>    - flexibilty -> flexibility (Suggested by Chirag Shilwant)
>
> Changes v1 -> v2:
>    - Fix whitespaces/indentation in Config.in file (Suggested by Bryan Brattlof)
>
>   boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
>   .../ti-k3-boot-firmware.mk                    |  2 +-
>   2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
> index d80bb4bdb3..1c2382f610 100644
> --- a/boot/ti-k3-boot-firmware/Config.in
> +++ b/boot/ti-k3-boot-firmware/Config.in
> @@ -5,3 +5,33 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE
>   	  This package downloads and installs the TI-specific ti-sysfw
>   	  and ti-dm firmware needed to boot TI K3 platforms (which
>   	  include AM62x, AM64x, AM65x and more).
> +
> +if BR2_TARGET_TI_K3_BOOT_FIRMWARE
> +choice
> +	prompt "ti-k3-boot-firmware version"
> +	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	help
> +	  Select the version of Ti k3 boot firmware you want to use
> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	bool "09.02.00.009"
> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
> +	bool "Custom version"
> +	help
> +	  This option allows to use a specific official version from
> +	  git.ti.org.
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
>   #
>   ################################################################################
>   
> -TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
> +TI_K3_BOOT_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_BOOT_FIRMWARE_VERSION))
>   TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
>   TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
>   TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
