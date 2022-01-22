Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100EFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A7D860AA3;
	Sat, 22 Jan 2022 13:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TTE7p6bqQs41; Sat, 22 Jan 2022 13:33:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F2B9606CB;
	Sat, 22 Jan 2022 13:33:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1251B1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB742404DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEvywwwIlIjM for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:33:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BB1B400D6
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:33:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6171240006;
 Sat, 22 Jan 2022 13:33:28 +0000 (UTC)
Date: Sat, 22 Jan 2022 14:33:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Vyacheslav Bocharov
 <adeep@lexina.in>
Message-ID: <20220122143327.7d1a1cf7@windsurf>
In-Reply-To: <20220118111457.2491318-1-adeep@lexina.in>
References: <20220118111457.2491318-1-adeep@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vyacheslav,

[Arnout, Yann, Peter: question for you below.]

On Tue, 18 Jan 2022 14:14:58 +0300
Vyacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:

> Firmware Image Package (FIP) sources to sign Amlogic SoC u-boot binaries
> in LibreELEC, Armbian and meta-meson, buildroot.
> 
> https://github.com/LibreELEC/amlogic-boot-fip
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>

Thanks for this contribution. I have a few small details below. But
apart from the small details: there is one very significant issue. The
LICENSE file says:

// Redistribution and use in source and binary forms, with or without
// modification is strictly prohibited without prior written permission
// from Amlogic.

So how can the contents of this repository be useful? OK, then can be
used locally for your own experiments. But for building an actual
device that you can ship/provide to others, using the contents of that
repository, because Amlogic does not even allow you to distribute the
contents of this repository.

So I am wondering if it's really reasonable to package this in
Buildroot.

Arnout, Yann, Peter: what do you think about this? See the license file
at https://github.com/LibreELEC/amlogic-boot-fip/blob/master/LICENSE
for the full text.


> diff --git a/package/amlogic-boot-fip/Config.in b/package/amlogic-boot-fip/Config.in
> new file mode 100644
> index 0000000000..ceb09f8247
> --- /dev/null
> +++ b/package/amlogic-boot-fip/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_AMLOGIC_BOOT_FIP
> +	 bool "amlogic-boot-fip"

Indentation is wrong here: it should be just one tab, but you have one
tab + one space. Make sure to run "make check-package" and fix the
coding style issues.

Also, you need:

	depends on BR2_TARGET_UBOOT

because this package depends on U-Boot being enabled.

> diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.hash b/package/amlogic-boot-fip/amlogic-boot-fip.hash
> new file mode 100644
> index 0000000000..5d6dd237e3
> --- /dev/null
> +++ b/package/amlogic-boot-fip/amlogic-boot-fip.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  cdf9d3872457c33a2755cc504f6b0560a62a6ee04437ac28e66623a345ed4936  amlogic-boot-fip-7ff0004e0e4d261ba81334a2f46302bd06704aca-br1.tar.gz

Please add the hash of the license file.

> diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.mk b/package/amlogic-boot-fip/amlogic-boot-fip.mk
> new file mode 100644
> index 0000000000..6f646ae871
> --- /dev/null
> +++ b/package/amlogic-boot-fip/amlogic-boot-fip.mk
> @@ -0,0 +1,37 @@
> +
> +################################################################################
> +#
> +# amlogic-boot-fip
> +#
> +################################################################################
> +
> +AMLOGIC_BOOT_FIP_VERSION = 7ff0004e0e4d261ba81334a2f46302bd06704aca
> +AMLOGIC_BOOT_FIP_SITE = https://github.com/LibreELEC/amlogic-boot-fip
> +AMLOGIC_BOOT_FIP_SITE_METHOD = git

Please use the Github macro. Replace the _SITE variable by:

AMLOGIC_BOOT_FIP_SITE = $(call github,LibreELEC,amlogic-boot-fip,$(AMLOGIC_BOOT_FIP_VERSION))

and drop the AMLOGIC_BOOT_FIP_SITE_METHOD variable.

> +AMLOGIC_BOOT_FIP_INSTALL_IMAGES = YES
> +AMLOGIC_BOOT_FIP_DEPENDENCIES = uboot
> +
> +AMLOGIC_BOOT_FIP_LICENSE = PROPRIETARY

Please add AMLOGIC_BOOT_FIP_LICENSE_FILES as there is a license file in
the repository (which contains the problematic clause)

> +AMLOGIC_BOOT_FIP_REDISTRIBUTE = NO
> +
> +AMLOGIC_BOOT_BINS += u-boot.bin.sd.bin

Just = instead of +=. But is this variable really needed? See below.

> +
> +define AMLOGIC_BOOT_FIP_BUILD_CMDS
> +    mkdir -p $(@D)/fip
> +    cp $(BINARIES_DIR)/u-boot.bin $(@D)/fip/bl33.bin
> +    cd "$(@D)"; ./build-fip.sh $(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)) $(@D)/fip/bl33.bin $(@D)/fip

Please use tabs for indentation. Is copying $(BINARIES_DIR)/u-boot.bin
to $(@D)/fip/bl33.bin if it gets passed as argument to build-fip.sh ?

Would something like:

	cd $(@D) && \
		./build-fip.sh \
			$(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)) \
			$(BINARIES_DIR)/u-boot.bin \
			$(@D)/fip

work ?
		
> +endef
> +
> +ifeq ($(BR2_PACKAGE_AMLOGIC_BOOT_FIP),y)

Use:

ifeq ($(BR2_PACKAGE_AMLOGIC_BOOT_FIP)$(BR_BUILDING),yy)

so that this check is only done when building.

> +ifeq ($(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)),)
> +$(error No board u-boot firmware config name specified, check your BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD setting)
> +endif # qstrip BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD
> +endif
> +
> +define AMLOGIC_BOOT_FIP_INSTALL_IMAGES_CMDS
> +	$(foreach f,$(AMLOGIC_BOOT_BINS), \
> +			cp -dpf "$(@D)/fip/$(f)" "$(BINARIES_DIR)/"
> +	)

Why have a loop with a $(AMLOGIC_BOOT_BINS) if there's only one file to
copy?

Just:

	$(INSTALL) -D -m 0644 $(@D)/fip/u-boot.bin.sd.bin $(BINARIES_DIR)/u-boot.bin.sd.bin

I would have fixed myself all those small details, but the
licensing/redistribution restriction seems to be a major issue to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
