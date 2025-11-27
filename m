Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AA5D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 14:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62CF180711;
	Thu, 27 Nov 2025 14:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaPfxSE8sBb1; Thu, 27 Nov 2025 14:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBE7806AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBE7806AC;
	Thu, 27 Nov 2025 14:14:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F7C2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87958411E9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svLRruNj-Dbi for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 14:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D420441263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D420441263
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D420441263
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 291071A1DC3
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 14:14:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0022A6068C;
 Thu, 27 Nov 2025 14:14:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F66A102F2770; Thu, 27 Nov 2025 15:14:14 +0100 (CET)
Date: Thu, 27 Nov 2025 15:14:06 +0100
MIME-Version: 1.0
Message-Id: <20251127-rasdaemon-v2-2-c57284751172@bootlin.com>
References: <20251127-rasdaemon-v2-0-c57284751172@bootlin.com>
In-Reply-To: <20251127-rasdaemon-v2-0-c57284751172@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764252854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=esNZHSL4KmimKlnsuLCxnjLDKrCGAhPGOUfVvEQOvEo=;
 b=c4bkAMay/mYSM3ZIY/dYdACdegRzEQU9tKNNpnlCivmHiz/k1+G68rOzp0Bofigg3WHUYY
 /0c4iYfDOXaHVi0YLVkwVHFN6zADfEjPnfSTa4cLQ67WIyuGCjfbcfuwCeb+0K81gf+w0g
 v91gB4DPl3OkQfG7Jj2DAezDQV6Rq0IqvZQTBKfWtN+QErxdJ128BXKjpW1Z/GdSUFcSxz
 NDyVYkbrDbRNi88luI98ZkxjxI8Q4hINlC8qxq1cHrSpTCxcIeiD/+Xlg/F1rEQhT2xPFS
 GoaSKMItuDMrEyMPhQZ1A/SfpKm0CkCqfOiquSqTZS+JUPjbsXi4AkhT2imApA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=c4bkAMay
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add rasdaemon tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rasdaemon was added in previous patch.

Add a test_rasdaemon that allows to test it.
Test is done on x86. It first checks the daemon's version, then mounts
debugfs and finally ensures that the init script allows to
start/restart/stop the daemon.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/test_rasdaemon.py    | 46 ++++++++++++++++++++++
 .../package/test_rasdaemon/linux-debugfs.fragment  |  8 ++++
 3 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1ead6d26c4e8ff160bcc7ed85b0945ac5e551dc..c9aaa8c9c8aa3d54c930476d9d450e7f990d9aac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -343,6 +343,7 @@ F:	package/uhubctl/
 
 N:	Bastien Curutchet <bastien.curutchet@bootlin.com>
 F:	package/rasdaemon/
+F:	support/testing/tests/package/test_rasdaemon.py
 
 N:	Baxiche Su <baxiche@gmail.com>
 F:	package/qt6/qt6multimedia/
diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
new file mode 100644
index 0000000000000000000000000000000000000000..bc800b6ccbea1c18f4c970d87bea0395c64ad952
--- /dev/null
+++ b/support/testing/tests/package/test_rasdaemon.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestRasdaemon(infra.basetest.BRTest):
+    config = f"""
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_INIT_SYSV=y
+        BR2_LINUX_KERNEL=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.59"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_rasdaemon/linux-debugfs.fragment")}"
+        BR2_PACKAGE_RASDAEMON=y
+        BR2_PACKAGE_RASDAEMON_AER=y
+        BR2_PACKAGE_LIBTRACEEVENT=y
+        BR2_PACKAGE_SQLITE=y
+        BR2_PACKAGE_PCIUTILS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+                arch="x86_64",
+                kernel=kernel,
+                kernel_cmdline=["console=ttyS0"],
+                options=["-cpu", "Nehalem",  "-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        self.assertRunOk("/usr/sbin/rasdaemon --version")
+        self.assertRunOk("mount -t debugfs nodev /sys/kernel/debug")
+        self.assertRunOk("/etc/init.d/S95rasdaemon start")
+        self.assertRunOk("pidof /usr/sbin/rasdaemon")
+        self.assertRunOk("/etc/init.d/S95rasdaemon restart")
+        self.assertRunOk("pidof /usr/sbin/rasdaemon")
+        self.assertRunOk("/etc/init.d/S95rasdaemon stop")
+        _, ret = self.emulator.run("pidof /usr/sbin/rasdaemon")
+        self.assertNotEqual(ret, 0)
diff --git a/support/testing/tests/package/test_rasdaemon/linux-debugfs.fragment b/support/testing/tests/package/test_rasdaemon/linux-debugfs.fragment
new file mode 100644
index 0000000000000000000000000000000000000000..a334bc373179623f3c5b2c3727ee7738a0c2542e
--- /dev/null
+++ b/support/testing/tests/package/test_rasdaemon/linux-debugfs.fragment
@@ -0,0 +1,8 @@
+CONFIG_DEBUG_FS=y
+CONFIG_FTRACE=y
+CONFIG_USER_EVENTS=y
+CONFIG_TRACE_EVENT_INJECT=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_MEMORY_FAILURE=y

-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
