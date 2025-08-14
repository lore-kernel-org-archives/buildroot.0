Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F053CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D815880E9B;
	Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDQDtFK5jf_o; Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5805180E73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5805180E73;
	Thu, 14 Aug 2025 20:32:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43795228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A918404AF
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSeU5KtnhPL8 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12C8A40459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12C8A40459
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12C8A40459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9edfba75bso701946f8f.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203520; x=1755808320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0O5JXzC7KlBRXN0KSJcjL5wON6EtQlcyVEUC+WyqVk0=;
 b=OWACHg52XE4nercmq08qunqsVUW99wJzSt/JCnE4ogyl7iTYsB64Mc2mZ3qBbXcY64
 YWO/5kUjYWKUvf+u2rh0HdVphR9mNK2IWPOvS56LU23cCl7JPq9Qo5rwjyJQb2tyYP3J
 KHRaq5xj4k2hg+yfoklvlMK0gY5FovnR/bHTzvnfkaFInTjXdu/5M6tAVRLFIwwPOVmF
 zKUmUTyG4QljSg5wkNl3Q8xEmt5wobs4jZ8/mmQobsdlMHWfsOgJVZC7kx/VowmDx1Wf
 Pe8ZSjKwBtgqZNP6iFdDyd5P+9it9KjFM+xKLWId8axszP2dtIjF0LButcdWlz7ze5kI
 /ejQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH0SN0Pio6gsd3plJAV1a+KqKho7w5IOWaV3i3Rvr6P9dbMh1Nt1pJbi9Aj2VdYdFngNeeXOcdnbk=@buildroot.org
X-Gm-Message-State: AOJu0YzW31oTqaYOO+tMsHcRmgAL5ArtktwwhWnP6dqyUM0IJlVhCLKG
 XHB5lr6I1uQWdXBW4KzQNtk4IAVehbey365PerN9l/PqwrHW9Fd3izhNKeCFr/IcVQs9FVznIOm
 MpRkkWaM=
X-Gm-Gg: ASbGnct+nD/+gRQd3z3bID86wpSqszEu+f8XEJELCxE6OrFoQZDz8z8ZcbBMARbpl0p
 4nslYabMip+e0Or8BEnj7a+2Snyb1YpKcqb7FZ8RDD2CmyWaEufR3Pfo2g4Gjp5bp/ABbwnL/u/
 Q76YE1T0ZuIwFFr/ygqaapCyj5MFWyKCKWWbWjMgZZ41rYquoWobyXKj/+8N4jyLS1sDXSTirJE
 ObCtpaC86/wGA2sOtl3WrmlPbI71v5Uv9uDmzlmhjUH3CfXQmwEewTZ41LBDN50UDZxy1ca/1eO
 tCX5Wvpg9+wKBeqkk0Fft6Y2NvBqzJEPfSv9XrWJkhk/fJQ4HG9z73vNpGdMdzufA61enYXuM2z
 UEl/KfOUzUKqdBDOR51+WbJjS
X-Google-Smtp-Source: AGHT+IGB5O7+jpgQv8GM/ICh6x8SUvw0OB570Sv3TkoDjBS7wWX8eq3zwGyM4CPgXJvBGPQqsLYbaw==
X-Received: by 2002:a5d:5d87:0:b0:3a3:67bb:8f3f with SMTP id
 ffacd0b85a97d-3ba50d85218mr3461777f8f.53.1755203520081; 
 Thu, 14 Aug 2025 13:32:00 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6fbbe6sm33157285e9.21.2025.08.14.13.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:59 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:59 +0200
Message-ID: <20250814203159.2816218-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805190727.1696620-1-thomas.petazzoni@bootlin.com>
References: <20250805190727.1696620-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203520; x=1755808320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0O5JXzC7KlBRXN0KSJcjL5wON6EtQlcyVEUC+WyqVk0=;
 b=g++/J7ztM31hCS2vCaoW3Lmk9tlpMNT1CMYMyUwCq4jvPVdeA1khkGfDIOu9q9HtIc
 vT2Be0zkNoJcEjUzLW3XXDCXZjHjK+bSEfR2yltp73gZ0aFiAHdTXemcCxyc6mCQePMT
 QScTbdrsYnQshLhr0p7knx4ZZF8G/xRyu1sqS9H1NDrATzsfjMU/OC28Lz1xSIxvTOB5
 H2bC5vZk/ZCZwe6n+twrMkvsKyRqb9Znxw5GgkCcMt+Hs2EyIQsFScFZtSSd9x5LLrKI
 YHztK0Fagq3cWGtqhp2MeRiHBWnctozHLh1pMR8tflNV2a5c3SiMmK0W6Vnnd8GZU5KO
 0PSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g++/J7zt
Subject: Re: [Buildroot] [PATCH] configs/qemu_sh4*: switch back to disk
 emulation
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Back in commit
> 44a6b7866c95ca5459a53a50eab5ab1d38b6b8e1 ("configs/qemu_sh4*: switch
> to initramfs"), the Qemu SuperH defconfigs were switched to initramfs
> due to a bug in the Qemu disk emulation.
> 
> However, the initramfs solution has an issue: if the initramfs is
> slightly too large (like just 6 MB!), the system no longer boots.
> 
> Since the disk emulation problem has apparently been resolved in Qemu
> 10 (according to testing), let's switch back to this.
> 
> In addition to essentially reverting
> 44a6b7866c95ca5459a53a50eab5ab1d38b6b8e1, we also need to adjust the
> kernel configuration so that the kernel takes its command line for the
> bootloader (in our case from the Qemu -append option). Otherwise an
> hardcoded command line is used, which doesn't mount /dev/sda as the
> root filesystem.
> 
> This update has been tested on Gitlab CI:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1968267919
> 
> Thanks to Romain Naour for pointing to the initramfs size as being the
> issue.
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  board/qemu/sh4-r2d/linux.config   | 1 +
>  board/qemu/sh4-r2d/readme.txt     | 2 +-
>  board/qemu/sh4eb-r2d/linux.config | 1 +
>  board/qemu/sh4eb-r2d/readme.txt   | 2 +-
>  configs/qemu_sh4_r2d_defconfig    | 2 +-
>  configs/qemu_sh4eb_r2d_defconfig  | 2 +-
>  6 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/board/qemu/sh4-r2d/linux.config b/board/qemu/sh4-r2d/linux.config
> index a3d6544549..dd4bf5204f 100644
> --- a/board/qemu/sh4-r2d/linux.config
> +++ b/board/qemu/sh4-r2d/linux.config
> @@ -5,6 +5,7 @@ CONFIG_MEMORY_START=0x0c000000
>  CONFIG_FLATMEM_MANUAL=y
>  CONFIG_SH_RTS7751R2D=y
>  CONFIG_RTS7751R2D_PLUS=y
> +CONFIG_CMDLINE_FROM_BOOTLOADER=y
>  CONFIG_HEARTBEAT=y
>  CONFIG_PCI=y
>  CONFIG_NET=y
> diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
> index 24c3676d8a..b0799e47a8 100644
> --- a/board/qemu/sh4-r2d/readme.txt
> +++ b/board/qemu/sh4-r2d/readme.txt
> @@ -1,6 +1,6 @@
>  Run the emulation with:
>  
> -  qemu-system-sh4 -M r2d -kernel output/images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4_r2d_defconfig
> +  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4_r2d_defconfig
>  
>  The login prompt will appear in the terminal that started Qemu.
>  The graphical window is the framebuffer.
> diff --git a/board/qemu/sh4eb-r2d/linux.config b/board/qemu/sh4eb-r2d/linux.config
> index 6ead626c41..5f94bee77d 100644
> --- a/board/qemu/sh4eb-r2d/linux.config
> +++ b/board/qemu/sh4eb-r2d/linux.config
> @@ -6,6 +6,7 @@ CONFIG_FLATMEM_MANUAL=y
>  CONFIG_CPU_BIG_ENDIAN=y
>  CONFIG_SH_RTS7751R2D=y
>  CONFIG_RTS7751R2D_PLUS=y
> +CONFIG_CMDLINE_FROM_BOOTLOADER=y
>  CONFIG_HEARTBEAT=y
>  CONFIG_PCI=y
>  CONFIG_NET=y
> diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
> index 577c54cd9d..9f3dd8b20b 100644
> --- a/board/qemu/sh4eb-r2d/readme.txt
> +++ b/board/qemu/sh4eb-r2d/readme.txt
> @@ -1,6 +1,6 @@
>  Run the emulation with:
>  
> -  qemu-system-sh4eb -M r2d -kernel output/images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4eb_r2d_defconfig
> +  qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4eb_r2d_defconfig
>  
>  The login prompt will appear in the terminal that started Qemu.
>  The graphical window is the framebuffer.
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index 63b9fa1b29..628ca05543 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_PACKAGE_HOST_QEMU=y
>  BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index 97cbd6bd8a..4fd07775ed 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_PACKAGE_HOST_QEMU=y
>  BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
