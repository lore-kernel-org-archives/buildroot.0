Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5125CD37AD
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 274C7613E5;
	Fri, 15 Sep 2023 22:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 274C7613E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKvtUHxvfel7; Fri, 15 Sep 2023 22:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43ED8613F0;
	Fri, 15 Sep 2023 22:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43ED8613F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC9B41BF3EA
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1350613E5
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1350613E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3AFfvxhgLps for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:15:02 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67239613F0
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67239613F0
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B97DC13F838;
 Sat, 16 Sep 2023 00:14:55 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 00:14:44 +0200
Message-ID: <20230915221444.1686011-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694816099;
 bh=M4svdXeJGymalntB7z4KU8bc++zJ8SUPJtGEseKx4xY=;
 h=From:To:Cc:Subject:Date:From;
 b=SdJxXaCgW/YftsiqqjHHOfiaJQgxMLRP3Yvo17nV46iiv0kt82WisBcUHeP/WRFaz
 tK2jWGtVRcplHcBx2ueZvYbDcT/qmU7QKybVoUlspAyTR/8EBCTxXSkFnzecSvf6Dg
 n08FP5vN5exBbRw3dF3BQMX4hF7htJr4muhDzkJedxO827qB861SUwMn2QXriTmAaJ
 mDZoHq28KLL10aMIWMhUCNqeKWbhu68BWgj+nJTw8YxqE//B6g2UtseE5CUFAJweDL
 UuTQctxTarDBIlksDkpuFh82fisRYFYf4dZS73w+CzsfsfumFYRltuCMgq3TDNbfq2
 +sGYWeznmbmnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SdJxXaCg
Subject: [Buildroot] [PATCH RFC 1/1]
 support/testing/tests/package/test_criu.py: new runtime test
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
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This test was suggested by Thomas in [1] during the criu package
proposal in [2]. criu is not accepted yet. This is a first version
of the test for review. Minor rework is expected to align the the
final criu package patch.

Tested on branch master at commit c89d7a2, on top of criu patch [2],
with command:

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_criu
    ...
    OK

[1] https://lists.buildroot.org/pipermail/buildroot/2023-September/674567.html
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20230910193725.1435827-1-marcus.folkesson@gmail.com/
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_criu.py    | 127 ++++++++++++++++++
 .../package/test_criu/linux-criu.fragment     |   1 +
 .../rootfs-overlay/root/criu-loop.sh          |  15 +++
 4 files changed, 145 insertions(+)
 create mode 100644 support/testing/tests/package/test_criu.py
 create mode 100644 support/testing/tests/package/test_criu/linux-criu.fragment
 create mode 100755 support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index d6e6a98202..7220e66af3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1723,6 +1723,8 @@ F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
+F:	support/testing/tests/package/test_criu.py
+F:	support/testing/tests/package/test_criu/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/support/testing/tests/package/test_criu.py b/support/testing/tests/package/test_criu.py
new file mode 100644
index 0000000000..af2def85e1
--- /dev/null
+++ b/support/testing/tests/package/test_criu.py
@@ -0,0 +1,127 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestCriu(infra.basetest.BRTest):
+    # Criu needs to recompile a Kernel, to enable
+    # CONFIG_CHECKPOINT_RESTORE=y
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.53"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_CRIU=y
+        BR2_PACKAGE_HOST_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_criu/linux-criu.fragment"),
+            infra.filepath("tests/package/test_criu/rootfs-overlay")
+        )
+    # Define constants for the test
+    test_script_name = "criu-loop.sh"
+    test_script_path = f"/root/{test_script_name}"
+    test_flag_file = "/tmp/wait-flag"
+    test_log = "/tmp/criu-loop.log"
+    pidof_cmd = f"pidof {test_script_name}"
+    checkpoint_dir = "/root/checkpoint"
+    tail1_log_cmd = f"tail -1 {test_log}"
+    expected_log_end = "Done"
+
+    def assert_script_is_running(self):
+        # We check our script is running if the command "pidof"
+        # succeed to find a valid PID.
+        self.assertRunOk(self.pidof_cmd)
+
+    def assert_script_is_not_running(self):
+        # Conversely, the "pidof" command will fail if it cannot find
+        # a valid PID for our script.
+        _, exit_code = self.emulator.run(self.pidof_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("criu --version")
+
+        # We run the "criu check" command, which validates the kernel
+        # supports the needed features. We also add verbose logs for
+        # easier debugging.
+        self.assertRunOk("criu check -v")
+
+        # We start our test script, in a new session. Note: to make
+        # sure this test will be reliable in different execution speed
+        # conditions, the script implement a simple synchronization
+        # mechanism by creating a flag file and wait for it to be
+        # removed by this test controller.
+        cmd = f"setsid {self.test_script_path}"
+        cmd += f" < /dev/null &> {self.test_log} &"
+        self.assertRunOk(cmd)
+
+        # Let the script make few loops, then create and wait on its
+        # flag file.
+        time.sleep(3)
+
+        # Our script is supposed to be running.
+        self.assert_script_is_running()
+
+        # We dump the process tree with criu.
+        self.assertRunOk(f"mkdir -p {self.checkpoint_dir}")
+        cmd = f"criu dump -D {self.checkpoint_dir} -t $({self.pidof_cmd})"
+        self.assertRunOk(cmd)
+
+        # We check some criu image files were created.
+        self.assertRunOk(f"ls -1 --color=never {self.checkpoint_dir}/*.img")
+
+        # Our script is no longer supposed to be running (it was
+        # supposed to be stopped bu criu during the dump).
+        self.assert_script_is_not_running()
+
+        # We expect the last line of the log to NOT be "Done" yet.
+        output, exit_code = self.emulator.run(self.tail1_log_cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertNotEqual(output[0], self.expected_log_end)
+
+        # We restore the process image.
+        self.assertRunOk(f"criu restore -d -D {self.checkpoint_dir}")
+
+        # Our script is supposed to be running again.
+        self.assert_script_is_running()
+
+        # We remove our test flag, to let our script to end its loop
+        # (this flag was created by the test script, while we were
+        # waiting earlier).
+        self.assertRunOk(f"rm {self.test_flag_file}")
+
+        # We wait for the script to finish its loop.
+        time.sleep(5)
+
+        # Our script is supposed to have reached its end, and
+        # exited. The script is no longer supposed to be running.
+        self.assert_script_is_not_running()
+
+        # We expect the last line of the log to be the end message.
+        output, exit_code = self.emulator.run(self.tail1_log_cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], self.expected_log_end)
diff --git a/support/testing/tests/package/test_criu/linux-criu.fragment b/support/testing/tests/package/test_criu/linux-criu.fragment
new file mode 100644
index 0000000000..c554a09cec
--- /dev/null
+++ b/support/testing/tests/package/test_criu/linux-criu.fragment
@@ -0,0 +1 @@
+CONFIG_CHECKPOINT_RESTORE=y
diff --git a/support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh b/support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh
new file mode 100755
index 0000000000..6a1f72b442
--- /dev/null
+++ b/support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh
@@ -0,0 +1,15 @@
+#! /bin/sh
+set -eu
+echo "Start"
+for LOOP in $(seq 6) ; do
+    echo "Loop $LOOP"
+    if [ "$LOOP" -eq 3 ] ; then
+        touch /tmp/wait-flag
+    fi
+    while [ -e /tmp/wait-flag ] ; do
+        sleep 1
+        echo "Waiting..."
+    done
+    sleep 1
+done
+echo "Done"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
