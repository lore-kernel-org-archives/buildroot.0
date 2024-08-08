Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7969CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B1540D3F;
	Thu,  8 Aug 2024 20:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8Lont3V8bqD; Thu,  8 Aug 2024 20:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8E2F40D53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E2F40D53;
	Thu,  8 Aug 2024 20:06:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E312C1BF86C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA78C8117B
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5pDHAaoPcur for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ABA580B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABA580B6D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ABA580B6D
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:06:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 426021C0003;
 Thu,  8 Aug 2024 20:06:12 +0000 (UTC)
Date: Thu, 8 Aug 2024 22:06:10 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20240808220610.14cab4c7@windsurf>
In-Reply-To: <20240808105221.2776341-2-jamie.gibbons@microchip.com>
References: <20240808105221.2776341-1-jamie.gibbons@microchip.com>
 <20240808105221.2776341-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723147572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LaJFZ8DTOJsNYNbv9LllSySQONZTWQOaT7E9gLKLg6Q=;
 b=nmoJg8seP1DQuDbTaszlPEmuglsG5069/ICYnu1NG3Hv2bRde4lTXck94zqmS5fj575/rb
 J3Exn2YGLxjm5AZ70V015EopVYcER/4U8ObdTDJkAAUFHCLAjpwjxPvcp4Eg7SAnmy0gn4
 IipVf4lvEsfsqHEgyPfLWkE0iRj/mtq51063MrTgBX24AAcIQr4FNu4IKv6lGEloyM6KTc
 IyCart1J9JfOclpHqyLqViWBZGPU+lr96e2U3qxN9y8mrsD8AnK50kEVikaIG6ETteBH56
 rrKDAuf5YsMDBkD+JEc725mGuM6hZPBZlCMBLyxwLW/K1mT+I55A2k2JdCbNrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nmoJg8se
Subject: Re: [Buildroot] [PATCH v2 1/2] fix: configs/beaglev_fire: update
 custom tarballs
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
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

I was about to apply but had some second thoughts. See below.

First, please don't add this "fix: " at the beginning of the commit
title. The commit title should be just:

	configs/beaglev_fire: update custom tarballs

On Thu, 8 Aug 2024 11:52:20 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> The Linux kernel and  U-Boot custom tarballs were updated incorrectly.

Please change to "were updated incorrectly in commit 8ce97fd550d6".

> Update these to select specific release tags instead of branches. Update
> the U-Boot hash to match changes.

Why do you mention that update the U-Boot hash here, while the Linux
hash is also updated?

> 
> Fixes:8ce97fd550d6("configs/beaglev_fire: bump Linux and U-Boot")

Space after "Fixes:", space after the commit hash.

But now, the real issue (because I had already fixed locally the above
minor details).


> index 809e00ff92..93b6aa7f26 100644
> --- a/configs/beaglev_fire_defconfig
> +++ b/configs/beaglev_fire_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.6-mchp+fpga)/linux4microchip+fpga-2024.06.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux4microchip+fpga-2024.06.tar.gz"

Please change the name of the tarball to
linux-linux4microchip+fpga-2024.06.tar.gz, i.e this line should be:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"

>  BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,u-boot-2023.07-mchp)/linux4microchip+fpga-2024.06.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/linux4microchip+fpga-2024.06.tar.gz"

Please change the name of the tarball to
uboot-linux4microchip+fpga-2024.06.tar.gz, so this line should become:

BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"

The motivation for this is that otherwise we have two tarballs with
exactly the same name "linux4microchip+fpga-2024.06.tar.gz", for Linux
and U-Boot, which can be confusing.

Also, it is customary in Buildroot to name tarballe
<package>-<version>.tar.gz, which is exactly what I'm asking you to do
here.

(I could have fixed that myself, but I'm working on a not very fast DSL
connection at the moment, so downloading all those kernel tarballs takes
quite a while...)

Could you take into account those comments also for PATCH 2/2 ?

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
