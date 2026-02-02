Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4873E7315B
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76FDB83C65;
	Mon,  2 Feb 2026 11:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awB3Pq1jTcHm; Mon,  2 Feb 2026 11:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9B6383BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032592;
	bh=KzWdn2YiEFFT+gNQgAzXIDlTLNjv7bbvikH06yjExXU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ua6MX/C67ASG77W2P0D9Uk6KNFkwccY2AKMjQbMtWoMaB5q25IZN5eZw9AdAjI22j
	 4GEKwEg0nqmVdgQuxXvyWkIXR96rSHPmHlP5UJ9+hAeKJu6XmxJBhbwOU2YkjM1afW
	 peJws3ad9CCDwzATBDZCMvtlUBln2JVnav7F+dTm4yrOnMNGW1IWmVD4PLn8zGXhHd
	 H76Fcv4h8tQXgtQxKYMpqpwbKjcPvJPKtezR+S05f/9bVGyKYECrR+cQBi7Qnguvcd
	 enLoQKy1lRj6sigWuEL9ysF4EqZM9DqXTAvS/Of0hOT9Lqbaj9NLHXGsu8sY640gpP
	 Z5xGTOD1O+sbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9B6383BB5;
	Mon,  2 Feb 2026 11:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65EAC1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49F39407FC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQI1YaviBgOm for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50EB7408A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EB7408A1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50EB7408A1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so3021442f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770032587; x=1770637387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u8E/biZ4C1cEeohi2KBYFo2cURfriz7vxFN5fJdeRLw=;
 b=IDjHtBhP0E0QWIZGqGkomlIniSNyKYee7tkeDx9O8DDDCQG5Y2Y0kV7dn7Z+ZfXxO1
 B+EhQdwcW4JGcDYwYBy8+4ZKXsnAcFN1TZm4MsTHTLb9XZ2wogzcvilC3kBcRv/OCkyv
 9OKnx76ykaFPQqRbpdWVhXRoMGmK8qAkzqNNQipxoTEf5V8KvQJc54Zo5STm0u2a9wE0
 Z/TLbi9zkF2HB1pnqC44e31wFBRXtWgHNCQ+DSw/HKTufYTKPP3KjKWWpuJvxSNjDJ2W
 +FC6icKMeiIdUPlGIhOFurLV36uZ3Vp0dms8GZVEeiWTdhHiDj/LwnqBZ/YYkVYZrxtD
 a74Q==
X-Gm-Message-State: AOJu0YxFUwrIyYQZeO4pLw2ykegQUJrpvG99yrFb2/BaocVhvPyUpXop
 WTeZ/07bozo11lHWL4w7vAYWvrSv8Rn2RktX+79/13y5SngJ2tNHhjgchyA8xA==
X-Gm-Gg: AZuq6aL/cTWq11qQhKDj3uqoBTG5i+E+zzj+3YMW3WBU0Tb1oksHput3wuzejxlMKHn
 C153NBohunQiHMB3GnFMp48gIHl7VRcyvLJkModg1EzTwVZZyH1wO9eIloqXXiptTNz8glmWMix
 iwcCm4uiNe/A+9Oaxbmz9WtVSLZc0RK+P73TJ87cC8gf3v6CBXFAuhWyjJR+GLE+ezy0kca4gQ+
 RCnIPgb7h3r7JXXbK1kwhp5pWDJq1jHx0NSIPObUXiw1O80cNcEnxTGz9TkhH0Qb/i7+CiEMemV
 hOA5lQUCv9NsZvMUoJSbQGkaRDXRgSZsjFacLoSOvHrAd0fKQ/y4KvPoN7cONHClIljBPFpZEsk
 KDLftyYy4GRaOxhcwVNh/wHevZDEBnte7WlnhwvNIOpJpYl68MkMCLNfi8u12nFW6T8p0S928sk
 xUd3e9OiodctsmKw==
X-Received: by 2002:a05:6000:1884:b0:435:ae97:b37 with SMTP id
 ffacd0b85a97d-435f3ab5bf5mr17153386f8f.52.1770032587019; 
 Mon, 02 Feb 2026 03:43:07 -0800 (PST)
Received: from freepad.iliad.local ([213.36.9.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf4asm44246777f8f.28.2026.02.02.03.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:43:06 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: olteanv@gmail.com, thomas.petazzoni@bootlin.com,
 Vincent Jardin <vjardin@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Mon,  2 Feb 2026 12:42:53 +0100
Message-ID: <20260202114253.283868-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830173313.164981-1-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770032587; x=1770637387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8E/biZ4C1cEeohi2KBYFo2cURfriz7vxFN5fJdeRLw=;
 b=aYcvixAaGX2zsQaIfAkmPg4mAOKWsio7vYCJikF6dM+z6RBQ7HVgw5d3pUspRbEk5m
 5lWUpMmy5wHMZERagZFgvg//m77SuGZSOPPPnjfLcX7h9NifNzKn4u2i3ApxfOEg06FL
 3q6PMqab6W4W8cWzvWfimWDQ7LbEyFGUPbWrJzHBgm+m+SI8HYU0tTpEBn5hkrlVvc2e
 W5KLhO+p52p0uXpS/HhMqCXN4ZDHacBZ8M1GnijsMydNeKm38QzbjeYCaTRyfKz4Qe05
 ll9vgZ556y9JrTMtghgqjsQRepM/jr+6ooh43L2ImVKqyEulKeav6p1kJPHmocECD8Jy
 Pz7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aYcvixAa
Subject: [Buildroot] [PATCH v5 3/3] board/lx2160ardb: new platform
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

From: Vladimir Oltean <olteanv@gmail.com>

Add Buildroot support for the NXP LX2160A-RDB (reference design board).
This is configured here to boot from the SD card. To my surprise, NXP
RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
boot, so until one is available, include the RCW through board files.

The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
Management Complex firmware is loaded from the filesystem during U-Boot
board init. EFI boot support is disabled since we use extlinux.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Tested-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  11 ++
 board/freescale/lx2160ardb/uboot.config       |   2 +
 configs/lx2160ardb_defconfig                  |  59 ++++++++
 14 files changed, 373 insertions(+)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/lx2160ardb_defconfig

diff --git a/board/freescale/common/env-dpaa2.txt b/board/freescale/common/env-dpaa2.txt
new file mode 100644
index 0000000000..e60bcdeac0
--- /dev/null
+++ b/board/freescale/common/env-dpaa2.txt
@@ -0,0 +1,7 @@
+# DPAA2 MC firmware loading (common to all DPAA2 boards)
+dpl_addr_r=0x80d00000
+dpc_addr_r=0x80e00000
+fsl_bootcmd_mcinitcmd_set=y
+mc_fw_addr_r=0x80a00000
+mcinitcmd=mmc dev 0 && load mmc 0:1 $mc_fw_addr_r /boot/mc.itb && load mmc 0:1 $dpc_addr_r /boot/dpc.dtb && load mmc 0:1 $dpl_addr_r /boot/dpl.dtb && fsl_mc start mc $mc_fw_addr_r $dpc_addr_r && fsl_mc lazyapply dpl $dpl_addr_r
+mcmemsize=0x70000000
diff --git a/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
new file mode 100644
index 0000000000..ac55225673
--- /dev/null
+++ b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
@@ -0,0 +1,29 @@
+SUBSYSTEM!="net", GOTO="fsl_dpaa2_rules_end"
+ACTION!="add|change|online|offline", GOTO="fsl_dpaa2_rules_end"
+
+# Rules that match on objects connected to DPMACs have priority, and are named
+# after those DPMACs.
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@1", NAME="endpmac1", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@2", NAME="endpmac2", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@3", NAME="endpmac3", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@4", NAME="endpmac4", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@5", NAME="endpmac5", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@6", NAME="endpmac6", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@7", NAME="endpmac7", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@8", NAME="endpmac8", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@9", NAME="endpmac9", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@a", NAME="endpmac10", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@11", NAME="endpmac17", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@12", NAME="endpmac18", GOTO="fsl_dpaa2_rules_end"
+
+# Rules that match on DPNI objects which are not connected to DPMACs, but to
+# other DPNIs, DPSW ports, DPDMUX etc. Below is an example to set up a
+# persistent MAC address, which can be extended beyond dpni.0.
+# DRIVERS=="fsl_dpaa2_eth", DEVPATH=="/devices/platform/soc/80c000000.fsl-mc/dprc.[0-9]*/dpni.0/net/*", NAME="endpni0", PROGRAM="/sbin/ip link set %k address 00:01:02:03:04:05"
+
+# Rules that match on DPSW ports not connected to a DPMAC.
+# Below is an example to set up a persistent MAC address, which can be extended
+# beyond dpsw.0.
+# DRIVERS=="fsl_dpaa2_switch", DEVPATH=="/devices/platform/soc/80c000000.fsl-mc/dprc.[0-9]*/dpsw.0/net/*", NAME="endpsw0%s{phys_port_name}", PROGRAM="/sbin/ip link set %k address 00:01:02:03:04:05"
+
+LABEL="fsl_dpaa2_rules_end"
diff --git a/board/freescale/lx2160ardb/extlinux.conf b/board/freescale/lx2160ardb/extlinux.conf
new file mode 100644
index 0000000000..58c2720252
--- /dev/null
+++ b/board/freescale/lx2160ardb/extlinux.conf
@@ -0,0 +1,4 @@
+label NXP LX2160A Reference Design Board
+  kernel /boot/Image
+  devicetree /boot/fsl-lx2160a-rdb.dtb
+  append console=ttyAMA0,115200 root=PARTUUID=%PARTUUID% rw rootwait cma=256M
diff --git a/board/freescale/lx2160ardb/genimage.cfg b/board/freescale/lx2160ardb/genimage.cfg
new file mode 100644
index 0000000000..f895a5ab5e
--- /dev/null
+++ b/board/freescale/lx2160ardb/genimage.cfg
@@ -0,0 +1,47 @@
+image sdcard.img {
+	/* Primary GPT table needs to be moved to a region which does
+	 * not collide with the RCW/PBI location
+	 */
+	hdimage {
+		partition-table-type = "gpt"
+		gpt-location = 6M
+	}
+
+	partition rcw {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition u-boot {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition u-boot-environment {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 5M
+	}
+
+	/* Offset must match PLAT_DDR_FIP_OFFSET from ATF */
+	partition ddr-phy {
+		in-partition-table = "no"
+		image = "fip_ddr.bin"
+		offset = 8M
+	}
+
+	/* Offset must match IN112525_FW_ADDR from U-Boot */
+	partition 25ge-retimer-ucode {
+		in-partition-table = "no"
+		image = "in112525-phy-ucode.txt"
+		offset = 0x980000
+	}
+
+	partition rootfs {
+		bootable = "true"
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..4b761bede3
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/lx2160ardb/patches/linux/linux.hash b/board/freescale/lx2160ardb/patches/linux/linux.hash
new file mode 100644
index 0000000000..f30030c86a
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/uboot/uboot.hash b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..38d54d9922
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/post-build.sh b/board/freescale/lx2160ardb/post-build.sh
new file mode 100755
index 0000000000..4042bf9c7e
--- /dev/null
+++ b/board/freescale/lx2160ardb/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR/bin/uuidgen")"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+# Default DPL and DPC selections for mcinitcmd
+ln -sf dpc-usxgmii.dtb "$TARGET_DIR/boot/dpc.dtb"
+ln -sf dpl-eth.19.dtb "$TARGET_DIR/boot/dpl.dtb"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
new file mode 100644
index 0000000000..4c4b7d9c79
--- /dev/null
+++ b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
@@ -0,0 +1,67 @@
+/*
+ * SerDes Protocol 1 -  19
+ * SerDes Protocol 2 -  5
+ * SerDes Protocol 3 -  2
+ *
+ * Frequencies:
+ * Core     -- 2200 MHz
+ * Platform -- 750  MHz
+ * DDR      -- 3200 MT/s
+ */
+
+#include <../lx2160asi/lx2160a.rcwi>
+
+SYS_PLL_RAT=15
+MEM_PLL_CFG=3
+MEM_PLL_RAT=32
+MEM2_PLL_CFG=3
+MEM2_PLL_RAT=32
+CGA_PLL1_RAT=22
+CGA_PLL2_RAT=22
+CGB_PLL1_RAT=22
+CGB_PLL2_RAT=9
+HWA_CGA_M1_CLK_SEL=1
+HWA_CGB_M1_CLK_SEL=6
+BOOT_LOC=8
+SYSCLK_FREQ=600
+IIC2_PMUX=6
+IIC3_PMUX=2
+IIC4_PMUX=2
+USB3_CLK_FSEL=39
+SRDS_PLL_PD_PLL5=1
+SRDS_PRTCL_S1=19
+SRDS_PRTCL_S2=5
+SRDS_PRTCL_S3=2
+SRDS_PLL_REF_CLK_SEL_S1=2
+SRDS_DIV_PEX_S1=1
+SRDS_DIV_PEX_S2=1
+SRDS_DIV_PEX_S3=1
+
+/* Errata to write on scratch reg for validation */
+#include <../lx2160asi/scratchrw1.rcw>
+
+/* Boot Location Pointer */
+#include <../lx2160asi/bootlocptr_sd.rcw>
+
+/* Errata for SATA controller */
+#include <../lx2160asi/a010554.rcw>
+
+/* common PBI commands */
+#include <../lx2160asi/common.rcw>
+
+/* Modify FlexSPI Clock Divisor value */
+#include <../lx2160asi/flexspi_divisor_32.rcw>
+
+/*PCIe Errata A-009531*/
+#include <../lx2160asi/a009531_PEX3.rcw>
+#include <../lx2160asi/a009531_PEX5.rcw>
+
+/*PCIe Errata A-008851*/
+#include <../lx2160asi/a008851_PEX3.rcw>
+#include <../lx2160asi/a008851_PEX5.rcw>
+
+/*SerDes Errata A-050479*/
+#include <../lx2160asi/a050479.rcw>
+
+/* Errata A-050426 */
+#include <../lx2160asi/a050426.rcw>
diff --git a/board/freescale/lx2160ardb/readme.txt b/board/freescale/lx2160ardb/readme.txt
new file mode 100644
index 0000000000..287285a148
--- /dev/null
+++ b/board/freescale/lx2160ardb/readme.txt
@@ -0,0 +1,129 @@
+**************
+NXP LX2160ARDB
+**************
+
+This file documents the Buildroot support for the LX2160A Reference Design Board.
+
+For more details about the board and the QorIQ Layerscape SoC, see the
+following pages (notably the "LX2160A Reference Design Board Getting Started
+Guide", for which this guide serves as an addition, not a replacement):
+  - https://www.nxp.com/design/design-center/software/qoriq-developer-resources/layerscape-lx2160a-reference-design-board:LX2160A-RDB
+  - https://www.nxp.com/LX2160A
+
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), but has a slower release cadence than LF. The currently used
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+Buildroot, the latest Linux Factory release tag is always used, which may be
+considered pre-release software, as it may contain features which are not yet
+documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - atf (fork), lf-6.12.34-2.1.0
+  - linux (fork), lf-6.12.34-2.1.0
+  - qoriq-ddr-phy-binary (blob), lf-6.12.34-2.1.0
+  - qoriq-firmware-inphi (blob), static commit
+  - qoriq-mc-binary (blob), mc_release_10.39.0
+  - qoriq-mc-utils, mc_release_10.39.0
+  - qoriq-rcw, lf-6.12.34-2.1.0
+  - qoriq-restool, lf-6.12.34-2.1.0
+  - uboot (fork), lf-6.12.34-2.1.0
+
+Build
+=====
+
+First, configure Buildroot for the LX2160ARDB board:
+
+  make lx2160ardb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl - RCW + ATF BL2 stage
+  - dpc-usxgmii.dtb - the default DPC file
+  - dpc-warn.dtb
+  - dpl-2dpni.dtb
+  - dpl-eth.19.dtb - the default DPL file
+  - fip_ddr.bin - DDR PHY firmware
+  - fip.bin - U-Boot packaged as ATF payload
+  - fsl-lx2160a-rdb.dtb
+  - Image
+  - in112525-phy-ucode.txt - Firmware file for 25GbE SFP+ retimer
+  - mc.itb - MC firmware
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
+  - uboot-env.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/sdX
+
+The SD card image can also be programmed from a live system running U-Boot:
+
+  => setenv autoload off && tftp $load_addr sdcard.img && mmc dev 0 && mmc write $load_addr 0 0x80000
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/lx2160ardb/genimage.cfg.
+
+Boot the LX2160ARDB board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW1[1:4] = 0b1000 (select SD Card boot option),
+  or alternatively, run "qixis_reset sd" from a U-Boot booted from a different
+  boot source (NOR, eMMC etc).
+- put a DB9F cable into the UART1 Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+The DPL and DPC files provided by NXP are not maximal configurations.
+They only contain a static description for:
+- the 40GbE QSFP+ MAC2 (which implicitly has MAC_LINK_TYPE_FIXED, because its
+  entry is missing from the DPC, and this means that the link state is provided
+  by the MC firmware)
+- the 1GbE RGMII MAC17 (specified as MAC_LINK_TYPE_PHY in the DPC, which means
+  that the link state is provided by phylink).
+
+The extra interfaces routed to front panel ports are endpmac3, endpmac4,
+endpmac5, endpmac6 and endpmac18. Among the more usual networking choices, one
+could create individual DPNIs for each MAC:
+
+$ ls-addni dpmac.3 && ls-addni dpmac.4 && ls-addni dpmac.5 && ls-addni dpmac.6 && ls-addni dpmac.18
+
+or a DPSW object to accelerate L2 forwarding between them:
+
+$ ls-addsw --num-ifs=4 --max-fdbs=4 --flooding-cfg=DPSW_FLOODING_PER_FDB \
+       --broadcast-cfg=DPSW_BROADCAST_PER_FDB dpmac.3 dpmac.4 dpmac.5 dpmac.6
+$ ip link add br0 type bridge vlan_filtering 1 && ip link set br0 up
+$ for eth in endpmac3 endpmac4 endpmac5 endpmac6; do \
+       ip link set $eth master br0 && ip link set $eth up; done
+
+Once the runtime configuration is satisfactory, it can be converted back into a
+permanent DPL file which can be plugged back into the build system:
+
+$ restool dprc generate-dpl > dpl-new.dts
+
+Using the device tree compiler (dtc), the new DPL can be transformed into a
+.dtb file and deployed as a custom networking configuration upon the next boot.
diff --git a/board/freescale/lx2160ardb/uboot-env.txt b/board/freescale/lx2160ardb/uboot-env.txt
new file mode 100644
index 0000000000..89090edb32
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot-env.txt
@@ -0,0 +1,11 @@
+# Memory addresses for bootstd
+fdt_addr_r=0x90000000
+kernel_addr_r=0x81000000
+scriptaddr=0x80000000
+
+# Boot order and network
+boot_targets=usb0 mmc0 mmc1 scsi0 dhcp
+ethprime=DPMAC1@xgmii
+
+# Boot command (MC already loaded via fsl_bootcmd_mcinitcmd_set)
+bootcmd=bootflow scan
diff --git a/board/freescale/lx2160ardb/uboot.config b/board/freescale/lx2160ardb/uboot.config
new file mode 100644
index 0000000000..e31254d62e
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot.config
@@ -0,0 +1,2 @@
+# Disable EFI boot support - we use extlinux.conf via bootstd instead
+# CONFIG_EFI_LOADER is not set
diff --git a/configs/lx2160ardb_defconfig b/configs/lx2160ardb_defconfig
new file mode 100644
index 0000000000..2346345f32
--- /dev/null
+++ b/configs/lx2160ardb_defconfig
@@ -0,0 +1,59 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/lx2160ardb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="lx2160ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_OVERLAY="board/freescale/common/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/lx2160ardb/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-lx2160a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="130M"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="lx2160ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lx2160ardb_tfa"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/lx2160ardb/uboot.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH="board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+# Minimal U-Boot environment for bootstd with DPAA2 MC firmware init
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/freescale/lx2160ardb/uboot-env.txt board/freescale/common/env-dpaa2.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x2000"
+BR2_PACKAGE_QORIQ_DDR_PHY_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A=y
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH="boot"
+BR2_PACKAGE_QORIQ_MC_UTILS=y
+BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE="lx2160a/LX2160A-RDB/dpc-usxgmii lx2160a/LX2160A-RDB/dpc-warn"
+BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE="lx2160a/LX2160A-RDB/dpl-2dpni lx2160a/LX2160A-RDB/dpl-eth.19"
+BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH="boot"
+BR2_PACKAGE_QORIQ_RESTOOL=y
+BR2_PACKAGE_QORIQ_FIRMWARE_INPHI=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
