Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617FFEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 15:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A111840A7;
	Fri, 11 Aug 2023 15:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A111840A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rc0qL7-eRzdn; Fri, 11 Aug 2023 15:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9923E840B0;
	Fri, 11 Aug 2023 15:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9923E840B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A846F1BF575
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B9C41E8F
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B9C41E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aaHCPCa2SNo for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 15:27:20 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFAB4410E5
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 15:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFAB4410E5
Received: from pwmachine.numericable.fr (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id A98EE20FD0DE;
 Fri, 11 Aug 2023 08:27:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A98EE20FD0DE
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 17:27:09 +0200
Message-Id: <20230811152710.43564-4-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811152710.43564-1-flaniel@linux.microsoft.com>
References: <20230811152710.43564-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1691767640;
 bh=8234EYB54dbReZI50p5nsgfN2P4KEeiUxCi0s/ciFOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XlYxXEtjVAVN8ET/DH//i9jiNttZLx02uHlkd+xJ+JMN5JbGDFZ9SB8jA/mrQLJ8R
 lcBvENkK6X9kOsBsutB6SrF2R6gVgoYE1zVAoxsPGdzd31RQ8i3o/nB5GikkaUWjOr
 Lf/yrMGWF/+HOHQiJZ2TyfMt3ez3RLjtnfwrV0fw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=XlYxXEtj
Subject: [Buildroot] [RFC PATCH v2 3/3] support/testing/package: add new
 test for sysdig
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 .../testing/tests/package/test_sysdig.config  |  1 +
 support/testing/tests/package/test_sysdig.py  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_sysdig.config
 create mode 100644 support/testing/tests/package/test_sysdig.py

diff --git a/support/testing/tests/package/test_sysdig.config b/support/testing/tests/package/test_sysdig.config
new file mode 100644
index 0000000000..6450f34933
--- /dev/null
+++ b/support/testing/tests/package/test_sysdig.config
@@ -0,0 +1 @@
+CONFIG_IPV6=y
diff --git a/support/testing/tests/package/test_sysdig.py b/support/testing/tests/package/test_sysdig.py
new file mode 100644
index 0000000000..f27114c539
--- /dev/null
+++ b/support/testing/tests/package/test_sysdig.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestSysdig(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_GCC_AT_LEAST_5=y
+        BR2_TOOLCHAIN_HAS_THREADS=y
+        BR2_TOOLCHAIN_HAS_SYNC_4=y
+        BR2_INSTALL_LIBSTDCPP=y
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_5_1=y
+        BR2_PACKAGE_SYSDIG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(linux_fragment=infra.filepath("tests/package/test_sysdig.config"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7", kernel=kernel_file,
+                           kernel_cmdline=[
+                                        "console=ttyAMA0,115200"],
+                           options=["-initrd", cpio_file,
+                                    "-dtb", dtb_file,
+                                    "-M", "vexpress-a9", "-m", "1024"])
+        self.emulator.login()
+
+        self.assertRunOk("sysdig --version")
+        # Run sysdig for 3 seconds.
+        self.assertRunOk("sysdig -M 3")
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
