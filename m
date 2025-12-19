Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6DDE66891
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73C9340410;
	Fri, 19 Dec 2025 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5X07nahktIsQ; Fri, 19 Dec 2025 22:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 176CD40F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184620;
	bh=CwNvNyDtojTbOEGKNfwvcmlb28ELWSXt0L2RKcUqySA=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wb6YOVfIV7SmTZik8hSK7JR1zk3Y8rAQld3SEq4WgiNRGN57pYrFu36vZibnFbsdq
	 9lb3m4RpM4bJGTbdSVncqwSEGOT8eqZ23oAaMFsFy98/1GXADrUy02c98KbwBf2zC6
	 d5vBQqq7cdNshRtF1aAjPGMSjdybcqWE2de9+XxEtkJeZFRNvTZBNIige3QoF9CuGN
	 MxRqTRpTOe9TTzXbEz76H6GcAJgTxb9PUScRGH4jOVmo3RV8+xsrDnWmmO14Uf03I1
	 vX1FvQ2yBrE9sVhqrvla7i8ZinYAOfjKwid4I+t74M4nwr59M70EDfU7d3HUZmxFL8
	 4OmSt/ex5yp3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 176CD40F23;
	Fri, 19 Dec 2025 22:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBFE1293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE63D4007F
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61iPRBXIkBV0 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E03A84003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E03A84003A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E03A84003A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so18103185e9.2
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 14:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766184615; x=1766789415;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z7iXPD09xRqycTvfQC/YSB/a11qCblF97RlOtdZmIMs=;
 b=RTdUN/h7RbKE/4iM6bPcd1yn2plcMPKRkPzf89sLTe4oclI8Kf2RjfChD/ASrIrpTn
 11elfoq4rhVK7GSvyl83VdpB7vkuP41qkoPJ7simlL4ZV7wZRKSZ9k0iMwYQZgKSswm8
 C0wMBidn3wBA3Km6wsuRp3MrP6FMTDIvnUn7effhD9gqJcDPHcTNox277O56CuSLhv4i
 bhEnHKvlzmVY8tRg8wmYd5U0dWYWbQV/1o8TkkvFRZzulVhUB+SQ0AouTwSP6b4kr41s
 XBJ0jbevCShKDROCvSQqETX5lBDA3djQAenevrBmNFGpup6hK3tdp25LBqhp6gdM0M/n
 twBA==
X-Gm-Message-State: AOJu0YwRfaA4jhk9Cu3FvqJQVqlYpVWoMAOn9LMELAD+SJ+zWjCMrDcR
 BwMMRQeZlGPTJmt77HMf5OJSdM5/mnarLlH6+3y/CySHNDX/p6n0xu9v
X-Gm-Gg: AY/fxX5eGFC6254TJTX4xlZXyDIjxUFiWZfnOIbNo9zwq/O8v/+JoegChvUmvnXyy0R
 mZRQDRK601fac7v+Pod60+M+r7L0L1PclPlGn4u2og0ZafYM37mErEAZ2Ksvq5yCRGoUSVwdJDJ
 ZxIuRD/2CauG8NWN8l/wh43FpLC9iKCGTT//HE4YqSlA1ZY8HMLrHeXlj89MliksHOnM1XEarR2
 tajnR5Edw+/eSS1fc5oJcVAWCTQlJVihPYEhYGby6tLRzTawH8CxLir6y5gkZ6425NKbrs8N3AL
 PFi6fIraNKzGqYogMLSRBGBslo7qlabV/97dKXbVuzzWgXlHQ37Z7jX11Q+iAO8TrtfLtTxR+uo
 j7IXQnzabG3Be/bO93Oc1DGkKQnKbRyjWFWyG6IJkfVP//2EdsiCmJxcBGKBVgDEmnI5f3EnqqY
 2Pge/NaBEL2TtJHT/1SQ9qdFcTNwfvTfcR8LxZtnyei6FtR/dwlLju+fWUL/BD
X-Google-Smtp-Source: AGHT+IHERn/x0x8ySbvpmLAA3Hy1JNB1xMlRf902/HsaEAy5qSUWbPvsKl3mN67vhWzb3pyclE+xfg==
X-Received: by 2002:a05:6000:288c:b0:430:fbfc:ec77 with SMTP id
 ffacd0b85a97d-4324e4c637dmr5715891f8f.12.1766184614686; 
 Fri, 19 Dec 2025 14:50:14 -0800 (PST)
Received: from localhost (host109-150-127-3.range109-150.btcentralplus.com.
 [109.150.127.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm7245602f8f.22.2025.12.19.14.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 14:50:14 -0800 (PST)
From: Christopher Obbard <obbardc@gmail.com>
Date: Fri, 19 Dec 2025 22:49:59 +0000
MIME-Version: 1.0
Message-Id: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-2-0f307ee73919@gmail.com>
References: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com>
In-Reply-To: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8582; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=PzCuM7aQcSi1hrnYUqRvlgbmu5WLpTuJ8DSYKJVroew=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpRdajKQ6UxunJEui9+bJ5sBNYZovflQs+FWrXE
 HJQWVlhBvaJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaUXWowAKCRBjTcTwaHBG
 +FX8D/9dptKAR8LemU/bhRj4C3U7HE+DKKzO0Jb1SdwNS4uZkA+jjh4te8OvPThOwr6lNhVwyMR
 0qx5V+5KbPPrcjUHPoiVB62nbSHi8TOuDUq04XEsQpyBES7SHwbgyXaFDq8TQUb8dZ+p2VcUT6D
 X1zkcwjZ+XqjR5EBRG1TOpkNU+DjH9811XsOEAzfmdVf7an93FftbFLYZ4qHE55EJABM6M6bza0
 HdDluchPdRY4JP0FLL+1gvlBN90bO6MtIOwnTHw8WmIkG4cr6HUaQK7V490osZ5DjCqb2K2q6Jh
 Hk9GiKetYyf5wOP7isayCmxuO7YSZpSZycYGErHX941wFTmu9iVHN6ROBFEjI7OIV6OEuB97ErE
 9cAmaaWC9uEySfA8E/xIgij6WnFBjYJjuxYpXLX+PdlKue4lG5nHxia5Ce56zoEhjtGm4Yc+XxT
 J6eP/XWk+3BaerAlL55DFT+9BNoxHnqssq4xH75HsIJKn/gniHZFZ6FVJ4Myz2PPNC9uoibXUnv
 H4/RzyuyGU57MKamQtaLwp2p8RE8ICOvXVzY/nvIa2aCLp3YhNKGL50w2oB4HJ2Us6q9Rej+VR1
 R0PsNAG9bMEAv2mppQXlAQE0eB6WWC8CTvrFDaVOX9kdxgvBHLOntGss4aZS8YdORuIhOqm0Qp+
 i6WVYKDDE3mfxag==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766184615; x=1766789415; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7iXPD09xRqycTvfQC/YSB/a11qCblF97RlOtdZmIMs=;
 b=c97tcFVHEVy+cci3nEEKAkL6Vvo5JGIjO2tc5NEMP3WApQVbMZPiXLHs45coXMxqgm
 GG4SVJF16I9XpdoRkOMnEhD1d8rcEmlgwMiltJHiMjCqBXvef9DcZrFjVR2VkA7MgcV0
 HHugl7dk8P06dlwsjUkPZEFXh8NWyRRqUQ/rwtaX7+KGgeXGp7/bEQmw2FqA73ZqrEI3
 Uc3TvqmbcC2SfuvUqGnEXTFblg8guvVyLjlB3+2QwGWIenNPb8zKBJFiqtyn9I/fIBcD
 grNOawf6j8xEUl02eSiaJbXk5lDuu4iC/pNhoHh1UrsdgnT6Ors/FDglWcF9JNmwgF5X
 k5vQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c97tcFVH
Subject: [Buildroot] [PATCH 2/2] board/pc-efibootguard: add example
 efibootguard recipe
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an example recipe (based on configs/pc_x86_64_efi_defconfig) to
generate an x86-64 image which boots the system using the efibootguard
bootloader. The recipe is an example of how to create an image using
efibootguard, including how to create the disk image & how to configure
efibootguard.

The created example image contains two boot slots; one of which contains
the kernel and the other is a dummy slot (e.g. cannot be booted from).

Also add instructions (and a silly script) to boot the example image
with QEMU.

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                                   |  2 +
 board/pc-efibootguard/genimage.cfg           | 59 ++++++++++++++++++++++++++++
 board/pc-efibootguard/linux-efistub.fragment |  4 ++
 board/pc-efibootguard/post-build.sh          | 35 +++++++++++++++++
 board/pc-efibootguard/post-image.sh          |  7 ++++
 board/pc-efibootguard/readme.txt             | 30 ++++++++++++++
 board/pc-efibootguard/run-image-qemu.sh      |  9 +++++
 configs/pc_x86_64_efibootguard_defconfig     | 51 ++++++++++++++++++++++++
 8 files changed, 197 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b789b3023..fee1ba423d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -691,6 +691,8 @@ F:	package/perl-x10/
 
 N:	Christopher Obbard <obbardc@gmail.com>
 F:	boot/efibootguard/
+F:	board/pc-efibootguard/
+F:	configs/pc_x86_64_efibootguard_defconfig
 
 N:	Clayton Shotwell <clayton.shotwell@collins.com>
 F:	package/audit/
diff --git a/board/pc-efibootguard/genimage.cfg b/board/pc-efibootguard/genimage.cfg
new file mode 100644
index 0000000000..2437a89b63
--- /dev/null
+++ b/board/pc-efibootguard/genimage.cfg
@@ -0,0 +1,59 @@
+image EFI.vfat {
+	vfat {
+		file EFI/BOOT/BOOTX64.EFI {
+			image = "efibootguard/efibootguardx64.efi"
+		}
+	}
+
+	size = 16352K # 16MB - 32KB
+}
+
+image boot-a.vfat {
+	vfat {}
+
+	size = 128M
+	srcpath = "output/images/boot-a-part"
+}
+
+# # boot-b is a placeholder
+image boot-b.vfat {
+	vfat {}
+
+	size = 128M
+	srcpath = "output/images/boot-b-part"
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition EFI {
+		image = "EFI.vfat"
+		partition-type-uuid = esp
+		offset = 32K
+		bootable = true
+	}
+
+	partition boot-a {
+		partition-type-uuid = fat32
+		image = "boot-a.vfat"
+	}
+
+	partition boot-b {
+		partition-type-uuid = fat32
+		image = "boot-b.vfat"
+	}
+
+	partition system-a {
+		partition-type-uuid = root-x86-64
+		image = "rootfs.ext4"
+		size = 2G
+	}
+
+	# system-b is a placeholder
+	partition system-b {
+		partition-type-uuid = root-x86-64
+		size = 2G
+	}
+}
diff --git a/board/pc-efibootguard/linux-efistub.fragment b/board/pc-efibootguard/linux-efistub.fragment
new file mode 100644
index 0000000000..82f757b098
--- /dev/null
+++ b/board/pc-efibootguard/linux-efistub.fragment
@@ -0,0 +1,4 @@
+CONFIG_EFI=y
+CONFIG_EFI_STUB=y
+CONFIG_EFIVAR_FS=y
+CONFIG_EFI_PARTITION=y
diff --git a/board/pc-efibootguard/post-build.sh b/board/pc-efibootguard/post-build.sh
new file mode 100755
index 0000000000..7f5973cd39
--- /dev/null
+++ b/board/pc-efibootguard/post-build.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+set -e
+
+BOARD_DIR=$(dirname "$0")
+
+# Kernel cmdline to append
+KERNEL_CMDLINE=""
+
+# Create efibootguard boot-a slot configuration
+mkdir -p ${BINARIES_DIR}/boot-a-part
+echo -n "boot-a" | iconv -f ascii -t UTF-16LE > ${BINARIES_DIR}/boot-a-part/EFILABEL
+${HOST_DIR}/bin/bg_setenv \
+    --verbose \
+    --watchdog=0 \
+    --filepath=${BINARIES_DIR}/boot-a-part/BGENV.DAT \
+    --revision=2 \
+    --ustate=OK \
+    --kernel="C:boot-a:bzImage" \
+    --args="root=PARTLABEL=system-a $KERNEL_CMDLINE"
+
+# Create efibootguard boot-a slot configuration (unbootable)
+mkdir -p ${BINARIES_DIR}/boot-b-part
+echo -n "boot-b" | iconv -f ascii -t UTF-16LE > ${BINARIES_DIR}/boot-b-part/EFILABEL
+${HOST_DIR}/bin/bg_setenv \
+    --verbose \
+    --watchdog=0 \
+    --filepath=${BINARIES_DIR}/boot-b-part/BGENV.DAT \
+    --revision=1 \
+    --ustate=FAILED \
+    --kernel="C:boot-b:bzImage" \
+    --args="root=PARTLABEL=system-b $KERNEL_CMDLINE"
+
+# Copy kernel into boot-a.
+cp ${BINARIES_DIR}/bzImage ${BINARIES_DIR}/boot-a-part/
diff --git a/board/pc-efibootguard/post-image.sh b/board/pc-efibootguard/post-image.sh
new file mode 100755
index 0000000000..eec88f707d
--- /dev/null
+++ b/board/pc-efibootguard/post-image.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+set -e
+
+UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
+sed "s/UUID_TMP/$UUID/g" board/pc-efibootguard/genimage.cfg > "$BINARIES_DIR/genimage.cfg"
+support/scripts/genimage.sh -c "$BINARIES_DIR/genimage.cfg"
diff --git a/board/pc-efibootguard/readme.txt b/board/pc-efibootguard/readme.txt
new file mode 100644
index 0000000000..d3eeb9793a
--- /dev/null
+++ b/board/pc-efibootguard/readme.txt
@@ -0,0 +1,30 @@
+EFI Boot Guard Example Recipe
+=============================
+
+1. Build
+
+  Build the image:
+
+  $ make pc_x86_64_efibootguard_defconfig
+
+  Add any additional packages required and build:
+
+  $ make
+
+Emulation in qemu
+=================
+
+Run the emulation with:
+
+qemu-system-x86_64 \
+  -M pc \
+  -drive if=pflash,format=raw,readonly=on,file=</path/to/OVMF_CODE.fd> \
+  -drive file=output/images/disk.img,if=virtio,format=raw \
+  -boot menu=on \
+  -net nic,model=virtio \
+  -net user
+
+Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
+firmware image for qemu. It may be provided by your distribution as a
+edk2 or OVMF package, in a path such as /usr/share/OVMF/OVMF_CODE_4M.fd
+(for Debian).
diff --git a/board/pc-efibootguard/run-image-qemu.sh b/board/pc-efibootguard/run-image-qemu.sh
new file mode 100755
index 0000000000..32be727c3e
--- /dev/null
+++ b/board/pc-efibootguard/run-image-qemu.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+qemu-system-x86_64 \
+  -M pc \
+  -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/OVMF_CODE_4M.fd \
+  -drive file=output/images/disk.img,if=virtio,format=raw \
+  -boot menu=on \
+  -net nic,model=virtio \
+  -net user
diff --git a/configs/pc_x86_64_efibootguard_defconfig b/configs/pc_x86_64_efibootguard_defconfig
new file mode 100644
index 0000000000..276c628e18
--- /dev/null
+++ b/configs/pc_x86_64_efibootguard_defconfig
@@ -0,0 +1,51 @@
+BR2_x86_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc-efibootguard/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc-efibootguard/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc-efibootguard/linux-efistub.fragment"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_CONNMAN=y
+BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_CONNMAN_CLIENT=y
+BR2_PACKAGE_WIRELESS_REGDB=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EFIBOOTGUARD=y
+BR2_TARGET_EFIBOOTGUARD_X86_64=y
+BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS=y
+BR2_TARGET_HOST_EFIBOOTGUARD=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
