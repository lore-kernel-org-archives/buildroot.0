Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F93CD4F3D
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5025184A6B;
	Sat, 16 May 2026 02:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDpTJD_HjVDS; Sat, 16 May 2026 02:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D8BA84A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897017;
	bh=aoxTAyQJoZh4NbGCcC4HngCS4/PY6ahJpFK3MRZRZtQ=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FcEUa5BLYBxqJOOwx0chqBhKFJd2cH4UzRcAuS6sReP8aU9dzUfunBiakBe5Pc8cF
	 OmvygM8oT7arGvXIQYdV81c9YfXLaSBaatWTEHpKAy/47MfM3WyHTMWtBC1VPsCOVs
	 DwkIsL3bSTqLbPKyUqRyNP/5Yea8A2yyl5z+bwYxq8VNXIhy8Um4S0PCfStiNJxgz4
	 naMKKtxhvsVxh49dVGNIU6Q/R+26F7dtB6LNjhM/bK7j6GoGjB3VbUm7be7hn44a6M
	 KQBqkhLc/9DYTn0JgqgSSfJcLGPgsgsIxo0ZV4zLsEyGcnUN7MIRcP+b1egyZShAUA
	 DNr1m2Br/41CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D8BA84A73;
	Sat, 16 May 2026 02:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B416045B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A607A84A73
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2ZwZsVYUzfl for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DF5D84A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF5D84A68
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DF5D84A68
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:34 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2bcd3ac3307so3031255ad.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897014; x=1779501814;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RWcLS3ess6IN8bwHy3bpI/dGbESuDeqa5EaA0hYHw/E=;
 b=dzeMAf50pLT9VIB97VtMnOAj+foX55FwsoK4+VHAtKSLgnoGaXOu81buH725P9id0l
 PMKB/rIAcJheVfxrPoitkSpv/wPve/7PHQ8iloTTMm68E6A2PAMsd7vIowVevKtFoEFp
 Kd90VBCQ7dAT3T6J4hGQ2wFxAA6cRoJvRyJ9K/WJG79q1fcwYkNfKU9VGpIly5MBCEKE
 ryIF7xCgtM7sQDUYQEYCw6RIyDl85EnwT8AFtrp5AJCOEQCE6vgjkL4cLPrtGQFcHEZI
 WEzJegMXzg0GtOFdsd1yYwxYcrE7aODRWGfB0rhn7/Uw0Qlgy7AzzDAr3fD5IyJ5ik7H
 tEyw==
X-Gm-Message-State: AOJu0Yx5RxlR0i+xO8k4942txDNDLXxy4+O+Gi3guvhpFsc1jTHk64bV
 MK1J7SUoY0GiEWyQU+mchpEdqssDlh/mLCXwZaoNzYGf43mAOPrTZ8qB
X-Gm-Gg: Acq92OG2vfMPyTN9r5v8F0vrTBpfPb9zO107+ISV/M+sZurEj1xVoaxyUGTjUm9FjKg
 VqVxHdiaQteLKrl57PSQ8VAnRM5e2sNanZjj6wtsVD1lRKKaYAT+cLioc9WARWiFdAHYu1btpx5
 6cOR9ar/+1kg/yrkjVtTCrMuF6RLLVN+GTxKRmIX6N6JqYAqpWvOHtk7oXFB5OH7Vwostxwft3I
 Awm2DgWO859uWQ36g4nj/IfABkKDTRWkHVqUrEkhavpfuseqqOfGKElUkCWnRQzFtszGqRoxtDt
 Eb0ZPa8O7ETZbl/0DfMd9CXwTivqld0Hu1BCp2ex2OjbM3Va3pX8IGe5f5JOZJtoza21UYQKnui
 jS44U0ivt89Lpex/DOMPXrGr/gnctNDfO4zjVfQKvkUMeEuCMNGfY+fBpSjIPnl/fd156OrnFTD
 pxfMLkkRQjmRr1hl3VN0Mt0BiVmxRrpUXRGzs=
X-Received: by 2002:a17:902:768c:b0:2b4:5cea:f619 with SMTP id
 d9443c01a7336-2bd7e97d3ffmr51120205ad.22.1778897013734; 
 Fri, 15 May 2026 19:03:33 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:32 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:17 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-8-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=7926;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=NwTrcKQTRmJOMPzZw47EgnWjnqLOf0jdxBl47WVXREI=;
 b=ZM4HF8U8ZrKL4JMfbhg6wbxAfy8EwogUFlBhEWzdGUP+Oo0pYlCeyaSqD4ZdesSz5qYY/Au/H
 Q8VuWEBvO3gCIrAVpkV5Qm7v6iAI+eim0IMNQpv7DEzWgvUbtai8i+T
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897014; x=1779501814; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RWcLS3ess6IN8bwHy3bpI/dGbESuDeqa5EaA0hYHw/E=;
 b=ZC6s8fvlURMFmoFIwRQTKNY4YiZCWA4jq8iDS7RqwgCKaJYa9QYHL+2jf9vrBUpG5x
 vpzYLhlDkT0hbqfASGLnw2PHUcv0JCxetTT8yG0eSrvhMwCajrTETYbKp0TzXOUaZpDe
 1vN1bniU8GSOl/doGR/cJDfYELLuFOlwDoRhS5uKUAC5eeQwz078mUWlPM3hPZr/hF6r
 MCOld6WwCyI7SbmcwG3qWUdE/c9l12uZNYxiqQbpug/N21fWkncn0Z6kIW8bM3v3tP87
 rauVACnoLzrfV1rGg+xPhei7XWp63VeWHDgk+TmmoT+STpBgHiPAiByxB/p+EegLvYB/
 bZmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZC6s8fvl
Subject: [Buildroot] [PATCH v7 8/8] support/testing: add virglrenderer test
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

Add basic smoke test for glmark2 running in a nested qemu guest with
virtio-gpu-gl-pci.

The outer machine uses the Mesa softpipe driver for GLES support with
minimal dependencies. Just test virgl for now, as lavapipe
(software Vulkan driver) requires LLVM, and this validates
virglrenderer.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                         |   1 +
 .../testing/tests/package/test_virglrenderer.py    | 117 +++++++++++++++++++++
 .../test_virglrenderer/linux-virgl.fragment        |   6 ++
 .../test_virglrenderer/remove-qemu-blobs.sh        |  12 +++
 .../rootfs-overlay/etc/profile.d/stty-raw.sh       |   3 +
 5 files changed, 139 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 774eb0b746..0c0779e8b3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1766,6 +1766,7 @@ F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 F:	package/virglrenderer/
+F:	support/testing/tests/package/test_virglrenderer.py
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/support/testing/tests/package/test_virglrenderer.py b/support/testing/tests/package/test_virglrenderer.py
new file mode 100644
index 0000000000..521a4b67cd
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer.py
@@ -0,0 +1,117 @@
+import os
+
+import infra
+import infra.basetest
+
+
+class TestVirglrendererNestedQemu(infra.basetest.BRTest):
+    # We reuse the same initramfs-enabled kernel for the outer target and
+    # nested guest. This fragment adds initramfs and 9p support so the outer
+    # target can mount the runner's images directory and launch the same kernel
+    # under target-side QEMU. We also enable DRM_VGEM to create the necessary
+    # DRI device node, a requirement of qemu when using virgl.
+    kern_frag = \
+        infra.filepath("tests/package/test_virglrenderer/linux-virgl.fragment")
+    post_build = \
+        infra.filepath("tests/package/test_virglrenderer/remove-qemu-blobs.sh")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_virglrenderer/rootfs-overlay")
+
+    # Softpipe has no hardware dependencies and does not pull LLVM into the
+    # build, unlike llvmpipe/lavapipe.
+    config = \
+        f"""
+        BR2_x86_64=y
+        BR2_x86_nehalem=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{post_build}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        # BR2_PACKAGE_EUDEV_ENABLE_HWDB is not set
+        BR2_PACKAGE_GLMARK2=y
+        BR2_PACKAGE_LIBGLVND=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_QEMU=y
+        BR2_PACKAGE_QEMU_SYSTEM=y
+        # BR2_PACKAGE_QEMU_SYSTEM_KVM is not set
+        BR2_PACKAGE_QEMU_SYSTEM_TCG=y
+        BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
+        BR2_PACKAGE_QEMU_TARGET_X86_64=y
+        BR2_PACKAGE_QEMU_VIRGLRENDERER=y
+        BR2_TARGET_ROOTFS_INITRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def boot_outer(self):
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        img_dir = os.path.join(self.builddir, "images")
+        virtfs_tag = "br-imgs"
+        virtfs_opts = [
+            f"local,path={img_dir}",
+            f"mount_tag={virtfs_tag}",
+            "security_model=mapped-xattr",
+            "readonly=on"
+        ]
+        self.emulator.boot(arch="x86_64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyS0"],
+                           options=["-cpu", "Nehalem",
+                                    "-m", "1536M",
+                                    "-smp", "4",
+                                    "-vga", "none",
+                                    "-virtfs", ",".join(virtfs_opts)])
+        self.emulator.login()
+        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
+
+    def boot_nested(self):
+        qemu_cmd = "env LIBGL_ALWAYS_SOFTWARE=1 GALLIUM_DRIVER=softpipe"
+        qemu_cmd += " qemu-system-x86_64"
+        qemu_cmd += " -M q35,accel=tcg"
+        qemu_cmd += " -cpu Nehalem"
+        qemu_cmd += " -m 512M"
+        qemu_cmd += " -smp 4"
+        qemu_cmd += " -nodefaults"
+        qemu_cmd += " -display egl-headless,gl=on"
+        qemu_cmd += " -device virtio-gpu-gl-pci"
+        qemu_cmd += " -serial stdio"
+        qemu_cmd += " -kernel /mnt/bzImage"
+        qemu_cmd += " -append 'console=ttyS0 br-nested-virgl'"
+
+        # qemu runs in the foreground on the current serial console. Once it
+        # starts, the next login prompt belongs to the nested guest.
+        self.emulator.qemu.sendline(qemu_cmd)
+        self.emulator.login(timeout=180)
+
+    def test_run(self):
+        self.boot_outer()
+        self.assertRunOk("while [ ! -e /dev/dri/renderD128 ]; do sleep 1; done",
+                         timeout=30)
+
+        self.boot_nested()
+
+        out, ret = self.emulator.run("cat /proc/cmdline")
+        self.assertEqual(ret, 0)
+        self.assertIn("br-nested-virgl", out[0])
+
+        cmd = "env MESA_LOADER_DRIVER_OVERRIDE=virtio_gpu"
+        cmd += " glmark2-es2-drm --validate --off-screen"
+        cmd += " --benchmark build:use-vbo=false"
+        out, ret = self.emulator.run(cmd, timeout=60)
+        self.assertEqual(ret, 0)
+
+        renderer = "\n".join([line for line in out if "GL_RENDERER:" in line])
+        self.assertRegex(renderer, r"(?i)virgl")
+        self.assertRegex(renderer, r"(?i)softpipe")
diff --git a/support/testing/tests/package/test_virglrenderer/linux-virgl.fragment b/support/testing/tests/package/test_virglrenderer/linux-virgl.fragment
new file mode 100644
index 0000000000..1023aedc6f
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/linux-virgl.fragment
@@ -0,0 +1,6 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_DRM_VGEM=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/support/testing/tests/package/test_virglrenderer/remove-qemu-blobs.sh b/support/testing/tests/package/test_virglrenderer/remove-qemu-blobs.sh
new file mode 100755
index 0000000000..ff040aa96b
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/remove-qemu-blobs.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+set -eu
+
+qemu_dir="${TARGET_DIR}/usr/share/qemu"
+
+find "${qemu_dir}" -type f \
+	! -name 'bios-256k.bin' \
+	! -name 'kvmvapic.bin' \
+	! -name 'linuxboot.bin' \
+	! -name 'linuxboot_dma.bin' \
+	-delete
diff --git a/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
new file mode 100644
index 0000000000..bc1857a910
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
@@ -0,0 +1,3 @@
+# Avoid double-cooking the nested serial console, otherwise the test
+# infrastructure cannot reliably retrieve return codes.
+grep -Fq br-nested-virgl /proc/cmdline && stty raw

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
