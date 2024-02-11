Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31ACC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C4D481F55;
	Sun, 11 Feb 2024 22:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cB6hDOnJg3wC; Sun, 11 Feb 2024 22:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3182281F5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3182281F5E;
	Sun, 11 Feb 2024 22:08:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6F01BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9516961024
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPxgpuGtRSQV for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:08:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20B486100A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B486100A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20B486100A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:08:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE001FF803;
 Sun, 11 Feb 2024 22:08:07 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:08:07 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240211230807.6007763d@windsurf>
In-Reply-To: <20231214161855.1738492-1-dario.binacchi@amarulasolutions.com>
References: <20231214161855.1738492-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707689288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI0gYR552H+JwizwCUjNRj49dMo901py0d7EuQia9zc=;
 b=IY4DZahMmfDJpdHNLF/knFQeSPuzgkOgLv2Rd4bWOc4v7QVxnYChMyrNlSSMKHYhMEJjBB
 2RYdQxAa8mhkBQC5BPJyhrF29RntQ5E/Exhk3dNHGUrpELR05UEvbTi/unPSsx0jDMSj6K
 mQ1sm3hikQukRhogwwBwB7WevfXyJi5fOZn17ER2CHk09cMLMI6TJ6xLoqu0E1ELxuDZd8
 7p4w766EIrnkFwXtuPPp0tLSuezYtFHk3IUnlqgBHAHR2PzvgGfjM/Zbe62nDdwKV9At0i
 IbPZmyJScWRHJeatYJhOoYMtQZkcPUjJmGOg1l55xtM7KMCG3K5s0NJ8myE4HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IY4DZahM
Subject: Re: [Buildroot] [PATCH v2 1/1]
 configs/imx6ulz_bsh_smm_m2_defconfig: new defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Thu, 14 Dec 2023 17:18:54 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> BSH SMM M2 (SystemMaster M2) Board is an add-on board which provides
> input and output interfaces to a dedicated carrier board. It is designed
> mainly to provide graphical/video and connectivity interfaces to the
> appliance.
> 
> Board support package includes the following components:
> - mainline Linux kernel 6.1.68
> - mainline U-Boot 2023.10
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I am sorry to provide this feedback so late, but there is one thing to
improve in this submission:

>  board/bsh/imx6ulz-bsh-smm-m2/linux.config  | 415 +++++++++++++++++++++

This defconfig is too long and clearly contains stuff that is useless.
Could you review it and clean it up?


> +CONFIG_WL12XX=m
> +CONFIG_WL18XX=m

Need both of these?

> +CONFIG_WLCORE_SDIO=m
> +# CONFIG_WILINK_PLATFORM_DATA is not set
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_INPUT_EVBUG=m
> +CONFIG_KEYBOARD_GPIO=y
> +CONFIG_KEYBOARD_SNVS_PWRKEY=y
> +CONFIG_KEYBOARD_IMX=y
> +CONFIG_MOUSE_PS2=m
> +CONFIG_MOUSE_PS2_ELANTECH=y
> +CONFIG_INPUT_TOUCHSCREEN=y
> +CONFIG_TOUCHSCREEN_ADS7846=y
> +CONFIG_TOUCHSCREEN_AD7879=y
> +CONFIG_TOUCHSCREEN_AD7879_I2C=y
> +CONFIG_TOUCHSCREEN_ATMEL_MXT=y
> +CONFIG_TOUCHSCREEN_DA9052=y
> +CONFIG_TOUCHSCREEN_EGALAX=y
> +CONFIG_TOUCHSCREEN_GOODIX=y
> +CONFIG_TOUCHSCREEN_ILI210X=y
> +CONFIG_TOUCHSCREEN_MAX11801=y
> +CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
> +CONFIG_TOUCHSCREEN_MC13783=y
> +CONFIG_TOUCHSCREEN_TSC2004=y
> +CONFIG_TOUCHSCREEN_TSC2007=y
> +CONFIG_TOUCHSCREEN_STMPE=y
> +CONFIG_TOUCHSCREEN_SX8654=y

So many touchscreen drivers?

> +CONFIG_SPI=y
> +CONFIG_SPI_FSL_QUADSPI=y
> +CONFIG_SPI_GPIO=y
> +CONFIG_SPI_IMX=y
> +CONFIG_SPI_SPIDEV=y
> +CONFIG_SPI_SLAVE=y

You're using slave SPI?

> +CONFIG_SPI_SLAVE_TIME=y
> +CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
> +CONFIG_PTP_1588_CLOCK=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_MXC=y
> +CONFIG_GPIO_MAX732X=y
> +CONFIG_GPIO_PCA953X=y
> +CONFIG_GPIO_PCF857X=y
> +CONFIG_GPIO_STMPE=y
> +CONFIG_GPIO_74X164=y

All those GPIO drivers are needed?

> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_BRCMSTB=y

A reset driver for broadcom platform?

> +CONFIG_MFD_DA9052_I2C=y
> +CONFIG_MFD_DA9062=y
> +CONFIG_MFD_DA9063=y
> +CONFIG_MFD_MC13XXX_SPI=y
> +CONFIG_MFD_MC13XXX_I2C=y
> +CONFIG_MFD_RN5T618=y
> +CONFIG_MFD_STMPE=y
> +CONFIG_MFD_WM8994=y

All those MFD devices?

> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_REGULATOR_ANATOP=y
> +CONFIG_REGULATOR_DA9052=y
> +CONFIG_REGULATOR_DA9062=y
> +CONFIG_REGULATOR_DA9063=y
> +CONFIG_REGULATOR_GPIO=y
> +CONFIG_REGULATOR_LTC3676=y
> +CONFIG_REGULATOR_MC13783=y
> +CONFIG_REGULATOR_MC13892=y
> +CONFIG_REGULATOR_PFUZE100=y
> +CONFIG_REGULATOR_RN5T618=y

All those regulators?

etc. Please review globally :-)

> diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
> new file mode 100644
> index 000000000000..b12f36b84e65
> --- /dev/null
> +++ b/configs/imx6ulz_bsh_smm_m2_defconfig
> @@ -0,0 +1,42 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_KERNEL_HEADERS_6_1=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Why is C++ enabled?

> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ulz-bsh-smm-m2"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

Why is this option enabled?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
