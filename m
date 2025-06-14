Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EA3C7114A
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B547406CA;
	Sat, 14 Jun 2025 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D5_odOQYEwg; Sat, 14 Jun 2025 20:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EDBA406DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EDBA406DC;
	Sat, 14 Jun 2025 20:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B1D151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 20:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF64760AA0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 20:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMdTV1dqbu_X for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 20:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F3996067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F3996067D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F3996067D
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 20:51:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C6A6F2003CC;
 Sat, 14 Jun 2025 22:50:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Jun 2025 22:50:55 +0200
MIME-Version: 1.0
Date: Sat, 14 Jun 2025 22:50:55 +0200
From: Julien Olivain <ju.o@free.fr>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dick Olsson <hi@senzilla.io>
In-Reply-To: <20250607-loongarch-v2-7-90bc4fda9080@flygoat.com>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-7-90bc4fda9080@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4bc900c5dbec2b230c7ae7530fcea6a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749934261;
 bh=GriOIHtPnpB4EEoqJTBBrHW0gNb9mVz0+xQU5C4Wh5U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ll/uxvaPI2dot6B1SKcwwcMXW/kPg+E0SgbhsWTbL5YG4WtEWbhid/A5mFtTGH+Sg
 Zqfri7ODtL5GYtaOxs2g6wkdUKoLunID6ii8yCfw9ezANge+J+8BbBTolMtJ6ds2eU
 SUOp5b1K2kiTXliKHthpWhMp3wKOa4zHXQVDepyi9hGa44x83B43PDMI+8vAmmCaNp
 kubOjhj0Ieozs9EXHnOOZd3qZQYd8UTW51o8Wmcu8hprHVeHFXAPQoZGvkDn3kxiDk
 Rgp3Yf5wIif206JANGRcB6aCqSUma26RiCG0s/P+R61BuMtpFxcIMoPXU3iXJE4VzJ
 nP2UVmMggJB/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ll/uxvaP
Subject: Re: [Buildroot] [PATCH v2 7/9] board/loongarch64-efi: Introduce the
 new board
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

I have the same kind of comments as I made for the Qemu defconfig in:
https://lore.kernel.org/buildroot/6d266eec-4ea9-4293-8403-b854bf0ed5b1@smile.fr/T/#ma97fe41097b838cc31078d3e59524e531f8e939d

More specifically:

To follow other Buildroot commits, the commit log title could be
reworded to:

     configs/loongarch64_efi: new defconfig

On 07/06/2025 20:12, Jiaxun Yang wrote:
> Introduce bread new loongarch64-efi board, with skeleton
> from aarch64-efi board.
> 
> It corverd most LoongArch64 systems.
> 
> Linux 6.12, as the most recent LTS kernel, was chosen
> to ensure proper architecture support is included.
> 
> A developer entry is created for myself for future contacts
> as well.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  DEVELOPERS                                         |  5 ++++
>  board/loongarch64-efi/genimage-efi.cfg             | 33 
> +++++++++++++++++++++
>  board/loongarch64-efi/grub.cfg                     |  6 ++++
>  .../patches/linux-headers/linux-headers.hash       |  1 +
>  board/loongarch64-efi/patches/linux/linux.hash     |  2 ++
>  board/loongarch64-efi/post-image.sh                |  5 ++++
>  board/loongarch64-efi/readme.txt                   | 34 
> ++++++++++++++++++++++
>  configs/loongarch64_efi_defconfig                  | 22 ++++++++++++++
>  8 files changed, 108 insertions(+)
> 

[...]

> diff --git a/board/loongarch64-efi/genimage-efi.cfg 
> b/board/loongarch64-efi/genimage-efi.cfg
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..95fb59c97c38db772485372a60ee1fe5dad717c6
> --- /dev/null
> +++ b/board/loongarch64-efi/genimage-efi.cfg
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

> diff --git a/board/loongarch64-efi/readme.txt 
> b/board/loongarch64-efi/readme.txt
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..4c4e06874c1fce1bd8e44cd989b7e971304aa4f0
> --- /dev/null
> +++ b/board/loongarch64-efi/readme.txt
> @@ -0,0 +1,34 @@
> +The loongarch64_efi_defconfig allows to build a minimal Linux system 
> that
> +can boot on all loongarch64 systems providing an EFI firmware.
> +
> +This includes almost all Loongson-3 series workstations and servers.

Even if this defconfig is UEFI (meaning it can work on any UEFI
compatible LoongArch64 board), maybe it would be helpful to have
few links to actual hardware boards on which this defconfig can be
reproduced, by Buildroot users.

What hardware did you used to validate this defconfig? Is there a
"reference board" for LoongArch64?

Usually, we include in Buildroot defconfigs supporting publicly
available boards.

> +
> +Building and booting
> +====================
> +
> +$ make loongarch64_efi_defconfig
> +$ make
> +
> +The file output/images/disk.img is a complete disk image that can be
> +booted, it includes the grub2 bootloader, Linux kernel and root
> +filesystem.
> +
> +Testing under Qemu
> +==================
> +
> +This image can also be tested using Qemu:
> +
> +qemu-system-loongarch64 \
> +	-M virt \
> +	-cpu la464 \
> +	-nographic \
> +	-bios </path/to/QEMU_EFI.fd> \
> +	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
> +	-device virtio-blk-pci,drive=hd0 \
> +	-netdev user,id=eth0 \
> +	-device virtio-net-pci,netdev=eth0
> +
> +Note that </path/to/QEMU_EFI.fd> needs to point to a valid loongarch64 
> UEFI
> +firmware image for qemu.
> +It may be provided by your distribution as a edk2-loongarch64 package,
> +in path such as /usr/share/edk2/loongarch64/QEMU_EFI.fd .

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
