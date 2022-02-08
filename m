Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CACCC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7EFC40176;
	Tue,  8 Feb 2022 20:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKZtXiqJ_DKB; Tue,  8 Feb 2022 20:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AFFC4018A;
	Tue,  8 Feb 2022 20:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D94A71BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D878136C
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pryVL0HCZfGa for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:29:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1C348138E
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3464E82DBF; Tue,  8 Feb 2022 20:21:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 8 Feb 2022 21:20:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf198e229994ae4d55ed5c50c8e14bc0649aba37
X-Git-Newrev: dd8a410eafaceb30fd06e17edbb2d01283f99494
X-Patchwork-Hint: ignore
Message-Id: <20220208202150.3464E82DBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core: introduce NORMALIZED_ARCH as
 non-kernel replacement for KERNEL_ARCH
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd8a410eafaceb30fd06e17edbb2d01283f99494
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable 'KERNEL_ARCH' is actually a normalized version of
'ARCH'/'BR2_ARCH'. For example, 'arcle' and 'arceb' both become 'arc', just
as all powerpc variants become 'powerpc'.

It is presumably called 'KERNEL_ARCH' because the Linux kernel is typically
the first place where support for a new architecture is added, and thus is
the entity that defines the normalized name.

However, the term 'KERNEL_ARCH' can also be interpreted as 'the architecture
used by the kernel', which need not be exactly the same as 'the normalized
name for a certain arch'. In particular, for cases where a 64-bit
architecture is running a 64-bit kernel but 32-bit userspace. Examples
include:
    * aarch64 architecture, with aarch64 kernel and 32-bit (ARM) userspace
    * x86_64 architecture, with x86_64 kernel and 32-bit (i386) userspace

In such cases, the 'architecture used by the kernel' needs to refer to the
64-bit name (aarch64, x86_64), whereas all userspace applications need to
refer the, potentially normalized, 32-bit name.

This means that there need to be two different variables:

KERNEL_ARCH:     the architecture used by the kernel
NORMALIZED_ARCH: the normalized name for the current userspace architecture

At this moment, both will actually have the same content. But a subsequent
patch will add basic support for situations described above, in which
KERNEL_ARCH may become overwritten to the 64-bit architecture, while
NORMALIZED_ARCH needs to remain the same (32-bit) case.

This commit replaces use of KERNEL_ARCH where actually the userspace arch is
needed.  Places that use KERNEL_ARCH in combination with building of kernel
modules are not touched.
There may be cases where a package builds both a kernel module as userspace,
in which case it may need to know about both KERNEL_ARCH and
NORMALIZED_ARCH, for the case where they differ. But this is to be fixed on
a per-need basis.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Arnout: Also rename BR2_KERNEL_ARCH to BR2_NORMALIZED_ARCH]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                                       |  3 ++-
 arch/Config.in                                 |  2 +-
 arch/Config.in.arc                             |  2 +-
 arch/Config.in.arm                             |  2 +-
 arch/Config.in.csky                            |  2 +-
 arch/Config.in.m68k                            |  2 +-
 arch/Config.in.microblaze                      |  2 +-
 arch/Config.in.mips                            |  2 +-
 arch/Config.in.nds32                           |  2 +-
 arch/Config.in.nios2                           |  2 +-
 arch/Config.in.or1k                            |  2 +-
 arch/Config.in.powerpc                         |  2 +-
 arch/Config.in.riscv                           |  2 +-
 arch/Config.in.s390x                           |  2 +-
 arch/Config.in.sh                              |  2 +-
 arch/Config.in.sparc                           |  2 +-
 arch/Config.in.x86                             |  2 +-
 arch/Config.in.xtensa                          |  2 +-
 boot/barebox/barebox.mk                        | 10 +++++-----
 boot/uboot/uboot.mk                            |  6 +++---
 package/busybox/busybox.mk                     |  2 +-
 package/environment-setup/environment-setup.mk |  2 +-
 package/kvmtool/kvmtool.mk                     |  4 ++--
 package/libselinux/libselinux.mk               |  2 +-
 package/linux-tools/linux-tool-perf.mk.in      |  4 ++--
 package/linux-tools/linux-tool-selftests.mk.in |  6 +++---
 package/olsr/olsr.mk                           |  4 ++--
 package/pciutils/pciutils.mk                   |  2 +-
 package/uboot-tools/uboot-tools.mk             | 10 +++++-----
 29 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/Makefile b/Makefile
index e012d121b9..8a4ec4ef85 100644
--- a/Makefile
+++ b/Makefile
@@ -437,7 +437,8 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
+NORMALIZED_ARCH := $(call qstrip,$(BR2_NORMALIZED_ARCH))
+KERNEL_ARCH := $(call qstrip,$(BR2_NORMALIZED_ARCH))
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
diff --git a/arch/Config.in b/arch/Config.in
index edf337f13e..98b0e40d51 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -328,7 +328,7 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_ARCH
 	string
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	string
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index cc55c9e68f..388d3496bc 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -62,7 +62,7 @@ config BR2_ARCH
 	default "arc"	if BR2_arcle
 	default "arceb"	if BR2_arceb
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "arc"
 
 config BR2_arc
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 0f50512fad..85040ac89f 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -822,7 +822,7 @@ config BR2_ARCH
 	default "aarch64"	if BR2_aarch64
 	default "aarch64_be"	if BR2_aarch64_be
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "arm"		if BR2_arm || BR2_armeb
 	default "arm64"		if BR2_aarch64 || BR2_aarch64_be
 
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index df9e7ab75b..b20b39e225 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -39,7 +39,7 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_ARCH
 	default "csky"
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "csky"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 7f3aec7232..1f7d944621 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -1,7 +1,7 @@
 config BR2_ARCH
 	default "m68k"		if BR2_m68k
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "m68k"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 52aa252a2c..0502001afc 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -2,7 +2,7 @@ config BR2_ARCH
 	default "microblazeel"  if BR2_microblazeel
 	default "microblaze"    if BR2_microblazebe
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "microblaze"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index b4923f8484..7f44f06c9d 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -235,7 +235,7 @@ config BR2_ARCH
 	default "mips64"	if BR2_mips64
 	default "mips64el"	if BR2_mips64el
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "mips"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
index 61fc346260..0babb2cf7f 100644
--- a/arch/Config.in.nds32
+++ b/arch/Config.in.nds32
@@ -1,7 +1,7 @@
 config BR2_ARCH
 	default "nds32le"
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "nds32"
 
 config BR2_GCC_TARGET_ARCH
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index c77b1a1c59..a5d7e66d40 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -1,7 +1,7 @@
 config BR2_ARCH
 	default "nios2"
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "nios2"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
index ef1bded453..f42aef9eef 100644
--- a/arch/Config.in.or1k
+++ b/arch/Config.in.or1k
@@ -1,7 +1,7 @@
 config BR2_ARCH
 	default "or1k"
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "openrisc"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 33b2471cf9..4a39cfee70 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -157,7 +157,7 @@ config BR2_ARCH
 	default "powerpc64"	if BR2_powerpc64
 	default "powerpc64le"	if BR2_powerpc64le
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "powerpc"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 1a008a935d..288ed833eb 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -118,7 +118,7 @@ config BR2_ARCH
 	default "riscv32" if !BR2_ARCH_IS_64
 	default "riscv64" if BR2_ARCH_IS_64
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "riscv"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
index bf4b70f957..da6ac55d8a 100644
--- a/arch/Config.in.s390x
+++ b/arch/Config.in.s390x
@@ -17,7 +17,7 @@ endchoice
 config BR2_ARCH
 	default "s390x"	if BR2_s390x
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "s390"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index fde42dfce2..c1ba449dd5 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -24,7 +24,7 @@ config BR2_ARCH
 	default "sh4a"		if BR2_sh4a
 	default "sh4aeb"	if BR2_sh4aeb
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "sh"
 
 config BR2_ENDIAN
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index b91df6892b..f5f4bd6708 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -21,7 +21,7 @@ config BR2_ARCH
 	default "sparc"	if BR2_sparc
 	default "sparc64" if BR2_sparc64
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "sparc"	if BR2_sparc
 	default "sparc64" if BR2_sparc64
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 521b02d1b6..2560da922b 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -564,7 +564,7 @@ config BR2_ARCH
 	default "i686"		if BR2_i386
 	default "x86_64"	if BR2_x86_64
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "i386"		if !BR2_x86_64
 	default "x86_64"	if BR2_x86_64
 
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index acc340eca6..45ad2dc487 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -48,7 +48,7 @@ config BR2_ENDIAN
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
 
-config BR2_KERNEL_ARCH
+config BR2_NORMALIZED_ARCH
 	default "xtensa"
 
 config BR2_READELF_ARCH_NAME
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 8f02f9f9e1..6506294d6d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -59,16 +59,16 @@ ifneq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 $(1)_INSTALL_TARGET = NO
 endif
 
-ifeq ($$(KERNEL_ARCH),i386)
+ifeq ($$(NORMALIZED_ARCH),i386)
 $(1)_ARCH = x86
-else ifeq ($$(KERNEL_ARCH),x86_64)
+else ifeq ($$(NORMALIZED_ARCH),x86_64)
 $(1)_ARCH = x86
-else ifeq ($$(KERNEL_ARCH),powerpc)
+else ifeq ($$(NORMALIZED_ARCH),powerpc)
 $(1)_ARCH = ppc
-else ifeq ($$(KERNEL_ARCH),arm64)
+else ifeq ($$(NORMALIZED_ARCH),arm64)
 $(1)_ARCH = arm
 else
-$(1)_ARCH = $$(KERNEL_ARCH)
+$(1)_ARCH = $$(NORMALIZED_ARCH)
 endif
 
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a61d1c8135..d05b9bb479 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -143,12 +143,12 @@ endif
 
 # The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
 # we have to special case it. Similar for i386/x86_64 -> x86
-ifeq ($(KERNEL_ARCH),arm64)
+ifeq ($(NORMALIZED_ARCH),arm64)
 UBOOT_ARCH = arm
-else ifneq ($(filter $(KERNEL_ARCH),i386 x86_64),)
+else ifneq ($(filter $(NORMALIZED_ARCH),i386 x86_64),)
 UBOOT_ARCH = x86
 else
-UBOOT_ARCH = $(KERNEL_ARCH)
+UBOOT_ARCH = $(NORMALIZED_ARCH)
 endif
 
 UBOOT_MAKE_OPTS += \
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 60ebc4985f..75e57ba53f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -95,7 +95,7 @@ BUSYBOX_MAKE_OPTS = \
 	NM="$(TARGET_NM)" \
 	RANLIB="$(TARGET_RANLIB)" \
 	CC="$(TARGET_CC)" \
-	ARCH=$(KERNEL_ARCH) \
+	ARCH=$(NORMALIZED_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
 	EXTRA_LDFLAGS="$(BUSYBOX_LDFLAGS)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index f4c52921f7..29ec5a9a95 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -11,7 +11,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	for var in $(TARGET_CONFIGURE_OPTS); do \
 		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
 	done
-	printf "export \"ARCH=$(KERNEL_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "export \"ARCH=$(NORMALIZED_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 2984817c7e..df6ae7e0f1 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -25,11 +25,11 @@ KVMTOOL_MAKE_OPTS = \
 	WERROR=0
 
 define KVMTOOL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
+	$(TARGET_MAKE_ENV) ARCH=$(NORMALIZED_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
 endef
 
 define KVMTOOL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) ARCH=$(NORMALIZED_ARCH) $(MAKE) -C $(@D) \
 		$(KVMTOOL_MAKE_OPTS) install DESTDIR=$(TARGET_DIR) prefix=/usr
 endef
 
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c1e90130d2..5790e79040 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -18,7 +18,7 @@ LIBSELINUX_INSTALL_STAGING = YES
 # we won't have to use a relative path in 0002-revert-ln-relative.patch
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	ARCH=$(KERNEL_ARCH) \
+	ARCH=$(NORMALIZED_ARCH) \
 	SHLIBDIR=/usr/lib
 
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index efa747cf8d..4e28129f50 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -8,10 +8,10 @@ LINUX_TOOLS += perf
 
 PERF_DEPENDENCIES = host-flex host-bison
 
-ifeq ($(KERNEL_ARCH),x86_64)
+ifeq ($(NORMALIZED_ARCH),x86_64)
 PERF_ARCH=x86
 else
-PERF_ARCH=$(KERNEL_ARCH)
+PERF_ARCH=$(NORMALIZED_ARCH)
 endif
 
 PERF_MAKE_FLAGS = \
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index c4e5bf0fea..b824c11bd6 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -6,13 +6,13 @@
 
 LINUX_TOOLS += selftests
 
-ifeq ($(KERNEL_ARCH),x86_64)
+ifeq ($(NORMALIZED_ARCH),x86_64)
 SELFTESTS_ARCH=x86
 else
-ifeq ($(KERNEL_ARCH),i386)
+ifeq ($(NORMALIZED_ARCH),i386)
 SELFTESTS_ARCH=x86
 else
-SELFTESTS_ARCH=$(KERNEL_ARCH)
+SELFTESTS_ARCH=$(NORMALIZED_ARCH)
 endif
 endif
 
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index b2c8e7e001..4ad88991f2 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -27,10 +27,10 @@ OLSR_PLUGINS += pud
 endif
 
 define OLSR_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(NORMALIZED_ARCH) \
 		CFLAGS="$(OLSR_CFLAGS)" -C $(@D) olsrd
 	$(foreach p,$(OLSR_PLUGINS), \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(NORMALIZED_ARCH) \
 			CFLAGS="$(OLSR_CFLAGS)" -C $(@D)/lib/$(p)
 	)
 endef
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 9b83b62b55..67defcc743 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -12,7 +12,7 @@ PCIUTILS_LICENSE = GPL-2.0+
 PCIUTILS_LICENSE_FILES = COPYING
 PCIUTILS_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	HOST="$(KERNEL_ARCH)-linux" \
+	HOST="$(NORMALIZED_ARCH)-linux" \
 	OPT="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	DNS=no \
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 37e329a2af..26450b7adf 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -224,14 +224,14 @@ $(eval $(host-generic-package))
 MKIMAGE = $(HOST_DIR)/bin/mkimage
 
 # mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 nios2 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
-# KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
+# NORMALIZED_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
 # For i386, we need to convert
 # For openrisc, we need to convert
-# For others, we'll just keep KERNEL_ARCH
-ifeq ($(KERNEL_ARCH),i386)
+# For others, we'll just keep NORMALIZED_ARCH
+ifeq ($(NORMALIZED_ARCH),i386)
 MKIMAGE_ARCH = x86
-else ifeq ($(KERNEL_ARCH),openrisc)
+else ifeq ($(NORMALIZED_ARCH),openrisc)
 MKIMAGE_ARCH = or1k
 else
-MKIMAGE_ARCH = $(KERNEL_ARCH)
+MKIMAGE_ARCH = $(NORMALIZED_ARCH)
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
