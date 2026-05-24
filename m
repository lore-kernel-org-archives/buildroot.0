Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAECCD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D623C83ADB;
	Sun, 24 May 2026 17:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KLR75l6f5Mu; Sun, 24 May 2026 17:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E7583AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779643436;
	bh=fTNbD/md7ShhRc1QHLUU4Vut/aBzm9XG9T8SMkQoJaM=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S/FjAVPATbZtJ4jnvX6zVq/IQ9vLEIkWKBu2kCjQikIxqJlzKYHKAp2Ay4TQ053DT
	 cTCXAsS8ygqNnCiYjdVA29Rsdzn4d0l7ZjepIpZXmFpcLpp016olWJI0OvTnZsmbst
	 3DM4k+IPSSF5nOtUHQcTdNSoEMJWV/rh7tkXZzax3bDNi6zLHanBAoKH+CBo9aBW7Z
	 Ej8uXOVl65hofvoyHEeh3lItbcjWeY1QQJO1fCJ3MD6GoYJNCrEbuIwGPEfamj3WOr
	 IUjwoTteBFPKQ1fIHh5VxlMW+ZmheLHc1i4rp7oaKu7kVmruszN3UEcm6gGdn921LZ
	 MNXtqn+xUyvcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E7583AE0;
	Sun, 24 May 2026 17:23:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18499263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F264C83AE0
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uToA8FVSM82n for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B975583ADB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B975583ADB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B975583ADB
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso3102895e9.3
 for <buildroot@buildroot.org>; Sun, 24 May 2026 10:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779643431; x=1780248231;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BI75Q6taNePf7X1+5s60mX6citQoGcX+D/+4tN0hMaA=;
 b=qlH0aoc2OPyNQNgiY+rdY+G9uEAGiD8AMBMuMLydiAI6vsD+AVTziSIlpV7NkE9JVk
 yvKRZn1ZC7KNlYtrqLmft/3n6hfCi7flhiuwprfFrW6OOfalSiteV6CNSWY6o1GhRmOX
 i3mN1iq/LO5IME4Hi73FgeUZ6DZE0GRhoDClBS10FkWlNQULGFTAeoiA99i3SLo0bDpy
 VpCWXMBMRpumCVr32KJe9CHZZ5GrdboAO4Ozjcr+eU/zM5lmWTizlxEt99A/mKlM2aYa
 MIuUqwMxeb56DqhuNbZJasJaYWjAsk8oijVdM1r0W3cYo+8LxdUcapxyiNWrtF75kIVy
 zm4Q==
X-Gm-Message-State: AOJu0YzO9aDFG5j6IrgXkxekTj3iaFBy/J2LsIXCprYIklHj1ZBf67Wa
 +pYPkUOc3dv5ZdkX4I72oMlTN098ryr/iFxurFwLZ4aQAVnUF2Jryb/o
X-Gm-Gg: Acq92OHYAyYhANTa3PMQ0+x9BDDLC5FGiGi0ox5pGObU6VRHeQf737as+Y07s5TBEPs
 c25x9ICxdFlTJHrXuLSMCJGlUVLgetH5+xWgpxyKUreBXNZCrC1Yvh0YArs/vYGAcs5hoctWwG9
 sBjUBIFDmaK3qpMAJE6aeykybLdXe8awC3ySLg1mBre8pOl/q6cnfX3m3cY3IaYEY367dmhtGsz
 ft4YL4pJPoCOhKoIPnUeUDAVHDw8k4XYNbzUF+im5P81Wxazu7opKDQAWHw9wKLQsrO/IS59Jr9
 3HAgCzObiUavqRsOhhlyT4i+B5DVzhX+8XJpsSVi9LwyHcm9tWT7OX7rIWMNAioM2OEwA3bTJR6
 sFJ2jC341yW4jIdydNM9/Z3hlASt+T+Cr4fwstd2TqcJXcG7OVJbzJfpkaWYqwbw3TJvFuleAct
 wschtIxsK9v0WADJNrKqnCFagxnZZTnVgihDZvOff65EcYOxOObM6Zz8lr6LSbGky9KJcyRw/WQ
 7p2pYCQ26o5u2wajwsqqF2xCcGVV4i+y2iYYgj0Nk8ooOcg5TWAit3KjDQbUD+oElBqqqdYI7Ms
 NsUDunXVb4SFKrl6AC1mFbkDD7ZUWhIGO6Dq4GzHGQ2wTQHJGjx8sJDxm6ngKtcsC3Zfkg==
X-Received: by 2002:a05:600c:6995:b0:490:482c:4384 with SMTP id
 5b1f17b1804b1-490482c44ddmr175545815e9.24.1779643430610; 
 Sun, 24 May 2026 10:23:50 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454b1ab3sm217005775e9.14.2026.05.24.10.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 10:23:50 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 24 May 2026 18:23:39 +0100
MIME-Version: 1.0
Message-Id: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-2-47fc8262591b@gmail.com>
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
In-Reply-To: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11230; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=sD4eimSQ5/XLuZI68iL4I4yejgEJVyzpKbtKn3jI0tk=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqEzQjr2nVe9sOOzGetRa53gfaqJ47I2YXrnLRz
 wQggsk4rwuJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCahM0IwAKCRBjTcTwaHBG
 +BTTD/9ImejE+9irAQpyBcDkdrQiEXYmf61GrFVl7/NdzAAywk3axO+p6WK8dTyMtAQ56WAEwXH
 RCsegrp0IioFkEudz9RS6xyAAGTBB7neyggBKGj8c++PUFnY4QsYoMno8Y55qvWPraqaTH9C3sD
 AgKWbbuFlr59eZZq5AcJThciB741tkqnCy1pchsqqRH1O1Ncqv6hnsrHVfnF9zJLO6+Kr/BG5AB
 QHl/gK6ozYZwYpsyGHs2UkbuBFEiVfCJy2QbNWewunVDBLUJKF59d7SFoVL4bAluS3BzO3ZC+Jj
 SLZo3677D/2p13EDXEwZC3NTemkdpmdzefe9fwQ6v+GmD4jo9Gv2JJ68v/sQdaRfTZfuE+9A/tN
 U+y8iIEmxr9tY7EJKLFtaD4naa8I7PK12yoGqjAqN6IYIFdE0nj/AWok659UB0V1kKTKScqjYGR
 R0bSmOhaYe5yowH/2BsuiIPnfURg8IL7CNabyMdP2klcLGzTSqvXkw2hG90DKqXxpDaPMl0ASy7
 Y2nmv0RD//lpKW3APBzlFVj7m4jreTxsftXQei9OQnKGqyVf1y3yBcGvXVxruGEGLISuRtv8uS7
 fNHic3Rlm/dG3BVFvNqyJPrng+SBm5mtZ20mEybmVhKj1xx9Bw5n7ZiaZjwDMttLvlV9vnTDey1
 GOSASuxBE9g0FZA==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779643431; x=1780248231; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BI75Q6taNePf7X1+5s60mX6citQoGcX+D/+4tN0hMaA=;
 b=ZinUCA6+gVJPb0CD+L3Ko9W5FwHXxxubOBOrb35VWwBAmjnmZIq91RyB0OQlQfzujv
 /HB3s/fqfY3xA5jtGI3SYH1maOFTKXz/io3b+I7ywX4YKN1AmcVKhGvlVJ1X8Di7+wII
 k581TXks3diCbgucPYp5vul56WX7XLIl0ynqBiFxiGJCOKC/bMJrUwM27ZRjoHP+D4rO
 /3j1P+jLCepMzm7Aq8D47WXqo5l7mqlZBDN5hvXDg1yQlSK+iQL77rG2GgXaXLDhong1
 5uIr3H7k5YB05lG/HqsQmq9gR/+WBW9A4fDoHbqXomVJbGkHwY4mGZIkxQL5snfvfcJl
 BpjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZinUCA6+
Subject: [Buildroot] [PATCH v3 2/2] board/pc-efibootguard: add example EFI
 Boot Guard recipe
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
generate an x86-64 image which boots the system using the EFI Boot Guard
bootloader. The recipe is an example of how to create an image using
EFI Boot Guard, including how to create the disk image & how to configure
the bootloader.

The created example image contains two boot slots; one of which contains
the environment built by Buildroot and the other is an empty, dummy slot
(e.g. cannot be booted from).

EFI Boot Guard provides a tool for generating UKI images, which can then
be signed for Secure Boot. For simplicity, this is not enabled in the
example recipe.

Also add instructions (and a script) to boot the example image in QEMU.

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                               |  2 +
 board/pc-efibootguard/README.md          | 89 ++++++++++++++++++++++++++++++++
 board/pc-efibootguard/genimage.cfg       | 59 +++++++++++++++++++++
 board/pc-efibootguard/linux.fragment     | 15 ++++++
 board/pc-efibootguard/post-build.sh      | 33 ++++++++++++
 board/pc-efibootguard/post-image.sh      |  7 +++
 board/pc-efibootguard/run-image-qemu.sh  |  9 ++++
 configs/pc_x86_64_efibootguard_defconfig | 51 ++++++++++++++++++
 8 files changed, 265 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 246b1aa44e..ddc71d9639 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -704,7 +704,9 @@ F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
 N:	Christopher Obbard <obbardc@gmail.com>
+F:	board/pc-efibootguard/
 F:	boot/efibootguard/
+F:	configs/pc_x86_64_efibootguard_defconfig
 
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
diff --git a/board/pc-efibootguard/README.md b/board/pc-efibootguard/README.md
new file mode 100644
index 0000000000..1bbeff4c48
--- /dev/null
+++ b/board/pc-efibootguard/README.md
@@ -0,0 +1,89 @@
+# EFI Boot Guard Example Recipe
+
+This recipe creates a basic x86 disk image using [EFI Boot Guard](https://github.com/siemens/efibootguard/tree/master)
+as the bootloader with two root filesystem slots.
+
+The image is intended to demonstrate a typical A/B boot layout. The first slot is
+populated with the root filesystem generated as part of the Buildroot build,
+while the second slot is left empty so that it can be used later by an update
+tool, which is out-of-scope for this example recipe.
+
+The recipe also creates the EFI system partition and installs the EFI Boot Guard
+bootloader components needed to select and boot one of the available slots. Each
+slot has its own EFI Boot Guard environment, containing the kernel image and
+configuration.
+
+This example is deliberately minimal. It is intended as a reference for users who
+want to integrate EFI Boot Guard into their own platform-specific images, rather
+than as a complete production-ready update setup.
+
+This recipe was designed to be ran in QEMU and may need additional changes to run
+on real hardware.
+
+
+## Build the image
+
+Configure Buildroot with:
+
+```
+$ make pc_x86_64_efibootguard_defconfig
+```
+
+
+Build the image with:
+
+```
+$ make
+```
+
+The raw disk image is available under `output/images/disk.img`.
+
+
+## Emulation in QEMU
+
+Emulate the system in QEMU with:
+
+```
+$ qemu-system-x86_64 \
+    -M pc \
+    -drive if=pflash,format=raw,readonly=on,file=</path/to/OVMF_CODE.fd> \
+    -drive file=output/images/disk.img,if=virtio,format=raw \
+    -boot menu=on \
+    -net nic,model=virtio \
+    -net user
+```
+
+Note that `</path/to/OVMF.fd>` needs to point to a valid x86_64 UEFI
+firmware image for qemu. It may be provided by your distribution as a
+edk2 or OVMF package, in a path such as `/usr/share/OVMF/OVMF_CODE_4M.fd` in
+Debian.
+
+
+## EFI Boot Guard userspace tools
+
+The example image includes the EFI Boot Guard userspace tools. These can be used
+to inspect and update the boot metadata stored in each slot environment.
+
+`bg_printenv` prints the current EFI Boot Guard boot configuration:
+
+```
+# bg_printenv
+```
+
+`bg_setenv` updates the state and revision of a slot. For example, the following
+commands initialise both slots and prefers booting from slot `0`:
+
+```
+# bg_setenv --part 0 --ustate OK --revision 1
+# bg_setenv --part 1 --ustate OK --revision 0
+```
+
+In this example, both slots are marked as usable, but slot `0` has the higher
+revision. EFI Boot Guard will therefore select it before slot `1`.
+
+For more information on configuring EFI Boot Guard, see the
+[upstream documentation](https://github.com/siemens/efibootguard/blob/master/README.md).
+
+An update framework (such as RAUC) can use these tools to switch the preferred
+boot slot after installing an update and to mark a slot as failed if the updated
+system does not boot successfully.
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
diff --git a/board/pc-efibootguard/linux.fragment b/board/pc-efibootguard/linux.fragment
new file mode 100644
index 0000000000..f9f2c3fd06
--- /dev/null
+++ b/board/pc-efibootguard/linux.fragment
@@ -0,0 +1,15 @@
+# efistub
+CONFIG_EFI=y
+CONFIG_EFI_STUB=y
+CONFIG_EFIVAR_FS=y
+CONFIG_EFI_PARTITION=y
+
+# efibootguard tools (bg_printenv / bg_setenv) use fat partition
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_EFI_PARTITION=y
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
diff --git a/board/pc-efibootguard/post-build.sh b/board/pc-efibootguard/post-build.sh
new file mode 100755
index 0000000000..4f3e3254d8
--- /dev/null
+++ b/board/pc-efibootguard/post-build.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+set -e
+
+# Kernel cmdline to append
+KERNEL_CMDLINE=""
+
+# Create efibootguard boot-a slot configuration
+mkdir -p "${BINARIES_DIR}"/boot-a-part
+printf "boot-a" | iconv -f ascii -t UTF-16LE > "${BINARIES_DIR}"/boot-a-part/EFILABEL
+"${HOST_DIR}"/bin/bg_setenv \
+    --verbose \
+    --watchdog=0 \
+    --filepath="${BINARIES_DIR}"/boot-a-part/BGENV.DAT \
+    --revision=2 \
+    --ustate=OK \
+    --kernel="C:boot-a:bzImage" \
+    --args="root=PARTLABEL=system-a $KERNEL_CMDLINE"
+
+# Create efibootguard boot-a slot configuration (unbootable)
+mkdir -p "${BINARIES_DIR}"/boot-b-part
+printf "boot-b" | iconv -f ascii -t UTF-16LE > "${BINARIES_DIR}"/boot-b-part/EFILABEL
+"${HOST_DIR}"/bin/bg_setenv \
+    --verbose \
+    --watchdog=0 \
+    --filepath="${BINARIES_DIR}"/boot-b-part/BGENV.DAT \
+    --revision=1 \
+    --ustate=FAILED \
+    --kernel="C:boot-b:bzImage" \
+    --args="root=PARTLABEL=system-b $KERNEL_CMDLINE"
+
+# Copy kernel into boot-a.
+cp "${BINARIES_DIR}"/bzImage "${BINARIES_DIR}"/boot-a-part/
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
index 0000000000..7220b2d7ce
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
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc-efibootguard/linux.fragment"
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
