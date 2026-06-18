Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44525CD98E4
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 01:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E9B280C0B;
	Thu, 18 Jun 2026 01:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siacwnyj-aKl; Thu, 18 Jun 2026 01:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB8F80B39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781745831;
	bh=hhzdwVI6349prdiBG0lMoKwdLEdKPLs+H2JLh2pB1/k=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UZmDbz0xuN6fuQjQjiMx/275kuBKsqLIWsMgDW+AlKvu00xrE8it9KHD3I5U5zllk
	 Q1CkEBxA6auqa3hkNAdpgmAvqhU3UL4g2AS13/EenVGUNgjIiSuUtyREKYsatxnQGJ
	 yrHyK3+VibhvL4YgBFS2M/MuYECRxm6qLh6QtIErt+J23t1twuidQQFbP0dvHcMMso
	 ilC6EQcKxLr1TQeNiRcKxmEjMLdoMZ9z9FCbC6lv9sl8Pcx10aLmqGTq0S0CuRS3sK
	 vuZCD6ZRm6JZLybHLTsBQjnv6L4ffQnpWpX4+5t1j6bctpgxUAikb4wz053LQl58l6
	 sJYLxpS2qU6pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB8F80B39;
	Thu, 18 Jun 2026 01:23:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FC31F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 575D040706
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq24NwZLoEhb for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 01:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10F8340528
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10F8340528
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10F8340528
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49230a567a9so1403835e9.0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781745824; x=1782350624;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UEEkCge5YHPQgXn53K7VmkcG7bK1PoyEH0zkOH9i5VY=;
 b=AktdlWUU7rNOBLHdsJSAmwwOMXHw2ysAItc0ZikFqvY2bFvsTFt81OUY+I83KlgHMJ
 s5qtGThPV2LGfQFfalevkvfp6MLmZlxrMk/pgZ0lNRvOnK9TKdivm0UNqSy95a5gSQCv
 oz/RTnU/7CYIVrXY+YSHbDaY7WirXrF1vEwaKWcR9O7PV0wrBZUZ3msIQ/6YyrPQArCo
 MG1zOYbWQlCQmAjs2myWaU/VfDEbK0suJwCRdq7uRh5rq4jSB9NXpQZBPTc2iI2YGScW
 D26WB8spiH0VdEQgKXO11f0ecdZdX62JBzUqfDukqWdDutuViled/y+sLtZRb4c6t4pk
 lyNg==
X-Gm-Message-State: AOJu0YyYGZoh7Gp3EH/GZ4vkre9fmu48eRKL352s1a77ZyD9NqPULgAI
 +cNoKpoZlrspeSQE0GdzmvKmz4QcC6co4+t+9iSGfrfuwovp+la/ugsqXOY1tkuMHQA=
X-Gm-Gg: Acq92OEtcFwt2y7TC9zvMPZf46vw4YHljRu1WuGrJv66dehx61nG9iwT+YmwVpxlsPr
 yQ9OJuBR1Us62XNFDp0/ATN5JdwHCP76C7bVw+1noeXfn+u2kTFO5D220hmo0gz6WjLNzP3o6Gl
 774i5+D5bl7PwmLuJRme7xF0n4FQemAMXalbnBfbQIOX6v3UY5Vk7NJ1zuS8d4ZtkJ9pFSVhPtp
 aNSBu56wEWX+kyo3/qkekjbGUa8+j5EVPRgXAz611YczB4GVfebCh9HSjqPV6qjYQDIFEP/jS/8
 Bu1FDBLA88hw9bMG79OEVNaItIG+lQ5EcERZ4qFJIOVtVF5SDoXLtR9j4HTt3yBk+6JY6oPi/eS
 gaRxp1wsAudnw59BQc5MiqAUF6Q4EwCt8wpMZMNShY7ovJybz2Il8tgV/8hA0M9QxJH9gOihKFV
 QHkPnGf3YEDAAHEw6TqVqxMtNove2+Pmn+5jAYPheHXl4WkKgnv6G89THCrM5vP9Brdtf5MOKlW
 oAaqbxCNKaFBhIeb4x7uMso1zCYmog1wnFp+h16lYoN+Na3FyRJoB8LQThlEAtlxEdR57mYrAFL
 WBVDgtQnoVp2eRkR8+UtLAc3s98yy0pxk9D97ubG91m/HTJhDPo/VdU0U+L114Rrbmf6HA==
X-Received: by 2002:a05:600c:c83:b0:490:bde3:d112 with SMTP id
 5b1f17b1804b1-492334285c6mr103321395e9.30.1781745823723; 
 Wed, 17 Jun 2026 18:23:43 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97a07sm350915475e9.14.2026.06.17.18.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 18:23:43 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Thu, 18 Jun 2026 02:23:31 +0100
MIME-Version: 1.0
Message-Id: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-3-65fa5eb2acf4@gmail.com>
References: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
In-Reply-To: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23449; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=7a0AUpWZPDipFx2amDYOCNLf5t4OqsfqR+xXW6FMrgM=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqM0ibxqQP3EXa9+mMAFt1zZb6YNLqbj2Y0MRNo
 Y+ckKdCNwKJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCajNImwAKCRBjTcTwaHBG
 +P9UD/9FK3dqTDiUURjKWcYky1FYmD4beuiBbFD26QDuH3dl70hzCoHPZag1wC6JWuy1/Grqkmz
 u3hw9nA8CgL3HhI54609lh/Onb+TCDMxq+kyifxpmgR1dEjlJnIUFzLwpim7z42wtTBbtKu3xtz
 YrY0gUlgyCvxTglfxeCWVusIWwsHLQJY4xP5128rHPZ5VITMgmyfHkB2fXQsinMr8IIWnM8OAuJ
 6Qwf5eybZSjVhvI7jiwx3y/ACWIrqltRxHeXyhAUjDws0hJ2o98usKr7qoyh/kmzKk5pkvUOgQW
 bTB3YtET0CbQ1XCkGEA5x6aaHYuQcCVlGFQEldot2gWpbTQbuLj1dZbibUrAa/Kkxo6SESDsgFA
 7vHE4twgPFGRebG+C9VVZ9KnqdYXa93PrP73u+od9rBxdI/nQ8ePbRX3Ktth8PJraWmSYTo8bh6
 6aIYvL4aTqz9KvpAvjAj/pImnmg/vlPg2BMzN0VnBJaTRAmgAREDUyh7MexcPnhpnHDxgRDfuYb
 HNF/PEbJ5NMfhMeW2w4W+k4HbkG2/z6Fr6b86dUfmc9GHa7iQuHExz8Sd0CUqa8zZZG4W+eci7o
 haMUy62zc7anAhCmIY9450HuP46uuhbGuzHLmkj3V9wAtzngj3ajiBV7pFVPqg68E3TBeBggz6u
 jRLTQQ4k06bC4Mg==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781745824; x=1782350624; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UEEkCge5YHPQgXn53K7VmkcG7bK1PoyEH0zkOH9i5VY=;
 b=FTfI9/j/C4qZa6B8AzJevJPm2bjuPuOAEZU56RaSB0h79h/679meh/L95eYMNDAFp7
 BfY4FjgpS37AL3deVDs544tec/smYj9ksAr7HhWGoVEzweRRPf32FiuI2Kt+jz+ZWWlJ
 r9KnbyLN+Z6/KVEgPfzMPip26dd+GAVA5yOmhMYSO4f/rJaWbLQsnjF0g11CXDcOjAkZ
 /jhP73yNmUo0l6I2m82jYSH9yO1PZAEcdQc6yEPqJDfvLtZff/Zl3Vc1/X6pd1AaBIOb
 /m65S9DDjclmefFIDYIGrUfB3oQJaARWiF6ZuphdUERCnJdkriIM8GjluUjGi8Z4PbM9
 UMQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FTfI9/j/
Subject: [Buildroot] [PATCH v4 3/3] board/pc-efibootguard: add example EFI
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
be signed for Secure Boot. Enable the UKI generation and signing in the
example recipe.

Also add instructions to boot the example image in QEMU.

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                                         |   2 +
 board/pc-efibootguard/genimage.cfg                 |  56 ++++
 board/pc-efibootguard/linux.fragment               |  29 +++
 board/pc-efibootguard/post-image.sh                | 162 ++++++++++++
 board/pc-efibootguard/readme.txt                   | 281 +++++++++++++++++++++
 .../etc/systemd/system.conf.d/10-watchdog.conf     |   7 +
 configs/pc_x86_64_efibootguard_defconfig           |  24 ++
 7 files changed, 561 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8cba141a77..e69923dcd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -706,7 +706,9 @@ F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
 N:	Christopher Obbard <obbardc@gmail.com>
+F:	board/pc-efibootguard/
 F:	boot/efibootguard/
+F:	configs/pc_x86_64_efibootguard_defconfig
 F:	package/dtui/
 F:	package/osslsigncode/
 
diff --git a/board/pc-efibootguard/genimage.cfg b/board/pc-efibootguard/genimage.cfg
new file mode 100644
index 0000000000..096901b27d
--- /dev/null
+++ b/board/pc-efibootguard/genimage.cfg
@@ -0,0 +1,56 @@
+image EFI.vfat {
+	vfat {}
+
+	size = 16M
+	srcpath = "output/images/efi-part"
+}
+
+image boot-a.vfat {
+	vfat {}
+
+	size = 32M
+	srcpath = "output/images/boot-a-part"
+}
+
+image boot-b.vfat {
+	vfat {}
+
+	size = 32M
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
+	# boot-b is an empty placeholder
+	partition boot-b {
+		partition-type-uuid = fat32
+		image = "boot-b.vfat"
+	}
+
+	partition system-a {
+		partition-type-uuid = root-x86-64
+		image = "rootfs.ext4"
+		size = 120M
+	}
+
+	# system-b is an empty placeholder
+	partition system-b {
+		partition-type-uuid = root-x86-64
+		size = 120M
+	}
+}
diff --git a/board/pc-efibootguard/linux.fragment b/board/pc-efibootguard/linux.fragment
new file mode 100644
index 0000000000..ec9dbc1e12
--- /dev/null
+++ b/board/pc-efibootguard/linux.fragment
@@ -0,0 +1,29 @@
+# Build the kernel with the EFI Stub.
+CONFIG_EFI=y
+CONFIG_EFI_STUB=y
+CONFIG_EFIVAR_FS=y
+CONFIG_EFI_PARTITION=y
+
+# EFI Boot Guard user-space tools (bg_printenv/bg_setenv) modifies FAT config
+# partitions.
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+
+# Enable a text console on the framebuffer handed over by UEFI GOP.
+# On systems where the firmware exposes the boot display as a GOP framebuffer,
+# Linux registers it via sysfb/simple-framebuffer and simpledrm binds to it.
+# This includes QEMU/OVMF with the default emulated VGA display.
+CONFIG_SYSFB_SIMPLEFB=y
+CONFIG_DRM=y
+CONFIG_DRM_SIMPLEDRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+
+# Enable the Intel 6300ESB watchdog driver (which can be emulated by QEMU).
+CONFIG_WATCHDOG=y
+CONFIG_I6300ESB_WDT=y
diff --git a/board/pc-efibootguard/post-image.sh b/board/pc-efibootguard/post-image.sh
new file mode 100755
index 0000000000..2b2a8399f3
--- /dev/null
+++ b/board/pc-efibootguard/post-image.sh
@@ -0,0 +1,162 @@
+#!/bin/sh
+# Generates a raw disk image with an ESP containing the EFI Boot Guard
+# bootloader binary, two EFI Boot Guard slot config partitions and two
+# filesystem partitions. This allows for "A/B" booting.
+#
+# The first slot is populated with the filesystem generated by the Buildroot
+# build and the second slot is an empty placeholder.
+#
+# With SIGN_BINARIES=1, the bootloader and kernel artifacts are signed with
+# user-generated keys. Otherwise, the artifacts are installed unsigned.
+#
+# With UKI=1, EFI Boot Guard is configured to boot a Unified Kernel Image
+# (kernel & command line bundled into one binary) which is suitable for secure
+# boot. Otherwise, EFI Boot Guard will boot the kernel & command line specified
+# in the slot config.
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+
+# Kernel command line parameters.
+# The rootfs is mounted using a hard-coded partlabel for simplicity.
+# This will need to be modified when generating images for other slots.
+KERNEL_CMDLINE="root=PARTLABEL=system-a"
+
+# Hardware watchdog timeout, in seconds, armed by EFI Boot Guard before it
+# boots the kernel. Set to 0 to disable arming the watchdog.
+WATCHDOG_TIMEOUT=120
+
+# Kernel image format.
+# Set to 1 to build a Unified Kernel Image (kernel & command line bundled into
+# one PE binary).
+# Set to 0 to use the raw kernel image instead.
+UKI=1
+
+# Sign EFI Boot Guard binary and kernel artifact.
+# Set to 1 to sign the artifacts; 0 to disable signing.
+SIGN_BINARIES=1
+
+# Staging directory for the EFI System Partition contents.
+EFI_DIR="${BINARIES_DIR}/efi-part"
+
+# Persistent location for the user's UEFI Secure Boot keys.
+KEYS_DIR="${BINARIES_DIR}/secure-boot-keys"
+
+# Sign a PE/EFI binary with the db key.
+sign_pe() {
+	input="$1"
+	output="$2"
+	"${HOST_DIR}/bin/osslsigncode" sign -h sha256 \
+		-key "${KEYS_DIR}/db.key" \
+		-certs "${KEYS_DIR}/db.crt" \
+		-in "$input" \
+		-out "$output"
+}
+
+# Generate EFI Boot Guard slot configuration.
+generate_slot_config() {
+	slot_dir="$1"
+	label="$2"
+	revision="$3"
+	ustate="$4"
+	kernel="$5"
+	args="${KERNEL_CMDLINE}"
+
+	# When booting a UKI, EFI Boot Guard ignores the kernel command line set in
+	# the slot config and instead reads the command line embedded in the UKI.
+	# If the slot config has non-empty args entry, EFI Boot Guard warns during
+	# boot. So if we are building a UKI, generate the slot config with an empty
+	# args parameter.
+	if [ "${UKI}" -eq 1 ]; then
+		args=""
+	fi
+
+	mkdir -p "${slot_dir}"
+	printf "%s" "${label}" | iconv -f ascii -t UTF-16LE > "${slot_dir}/EFILABEL"
+
+	"${HOST_DIR}/bin/bg_setenv" \
+		--verbose \
+		--watchdog="${WATCHDOG_TIMEOUT}" \
+		--filepath="${slot_dir}/BGENV.DAT" \
+		--revision="${revision}" \
+		--ustate="${ustate}" \
+		--kernel="${kernel}" \
+		--args="${args}"
+}
+
+# Reset staging directories.
+rm -rf \
+	"${EFI_DIR}" \
+	"${BINARIES_DIR}/boot-a-part" \
+	"${BINARIES_DIR}/boot-b-part"
+mkdir -p \
+	"${EFI_DIR}/EFI/BOOT" \
+	"${BINARIES_DIR}/boot-a-part" \
+	"${BINARIES_DIR}/boot-b-part"
+
+# If signing is enabled, sign the EFI Boot Guard binary and install it into the
+# ESP. Otherwise install the unsigned binary into the ESP.
+if [ "${SIGN_BINARIES}" -eq 1 ]; then
+	# Ensure the Secure Boot keys exist.
+	# These must be generated by the user beforehand; see the readme for
+	# instructions.
+	for key in db.key db.crt PK.cer KEK.cer db.cer; do
+		if [ ! -f "${KEYS_DIR}/${key}" ]; then
+			echo "ERROR: Secure Boot key '${KEYS_DIR}/${key}' not found." >&2
+			echo "Generate the Secure Boot keys before building; see the readme." >&2
+			exit 1
+		fi
+	done
+
+	# Sign the EFI Boot Guard bootloader and install it into the ESP.
+	sign_pe "${BINARIES_DIR}/efibootguardx64.efi" \
+		"${EFI_DIR}/EFI/BOOT/BOOTX64.EFI"
+
+	# Copy the certificates into the ESP to allow users to enrol them into UEFI
+	# firmware.
+	mkdir -p "${EFI_DIR}/keys"
+	cp "${KEYS_DIR}/PK.cer" "${KEYS_DIR}/KEK.cer" "${KEYS_DIR}/db.cer" \
+		"${EFI_DIR}/keys/"
+else
+	# If unsigned, just install the bootloader binary into the ESP.
+	install -m 0644 "${BINARIES_DIR}/efibootguardx64.efi" \
+		"${EFI_DIR}/EFI/BOOT/BOOTX64.EFI"
+fi
+
+# Build a Unified Kernel Image (bundling the EFI Boot Guard stub, raw kernel and
+# command line).
+if [ "${UKI}" -eq 1 ]; then
+	"${HOST_DIR}/bin/bg_gen_unified_kernel" \
+		"${BINARIES_DIR}/kernel-stubx64.efi" \
+		"${BINARIES_DIR}/bzImage" \
+		"${BINARIES_DIR}/kernel-uki.efi" \
+		--cmdline "${KERNEL_CMDLINE}"
+
+	KERNEL_IMAGE="kernel-uki.efi"
+else
+	# If not building a UKI, use the raw kernel image.
+	KERNEL_IMAGE="bzImage"
+fi
+
+# Copy the kernel image into boot-a (optionally signing the image).
+if [ "${SIGN_BINARIES}" -eq 1 ]; then
+	sign_pe "${BINARIES_DIR}/${KERNEL_IMAGE}" "${BINARIES_DIR}/boot-a-part/${KERNEL_IMAGE}"
+else
+	cp "${BINARIES_DIR}/${KERNEL_IMAGE}" "${BINARIES_DIR}/boot-a-part/${KERNEL_IMAGE}"
+fi
+
+# Generate the EFI Boot Guard slot configuration.
+# Set boot-a ustate=OK, the path to the kernel binary and (optionally; if not
+# booting a UKI) the kernel command line parameter.
+generate_slot_config \
+	"${BINARIES_DIR}/boot-a-part" \
+	"boot-a" "2" "OK" \
+	"C:boot-a:${KERNEL_IMAGE}"
+
+# Set boot-b ustate=FAILED so EFI Boot Guard doesn't boot it.
+generate_slot_config \
+	"${BINARIES_DIR}/boot-b-part" \
+	"boot-b" "1" "FAILED" ""
+
+# Generate the disk image.
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/pc-efibootguard/readme.txt b/board/pc-efibootguard/readme.txt
new file mode 100644
index 0000000000..f0fdd675bd
--- /dev/null
+++ b/board/pc-efibootguard/readme.txt
@@ -0,0 +1,281 @@
+EFI Boot Guard Example Recipe
+=============================
+
+This recipe creates a basic x86 disk image using EFI Boot Guard[1] as the
+bootloader with two root filesystem slots.
+
+The image is intended to demonstrate a typical A/B boot layout. The first slot
+is populated with the root filesystem generated as part of the Buildroot build.
+The second slot is intentionally left empty so that a future update tool can
+install an alternate root filesystem there.
+
+The recipe also creates the EFI system partition and installs the EFI Boot Guard
+bootloader and configuration needed to select and boot one of the available slots.
+Each slot has its own EFI Boot Guard environment, containing the kernel image and
+configuration.
+
+This example is deliberately minimal. It is intended as a reference for users who
+want to integrate EFI Boot Guard into their own platform-specific images, rather
+than as a complete production-ready setup. It was designed to be run in QEMU and
+may need additional changes to run on real hardware.
+
+By default this example is built with UEFI Secure Boot support enabled. In that
+mode, both the EFI Boot Guard and kernel binaries are signed during image
+generation so that they can be verified by the firmware before execution.
+
+Secure Boot support in this recipe is primarily intended for development and
+testing. These instructions contain the steps to generate signed EFI binaries,
+but a production system should use platform-specific key management, key
+enrolment and signing infrastructure, which is out of scope of this document.
+In particular, the example keys must not be reused for production images.
+
+
+Build the image
+===============
+
+Configure Buildroot with:
+
+  $ make pc_x86_64_efibootguard_defconfig
+
+Build the image with:
+
+  $ make
+
+The raw disk image is available under output/images/disk.img.
+
+
+Emulation in QEMU
+=================
+
+Emulate the system in QEMU with:
+
+  $ qemu-system-x86_64 \
+      -machine q35,smm=on \
+      -m size=512M \
+      -drive if=pflash,format=raw,readonly=on,file=</path/to/OVMF_CODE.fd> \
+      -drive file=output/images/disk.img,if=virtio,format=raw \
+      -boot menu=on \
+      -device i6300esb \
+      -action watchdog=reset
+
+Note that </path/to/OVMF_CODE.fd> needs to point to a valid x86_64 UEFI firmware
+image for QEMU. It may be provided by your distribution as an edk2 or OVMF
+package, in a path such as /usr/share/OVMF/OVMF_CODE_4M.fd on Debian.
+
+
+Boot process & slot configuration
+=================================
+
+This example uses EFI Boot Guard as the first-stage UEFI boot application for
+A/B boot selection. The disk image contains a shared EFI System Partition, two
+small EFI Boot Guard configuration partitions and two root filesystem slots:
+
+* EFI System Partition ("EFI")
+  Contains the EFI Boot Guard bootloader binary.
+
+* EFI Boot Guard config partition A ("boot-a")
+  Contains the boot environment for slot A, including the EFI Boot Guard slot
+  configuration and kernel image built by Buildroot.
+
+* EFI Boot Guard config partition B ("boot-b")
+  Contains the boot environment for slot B, including the EFI Boot Guard slot
+  configuration to disable booting from slot B.
+
+* rootfs A ("system-a")
+  First root filesystem slot. Populated with the target filesystem built by
+  Buildroot.
+
+* rootfs B ("system-b")
+  Second root filesystem slot. Not populated by default.
+
+The firmware first loads EFI Boot Guard from the EFI System Partition. EFI
+Boot Guard then reads its slot metadata from the configuration partitions and
+selects the best bootable slot. Each slot has an EFI Boot Guard environment
+file containing the slot label, revision, ustate, watchdog timeout, boot file
+and optional kernel arguments.
+
+The slot's ustate controls whether a slot is considered bootable. A newly installed
+slot is normally marked as pending/testing and, if enabled in the slot config,
+a watchdog is started on the device. EFI Boot Guard attempts to boot the slot.
+
+Once Linux has booted successfully, user-space must mark the slot's ustate as
+OK. If the system fails to boot or the watchdog expires before the slot is
+confirmed, EFI Boot Guard can fall back to the previous working slot or refuse
+to boot.
+
+The slot environments are generated at image assembly time using the EFI Boot
+Guard host tools. They are intentionally generated outside the target rootfs
+because they describe the final disk image layout rather than files installed
+inside a single root filesystem. By default, the recipe sets slot A with ustate
+of OK.
+
+For more information on EFI Boot Guard configuration, see the upstream
+documentation[1].
+
+
+Watchdog
+========
+
+EFI Boot Guard can arm a hardware watchdog before handing control to Linux. The
+watchdog protects against a system that starts booting a bad slot but then hangs
+before userspace can report success or failure.
+
+If Linux boots correctly, userspace must take over or disarm the watchdog before
+the timeout expires. With systemd this is usually done by enabling the runtime
+watchdog, for example by setting RuntimeWatchdogSec. The runtime watchdog timeout
+should be shorter than the EFI Boot Guard watchdog timeout so that systemd starts
+feeding the watchdog in time.
+
+By default, the recipe configures EFI Boot Guard to arm a 120 second watchdog and
+enables a systemd runtime watchdog value of 60 seconds to give Linux enough time
+to boot and take over the device.
+
+EFI Boot Guard has limited support for hardware watchdogs and will refuse to
+boot the slot if no supported hardware watchdog is found and the slot has the
+watchdog parameter configured to >0. To disable the watchdog at image generation
+time, set WATCHDOG_TIMEOUT in post_image.sh to 0. This can be useful during
+development but removes one of the main safety mechanisms for A/B rollback
+testing.
+
+When testing under QEMU, an emulated watchdog can be enabled with:
+
+  -device i6300esb
+  -action watchdog=reset
+
+This causes QEMU to reset the virtual machine if the watchdog expires.
+
+
+Unified Kernel Image (UKI)
+==========================
+
+By default this recipe builds the boot payload as a Unified Kernel Image (UKI).
+A UKI bundles a kernel, initramfs, device tree(s) and kernel command line into a
+single PE/COFF EFI binary.
+
+For this example recipe, only the kernel image and command line are bundled
+into the UKI binary.
+
+When UKI support is disabled, EFI Boot Guard loads a normal kernel image and
+passes the kernel command line from the EFI Boot Guard environment.
+
+UKIs are useful when combined with Secure Boot because the whole boot payload
+can be signed as one EFI binary.
+
+
+UEFI Secure Boot
+================
+
+The recipe by default will sign the EFI binaries with Secure Boot keys. When
+enabled, the recipe:
+
+* uses Secure Boot keys: a Platform Key (PK), Key Exchange Key (KEK) and signature
+  database (db) key/certificate pair.
+* signs the EFI Boot Guard EFI binary and the UKI (or other EFI boot payload)
+  with the db key.
+* installs the signed EFI binaries.
+* copies the DER certificates needed for UEFI firmware enrolment into the EFI
+  System Partition under \keys.
+
+Secure Boot verifies EFI binaries before they are executed. In this setup, the
+firmware verifies EFI Boot Guard and EFI Boot Guard then loads the selected
+signed boot payload.
+
+The following instructions can be ran on the host to generate dummy self-signed
+key/certificate pairs. These are intended for testing only and must not be used
+in production:
+
+  $ export KEYS_DIR=output/images/secure-boot-keys
+  $ mkdir -p "${KEYS_DIR}"
+  $ for name in PK KEK db; do
+      openssl req -new -x509 -newkey rsa:2048 -sha256 \
+        -days 3650 -nodes \
+        -subj "/CN=pc-efibootguard ${name}/" \
+        -keyout "${KEYS_DIR}/${name}.key" \
+        -out "${KEYS_DIR}/${name}.crt"
+      openssl x509 \
+        -in "${KEYS_DIR}/${name}.crt" \
+        -outform DER \
+        -out "${KEYS_DIR}/${name}.cer"
+    done
+
+The generated keys are stored under output/images/secure-boot-keys/. They are
+created once and reused on subsequent builds. These files are removed with
+"make clean".
+
+
+Testing under QEMU
+------------------
+
+Secure Boot must be enforced by the firmware, which in QEMU requires the
+"secboot" OVMF build together with SMM and a q35 machine. The OVMF variables
+file is persistent, so make a fresh writable copy of the variable store first.
+If the disk layout, boot entries or enrolled keys change, remove the old
+OVMF_VARS.fd and copy a fresh one before retesting.
+
+  $ cp </path/to/OVMF_VARS_4M.fd> OVMF_VARS.fd
+
+Then run QEMU:
+
+  $ qemu-system-x86_64 \
+      -machine q35,smm=on \
+      -m 512M \
+      -global driver=cfi.pflash01,property=secure,value=on \
+      -drive if=pflash,format=raw,unit=0,readonly=on,file=</path/to/OVMF_CODE.secboot.fd> \
+      -drive if=pflash,format=raw,unit=1,file=OVMF_VARS.fd \
+      -drive file=output/images/disk.img,if=virtio,format=raw \
+      -boot menu=on \
+      -device i6300esb \
+      -action watchdog=reset
+
+On the very first boot Secure Boot is not yet enabled and the keys must first be
+enrolled once. The DER certificates are copied into the EFI System Partition
+under \keys for convenience. Press ESC at the logo and choose "EFI Firmware Setup"
+to reach the UEFI menu, then enrol the keys:
+
+  Device Manager
+    -> Secure Boot Configuration
+      -> Secure Boot Mode -> Custom Mode
+      -> Custom Secure Boot Options
+        -> DB Options    -> Enroll Signature -> Enroll Signature Using File
+                            -> select FS0:\keys\db.cer  -> Commit Changes
+        -> KEK Options   -> ... FS0:\keys\KEK.cer       -> Commit Changes
+        -> PK Options    -> ... FS0:\keys\PK.cer        -> Commit Changes
+
+Enrol the db and KEK before the PK. Enrolling the PK switches the firmware into
+User Mode and activates Secure Boot. Reset the machine - the firmware now
+verifies the signed EFI Boot Guard bootloader, which in turn loads the signed
+kernel image.
+
+
+EFI Boot Guard user-space tools
+===============================
+
+The example image includes the EFI Boot Guard user-space tools. These can be
+used to inspect and update the slot configuration.
+
+bg_printenv prints the EFI Boot Guard slot config (of all slots):
+
+  # bg_printenv
+
+
+bg_setenv can be used to update a slot's configuration, including its ustate and
+revision. For example, the following commands mark both slots as OK and make
+slot 0 (e.g. the first configuration partition) the preferred slot to boot:
+
+  # bg_setenv --preserve --part 0 --ustate OK --revision 1
+  # bg_setenv --preserve --part 1 --ustate OK --revision 0
+
+
+Note that without --preserve bg_setenv will rewrite the slot config rather than
+updating only the options specified on the command line. Any omitted settings
+may be written with their default or empty values, so make sure to pass all
+options to avoid producing an incomplete environment.
+
+An update system could use these tools to switch the preferred boot slot after
+installing an update and to mark a slot's ustate as OK once the newly installed
+slot boots successfully.
+
+For more information on configuring EFI Boot Guard, see the upstream
+documentation[1].
+
+[1]: https://github.com/siemens/efibootguard/blob/master/README.md
diff --git a/board/pc-efibootguard/rootfs-overlay/etc/systemd/system.conf.d/10-watchdog.conf b/board/pc-efibootguard/rootfs-overlay/etc/systemd/system.conf.d/10-watchdog.conf
new file mode 100644
index 0000000000..4ad3f4ceb8
--- /dev/null
+++ b/board/pc-efibootguard/rootfs-overlay/etc/systemd/system.conf.d/10-watchdog.conf
@@ -0,0 +1,7 @@
+[Manager]
+# Arm the hardware watchdog and ping it.
+# The hardware timeout is set to RuntimeWatchdogSec and is pinged at half
+# that interval.
+RuntimeWatchdogSec=1min
+# Keep the watchdog armed across reboot/shutdown so a hung shutdown resets.
+RebootWatchdogSec=5min
diff --git a/configs/pc_x86_64_efibootguard_defconfig b/configs/pc_x86_64_efibootguard_defconfig
new file mode 100644
index 0000000000..44d8c9c860
--- /dev/null
+++ b/configs/pc_x86_64_efibootguard_defconfig
@@ -0,0 +1,24 @@
+BR2_x86_64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_INIT_SYSTEMD=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_ROOTFS_OVERLAY="board/pc-efibootguard/rootfs-overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc-efibootguard/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="x86_64"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc-efibootguard/linux.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EFIBOOTGUARD=y
+BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS=y
+BR2_TARGET_HOST_EFIBOOTGUARD=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_OSSLSIGNCODE=y

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
