Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904DFEA7968
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 04:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B15583CE2;
	Thu,  5 Feb 2026 04:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZhLuIPWzZAv; Thu,  5 Feb 2026 04:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1587F83F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770267038;
	bh=Cix6FGlifgDuuLKL6Oz1FMILNP+Hctp8f7puRDZLvPA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/tDvqH3UuMO2lcnPNv+pldJuJ6mRNqCmuBa4ym8wWnJpAMxph8geqjkHJXEaHtil
	 lfPSDe+cd86rBUqVfEOJd80Du3ynTsd2mabzi3dbLDNIii3bQLUAyMzoTRhtpPINUQ
	 6k88f7I+3LkqezUc5PsrwJYVpdgzwmUfJqR9SRMzGKlCpr3atm+8YD/QYF0VVKYCKU
	 PwszdN4JBELA8jb4l7kSu3wSEHT97+dnX55/JRBV+JzHNYL0AvnGQJlIhEoB5QrOFZ
	 SAxjtWkOPInzcqyQm2ECq2KDIzAV+1lu9fMNCtsmkVp4r8j853outFcyPym+7BA+Zq
	 wja3H5qcBx5Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1587F83F85;
	Thu,  5 Feb 2026 04:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C40173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 04:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15CE6401CE
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 04:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jPyU43aIeyI for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 04:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com;
 envelope-from=kastelic.jakob@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5030E40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5030E40051
Received: from mail-dy1-x1329.google.com (mail-dy1-x1329.google.com
 [IPv6:2607:f8b0:4864:20::1329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5030E40051
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 04:50:36 +0000 (UTC)
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-2b71557299dso447501eec.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 20:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770267035; x=1770871835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=25IEN0WkwzAnQEOE5BnLqET3rOINACceOFraOanh+gw=;
 b=QYZd7081IqWLQXYfla2dV0Q9fg+asMTgRLm7xH9xqiy5FCPWZr8twYVQs8lvI2phrB
 CCfkcxPsESIodMVYcggKPgH7z/suBs0eNESQt5ge4/XyUxdwasPgfxD/20+0c0m2mdJw
 0Vr/9nGBWLxeriqjNl3DLgc4U4vZqTlzyXZ1vwG0AhF4qaSmfzuyVDdqc5IbC/tZfRKO
 PTdlpUqqyZbQSnYTLoqpzUVaO0B7+UdJmCm/0ozmBkQxhesCr7SFnX7nkcT/78N9faV3
 mQZDnTNhx4glVp+1fBaYXlVab3BIamuo0OlYZnikkJCbtwmcW/co7dsf1Klx8XjVgfe8
 NyRQ==
X-Gm-Message-State: AOJu0YyBn80wuCIUIbqpl19sNqbqMprqE2/Na5U1KzVCIzULX4DZtwlo
 NapLtKXU4rOvCjxXQyoqDeAfziUdI9jVXoDmfHjnNySqb6KIho/Eq+c1W6qTz05n
X-Gm-Gg: AZuq6aICH4z4imFLtzV48Wcjr/LRzfR1n+7dmJRdq4E0C0HJbSQmOkK5MkWmMTPXOuy
 KWZ2POuLSDHEMUWXMBI7vu1tv6teVpdz0bVf6XpV5azI5rcuGN0exEY0YqAd7vUSfUYgwjCXtVs
 TyfbD9YUEsmHeXVw/tdnkAhUsXowwA+SlQpkQdHkM6OezuxMar2CiIBTlqGG1ML7Zuf7wBjG3v5
 ZNTrUL67+fM3gPEh3OmN6qKTx3OusclCpfIkgqbnDkO1KnOrRLRLfhXAp8WdNMai4sTPhw7xppR
 yvybOrTlT+zLI2l/w0+F75a4aMt+B2KzhqEzVObBeN/aU3KpEgMD4uBqDewj7m2F7n16oo1O3s3
 Nhg6lk/kp4omJc2ZrMwANAdFSc+EH9yoHEvztz+Wf7zdaR/+YVEoNsl6rkIngY2P8Y0y4UXGtLV
 CoTZzMloiHtXh596S1jcQkZVrH8rrUptpjajxIPHLIZXZjxxbFSAvZFCh5girgGt4v
X-Received: by 2002:a05:7300:a507:b0:2b7:2dbb:eb4a with SMTP id
 5a478bee46e88-2b832982655mr2626227eec.31.1770267034053; 
 Wed, 04 Feb 2026 20:50:34 -0800 (PST)
Received: from localhost.localdomain (c-67-164-2-197.hsd1.ca.comcast.net.
 [67.164.2.197]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b832e1299bsm3110759eec.6.2026.02.04.20.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 20:50:33 -0800 (PST)
From: Jakob Kastelic <kastelic.jakob@gmail.com>
To: buildroot@buildroot.org
Cc: Jakob Kastelic <kastelic.jakob@gmail.com>
Date: Wed,  4 Feb 2026 20:50:29 -0800
Message-ID: <20260205045029.1809033-1-kastelic.jakob@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250917024541.1480367-3-kastelic.jakob@gmail.com>
References: <20250917024541.1480367-3-kastelic.jakob@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770267035; x=1770871835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25IEN0WkwzAnQEOE5BnLqET3rOINACceOFraOanh+gw=;
 b=ZOII0r7f11cZHA4zJhROJhN5uDIXUxSxwuZg04o7tpQSCpY+6nOXJHxXOodpI0gMw7
 tjGJPveEw46yrB5+MP9qmQa3j6YB8nST1fxNql2LpVaHfle3zGIuYGFUz45MiQEfp/9j
 bGgBezu2Ztc/6Fct84zZvfRI+lsptW1h6vIJlZAjL/r7nA/ELGy2PgtQwrSMnLPU2Wb/
 inMjPY/+DS4pwM+gBGx8nTV3kxdDpK8dIinkahEs5i5PH5DD4Z5cK27aj1WsnMCSfIwU
 Y3jUE9+lr+of3Jf2Crtliwip5c0n1+wEjglauaQiNlZQw6zzZNyLa2JjXKq2kASMrQFo
 xCbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZOII0r7f
Subject: [Buildroot] [PATCH v3] support/testing/tests/boot/test_atf.py: test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a new runtime test, in which TF-A loads Linux directly
(as BL33) under Qemu. This test is used to test the new TF-A flag,
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33.

Signed-off-by: Jakob Kastelic <kastelic.jakob@gmail.com>

---
Changes v2 -> v3:
  - reformat defconfig as runtime test
  - mount real rootfs from storage instead of using an initrd
  - run OP-TEE runtime tests
---
 DEVELOPERS                             |  3 +
 support/testing/tests/boot/test_atf.py | 95 ++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..aca03b2d67 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1510,6 +1510,9 @@ F:	package/python-scipy/
 F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_scipy.py
 
+N:	Jakob Kastelic <kastelic.jakob at gmail.com>
+F:	support/testing/tests/boot/test_atf.py
+
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
 F:	package/bpftool/
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index b822b9d357..a54c6a7629 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,3 +1,6 @@
+import os
+import subprocess
+
 import infra.basetest
 
 
@@ -30,3 +33,95 @@ class TestATFAllwinner(infra.basetest.BRTest):
 
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
+        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+        BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+        BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
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
+            "-machine", f"virt", "-machine",
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
