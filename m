Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B098AD2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D9B61C74;
	Thu,  4 Dec 2025 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TawKcPeXRUFj; Thu,  4 Dec 2025 20:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBC5E60E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881025;
	bh=E3gsnRGoJYE62U0cndgAsib9JjNAZkcMfDM2R3HqPsE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GpJTrCLcxZ/iU4GXfo6BNuMwYiunxrThg6IlEoZFSb5dDbTuhVyfeMnhHYV28cePa
	 OFYWz9Wc+XQsZZJb9uaLY2VhZ3rHcmdaRDeribfA4Pen8A4q2a8FMOmBerEwJ4G4Mh
	 S/U9iFD7mrmrNF8Sbq+mIGCsJPAL1p1XCdO8iFLnvCDRRoZat5UYfhlq0QtLWDG/4e
	 eMGCCioNhzyMi/J0MKt0YbfvaAZKltm55E3Hrg6FY+V307NVa9DkNb7W2IZeTlk9nr
	 HGVLBoJo5KQi0qs8V0LSQZwuqJ4LTgjP1sOX4xhl088ulV1iAtStlSLPMqNVKm7oVD
	 wo4+gAd3ALUFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC5E60E1A;
	Thu,  4 Dec 2025 20:43:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 579AED3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 543508471E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqtlbcygeDt8 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49D058471A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D058471A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D058471A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C77A3B979ECC; Thu,  4 Dec 2025 21:43:40 +0100 (CET)
To: Scott Fan <fancp2007@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:38 +0100
Message-ID: <20251204204338.13092-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251014134349.728861-1-fancp2007@gmail.com>
References: <20251014134349.728861-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881021; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=B7hbbz0rAeVRE+ODamekAveDqK5UHmzqqrVBhXC05WQ=;
 b=jQuLYbvM1nPqkc2/lfzKpLnLrVItxDmmUKA66ueMWhr6PokckbE0oR2lKeSbqeFYOUDXQO
 oeFYtWcq3oeX1TvkGH0NKaJ/K4d8yvsnHcD32Jf+d4ztVdQw5SANc+ecmkr3UirFLcFKlc
 7qmEC3Ykwm8CKNQZ7CgpgrSHWG+q/4pYngyLAaAtqzfDLDBEQuwNScUdlHKjsQJ28HzLsN
 tBhZ0QvmMf8Zj9qnQipyJvBD0n3q0yC9F8Mq5Ts9AJ7xcuWCJ0udy5VVGygyQC4SFV0jAH
 tgHrv4nHvWD4aUUrKnr70VMJ39czReXogzAOK52b7aGcgPy/gPqv3bnus0ALbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=jQuLYbvM
Subject: Re: [Buildroot] [PATCH 1/2] configs/beaglebone: bump Linux to
 6.12.34-ti-arm32-r12 and U-Boot to 2025.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The patch bumps the Linux kernel to version 6.12.34-ti-arm32-r12 and
> U-Boot to version 2025.10.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to 2025.08.x. Thanks

> ---
>  board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
>  board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
>  configs/beaglebone_defconfig                          | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
> index f2c09d9872..e70a999129 100644
> --- a/board/beagleboard/beaglebone/patches/linux/linux.hash
> +++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  3654ca31003d90d20b195b23f8d60b78fcffbf0fd7fed6116c22719e20ac933d  linux-6.12.23-ti-arm32-r11.tar.gz
> +sha256  1db327d0743e97ec725fefe05065a6fb779abe3063845fc3b551a4a716247c0a  linux-6.12.34-ti-arm32-r12.tar.gz
> diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> index 440526977b..98a5c53aaf 100644
> --- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> +++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index bb63fda375..86bf6bce9a 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.23-ti-arm32-r11)/linux-6.12.23-ti-arm32-r11.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
