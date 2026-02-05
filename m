Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0158BECD9AF
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 22:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D9B610E2;
	Thu,  5 Feb 2026 22:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBwHQH4Z3M6U; Thu,  5 Feb 2026 22:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D4860FD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770329100;
	bh=pAqk9v+/jQ8QhKnM4KyGX5HoCr43+RGUC1AEM6SYLoE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L2XxeILdRqYvRd0vxuXqcvl+K2/m2mWuPxbyiXFE3JZkuDBQNNWM7bnDezCkeioF8
	 pMReOTCRCHUe3HOTIr3iWedIb1F53bQP7yg/mJKagyigCVb7sGtIA/9m0iDK4+aXJP
	 6sgyiAt+Uy3nL9r7mfaAhkRzlOA++bWeYkbJ2mLcpkgCiWWADhBy4B24xKJtmesrdr
	 zA5d32G0v8dZEqVYDitM7hnfuyJflnZbDOY9dYfITdZTudR0BwV12x8XHvWuVVKnJr
	 gzLW2QrMkua5F7xkJ/ObFnnF+yWC6b0YiuSttySTgtBm9N5dGEEFITQPl19o1Azx6o
	 Oa5yqgTyU+x0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D4860FD3;
	Thu,  5 Feb 2026 22:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F90173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B25140D51
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 22:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oz5g9Is5Qr_i for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 22:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1234; helo=mail-dl1-x1234.google.com;
 envelope-from=kastelic.jakob@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92AAA40CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92AAA40CB3
Received: from mail-dl1-x1234.google.com (mail-dl1-x1234.google.com
 [IPv6:2607:f8b0:4864:20::1234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92AAA40CB3
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 22:04:57 +0000 (UTC)
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-11f1fb91996so18721c88.1
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 14:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770329096; x=1770933896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xAl9Nc95eJXkextJdw1HvdrAj/OsLBDY1Zj58cmOE0w=;
 b=VrRuMl7wbpqQqLrWxpadhCwOxVw7e3QD4CBJ5Doe5C8mOO4DtSRJ0d+ZkuETR7sl5H
 9NXExLJFmbNsQcL34jl6hh8I0ddzsfxGuqonU1T5PXvdjjL5Y4bh1nfMoi2U7DeVZ0uy
 RkOiVTNGvYOBSav4FRTTeGYlHTOZt227jAGxvBFM3SN/65ie8PJoBFeGVSwhW/w6RQ2y
 a1dr9tiCoWEytuRMi1wGZdipwIz8+uCsOWnzOp2GvLH/eJXRqDWBYpjATGeR5Vx2K8cn
 VnI/dU7Lnz9KmkLtwn82ZiBNJkZbrGRsVvp7Aj9goXHXCXXxxJbvDp6BD8yWJhWHrRcL
 e/CQ==
X-Gm-Message-State: AOJu0Yx2d3944xVCWr8Bh8592mSTqcQwTUL9UeNAbRUZOKCvRFMfjWWy
 fnrtwYhu1dDsa+HN5cRABxtysd8k1nuismtR+h+Nq64+JFHYNpjDzgqrXeH93XBC
X-Gm-Gg: AZuq6aK0b+xYJmM8J7FOqZlij0h3QzO08k7Q09+m7Q9TZc2x0XbBIBsHmWh+TYBgiGR
 I7d8979ZP+OeeN0Re0Es8W2EX0smXwXaBrr5qqwKdci/+m0UAjrnBbX4rdjt+BVICUFISvpZobH
 nrznZLX3DZByMOTJQ/s0blDzlj15VYSDRGXfaYyMFWcQPiUbdQJOyAIJ6Cleshfu4RqnMQ1NEnI
 MAStWzHJ9K7CFN+SJoIE82zn9OgFHjkqSfaOZHCngyO6SEdKIKLg5aMiOqCewSlMTp7fm9lXWL5
 ra0D0wS1zdPb03iJ+oCS+WNfttXqN/48/7ShinIHDBRVwGyQABDyj1VIJaZMhGRfYhcaVhoS54p
 VYRTpm8IuGAVMzAGvP2msxFsQRx1Wpw/y7qkJlHLzBgTdzZaiYSyTbxnsaipDWKJ4cGdK1lucNR
 8wtdUWpIYbh0Mchu/21+uCbp+VI6hkYtEDbLIuq+6G3LYZHtPt8M6HJUHnUFsM8IQo
X-Received: by 2002:a05:7300:8c03:b0:2b8:5159:eca5 with SMTP id
 5a478bee46e88-2b8564a37e4mr244177eec.14.1770329095781; 
 Thu, 05 Feb 2026 14:04:55 -0800 (PST)
Received: from localhost.localdomain (c-67-164-2-197.hsd1.ca.comcast.net.
 [67.164.2.197]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b855ad9a42sm568709eec.1.2026.02.05.14.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 14:04:55 -0800 (PST)
From: Jakob Kastelic <kastelic.jakob@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Feb 2026 14:03:24 -0800
Message-ID: <20260205220324.1932848-2-kastelic.jakob@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205045029.1809033-1-kastelic.jakob@gmail.com>
References: <20260205045029.1809033-1-kastelic.jakob@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770329096; x=1770933896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAl9Nc95eJXkextJdw1HvdrAj/OsLBDY1Zj58cmOE0w=;
 b=Fm0RftnefHWFEoUpDcKtNcfbT8Ba7UeTu3fLbG5hrzOEnJRnxxiyzBK5fDffWHdb56
 iMjTf38Gs6Tg+4CqE+CyZuMv8qy+rl50ZEj1sj5WUQEMcBdhZ7aPd/roxWaaEHIs2hBi
 yGH/QERs2djUN3LVEVzk5RHLuGIUDjqA619wxzJx1tqAx2CZOizBzER1Sd+kAD62ir5B
 Tua1J9tZnmGlVGx52IWjEgbzO7QsgHsl/NMTiOnqlg5pokoQsE20R3PEaHVA5OlGg+X1
 QM+rBSWruCeGZ4mvPYwJyAgx6fzov/yGI/EZ6GGuoRqBxGZ2b6vU9CoZxnjkWziU9hBp
 bBew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fm0Rftne
Subject: [Buildroot] [PATCH v4] support/testing/tests/boot/test_atf.py: test
 BL33
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
Cc: Jakob Kastelic <kastelic.jakob@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a new runtime test, in which TF-A loads Linux directly
(as BL33) under Qemu. This test is used to test the new TF-A flag,
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33.

Signed-off-by: Jakob Kastelic <kastelic.jakob@gmail.com>

---
Changes v3 -> v4:
  - use external toolchain
  - do not use custom headers
  - do not use qemu patches
  - do not force check hashes
---
 DEVELOPERS                             |  3 +
 support/testing/tests/boot/test_atf.py | 92 ++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..d2d4f99371 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1510,6 +1510,9 @@ F:	package/python-scipy/
 F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_scipy.py
 
+N:	Jakob Kastelic <kastelic.jakob@gmail.com>
+F:	support/testing/tests/boot/test_atf.py
+
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
 F:	package/bpftool/
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index b822b9d357..a5e4671a61 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,3 +1,6 @@
+import os
+import subprocess
+
 import infra.basetest
 
 
@@ -30,3 +33,92 @@ class TestATFAllwinner(infra.basetest.BRTest):
 
     def test_run(self):
         pass
+
+
+class TestATFNoUBoot(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a15=y
+        BR2_ARM_FPU_VFPV3D16=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
+        BR2_PACKAGE_OPENSSL=y
+        BR2_PACKAGE_OPTEE_EXAMPLES=y
+        BR2_PACKAGE_OPTEE_TEST=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
+        BR2_TARGET_OPTEE_OS=y
+        BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+        BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+        """
+
+    def patch_dts(self):
+        """
+        Place the rootfs into the kernel command line via the DTB.
+
+        In qemu-system-arm, -append is only allowed with -kernel option. Since
+        we are using the -bios option to load TF-A (which in turn loads the
+        kernel), we have to manually patch the DTB to add the root option.
+        """
+        dtb = os.path.join(self.builddir, "images", "qemu.dtb")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext4")
+        flash = os.path.join(self.builddir, "images", "flash.bin")
+        qemu = os.path.join(self.builddir, "host", "bin", "qemu-system-arm")
+        fdtput = os.path.join(self.builddir, "host", "bin", "fdtput")
+
+        # get the DTB from Qemu
+        subprocess.run([
+            qemu, "-machine", f"virt,dumpdtb={dtb}", "-machine",
+            "secure=on", "-cpu", "cortex-a15"
+            ], check=True)
+
+        # insert kernel command line argument into DTB
+        subprocess.run([fdtput, "-t", "s", f"{dtb}", "/chosen", "bootargs",
+            "root=/dev/vda" ], check=True)
+
+        return dtb, rootfs, flash
+
+    def test_run(self):
+        dtb, rootfs, flash = self.patch_dts()
+
+        self.emulator.boot(arch="arm", options=[
+            "-machine", "virt", "-machine",
+            "secure=on", "-cpu", "cortex-a15", "-dtb", dtb, "-smp", "1",
+            "-s", "-m", "1024", "-d", "unimp", "-netdev", "user,id=vmnic",
+            "-device", "virtio-net-device,netdev=vmnic", "-semihosting-config",
+            "enable=on,target=native", "-bios", flash,
+            "-drive", f"file={rootfs},if=none,format=raw,id=hd0", "-device",
+            "virtio-blk-device,drive=hd0"
+            ])
+
+        self.emulator.login()
+
+        # Check the Kernel has OP-TEE messages
+        self.assertRunOk("dmesg | grep -F optee:")
+
+        # Check we have OP-TEE devices
+        self.assertRunOk("ls -al /dev/tee*")
+
+        # Run some OP-TEE examples
+        examples = ["aes", "hello_world", "hotp", "random", "secure_storage"]
+        for ex in examples:
+            self.assertRunOk(f"optee_example_{ex}")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
