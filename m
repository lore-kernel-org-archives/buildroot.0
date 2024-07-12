Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDB3C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B05DA40592;
	Fri, 12 Jul 2024 07:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ep18MApKKMGG; Fri, 12 Jul 2024 07:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8021641206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8021641206;
	Fri, 12 Jul 2024 07:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DCA01BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B906607BC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOQ-PojjB2nR for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BD296070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD296070C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BD296070C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:20:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 522F91C000B;
 Fri, 12 Jul 2024 07:20:41 +0000 (UTC)
Date: Fri, 12 Jul 2024 09:20:41 +0200
To: Andy Yan <andyshrk@163.com>
Message-ID: <20240712092041.38bab6ac@windsurf>
In-Reply-To: <20240628121740.2810640-1-andyshrk@163.com>
References: <20240628121740.2810640-1-andyshrk@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720768842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t77uyD/aiEttBvmAvm4PV2ou0CXR4Gi+FxqIxKMmo90=;
 b=euXYq7m9jIqWHwW2wlwlgT1WHJiSVLHktkHCig69l3VHL3LPKBUb0VlxfbJ2np3d0cV+gF
 S4tcMWC4qop9l0yJCOQO7XLETMzZqZXPsE2K4zUcpvAH29uZRW9ln2Jl1hoQuTeL7zKcI6
 P2lAdnZMjjubLOFQsriXv2RM1Ycqz7Xb+VDxqQ71KsYlVD2RqY0tANviETk/p4KmJ0oiup
 mHUgBHXXgFy65IlRlrOKP55B/BJcfUaVd8CGYK+JlyhrqFxLeKgyi3d5jESEsyt4hxKTQZ
 IXrVflSHPa9TYADOdmGZYc3WontWaVfpTzQEsZp1dPGYOwN1G8XeuxZPA4qvsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=euXYq7m9
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add Arm mali CSF
 firmwares
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andy,

Thanks for your patch, I applied it after adjusting some small things.
See below.

On Fri, 28 Jun 2024 20:17:40 +0800
Andy Yan <andyshrk@163.com> wrote:

> +menu "GPU Firmware"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
> +	bool "Arm Mali CSF firmware"
> +	help
> +	  Firmware files for Arm Mali 10th generation GPU
> +          needed by the linux panthor kernel driver.

This last line was indented with spaces instead of a tab. This was
pointed out by "make check-package":

WARNING: package/linux-firmware/Config.in:700: help text: <tab><2 spaces><62 chars> (https://nightly.buildroot.org/#writing-rules-config-in)

> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 13dbc6d98c..6a1b99f438 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -883,6 +883,11 @@ LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ivsc
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF),y)
> +LINUX_FIRMWARE_DIRS += arm

I wasn't a big fan of including the full arm/ directory, because while
it for now only contains this GPU firmware, it might contain other
things in the future. Since the panthor driver loads this:

        snprintf(fw_path, sizeof(fw_path), "arm/mali/arch%d.%d/%s",
                 (u32)GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id),
                 (u32)GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id),
                 CSF_FW_NAME);

I changed linux-firmware.mk to this:

LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin

so that it only installs the CSF firmware.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
