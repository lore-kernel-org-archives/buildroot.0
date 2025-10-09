Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4306CCD18D
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E15410C0;
	Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7zc63htEk5g; Thu,  9 Oct 2025 14:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A60C41062
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A60C41062;
	Thu,  9 Oct 2025 14:54:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EDE6119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2526840F28
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXZPl7FSZtJN for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CFEC4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CFEC4049F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CFEC4049F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so10923675e9.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021680; x=1760626480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCPsjebTwjzThNl/AKl6ntWytwkh61YZngLVwfBAqKA=;
 b=IajwzLlNw2mRfU2iYbu8g8ttYINRQaCacmLUIQPLXT7omfskVCHjHc9t6LA0JfZ4jD
 wpbvjx17GaGskGdzwqQ82oTIVx4GIK2TzoiGVWl9k2jzr9KEIzamfSR/rHaoacQAB+RU
 dBhF6eF6szNTYAnqzlY8ewDLnHCu0dGkvabRPJJT90QtmbgbH1iCQCAw8nsP4L8UvuZT
 /j8AxeKPy2jjb4TggYvzllSbi6SCf2mrcnXjWRHqMAGoqpc5tdbblE85ejLU4bvULKTX
 ZncX7nOzsre7JUKiE/mk2DAVfv+k5Up9Zo8/nIxMfOZ3SQ7v23MmDhlu3Bdy8ZCpL/pX
 cfuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLPSYmHXr9IyqEhQqV4nC/x+8/oTCKQgXyxaYf4fTUE4Wd09A7yrQPPGY11sNP0FoLrM/X727iPKY=@buildroot.org
X-Gm-Message-State: AOJu0YxTOk+zuvSwiYc+SBgo8yu00FRJPJ659AFGia4mAw5lJl0YF+Nb
 +U2XpfYkOjnjvnxC7v9Bnzr9qlK29fCL0QKTak7sZf/rxuPv7zzt+RDCAoHfjvSNrHeoOu+8kRZ
 KVVrp
X-Gm-Gg: ASbGnctNk3SenZAtjvtrjlbQNrTXEHfvSm2b5o+QLS4YMuezzvcDnwO3bPBeB6/MTKV
 41cjjNTdtFIxQiwLLZw7RJ7Ee+4J+qlnpWAcWv1bJQVuEaLiKk6hVHTcKulLaJy1fEqtAA2uSKT
 OGsJImLDDVRJ0cRGXe+tXklaoCjW0IMzzcTY/oZfHN3QM9zq1VN+hHD3GEkzZl5qnfqom7D+B62
 EnOhy4FjxY49VqSCzZUSKTzI3jf03iDK1fF/uB02HoeBTIyu4OPwumwP9KEwlQozZeFzvwYy/EQ
 8nJB5JFCZzNvuTh3f7WqzZp6kC+4qBZx6U5WqEQfWONAYlWQ15OqyY+Z6GOSZ1Jeem5l333pHDo
 9a+W64IZoT8pXIR0LIl/2DjOMnpi4doZRZB/reqxgGLnyJacXQmE=
X-Google-Smtp-Source: AGHT+IG2mjZgIAs9hBFmpzoVINVw1LP3/d8OMrPaUiQ9hWot+1sjRn/bZhXAjkHTolr9D473nT7Oog==
X-Received: by 2002:a05:600c:609b:b0:45d:dbf0:4831 with SMTP id
 5b1f17b1804b1-46fa9e39456mr54709465e9.0.1760021679450; 
 Thu, 09 Oct 2025 07:54:39 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3d92c0sm39042555e9.3.2025.10.09.07.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:39 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:38 +0200
Message-ID: <20251009145438.482069-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929085404.918021-1-peter@korsgaard.com>
References: <20250929085404.918021-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021680; x=1760626480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCPsjebTwjzThNl/AKl6ntWytwkh61YZngLVwfBAqKA=;
 b=d6Xz2AW0L2Ffm2lD68v4q/5GiT3j0MHIYZxS+7y0t/CBWttQvNp98zHdv0IXavWDKn
 arUxwwaEy4n8wHqjRE7d0t4YRhk+iGpAB1hsy9USd/Sy8JIvcJC2WYgDV7TP31ZJK1kP
 hn2prmSz9lR98xGGmcj7OlPc3FJgwn/GUJ9M78Fvyo/+Uvb0vmGTk9fO1NAc6vjJVDOU
 CCf9rEz+nMgF3l8LNGOwbWQSBnDVLWR8l6hkHGh0glgnq2DyW/rfTn3xQRn3lqEODRi3
 XbAu3Oo+Sq1IsTTQoNqvT2WW/cZxcNVX+S5HFF86jqS0lWrBrcrL3m2y5AG7D5G749Gd
 dpRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d6Xz2AW0
Subject: Re: [Buildroot] [PATCH] configs/roseapplepi: remove defconfig,
 broken
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
> The roseapplepi defconfig fails to build u-boot since the move to GCC 15.x:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11501385206
> 
> The issues are mainly related to missing includes, but given that the build
> has been broken for a while, there is no mainline u-boot support for the
> platform and the minimal kernel support has not seen any updates since it
> was added for v5.15, just drop the defconfig.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  .checkpackageignore                           |   3 -
>  DEVELOPERS                                    |   2 -
>  board/roseapplepi/genimage.cfg                |  45 -
>  board/roseapplepi/linux.config                |  70 --
>  ...-include-linux-compiler-.h-with-Linu.patch | 809 ------------------
>  board/roseapplepi/post-build.sh               |   4 -
>  board/roseapplepi/uEnv.txt                    |   3 -
>  configs/roseapplepi_defconfig                 |  35 -
>  8 files changed, 971 deletions(-)
>  delete mode 100644 board/roseapplepi/genimage.cfg
>  delete mode 100644 board/roseapplepi/linux.config
>  delete mode 100644 board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch
>  delete mode 100755 board/roseapplepi/post-build.sh
>  delete mode 100644 board/roseapplepi/uEnv.txt
>  delete mode 100644 configs/roseapplepi_defconfig
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 69877d1778..f3183e4929 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -50,8 +50,6 @@ board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-ua
>  board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
>  board/raspberrypi/post-build.sh Shellcheck
>  board/raspberrypi/post-image.sh Shellcheck
> -board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch lib_patch.Upstream
> -board/roseapplepi/post-build.sh Shellcheck
>  board/seeed/stm32mp157c-odyssey/patches/linux/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch lib_patch.Upstream
>  board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch lib_patch.Upstream
>  board/solidrun/clearfog/post-build.sh Shellcheck
> @@ -159,7 +157,6 @@ configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
>  configs/pine64_defconfig lib_defconfig.ForceCheckHash
>  configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
>  configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
> -configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
>  configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
>  configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
>  configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 71a9b1a157..3b514a4634 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2642,7 +2642,6 @@ F:	board/librecomputer/lafrite/
>  F:	board/nexbox/a95x/
>  F:	board/openblocks/a6/
>  F:	board/orangepi/
> -F:	board/roseapplepi/
>  F:	board/visionfive/
>  F:	boot/shim/
>  F:	configs/avenger96_defconfig
> @@ -2654,7 +2653,6 @@ F:	configs/nezha_defconfig
>  F:	configs/openblocks_a6_defconfig
>  F:	configs/orangepi_pc_defconfig
>  F:	configs/orangepi_r1_defconfig
> -F:	configs/roseapplepi_defconfig
>  F:	configs/sheevaplug_defconfig
>  F:	configs/visionfive_defconfig
>  F:	package/bats-core/
> diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
> deleted file mode 100644
> index 4c5a8de902..0000000000
> --- a/board/roseapplepi/genimage.cfg
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -# Minimal SD card image for the Roseapple Pi
> -#
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"uEnv.txt",
> -			"uImage"
> -		}
> -
> -		file kernel.dtb {
> -			image = "owl-s500-roseapplepi.dtb"
> -		}
> -	}
> -
> -	size = 128M
> -}
> -
> -image sdcard.img {
> -	hdimage {
> -	}
> -
> -	partition s500-bootloader {
> -		in-partition-table = "no"
> -		image = "s500-bootloader.bin"
> -		offset = 0x200200 # 2MB + 512B
> -	}
> -
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot-dtb.img"
> -		offset = 3M
> -	}
> -
> -	partition boot {
> -		partition-type = 0xC
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
> -	partition rootfs {
> -		partition-type = 0x83
> -		image = "rootfs.ext4"
> -		size = 512M
> -	}
> -}
> diff --git a/board/roseapplepi/linux.config b/board/roseapplepi/linux.config
> deleted file mode 100644
> index 89e7c8917f..0000000000
> --- a/board/roseapplepi/linux.config
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -# CONFIG_SWAP is not set
> -# CONFIG_CROSS_MEMORY_ATTACH is not set
> -CONFIG_NO_HZ=y
> -CONFIG_HIGH_RES_TIMERS=y
> -# CONFIG_CPU_ISOLATION is not set
> -# CONFIG_KALLSYMS is not set
> -# CONFIG_RSEQ is not set
> -CONFIG_EMBEDDED=y
> -# CONFIG_SLUB_DEBUG is not set
> -# CONFIG_COMPAT_BRK is not set
> -CONFIG_ARCH_ACTIONS=y
> -CONFIG_SMP=y
> -CONFIG_ARM_PSCI=y
> -CONFIG_HIGHMEM=y
> -CONFIG_VFP=y
> -CONFIG_NEON=y
> -# CONFIG_SUSPEND is not set
> -# CONFIG_STACKPROTECTOR is not set
> -# CONFIG_MQ_IOSCHED_KYBER is not set
> -# CONFIG_COREDUMP is not set
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_INET=y
> -# CONFIG_INET_DIAG is not set
> -# CONFIG_IPV6 is not set
> -# CONFIG_WIRELESS is not set
> -# CONFIG_ETHTOOL_NETLINK is not set
> -CONFIG_NETDEVICES=y
> -CONFIG_OWL_EMAC=y
> -CONFIG_REALTEK_PHY=y
> -CONFIG_INPUT_EVDEV=y
> -CONFIG_INPUT_MISC=y
> -CONFIG_INPUT_ATC260X_ONKEY=y
> -# CONFIG_VT is not set
> -CONFIG_SERIAL_OWL=y
> -# CONFIG_HW_RANDOM is not set
> -CONFIG_I2C=y
> -CONFIG_I2C_CHARDEV=y
> -CONFIG_I2C_OWL=y
> -CONFIG_PINCTRL=y
> -CONFIG_PINCTRL_OWL=y
> -CONFIG_PINCTRL_S500=y
> -CONFIG_POWER_RESET=y
> -CONFIG_POWER_RESET_ATC260X=y
> -CONFIG_MFD_ATC260X_I2C=y
> -CONFIG_REGULATOR=y
> -CONFIG_REGULATOR_FIXED_VOLTAGE=y
> -CONFIG_REGULATOR_ATC260X=y
> -# CONFIG_HID is not set
> -# CONFIG_USB_SUPPORT is not set
> -CONFIG_MMC=y
> -CONFIG_MMC_OWL=y
> -CONFIG_DMADEVICES=y
> -CONFIG_OWL_DMA=y
> -# CONFIG_VIRTIO_MENU is not set
> -# CONFIG_VHOST_MENU is not set
> -# CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_EXT4_FS=y
> -CONFIG_VFAT_FS=y
> -CONFIG_TMPFS=y
> -CONFIG_TMPFS_POSIX_ACL=y
> -# CONFIG_MISC_FILESYSTEMS is not set
> -# CONFIG_NETWORK_FILESYSTEMS is not set
> -CONFIG_NLS_CODEPAGE_437=y
> -CONFIG_NLS_ISO8859_1=y
> -# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> -# CONFIG_CRYPTO_HW is not set
> -# CONFIG_FTRACE is not set
> -# CONFIG_RUNTIME_TESTING_MENU is not set
> diff --git a/board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch b/board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch
> deleted file mode 100644
> index ae19a49031..0000000000
> --- a/board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch
> +++ /dev/null
> @@ -1,809 +0,0 @@
> -From 9b2c282b348dfe966bbba967dc7a45ce817cce50 Mon Sep 17 00:00:00 2001
> -From: Tom Rini <trini@konsulko.com>
> -Date: Mon, 29 Feb 2016 11:34:15 -0500
> -Subject: [PATCH] compiler*.h: sync include/linux/compiler*.h with Linux
> - 4.5-rc6
> -
> -Copy these from Linux v4.5-rc6 tag.
> -
> -This is needed so that we can keep up with newer gcc versions.  Note
> -that we don't have the uapi/ hierarchy from the kernel so continue to
> -use <linux/types.h>
> -
> -Signed-off-by: Tom Rini <trini@konsulko.com>
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - include/linux/compiler-gcc.h   | 259 ++++++++++++++++++++++++++++++++---------
> - include/linux/compiler-gcc3.h  |  23 ----
> - include/linux/compiler-gcc4.h  |  88 --------------
> - include/linux/compiler-gcc5.h  |  65 -----------
> - include/linux/compiler-intel.h |   5 +
> - include/linux/compiler.h       | 178 ++++++++++++++++++++++++++--
> - 6 files changed, 383 insertions(+), 235 deletions(-)
> - delete mode 100644 include/linux/compiler-gcc3.h
> - delete mode 100644 include/linux/compiler-gcc4.h
> - delete mode 100644 include/linux/compiler-gcc5.h
> -
> -diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> -index e057bd2a84..22ab246fee 100644
> ---- a/include/linux/compiler-gcc.h
> -+++ b/include/linux/compiler-gcc.h
> -@@ -5,14 +5,28 @@
> - /*
> -  * Common definitions for all gcc versions go here.
> -  */
> --#define GCC_VERSION (__GNUC__ * 10000 \
> --		   + __GNUC_MINOR__ * 100 \
> --		   + __GNUC_PATCHLEVEL__)
> --
> -+#define GCC_VERSION (__GNUC__ * 10000		\
> -+		     + __GNUC_MINOR__ * 100	\
> -+		     + __GNUC_PATCHLEVEL__)
> - 
> - /* Optimization barrier */
> -+
> - /* The "volatile" is due to gcc bugs */
> - #define barrier() __asm__ __volatile__("": : :"memory")
> -+/*
> -+ * This version is i.e. to prevent dead stores elimination on @ptr
> -+ * where gcc and llvm may behave differently when otherwise using
> -+ * normal barrier(): while gcc behavior gets along with a normal
> -+ * barrier(), llvm needs an explicit input variable to be assumed
> -+ * clobbered. The issue is as follows: while the inline asm might
> -+ * access any memory it wants, the compiler could have fit all of
> -+ * @ptr into memory registers instead, and since @ptr never escaped
> -+ * from that, it proofed that the inline asm wasn't touching any of
> -+ * it. This version works well with both compilers, i.e. we're telling
> -+ * the compiler that the inline asm absolutely may see the contents
> -+ * of @ptr. See also: https://llvm.org/bugs/show_bug.cgi?id=15495
> -+ */
> -+#define barrier_data(ptr) __asm__ __volatile__("": :"r"(ptr) :"memory")
> - 
> - /*
> -  * This macro obfuscates arithmetic on a variable address so that gcc
> -@@ -32,58 +46,63 @@
> -  * the inline assembly constraint from =g to =r, in this particular
> -  * case either is valid.
> -  */
> --#define RELOC_HIDE(ptr, off)					\
> --  ({ unsigned long __ptr;					\
> --    __asm__ ("" : "=r"(__ptr) : "0"(ptr));		\
> --    (typeof(ptr)) (__ptr + (off)); })
> -+#define RELOC_HIDE(ptr, off)						\
> -+({									\
> -+	unsigned long __ptr;						\
> -+	__asm__ ("" : "=r"(__ptr) : "0"(ptr));				\
> -+	(typeof(ptr)) (__ptr + (off));					\
> -+})
> - 
> - /* Make the optimizer believe the variable can be manipulated arbitrarily. */
> --#define OPTIMIZER_HIDE_VAR(var) __asm__ ("" : "=r" (var) : "0" (var))
> -+#define OPTIMIZER_HIDE_VAR(var)						\
> -+	__asm__ ("" : "=r" (var) : "0" (var))
> - 
> - #ifdef __CHECKER__
> --#define __must_be_array(arr) 0
> -+#define __must_be_array(a)	0
> - #else
> - /* &a[0] degrades to a pointer: a different type from an array */
> --#define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
> -+#define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
> - #endif
> - 
> - /*
> -  * Force always-inline if the user requests it so via the .config,
> -  * or if gcc is too old:
> -  */
> --#if !defined(CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING) || \
> -+#if !defined(CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING) ||		\
> -     !defined(CONFIG_OPTIMIZE_INLINING) || (__GNUC__ < 4)
> --# define inline		inline		__attribute__((always_inline)) notrace
> --# define __inline__	__inline__	__attribute__((always_inline)) notrace
> --# define __inline	__inline	__attribute__((always_inline)) notrace
> -+#define inline		inline		__attribute__((always_inline)) notrace
> -+#define __inline__	__inline__	__attribute__((always_inline)) notrace
> -+#define __inline	__inline	__attribute__((always_inline)) notrace
> - #else
> - /* A lot of inline functions can cause havoc with function tracing */
> --# define inline		inline		notrace
> --# define __inline__	__inline__	notrace
> --# define __inline	__inline	notrace
> -+#define inline		inline		notrace
> -+#define __inline__	__inline__	notrace
> -+#define __inline	__inline	notrace
> - #endif
> - 
> --#define __deprecated			__attribute__((deprecated))
> --#ifndef __packed
> --#define __packed			__attribute__((packed))
> --#endif
> --#ifndef __weak
> --#define __weak				__attribute__((weak))
> --#endif
> -+#define __always_inline	inline __attribute__((always_inline))
> -+#define  noinline	__attribute__((noinline))
> -+
> -+#define __deprecated	__attribute__((deprecated))
> -+#define __packed	__attribute__((packed))
> -+#define __weak		__attribute__((weak))
> -+#define __alias(symbol)	__attribute__((alias(#symbol)))
> - 
> - /*
> -- * it doesn't make sense on ARM (currently the only user of __naked) to trace
> -- * naked functions because then mcount is called without stack and frame pointer
> -- * being set up and there is no chance to restore the lr register to the value
> -- * before mcount was called.
> -+ * it doesn't make sense on ARM (currently the only user of __naked)
> -+ * to trace naked functions because then mcount is called without
> -+ * stack and frame pointer being set up and there is no chance to
> -+ * restore the lr register to the value before mcount was called.
> -+ *
> -+ * The asm() bodies of naked functions often depend on standard calling
> -+ * conventions, therefore they must be noinline and noclone.
> -  *
> -- * The asm() bodies of naked functions often depend on standard calling conventions,
> -- * therefore they must be noinline and noclone.  GCC 4.[56] currently fail to enforce
> -- * this, so we must do so ourselves.  See GCC PR44290.
> -+ * GCC 4.[56] currently fail to enforce this, so we must do so ourselves.
> -+ * See GCC PR44290.
> -  */
> --#define __naked				__attribute__((naked)) noinline __noclone notrace
> -+#define __naked		__attribute__((naked)) noinline __noclone notrace
> - 
> --#define __noreturn			__attribute__((noreturn))
> -+#define __noreturn	__attribute__((noreturn))
> - 
> - /*
> -  * From the GCC manual:
> -@@ -95,34 +114,170 @@
> -  * would be.
> -  * [...]
> -  */
> --#ifndef __pure
> --#define __pure				__attribute__((pure))
> -+#define __pure			__attribute__((pure))
> -+#define __aligned(x)		__attribute__((aligned(x)))
> -+#define __printf(a, b)		__attribute__((format(printf, a, b)))
> -+#define __scanf(a, b)		__attribute__((format(scanf, a, b)))
> -+#define __attribute_const__	__attribute__((__const__))
> -+#define __maybe_unused		__attribute__((unused))
> -+#define __always_unused		__attribute__((unused))
> -+
> -+/* gcc version specific checks */
> -+
> -+#if GCC_VERSION < 30200
> -+# error Sorry, your compiler is too old - please upgrade it.
> -+#endif
> -+
> -+#if GCC_VERSION < 30300
> -+# define __used			__attribute__((__unused__))
> -+#else
> -+# define __used			__attribute__((__used__))
> -+#endif
> -+
> -+#ifdef CONFIG_GCOV_KERNEL
> -+# if GCC_VERSION < 30400
> -+#   error "GCOV profiling support for gcc versions below 3.4 not included"
> -+# endif /* __GNUC_MINOR__ */
> -+#endif /* CONFIG_GCOV_KERNEL */
> -+
> -+#if GCC_VERSION >= 30400
> -+#define __must_check		__attribute__((warn_unused_result))
> -+#endif
> -+
> -+#if GCC_VERSION >= 40000
> -+
> -+/* GCC 4.1.[01] miscompiles __weak */
> -+#ifdef __KERNEL__
> -+# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
> -+#  error Your version of gcc miscompiles the __weak directive
> -+# endif
> -+#endif
> -+
> -+#define __used			__attribute__((__used__))
> -+#define __compiler_offsetof(a, b)					\
> -+	__builtin_offsetof(a, b)
> -+
> -+#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
> -+# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
> -+#endif
> -+
> -+#if GCC_VERSION >= 40300
> -+/* Mark functions as cold. gcc will assume any path leading to a call
> -+ * to them will be unlikely.  This means a lot of manual unlikely()s
> -+ * are unnecessary now for any paths leading to the usual suspects
> -+ * like BUG(), printk(), panic() etc. [but let's keep them for now for
> -+ * older compilers]
> -+ *
> -+ * Early snapshots of gcc 4.3 don't support this and we can't detect this
> -+ * in the preprocessor, but we can live with this because they're unreleased.
> -+ * Maketime probing would be overkill here.
> -+ *
> -+ * gcc also has a __attribute__((__hot__)) to move hot functions into
> -+ * a special section, but I don't see any sense in this right now in
> -+ * the kernel context
> -+ */
> -+#define __cold			__attribute__((__cold__))
> -+
> -+#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
> -+
> -+#ifndef __CHECKER__
> -+# define __compiletime_warning(message) __attribute__((warning(message)))
> -+# define __compiletime_error(message) __attribute__((error(message)))
> -+#endif /* __CHECKER__ */
> -+#endif /* GCC_VERSION >= 40300 */
> -+
> -+#if GCC_VERSION >= 40500
> -+/*
> -+ * Mark a position in code as unreachable.  This can be used to
> -+ * suppress control flow warnings after asm blocks that transfer
> -+ * control elsewhere.
> -+ *
> -+ * Early snapshots of gcc 4.5 don't support this and we can't detect
> -+ * this in the preprocessor, but we can live with this because they're
> -+ * unreleased.  Really, we need to have autoconf for the kernel.
> -+ */
> -+#define unreachable() __builtin_unreachable()
> -+
> -+/* Mark a function definition as prohibited from being cloned. */
> -+#define __noclone	__attribute__((__noclone__))
> -+
> -+#endif /* GCC_VERSION >= 40500 */
> -+
> -+#if GCC_VERSION >= 40600
> -+/*
> -+ * When used with Link Time Optimization, gcc can optimize away C functions or
> -+ * variables which are referenced only from assembly code.  __visible tells the
> -+ * optimizer that something else uses this function or variable, thus preventing
> -+ * this.
> -+ */
> -+#define __visible	__attribute__((externally_visible))
> - #endif
> --#ifndef __aligned
> --#define __aligned(x)			__attribute__((aligned(x)))
> -+
> -+
> -+#if GCC_VERSION >= 40900 && !defined(__CHECKER__)
> -+/*
> -+ * __assume_aligned(n, k): Tell the optimizer that the returned
> -+ * pointer can be assumed to be k modulo n. The second argument is
> -+ * optional (default 0), so we use a variadic macro to make the
> -+ * shorthand.
> -+ *
> -+ * Beware: Do not apply this to functions which may return
> -+ * ERR_PTRs. Also, it is probably unwise to apply it to functions
> -+ * returning extra information in the low bits (but in that case the
> -+ * compiler should see some alignment anyway, when the return value is
> -+ * massaged by 'flags = ptr & 3; ptr &= ~3;').
> -+ */
> -+#define __assume_aligned(a, ...) __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
> - #endif
> --#define __printf(a, b)			__attribute__((format(printf, a, b)))
> --#define __scanf(a, b)			__attribute__((format(scanf, a, b)))
> --#define  noinline			__attribute__((noinline))
> --#define __attribute_const__		__attribute__((__const__))
> --#define __maybe_unused			__attribute__((unused))
> --#define __always_unused			__attribute__((unused))
> - 
> --#define __gcc_header(x) #x
> --#define _gcc_header(x) __gcc_header(linux/compiler-gcc##x.h)
> --#define gcc_header(x) _gcc_header(x)
> --#include gcc_header(__GNUC__)
> -+/*
> -+ * GCC 'asm goto' miscompiles certain code sequences:
> -+ *
> -+ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
> -+ *
> -+ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
> -+ *
> -+ * (asm goto is automatically volatile - the naming reflects this.)
> -+ */
> -+#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
> -+
> -+#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
> -+#if GCC_VERSION >= 40400
> -+#define __HAVE_BUILTIN_BSWAP32__
> -+#define __HAVE_BUILTIN_BSWAP64__
> -+#endif
> -+#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
> -+#define __HAVE_BUILTIN_BSWAP16__
> -+#endif
> -+#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
> -+
> -+#if GCC_VERSION >= 50000
> -+#define KASAN_ABI_VERSION 4
> -+#elif GCC_VERSION >= 40902
> -+#define KASAN_ABI_VERSION 3
> -+#endif
> -+
> -+#if GCC_VERSION >= 40902
> -+/*
> -+ * Tell the compiler that address safety instrumentation (KASAN)
> -+ * should not be applied to that function.
> -+ * Conflicts with inlining: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67368
> -+ */
> -+#define __no_sanitize_address __attribute__((no_sanitize_address))
> -+#endif
> -+
> -+#endif	/* gcc version >= 40000 specific checks */
> - 
> - #if !defined(__noclone)
> - #define __noclone	/* not needed */
> - #endif
> - 
> -+#if !defined(__no_sanitize_address)
> -+#define __no_sanitize_address
> -+#endif
> -+
> - /*
> -  * A trick to suppress uninitialized variable warning without generating any
> -  * code
> -  */
> - #define uninitialized_var(x) x = x
> --
> --#ifndef __always_inline
> --#define __always_inline		inline __attribute__((always_inline))
> --#endif
> -diff --git a/include/linux/compiler-gcc3.h b/include/linux/compiler-gcc3.h
> -deleted file mode 100644
> -index 7d89febe4d..0000000000
> ---- a/include/linux/compiler-gcc3.h
> -+++ /dev/null
> -@@ -1,23 +0,0 @@
> --#ifndef __LINUX_COMPILER_H
> --#error "Please don't include <linux/compiler-gcc3.h> directly, include <linux/compiler.h> instead."
> --#endif
> --
> --#if GCC_VERSION < 30200
> --# error Sorry, your compiler is too old - please upgrade it.
> --#endif
> --
> --#if GCC_VERSION >= 30300
> --# define __used			__attribute__((__used__))
> --#else
> --# define __used			__attribute__((__unused__))
> --#endif
> --
> --#if GCC_VERSION >= 30400
> --#define __must_check		__attribute__((warn_unused_result))
> --#endif
> --
> --#ifdef CONFIG_GCOV_KERNEL
> --# if GCC_VERSION < 30400
> --#   error "GCOV profiling support for gcc versions below 3.4 not included"
> --# endif /* __GNUC_MINOR__ */
> --#endif /* CONFIG_GCOV_KERNEL */
> -diff --git a/include/linux/compiler-gcc4.h b/include/linux/compiler-gcc4.h
> -deleted file mode 100644
> -index 2507fd2a1e..0000000000
> ---- a/include/linux/compiler-gcc4.h
> -+++ /dev/null
> -@@ -1,88 +0,0 @@
> --#ifndef __LINUX_COMPILER_H
> --#error "Please don't include <linux/compiler-gcc4.h> directly, include <linux/compiler.h> instead."
> --#endif
> --
> --/* GCC 4.1.[01] miscompiles __weak */
> --#ifdef __KERNEL__
> --# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
> --#  error Your version of gcc miscompiles the __weak directive
> --# endif
> --#endif
> --
> --#define __used			__attribute__((__used__))
> --#define __must_check 		__attribute__((warn_unused_result))
> --#define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
> --
> --#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
> --# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
> --#endif
> --
> --#if GCC_VERSION >= 40300
> --/* Mark functions as cold. gcc will assume any path leading to a call
> --   to them will be unlikely.  This means a lot of manual unlikely()s
> --   are unnecessary now for any paths leading to the usual suspects
> --   like BUG(), printk(), panic() etc. [but let's keep them for now for
> --   older compilers]
> --
> --   Early snapshots of gcc 4.3 don't support this and we can't detect this
> --   in the preprocessor, but we can live with this because they're unreleased.
> --   Maketime probing would be overkill here.
> --
> --   gcc also has a __attribute__((__hot__)) to move hot functions into
> --   a special section, but I don't see any sense in this right now in
> --   the kernel context */
> --#define __cold			__attribute__((__cold__))
> --
> --#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
> --
> --#ifndef __CHECKER__
> --# define __compiletime_warning(message) __attribute__((warning(message)))
> --# define __compiletime_error(message) __attribute__((error(message)))
> --#endif /* __CHECKER__ */
> --#endif /* GCC_VERSION >= 40300 */
> --
> --#if GCC_VERSION >= 40500
> --/*
> -- * Mark a position in code as unreachable.  This can be used to
> -- * suppress control flow warnings after asm blocks that transfer
> -- * control elsewhere.
> -- *
> -- * Early snapshots of gcc 4.5 don't support this and we can't detect
> -- * this in the preprocessor, but we can live with this because they're
> -- * unreleased.  Really, we need to have autoconf for the kernel.
> -- */
> --#define unreachable() __builtin_unreachable()
> --
> --/* Mark a function definition as prohibited from being cloned. */
> --#define __noclone	__attribute__((__noclone__))
> --
> --#endif /* GCC_VERSION >= 40500 */
> --
> --#if GCC_VERSION >= 40600
> --/*
> -- * Tell the optimizer that something else uses this function or variable.
> -- */
> --#define __visible __attribute__((externally_visible))
> --#endif
> --
> --/*
> -- * GCC 'asm goto' miscompiles certain code sequences:
> -- *
> -- *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
> -- *
> -- * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
> -- * Fixed in GCC 4.8.2 and later versions.
> -- *
> -- * (asm goto is automatically volatile - the naming reflects this.)
> -- */
> --#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
> --
> --#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
> --#if GCC_VERSION >= 40400
> --#define __HAVE_BUILTIN_BSWAP32__
> --#define __HAVE_BUILTIN_BSWAP64__
> --#endif
> --#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
> --#define __HAVE_BUILTIN_BSWAP16__
> --#endif
> --#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
> -diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
> -deleted file mode 100644
> -index c8c5659525..0000000000
> ---- a/include/linux/compiler-gcc5.h
> -+++ /dev/null
> -@@ -1,65 +0,0 @@
> --#ifndef __LINUX_COMPILER_H
> --#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
> --#endif
> --
> --#define __used				__attribute__((__used__))
> --#define __must_check			__attribute__((warn_unused_result))
> --#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
> --
> --/* Mark functions as cold. gcc will assume any path leading to a call
> --   to them will be unlikely.  This means a lot of manual unlikely()s
> --   are unnecessary now for any paths leading to the usual suspects
> --   like BUG(), printk(), panic() etc. [but let's keep them for now for
> --   older compilers]
> --
> --   Early snapshots of gcc 4.3 don't support this and we can't detect this
> --   in the preprocessor, but we can live with this because they're unreleased.
> --   Maketime probing would be overkill here.
> --
> --   gcc also has a __attribute__((__hot__)) to move hot functions into
> --   a special section, but I don't see any sense in this right now in
> --   the kernel context */
> --#define __cold			__attribute__((__cold__))
> --
> --#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
> --
> --#ifndef __CHECKER__
> --# define __compiletime_warning(message) __attribute__((warning(message)))
> --# define __compiletime_error(message) __attribute__((error(message)))
> --#endif /* __CHECKER__ */
> --
> --/*
> -- * Mark a position in code as unreachable.  This can be used to
> -- * suppress control flow warnings after asm blocks that transfer
> -- * control elsewhere.
> -- *
> -- * Early snapshots of gcc 4.5 don't support this and we can't detect
> -- * this in the preprocessor, but we can live with this because they're
> -- * unreleased.  Really, we need to have autoconf for the kernel.
> -- */
> --#define unreachable() __builtin_unreachable()
> --
> --/* Mark a function definition as prohibited from being cloned. */
> --#define __noclone	__attribute__((__noclone__))
> --
> --/*
> -- * Tell the optimizer that something else uses this function or variable.
> -- */
> --#define __visible __attribute__((externally_visible))
> --
> --/*
> -- * GCC 'asm goto' miscompiles certain code sequences:
> -- *
> -- *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
> -- *
> -- * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
> -- *
> -- * (asm goto is automatically volatile - the naming reflects this.)
> -- */
> --#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
> --
> --#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
> --#define __HAVE_BUILTIN_BSWAP32__
> --#define __HAVE_BUILTIN_BSWAP64__
> --#define __HAVE_BUILTIN_BSWAP16__
> --#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
> -diff --git a/include/linux/compiler-intel.h b/include/linux/compiler-intel.h
> -index ba147a1727..d4c71132d0 100644
> ---- a/include/linux/compiler-intel.h
> -+++ b/include/linux/compiler-intel.h
> -@@ -13,9 +13,14 @@
> - /* Intel ECC compiler doesn't support gcc specific asm stmts.
> -  * It uses intrinsics to do the equivalent things.
> -  */
> -+#undef barrier
> -+#undef barrier_data
> - #undef RELOC_HIDE
> - #undef OPTIMIZER_HIDE_VAR
> - 
> -+#define barrier() __memory_barrier()
> -+#define barrier_data(ptr) barrier()
> -+
> - #define RELOC_HIDE(ptr, off)					\
> -   ({ unsigned long __ptr;					\
> -      __ptr = (unsigned long) (ptr);				\
> -diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> -index d5ad7b1118..020ad16a04 100644
> ---- a/include/linux/compiler.h
> -+++ b/include/linux/compiler.h
> -@@ -17,6 +17,7 @@
> - # define __release(x)	__context__(x,-1)
> - # define __cond_lock(x,c)	((c) ? ({ __acquire(x); 1; }) : 0)
> - # define __percpu	__attribute__((noderef, address_space(3)))
> -+# define __pmem		__attribute__((noderef, address_space(5)))
> - #ifdef CONFIG_SPARSE_RCU_POINTER
> - # define __rcu		__attribute__((noderef, address_space(4)))
> - #else
> -@@ -42,6 +43,7 @@ extern void __chk_io_ptr(const volatile void __iomem *);
> - # define __cond_lock(x,c) (c)
> - # define __percpu
> - # define __rcu
> -+# define __pmem
> - #endif
> - 
> - /* Indirect macros required for expanded argument pasting, eg. __LINE__. */
> -@@ -54,7 +56,11 @@ extern void __chk_io_ptr(const volatile void __iomem *);
> - #include <linux/compiler-gcc.h>
> - #endif
> - 
> -+#if defined(CC_USING_HOTPATCH) && !defined(__CHECKER__)
> -+#define notrace __attribute__((hotpatch(0,0)))
> -+#else
> - #define notrace __attribute__((no_instrument_function))
> -+#endif
> - 
> - /* Intel compiler defines __GNUC__. So we will overwrite implementations
> -  * coming from above header files here
> -@@ -138,7 +144,7 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
> -  */
> - #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
> - #define __trace_if(cond) \
> --	if (__builtin_constant_p((cond)) ? !!(cond) :			\
> -+	if (__builtin_constant_p(!!(cond)) ? !!(cond) :			\
> - 	({								\
> - 		int ______r;						\
> - 		static struct ftrace_branch_data			\
> -@@ -165,6 +171,10 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
> - # define barrier() __memory_barrier()
> - #endif
> - 
> -+#ifndef barrier_data
> -+# define barrier_data(ptr) barrier()
> -+#endif
> -+
> - /* Unreachable code */
> - #ifndef unreachable
> - # define unreachable() do { } while (1)
> -@@ -186,6 +196,126 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
> - # define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __LINE__)
> - #endif
> - 
> -+#include <linux/types.h>
> -+
> -+#define __READ_ONCE_SIZE						\
> -+({									\
> -+	switch (size) {							\
> -+	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;		\
> -+	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;		\
> -+	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;		\
> -+	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;		\
> -+	default:							\
> -+		barrier();						\
> -+		__builtin_memcpy((void *)res, (const void *)p, size);	\
> -+		barrier();						\
> -+	}								\
> -+})
> -+
> -+static __always_inline
> -+void __read_once_size(const volatile void *p, void *res, int size)
> -+{
> -+	__READ_ONCE_SIZE;
> -+}
> -+
> -+#ifdef CONFIG_KASAN
> -+/*
> -+ * This function is not 'inline' because __no_sanitize_address confilcts
> -+ * with inlining. Attempt to inline it may cause a build failure.
> -+ * 	https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67368
> -+ * '__maybe_unused' allows us to avoid defined-but-not-used warnings.
> -+ */
> -+static __no_sanitize_address __maybe_unused
> -+void __read_once_size_nocheck(const volatile void *p, void *res, int size)
> -+{
> -+	__READ_ONCE_SIZE;
> -+}
> -+#else
> -+static __always_inline
> -+void __read_once_size_nocheck(const volatile void *p, void *res, int size)
> -+{
> -+	__READ_ONCE_SIZE;
> -+}
> -+#endif
> -+
> -+static __always_inline void __write_once_size(volatile void *p, void *res, int size)
> -+{
> -+	switch (size) {
> -+	case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
> -+	case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
> -+	case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
> -+	case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
> -+	default:
> -+		barrier();
> -+		__builtin_memcpy((void *)p, (const void *)res, size);
> -+		barrier();
> -+	}
> -+}
> -+
> -+/*
> -+ * Prevent the compiler from merging or refetching reads or writes. The
> -+ * compiler is also forbidden from reordering successive instances of
> -+ * READ_ONCE, WRITE_ONCE and ACCESS_ONCE (see below), but only when the
> -+ * compiler is aware of some particular ordering.  One way to make the
> -+ * compiler aware of ordering is to put the two invocations of READ_ONCE,
> -+ * WRITE_ONCE or ACCESS_ONCE() in different C statements.
> -+ *
> -+ * In contrast to ACCESS_ONCE these two macros will also work on aggregate
> -+ * data types like structs or unions. If the size of the accessed data
> -+ * type exceeds the word size of the machine (e.g., 32 bits or 64 bits)
> -+ * READ_ONCE() and WRITE_ONCE()  will fall back to memcpy and print a
> -+ * compile-time warning.
> -+ *
> -+ * Their two major use cases are: (1) Mediating communication between
> -+ * process-level code and irq/NMI handlers, all running on the same CPU,
> -+ * and (2) Ensuring that the compiler does not  fold, spindle, or otherwise
> -+ * mutilate accesses that either do not require ordering or that interact
> -+ * with an explicit memory barrier or atomic instruction that provides the
> -+ * required ordering.
> -+ */
> -+
> -+#define __READ_ONCE(x, check)						\
> -+({									\
> -+	union { typeof(x) __val; char __c[1]; } __u;			\
> -+	if (check)							\
> -+		__read_once_size(&(x), __u.__c, sizeof(x));		\
> -+	else								\
> -+		__read_once_size_nocheck(&(x), __u.__c, sizeof(x));	\
> -+	__u.__val;							\
> -+})
> -+#define READ_ONCE(x) __READ_ONCE(x, 1)
> -+
> -+/*
> -+ * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need
> -+ * to hide memory access from KASAN.
> -+ */
> -+#define READ_ONCE_NOCHECK(x) __READ_ONCE(x, 0)
> -+
> -+#define WRITE_ONCE(x, val) \
> -+({							\
> -+	union { typeof(x) __val; char __c[1]; } __u =	\
> -+		{ .__val = (__force typeof(x)) (val) }; \
> -+	__write_once_size(&(x), __u.__c, sizeof(x));	\
> -+	__u.__val;					\
> -+})
> -+
> -+/**
> -+ * smp_cond_acquire() - Spin wait for cond with ACQUIRE ordering
> -+ * @cond: boolean expression to wait for
> -+ *
> -+ * Equivalent to using smp_load_acquire() on the condition variable but employs
> -+ * the control dependency of the wait to reduce the barrier on many platforms.
> -+ *
> -+ * The control dependency provides a LOAD->STORE order, the additional RMB
> -+ * provides LOAD->LOAD order, together they provide LOAD->{LOAD,STORE} order,
> -+ * aka. ACQUIRE.
> -+ */
> -+#define smp_cond_acquire(cond)	do {		\
> -+	while (!(cond))				\
> -+		cpu_relax();			\
> -+	smp_rmb(); /* ctrl + rmb := acquire */	\
> -+} while (0)
> -+
> - #endif /* __KERNEL__ */
> - 
> - #endif /* __ASSEMBLY__ */
> -@@ -304,6 +434,14 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
> - #define __visible
> - #endif
> - 
> -+/*
> -+ * Assume alignment of return value.
> -+ */
> -+#ifndef __assume_aligned
> -+#define __assume_aligned(a, ...)
> -+#endif
> -+
> -+
> - /* Are two types/vars the same type (ignoring qualifiers)? */
> - #ifndef __same_type
> - # define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
> -@@ -311,7 +449,7 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
> - 
> - /* Is this type a native word size -- useful for atomic operations */
> - #ifndef __native_word
> --# define __native_word(t) (sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
> -+# define __native_word(t) (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
> - #endif
> - 
> - /* Compile time object size, -1 for unknown */
> -@@ -373,12 +511,38 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
> -  * to make the compiler aware of ordering is to put the two invocations of
> -  * ACCESS_ONCE() in different C statements.
> -  *
> -- * This macro does absolutely -nothing- to prevent the CPU from reordering,
> -- * merging, or refetching absolutely anything at any time.  Its main intended
> -- * use is to mediate communication between process-level code and irq/NMI
> -- * handlers, all running on the same CPU.
> -+ * ACCESS_ONCE will only work on scalar types. For union types, ACCESS_ONCE
> -+ * on a union member will work as long as the size of the member matches the
> -+ * size of the union and the size is smaller than word size.
> -+ *
> -+ * The major use cases of ACCESS_ONCE used to be (1) Mediating communication
> -+ * between process-level code and irq/NMI handlers, all running on the same CPU,
> -+ * and (2) Ensuring that the compiler does not  fold, spindle, or otherwise
> -+ * mutilate accesses that either do not require ordering or that interact
> -+ * with an explicit memory barrier or atomic instruction that provides the
> -+ * required ordering.
> -+ *
> -+ * If possible use READ_ONCE()/WRITE_ONCE() instead.
> -+ */
> -+#define __ACCESS_ONCE(x) ({ \
> -+	 __maybe_unused typeof(x) __var = (__force typeof(x)) 0; \
> -+	(volatile typeof(x) *)&(x); })
> -+#define ACCESS_ONCE(x) (*__ACCESS_ONCE(x))
> -+
> -+/**
> -+ * lockless_dereference() - safely load a pointer for later dereference
> -+ * @p: The pointer to load
> -+ *
> -+ * Similar to rcu_dereference(), but for situations where the pointed-to
> -+ * object's lifetime is managed by something other than RCU.  That
> -+ * "something other" might be reference counting or simple immortality.
> -  */
> --#define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
> -+#define lockless_dereference(p) \
> -+({ \
> -+	typeof(p) _________p1 = READ_ONCE(p); \
> -+	smp_read_barrier_depends(); /* Dependency order vs. p above. */ \
> -+	(_________p1); \
> -+})
> - 
> - /* Ignore/forbid kprobes attach on very low level functions marked by this attribute: */
> - #ifdef CONFIG_KPROBES
> --- 
> -2.11.0
> -
> diff --git a/board/roseapplepi/post-build.sh b/board/roseapplepi/post-build.sh
> deleted file mode 100755
> index ffdd19138c..0000000000
> --- a/board/roseapplepi/post-build.sh
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -#!/bin/sh
> -BOARD_DIR="$(dirname $0)"
> -
> -cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
> diff --git a/board/roseapplepi/uEnv.txt b/board/roseapplepi/uEnv.txt
> deleted file mode 100644
> index 339eb8aa0a..0000000000
> --- a/board/roseapplepi/uEnv.txt
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# no ramdisk
> -ramdisk_addr_r=-
> -bootargs=console=ttyOWL2,115200 root=/dev/mmcblk0p2 rootwait clk_ignore_unused
> diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
> deleted file mode 100644
> index 045bdfede2..0000000000
> --- a/configs/roseapplepi_defconfig
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -BR2_arm=y
> -BR2_cortex_a9=y
> -BR2_ARM_ENABLE_NEON=y
> -BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> -BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
> -BR2_SYSTEM_DHCP="eth0"
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/roseapplepi/post-build.sh"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.14"
> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
> -BR2_LINUX_KERNEL_UIMAGE=y
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="owl-s500-roseapplepi"
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -BR2_TARGET_S500_BOOTLOADER=y
> -BR2_TARGET_S500_BOOTLOADER_BOARD="linux/bubble_gum_sd"
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/xapp-le/u-boot.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a035d2673a90143a1a74557503b2e137b1447ae6"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="actduino_bubble_gum_v10"
> -BR2_TARGET_UBOOT_NEEDS_DTC=y
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
