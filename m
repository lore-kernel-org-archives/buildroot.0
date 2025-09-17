Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083CBCAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 02:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C452B83CC9;
	Wed, 17 Sep 2025 02:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJpKxwSpWWG6; Wed, 17 Sep 2025 02:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F8A183CD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F8A183CD8;
	Wed, 17 Sep 2025 02:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56375AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4882261177
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v735RrEqoWRd for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 02:45:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=kastelic.jakob@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58BD9612FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BD9612FD
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58BD9612FD
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:49 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b49c1c130c9so4110992a12.0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758077149; x=1758681949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZQSspgIhIXr916qMKhmLpvX1LNQYw0E3r2OokQ8alc=;
 b=VY8KJ+HaWOaX1Y1rwWEUvYHSp0YBt6JXaUdsiLHeuUBzHxdFvhv/BoB8m7k8HzB017
 VatsNP0FyIyJZA4HkfftCZTi1YcYhUdfyVGc7iD4DqbI3g874bQ+Qvy4oH5V6gaXYNRQ
 617R9OAvrJnqd5T6coU9da/AN1E6fAmUjQ9f80PqahavbJyrtJZaCvQvTobQFOHFpVUD
 QLv8T6/TuV33MKx5eBMBAq9zgKxiNZaUA/lCVWo8Z6bM2+s39dlE1lbDXb6gmgViiuug
 7RJNFS8ydWBs5/kt6aAnamDF6QBVTi/Y020uRwAGirWceO6g/RZ51DarvFiUdYcJzE2d
 qMbQ==
X-Gm-Message-State: AOJu0YxN4FM+etCFeMs5DB7J5n4jpt+zjLUAQF3w1sDT895AoH0nexVB
 x1RDPHRam3x7CEObTQlMEDqWtA+aL43DvHA5KHGvDZAgmxDWD91ouGK4t7ct7j++Ajc=
X-Gm-Gg: ASbGncvJAOyFIeYIRae8r7EoGPDl7bLu3VyMuXakUcq0F8ktyYuauVMEE1Pfy+z6l+e
 LyPieIzlmh0aFJ95x5iATcDx5Ngr4nLF+i7YaN9TlZXbr8odUR2C6fTK9op846jqigE31lrC0P4
 cFUG9jYbDpykyg7WSGFcEzTp6imyczMIe0zGnc02H+i9F3h46MXfSJhl6OrpfgPFiS4l2aDVJwe
 Jit+LgN4urRrisxs8XOV2waPrg0JwSOuP3Lmkvtpz4u0rbgTCt/pXVUD8Seymot2J7bF+4WGRlw
 pS/8Wr7I47Cw+Pum0sClP8xDCvW4YxwhXL8HCMBTrhEXPcA5Ejbv/CLFEX9k3ryvArBaw8DHHN3
 8STNVWFEUEauLGKoM2BfL1mwRmPEv5VD2/GUaaSl1cTXTYSFWX2bTr993QhsH5YLjI6C8O5/5qS
 h0
X-Google-Smtp-Source: AGHT+IFDGCUpHH/wwVagq+FCSviaQ4HZUMAYY7vLZIx8juusiRe4NF8cqE1GANMrKTNAamFQgT3J9A==
X-Received: by 2002:a17:903:1b46:b0:267:e3af:ae67 with SMTP id
 d9443c01a7336-26811ba71c2mr5864275ad.14.1758077148630; 
 Tue, 16 Sep 2025 19:45:48 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-2-197.hsd1.ca.comcast.net.
 [67.164.2.197]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2631ee2ceb2sm102588735ad.141.2025.09.16.19.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 19:45:48 -0700 (PDT)
From: Jakob Kastelic <kastelic.jakob@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 19:45:41 -0700
Message-Id: <20250917024541.1480367-3-kastelic.jakob@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219214555.3435133-1-jkastelic@thinksrs.com>
References: <20241219214555.3435133-1-jkastelic@thinksrs.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758077149; x=1758681949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZQSspgIhIXr916qMKhmLpvX1LNQYw0E3r2OokQ8alc=;
 b=m+upVl4bE1/r4ZK3tSyEfH21IwCQL2kkCdo3IaEnclSmcNnjOEf+21PwsVDZzy+fuR
 hRYn60Do6A0k9QrRSChZYYGbHEj5bwJe76eWQeMwrOvnzeg/sowaqOG7H/alQvqffNXS
 ZSlXOfzUwl2a1yCvqva6tVBnKO2F9UCK9DDTdyuiM+kG6pAQdGzsfkiUndy2h+V37l59
 LofVvuEwlzYJfjG70Lkm+SFKSm7ePeAA8/nm+be9lkkVbtTqAd+r5EeSkg8xjriggU/Z
 bxlZXrwV7caK/5dhT8OWNKpZYuXYzXU5JoTqIspaDT5PrQIUCdyxcqAzz7ihybJQ/ka0
 4myg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m+upVl4b
Subject: [Buildroot] [PATCH v2 2/2]
 configs/qemu_arm_vexpress_tz_falcon_defconfig: new
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
 Romain Naour <romain.naour@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>,
 Dick Olsson <hi@senzilla.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a new configuration, in which TF-A loads Linux directly
(as BL33) under Qemu. This defconfig can be used to test the new TF-A
flag, BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33.

Signed-off-by: Jakob Kastelic <kastelic.jakob@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 .../qemu/arm-vexpress-tz-falcon/patch-dts.sh  | 21 +++++++++++
 board/qemu/arm-vexpress-tz-falcon/readme.txt  | 28 +++++++++++++++
 configs/qemu_arm_vexpress_tz_falcon_defconfig | 36 +++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100755 board/qemu/arm-vexpress-tz-falcon/patch-dts.sh
 create mode 100644 board/qemu/arm-vexpress-tz-falcon/readme.txt
 create mode 100644 configs/qemu_arm_vexpress_tz_falcon_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 16d9ee892b..227b239bea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3537,3 +3537,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Jakob Kastelic <kastelic.jakob@gmail.com>
+F:	configs/qemu_arm_vexpress_tz_falcon_defconfig
diff --git a/board/qemu/arm-vexpress-tz-falcon/patch-dts.sh b/board/qemu/arm-vexpress-tz-falcon/patch-dts.sh
new file mode 100755
index 0000000000..896ae317b5
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz-falcon/patch-dts.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+set -u
+set -e
+
+QEMU_BOARD_DIR="$(dirname "$0")"
+INITRD_ADDR=$(sed -n 's/.*addr=\(0x[0-9a-fA-F]*\).*/\1/p' "${QEMU_BOARD_DIR}/readme.txt" | head -n1)
+ROOTFS_SIZE=$(stat -c %s "${BINARIES_DIR}/rootfs.cpio.gz")
+INITRD_END=$(printf '0x%x' $((0x${INITRD_ADDR#0x} + ROOTFS_SIZE)))
+TMP_DTB="${BINARIES_DIR}/falcon.tmp.dtb"
+FINAL_DTB="${BINARIES_DIR}/falcon.dtb"
+
+# Extract the DTB from Qemu
+qemu-system-arm -smp 1 -s -m 1024 -d unimp \
+	-machine virt,dumpdtb="${TMP_DTB}",secure=on -cpu cortex-a15
+
+# Insert intramfs address into /chosen
+fdtput -t x "${TMP_DTB}" /chosen linux,initrd-start "${INITRD_ADDR}"
+fdtput -t x "${TMP_DTB}" /chosen linux,initrd-end "${INITRD_END}"
+
+mv "${TMP_DTB}" "${FINAL_DTB}"
diff --git a/board/qemu/arm-vexpress-tz-falcon/readme.txt b/board/qemu/arm-vexpress-tz-falcon/readme.txt
new file mode 100644
index 0000000000..a7bf5c01e1
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz-falcon/readme.txt
@@ -0,0 +1,28 @@
+Board qemu_arm_vexpress_tz_falcon builds a QEMU ARMv7-A target system with
+OP-TEE running in the TrustZone secure world and a Linux based
+OS running in the non-secure world. The board configuration enables
+builds of the QEMU host ARM target emulator.
+
+  make qemu_arm_vexpress_tz_falcon_defconfig
+  make
+
+The BIOS used in the QEMU host is the ARM Trusted Firmware-A (TF-A).
+Since TF-A loads the Linux kernel directly, Qemu is expected to place both the
+DTB and the rootfs image in memory. For this reason the emulation needs to be
+run from the image directory:
+
+  cd output/images && ../host/bin/qemu-system-arm \
+	-machine virt -machine secure=on -cpu cortex-a15 \
+	-dtb falcon.dtb -device loader,file=rootfs.cpio.gz,addr=0x76000040 \
+	-smp 1 -s -m 1024 -d unimp \
+	-serial stdio \
+	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
+	-semihosting-config enable=on,target=native \
+	-bios flash.bin # qemu_arm_vexpress_tz_falcon_defconfig
+
+The boot stage traces (if any) followed by the login prompt will appear
+in the terminal that started QEMU.
+
+For all other details, check out the Readme for qemu_arm_vexpress_tz_defconfig.
+That configuration differs from the present one only in that it uses U-Boot to
+load Linux, rather than loading it from TF-A directly as we do here.
diff --git a/configs/qemu_arm_vexpress_tz_falcon_defconfig b/configs/qemu_arm_vexpress_tz_falcon_defconfig
new file mode 100644
index 0000000000..5ca6e74668
--- /dev/null
+++ b/configs/qemu_arm_vexpress_tz_falcon_defconfig
@@ -0,0 +1,36 @@
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ARM_FPU_VFPV3D16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-vexpress-tz-falcon/patch-dts.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_OPTEE_EXAMPLES=y
+BR2_PACKAGE_OPTEE_TEST=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
