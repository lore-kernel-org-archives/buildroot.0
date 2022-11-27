Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB90C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 11:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000EE81AC1;
	Sun, 27 Nov 2022 11:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000EE81AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hKpLWJ3AgAa; Sun, 27 Nov 2022 11:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA8D81A92;
	Sun, 27 Nov 2022 11:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA8D81A92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 984561BF344
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 11:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 725B881A92
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 11:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725B881A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNWuKy5vPXHW for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 11:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1843581A8E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1843581A8E
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 11:04:14 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.33.88])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 00A49780340;
 Sun, 27 Nov 2022 12:04:09 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 12:03:58 +0100
Message-Id: <20221127110358.495420-2-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221127110358.495420-1-ju.o@free.fr>
References: <20221127110358.495420-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669547052;
 bh=lzn95Od0ybyri201kt9omC6OG7bbE+UMl7/+G+5E9Yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kp0TuyuslcWU9H4lmCOhrvtYS2b08/7IMEe67VZFF2GYaBF3D2ELnG2Hg5cm4Lg/r
 TeQGUIZ5rqrA//amU/THIo5J+dDt8uZYsfqipaG/p+B91dWyxb6ACWxu7NyZyB3D3u
 5A8olUb/9yjFkNH6iw4swPGAUhH57gIYW+12G9qxCR4tIBF1WKWq26XtmE+WvKwiM+
 bO3seOW8M5p2fdgCgXuCQyIK0EeBabHbqCNTaHECBXKeUiaM4HDarmuMf74ErFaBRn
 UMGHHA/LjFqwuYWccqPPeKO137YtTRK5ieqcBGfFPODtC5PM5WO6l4/NGfoCA23bFB
 24//mlRcF4Kjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kp0Tuyus
Subject: [Buildroot] [PATCH next v5 2/2] package/perftest: new package
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Open Fabrics Performance Tests.

This is a collection of tests written over uverbs intended
for use as a performance micro-benchmark. The tests may be
used for HW or SW tuning as well as for functional testing.

https://github.com/linux-rdma/perftest

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on branch next at commit c45b2f2 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8  support/testing/tests/package/test_perftest.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_perftest.TestPerftest
    ...
    OK

    ./utils/test-pkg -a -p perftest
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: SKIPPED
                    bootlin-armv5-uclibc [ 4/44]: SKIPPED
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: SKIPPED
             bootlin-microblazeel-uclibc [10/44]: SKIPPED
                bootlin-mipsel32r6-glibc [11/44]: SKIPPED
                   bootlin-mipsel-uclibc [12/44]: SKIPPED
                     bootlin-nios2-glibc [13/44]: SKIPPED
                 bootlin-openrisc-uclibc [14/44]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: SKIPPED
                      bootlin-sh4-uclibc [20/44]: SKIPPED
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: SKIPPED
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: SKIPPED
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: SKIPPED
                            br-arm-basic [27/44]: SKIPPED
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: SKIPPED
                      br-mips64-n64-full [32/44]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/44]: SKIPPED
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: SKIPPED
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: SKIPPED
                            sourcery-arm [40/44]: SKIPPED
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: SKIPPED
                           sourcery-mips [43/44]: SKIPPED
                          sourcery-nios2 [44/44]: SKIPPED
    44 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/Config.in                             |  1 +
 package/perftest/Config.in                    | 41 ++++++++++++++++
 package/perftest/perftest.hash                |  3 ++
 package/perftest/perftest.mk                  | 15 ++++++
 .../testing/tests/package/test_perftest.py    | 48 +++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 package/perftest/Config.in
 create mode 100644 package/perftest/perftest.hash
 create mode 100644 package/perftest/perftest.mk
 create mode 100644 support/testing/tests/package/test_perftest.py

diff --git a/package/Config.in b/package/Config.in
index 8b507f67f3..541de4cd8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
 	source "package/pcm-tools/Config.in"
+	source "package/perftest/Config.in"
 	source "package/piglit/Config.in"
 	source "package/ply/Config.in"
 	source "package/poke/Config.in"
diff --git a/package/perftest/Config.in b/package/perftest/Config.in
new file mode 100644
index 0000000000..3e389f6ede
--- /dev/null
+++ b/package/perftest/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
+	bool
+	# Accurate cycle measurement in perftest is implemented for a
+	# limited set of architectures, see:
+	# https://github.com/linux-rdma/perftest/blob/v4.5-0.18/src/get_clock.h
+	# Note: the package has also a fallback to use "asm/timex.h"
+	# from the Kernel, in
+	# "$(LINUX_DIR)/arch/$(KERNEL_ARCH)/include". It is not
+	# reflected here as this path is not well tested.
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && !BR2_ARM_CPU_ARMV6
+	default y if BR2_aarch64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_riscv
+
+config BR2_PACKAGE_PERFTEST
+	bool "perftest"
+	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # rdma-core
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # rdma-core
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# musl does not define sysconf(_SC_LEVEL1_DCACHE_LINESIZE)
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_USE_MMU # rdma-core
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_RDMA_CORE # libibverbs, librdmacm, libibumad
+	help
+	  Open Fabrics Performance Tests.
+
+	  This is a collection of tests written over uverbs intended
+	  for use as a performance micro-benchmark. The tests may be
+	  used for HW or SW tuning as well as for functional testing.
+
+	  https://github.com/linux-rdma/perftest
+
+comment "perftest needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
new file mode 100644
index 0000000000..9f08da7fae
--- /dev/null
+++ b/package/perftest/perftest.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a8ef5483085c2b3ccb92739bc70c4e0ed98eaec0ce80d34b54ba208a16e03fc4  perftest-4.5-0.18.tar.gz
+sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
new file mode 100644
index 0000000000..942aac155c
--- /dev/null
+++ b/package/perftest/perftest.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perftest
+#
+################################################################################
+
+PERFTEST_VERSION = 4.5-0.18
+PERFTEST_SITE = $(call github,linux-rdma,perftest,v$(PERFTEST_VERSION))
+PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
+PERFTEST_LICENSE_FILES = COPYING
+PERFTEST_DEPENDENCIES = pciutils rdma-core
+# Fetched from Github, with no configure script
+PERFTEST_AUTORECONF = YES
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_perftest.py b/support/testing/tests/package/test_perftest.py
new file mode 100644
index 0000000000..68c850911e
--- /dev/null
+++ b/support/testing/tests/package/test_perftest.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestPerftest(infra.basetest.BRTest):
+
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.80"
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
+        BR2_PACKAGE_PERFTEST=y
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
+        self.assertRunOk("ip link set dev eth0 up")
+        self.assertRunOk("rdma link add rxe0 type rxe netdev eth0")
+
+        # start a server
+        self.assertRunOk("ib_read_bw > /dev/null 2>&1 &")
+
+        # start a client
+        self.assertRunOk("sleep 1 && ib_read_bw 127.0.0.1")
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
