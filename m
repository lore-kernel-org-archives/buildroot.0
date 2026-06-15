Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22781CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79D140E5A;
	Mon, 15 Jun 2026 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoWm_cgWi71E; Mon, 15 Jun 2026 16:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE8A40E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781541141;
	bh=0UWEtMTZpE2AQUf+2/ema35W+d7xKgZ4OHOOCYeA2n4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KPvpLkPKqqsr9TPAjZ08ZXfPhLuwdg37IKUexUzxy5apYk/s8RhsMWjjwcG8+YH0D
	 nAEUuKDDDnErOOJHfc/0/cre6aqqMXxvdRydx4khAlsu2/QNF+xkFLScz6RTfKF5j3
	 0PhlI6Jpc2WXoKDE9xzxvWVA31BE9+qtyorV7KDJQoVfQG3mj4Tvr1CALXbadbz96q
	 DevuUVZ/u3RCH+IEKInQMbyp/bDS60yYb7+JFutxRLKTBlW/QWhWRaufIpxbqGcEqd
	 llWdPILKTWRzQ3mw3aCMgbtyjNjbnuBiJeop7YKxf2WtFwn1FYIxz3ATKyMShCEREK
	 vct8Kps5seHSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE8A40E5B;
	Mon, 15 Jun 2026 16:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 534B62B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4525240361
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXkXvpkx-2tu for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 16:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F69A40090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F69A40090
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F69A40090
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:32:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so24777225e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 09:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781541137; x=1782145937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLW/iEhU7oIQGokxX4Qtk1tsd6EGF0MITRPNZo0NeUU=;
 b=WSvWwkblY1LJ1+GJWO+BgEGkrbtx+IPj/zU+6LgVoFZfccaDh6F84vZ1Jx2ciF7U6N
 EH/m6cJjzrUQ7RlcqoKCnANEg3i4e/A2nXjFs0gl+KHzVLBoM0+AJ9326zWPIyYIUkEn
 Lhkdzj7XcAsP8pSlafQYmUkJsDr7OQihu9MydilL5P/hhKMUSJoKZxHl9+NMhyLQCidY
 66EQJxWZ2dzAJZGtU2GMMRWlChQ9WQjDeJVTnZl8QtvAXyhIjh+jT2qYAB8bwnA32WYM
 TV1UZBt0QVicRO1ve3aXb3iUcunZ7F5oL5ob/FTCrmvq2gamByCRuckiVjNUnaGd+AmO
 cwxw==
X-Gm-Message-State: AOJu0YzUJ9ABjYwJPvltZis3UXGcgh8iEoowwAuVOaOX/u/g864PzgA7
 RYGWADlPJeZGJ6cpY9dn0dsuEySeTcNAZGS71hLrXIDVz8AOOO6aGdKyv/yUaiR1Uuj3NaRJl61
 VqIZE
X-Gm-Gg: Acq92OGxyHW2+5hNu4l33Tx9RiaHXe/3KE8OIJMoEAlAMiofF6cKVdq15qTlyAuHjpc
 TZTtpnvLh5Dr0S7I4pZWbekU5Fk+zBjDKKNo8qtwcP+hQ+eP3OtehY5iX5H8Xdn4RvQ+lrufZxs
 HKdVGir+/t67mH6Rtkem2CzaRsREELs2D4+LwIci1AGF85mwSYieQ80CjCx5z19Pug4OKcWBotY
 ajHz+RmoUNo4P9tb6VKnRf6oxsgyzHczRr6UWyyZEdeWY9lPMIdQOT47Zaa3Cv+w2Ix/ZiIxEVG
 2CyJDKnrpncgz+/fK8Z7XAjQgiqDS8NMZbtGLYqC8aZRNoD4lzPk8YR+7wYF2uXQPr0bPW1fphV
 38bTyValLhJ7UCr8/0Y7xlKFDYOyg3d+DXiTlpG5J7kA+rQ4z/XiAJ8vyD2yrO340OnrK5hmqnl
 mQKzkf0sIoObtmTNzWYvWa1k/llfc3NdQ7SG33tKfgDK8ezFKP7a2eDVPwkFUXI0mSjaKB3q+xl
 xSLPxQImgMSSmwyaeN5rDTQLg==
X-Received: by 2002:a05:600c:ac8:b0:490:44eb:c1ec with SMTP id
 5b1f17b1804b1-4922014383fmr109255455e9.27.1781541136478; 
 Mon, 15 Jun 2026 09:32:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm36466115f8f.8.2026.06.15.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 09:32:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 15 Jun 2026 18:32:12 +0200
Message-ID: <20260615163212.2475581-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1781541137; x=1782145937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WLW/iEhU7oIQGokxX4Qtk1tsd6EGF0MITRPNZo0NeUU=;
 b=ZROIdLZZUBLUrBQawbbCo/qb9CEyd6yMQXDmdOmS5qLGnVSB+NQaMOe2BsR4vq5WwX
 0va9HrAZwJ21LB93H4felP4u6jCf3xBdHfCz2z/gsn3coyuG66wuKbHe5p+SOvXx+v9h
 dWnxXfk/7eNj+j/+myzJDiO1DEagI5mutv0gU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ZROIdLZZ
Subject: [Buildroot] [PATCH] Revert
 "support/testing/tests/package/test_kexec.py: fix kexec test for qemu 5.2"
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our docker image was finally updated to Debian 12 and now provide Qemu
7.2.15. We can safely revert this workaround for older Qemu version.

[1] e5bbe020ca60789bdb0a16e27bc1a4208d8f6a5a

This reverts commit 37e23e0dd7187bb27abb329f4fbb29c59c31c672.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_kexec.py   |  15 +-
 .../qemu-aarch64-virt-5.2-machine.dts         | 373 ------------------
 2 files changed, 4 insertions(+), 384 deletions(-)
 delete mode 100644 support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts

diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
index 51d43b0572..77e383373e 100644
--- a/support/testing/tests/package/test_kexec.py
+++ b/support/testing/tests/package/test_kexec.py
@@ -24,8 +24,6 @@ class TestKexec(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="{}"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_KEXEC=y
@@ -33,25 +31,20 @@ class TestKexec(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2_4=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(
-            infra.filepath("tests/package/test_kexec/linux-kexec.fragment"),
-            infra.filepath("tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts")
+            infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
         )
 
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "rootfs.ext4")
         kern = os.path.join(self.builddir, "images", "Image")
-        dtb = os.path.join(self.builddir, "images", "qemu-aarch64-virt-5.2-machine.dtb")
         # Notes:
         # Sufficient memory is needed to load the kernel: having at
         # least 512MB works. kexec could silently fail if not enough
         # memory is present. KASLR needs to be disabled for the test:
-        # we pass "nokaslr" to kernel bootargs, and also pass a custom
-        # devicetree to qemu virt machine. This devicetree is based on
-        # qemu aarch64 5.2 dts with kaslr-seed set 0.
-        # With newer qemu >= 7.0 we can disable KASLR from the qemu
-        # command line using "dtb-kaslr-seed=off".
+        # we pass "nokaslr" to kernel bootargs, and also pass
+        # "dtb-kaslr-seed=off" to qemu virt machine.
         bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
-        qemu_opts = ["-M", "virt", "-dtb", dtb, "-cpu", "cortex-a57", "-m", "512M",
+        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", "cortex-a57", "-m", "512M",
                      "-drive", f"file={hda},if=virtio,format=raw"]
         self.emulator.boot(arch="aarch64",
                            kernel=kern,
diff --git a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
deleted file mode 100644
index ad96a51c40..0000000000
--- a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
+++ /dev/null
@@ -1,373 +0,0 @@
-/dts-v1/;
-
-/ {
-	interrupt-parent = <0x8001>;
-	#size-cells = <0x02>;
-	#address-cells = <0x02>;
-	compatible = "linux,dummy-virt";
-
-	psci {
-		migrate = <0x84000005>;
-		cpu_on = <0x84000003>;
-		cpu_off = <0x84000002>;
-		cpu_suspend = <0x84000001>;
-		method = "hvc";
-		compatible = "arm,psci-0.2\0arm,psci";
-	};
-
-	memory@40000000 {
-		reg = <0x00 0x40000000 0x00 0x8000000>;
-		device_type = "memory";
-	};
-
-	platform@c000000 {
-		interrupt-parent = <0x8001>;
-		ranges = <0x00 0x00 0xc000000 0x2000000>;
-		#address-cells = <0x01>;
-		#size-cells = <0x01>;
-		compatible = "qemu,platform\0simple-bus";
-	};
-
-	fw-cfg@9020000 {
-		dma-coherent;
-		reg = <0x00 0x9020000 0x00 0x18>;
-		compatible = "qemu,fw-cfg-mmio";
-	};
-
-	virtio_mmio@a000000 {
-		dma-coherent;
-		interrupts = <0x00 0x10 0x01>;
-		reg = <0x00 0xa000000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000200 {
-		dma-coherent;
-		interrupts = <0x00 0x11 0x01>;
-		reg = <0x00 0xa000200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000400 {
-		dma-coherent;
-		interrupts = <0x00 0x12 0x01>;
-		reg = <0x00 0xa000400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000600 {
-		dma-coherent;
-		interrupts = <0x00 0x13 0x01>;
-		reg = <0x00 0xa000600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000800 {
-		dma-coherent;
-		interrupts = <0x00 0x14 0x01>;
-		reg = <0x00 0xa000800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000a00 {
-		dma-coherent;
-		interrupts = <0x00 0x15 0x01>;
-		reg = <0x00 0xa000a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000c00 {
-		dma-coherent;
-		interrupts = <0x00 0x16 0x01>;
-		reg = <0x00 0xa000c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000e00 {
-		dma-coherent;
-		interrupts = <0x00 0x17 0x01>;
-		reg = <0x00 0xa000e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001000 {
-		dma-coherent;
-		interrupts = <0x00 0x18 0x01>;
-		reg = <0x00 0xa001000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001200 {
-		dma-coherent;
-		interrupts = <0x00 0x19 0x01>;
-		reg = <0x00 0xa001200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001400 {
-		dma-coherent;
-		interrupts = <0x00 0x1a 0x01>;
-		reg = <0x00 0xa001400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001600 {
-		dma-coherent;
-		interrupts = <0x00 0x1b 0x01>;
-		reg = <0x00 0xa001600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001800 {
-		dma-coherent;
-		interrupts = <0x00 0x1c 0x01>;
-		reg = <0x00 0xa001800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001a00 {
-		dma-coherent;
-		interrupts = <0x00 0x1d 0x01>;
-		reg = <0x00 0xa001a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001c00 {
-		dma-coherent;
-		interrupts = <0x00 0x1e 0x01>;
-		reg = <0x00 0xa001c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001e00 {
-		dma-coherent;
-		interrupts = <0x00 0x1f 0x01>;
-		reg = <0x00 0xa001e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002000 {
-		dma-coherent;
-		interrupts = <0x00 0x20 0x01>;
-		reg = <0x00 0xa002000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002200 {
-		dma-coherent;
-		interrupts = <0x00 0x21 0x01>;
-		reg = <0x00 0xa002200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002400 {
-		dma-coherent;
-		interrupts = <0x00 0x22 0x01>;
-		reg = <0x00 0xa002400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002600 {
-		dma-coherent;
-		interrupts = <0x00 0x23 0x01>;
-		reg = <0x00 0xa002600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002800 {
-		dma-coherent;
-		interrupts = <0x00 0x24 0x01>;
-		reg = <0x00 0xa002800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002a00 {
-		dma-coherent;
-		interrupts = <0x00 0x25 0x01>;
-		reg = <0x00 0xa002a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002c00 {
-		dma-coherent;
-		interrupts = <0x00 0x26 0x01>;
-		reg = <0x00 0xa002c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002e00 {
-		dma-coherent;
-		interrupts = <0x00 0x27 0x01>;
-		reg = <0x00 0xa002e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003000 {
-		dma-coherent;
-		interrupts = <0x00 0x28 0x01>;
-		reg = <0x00 0xa003000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003200 {
-		dma-coherent;
-		interrupts = <0x00 0x29 0x01>;
-		reg = <0x00 0xa003200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003400 {
-		dma-coherent;
-		interrupts = <0x00 0x2a 0x01>;
-		reg = <0x00 0xa003400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003600 {
-		dma-coherent;
-		interrupts = <0x00 0x2b 0x01>;
-		reg = <0x00 0xa003600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003800 {
-		dma-coherent;
-		interrupts = <0x00 0x2c 0x01>;
-		reg = <0x00 0xa003800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003a00 {
-		dma-coherent;
-		interrupts = <0x00 0x2d 0x01>;
-		reg = <0x00 0xa003a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003c00 {
-		dma-coherent;
-		interrupts = <0x00 0x2e 0x01>;
-		reg = <0x00 0xa003c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003e00 {
-		dma-coherent;
-		interrupts = <0x00 0x2f 0x01>;
-		reg = <0x00 0xa003e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	gpio-keys {
-		#address-cells = <0x01>;
-		#size-cells = <0x00>;
-		compatible = "gpio-keys";
-
-		poweroff {
-			gpios = <0x8003 0x03 0x00>;
-			linux,code = <0x74>;
-			label = "GPIO Key Poweroff";
-		};
-	};
-
-	pl061@9030000 {
-		phandle = <0x8003>;
-		clock-names = "apb_pclk";
-		clocks = <0x8000>;
-		interrupts = <0x00 0x07 0x04>;
-		gpio-controller;
-		#gpio-cells = <0x02>;
-		compatible = "arm,pl061\0arm,primecell";
-		reg = <0x00 0x9030000 0x00 0x1000>;
-	};
-
-	pcie@10000000 {
-		interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
-		interrupt-map = <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x03 0x04 0x00 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x04 0x04 0x800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x05 0x04 0x800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x05 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x06 0x04 0x1000 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x03 0x04 0x1800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x05 0x04>;
-		#interrupt-cells = <0x01>;
-		ranges = <0x1000000 0x00 0x00 0x00 0x3eff0000 0x00 0x10000 0x2000000 0x00 0x10000000 0x00 0x10000000 0x00 0x2eff0000 0x3000000 0x80 0x00 0x80 0x00 0x80 0x00>;
-		reg = <0x40 0x10000000 0x00 0x10000000>;
-		msi-parent = <0x8002>;
-		dma-coherent;
-		bus-range = <0x00 0xff>;
-		linux,pci-domain = <0x00>;
-		#size-cells = <0x02>;
-		#address-cells = <0x03>;
-		device_type = "pci";
-		compatible = "pci-host-ecam-generic";
-	};
-
-	pl031@9010000 {
-		clock-names = "apb_pclk";
-		clocks = <0x8000>;
-		interrupts = <0x00 0x02 0x04>;
-		reg = <0x00 0x9010000 0x00 0x1000>;
-		compatible = "arm,pl031\0arm,primecell";
-	};
-
-	pl011@9000000 {
-		clock-names = "uartclk\0apb_pclk";
-		clocks = <0x8000 0x8000>;
-		interrupts = <0x00 0x01 0x04>;
-		reg = <0x00 0x9000000 0x00 0x1000>;
-		compatible = "arm,pl011\0arm,primecell";
-	};
-
-	pmu {
-	};
-
-	intc@8000000 {
-		phandle = <0x8001>;
-		reg = <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00 0x10000>;
-		compatible = "arm,cortex-a15-gic";
-		ranges;
-		#size-cells = <0x02>;
-		#address-cells = <0x02>;
-		interrupt-controller;
-		#interrupt-cells = <0x03>;
-
-		v2m@8020000 {
-			phandle = <0x8002>;
-			reg = <0x00 0x8020000 0x00 0x1000>;
-			msi-controller;
-			compatible = "arm,gic-v2m-frame";
-		};
-	};
-
-	flash@0 {
-		bank-width = <0x04>;
-		reg = <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00 0x4000000>;
-		compatible = "cfi-flash";
-	};
-
-	cpus {
-		#size-cells = <0x00>;
-		#address-cells = <0x01>;
-
-		cpu@0 {
-			reg = <0x00>;
-			compatible = "arm,cortex-a15";
-			device_type = "cpu";
-		};
-	};
-
-	timer {
-		interrupts = <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b 0x104 0x01 0x0a 0x104>;
-		always-on;
-		compatible = "arm,armv7-timer";
-	};
-
-	apb-pclk {
-		phandle = <0x8000>;
-		clock-output-names = "clk24mhz";
-		clock-frequency = <0x16e3600>;
-		#clock-cells = <0x00>;
-		compatible = "fixed-clock";
-	};
-
-	chosen {
-		stdout-path = "/pl011@9000000";
-		/* Buildroot specific: KASLR needs to be disabled for the Kexec test. */
-		kaslr-seed = <0 0>;
-	};
-};
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
