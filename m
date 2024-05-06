Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A145C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A20A81F4D;
	Mon,  6 May 2024 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnRGobMCwacJ; Mon,  6 May 2024 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18FB681F51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18FB681F51;
	Mon,  6 May 2024 19:51:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 837851BF3CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7661E408CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiNpHogDm8dY for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F6704057C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F6704057C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F6704057C
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:51:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB50DE0004;
 Mon,  6 May 2024 19:51:00 +0000 (UTC)
Date: Mon, 6 May 2024 21:51:00 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240506215100.13296b7a@windsurf>
In-Reply-To: <20240506083905.14681-1-romain.naour@smile.fr>
References: <20240506083905.14681-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715025061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAc568C4Q8BAgl90x9rzDWE5u+dKLpG8z5RP1K6NdUg=;
 b=Rai6hLkFS7Bd209XBg9LIASoX0GDcjXQ3SFSdRVhlpjJm3Y/C/5U5O6llnq9DlW2wxSv8d
 Wi6vxn2TgvRANhWV6YVLYO9zYgFn/HlahQXkNvMuIoJEW0SqCeyuFcKIRRFEO47hQJq9SN
 yg+ExgCMeix5f+sSy2E+cX0092aRht+QZAcRXQfhLmuYkfTTE0wu/OsVTpI7lyT7GGSmUC
 CquIZiLqAV70+YBG/zsp5mrkGxdwWq/dBVEdjkVGi9TR9UvtHGvJipUG5MDCt3prrA9CvW
 xk82BtOmDhEzhg6NfR5wOZZXMuvGWH/FqkxHvCyFhatX0euILTVg8KNbZ+ZWQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rai6hLkF
Subject: Re: [Buildroot] [PATCH v2] configs/beagleboneai64_defconfig: new
 defconfig
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

Hello Romain,

On Mon,  6 May 2024 10:39:05 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Adds support for BeagleBone AI-64 board by introducing the
> beagleboneai64_defconfig file and related support files.

Perhaps you should state that this board uses the J721E SoC, also known
as DRA829, also known as TDA4VM. This would help...

> 
> Retrieve BSP settings from meta-ti (may be useful for other TI boards):
> 
> - This defconfig requires u-boot binman support added in u-boot since
>   2023.10.
>   See FOSDEM 2024 talk by TI folks about Binman and how it simplify
>   the overall boot-loader build flow [1].
> 
> - Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "generic"
>   meta-ti]$ git grep TFA_BOARD
>   meta-ti-bsp/conf/machine/beagleplay.conf:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am62axx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am62pxx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am62xx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am64xx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am65xx.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j7200.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j721e.inc:TFA_BOARD = "generic"

... understand that this setting is the important one.

>   meta-ti-bsp/conf/machine/include/j721s2.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/j784s4.inc:TFA_BOARD = "j784s4"
> 
> - Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
>   to ATF bl31.bin to the U-Boot build process [2].
> 
> - Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
>   secure payload. meta-ti set "SPD=opteed" to build ATF [3].
> 
> - Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-j721e".

... and understand this setting as well.

> - u-boot is looking at /boot/dtb/ti for devicetree. But Buildroot
>   strips the prefixes when installing them into /boot. Set
>   BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME to keep "ti" directory used by
>   the kernel to organize device tree sources.
>   TI's mmc.env [5] uses "dtb" as additional subdirectory, so we need
>   to create a symlink to make sure /boot/dtb/ti exist.
>   (Yocto uses KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb").
>   Using a symlink avoid to customize too much the u-boot environment.
> 
> - At least, provide a custom uEnv.txt to avoid using "Standard boot"
>   or "distroboot" [6] to boot.

I'm not sure to understand the "At least" here.

Also, why don't you want to use distroboot? We precisely try to
encourage using distroboot in Buildroot defconfigs, instead of uEnv.txt
stuff. So it's a bit going backward to use uEnv.txt here. Could you
explain this?

> diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
> new file mode 100644
> index 0000000000..593c41625c
> --- /dev/null
> +++ b/configs/beagleboneai64_defconfig
> @@ -0,0 +1,50 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai64/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Aren't we supposed to have BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_XYZ=y
somewhere?

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
