Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B62C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8272181F61;
	Thu,  2 Feb 2023 20:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8272181F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYGwBsFivNzS; Thu,  2 Feb 2023 20:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC0881F94;
	Thu,  2 Feb 2023 20:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC0881F94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E12B1BF417
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 20:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E18181F94
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 20:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E18181F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HIUAn9eBfsv for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 20:20:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E355F81F61
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E355F81F61
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 20:20:26 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.39.201])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 14A5C1A13E5;
 Thu,  2 Feb 2023 21:20:20 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 21:20:01 +0100
Message-Id: <20230202202002.3272959-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675369223;
 bh=+FMHXlepzE6i5NlPG7dePkrAxZ2YrrOaF3sq1/r27fk=;
 h=From:To:Cc:Subject:Date:From;
 b=ZeTI0GT7rEcCnmozZiLARD1c1tzD54hf0bGQJQ2cL4tYZRN4RWzdQSfiU9sSr/zCg
 sESJRxE0EV1sBWoGABczFECvMVKsJEIrX1DHrsn8KfoBjkDJS7V4egapr2tRgJqHl2
 YgXTy4IxIOFBPayH/TrlzuVX979Izi1ZyMTdzbvLymmSoe5pp18lHAm5pzQ5BZIxf9
 PSUr+XZ/CbO7kibTCB0kUM5BpDKhEU5vQjQpjMpVjGCv5NVmJ+4yt4kh80T0q5/8Ao
 UA2f+6xKWtvfCNdRliApVD1saXOqybFCMCpnORpLZC2W/zMci/0+nDZFshsw2lb6yD
 TKk5K/z3d9h6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZeTI0GT7
Subject: [Buildroot] [PATCH v6 1/2] package/rdma-core: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shamraiz Ashraf <shamraizashraf092@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the userspace components for the Linux Kernel's
drivers/infiniband subsystem.

https://github.com/linux-rdma/rdma-core

Tested-by: Shamraiz Ashraf <shamraizashraf092@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v5 -> v6:
- Update rdma-core from v43.0 to v44.0
- Removed the patch in v5, now included upstream
- Update kernel in test from 5.15.80 to 5.15.91

Changes v4 -> v5:
- Update rdma-core from v42.0 to v43.0
  Also add a patch to fix an issue introduced in v43.0
- Update kernel in test from 5.15.68 to 5.15.80
- v5 patch series now includes the perftest package

Changes v3 -> v4:
- Update kernel in test from 5.15.61 to 5.15.68
- Included Thomas' review comments:
  - Moved linux-rdma.fragment to test directory
  - Updated test script to reflect new file location
  - Fixed typo in readme.txt
  - Add a comment in Config.in describing when the
    "rdma" command is needed.

Changes v2 -> v3:
- Update package version from 41.0 to 42.0
- Update kernel in test from 5.15.48 to 5.15.61

Changes v1 -> v2:
- Update package version from 39.0 to 41.0
- Add test_rdma_core.py entry to DEVELOPERS file
- Update kernel in test from 5.15.30 to 5.15.48
- Moved Config.in rdma comment in main pkg description
---
Tested on branch master at commit aff4317 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8  support/testing/tests/package/test_rdma_core.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_rdma_core.TestRdmaCore
    ...
    OK

    ./utils/test-pkg -a -p rdma-core
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: SKIPPED
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 package/rdma-core/Config.in                   | 22 ++++++
 package/rdma-core/rdma-core.hash              |  5 ++
 package/rdma-core/rdma-core.mk                | 24 ++++++
 package/rdma-core/readme.txt                  | 75 +++++++++++++++++++
 .../testing/tests/package/test_rdma_core.py   | 43 +++++++++++
 .../test_rdma_core/linux-rdma.fragment        |  9 +++
 8 files changed, 182 insertions(+)
 create mode 100644 package/rdma-core/Config.in
 create mode 100644 package/rdma-core/rdma-core.hash
 create mode 100644 package/rdma-core/rdma-core.mk
 create mode 100644 package/rdma-core/readme.txt
 create mode 100644 support/testing/tests/package/test_rdma_core.py
 create mode 100644 support/testing/tests/package/test_rdma_core/linux-rdma.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index e19087c577..5eb746f8b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1696,6 +1696,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
+F:	package/rdma-core/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/z3/
@@ -1711,6 +1712,8 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_rdma_core.py
+F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_z3.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index 83fddf316f..1f6db14d56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -573,6 +573,7 @@ endmenu
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
 	source "package/raspi-gpio/Config.in"
+	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
diff --git a/package/rdma-core/Config.in b/package/rdma-core/Config.in
new file mode 100644
index 0000000000..437cf903ac
--- /dev/null
+++ b/package/rdma-core/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_RDMA_CORE
+	bool "rdma-core"
+	depends on BR2_USE_MMU # fork() used in rstream example
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBNL
+	help
+	  This is the userspace components for the Linux Kernel's
+	  drivers/infiniband subsystem.
+
+	  Note: The 'rdma' utility program is provided by the
+	  'iproute2' package, when compiled with the package 'libmnl'
+	  also selected. This program is needed to configure
+	  InfiniBand and RDMA networks from the command line.
+
+	  https://github.com/linux-rdma/rdma-core
+
+comment "rdma-core needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
new file mode 100644
index 0000000000..1aff44f7f4
--- /dev/null
+++ b/package/rdma-core/rdma-core.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  4a2eec55b37ac25f25e7680a372f71c1781c23808542bd31fb68dc0448b8cba2  rdma-core-44.0.tar.gz
+sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
+sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
new file mode 100644
index 0000000000..885821bf98
--- /dev/null
+++ b/package/rdma-core/rdma-core.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# rdma-core
+#
+################################################################################
+
+RDMA_CORE_VERSION = 44.0
+RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
+RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
+RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
+RDMA_CORE_DEPENDENCIES = libnl
+RDMA_CORE_INSTALL_STAGING = YES
+
+RDMA_CORE_CONF_OPTS = \
+	-DNO_MAN_PAGES=1 \
+	-DNO_PYVERBS=1
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+RDMA_CORE_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
+$(eval $(cmake-package))
diff --git a/package/rdma-core/readme.txt b/package/rdma-core/readme.txt
new file mode 100644
index 0000000000..9a95226ef4
--- /dev/null
+++ b/package/rdma-core/readme.txt
@@ -0,0 +1,75 @@
+Testing rdma-core userspace tools
+=================================
+
+Testing rdma-core using Linux software RoCE implementation:
+https://en.wikipedia.org/wiki/RDMA_over_Converged_Ethernet
+
+Using two systems with working TCP/IP configuration, for example:
+- Server IP: 192.168.123.10
+- Client IP: 192.168.123.20
+
+Make sure firewall configurations are appropriate. Routable RoCE v2
+uses udp/4791. ibv_rc_pingpong uses tcp/18515 for initial
+synchronization.
+
+Note: this test can be executed in two qemu virtual machines with
+bridged networking.
+
+
+Kernel configuration
+--------------------
+
+The Linux Kernel needs some InfiniBand configuration. In this example
+the kernel "rdma_rxe" driver is needed (CONFIG_RDMA_RXE=y). The Kernel
+config fragment file used for package test can be used as a starting
+point. See:
+
+    support/testing/tests/package/test_rdma_core/linux-rdma.fragment
+
+
+Buildroot package configuration
+-------------------------------
+
+For setting up a software RoCE link, the "rdma" program is needed. It
+is provided by the "iproute2" package, when "libmnl" is also
+selected. Make sure to have in your Buildroot configuration:
+
+    BR2_PACKAGE_IPROUTE2=y
+    BR2_PACKAGE_LIBMNL=y
+    BR2_PACKAGE_RDMA_CORE=y
+
+
+Setting up the rdma link
+------------------------
+
+On both server and client:
+
+    modprobe rdma_rxe
+    rdma link add rxe0 type rxe netdev eth0
+
+
+Testing with rping
+------------------
+
+On the server side, run the command:
+
+    rping -s -v
+
+On the client side, run the command:
+
+    rping -c -v -a 192.168.123.10
+
+
+Testing with ibv_rc_pingpong
+----------------------------
+
+To test with the pingpong example using the reliable connected (RC)
+transport:
+
+On the server side, run the command:
+
+    ibv_rc_pingpong -d rxe0 -g 1
+
+On the client side, run the command:
+
+    ibv_rc_pingpong -d rxe0 -g 1 192.168.123.10
diff --git a/support/testing/tests/package/test_rdma_core.py b/support/testing/tests/package/test_rdma_core.py
new file mode 100644
index 0000000000..614fb51f48
--- /dev/null
+++ b/support/testing/tests/package/test_rdma_core.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+class TestRdmaCore(infra.basetest.BRTest):
+
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.91"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_IPROUTE2=y
+        BR2_PACKAGE_LIBMNL=y
+        BR2_PACKAGE_RDMA_CORE=y
+        """.format(
+            infra.filepath("tests/package/test_rdma_core/linux-rdma.fragment")
+        )
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        # Add the rxe0 interface
+        self.assertRunOk("rdma link add rxe0 type rxe netdev eth0")
+
+        # ibv_devinfo returns 255 if no devices are found
+        self.assertRunOk("ibv_devinfo -v")
diff --git a/support/testing/tests/package/test_rdma_core/linux-rdma.fragment b/support/testing/tests/package/test_rdma_core/linux-rdma.fragment
new file mode 100644
index 0000000000..e305f27e62
--- /dev/null
+++ b/support/testing/tests/package/test_rdma_core/linux-rdma.fragment
@@ -0,0 +1,9 @@
+CONFIG_INFINIBAND=m
+CONFIG_INFINIBAND_USER_MAD=m
+CONFIG_INFINIBAND_USER_ACCESS=m
+CONFIG_RDMA_RXE=m
+CONFIG_INFINIBAND_IPOIB=m
+CONFIG_INFINIBAND_IPOIB_CM=y
+CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=y
+CONFIG_INFINIBAND_RTRS_CLIENT=m
+CONFIG_INFINIBAND_RTRS_SERVER=m
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
