Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715B7CD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF4161B34;
	Sat, 16 May 2026 01:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKnoFPFvSzt4; Sat, 16 May 2026 01:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD0661B41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895847;
	bh=Sz5wXBgo38WZzv/iu/gtNWv1FKGPhkTryFPVYNVUuYs=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bj3rWaTVPUkRCXbEtEOFhazuPuMZ1GDquLIxqCU0fQ+ljdNcPgkwEHJPVMi314Sij
	 9aU78R1SVFMReplPYY7EPv19LE5UhD6r6MMMpAltVLyWSJiWNF4oc/sL08Pmi1r/GA
	 UOYLBOcrr03j6LIJeM0KorElCUS7b6VGp6fQjSeUdOR9JOX+F3VxHNP/vkftfNS6sp
	 5/m7kjfjMGt/WZWTyZL4Ht+2/qLG+k2OSpz6po1aLMVmWJiEEVTudSZX7eCFie8m5K
	 Pko8zn5RFB0FPUWNmCdJuVDBDI4nCARwiTrANBnD5C2DARSB2ccTl8MAIZfiEgNJ8W
	 YCCBsyREGfzuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD0661B41;
	Sat, 16 May 2026 01:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A80745B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D02B40996
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbuhWz6rw5rr for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D9EC407C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9EC407C8
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D9EC407C8
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:01 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8379e010b01so209628b3a.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895840; x=1779500640;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H39cdpc6N76XHYkIVbiHufp0G9xU79ZUqYs1l76EGyQ=;
 b=UPeUUL6sne4ONEoLnLQD2rrv09MiqceJf7O7QREbzsMJRud2Ju3tZnFZfwgAB6IiGb
 SNEqCjOgba9sYRQbw7hpRnDFYv18vSrp412dOcFBnj8T3h4Oc3LanvNqSQrawM1SQ3VX
 kKsV1Wy9Fz6bX4FgNfvOG0T932PbsHwy+fqp1BTny3z5eaEVY1pn767WFEoDeAElEfYU
 sCPj++5YQcNKwCZQefch7RfowNWOfDJ3T7WaGa7ZLdUh8jB4+AcTLaawHygGG+GFpFrq
 9Z5gvq98YVPsHUCYxxV46f3nPcrEF7umPap84uW0CwWWXw3Bdpp4q3Xq4M3tEtYViOak
 H/2A==
X-Gm-Message-State: AOJu0YzAybw2b3AH4dLZujHrHOIctGLhaFgPrroZO0GRh+aNj2mKnyH/
 ymrzpVBLIU7Y32ecl8Mgifb+VsO1lOpVg+F4McBvvEo1cF18mXp/enf/
X-Gm-Gg: Acq92OGA/JCIbv8SGDRAaHG/2KchJRAIYrH4uV8zEYx9YDdChDGof71i4knhpa5Ht+U
 UfSgYCZ9uSXTMEwIvNnWTd1AEYru1uRyqc8m7/DHxIxY1k5P/cSxC8jNM1FRJA5RRMRMb2LnLLL
 WUbiDkYZoe7GnsGV4PYt9jgZQRuwAjEPRJRKx1p7N/50cMW2I27oTV2Z+MU1/3kzqI6HKMwKsMe
 eN3VvSuizxL50GGDtmNUwW9QV1Sb88o0WQy3sIGtbjUukoHMCuVW3zGbQ7Uxfj0LJB/e5fgBCCt
 +GgsxCra3wXPB71e6v4E4ZLj4+gPIL0e1VzvMSNidPH+zyACb6XiDTPBpaqOCtEOZn5xwWVwzgg
 EdqSgmUhQKzsB95KucLwIJ7uQn4Gc7U3hs+urCuGprIasMD2Q8bqLjioB4iYvvSWwoqxIltExU7
 Ltqmjke4K3ELxCjbQXPMpnxZppXezJz0PNDgo=
X-Received: by 2002:a05:6a00:3d54:b0:824:afe1:f7e3 with SMTP id
 d2e1a72fcca58-83f33cc0b04mr7098114b3a.15.1778895840493; 
 Fri, 15 May 2026 18:44:00 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:59 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:39 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-8-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=11273;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=1giLiLdJgaSjzN0UQPZNxY0vRmephFDroAFIuDtoVHc=;
 b=2U+uzl2hYCXmIidrHQsnc8IXehnGDkRnJGHD84wgmrYc12NiqFJ2tq7SViCq2vM2jPq1gHYnp
 cyO32Eu1rLIBMjrcZ4IyckP+bafYLiDUEsE+1qK6rjKE2zNDaqqhb4v
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895840; x=1779500640; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H39cdpc6N76XHYkIVbiHufp0G9xU79ZUqYs1l76EGyQ=;
 b=E2INFGCqSBtPRfzpqdDtEYNIQy2xd2F11hnD7VAg+e3cXuhImkBrvUIoLNu7lm8WKd
 uaLwCDWbmAnqy4SCKYGxh01drWsjoKi2D9Gbzq44btKINUhvSCWIHF5Nn4koxfeLYkib
 xTflGfpDj1I6hefumwv33FzVbJbtHNy3jq5vw1L6c1o7tkR4Djtk/jo5ElM1hDY30Rn0
 0VNpIG0Iu3C35vUVBhuTwxM79utCuzWy7E7bMTVLg7fc1mNyT4JR488k/H76+Xnom7nF
 itDIa/6QbvZy8X5NzWM9TinjCTkz4hSrAc7onL4ddlvb36x86pwbcZpooJ4GrcSB+yOV
 3Svw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=E2INFGCq
Subject: [Buildroot] [PATCH v6 8/8] support/testing: add virglrenderer test
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
 package/virglrenderer/Config.in                    |  18 +++-
 .../testing/tests/package/test_virglrenderer.py    | 117 +++++++++++++++++++++
 .../test_virglrenderer/linux-virgl.fragment        |   6 ++
 .../test_virglrenderer/remove-qemu-blobs.sh        |  12 +++
 .../rootfs-overlay/etc/profile.d/stty-raw.sh       |   3 +
 6 files changed, 156 insertions(+), 1 deletion(-)

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
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
index fdf785288b..041bb63a1c 100644
--- a/package/virglrenderer/Config.in
+++ b/package/virglrenderer/Config.in
@@ -8,14 +8,22 @@ config BR2_PACKAGE_VIRGLRENDERER
 	  A library for accelerated graphics and compute in
 	  virtualized guests.
 
+	  virglrenderer can be built without virgl, venus, or DRM
+	  backends, although such a build will not provide guest
+	  graphics or compute acceleration by itself.
+
 	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
 
 if BR2_PACKAGE_VIRGLRENDERER
+comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"
+	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+
 config BR2_PACKAGE_VIRGLRENDERER_VIRGL
 	bool "virgl"
 	default y
 	depends on (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
 		|| BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	help
 	  Enable API-level OpenGL acceleration over virtio-gpu.
 
@@ -27,7 +35,7 @@ config BR2_PACKAGE_VIRGLRENDERER_VIRGL
 
 comment "virgl needs OpenGL or OpenGL EGL and libgbm"
 	depends on !((BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
-		|| BR2_PACKAGE_HAS_LIBGL) \
+		|| BR2_PACKAGE_HAS_LIBGL)
 
 config BR2_PACKAGE_VIRGLRENDERER_VENUS
 	bool "venus"
@@ -35,6 +43,7 @@ config BR2_PACKAGE_VIRGLRENDERER_VENUS
 	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
 	depends on !BR2_STATIC_LIBS # vulkan-loader
 	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	select BR2_PACKAGE_VULKAN_HEADERS
 	select BR2_PACKAGE_VULKAN_LOADER
 	help
@@ -61,6 +70,7 @@ config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_AMDGPU
 	bool "amdgpu"
 	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	help
@@ -72,6 +82,7 @@ config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_INTEL
 	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	select BR2_PACKAGE_LIBDRM
 	help
 	  Enable DRM backend for i915, used by Gallium i915/Iris
@@ -81,6 +92,7 @@ config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM
 	bool "msm"
 	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	depends on !BR2_arm
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	select BR2_PACKAGE_LIBDRM
 	help
 	  Enable DRM backend for msm, used by Gallium freedreno
@@ -90,6 +102,7 @@ config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_PANFROST
 	bool "panfrost"
 	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	select BR2_PACKAGE_LIBDRM
 	help
 	  Enable DRM backend for Panfrost, used by the panfrost
@@ -99,3 +112,6 @@ endif
 
 comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+	bool
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
