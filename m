Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AA5CAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 15:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE5940CB8;
	Wed, 24 Sep 2025 15:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJxtd0GkCHGu; Wed, 24 Sep 2025 15:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E26340776
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E26340776;
	Wed, 24 Sep 2025 15:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F65177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 15:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B56F140087
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 15:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANXvhlZ1Zkty for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 15:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3400400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3400400CB
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3400400CB
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 15:34:22 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-27d3540a43fso22743155ad.3
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 08:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758728061; x=1759332861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x648TZrsuHu5T3048P6+1f7MThrfHLS1f9I8p41ncfc=;
 b=xBsx/KZmMT37stcRMNL0iIO4MlUy5RIM217h7EzrnOwlR0T8BUweB1zml8ouiF3u7K
 QIekimqFLqokR9VJAxTy2UZP23YJI2J/QofVZA6MRVblq3W+VN+v/Fge2K7PD6I7TPfR
 nfi7nttrWn6dFfaXODfcBd5zthJIE55/WlkH2mt1bo9XmpfWPGDqLnqaCF9WKqgSmGHK
 FngipWXUJDsXDC50qVA6yvzU8a0YbuJrN+8dp9kr4fqQVOQSkTgu7SuX8if9X/o9XcHu
 RASkyD6A5c9T4LQuPdhDquZCMQOz/v6vVGzM4NQ8vM3RP4tH+PBmgfPvsCgv6V9tJVKg
 bfQA==
X-Gm-Message-State: AOJu0YzqOyB0MatuIorBrQylPIpc7tVhXJDpNAxlOhNqSVNiihMX9gBG
 82WNfm1L3morllJrS2E0i5chsdL12mQgkbWVY8eY+Y3gY47GxMJfI4eehNxorw==
X-Gm-Gg: ASbGnctRGAUMb4eI1ImVxHRsWrG04lbFSlPm5AhIWYyIntV8sK70aWO61msJqijk5or
 28B43cUpGpOFnOW+TxnVWsK1rcZdO8pWZ9+unB27k94bTIR8DJO4dz7z+kcNan0gkqpk9HGcY78
 Pic67YR28IGYTIAcx+OwIL3uGO8W9uLT+1p6V/sT1FBrmXbv3C7s2yQ385Isfp/uCyPXOmxVgc7
 S0CrdOOYd2zIqcwTjAx3NLUrM6jkXVSQL90NJEgSBUL2/Tm93eqd1WWF4blcgNn0XC2E5PqvcMd
 KbsxwPhMX8YhNB/mg95s54V9cH93g/CTYk5/H4jOKjVnMfICPz9jSVdcBM7/EQLKmFTafSdsUOT
 QiY6XXMfeyfsewmOKTKc=
X-Google-Smtp-Source: AGHT+IHpDK6EzfVUE7oUyVmGyZeMD4jAuwFcfzXialyRdpTdzFeB4vz3y2MBqnMkdcI7JnC4aJSakQ==
X-Received: by 2002:a17:903:22d1:b0:24c:bc02:788b with SMTP id
 d9443c01a7336-27ed4a92388mr1280555ad.44.1758728061294; 
 Wed, 24 Sep 2025 08:34:21 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341bdd62e3sm2773963a91.25.2025.09.24.08.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:34:20 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 Sep 2025 23:34:01 +0800
Message-ID: <20250924153402.13910-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758728061; x=1759332861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x648TZrsuHu5T3048P6+1f7MThrfHLS1f9I8p41ncfc=;
 b=KZjTeI0V84QKmA1Y0aJZChgShHL7rWC8vD07G8u8Q71cPhowggjYsTdG2PoMiKL3hJ
 2w3YDcV3zyYuO4HY7zdR/X/y/WxI4KdE8t9166bsu0+z8qy6XfcgxKtyyA84PStqCEed
 DRh4wZ6ImpcvEVelGLc9BJaCo606jqnQcK07GKEtPJUMSzSHskTvakVr9W6GmfMh9igI
 TtWasqrTz5diSnwg4EkaJ7eFaNsw0vp/K/xvC7URSbSN78AvMXv1t0CDN0h1HCQb1yBj
 TAw6hFNDFPdEKTUpGbDp8TiTEg8Pp/vNi9eDd41mmRdlJDCaRkhYfBzsPVvUp4+wkcO7
 boaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KZjTeI0V
Subject: [Buildroot] [PATCH] configs/qemu_x86_64_efi_defconfig: new defconfig
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

This defconfig enables EDK2 UEFI firmware and grub2 x86_64-efi boot
of a Linux Kernel in QEMU virt machine.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/qemu/x86_64-efi/genimage.cfg  | 35 +++++++++++++++++
 board/qemu/x86_64-efi/grub.cfg      |  6 +++
 board/qemu/x86_64-efi/linux.config  | 59 +++++++++++++++++++++++++++++
 board/qemu/x86_64-efi/post-build.sh | 11 ++++++
 board/qemu/x86_64-efi/post-image.sh |  8 ++++
 board/qemu/x86_64-efi/readme.txt    | 21 ++++++++++
 configs/qemu_x86_64_efi_defconfig   | 25 ++++++++++++
 7 files changed, 165 insertions(+)
 create mode 100644 board/qemu/x86_64-efi/genimage.cfg
 create mode 100644 board/qemu/x86_64-efi/grub.cfg
 create mode 100644 board/qemu/x86_64-efi/linux.config
 create mode 100755 board/qemu/x86_64-efi/post-build.sh
 create mode 100755 board/qemu/x86_64-efi/post-image.sh
 create mode 100644 board/qemu/x86_64-efi/readme.txt
 create mode 100644 configs/qemu_x86_64_efi_defconfig

diff --git a/board/qemu/x86_64-efi/genimage.cfg b/board/qemu/x86_64-efi/genimage.cfg
new file mode 100644
index 0000000000..d07feef501
--- /dev/null
+++ b/board/qemu/x86_64-efi/genimage.cfg
@@ -0,0 +1,35 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file bzImage {
+			image = "bzImage"
+		}
+	}
+
+	size = 16352K # 16MB - 32KB
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = U
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		# For partition-type-uuid value, see:
+		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
+		# SD_GPT_ROOT_X86_64
+		partition-type-uuid = 4f68bce3-e8cd-4db1-96e7-fbcaf984b709
+		partition-uuid = UUID_TMP
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/qemu/x86_64-efi/grub.cfg b/board/qemu/x86_64-efi/grub.cfg
new file mode 100644
index 0000000000..084f89a10e
--- /dev/null
+++ b/board/qemu/x86_64-efi/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=PARTUUID=UUID_TMP rootwait console=tty1 console=ttyS0
+}
diff --git a/board/qemu/x86_64-efi/linux.config b/board/qemu/x86_64-efi/linux.config
new file mode 100644
index 0000000000..9362b7ecb5
--- /dev/null
+++ b/board/qemu/x86_64-efi/linux.config
@@ -0,0 +1,59 @@
+CONFIG_SYSVIPC=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_EFI=y
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_I915=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM_BOCHS=y
+CONFIG_FB=y
+CONFIG_FB_VESA=y
+CONFIG_FB_EFI=y
+CONFIG_FIRMWARE_EDID=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_SQUASHFS=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/qemu/x86_64-efi/post-build.sh b/board/qemu/x86_64-efi/post-build.sh
new file mode 100755
index 0000000000..24eee7f0e5
--- /dev/null
+++ b/board/qemu/x86_64-efi/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+if [ -e "${TARGET_DIR}/etc/inittab" ]; then
+    grep -qE '^tty1::' "${TARGET_DIR}/etc/inittab" || \
+	sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' "${TARGET_DIR}/etc/inittab"
+fi
diff --git a/board/qemu/x86_64-efi/post-image.sh b/board/qemu/x86_64-efi/post-image.sh
new file mode 100755
index 0000000000..83712900a9
--- /dev/null
+++ b/board/qemu/x86_64-efi/post-image.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+UUID=$(dumpe2fs "${BINARIES_DIR}/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
+sed "s/UUID_TMP/$UUID/g" "${BOARD_DIR}/grub.cfg" > "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
+sed "s/UUID_TMP/$UUID/g" "${BOARD_DIR}/genimage.cfg" > "${BINARIES_DIR}/genimage.cfg"
+support/scripts/genimage.sh -c "${BINARIES_DIR}/genimage.cfg"
diff --git a/board/qemu/x86_64-efi/readme.txt b/board/qemu/x86_64-efi/readme.txt
new file mode 100644
index 0000000000..0fd4a34d60
--- /dev/null
+++ b/board/qemu/x86_64-efi/readme.txt
@@ -0,0 +1,21 @@
+Intro
+=====
+
+This is a x86_64 UEFI Linux boot demo in QEMU virt machine.
+
+Build
+=====
+
+  make qemu_x86_64_efi_defconfig
+  make
+
+Emulation
+=========
+
+Run the emulation with:
+
+  qemu-system-x86_64 -M pc -m 1024 -bios output/images/OVMF.fd -drive file=output/images/disk.img,format=raw -netdev user,id=net0 -device virtio-net-pci,netdev=net0 # qemu_x86_64_efi_defconfig
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_64_efi_defconfig b/configs/qemu_x86_64_efi_defconfig
new file mode 100644
index 0000000000..e487b68687
--- /dev/null
+++ b/configs/qemu_x86_64_efi_defconfig
@@ -0,0 +1,25 @@
+BR2_x86_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64-efi/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/x86_64-efi/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64-efi/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EDK2=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
