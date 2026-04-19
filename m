Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB68F99C8D
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 00:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD7B40F6F;
	Sun, 19 Apr 2026 00:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7KWHNzOjubV; Sun, 19 Apr 2026 00:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF07E40F60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776558081;
	bh=uvR53R4+ZW5hYSbtZpUEN1b4iAtPK06IRzF/vQ0buaE=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HWH4SRFX+O4qKSrY/v3BLYd7f429S2hsyz4PXWpYhkXe2zkv84LBhdhkNYfPgGj/O
	 pm1BQ7Ls7wMmsNkrYiMI5OuX8hezStwpnLi6Sqi61/a52GysdpjNRxLpCKcJUSoecy
	 IIuIZy8rC8QYvKg2DhpRHstqaJh6Hs7L1FkCmknMh2ZXv/5CE8jdeuaj5fB70vjPzd
	 wlM36wZLdl6aV/E7v1ImK3V6DGyNdx5XQWHswi2e6FYWf5mShj6chgw15VHc3Ub9Xe
	 0wkPo1ZrEA3ZIsp4dYVpziZNP80McCXSknNdS9R5mYqyLqzSGff1Up+EuxzzBYgLKN
	 Ci5abP100B5QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF07E40F60;
	Sun, 19 Apr 2026 00:21:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B3D35B
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E458F814DE
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fM5HxziR_Jar for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5CBE814C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CBE814C3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5CBE814C3
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so16454495e9.3
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 17:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776558074; x=1777162874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sBle49uuqOkxIyAHC06lvZq3WJkLpql3+9Wrahl/VR8=;
 b=b5L0nnhvtvOcG768a2A4cd8dZVMUoAthGU7PHGe8vx2AD2lQMrFAJdc2CaYXjKWyl2
 /Xv2tvK4QVrkMlTcLRBqkOrFW66isykX6jaTEw7CNIgmSW3+/TJA6h3t1WGV96wnGBb2
 UXVBGmHGm75YGvbns0Rcs1YpXuO7pJjYH/aIgB0WSvNTiyqadZwahL9ZmFj2+81sDv59
 zuggbxuLzZz3NUybk0uRF3xKqi9FduqT3udArLKYkLDzWL2TKdu1DdDtHm5dC46hs82d
 cM63M8ibEr++3qzJYpzlXdLqG5jAsxA3M6nJ8He0+Zspb6OmDIPFAPJ/BRntdqfoqfsD
 bJ5A==
X-Gm-Message-State: AOJu0YzqbiC8AMIMo+3tFDZHb0t6LBHAk+hOVeuy/aDpTs436O5TqPfJ
 gfFL4HYz+cykNjsLF5ulz4rTIWtSWp9Z7Tkd287s0GRGep3ll8intFYz
X-Gm-Gg: AeBDievz5wyREApVTgAYrbOkbOoFK58pni/mzlEkrImhl3mh3sdVl2IupbTprWyBq8f
 lZsieWoylR4+2+sUrB/LlYYVSQLEjkrlDHt0zQ2qQgpoE+3G2tHzBH+f0SUwvHA4qKV5HthJCSv
 55T5ST3KoYjAvPlfmDVNvI0eL4c3UYY29URlRMnCkIdmhVP6F9kPta2Ztjx6hSb3HexCbaKVtEE
 IcKuuyMMFXBdJHa/z3xBn5trtKrce/HnIiiAOlmaWri5MwWpYTuDSGBLxdaLqoXxqTEcrWNEcFe
 Qq6iIR5hWSyfPoRzmEycn03otLV9s528b1tylyu1lQtRvRMHdx9ppZuH5I4BPAFDxOhQpKNXIqG
 oxeyIFtWYK/DGaNJ+T33wIZV424u04WO4f8nzrGt1xJozsEgZXdZeI3NexGWfCBwu1dBBU33JQg
 7ZADt//OzZeL0dVnEQE/l82Nu3t09WzHBwR8f2hfNImQrmaoI3n6rXSoTlxw0//V0WMziWkbL6e
 BjaZHJT9gP3kbY1QwVx4JmAA10ENTJ09Cza1MR3KsygLCDohbw8nkRsDVh47371SV0bMZ6zxY9V
 fL5B+NNfiBYwS5biOpa66v7Ts5LUtZY1TjdWHo9+dfpl/4ny/tSmj+aMgQfERYCdeIJJK4xbp1k
 6iOBKfJ9ETajh3JA=
X-Received: by 2002:a05:600c:a309:b0:488:af14:f1da with SMTP id
 5b1f17b1804b1-488fb74dd31mr89788895e9.7.1776558074354; 
 Sat, 18 Apr 2026 17:21:14 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1393d3sm246504025e9.11.2026.04.18.17.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 17:21:13 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 19 Apr 2026 01:20:52 +0100
MIME-Version: 1.0
Message-Id: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-2-1420c48f78fa@gmail.com>
References: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
In-Reply-To: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8582; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=Tsz4Ygx+RMK9cQiwnmTEB25EUbz7FfKvJcqY6bUrrjU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp5B/22f4yPXBiuLX/GJWr0qLPNiDvnG+ueGH+R
 H1PVCUoC5mJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaeQf9gAKCRBjTcTwaHBG
 +OoPD/9iSETURdj8N5VLaF2rE2gDp+iUB5DD+aXgfqPKK95YoEl4qZSX4yxuuXeaWDk0Cu9Q8PB
 +Mc3m6QZUM4ON0wGFEG/dK8j2osWv5FlEVO7kQyoK3TA4YlAFIAZb0zN2Rw84856+E+wpG8QfH5
 q3ytUs4rFNTRvVguqhC2qtUG/H3CBPbcjEVlgicjuP1NZNIv6GXWgvmFnPsSPtTtwMwIvho3WlC
 LBwG7zB364N4WHGQSS9Qgz/ei1jE4WqN+2V2U+8HX7c6aT8Rz1x5AUk4tFkbZSHl1haKap8luGA
 2sDvlmesdrOM5ebe6XVQ9qk5i1H3VxRaHXxJKiIwER24Ub+eOtdbNWY1gR5JWVyptz1hyD4lToK
 EQAeMirID6h/Kx0mXtGDz6RYWxE1VDLmBuLfjKmocEZn2usE3vdjcBPTalOTMGI6ymAUrts/xUS
 tk70al2067iL5zQno2C1A4nQccG+bG4yHe9rT08q3EZlgjkaX2/g9kbf9IGyiTXjCNSULkT1WqY
 rSXpqY1OkSXu7yfyfW34hmRPSLULvXlVr4sTZvCAVHq2E2mRRc/PfYMMLq+juatss/7dhIMqaKR
 39zbk9b/himNcM4AMs+8fe6zX/Qv/EPn6Eju8geTIbdM8NHhxH2SXd/b+BGPCYhhCbIwzuEAI/r
 PZk4DK9/h9Qr/9g==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776558074; x=1777162874; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sBle49uuqOkxIyAHC06lvZq3WJkLpql3+9Wrahl/VR8=;
 b=Zso0HLbb32WHGPGgk+t7r6gL0ltEKMUc84b81R2TvtFGSWWp/wiRdt974xEor/Kabd
 BIDFraCnRpvd6LSXJ3WjZT7pJ4QYIdB6eVZ+wJ9wE4yjChAPxB5hyRSSLmCy2KYHSlbO
 RvOlf/UGVMzuAJmYU4d/Tmj3eryHRgY1y7seu9TwZOfaThud4wisLBZyM03qluItps1o
 mmdBXnqCcV7vwW/3145smW8o0CiczvWPjg6o+KdQXRHJpOnCVabVnKgIewVzP5LJV2aA
 Pd1SwSxXiU/5yAHaZ11jQwmMXuWySngDnlwiDqrTMqZcQMJzhANG86cgEqJpyEXLoeuu
 159A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Zso0HLbb
Subject: [Buildroot] [PATCH v2 2/2] board/pc-efibootguard: add example
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
index f64a5d6370..1b8d27bcf1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -699,6 +699,8 @@ F:	package/perl-x10/
 
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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
