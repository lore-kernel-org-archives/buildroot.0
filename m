Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0ADC47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 20:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7FDB40025;
	Mon, 29 Jan 2024 20:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7FDB40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qO9zvOWadssF; Mon, 29 Jan 2024 20:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 602A4404DB;
	Mon, 29 Jan 2024 20:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602A4404DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 567DB1BF36D
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F794607F5
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F794607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G17eUk1oGi9I for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 20:36:44 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4868060011
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 20:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4868060011
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5ED6813F89C;
 Mon, 29 Jan 2024 21:36:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 21:36:35 +0100
Message-ID: <20240129203635.183112-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706560602;
 bh=d4VWKRIJHFZeG5VvqBqeAmZVncFaXpuaJtSrZi/O0Fc=;
 h=From:To:Cc:Subject:Date:From;
 b=t35r1XK4eoswQ2wrj2zug6tEtM2wrI+G1c7SEqmEkXs3uSiJ5WVW8+qxXSbV76tKK
 2hPEJ0sYM37Zx3sQcoyQr3AxjaDYBvU6vWSRUU6v7OKOCo8pCwrv9upu6EgCxHpM9h
 aGxu5UkqJkplnK67+uuEW6/2itSiMIiRyobLXd8QBuKIjV48enOuCTsziKFJeEHmIU
 3pq51+gzr05J+7T/OgkCJyRfJiMLvvzV5Am4BlWx3RrO3Wsn3EOe+xwPRUA173A2hy
 p+yzh1U5usFPU0tHfcGn13W6jQv+RRZ/0s6xzx8Ad/7yOVY3m5MheS0pd/Hgy3wP7q
 pDD7FXFU2IoLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t35r1XK4
Subject: [Buildroot] [PATCH 1/1] support/testing: add numactl runtime test
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_numactl.py | 142 ++++++++++++++++++
 .../test_numactl/linux-numactl.fragment       |   1 +
 3 files changed, 145 insertions(+)
 create mode 100644 support/testing/tests/package/test_numactl.py
 create mode 100644 support/testing/tests/package/test_numactl/linux-numactl.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..9dd73b7a0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1800,6 +1800,8 @@ F:	support/testing/tests/package/test_netcat.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
+F:	support/testing/tests/package/test_numactl.py
+F:	support/testing/tests/package/test_numactl/
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_numactl.py b/support/testing/tests/package/test_numactl.py
new file mode 100644
index 0000000000..2ef9eb3635
--- /dev/null
+++ b/support/testing/tests/package/test_numactl.py
@@ -0,0 +1,142 @@
+import os
+import re
+
+import infra.basetest
+
+
+class TestNumaCtl(infra.basetest.BRTest):
+    # A specific configuration is needed for testing numactl:
+    # - This test uses a x86_64 config, which has mature NUMA support.
+    # - A kernel need to compiled with a NUMA support.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_numactl/linux-numactl.fragment")
+    config = \
+        f"""
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.75"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_NUMACTL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_numactl_preferred(self):
+        # Show the default NUMA policy settings. We check we have the
+        # 4 physical cpus on 2 nodes we configured the emulator
+        # command line.
+        out, ret = self.emulator.run("numactl --show")
+        self.assertEqual(ret, 0)
+        checks = [
+            "policy: default",
+            "preferred node: current",
+            "physcpubind: 0 1 2 3 ",
+            "nodebind: 0 1 ",
+            "membind: 0 1 "
+        ]
+        for pattern in checks:
+            self.assertIn(pattern, out)
+
+        # Check the preferred policy on different nodes. This command
+        # is taken from the numactl man page.
+        for pref_node in range(2):
+            cmd = f"numactl --preferred={pref_node} numactl --show"
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0)
+            checks = [
+                "policy: preferred",
+                f"preferred node: {pref_node}"
+            ]
+            for pattern in checks:
+                self.assertIn(pattern, out)
+
+    def get_numa_node_free_mem(self):
+        out, ret = self.emulator.run("numactl --hardware")
+        self.assertEqual(ret, 0)
+        free_mem = {}
+        p = re.compile("^node ([0-9]+) free: ([0-9]+) MB")
+        for line in out:
+            m = p.match(line)
+            if m:
+                node = int(m.group(1))
+                mem = int(m.group(2))
+                free_mem[node] = mem
+        return free_mem
+
+    def check_numactl_membind(self):
+        # We get the current amount of free memory on each node, for
+        # later comparison.
+        initial_node_free_mem = self.get_numa_node_free_mem()
+
+        # We allocate a shared memory file with a restriction to be in
+        # node 1 memory only.
+        shm_file = "/dev/shm/file"
+        file_size = 100
+        cmd = f"numactl --membind=1 dd if=/dev/zero of={shm_file} bs=1M count={file_size}"
+        self.assertRunOk(cmd)
+
+        # We collect again the amount of free memory per node.
+        node_free_mem = self.get_numa_node_free_mem()
+
+        # Since we allocated 100M on node 1 only, we check the free
+        # space on node 0 did not significantly changed and on node 1
+        # approximately reduced of the file size.
+        diff = initial_node_free_mem[0] - node_free_mem[0]
+        self.assertAlmostEqual(diff, 0, delta=10)
+        diff = initial_node_free_mem[1] - node_free_mem[1]
+        self.assertAlmostEqual(diff, file_size, delta=10)
+
+        # Remove the file, to free the memory.
+        self.assertRunOk(f"rm -f {shm_file}")
+
+        # We allocate again a file in shared memory, but this time in
+        # two chunks. Each chunk is requested to be allocated in two
+        # different nodes. This example is taken from the numactl man
+        # page.
+        chunk_size = file_size // 2
+        cmd = "numactl --membind=0 "
+        cmd += f"dd if=/dev/zero of={shm_file} bs=1M count={chunk_size}"
+        self.assertRunOk(cmd)
+        cmd = "numactl --membind=1 "
+        cmd += f"dd if=/dev/zero of={shm_file} bs=1M count={chunk_size} seek={chunk_size}"
+        self.assertRunOk(cmd)
+
+        # We collect again the amount of free memory.
+        node_free_mem = self.get_numa_node_free_mem()
+
+        # We check the free memory space approximately reduced of each
+        # chunk size.
+        for node in range(2):
+            free_mem_diff = initial_node_free_mem[node] - node_free_mem[node]
+            self.assertAlmostEqual(free_mem_diff, chunk_size, delta=5)
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        # We start the Qemu emulator with 4 processors on 2 NUMA nodes.
+        self.emulator.boot(arch="x86_64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyS0"],
+                           options=["-cpu", "Nehalem", "-m", "512M",
+                                    "-smp", "cpus=4,sockets=2,cores=2,maxcpus=4",
+                                    "-object", "memory-backend-ram,size=256M,id=m0",
+                                    "-object", "memory-backend-ram,size=256M,id=m1",
+                                    "-numa", "node,cpus=0-1,nodeid=0,memdev=m0",
+                                    "-numa", "node,cpus=2-3,nodeid=1,memdev=m1",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # Check a simple numactl invication:
+        # show the NUMA hardware inventory.
+        self.assertRunOk("numactl --hardware")
+
+        self.check_numactl_preferred()
+        self.check_numactl_membind()
diff --git a/support/testing/tests/package/test_numactl/linux-numactl.fragment b/support/testing/tests/package/test_numactl/linux-numactl.fragment
new file mode 100644
index 0000000000..e480f0c042
--- /dev/null
+++ b/support/testing/tests/package/test_numactl/linux-numactl.fragment
@@ -0,0 +1 @@
+CONFIG_NUMA=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
