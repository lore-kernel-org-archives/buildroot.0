Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D968C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB54940350;
	Tue, 26 Jul 2022 20:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB54940350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBBpJl-DWYBP; Tue, 26 Jul 2022 20:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48842408E5;
	Tue, 26 Jul 2022 20:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48842408E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0B71BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CCBC812EA
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCBC812EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHYkMhpjqxRo for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4336681767
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4336681767
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B7E7786028; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8195e85e10c30b2284613200b4cb1dcba31c9386
X-Git-Newrev: dcb74db89e74e512e36b32cea6f574a1a1ca84c4
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.B7E7786028@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: add support for configurable page
 size on ARM64
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
Content-Type: multipart/mixed; boundary="===============7154581256896850483=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7154581256896850483==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dcb74db89e74e512e36b32cea6f574a1a1ca84c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit is based on earlier work from Łukasz Stelmach
<l.stelmach@samsung.com> to add support for different page sizes on
ARM64.

In his initial submission, Łukasz took an approach similar to this
one, i.e make it ARM64-specific. Following the feedback on the mailing
list, his second version [1] tried to generalize the logic to
configure the page size between architectures. But the general
consensus during the review process was that there wasn't much to
generalize in the end.

So, this new iteration is back to a simpler approach:

 * We have new options in Config.in.arm to configure the page
   size. Only 4 KB and 64 KB are supported, because our testing in
   Qemu and real hardware has not allowed to get a successful setup
   for 16 KB pages. We can always re-add support for 16 KB later if
   that is resolved.

 * The logic to define the ARCH_TOOLCHAIN_WRAPPER_OPTS options is
   moved from the ARC-specific file to arch/arch.mk, and extended to
   cover ARM64.

 * The appropriate logic in uclibc.mk and linux.mk is added to tweak
   the relevant configuration options.

 * A test case is added in the runtime test infrastructure to test
   building and booting under Qemu a 64 KB configuration, with all 3 C
   libraries.

For the regular configuration of 4 KB pages, this commit makes one
functional change: on ARM64, -Wl,-z,max-page-size=4096 is now passed in
the compiler flags of the wrapper.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=275452

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.arm                                 | 25 +++++++++
 arch/arch.mk                                       | 11 ++++
 arch/arch.mk.arc                                   |  9 ---
 linux/linux.mk                                     |  8 +++
 package/uclibc/uclibc.mk                           | 13 +++++
 .../testing/tests/toolchain/test_aarch64_64k.py    | 65 ++++++++++++++++++++++
 6 files changed, 122 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index eb71d70430..a0a2e2f5e9 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -770,6 +770,31 @@ config BR2_ARM_INSTRUCTIONS_THUMB2
 
 endchoice
 
+choice
+	prompt "MMU Page Size"
+	default BR2_ARM64_PAGE_SIZE_4K
+	depends on BR2_aarch64 || BR2_aarch64_be
+	help
+	  The default is 4KB, and you should probably keep this unless
+	  you know what you are doing. In particular, the kernel
+	  configuration must match this choice. If your kernel is
+	  built by Buildroot, the kernel configuration is
+	  automatically adjusted, but not if you built your kernel
+	  outside of Buildroot.
+
+config BR2_ARM64_PAGE_SIZE_4K
+	bool "4KB"
+
+config BR2_ARM64_PAGE_SIZE_64K
+	bool "64KB"
+
+endchoice
+
+config BR2_ARM64_PAGE_SIZE
+	string
+	default "4K" if BR2_ARM64_PAGE_SIZE_4K
+	default "64K" if BR2_ARM64_PAGE_SIZE_64K
+
 config BR2_ARCH
 	default "arm"		if BR2_arm
 	default "armeb"		if BR2_armeb
diff --git a/arch/arch.mk b/arch/arch.mk
index 289c5a1125..96f11eba42 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -18,5 +18,16 @@ GCC_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 GCC_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
+# Explicitly set LD's "max-page-size" instead of relying on some defaults
+ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
+else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
+else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
+else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536
+endif
+
 # Include any architecture specific makefiles.
 -include $(sort $(wildcard arch/arch.mk.*))
diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
index 32b818b0e0..a6b56a869f 100644
--- a/arch/arch.mk.arc
+++ b/arch/arch.mk.arc
@@ -5,13 +5,4 @@ ifeq ($(BR2_ARC_ATOMIC_EXT),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
 endif
 
-# Explicitly set LD's "max-page-size" instead of relying on some defaults
-ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
-else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
-else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
-endif
-
 endif
diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9..3d9ac37959 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -374,6 +374,14 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K))
+	$(if $(BR2_ARM64_PAGE_SIZE_4K),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_4K_PAGES)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_16K_PAGES)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_64K_PAGES))
+	$(if $(BR2_ARM64_PAGE_SIZE_64K),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_4K_PAGES)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_16K_PAGES)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_64K_PAGES))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD))
 	# As the kernel gets compiled before root filesystems are
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 5006aa0cb6..0e17a8e65d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -73,6 +73,18 @@ define UCLIBC_BINFMT_CONFIG
 endef
 endif
 
+#
+# AArch64 definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),aarch64)
+UCLIBC_ARM64_PAGE_SIZE = CONFIG_AARCH64_PAGE_SIZE_$(call qstrip,$(BR2_ARM64_PAGE_SIZE))
+define UCLIBC_AARCH64_PAGE_SIZE_CONFIG
+	$(SED) '/CONFIG_AARCH64_PAGE_SIZE_*/d' $(@D)/.config
+	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARM64_PAGE_SIZE))
+endef
+endif # aarch64
+
 #
 # ARC definitions
 #
@@ -386,6 +398,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib")
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
+	$(UCLIBC_AARCH64_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_ATOMICS_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
diff --git a/support/testing/tests/toolchain/test_aarch64_64k.py b/support/testing/tests/toolchain/test_aarch64_64k.py
new file mode 100644
index 0000000000..59c7834360
--- /dev/null
+++ b/support/testing/tests/toolchain/test_aarch64_64k.py
@@ -0,0 +1,65 @@
+import os
+import re
+
+import infra.basetest
+
+
+class TestAarch64Pages64kBase(infra.basetest.BRTest):
+    __test__ = False
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_ARM64_PAGE_SIZE_64K=y
+        BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+
+    def test_run(self):
+        self.login()
+
+        cmd = "dmesg | grep 'Dentry cache'"
+        output, exit_code = self.emulator.run(cmd, 120)
+        r = re.match(".*Dentry cache hash table entries: [0-9]* \(order: ([0-9]*), ([0-9]*) bytes.*", output[0])
+        order = int(r.group(1))
+        size = int(r.group(2))
+        self.assertEqual(2 ** order * 64 * 1024, size)
+
+class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
+    __test__ = True
+    config = TestAarch64Pages64kBase.config + \
+        """
+        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+        """
+
+class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
+    __test__ = True
+    config = TestAarch64Pages64kBase.config + \
+        """
+        BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
+        """
+
+class TestAarch64Pages64kMusl(TestAarch64Pages64kBase):
+    __test__ = True
+    config = TestAarch64Pages64kBase.config + \
+        """
+        BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+        """
+

--===============7154581256896850483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7154581256896850483==--
