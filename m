Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C1C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3692417E3;
	Sun,  5 Nov 2023 21:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3692417E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIp8nwgAQUlb; Sun,  5 Nov 2023 21:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8E41417D7;
	Sun,  5 Nov 2023 21:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8E41417D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 038151BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0DCF417D8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0DCF417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zU04lfMCRjil for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:52:32 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10016417D0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10016417D0
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-da0cfcb9f40so3967709276.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699221150; x=1699825950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hg1DV/ZYYngYVnha7c41rcSWvSWEVtHXWmRMcU1Q3BM=;
 b=YmwcHkU3lqBVfNdgEoemqFOnXRpk+YUYzoOdCWFnVT7IzHJWOsd7YkKVpsjsKNFBDK
 iaTT7fS6DocsgnzUl/P8TE6CKmI1xFY93FDWxiypCYswnGy6CwhwN+1qmqWFCtKpV/63
 TvDLaOsCnPhV23mLmBuS66rP0RG8nqKq9aIpgJYW/o4gDmuWfxPgF6tsErJVFWc61vq0
 nUuGy+zpNoK9nEkDngylzxuwIQbSthIYl9VK2o7lFbqTsnuCRapwkazZ3z7QEha/wYl8
 u2wq0cBUtIKb964kV8FXm4HwKkENlzOOJwVfSA63D0j4E83NN8wN7FuOs5C493KB46Pa
 OipA==
X-Gm-Message-State: AOJu0YwEgtuRsEYXwrS/ZtvBxqse7cOhH43b/XI5QEZntJ0q+BJMgUNa
 eYC55l7W2LZ/HtM9GCDaxLaEILHQJQzU9eYywU/y3R3P
X-Google-Smtp-Source: AGHT+IFFj4SWAFIIltI2JtgU6zLfJ+B7D3bZsNjiuEYMu8sF8ML3CdOMkbIRV+zeKflmnSBs6rfzdg==
X-Received: by 2002:a05:6902:201:b0:da3:74d8:48bf with SMTP id
 j1-20020a056902020100b00da374d848bfmr13631712ybs.37.1699221150126; 
 Sun, 05 Nov 2023 13:52:30 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902b09600b001b8a3e2c241sm4607175plr.14.2023.11.05.13.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:52:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 14:52:21 -0700
Message-ID: <20231105215221.1602465-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
References: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699221150; x=1699825950;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hg1DV/ZYYngYVnha7c41rcSWvSWEVtHXWmRMcU1Q3BM=;
 b=rLwrwwhJY8c9NneEUKG5ogEvRu0r5z8Xi5vXbLLhjDr96AwCOZ8eNWJNbtFtrg36aW
 8Ex11V98m9tY6ailVmQ7aEy2QL0GvE4HxwjmomUnF0w7ix4+BYw7rGgdiSr2976GBREc
 78ruGGbrXtQlMxtfT6y0dggsPOG+9ze2xz8qM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rLwrwwhJ
Subject: [Buildroot] [PATCH 5/5]
 support/testing/tests/package/test_firewalld.py: new test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This test case runs firewalld using both system and sysvinit.

run `firewalld-cmd --state` and ensure the output is "running" with a return
code of 0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |   1 +
 .../testing/tests/package/test_firewalld.py   | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 support/testing/tests/package/test_firewalld.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d096ab0449..47cebfef72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
new file mode 100644
index 0000000000..700337f637
--- /dev/null
+++ b/support/testing/tests/package/test_firewalld.py
@@ -0,0 +1,102 @@
+"""Test firewalld for both systemd and sysvinit."""
+import os
+import time
+import infra.basetest
+
+
+class TestFirewalldSystemd(infra.basetest.BRTest):
+    """Build the kernel as firewalld requires several the nftable options."""
+
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        # It takes quite some time for the system to boot with firewalld,
+        self.emulator.login(timeout=120)
+
+        # It may take some time for firewalld to finish startup.
+        # Give it at least 15 seconds.
+        is_active = False
+        for i in range(15):
+            output, _ = self.emulator.run("systemctl is-active firewalld")
+            if output[0] == "active":
+                is_active = True
+                break
+            time.sleep(1)
+        if not is_active:
+            self.fail("firewalld failed to activate!")
+
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
+
+
+class TestFirewalldSysVInit(infra.basetest.BRTest):
+    """Build the kernel as firewalld requires several nftable options."""
+
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        # It takes quite some time for the system to boot with firewalld.
+        self.emulator.login(timeout=120)
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
