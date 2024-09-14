Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C77C021B3
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F9D81F2F;
	Sat, 14 Sep 2024 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hg6miqP2QNxE; Sat, 14 Sep 2024 20:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1850881F3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1850881F3A;
	Sat, 14 Sep 2024 20:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9B961BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E402A40640
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44z7qgIaEdz5 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73A0B403B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A0B403B6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73A0B403B6
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:20:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ADD020002;
 Sat, 14 Sep 2024 20:20:33 +0000 (UTC)
Date: Sat, 14 Sep 2024 22:20:32 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240914222032.3fee5e2e@windsurf>
In-Reply-To: <20240909182103.3667296-3-niklas.cassel@wdc.com>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726345234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Wx/WvYzSfTvAUnD+U49/6fW24EVxMh/ieDut/m+URk=;
 b=LBW3Job9fZ6HDi8gv53f0yL4be+6C9y7fTDsih5Aj8xN2D5DiTgBHd7xP0j2++ivHtJCEi
 0y7eE8TynmUtD9m4nrYUZBW74lvvXeT5QkeRj3t+5hhzQGaMJbO6G5fhI4l0D7HUdZibXY
 ittVRIdpuV+rDHdOfnSDPZZFqELE6+sZwJx0zb9ME8W6jxcljGWUmHmAxAvvFHwxXYCnyK
 knQwn8j2czo+NS51IGPazjtmB5xBulHLjzhSCYj/FOwtO4PwNGzfx3vP7Z70HQZ6ROki9d
 9mC29oVB1IYK0/cgZP/e2OWss/B18CY7X73tOYQJXC4rsqvxlCWC6letxpXDIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LBW3Job9
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

On Mon,  9 Sep 2024 20:21:03 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> Having the uboot environment defined on the SD card allows the user to
> use the uboot setenv and saveenv commands to make persistent changes
> (e.g. to change the boot order, or to set a server IP for PXE boot).
> 
> Since the SD card environment is empty by default, initialize it using
> the BR2_TARGET_UBOOT_INITIAL_ENV (output/target/etc/u-boot-initial-env),
> which contains the default environment for our board (extracted from the
> built uboot binary).
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Thanks for this patch! Comments below.

> diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
> index 43bb65bdd9..cd6c4e2dd4 100644
> --- a/board/radxa/rock5b/genimage.cfg
> +++ b/board/radxa/rock5b/genimage.cfg
> @@ -9,6 +9,14 @@ image sdcard.img {
>  		in-partition-table = "false"
>  		image = "u-boot-rockchip.bin"
>  		offset = 32K
> +		size = 16352K # 16MB - 32KB

I believe this size parameter is not really useful. Indeed, the next
partition has offset = 16 MB, so if the image in the previous partition
is too large, genimage will complain.

And in fact, I believe we don't care about the offset of the env
partition, see below.

> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index b88d8c5da3..50f58d379d 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -15,6 +15,8 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
> +BR2_TARGET_UBOOT_INITIAL_ENV=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> @@ -46,6 +48,10 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_DTC=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="output/target/etc/u-boot-initial-env"

This won't work because the output directory is not always output/. But
I believe this is useless, because you're creating an image of what is
the default environment. So basically, you should instead not create an
environment image at all: just tell U-Boot that the environment is at
offset XYZ (or even better, in partition X). The environment partition
will contain nothing or garbage, so at the first boot, U-Boot will use
its built-in environment itself, and at the first "saveenv", it will
save the environment to the designated partition.

This will simplify your changes while preserving the features you're
looking for. Could you have a look at implementing those suggestions?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
