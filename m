Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE3AC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 21:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2424560ADD;
	Thu, 29 Dec 2022 21:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2424560ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6OpjzJghSrE; Thu, 29 Dec 2022 21:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9F3E60AF4;
	Thu, 29 Dec 2022 21:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9F3E60AF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01C571BF2AB
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 21:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3B0402E0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 21:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3B0402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ffJunzmkQXA for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 21:35:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBFF5401EC
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBFF5401EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A75AF87083; Thu, 29 Dec 2022 21:35:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 22:34:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f0a2a43bbfcb2aef1569b48277933264ec25feb
X-Git-Newrev: 44be514b21fd94096702b80c62d46c31d72f15a5
X-Patchwork-Hint: ignore
Message-Id: <20221229213538.A75AF87083@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: refactor target emulator
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44be514b21fd94096702b80c62d46c31d72f15a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Notes about the list of enabled targets:

- when the user enables both system and user emulation, we provide no
  way to be able to build all system bt only parts of user (or the other
  way around), because the qemu build system does not allow that: when a
  list of target is passed, it applies to both system and user
  emulation;

- as a consequence and in the same spirit, we also do not sanity-check
  that at least one system, resp. user, target is enabled when system,
  resp. user, emulation is enabled; we only require that one target is
  enabled, so that the list is not empty.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998@free.fr:
  - always build at least user or system
  - add help text to BR2_PACKAGE_QEMU_CHOOSE_TARGETS
  - simplify prompt for BR2_PACKAGE_QEMU_CHOOSE_TARGETS
  - simplify list of targets with unique QEMU_TARGET_LIST_y
  - extend the commit log with "Notes about the list of enabled targets"
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy       |  11 ++
 package/qemu/Config.in | 287 ++++++++++++++++++++++++++++++++++++++++---------
 package/qemu/qemu.mk   |  91 ++++++++++++++--
 3 files changed, 329 insertions(+), 60 deletions(-)

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
index 15d6c7d6b5..0f9e353510 100644
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
@@ -27,6 +27,7 @@ config BR2_PACKAGE_QEMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_QEMU_SYSTEM if !BR2_PACKAGE_QEMU_LINUX_USER
 	help
 	  QEMU is a generic and open source machine emulator and
 	  virtualizer.
@@ -49,20 +50,13 @@ if BR2_PACKAGE_QEMU
 
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
@@ -87,69 +81,264 @@ config BR2_PACKAGE_QEMU_SLIRP
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
+	bool "Select individual emulator targets"
+	help
+	  By default, all targets (system and/or user, subject to the
+	  corresponding options, above) are built. If you only need a
+	  subset of the emulated targets, say 'y' here and enable at
+	  least one target, below.
 
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
index 8725e7c8c4..5c7a8d504c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When updating the version, check whether the list of supported targets
+# needs to be updated.
 QEMU_VERSION = 7.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
@@ -36,30 +38,97 @@ QEMU_OPTS =
 
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
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AVR) += avr-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSEL) += mipsel-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_NIOS2) += nios2-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_OR1K) += or1k-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC) += ppc-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64) += ppc64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_RISCV32) += riscv32-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_RISCV64) += riscv64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_RX) += rx-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_S390X) += s390x-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SH4) += sh4-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SH4EB) += sh4eb-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SPARC) += sparc-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SPARC64) += sparc64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_TRICORE) += tricore-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_X86_64) += x86_64-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_XTENSA) += xtensa-softmmu
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_XTENSAEB) += xtensaeb-softmmu
 else
 QEMU_OPTS += --disable-system
 endif
 
 ifeq ($(BR2_PACKAGE_QEMU_LINUX_USER),y)
 QEMU_OPTS += --enable-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE) += aarch64_be-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARMEB) += armeb-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HEXAGON) += hexagon-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_M68K) += m68k-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZE) += microblaze-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL) += microblazeel-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS) += mips-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64) += mips64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPS64EL) += mips64el-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSEL) += mipsel-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSN32) += mipsn32-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_MIPSN32EL) += mipsn32el-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_NIOS2) += nios2-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_OR1K) += or1k-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC) += ppc-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64) += ppc64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_PPC64LE) += ppc64le-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_RISCV32) += riscv32-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_RISCV64) += riscv64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_S390X) += s390x-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SH4) += sh4-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SH4EB) += sh4eb-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SPARC) += sparc-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SPARC32PLUS) += sparc32plus-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_SPARC64) += sparc64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_X86_64) += x86_64-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_XTENSA) += xtensa-linux-user
+QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_XTENSAEB) += xtensaeb-linux-user
 else
 QEMU_OPTS += --disable-linux-user
 endif
 
+# Build the list of desired targets, if any.
+ifeq ($(BR2_PACKAGE_QEMU_CHOOSE_TARGETS),y)
+QEMU_TARGET_LIST = $(strip $(QEMU_TARGET_LIST_y))
+ifeq ($(BR_BUILDING).$(QEMU_TARGET_LIST),y.)
+$(error "No emulator target has ben chosen")
+endif
+QEMU_OPTS += --target-list="$(QEMU_TARGET_LIST)"
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
