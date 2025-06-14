Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A1FC71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D9DE6060D;
	Sat, 14 Jun 2025 13:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6S8UqoKwhrlq; Sat, 14 Jun 2025 13:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C36C3607CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C36C3607CE;
	Sat, 14 Jun 2025 13:32:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CCF01A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2CAF40830
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO3vZd9QLCNP for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8D8840770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D8840770
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D8840770
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:32:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E9AEE13F861;
 Sat, 14 Jun 2025 15:32:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Jun 2025 15:32:11 +0200
MIME-Version: 1.0
Date: Sat, 14 Jun 2025 15:32:11 +0200
From: Julien Olivain <ju.o@free.fr>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dick Olsson <hi@senzilla.io>
In-Reply-To: <20250607-loongarch-v2-9-90bc4fda9080@flygoat.com>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-9-90bc4fda9080@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <86ff172358e7d5004204a961b3a3cf65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749907937;
 bh=TFVgnE2nThofVR4rLRYQWYxidHT8wUotNRTV7PQPRls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BlwVTSMNZCXC2rrdolOrAMHj4btwidl4t8jk77/teiBPSq2B2kuU56eSNTm+Z6EkP
 ZU8cIIiy8hn2SXRXoK8GZora+/uQxYnmLVK0Jv4PQ1jsNXQT/8RQOv/glqk64M+aIw
 1yYDv246yS+Io8Lh1i88Q5u7qF+6xlJoOKGQc3jgtxLimKsduo7LJ9QY5WVkYEegnR
 SG+TkiyDr97CD0CXstxq37/mNTnOVzzQEIYVWe//tEZqbmmjfWpfHm01JHPi2Jhi8Y
 myedH9KkxymKVNoEZVfX40DkO5cs6C6qlo1FgZuZiO/rPyeoRbS4E+y57EAKt7zN9c
 74CaT0j3ugSoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BlwVTSMN
Subject: Re: [Buildroot] [PATCH v2 9/9] board/qemu: Add loongarch64-virt-efi
 variant
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

Hi Jiaxun, All,

Thanks for the patch!

For consistency with other Buildroot commits, could you reword
the commit log title to:

     configs/qemu_loongarch64_virt_efi: new defconfig

Also, I have few other comments, see below.

On 07/06/2025 20:12, Jiaxun Yang wrote:
> Add qemu_loongarch64_virt_efi_defconfig, which builds EDK2
> and host QEMU to test LoongArch64 buildroot.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  DEVELOPERS                                    |  2 ++
>  board/qemu/loongarch64-virt-efi/genimage.cfg  | 33 
> +++++++++++++++++++++++++++
>  board/qemu/loongarch64-virt-efi/grub.cfg      |  6 +++++
>  board/qemu/loongarch64-virt-efi/post-image.sh |  5 ++++
>  board/qemu/loongarch64-virt-efi/readme.txt    | 31 
> +++++++++++++++++++++++++
>  configs/qemu_loongarch64_virt_efi_defconfig   | 23 +++++++++++++++++++
>  6 files changed, 100 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 
> 600cd6c22ff6db57f9ef1da5ba9b6c15b37ca7f8..cac88b6be1dd0daccbba7f26f2e5961274cd3871 
> 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1645,7 +1645,9 @@ F:	package/rtty/
>  N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
>  F:	arch/Config.in.loongarch
>  F:	board/loongarch64-efi
> +F:	qemu/loongarch64-virt-efi

Here, running the command "utils/get-developers -v" generates
a warning:

     WARNING: 'qemu/loongarch64-virt-efi' doesn't match any file, line 
1651

The correct path should be "board/qemu/loongarch64-virt-efi".

>  F:	configs/loongarch64_efi_defconfig
> +F:	configs/qemu_loongarch64_virt_efi_defconfig
> 
>  N:	Joachim Wiberg <troglobit@gmail.com>
>  F:	configs/globalscale_espressobin_defconfig
> diff --git a/board/qemu/loongarch64-virt-efi/genimage.cfg 
> b/board/qemu/loongarch64-virt-efi/genimage.cfg
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..95fb59c97c38db772485372a60ee1fe5dad717c6
> --- /dev/null
> +++ b/board/qemu/loongarch64-virt-efi/genimage.cfg
> @@ -0,0 +1,33 @@
> +image efi-part.vfat {
> +	vfat {
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +		file vmlinux.efi {
> +			image = "vmlinux.efi"
> +		}
> +	}
> +
> +	size = 64M
> +}
> +
> +image disk.img {
> +	hdimage {
> +		partition-table-type = "gpt"
> +	}
> +
> +	partition boot {
> +		image = "efi-part.vfat"
> +		partition-type-uuid = U
> +		offset = 32K
> +		bootable = true
> +	}
> +
> +	partition root {
> +		# For partition-type-uuid value, see:
> +		# 
> https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
> +		# SD_GPT_ROOT_LOONGARCH64
> +		partition-type-uuid = 77055800-792c-4f94-b39a-98c91b762bb6

genimage includes aliases for partition type UUIDs. See:
https://github.com/pengutronix/genimage/blob/v18/image-hd.c#L290

so for readability, this line could be changed to:

     partition-type-uuid = root-loongarch64

> +		image = "rootfs.ext2"
> +	}
> +}

[...]

> diff --git a/configs/qemu_loongarch64_virt_efi_defconfig 
> b/configs/qemu_loongarch64_virt_efi_defconfig
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..cc65158c0282b17e4a995bd1d79a403e8112314a
> --- /dev/null
> +++ b/configs/qemu_loongarch64_virt_efi_defconfig
> @@ -0,0 +1,23 @@
> +BR2_loongarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/loongarch64-virt-efi/post-image.sh 
> board/qemu/post-image.sh support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c 
> board/qemu/loongarch64-virt-efi/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_EDK2=y
> +BR2_TARGET_GRUB2=y
> +BR2_TARGET_GRUB2_LOONGARCH64_EFI=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Qemu defconfigs should also select:

     BR2_PACKAGE_HOST_QEMU=y
     BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

See for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/configs/qemu_aarch64_virt_defconfig#L17

This is because the Buildroot Gitlab CI tries to boot qemu defconfigs.
Doing so will also use the host-qemu version available in Buildroot,
which is 10.0.0 as of today (rather than the version in the reference
docker image).

See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/misc/gitlab-ci.yml.in#L65

Before this patch, you'll probably have to declare the host qemu
loongarch support, in package/qemu/Config.in.host,
in BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS, you should probably add:

     default y if BR2_loongarch64

Then, you can check this is working in the docker reference image
with commands:

     utils/docker-run
     make qemu_loongarch64_virt_efi_defconfig
     make
     output/images/start-qemu.sh

Could you send an updated patch addressing those comments, please?

with those changes:

Tested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
