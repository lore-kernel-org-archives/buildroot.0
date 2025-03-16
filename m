Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776AEC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 18:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C689282070;
	Sun, 16 Mar 2025 18:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrdYnkBX7mfI; Sun, 16 Mar 2025 18:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B47F8206E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B47F8206E;
	Sun, 16 Mar 2025 18:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53550D5
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 18:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4326882062
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 18:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXS65211buUh for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 18:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C1F682060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C1F682060
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C1F682060
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 18:12:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 03F4813F8E1;
 Sun, 16 Mar 2025 19:11:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 19:11:54 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 19:11:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-7-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-7-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e97fba5fb8387c2e671d5e47aeaac1d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742148721;
 bh=56Jw99pTf4R6jRdvs6pI9XfrjLWdRlM7hLJJmDCxKog=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LO3dorRAv+g2Q/OPFgdyPvmukb5JhS5zLof9KBPC99ULPYl4/vKiBvpq1wGw6f3e2
 2gcaRfUhgeeEXOB8lyHQ4JAlhp9sb6PEAR316idY8rsninFfNyBJvZPFu0o9PU2zgq
 KKuEH+hE1MEicyhO0vCTConmGP5rG2EtN/XOk9s4XAvl32+YffRjkHwLBIq/H9PAu1
 +6TZy1MF3UxRsn57sweaADFY9/qne7wRgVIvzm92EYe+tK6mO7zpeMxwE8GQb+0UjR
 Zdmpp+PYdm5QsdT1pQmSWaYHpr4e2ltr0hpizLsbJQg309g2WfhDL3DjiSds2lCVmw
 QCF7AmG1/G6OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LO3dorRA
Subject: Re: [Buildroot] [PATCH 06/15] package/qoriq-mc-utils: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On 02/03/2025 22:52, Vladimir Oltean wrote:
> The configuration files for the MC firmware binary are distributed
> through a separate repository on GitHub, and need a different package.
> They are licensed differently than the firmware itself, and unlike the
> firmware, they are customizable.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

[...]

> diff --git a/package/qoriq-mc-utils/Config.in 
> b/package/qoriq-mc-utils/Config.in
> new file mode 100644
> index 000000000000..45dfcdc8e0a0
> --- /dev/null
> +++ b/package/qoriq-mc-utils/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_QORIQ_MC_UTILS
> +	bool "qoriq-mc-utils"
> +	help
> +	  The Management Complex (MC) is a key component of the
> +	  networking subsystem named DPAA2 (Data Path Acceleration
> +	  Architecture, second version) in some NXP Layerscape SoCs.
> +
> +	  The MC firmware is configured through two distinct files
> +	  named DPL and DPC, which are customizable by the end user.
> +	  Example configuration files for NXP reference boards are
> +	  distributed through this package, and are frequently patched
> +	  to produce the configuration required in other scenarios.
> +
> +	  https://github.com/nxp-qoriq/mc-utils
> +	  # sign in required
> +	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
> +
> +if BR2_PACKAGE_QORIQ_MC_UTILS
> +
> +config BR2_PACKAGE_QORIQ_MC_UTILS_DPC
> +	string "Data Path Configuration (DPC) file"
> +	help
> +	  The DPC file contains the settings defining the behavior
> +	  of the MC firmware. Its source code follows the device
> +	  tree syntax and is compiled to a device tree blob, which
> +	  is the file that must be specified here.

If the DPC file is mandatory, could you add a note about that here?
(and possibly give an example?)

> +
> +config BR2_PACKAGE_QORIQ_MC_UTILS_DPL
> +	string "Data Path Layout (DPL) file"
> +	help
> +	  The DPL file contains a description of the initial
> +	  networking objects created by the MC firmware when it boots.
> +	  Its source code follows the device tree syntax and is
> +	  compiled to a device tree blob, which is the file that
> +	  must be specified here.

Same comment here as for DPC.

> +
> +endif
[...]
> diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk 
> b/package/qoriq-mc-utils/qoriq-mc-utils.mk
> new file mode 100644
> index 000000000000..d4fc5e27385e
> --- /dev/null
> +++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# qoriq-mc-utils
> +#
> +################################################################################
> +
> +QORIQ_MC_UTILS_VERSION = 10.39.0
> +QORIQ_MC_UTILS_SITE = $(call 
> github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
> +QORIQ_MC_UTILS_LICENSE = BSD-3-Clause

Trying to build qoriq-mc-utils in the reference docker image
fails. For example, from a configuration enabling the package,
the command:

     utils/docker-run make qoriq-mc-utils

fails with error:

     >>> qoriq-mc-utils 10.39.0 Building
     /usr/bin/make -j21 -C 
/home/user/buildroot/output/build/qoriq-mc-utils-10.39.0/config/
     make[1]: Entering directory 
'/home/user/work/buildroot/output/build/qoriq-mc-utils-10.39.0/config'
     dtc -q -I dts -O dtb la1575a/LA1575A-WE-RDB/dpc.dts -o 
la1575a/LA1575A-WE-RDB/dpc.dtb
     make[1]: dtc: No such file or directory

This is because mc-utils is using dtc without declaring the dependency.
See:
https://github.com/nxp-qoriq/mc-utils/blob/mc_release_10.39.0/config/Makefile

So you should add here:

QORIQ_MC_UTILS_DEPENDENCIES = host-dtc

> +QORIQ_MC_UTILS_INSTALL_IMAGES = YES
> +QORIQ_MC_UTILS_INSTALL_TARGET = NO
> +
> +define QORIQ_MC_UTILS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/config/

You will then need to add the Buildroot host path during the
make invocation. Here, we should have:

     PATH=$(BR_PATH) $(MAKE) -C $(@D)/config/

> +endef
> +
> +define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D $(@D)/config/$(call 
> qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC)) $(BINARIES_DIR)/dpc.dtb
> +	$(INSTALL) -D $(@D)/config/$(call 
> qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL)) $(BINARIES_DIR)/dpl.dtb

The _INSTALL_IMAGES_CMDS fails if either
BR2_PACKAGE_QORIQ_MC_UTILS_DPC, or BR2_PACKAGE_QORIQ_MC_UTILS_DPL
are empty, which is their default in Kconfig.

If it is really mandatory to have values set for those
configuration variables, maybe you could add an explicit error message?
See for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk#L30

> +endef
> +
> +$(eval $(generic-package))

Can you send an updated version of the patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
