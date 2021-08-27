Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEA6C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D2160EE4
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41D2160EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DD3A427E5;
	Fri, 27 Aug 2021 21:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVnnu6Skzym9; Fri, 27 Aug 2021 21:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A76427EB;
	Fri, 27 Aug 2021 21:01:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58A321BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 566F483EB3
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOI688Mzk2-c for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from da1vs03.rockwellcollins.com (da1vs03.rockwellcollins.com
 [205.175.227.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9952F83EB1
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:01:40 +0000 (UTC)
IronPort-SDR: uvpKFazZsy4nZqeidjavfnaSuuykRK1uPnDjaMGjaBpZSxVbQUiMy4U2nab59R2bcEUE8f8DXW
 ZmxCTkpFrF+S12GaXfx1t+dgsiQO6EwIP3L8b09l5uKlao14SyhI83Vuw6J4gL2A8TF0mSw7OT
 yQeYgUv0WVZrbJW52MBk4cM6Ho4PkdpWQKioIbV4L3uLOtFq0mObBDBW8U764k8TTstgqaUvvN
 VzI1fD9AlZWfqeg4px9ewA7QE19PqVwY9wI7D0nMPLD6U0efqs8D6tAhfb0iHF+PYJxjNXWBE9
 3jI=
Received: from ofwda1n02.rockwellcollins.com (HELO
 ciulimr02.rockwellcollins.com) ([205.175.227.14])
 by da1vs03.rockwellcollins.com with ESMTP; 27 Aug 2021 15:54:31 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 00ECC201E5;
 Fri, 27 Aug 2021 15:54:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 15:54:30 -0500
Message-Id: <20210827205430.39745-4-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210827205430.39745-1-matthew.weber@collins.com>
References: <20210827205430.39745-1-matthew.weber@collins.com>
Subject: [Buildroot] [PATCH v3 3/3] support/testing/tests/fs: test OCI format
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Matthew Weber via buildroot <buildroot@busybox.net>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patch adds runtime testing of the OCI archive created by the
sloci scripting. It launches a containerd instance, imports, and
runs the OCI container.

The existing QEMU AARCH64 kernel config was extended to enable common
options used by a container runtime (cgroup and overlayfs).

Signed-off-by: Matthew Weber <matthew.weber@collins.com>

---
The updating of the QEMU AARCH64 kernel config seemed like a better
option then 1) adding to the docker compose test kernel fragment or
2) creating a new fragment for this test.
---
 board/qemu/aarch64-virt/linux.config |  6 +++
 support/testing/tests/fs/test_oci.py | 56 ++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 support/testing/tests/fs/test_oci.py

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 02e0812ffd..e3a4a92913 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -3,6 +3,11 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_TASKSTATS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_VEXPRESS=y
@@ -62,5 +67,6 @@ CONFIG_ARM_SMMU_V3=y
 CONFIG_EXT4_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_VIRTIO_FS=y
+CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
new file mode 100644
index 0000000000..eb5548c510
--- /dev/null
+++ b/support/testing/tests/fs/test_oci.py
@@ -0,0 +1,56 @@
+import os
+import shutil
+import infra.basetest
+
+
+class TestOci(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.61"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_CGROUPFS_MOUNT=y
+        BR2_PACKAGE_CONTAINERD=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
+        BR2_TARGET_ROOTFS_OCI=y
+        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="df"
+        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="-h"
+        BR2_TARGET_ROOTFS_OCI_ARCHIVE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda", "console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-drive", "file={},format=raw,if=virtio".format(rootfs)])
+        self.emulator.login()
+
+    def place_test_oci(self):
+        shutil.copy(os.path.join(self.builddir, 'images', 'rootfs-oci-latest-aarch64-linux.oci-image.tar'),
+                    os.path.join(self.builddir, 'target', 'oci.tar'))
+        self.b.build()
+
+    def test_run(self):
+        self.place_test_oci()
+        self.login()
+
+        cmd = "containerd &"
+        self.assertRunOk(cmd)
+
+        cmd = "ctr image import --base-name buildroot-test /oci.tar"
+        self.assertRunOk(cmd, timeout=120)
+
+        cmd = "ctr run --rm --tty buildroot-test:latest v1"
+        self.assertRunOk(cmd, timeout=120)
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
