Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06910C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 22:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 656C360BF7;
	Sun, 13 Nov 2022 22:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656C360BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZT5d3s44ppp; Sun, 13 Nov 2022 22:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C9460C00;
	Sun, 13 Nov 2022 22:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C9460C00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 185141BF373
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 22:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1115405A8
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 22:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1115405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMGlGQ6os_Zo for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 22:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63FDB40407
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63FDB40407
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 22:47:26 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id v81so9885778oie.5
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Mb9gpThuKiSH/Gp8nDEYWq766Ma3RNMHkXWSiwHJ3g=;
 b=imetHruXE3FwTqsJmFVds2WIR8SdFMrSWqrJIg7ZoKxzr2BW07WKlEFkNFlCTFkwA5
 hMP8kxN6+8Dtpw0rtY7k4SNMGgI0MfwJ7aWgGs1G34dYDQvKIICCU2iRE1L74nPQHMUT
 yoAKOIaZJ9ZtvJqBLuX4CONLn1FFxP7B0cRastIu59pd1kAevvu6ZMR1wfKpAPIBOYL/
 UEl+4Zh9VqalGrfagoN6h3LATm1uaUX2SVZkxAR0CQtqBzYZoUsvDQ/ZCDDrADfM7NLl
 sH6qnkhwuKSviAkJqwRydr+a41awhoCaCKG0rPEMpSkXGQ5ydtycSGkTaYcpfdTAHFHd
 QtUQ==
X-Gm-Message-State: ANoB5plA7WWew5idMBn0OQlXXFBXT7UudujMUloP8Op/mSvs6D6BF/VD
 Tm+W2in92nKZB7VHqJx2go/fppJpKeI=
X-Google-Smtp-Source: AA0mqf6jpSJfDWvt6yZ+2GVA9VPWdNH4F2MBzt2TfMNAxneaCo6lNr58SoD6EPSzNHJ0gCuvudlefA==
X-Received: by 2002:aca:5e8b:0:b0:354:cef5:85ea with SMTP id
 s133-20020aca5e8b000000b00354cef585eamr4795768oib.25.1668379644721; 
 Sun, 13 Nov 2022 14:47:24 -0800 (PST)
Received: from casantos.remote.csb ([187.113.211.250])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a9d74d2000000b0066cc0525476sm3417686otl.75.2022.11.13.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 14:47:24 -0800 (PST)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 19:47:19 -0300
Message-Id: <20221113224719.185759-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Mb9gpThuKiSH/Gp8nDEYWq766Ma3RNMHkXWSiwHJ3g=;
 b=hw/kSgUFbZaZ9Egq/+X4wYA/G1BWkXoJ51v9UQDFQmsnd1a3LYB8SfgcgWUVkKFHSs
 ydLbOHb5mD8+M1cQwZ3sp912Z/vQ+mo7Xcgjf28/QSZDfnLYZc1bw+nfemX5cRovMnEo
 r0MrSS6QdZVLVRMMnLBJxyGIkeGE8HfD0QYuR47NTPb4ajcTv4VxQ1NrOhiPYCD+elFJ
 0aJ3QMAz2veF4AXGeeK10L16Xo0rGiqhD6r2uF+SxnEoojDI+PDKmaNpfewYgtdwCHMR
 KtP6mW+XzI/oT7WeDLR8YZq8DP1InCtSgi/WncBycnFtot0qQ0Gt+dweXGlsY0d+ePq3
 glDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hw/kSgUF
Subject: [Buildroot] [PATCH] package/qemu: refactor target emulator selection
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
 Config.in.legacy       |  13 ++
 package/qemu/Config.in | 282 ++++++++++++++++++++++++++++++++++-------
 package/qemu/qemu.mk   |  99 +++++++++++++--
 3 files changed, 334 insertions(+), 60 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..290f4625ab 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,19 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2022.02"
+
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
 comment "Legacy options removed in 2022.11"
 
 config BR2_KERNEL_HEADERS_5_17
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
