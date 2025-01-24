Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E7DC0218C
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA7B60813;
	Fri, 24 Jan 2025 18:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ri7hz-9iIimJ; Fri, 24 Jan 2025 18:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B113060B9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B113060B9A;
	Fri, 24 Jan 2025 18:38:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5FE594A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EC0A4136B
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgSEAafSdVmQ for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:38:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E00340482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E00340482
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E00340482
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:38:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 536E4780517;
 Fri, 24 Jan 2025 19:38:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55286])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 19:38:38 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 19:38:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250122220400.3205539-1-thomas.petazzoni@bootlin.com>
References: <20250122220400.3205539-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4bd787548c54e243a9182120d7d38d12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737743919;
 bh=I2nR57qbLiVrhxsGpyx6YhdLsKdV2IZX0QJM18cnMv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fZtaMKVmTdbONTQc56dPng6qkFaR/M3WYt3yTytUh5gXA1MU18FtCtT4G7EQ6Xa3o
 JKwRYfDpJxlbjNBH0VCv8d8fpjQMoiyzmpOKN2DfJZakK2RN9ursYBwjTKYpdSmK7r
 STTlH0QOgyQoqtveWrNDn6tYNooUXQsH4zrs/92kN2kQ3lzsA+Vn3YZZCTNQYyYF7t
 JGmgMHxIhhU4KBze28wZPULjXTLgkoMkPeQejcMmJE89AyP0FOofHYcZsjP4srxabA
 /f36zGaHFTPblQu5efsHGqF0J/3q4xS8F146DtA3ggG1vPMjaIk27bwJi/7AhWfB5R
 2mMEsnPS+ohCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fZtaMKVm
Subject: Re: [Buildroot] [PATCH v2] package/gnu-efi: change upstream,
 bump to 4.0.0
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

On 22/01/2025 23:03, Thomas Petazzoni via buildroot wrote:
> https://sourceforge.net/projects/gnu-efi/ is dead and stuck at version
> 3.0.18. At https://sourceforge.net/p/gnu-efi/feature-requests/11/ the
> upstream maintainer has indicated that the project is now maintained
> at https://github.com/ncroxon/gnu-efi/, so let's use this as upstream.
> 
> We can drop patches 0002 and 0003 since they are upstream. Patch 0001
> is just slightly refreshed.
> 
> Changes 3.0.18 -> 3.0.19:
>   https://github.com/ncroxon/gnu-efi/releases/tag/3.0.19
> 
> Changes 3.0.19 -> 4.0.0:
>   https://github.com/ncroxon/gnu-efi/releases/tag/4.0.0
> 
> The licensing files have changed:
> 
> - A LICENSE file has been added, with the text of the GPLv2
> 
> - The README.efilib file has been moved, unchanged to
>   licenses/LICENSE.efilib
> 
> - A new file containing the EDK2 license has been added at
>   licenses/LICENSE.edk2. This requires an update in the list of
>   licenses
> 
> Tested with the following defconfigs:
> 
>  ARM defconfig testing gnu-efi + fwupd-efi
> 
>  BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
>  BR2_INIT_NONE=y
>  BR2_SYSTEM_BIN_SH_NONE=y
>  # BR2_PACKAGE_BUSYBOX is not set
>  BR2_PACKAGE_FWUPD_EFI=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> 
>  RISC-V defconfig testing gnu-efi + fwupd-efi
> 
>  BR2_riscv=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
>  BR2_INIT_NONE=y
>  BR2_SYSTEM_BIN_SH_NONE=y
>  # BR2_PACKAGE_BUSYBOX is not set
>  BR2_PACKAGE_FWUPD_EFI=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> 
>  x86-64 defconfig testing gnu-efi + fwupd-efi + systemd-boot
> 
>  BR2_x86_64=y
>  BR2_x86_corei7=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
>  BR2_INIT_SYSTEMD=y
>  BR2_SYSTEM_BIN_SH_NONE=y
>  BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
>  # BR2_PACKAGE_BUSYBOX is not set
>  BR2_PACKAGE_SYSTEMD_BOOT=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_SYSLINUX=y
>  BR2_TARGET_SYSLINUX_EFI=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
