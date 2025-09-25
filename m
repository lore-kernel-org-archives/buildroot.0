Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159A7CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D2D41703;
	Thu, 25 Sep 2025 20:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPzoiZrCdFHX; Thu, 25 Sep 2025 20:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3827416C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3827416C0;
	Thu, 25 Sep 2025 20:17:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D476C12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5617615F9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxBmjF1GG3cj for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C07156157A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C07156157A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C07156157A
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46c889b310dso11039415e9.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831440; x=1759436240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkDQEO+CM2z1yc52RwJIA68xGaqXcnCua1lpAjL3JDQ=;
 b=QpGRhaCf21zodVSxbtBWqIfWXBj6rVftKNBu7nxiO0dYjq3vun+PuZ9q9SDKvyXp0V
 Jt0IQTjtwWbuf7vzodhwXH6mS2SvnvxOu4RrzmQ+CDhZSykQHmS1UN5neAqO5YIFYIqQ
 8iqQJdh3ZOJBpI6/7qebV0nJavDoye/pdqPXqCQOiQ46jJzjXcBbMiyqsSBvH3rojjUa
 cdfxpyP80LhEWCvnaswOZFmA6idSTaMnBAaoWAiYbQX6KtAyteFPx5hi6qVFV0BbM8Ix
 3Lyqy3xZ23Tjykqkpe6wqL0SjZFgL2YXscQdJtsC6xuBR4g7ztwqvTJeP6DoB7sv23sH
 Wszw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWjzJIY0zI68oBhIUu+rPhAuWkUX77x+97LDx4y8cDKoDY4vtv+5CN0K6NhBXUgeFQ4hufTRUfD7U=@buildroot.org
X-Gm-Message-State: AOJu0Yzd8o1gZzZNNWLvya8uU+NjM3QXTqB0aA2nMftO15ZSWSoK3aVr
 VRI5wFhz0tLs32M84XhaRoo1I2JUxPFTW6aCx/3fm4LH4w7GC7+VvNcZN8IQbijNyJgJlFQahHF
 dGfx4IDg=
X-Gm-Gg: ASbGncu9+5R5e+ekiTTNkcKainC6mCxFRShI+VI0Asg8q62buf33X7eR61QlwJ0M3SV
 9+KEWJBtiKYPzdruCIkm03kqHhMRae7qqT0KySrGhiH+PCGpupr/XMsTPUqfn/fowbycE6FSL6r
 dsTDY5f6VzTiCNFBR9KOREWuIoznQL2WaVEctFIbX83Md+4O8WGfJApbbDpljFQVVOAuLjLnpaH
 qzCjHX+sXWpO8hkA7hRTNr3DZk0nQIFX9JdXP4msr7yyXZgOV4F63E5X0EJKVehKhdD8Q6PWer+
 MgjfMOc51UYS2X13Q6czPURGVt3EAYNotZ2Kbr5L/550IMz6pmo6Sw+r3PfWIV7bZkRL7ve5L+y
 89Ewx/sD5z6USe7k=
X-Google-Smtp-Source: AGHT+IGAhx6wAX+OsvYJsV9A6NGSuyQp33ZYQgZI9VM2zv8iwrDXcSDLME3yWID2KEOKVNFXICuxgQ==
X-Received: by 2002:a05:600c:4d01:b0:459:d577:bd24 with SMTP id
 5b1f17b1804b1-46e33c36bacmr25084265e9.7.1758831439573; 
 Thu, 25 Sep 2025 13:17:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb871d051sm4302041f8f.14.2025.09.25.13.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:19 -0700 (PDT)
To: Scott Fan <fancp2007@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:18 +0200
Message-ID: <20250925201718.44889-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918174133.6713-1-fancp2007@gmail.com>
References: <20250918174133.6713-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831440; x=1759436240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkDQEO+CM2z1yc52RwJIA68xGaqXcnCua1lpAjL3JDQ=;
 b=hYp/Afb5EiEPBiVSysp6S1jlx/B/7AoEw/U9u9Zsy5iBERaDQ/IyCzS+p7p1uyoD+C
 k6/vQaAU15DyhfJSsV1sO0TcwpWzGVV6QxZRFdBfeQkvcFjNMOZmT7SCkPj5RZPZurzQ
 75/duN2i5QI0fmnf5Q/55AFHhCUJQBpuZTO3wSg3/57DIO9NqnYhQIoFuiae45v/q2hU
 Z/qiui237fYUNi4jhdtH9JUS/A7z9SyHDamd0t2Az6AV07t4UAyMXkL1B2kYEIQDOd/t
 ARaSUgAx15Is37O0rn2BouRSrQp3DIdeI3xjJk5ltHo+bTsoZPbakAEBCyMm37ZdUDbr
 +sIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hYp/Afb5
Subject: Re: [Buildroot] [PATCH] configs/qemu: update defconfigs to Linux
 6.12.47
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
> Update all qemu defconfigs to the latest Kernel LTS version.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to 2025.08.x. Thanks

> ---
>  ...g-specified-in-KBUILD_CFLAGS-to-vdso.patch | 52 -------------------
>  ...2-powerpc-boot-Fix-build-with-gcc-15.patch | 38 --------------
>  board/qemu/patches/linux/linux.hash           |  2 +-
>  configs/qemu_aarch64_ebbr_defconfig           |  2 +-
>  configs/qemu_aarch64_sbsa_defconfig           |  2 +-
>  configs/qemu_aarch64_virt_defconfig           |  2 +-
>  configs/qemu_arm_ebbr_defconfig               |  2 +-
>  configs/qemu_arm_versatile_defconfig          |  2 +-
>  configs/qemu_arm_vexpress_defconfig           |  2 +-
>  configs/qemu_arm_vexpress_tz_defconfig        |  2 +-
>  configs/qemu_loongarch64_virt_efi_defconfig   |  2 +-
>  configs/qemu_m68k_mcf5208_defconfig           |  2 +-
>  configs/qemu_m68k_q800_defconfig              |  2 +-
>  configs/qemu_microblazebe_mmu_defconfig       |  2 +-
>  configs/qemu_microblazeel_mmu_defconfig       |  2 +-
>  configs/qemu_mips32r2_malta_defconfig         |  2 +-
>  configs/qemu_mips32r2el_malta_defconfig       |  2 +-
>  configs/qemu_mips32r6_malta_defconfig         |  2 +-
>  configs/qemu_mips32r6el_malta_defconfig       |  2 +-
>  configs/qemu_mips64_malta_defconfig           |  2 +-
>  configs/qemu_mips64el_malta_defconfig         |  2 +-
>  configs/qemu_mips64r6_malta_defconfig         |  2 +-
>  configs/qemu_mips64r6el_malta_defconfig       |  2 +-
>  configs/qemu_or1k_defconfig                   |  2 +-
>  configs/qemu_ppc64_e5500_defconfig            |  2 +-
>  configs/qemu_ppc64_pseries_defconfig          |  2 +-
>  configs/qemu_ppc64le_powernv8_defconfig       |  2 +-
>  configs/qemu_ppc64le_pseries_defconfig        |  2 +-
>  configs/qemu_ppc_bamboo_defconfig             |  2 +-
>  configs/qemu_ppc_e500mc_defconfig             |  2 +-
>  configs/qemu_ppc_g3beige_defconfig            |  2 +-
>  configs/qemu_ppc_mac99_defconfig              |  2 +-
>  configs/qemu_ppc_mpc8544ds_defconfig          |  2 +-
>  configs/qemu_riscv32_nommu_virt_defconfig     |  2 +-
>  configs/qemu_riscv32_virt_defconfig           |  2 +-
>  configs/qemu_riscv64_nommu_virt_defconfig     |  2 +-
>  configs/qemu_riscv64_virt_defconfig           |  2 +-
>  configs/qemu_riscv64_virt_efi_defconfig       |  2 +-
>  configs/qemu_s390x_defconfig                  |  2 +-
>  configs/qemu_sh4_r2d_defconfig                |  2 +-
>  configs/qemu_sh4eb_r2d_defconfig              |  2 +-
>  configs/qemu_sparc64_sun4u_defconfig          |  2 +-
>  configs/qemu_sparc_ss10_defconfig             |  2 +-
>  configs/qemu_x86_64_defconfig                 |  2 +-
>  configs/qemu_x86_defconfig                    |  2 +-
>  configs/qemu_xtensa_lx60_defconfig            |  2 +-
>  configs/qemu_xtensa_lx60_nommu_defconfig      |  2 +-
>  47 files changed, 45 insertions(+), 135 deletions(-)
>  delete mode 100644 board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
>  delete mode 100644 board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
> 
> diff --git a/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch b/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
> deleted file mode 100644
> index 630fcf6315..0000000000
> --- a/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From c94606e06b54bc7b909fb342aa8dae732b50f5cd Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 29 Mar 2025 08:39:03 -0700
> -Subject: [PATCH] mips: Add -std= flag specified in KBUILD_CFLAGS to vdso
> - CFLAGS
> -
> -GCC 15 changed the default C standard dialect from gnu17 to gnu23,
> -which should not have impacted the kernel because it explicitly requests
> -the gnu11 standard in the main Makefile. However, mips/vdso code uses
> -its own CFLAGS without a '-std=' value, which break with this dialect
> -change because of the kernel's own definitions of bool, false, and true
> -conflicting with the C23 reserved keywords.
> -
> -  include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
> -     11 |         false   = 0,
> -        |         ^~~~~
> -  include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
> -  include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
> -     35 | typedef _Bool                   bool;
> -        |                                 ^~~~
> -  include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards
> -
> -Add -std as specified in KBUILD_CFLAGS to the decompressor and purgatory
> -CFLAGS to eliminate these errors and make the C standard version of these
> -areas match the rest of the kernel.
> -
> -Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=0f4ae7c6ecb89bfda026d210dcf8216fb67d2333
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Cc: stable@vger.kernel.org
> -Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> -[Romain: backport to 6.12.27]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - arch/mips/vdso/Makefile | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> -index b289b2c1b294..c729bd687804 100644
> ---- a/arch/mips/vdso/Makefile
> -+++ b/arch/mips/vdso/Makefile
> -@@ -27,6 +27,7 @@ endif
> - # offsets.
> - cflags-vdso := $(ccflags-vdso) \
> - 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
> -+	$(filter -std=%,$(KBUILD_CFLAGS)) \
> - 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
> - 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
> - 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
> --- 
> -2.49.0
> -
> diff --git a/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch b/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
> deleted file mode 100644
> index 78a4034a32..0000000000
> --- a/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 2d04c5b3c5728cd5e5202176e8796ffc0085c24a Mon Sep 17 00:00:00 2001
> -From: Michal Suchanek <msuchanek@suse.de>
> -Date: Mon, 31 Mar 2025 12:57:19 +0200
> -Subject: [PATCH] powerpc/boot: Fix build with gcc 15
> -
> -Similar to x86 the ppc boot code does not build with GCC 15.
> -
> -Copy the fix from
> -commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> -
> -Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next-test&id=5a821e2d69e26b51b7f3740b6b0c3462b8cacaff
> -
> -Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> -Tested-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> -Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> -Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> -Link: https://patch.msgid.link/20250331105722.19709-1-msuchanek@suse.de
> -[Romain: backport to 6.12.27]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - arch/powerpc/boot/Makefile | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> -index fa8518067d38..60a495771c05 100644
> ---- a/arch/powerpc/boot/Makefile
> -+++ b/arch/powerpc/boot/Makefile
> -@@ -70,6 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
> - BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
> - 
> - BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
> -+		   -std=gnu11 \
> - 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> - 		   -fno-strict-aliasing -O2 \
> - 		   -msoft-float -mno-altivec -mno-vsx \
> --- 
> -2.49.0
> -
> diff --git a/board/qemu/patches/linux/linux.hash b/board/qemu/patches/linux/linux.hash
> index 48552f63e3..9bcf1f561d 100644
> --- a/board/qemu/patches/linux/linux.hash
> +++ b/board/qemu/patches/linux/linux.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  8f4655a4cc7f93d72f515bbca54756de26ddaf5949790da6a17f766e3c33dc79  linux-6.12.27.tar.xz
> +sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
>  
>  # sha256 locally computed
>  sha256  a76052c0c71d4025b117dcfc18ca7e189ac495a7645fa98c1bdaddca15cce815  xtensa_dc233c.tar.gz
> diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
> index 0299c2855a..4dc2d1e396 100644
> --- a/configs/qemu_aarch64_ebbr_defconfig
> +++ b/configs/qemu_aarch64_ebbr_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/p
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index 2560aacdb2..84ae76ca0b 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/a
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 78b2a62047..6695f2b2d8 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
> index a3adb4c381..dfd3f47578 100644
> --- a/configs/qemu_arm_ebbr_defconfig
> +++ b/configs/qemu_arm_ebbr_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index 998c337ca9..b00b309b05 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="versatile"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index 63bfdc41de..9698b1c6c5 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index e5de1a45b0..5dca55fdce 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
>  BR2_PACKAGE_OPENSSL=y
> diff --git a/configs/qemu_loongarch64_virt_efi_defconfig b/configs/qemu_loongarch64_virt_efi_defconfig
> index 945cb9232d..4a4cd93b52 100644
> --- a/configs/qemu_loongarch64_virt_efi_defconfig
> +++ b/configs/qemu_loongarch64_virt_efi_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/loongarch64-virt-efi/post-image.sh boar
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/loongarch64-virt-efi/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
> index f50809809c..1850f67087 100644
> --- a/configs/qemu_m68k_mcf5208_defconfig
> +++ b/configs/qemu_m68k_mcf5208_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
> index 9cb7b61f13..6e84e1e791 100644
> --- a/configs/qemu_m68k_q800_defconfig
> +++ b/configs/qemu_m68k_q800_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index 9d67d71920..5444380f25 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index 46befedd57..e5bd065019 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
> index 4ec4322dbb..d5051f7c39 100644
> --- a/configs/qemu_mips32r2_malta_defconfig
> +++ b/configs/qemu_mips32r2_malta_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
> index 2901a5ff03..ce03bc21bd 100644
> --- a/configs/qemu_mips32r2el_malta_defconfig
> +++ b/configs/qemu_mips32r2el_malta_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
> index bdbaa4030d..6d026e2a50 100644
> --- a/configs/qemu_mips32r6_malta_defconfig
> +++ b/configs/qemu_mips32r6_malta_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
> index 5ec51d34a5..5ea91f281e 100644
> --- a/configs/qemu_mips32r6el_malta_defconfig
> +++ b/configs/qemu_mips32r6el_malta_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
> index a9c48afcd3..f33cff7963 100644
> --- a/configs/qemu_mips64_malta_defconfig
> +++ b/configs/qemu_mips64_malta_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
> index 61edea24fa..c535228b53 100644
> --- a/configs/qemu_mips64el_malta_defconfig
> +++ b/configs/qemu_mips64el_malta_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
> index 342140c957..f514bacd83 100644
> --- a/configs/qemu_mips64r6_malta_defconfig
> +++ b/configs/qemu_mips64r6_malta_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
> index e0dd72b981..83d9f109f9 100644
> --- a/configs/qemu_mips64r6el_malta_defconfig
> +++ b/configs/qemu_mips64r6el_malta_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> index 42dc6ce969..b97774d39c 100644
> --- a/configs/qemu_or1k_defconfig
> +++ b/configs/qemu_or1k_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> index 9237cdc2e5..88e3d99f90 100644
> --- a/configs/qemu_ppc64_e5500_defconfig
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index eb6f2fe14e..e89f4e2b3e 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
> index d9586884e3..a999a767dc 100644
> --- a/configs/qemu_ppc64le_powernv8_defconfig
> +++ b/configs/qemu_ppc64le_powernv8_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="powernv"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index b7bc8e5d94..2c633f198d 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
> index d851e4e4f9..a71e368cc9 100644
> --- a/configs/qemu_ppc_bamboo_defconfig
> +++ b/configs/qemu_ppc_bamboo_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
> index 4728501ac9..632d6400e1 100644
> --- a/configs/qemu_ppc_e500mc_defconfig
> +++ b/configs/qemu_ppc_e500mc_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
> index 5d3fefc374..0d2a1798ec 100644
> --- a/configs/qemu_ppc_g3beige_defconfig
> +++ b/configs/qemu_ppc_g3beige_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index a28a58d268..ecaa8d7ccc 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index ad453efb69..d2a35bd70e 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
> index dcf37c7b2d..5fa9a174bf 100644
> --- a/configs/qemu_riscv32_nommu_virt_defconfig
> +++ b/configs/qemu_riscv32_nommu_virt_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux-nommu.config"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index ac431413a4..4369d644cd 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_OPENSBI=y
> diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
> index 9367010c27..6c3d2608cc 100644
> --- a/configs/qemu_riscv64_nommu_virt_defconfig
> +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux-nommu.config"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index fd093a6162..f436dac143 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_OPENSBI=y
> diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
> index 8b9b232853..b9d622df05 100644
> --- a/configs/qemu_riscv64_virt_efi_defconfig
> +++ b/configs/qemu_riscv64_virt_efi_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-e
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> index f9609075d6..cc85d87d35 100644
> --- a/configs/qemu_s390x_defconfig
> +++ b/configs/qemu_s390x_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index 628ca05543..7f22dab3c4 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index 4fd07775ed..a1fc4a89e6 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> index 469575ff61..a147b129e7 100644
> --- a/configs/qemu_sparc64_sun4u_defconfig
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> index e8650652d5..2f05c0947f 100644
> --- a/configs/qemu_sparc_ss10_defconfig
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
> index 18bd7f2734..39d7793a04 100644
> --- a/configs/qemu_x86_64_defconfig
> +++ b/configs/qemu_x86_64_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> index 70bc173037..f8cb83a4b0 100644
> --- a/configs/qemu_x86_defconfig
> +++ b/configs/qemu_x86_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> index d731499e5e..92c0795698 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index e2979d21c7..bb5a7600dd 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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
