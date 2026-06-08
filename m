Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5450ECD8C90
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F7F40877;
	Mon,  8 Jun 2026 02:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JHQ2F7N44ze; Mon,  8 Jun 2026 02:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D702140858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884388;
	bh=M3krSP9+NjlzEIsK0S6y1acbHhwCkJkGRscT8kj/aBE=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KfMOkhdyM2g7GF66TR79K/R5Lm8lEEntrWjdo8J6m28mnO/4JAgbTxTrpj07ACBxw
	 XAQoDRemUE6xpOYweBdi7Y9shNtQqljbA9S7cl92cKD8Fq/cci8PMUOhIqf7Y+DvDD
	 EwQ6XSLXtTdJEbLLI8nND670Y5KxByjH6L3Hodc7EyqSIgZUGpXmYxhdjG1/ljvFmx
	 a4VwEBJq+TY0RMNOAQ0l4rnv313xNrMS9ZhjPFeHjn3UjmQiRcD3Nd8JeBg712xOGn
	 1wEdGIUa75EPZsjhtp6u3IkAz3CQ2f2p5UESLMBVapjgjUxFBZggY1to5OcWZvy+jf
	 T+uvZoyn5RcQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D702140858;
	Mon,  8 Jun 2026 02:06:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3302C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90E6380865
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3i0PvbkV_Vk for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFB4080849
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB4080849
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB4080849
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36d98b68d68so2457133a91.2
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884381; x=1781489181;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YyGOmo92+rbF20kXjwbsnuruNO0Jl8JmCm2645t193k=;
 b=IVFJvCvKh8kN0CX0D+IBth/Obqqi2QNVWRsorpHCAj/UguysIUbyRbh7Gpt9IIt9uB
 NYycgGSmo8EqvIbAgyzYoJznTXJ9Zh83txh8BNEVofyVwNCG/oT+muyKweILdFrjyV0h
 fz1I8nti+Cz5qxawEfKMIqrAcoU827Jk1ff9MlzmGfRy1bdbojsm4pnJiYxHDDhwx4mC
 OJsoelFrIeWqTEUNJlz3aM+c0Ev5lnGmG8UJbIx0I2TXFYzjq1+F8uuCBpRiCb79RY7Y
 3Ogy/Q6yLhpd1ez0MWSys2fYNPaSP5y/FSmYv4xWPlsR1BMQOw3Z5qhcfdzeWcsNzHMG
 wArQ==
X-Gm-Message-State: AOJu0YyIL5arhnxkDoGc2S2XuPJBN0IOnZCMkWMNJ4RILp0I/JCfP3/q
 Bg05kFQGMBf1vGOA/mXJA4Vdd2bxoUmhMLKFoLJUk4xMJAy2+nQPfhjO
X-Gm-Gg: Acq92OFd0rl/cPFYpWud6bRWpiBNm8KQ1uAV9qrzL3HZgLr9nLMZnJnHC+9ajDMCKiv
 R0/XqCzn57GYLkjlroTy7LqKePrKIweN3MpunlP7YkDgCjs+7dWfu/pdhJBdr18An9eQn5SwMwC
 W7rEG9msUAouX99SWH8Td6wCTQI5eyCfhqX+8Xu5n/Z69yGo7g08L1kpc1JMAvY2u9fzm4hTiyH
 al+NEObQHxjXtnv0k4FWMFpThzdCeZ5RL0EOltTEmW9kRBZDIcjShzr9k8YA5VtexPZjDVxnzFc
 2l61w0Sa+rvXJ5QEEz/ysMpSGzAqNtA/ffCZhWghbHCJ5QkmA4bSmW8sMCVhHOYtDCxs3hSwJ4p
 R+qHs27KWQUYFhhwkoaTShu/8vn0KSn3fbQVwN4NvRISblNe2bNLyWVqpQgaWd4pJ/E76Nn/yvi
 zK0aOL1e7x+xLSqdKA7MA/0AWWso3n5qw5qcHqAzI=
X-Received: by 2002:a17:90b:2742:b0:36a:c4b:76cf with SMTP id
 98e67ed59e1d1-370f0b55e45mr14670630a91.23.1780884380875; 
 Sun, 07 Jun 2026 19:06:20 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:20 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:10 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-7-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=9275;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=ebEZhjZBYPHTJtJ1DPYZYtmkMQE0IxBDTMgbBsQzce8=;
 b=RFMOsmAoxvPhHORjy55APqL+1qoRj1o8+Oc4mABXT5R++gROJ49fiVVvBGWoHhnrgmPwviBMq
 nP29bFgq9NfCMWuAod+GKKa2Ud7y7AoIdfwLlYuh1DIXA/XgzB9JzKV
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884381; x=1781489181; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YyGOmo92+rbF20kXjwbsnuruNO0Jl8JmCm2645t193k=;
 b=NFhz1w1487KlGfIJiwCg5Ml43MC3etZmY1ETInUel0NkIXXbCAfjshBCUJg6vshdyz
 MGO2xf9lqlQux0X3u1wLrg2UJC342AVzlxHe9dWoLKmrgJv700+yiTHqcqZWF73jHS8v
 ySdMZypjlyTMmqvG32tBS0iwy+rb6a3Fii6mWL6YRLWzcDCTxEmOTHQrRKpy4CIPi5lQ
 xaO81p9Lq40Dmv+RQAvIK/nfP5w5i9q6Rdrcn2gfcCwrgPvRfqge7GBkvpzGe7EVfeV4
 dsdw8HWkJP6q6O+zgQ0JY/Ig5CLu4Ch9pTh17b5VEnx7KsY63rjaEMA5rYnjUro2HYOm
 mTfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NFhz1w14
Subject: [Buildroot] [PATCH 7/7] support/testing: add virglrenderer test
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add basic smoke test for glmark2 running in a nested qemu guest with
virtio-gpu-gl-pci.

The outer machine uses the Mesa softpipe driver for GLES support with
minimal dependencies. Just test virgl for now, as lavapipe
(software Vulkan driver) requires LLVM, and this validates
virglrenderer.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                         |   1 +
 .../testing/tests/package/test_virglrenderer.py    | 159 +++++++++++++++++++++
 .../test_virglrenderer/linux-inner.fragment        |   4 +
 .../test_virglrenderer/linux-outer.fragment        |   6 +
 .../rootfs-overlay/etc/profile.d/stty-raw.sh       |   3 +
 5 files changed, 173 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e3f0b2a562..91dd259844 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1773,6 +1773,7 @@ F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 F:	package/virglrenderer/
+F:	support/testing/tests/package/test_virglrenderer.py
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/support/testing/tests/package/test_virglrenderer.py b/support/testing/tests/package/test_virglrenderer.py
new file mode 100644
index 0000000000..61a8b3b91c
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer.py
@@ -0,0 +1,159 @@
+import os
+
+import infra
+import infra.basetest
+from infra.builder import Builder
+
+
+class TestVirglrendererNestedQemu(infra.basetest.BRTest):
+    outer_kern_frag = \
+        infra.filepath("tests/package/test_virglrenderer/linux-outer.fragment")
+    inner_kern_frag = \
+        infra.filepath("tests/package/test_virglrenderer/linux-inner.fragment")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_virglrenderer/rootfs-overlay")
+
+    # Softpipe has no hardware dependencies and does not pull LLVM into the
+    # outer build, unlike llvmpipe/lavapipe.
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{outer_kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_LIBGLVND=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_QEMU=y
+        BR2_PACKAGE_QEMU_SYSTEM=y
+        # BR2_PACKAGE_QEMU_SYSTEM_KVM is not set
+        BR2_PACKAGE_QEMU_SYSTEM_TCG=y
+        # BR2_PACKAGE_QEMU_BLOBS is not set
+        BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
+        BR2_PACKAGE_QEMU_TARGET_AARCH64=y
+        BR2_PACKAGE_QEMU_VIRGLRENDERER=y
+        BR2_TARGET_ROOTFS_INITRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    inner_config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{inner_kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_KMSCUBE=y
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_LIBGLVND=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def setUp(self):
+        self.inner_builder = None
+        super().setUp()
+
+        self.inner_builddir = os.path.join(self.outputdir,
+                                           f"{self.testname}-inner")
+        config = self.inner_config
+        config += f'\nBR2_DL_DIR="{self.downloaddir}"\n'
+        config += f"\nBR2_JLEVEL={self.jlevel}\n"
+        self.inner_builder = Builder(config, self.inner_builddir,
+                                     self.logtofile, self.jlevel)
+
+        if not self.keepbuilds:
+            self.inner_builder.delete()
+
+        if not self.inner_builder.is_finished():
+            self.show_msg("Building inner")
+            self.inner_builder.configure(
+                make_extra_opts=[f"BR2_EXTERNAL={':'.join(self.br2_external)}"])
+            self.inner_builder.build()
+            self.show_msg("Building inner done")
+
+    def tearDown(self):
+        try:
+            super().tearDown()
+        finally:
+            if self.inner_builder and not self.keepbuilds:
+                self.inner_builder.delete()
+
+    def boot_outer(self):
+        kern = os.path.join(self.builddir, "images", "Image")
+        inner_img_dir = os.path.join(self.inner_builddir, "images")
+        virtfs_tag = "br-inner"
+        virtfs_opts = [
+            f"local,path={inner_img_dir}",
+            f"mount_tag={virtfs_tag}",
+            "security_model=mapped-xattr",
+            "readonly=on"
+        ]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "1536M",
+                                    "-smp", "4",
+                                    "-vga", "none",
+                                    "-virtfs", ",".join(virtfs_opts)])
+        self.emulator.login()
+        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
+
+    def boot_inner(self):
+        qemu_cmd = "env LIBGL_ALWAYS_SOFTWARE=1 GALLIUM_DRIVER=softpipe"
+        qemu_cmd += " qemu-system-aarch64"
+        qemu_cmd += " -M virt,accel=tcg"
+        qemu_cmd += " -cpu cortex-a57"
+        qemu_cmd += " -m 512M"
+        qemu_cmd += " -nodefaults"
+        qemu_cmd += " -display egl-headless,gl=on"
+        qemu_cmd += " -device virtio-gpu-gl-pci"
+        qemu_cmd += " -serial stdio"
+        qemu_cmd += " -kernel /mnt/Image"
+        qemu_cmd += " -initrd /mnt/rootfs.cpio"
+        qemu_cmd += " -append 'console=ttyAMA0 br-inner-virgl'"
+
+        # qemu runs in the foreground on the current serial console. Once it
+        # starts, the next login prompt belongs to the inner guest.
+        self.emulator.qemu.sendline(qemu_cmd)
+        self.emulator.login(timeout=180)
+
+    def test_run(self):
+        self.boot_outer()
+        self.assertRunOk("while [ ! -e /dev/dri/renderD128 ]; do sleep 1; done",
+                         timeout=30)
+
+        self.boot_inner()
+
+        out, ret = self.emulator.run("cat /proc/cmdline")
+        self.assertEqual(ret, 0)
+        self.assertIn("br-inner-virgl", out[0])
+
+        cmd = "env MESA_LOADER_DRIVER_OVERRIDE=virtio_gpu"
+        cmd += " kmscube --vmode=640x480 --count=10"
+        out, ret = self.emulator.run(cmd, timeout=60)
+        self.assertEqual(ret, 0)
+
+        renderer = "\n".join([line for line in out
+                              if line.strip().startswith("renderer:")])
+        self.assertRegex(renderer, r'(?i)renderer:\s*"virgl \(softpipe\)"')
diff --git a/support/testing/tests/package/test_virglrenderer/linux-inner.fragment b/support/testing/tests/package/test_virglrenderer/linux-inner.fragment
new file mode 100644
index 0000000000..f2a6b539f7
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/linux-inner.fragment
@@ -0,0 +1,4 @@
+CONFIG_BLK_DEV_INITRD=y
+# The inner guest runs kmscube against the virgl renderer exposed by QEMU.
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
diff --git a/support/testing/tests/package/test_virglrenderer/linux-outer.fragment b/support/testing/tests/package/test_virglrenderer/linux-outer.fragment
new file mode 100644
index 0000000000..1023aedc6f
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/linux-outer.fragment
@@ -0,0 +1,6 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_DRM_VGEM=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
new file mode 100644
index 0000000000..4427e5a143
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
@@ -0,0 +1,3 @@
+# Avoid double-cooking the inner serial console, otherwise the test
+# infrastructure cannot reliably retrieve return codes.
+grep -Fq br-inner-virgl /proc/cmdline && stty raw

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
