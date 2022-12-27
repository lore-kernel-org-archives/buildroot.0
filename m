Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B95C4332F
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A37A60B21;
	Tue, 27 Dec 2022 11:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A37A60B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eCB4fTsgalW; Tue, 27 Dec 2022 11:48:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A3C60BB1;
	Tue, 27 Dec 2022 11:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A3C60BB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 831491BF371
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 11:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8C360BB1
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 11:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8C360BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWFA9uQ7fzxR for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 11:48:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFBA660B21
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFBA660B21
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 11:48:50 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v70so12226506oie.3
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 03:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L3V89W1O0UO5IQ3/Pf90e+FhgK9LS78QNFceXYXHWMg=;
 b=1V+PHlgxKq5opATRM3IGTeLtY0SX1g8vpXPG0wj0diXSUJNzd++bhI3+L7JGH6zgP7
 B8YRF7xKwhu/LXi3oi8R3wyiZ1o8fDdswbBYDd8X42qq+U/Vp3p6+kMgOrucIthbTYW+
 uEsVktKcQSF6Oqf7725+YSYiTeLWDq3AiLi3Db2Dat0OWdThT+auGj4j64acuEaQA5LY
 jU+pQHkVIV4Qbj+6s9vAHHM5Bx9Q6ZW5mbk2TqxCuCGRTHqU9UzX4o/umZ03HlDARI0R
 dW29P9JIaKk7NzOxuaWHEfmHbD4e9kt0mtyBW+4tZCyOyHQnHMu6lFXaIk5ubw9mC+oe
 bdIQ==
X-Gm-Message-State: AFqh2krqN4Apy3d5VpVYcDj+clUd/YGfzv5MisNSMd5hhtBxroY+CHoO
 fmDSS3Kdy6H8Gcg2kFJ/iyF0b+SjLJc=
X-Google-Smtp-Source: AMrXdXu6a8ZXShqzPQN9gmOHZQVKBSnM2cjipHfDDAUuwKQ5ZBIkI/ilxmIbFAzlazfjngRTCMygJw==
X-Received: by 2002:a05:6808:49a:b0:35e:cf1a:9cd0 with SMTP id
 z26-20020a056808049a00b0035ecf1a9cd0mr9970215oid.14.1672141729426; 
 Tue, 27 Dec 2022 03:48:49 -0800 (PST)
Received: from casantos.remote.csb ([179.181.73.41])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a544f98000000b0035a534b9237sm5765394oiy.29.2022.12.27.03.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 03:48:48 -0800 (PST)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 08:48:42 -0300
Message-Id: <20221227114842.2620182-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L3V89W1O0UO5IQ3/Pf90e+FhgK9LS78QNFceXYXHWMg=;
 b=lAA0a6TWF1bliKvb4xi7LOJj1oGB1R242ViHdMo1D2rgP4w+nbsx9E/SzKfDnIhtuj
 lueNe6f8QHt894aFx4LzL9oScVwB9C58yCbm+rQSxMCE5OK68U7eC/OPJr9d8eCOBwWN
 YCNq+jg4LX/KBiTTbGUuHt0uKCbi1dhHQXEHa5/Asqr2TGZg0on5UumOqbU8MmCYjbqd
 hGYVF6pj/r+/AEjdcEtKQJq+jG4P9rD56zRKTocFQsMyx3sGOMsvDX4xjwJCAzTC0/8T
 3MWvY1egW+fgrDeYjpHk/LUtEe+Iv0Bq54wtwoQ/AeXXvHek+RyHn136A+X1j2EsRp6d
 6GPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lAA0a6TW
Subject: [Buildroot] [PATCH v2] package/qemu: refactor target emulator
 selection
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

The current mechanism to select emulation targets works this way:

- BR2_PACKAGE_QEMU_SYSTEM selects the "system" (softmmu) targets. It
  selects FDT and creates a dependency on the "dtc" package but this is
  not always necessary. Only 14 system targets, out of 31, actually
  require FDT.

- BR2_PACKAGE_QEMU_LINUX_USER selects the "linux-user" targets. It does
  not select FDT, which is not required by linux-user emulators.

- Alternatively, we fill BR2_PACKAGE_QEMU_CUSTOM_TARGETS with a list of
  emulators (e.g.  "x86_64-softmmu x86_64-linux-user"). Then we pass
  "--enable-system --enable-linux-user --target-list="..." to the
  configure script, so QEMU builds its list of default targets, from
  which it checks if the specified subset is valid.

Since CUSTOM_TARGETS does not select FDT, we can get build errors like
this:

  ../meson.build:2778:2: ERROR: Problem encountered: fdt not available but required by targets x86_64-softmmu

We could select FDT when CUSTOM_TARGETS is set, but this would force an
unnecessary dependency on dtc, as BR2_PACKAGE_QEMU_SYSTEM does.

In order to fix these problems, refactor the package configuration:

- Keep BR2_PACKAGE_QEMU_SYSTEM and BR2_PACKAGE_QEMU_LINUX_USER, which by
  default build all corresponding target emulators.

- Add a BR2_PACKAGE_QEMU_CHOOSE_TARGETS config, to permit choosing the
  desired emulators.

- Add configs for each supported target. They select FDT, when needed.

- Move QEMU to a separate menu, since the number of configuration itens
  became too large.

- Select BR2_LEGACY if BR2_PACKAGE_QEMU_CUSTOM_TARGETS is set, because
  this situation requires user intervention to reconfigure the package.

- Reorganize the make file accordingly. Selecting CHOOSE_TARGETS without
  choosing at least one emulator is considered an error.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v1->v2:
- Rebase
- Fix Config.in.legacy after rebase
---
 Config.in.legacy       |  11 ++
 package/qemu/Config.in | 282 ++++++++++++++++++++++++++++++++++-------
 package/qemu/qemu.mk   |  99 +++++++++++++--
 3 files changed, 332 insertions(+), 60 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ca25c18b16..6d66f1b958 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,17 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
+	string "the QEMU specific targets option has been removed"
+	help
+	  This option has been replaced by a list of individual targets
+	  for the many architectures supported by QEMU.
+
+config BR2_PACKAGE_QEMU_CUSTOM_TARGETS_WRAP
+	bool
+	default y if BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	bool "xf86-input-keyboard removed"
 	help
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 15d6c7d6b5..d1c8234e98 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -17,7 +17,7 @@ comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-config BR2_PACKAGE_QEMU
+menuconfig BR2_PACKAGE_QEMU
 	bool "QEMU"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
@@ -49,20 +49,13 @@ if BR2_PACKAGE_QEMU
 
 comment "Emulators selection"
 
-config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
-	string "Enable specific targets"
+config BR2_PACKAGE_QEMU_SYSTEM
+	bool "Enable systems emulation"
+	depends on !BR2_STATIC_LIBS # dtc
 	help
-	  Enter here the list of QEMU targets you want to build. For
-	  example:
+	  Say 'y' to build system emulators/virtualisers.
 
-	    System emulation      | User-land emulation
-	    ----------------------+-----------------------
-	    i386-softmmu          | i386-linux-user
-	    arm-softmmu           | ppc-linux-user
-	    x86_64-softmmu        | sparc-bsd-user
-	    ...                   | ...
-
-comment "Networking options"
+if BR2_PACKAGE_QEMU_SYSTEM
 
 config BR2_PACKAGE_QEMU_SLIRP
 	bool "Enable user mode networking (SLIRP)"
@@ -87,69 +80,260 @@ config BR2_PACKAGE_QEMU_SLIRP
 	  Notice that this option does not disable other networking
 	  modes.
 
-if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
-
-comment "... or you can select emulator families to enable, below:"
+config BR2_PACKAGE_QEMU_SDL
+	bool "Enable SDL frontend"
+	select BR2_PACKAGE_SDL2
+	help
+	  Say 'y' to enable the SDL frontend, that is, a graphical
+	  window presenting the VM's display.
 
-config BR2_PACKAGE_QEMU_SYSTEM
-	bool "Enable all systems emulation"
-	depends on !BR2_STATIC_LIBS # dtc
-	select BR2_PACKAGE_QEMU_FDT
+config BR2_PACKAGE_QEMU_FDT
+	bool "Enable FDT"
+	select BR2_PACKAGE_DTC
 	help
-	  Say 'y' to build all system emulators/virtualisers that QEMU
-	  supports.
+	  Say 'y' here to have QEMU capable of constructing Device
+	  Trees, and passing them to the VMs.
+
+endif # BR2_PACKAGE_QEMU_SYSTEM
 
 comment "systems emulation needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_QEMU_LINUX_USER
-	bool "Enable all Linux user-land emulation"
+	bool "Enable Linux user-land emulation"
 	# Incompatible "struct sigevent" definition on musl
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
-	  Say 'y' to build all Linux user-land emulators that QEMU
-	  supports.
+	  Say 'y' to build Linux user-land emulators.
 
 # Note: bsd-user can not be build on Linux
 
 comment "Linux user-land emulation needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
-endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
+config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
+	bool "Choose emulator targets (default is to enable all)"
+	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
 
-config BR2_PACKAGE_QEMU_HAS_EMULS
-	def_bool y
-	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+if BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 
-if BR2_PACKAGE_QEMU_HAS_EMULS
+config BR2_PACKAGE_QEMU_TARGET_AARCH64
+	bool "aarch64"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  ARM 64-bit architecture.
 
-comment "Frontends"
+config BR2_PACKAGE_QEMU_TARGET_AARCH64_BE
+	bool "aarch64_be (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  ARM 64-bit architecture, big-endian.
 
-config BR2_PACKAGE_QEMU_SDL
-	bool "Enable SDL frontend"
-	depends on !BR2_STATIC_LIBS # sdl2
-	select BR2_PACKAGE_SDL2
+config BR2_PACKAGE_QEMU_TARGET_ALPHA
+	bool "alpha"
 	help
-	  Say 'y' to enable the SDL frontend, that is, a graphical
-	  window presenting the VM's display.
+	  DEC Alpha 64-bit RISC architecture.
 
-comment "SDL frontend needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+config BR2_PACKAGE_QEMU_TARGET_ARM
+	bool "arm"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  ARM EABI architecture, little-endian.
 
-comment "Misc. features"
+config BR2_PACKAGE_QEMU_TARGET_ARMEB
+	bool "armeb (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  ARM EABI architecture, big-endian.
 
-config BR2_PACKAGE_QEMU_FDT
-	bool "Enable FDT"
-	depends on !BR2_STATIC_LIBS # dtc
-	select BR2_PACKAGE_DTC
+config BR2_PACKAGE_QEMU_TARGET_AVR
+	bool "avr (system, only)"
+	depends on BR2_PACKAGE_QEMU_SYSTEM
 	help
-	  Say 'y' here to have QEMU capable of constructing Device
-	  Trees, and passing them to the VMs.
+	  AVR 8-bit microcontroller architecture.
 
-comment "FDT support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+config BR2_PACKAGE_QEMU_TARGET_CRIS
+	bool "cris"
+	help
+	  ETRAX CRIS microcontroller architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_HEXAGON
+	bool "hexagon (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  Qualcomm's Hexagon VLSI DSP architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_HPPA
+	bool "hppa"
+	help
+	  HP PA-RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_I386
+	bool "i386"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Intel i386 32-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_LOONGARCH64
+	bool "loongarch64"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Loongson 64-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_M68K
+	bool "m68k"
+	help
+	  Motorola 68000 architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
+	bool "microblaze"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Xilinix MicroBlaze soft processor.
+
+config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
+	bool "microblazeel"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Xilinix MicroBlaze EL soft processor.
+
+config BR2_PACKAGE_QEMU_TARGET_MIPS
+	bool "mips"
+	help
+	  MIPS 32-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_MIPSEL
+	bool "mipsel"
+	help
+	  MIPS 32-bit architecture, little-endian.
+
+config BR2_PACKAGE_QEMU_TARGET_MIPS64
+	bool "mips64"
+	help
+	  MIPS 64-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_MIPS64EL
+	bool "mips64el"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  MIPS 64-bit architecture, little-endian.
+
+config BR2_PACKAGE_QEMU_TARGET_MIPSN32
+	bool "mipsn32 (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  MIPS N32 architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_MIPSN32EL
+	bool "mipsn32el (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  MIPS N32 architecture, little-endian.
+
+config BR2_PACKAGE_QEMU_TARGET_NIOS2
+	bool "nios2"
+	help
+	  Nios II architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_OR1K
+	bool "or1k"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  OpenRISC 1000 architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_PPC
+	bool "ppc"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  PoewerPC 32-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_PPC64
+	bool "ppc64"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  PoewerPC 64-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_PPC64LE
+	bool "ppc64le (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  PoewerPC 64-bit architecture, little-endian.
+
+config BR2_PACKAGE_QEMU_TARGET_RISCV32
+	bool "riscv32"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  RISC-V 33-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_RISCV64
+	bool "riscv64"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  RISC-V 64-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_RX
+	bool "rx (system-only)"
+	depends on BR2_PACKAGE_QEMU_SYSTEM
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Renesas Electronics RX 32-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_S390X
+	bool "s390x"
+	help
+	  IBM z/Architecture 64-bit mainframe (s390x)
+
+config BR2_PACKAGE_QEMU_TARGET_SH4
+	bool "sh4"
+	help
+	  Super-H 32-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_SH4EB
+	bool "sh4eb"
+	help
+	  Super-H EB 32-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_SPARC
+	bool "sparc"
+	help
+	  SPARC 32-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_SPARC32PLUS
+	bool "sparc32plus (linux-user, only)"
+	depends on BR2_PACKAGE_QEMU_LINUX_USER
+	help
+	  SPARC 32-bit RISC architecture (Sun's v8plus).
+
+config BR2_PACKAGE_QEMU_TARGET_SPARC64
+	bool "sparc64"
+	help
+	  SPARC 64-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_TRICORE
+	bool "tricore (system, only)"
+	depends on BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Infineon TriCore 32-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_X86_64
+	bool "x86_64"
+	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
+	help
+	  Intel x86 64-bit architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_XTENSA
+	bool "xtensa"
+	help
+	  Xtensa 32-bit RISC architecture.
+
+config BR2_PACKAGE_QEMU_TARGET_XTENSAEB
+	bool "xtensaeb"
+	help
+	  Xtensa 32-bit RISC architecture, big-endian.
+
+endif # BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 
-endif # BR2_PACKAGE_QEMU_HAS_EMULS
+comment "Tools selection"
 
 config BR2_PACKAGE_QEMU_TOOLS
 	bool "Enable tools"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a991d49993..bf95b4dc62 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -30,30 +30,107 @@ QEMU_OPTS =
 
 QEMU_VARS = LIBTOOL=$(HOST_DIR)/bin/libtool
 
-# If we want to specify only a subset of targets, we must still enable all
-# of them, so that QEMU properly builds its list of default targets, from
-# which it then checks if the specified sub-set is valid. That's what we
-# do in the first part of the if-clause.
-# Otherwise, if we do not want to pass a sub-set of targets, we then need
-# to either enable or disable -user and/or -system emulation appropriately.
-# That's what we do in the else-clause.
-ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
-QEMU_OPTS += --enable-system --enable-linux-user
-QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
-else
+# If we want to build all emulation targets, we just need to either enable -user
+# and/or -system emulation appropriately.
+# Otherwise, if we want only a subset of targets, we must still enable all of
+# them, so that QEMU properly builds a list of default targets from which it
+# checks if the specified sub-set is valid.
+# That's why we check for BR2_PACKAGE_QEMU_CHOOSE_TARGETS, in the blocks below,
+# and treat selecting it without selecting any emulation target as an error.
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
+ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
+QEMU_SYSTEM_TARGET_LIST = \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_AARCH64),aarch64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_ALPHA),alpha-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_ARM),arm-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_AVR),avr-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_CRIS),cris-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_HPPA),hppa-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_I386),i386-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64),loongarch64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_M68K),m68k-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE),microblaze-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL),microblazeel-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS),mips-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64),mips64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64EL),mips64el-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSEL),mipsel-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_NIOS2),nios2-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_OR1K),or1k-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC),ppc-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC64),ppc64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV32),riscv32-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV64),riscv64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_RX),rx-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_S390X),s390x-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4),sh4-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4EB),sh4eb-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC),sparc-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC64),sparc64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_TRICORE),tricore-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_X86_64),x86_64-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSA),xtensa-softmmu) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSAEB),xtensaeb-softmmu)
+ifeq ("$(call qstrip,$(QEMU_SYSTEM_TARGET_LIST))","")
+$(error "No system emulator target has ben chosen")
+endif
+endif
 else
 QEMU_OPTS += --disable-system
 endif
 
 ifeq ($(BR2_PACKAGE_QEMU_LINUX_USER),y)
 QEMU_OPTS += --enable-linux-user
+ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
+QEMU_LINUX_USER_TARGET_LIST = \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_AARCH64),aarch64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE),aarch64_be-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_ALPHA),alpha-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_ARM),arm-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_ARMEB),armeb-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_CRIS),cris-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_HEXAGON),hexagon-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_HPPA),hppa-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_I386),i386-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64),loongarch64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_M68K),m68k-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE),microblaze-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL),microblazeel-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS),mips-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64),mips64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPS64EL),mips64el-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSEL),mipsel-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSN32),mipsn32-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_MIPSN32EL),mipsn32el-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_NIOS2),nios2-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_OR1K),or1k-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC),ppc-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC64),ppc64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_PPC64LE),ppc64le-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV32),riscv32-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_RISCV64),riscv64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_S390X),s390x-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4),sh4-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SH4EB),sh4eb-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC),sparc-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC32PLUS),sparc32plus-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_SPARC64),sparc64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_X86_64),x86_64-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSA),xtensa-linux-user) \
+	$(if $(BR2_PACKAGE_QEMU_TARGET_XTENSAEB),xtensaeb-linux-user)
+ifeq ("$(call qstrip,$(QEMU_LINUX_USER_TARGET_LIST))","")
+$(error "No user-land emulator target has ben chosen")
+endif
+endif
 else
 QEMU_OPTS += --disable-linux-user
 endif
 
+# Build the list of desired targets, if any.
+ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
+QEMU_OPTS += --target-list="$(call qstrip,$(QEMU_SYSTEM_TARGET_LIST) $(QEMU_LINUX_USER_TARGET_LIST))"
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
