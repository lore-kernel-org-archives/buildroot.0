Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68C5C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692DC61089;
	Tue,  7 Feb 2023 22:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 692DC61089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-1KdDFAUXWA; Tue,  7 Feb 2023 22:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370E06106C;
	Tue,  7 Feb 2023 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370E06106C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4AEB1BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0BF416D8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0BF416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJR-7IlLtcKi for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6044D416DE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6044D416DE
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:10:22 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.25.48])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8F04D780304;
 Tue,  7 Feb 2023 23:10:16 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 23:09:41 +0100
Message-Id: <20230207220941.58066-5-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207220941.58066-1-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675807820;
 bh=h24A216gbxuGi5le4SmB8hB7/TzIb1t4W5LnzY0otdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bCD+3MZuZl/O4GIKyzQV1BqKgKXVHX/mj8OSKUBphxelojtKGBv5Bml97naZY3d4D
 ajpeJ+3keaEBJPBqbNw9hX+Dx8e6VL5QjPwBSQMC7h3qdsYZp3CLBNmLpGlnjINaCa
 LfwvCAhz4iw2VCNLBabOXgCgS+TpsI2NR7OnIzj+0r3vtgu2fVtJGVa96arhLPi2SB
 clxiBmb9xq8aNffAYddgMyvmKh7uojpxMEFyfqgk7LtD/4c19CeNwjiT673vLi0WMH
 HgtXucPsGiateYcbH4L5wOsgPhkz+tgL1sbCwZURqLW7xwEiq918VKC8LeRSR22mt9
 j1URGiRyqrk9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bCD+3MZu
Subject: [Buildroot] [PATCH 5/5] support/testing: add test for openmpi
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This openmpi runtime test attempt to run the "hello_c" example program
on a 8 cpu Aarch64 system. It expects the same amount of "Hello, world"
messages.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on branch master at commit 4fbd2f6 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8 support/testing/tests/package/test_openmpi.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_openmpi
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_openmpi.py | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 support/testing/tests/package/test_openmpi.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d1c3a2a83..c6587b10e1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1715,6 +1715,7 @@ F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
+F:	support/testing/tests/package/test_openmpi.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_openmpi.py b/support/testing/tests/package/test_openmpi.py
new file mode 100644
index 0000000000..86a42a0145
--- /dev/null
+++ b/support/testing/tests/package/test_openmpi.py
@@ -0,0 +1,53 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenMPI(infra.basetest.BRTest):
+    # We use a "virt" Aarch64 machine to have smp and 512M of memory
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.92"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_OPENMPI_EXAMPLES=y
+        """
+
+    def test_run(self):
+        num_cpu = 8
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern_file = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern_file,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-smp", str(num_cpu), "-cpu", "cortex-a57", "-m", "512M", "-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("ompi_info --all")
+
+        # "--allow-run-as-root" option is needed because mpirun
+        # normally refuse to start as root, as a security mechanism.
+        # "--mca plm_rsh_agent /bin/true" is needed because openmpi
+        # silently fails if the "rsh" binary is not present in the
+        # system, even if it's not used. We define it as "/bin/true",
+        # as a workaround.
+        # The hello_c example will spawn one job per cpu. We expect
+        # the same number of "Hello, world," output as the number of
+        # cpus.
+        cmd = "mpirun" \
+            " --allow-run-as-root" \
+            " --mca plm_rsh_agent /bin/true" \
+            " /usr/bin/ompi_hello_c"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        all_output = ''.join(output)
+        self.assertEqual(all_output.count('Hello, world,'), num_cpu)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
