Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A508C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8B960F0F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B8B960F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEDAB40469;
	Sat,  9 Oct 2021 19:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dgOo7yl9T1H; Sat,  9 Oct 2021 19:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5C6440466;
	Sat,  9 Oct 2021 19:17:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8A91BF31A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA7F6072A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VwFDlVgNMzrM for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:16:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA8C76070F
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:16:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 109A21BF203;
 Sat,  9 Oct 2021 19:16:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sat,  9 Oct 2021 21:16:45 +0200
Message-Id: <20211009191646.1076266-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] support/testing: add suite of tests for gdb
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The list of tests is as follows:

TestGdbHostOnlyDefault: build just minimal host-gdb, default version

TestGdbHostOnlyAllFeatures: build host-gdb, default version, with all
features enabled (TUI, Python, simulator)

TestGdbserverOnly: build just target gdbserver, default version

TestGdbFullTarget: build just target gdb, default version

TestGdbHostOnly9x: build minimal host-gdb, 9.x version

TestGdbHostGdbserver9x: build minimal host-gdb 9.x + gdbserver

TestGdbHostGdbTarget9x: build minimal host-gdb 9.x + full gdb

TestGdbHostOnly11x: build minimal host-gdb, 11.x version

TestGdbHostGdbserver11x: build minimal host-gdb 11.x + gdbserver

TestGdbHostGdbTarget11x: build minimal host-gdb 11.x + gdb

TestGdbArc: build minimal host-gdb + gdb + gdbserver, for the special
ARC architecture version

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gdb.py | 215 ++++++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 support/testing/tests/package/test_gdb.py

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
new file mode 100644
index 0000000000..a7b0870644
--- /dev/null
+++ b/support/testing/tests/package/test_gdb.py
@@ -0,0 +1,215 @@
+import os
+import infra.basetest
+
+
+class BaseGdb(infra.basetest.BRTest):
+    def verify_host_gdb(self, prefix="arm-linux"):
+        cmd = ["host/bin/%s-gdb" % prefix, "--version"]
+        # We don't check the return value, as it automatically raises
+        # an exception if the command returns with a non-zero value
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+    def boot(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic",
+                                    "-net", "user"])
+        self.emulator.login()
+
+    def verify_gdbserver(self):
+        cmd = "gdbserver --version"
+        self.assertRunOk(cmd)
+
+    def verify_gdb(self):
+        cmd = "gdb --version"
+        self.assertRunOk(cmd)
+
+
+class TestGdbHostOnlyDefault(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbHostOnlyAllFeatures(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_PACKAGE_HOST_GDB_TUI=y
+        BR2_PACKAGE_HOST_GDB_PYTHON3=y
+        BR2_PACKAGE_HOST_GDB_SIM=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbserverOnly(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_GDB=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.boot()
+        self.verify_gdbserver()
+
+
+class TestGdbFullTarget(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.boot()
+        self.verify_gdb()
+
+
+class TestGdbHostOnly9x(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_9_2=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbHostGdbserver9x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_9_2=y
+        BR2_PACKAGE_GDB=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdbserver()
+
+
+class TestGdbHostGdbTarget9x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_9_2=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdb()
+
+
+class TestGdbHostOnly11x(BaseGdb):
+    config = \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_11=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+
+
+class TestGdbHostGdbserver11x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_11=y
+        BR2_PACKAGE_GDB=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdbserver()
+
+
+class TestGdbHostGdbTarget11x(BaseGdb):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_GDB_VERSION_11=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        self.verify_host_gdb()
+        self.boot()
+        self.verify_gdb()
+
+
+class TestGdbArc(BaseGdb):
+    config = \
+        """
+        BR2_arcle=y
+        BR2_archs4x_rel31=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_HOST_GDB=y
+        BR2_PACKAGE_GDB=y
+        BR2_PACKAGE_GDB_SERVER=y
+        BR2_PACKAGE_GDB_DEBUGGER=y
+        """
+
+    def test_run(self):
+        self.verify_host_gdb("arc-linux")
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
