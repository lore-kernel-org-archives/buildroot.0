Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5BCE7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958D340740;
	Sun,  8 Dec 2024 14:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2gnHBxPEfMU; Sun,  8 Dec 2024 14:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E1E64074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1E64074D;
	Sun,  8 Dec 2024 14:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82AE1979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F42D40A45
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fqtc_QkFhHsh for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3D3740A44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D3740A44
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3D3740A44
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa6342a9fb6so47870366b.3
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668712; x=1734273512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OK7yx0OVneQo71/6W1Mo4/BBwBpGz0Q6okf9hBT5IUc=;
 b=Ty3E536jKSKw/GR/l1DjOgTfFKzGmSLiH6IUzYtb3wTuHZar+oGw/rCRvR/NPgsy64
 IwNRaAQbis/cerespDlPOSJiHQp7gjz6ZcDH2r/RCB30QvrFyQDSuMQGG1dOC9hrIWOt
 SFRlqOg5/E+wXDUj2WlNRpBawoZLSnedPlFPLWqrOZYdCChCoViHE4FqW7y8jt4TUsKv
 xUP/ZuIhEajQPa/PQ80IKE5I2/wQcyBahF5ii815NbKLoOSiDNti3libB/Wnokw3CWPp
 8EtEMIaDy5xhn9oRtGXB+QtzNpOZiGFkg1DqeMryBVEbAP3quPEBapOT6aQQ4+JReUHU
 pusA==
X-Gm-Message-State: AOJu0YyGCWks69y5rDGnBYOF6CxZyC0mptpzzQlxmYJXvCuRf+V1cpSk
 fSl2QwrmmV1xskpDvZxAgI5fVWIFJsoCWom9jzB57zove4QXXMugk1D/GA==
X-Gm-Gg: ASbGnct5KdNwm2R4ml9SsTxBi6deK+dXMldit/xCWJ91ZhkAL+kps3K1juDXJpbhUg3
 cYJmDsZjB+sxGd+XJEFn7Si2kPSIk3AMHG2NvLohX/kzUzt2XQFavTyNsnRe1QEyiZ2VqSNPNVU
 OI3pKnsIFMfZbq1G9uVl7/Qg0kDg/VY9QIHgvpW7v8kRRg5QJ2X9rBciIHe7IX/X2RSVFqTKoWb
 HRkNMTpTZoTjOVFI9ccBxf8pdjAN1uWU+rGi7Yk1eU=
X-Google-Smtp-Source: AGHT+IHpxJydjCv92Pf+4beEzTmuynHWUYF+J1WWS4gHCMNNDxeROpdm9sL98ySwy/pH3Pz30hyesA==
X-Received: by 2002:a17:907:980e:b0:a9a:7f84:9408 with SMTP id
 a640c23a62f3a-aa639f9f2eemr386788366b.3.1733668712207; 
 Sun, 08 Dec 2024 06:38:32 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:31 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:57 +0200
Message-ID: <20241208143802.1048266-7-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668712; x=1734273512; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OK7yx0OVneQo71/6W1Mo4/BBwBpGz0Q6okf9hBT5IUc=;
 b=TdjTR9taZFmtJhL0jaa3X/P8r3RNppbNI6JRIelEu6pkVje8gvFj6WU1nPXW/kHezf
 rZn/qEptA0XHPqJ5OYVF3L/05uav0aPq17TGs6hK/NLO+rVcC5b34ib4RuRgJlINDSNm
 m3tMPdXrH/WatD6DslDfSTbJD7MXXwissJ8thP45hCaE9U7AFp1HN3fuxYBoKgqFoeFO
 b811ey94O7RHwGLxTxNsHd/zd58XynunFBjRk9/TXvFes5bn1+gYwbpo6lOUnjQj4VyO
 ULL2nrQUqQ5IvvaXPifQHjKgrOXrWfYZKq3DsIH+E7pLViSNm3ouGO0jVK5vnXSQe+OF
 5n5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TdjTR9ta
Subject: [Buildroot] [PATCH v2 06/11] board/lx2160acex7: new platform
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

Introduce the SolidRun LX2160A-CEX7 platform, which uses the NXP LX2160A
SoC and much of the infrastructure associated with DPAA2 networking.

This defconfig is not functional yet. Patches on various components have
been split out to separate changes, to reduce chances of the mailing
list flagging emails due to excessive size.

More details in board/solidrun/lx2160acex7/readme.txt.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- split out patches on firmware components to separate changes
- enable more Kconfig options required for this board in
  board/solidrun/lx2160acex7/linux.config

 board/solidrun/lx2160acex7/extlinux.conf      |   4 +
 board/solidrun/lx2160acex7/genimage.cfg       |  54 +++++++++
 board/solidrun/lx2160acex7/linux.config       |   5 +
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160acex7/patches/linux/linux.hash      |   2 +
 .../lx2160acex7/patches/uboot/uboot.hash      |   2 +
 board/solidrun/lx2160acex7/post-build.sh      |   8 ++
 board/solidrun/lx2160acex7/readme.txt         | 112 ++++++++++++++++++
 .../udev/rules.d/74-dpaa2-networking.rules    |  12 ++
 .../lx2160acex7/u-boot-environment-sd.txt     |  96 +++++++++++++++
 configs/solidrun_lx2160acex7_defconfig        |  53 +++++++++
 12 files changed, 351 insertions(+)
 create mode 100644 board/solidrun/lx2160acex7/extlinux.conf
 create mode 100644 board/solidrun/lx2160acex7/genimage.cfg
 create mode 100644 board/solidrun/lx2160acex7/linux.config
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/solidrun/lx2160acex7/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/linux.hash
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/uboot.hash
 create mode 100755 board/solidrun/lx2160acex7/post-build.sh
 create mode 100644 board/solidrun/lx2160acex7/readme.txt
 create mode 100644 board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/solidrun/lx2160acex7/u-boot-environment-sd.txt
 create mode 100644 configs/solidrun_lx2160acex7_defconfig

diff --git a/board/solidrun/lx2160acex7/extlinux.conf b/board/solidrun/lx2160acex7/extlinux.conf
new file mode 100644
index 000000000000..018f35a2ec9f
--- /dev/null
+++ b/board/solidrun/lx2160acex7/extlinux.conf
@@ -0,0 +1,4 @@
+label Solidrun LX2160A COM Express Type 7
+  kernel /boot/Image
+  devicetree /boot/fsl-lx2160a-clearfog-cx.dtb
+  append root=PARTUUID=%PARTUUID% rw rootwait cma=256M
diff --git a/board/solidrun/lx2160acex7/genimage.cfg b/board/solidrun/lx2160acex7/genimage.cfg
new file mode 100644
index 000000000000..8a1be0e466e0
--- /dev/null
+++ b/board/solidrun/lx2160acex7/genimage.cfg
@@ -0,0 +1,54 @@
+image sdcard.img {
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
+	partition ddr-phy {
+		in-partition-table = "no"
+		image = "fip_ddr.bin"
+		offset = 8M
+	}
+
+	partition dpaa2-mc {
+		in-partition-table = "no"
+		image = "mc.itb"
+		offset = 10M
+	}
+
+	partition dpaa2-dpl {
+		in-partition-table = "no"
+		image = "dpl.dtb"
+		offset = 13M
+	}
+
+	partition dpaa2-dpc {
+		in-partition-table = "no"
+		image = "dpc.dtb"
+		offset = 14M
+	}
+
+	partition rootfs {
+		bootable = "true"
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/solidrun/lx2160acex7/linux.config b/board/solidrun/lx2160acex7/linux.config
new file mode 100644
index 000000000000..8b8ad7369278
--- /dev/null
+++ b/board/solidrun/lx2160acex7/linux.config
@@ -0,0 +1,5 @@
+CONFIG_BLK_DEV_NVME=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_AMC6821=y
+CONFIG_SENSORS_LTC2978=y
+CONFIG_SENSORS_LTC2978_REGULATOR=y
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..713195e67fb5
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  3f7a1239b8a6be011bf85286f37c333110b5404f0711ab85d66f3b1864c9fc65  atf-lf-5.15.71-2.2.0.tar.gz
diff --git a/board/solidrun/lx2160acex7/patches/linux-headers/linux-headers.hash b/board/solidrun/lx2160acex7/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/solidrun/lx2160acex7/patches/linux/linux.hash b/board/solidrun/lx2160acex7/patches/linux/linux.hash
new file mode 100644
index 000000000000..bfdc2c268d2d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  26e0db3dda786d939269f85df0f605e28cb55646ab8c541fc9bbbb4ab7fd9bf3  linux-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/solidrun/lx2160acex7/patches/uboot/uboot.hash b/board/solidrun/lx2160acex7/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..c2dbfcdc8755
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  3244dd3ae1d1d18ac683e2efc9353d92b496c4b163706b8ea0035344e06554a3  u-boot-lf-5.15.71-2.2.0.tar.gz
diff --git a/board/solidrun/lx2160acex7/post-build.sh b/board/solidrun/lx2160acex7/post-build.sh
new file mode 100755
index 000000000000..0602fa576219
--- /dev/null
+++ b/board/solidrun/lx2160acex7/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/solidrun/lx2160acex7/readme.txt b/board/solidrun/lx2160acex7/readme.txt
new file mode 100644
index 000000000000..17c650c4c0be
--- /dev/null
+++ b/board/solidrun/lx2160acex7/readme.txt
@@ -0,0 +1,112 @@
+*********************
+SolidRun LX2160A-CEx7
+*********************
+
+This file documents the Buildroot support for the NXP Layerscape CEx7 LX2160A
+board made by SolidRun. The CEx7 (COM Express type 7) is a Computer On Module
+which can be plugged into different carrier boards. It is sold either
+separately, or with the HoneyComb LX2 or Clearfog CX LX2 carrier boards, both
+having Mini ITX form factors.
+
+Both the HoneyComb LX2 and Clearfog CX LX2 carrier boards are targeted towards
+networking use cases, with 4 10G-capable SFP+ cages, and the Clearfog
+additionally having a 4x25G-capable QSFP28 cage. In addition, the carrier
+boards have 4x SATA III interfaces, PCIe Gen 3 x8, 2x USB 3.0, an m.2 slot
+compatible with NVMe SSDs, pin headers for traditional PC/NAS cases, and
+regular RJ45 1G Ethernet.
+
+The developer resources for the platform can be found at:
+  - https://solidrun.atlassian.net/wiki/spaces/developer/pages/197493977/NXP+LX2160A+Based+Products
+
+SolidRun keeps build scripts for the firmware on GitHub, which track NXP Linux
+Factory (LF) releases in the form of patches:
+  - https://github.com/SolidRun/lx2160a_build
+
+The most recent functional branch is develop-ls-5.15.71-2.2.0. These patches
+are also included into Buildroot, except for the Linux kernel, where the most
+recent lf-6.6.36-2.1.0 NXP tag is used directly.
+
+The Buildroot support is for the maximal configuration, which is the CEX7
+platform on the Clearfog CX LX2 carrier board.
+
+Build
+=====
+
+First, configure Buildroot for the LX2160A-CEX7 platform:
+
+  make solidrun_lx2160acex7_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl - RCW + ATF BL2 stage
+  - dpc.dtb
+  - dpl.dtb
+  - fip.bin - U-Boot packaged as ATF payload
+  - fip_ddr.bin - DDR PHY firmware
+  - fsl-lx2160a-clearfog-cx.dtb
+  - fsl-lx2160a-honeycomb.dtb
+  - Image
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
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/solidrun/lx2160acex7/genimage.cfg.
+
+Boot the LX2160A-CEX7 board
+===========================
+
+To boot your newly created system:
+- configure the DIP switches for SD boot selection as per SolidRun instructions:
+  https://solidrun.atlassian.net/wiki/spaces/developer/pages/197494288/HoneyComb+LX2+ClearFog+CX+LX2+Quick+Start+Guide#Boot-Select
+- insert the Micro-SD card in the Micro-SD slot of the board
+- put a Micro-USB cable into the Micro-USB connector labeled CONSOLE (CON9)
+  and connect using a terminal emulator at 115200 bps, 8n1.
+- power on the board.
+
+The DPL file only contains a static description for the 1G RGMII RJ45 port
+(endpmac17). By default, this will attempt acquire an IP address over DHCP.
+
+The 4 interfaces routed to the SFP+ cages are endpmac7, endpmac8, endpmac9 and
+endpmac10. Among the more usual networking choices, one could create individual
+DPNIs for each MAC:
+
+$ ls-addni dpmac.7 && ls-addni dpmac.8 && ls-addni dpmac.9 && ls-addni dpmac.10
+
+or a DPSW object to accelerate L2 forwarding between them:
+
+$ ls-addsw --num-ifs=4 --max-fdbs=4 --flooding-cfg=DPSW_FLOODING_PER_FDB \
+	--broadcast-cfg=DPSW_BROADCAST_PER_FDB dpmac.7 dpmac.8 dpmac.9 dpmac.10
+$ ip link add br0 type bridge vlan_filtering 1 && ip link set br0 up
+$ for eth in endpmac7 endpmac8 endpmac9 endpmac10; do \
+	ip link set $eth master br0 && ip link set $eth up; done
+
+Once the runtime configuration is satisfactory, it can be converted back into a
+permanent DPL file which can be plugged back into the build system:
+
+$ restool dprc generate-dpl > dpl-new.dts
+
+Networking options through the QSFP28 cage have not yet been investigated.
diff --git a/board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules b/board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
new file mode 100644
index 000000000000..3c6f6999ecc7
--- /dev/null
+++ b/board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
@@ -0,0 +1,12 @@
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@1", NAME="endpmac1"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@2", NAME="endpmac2"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@3", NAME="endpmac3"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@4", NAME="endpmac4"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@5", NAME="endpmac5"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@6", NAME="endpmac6"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@7", NAME="endpmac7"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@8", NAME="endpmac8"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@9", NAME="endpmac9"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@a", NAME="endpmac10"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@11", NAME="endpmac17"
+SUBSYSTEM=="net", ACTION=="add|change|online|offline|change", DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@12", NAME="endpmac18"
diff --git a/board/solidrun/lx2160acex7/u-boot-environment-sd.txt b/board/solidrun/lx2160acex7/u-boot-environment-sd.txt
new file mode 100644
index 000000000000..e5041fe6a210
--- /dev/null
+++ b/board/solidrun/lx2160acex7/u-boot-environment-sd.txt
@@ -0,0 +1,96 @@
+BOARD=lx2160acex7
+arch=arm
+baudrate=115200
+board=lx2160a
+board_name=lx2160a
+boot_a_script=load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}${script}; env exists secureboot && load ${devtype} ${devnum}:${distro_bootpart} ${scripthdraddr} ${prefix}${boot_script_hdr} && esbc_validate ${scripthdraddr};source ${scriptaddr}
+boot_efi_binary=load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} efi/boot/bootaa64.efi; if fdt addr ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r};else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi
+boot_efi_bootmgr=if fdt addr ${fdt_addr_r}; then bootefi bootmgr ${fdt_addr_r};else bootefi bootmgr;fi
+boot_extlinux=sysboot ${devtype} ${devnum}:${distro_bootpart} any ${scriptaddr} ${prefix}${boot_syslinux_conf}
+boot_net_usb_start=usb start
+boot_pci_enum=pci enum
+boot_prefixes=/ /boot/
+boot_script_dhcp=boot.scr.uimg
+boot_scripts=boot.scr.uimg boot.scr
+boot_syslinux_conf=extlinux/extlinux.conf
+boot_targets=usb0 mmc0 mmc1 scsi0 nvme0 dhcp
+bootargs=console=ttyAMA0,115200 earlycon=pl011,mmio32,0x21c0000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf cma=256M iommu.passthrough=1 arm-smmu.disable_bypass=0
+bootcmd=run distro_bootcmd
+bootcmd_dhcp=setenv devtype dhcp; run boot_net_usb_start; run boot_pci_enum; if dhcp ${scriptaddr} ${boot_script_dhcp}; then source ${scriptaddr}; fi;setenv efi_fdtfile ${fdtfile}; setenv efi_old_vci ${bootp_vci};setenv efi_old_arch ${bootp_arch};setenv bootp_vci PXEClient:Arch:00011:UNDI:003000;setenv bootp_arch 0xb;if dhcp ${kernel_addr_r}; then tftpboot ${fdt_addr_r} dtb/${efi_fdtfile};if fdt addr ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r}; else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi;fi;setenv bootp_vci ${efi_old_vci};setenv bootp_arch ${efi_old_arch};setenv efi_fdtfile;setenv efi_old_arch;setenv efi_old_vci;
+bootcmd_mmc0=devnum=0; run mmc_boot
+bootcmd_mmc1=devnum=1; run mmc_boot
+bootcmd_nvme0=devnum=0; run nvme_boot
+bootcmd_scsi0=devnum=0; run scsi_boot
+bootcmd_usb0=devnum=0; run usb_boot
+bootdelay=3
+console=ttyAMA0,115200
+cpu=armv8
+distro_bootcmd=scsi_need_init=; setenv nvme_need_init; for target in ${boot_targets}; do run bootcmd_${target}; done
+efi_dtb_prefixes=/ /dtb/ /dtb/current/
+emmc_bootcmd=echo Trying load from emmc card..;mmc dev 1; mmcinfo; mmc read $load_addr $kernel_addr_sd $kernel_size_sd ;env exists secureboot && mmc read $kernelheader_addr_r $kernelhdr_addr_sd $kernelhdr_size_sd  && esbc_validate ${kernelheader_addr_r};bootm $load_addr#$BOARD
+eth10addr=00:11:22:44:11:4E
+eth11addr=00:11:22:44:11:4F
+eth12addr=00:11:22:44:11:50
+eth13addr=00:11:22:44:11:51
+eth14addr=00:11:22:44:11:52
+eth15addr=00:11:22:44:11:53
+eth1addr=00:11:22:44:11:45
+eth2addr=00:11:22:44:11:46
+eth3addr=00:11:22:44:11:47
+eth4addr=00:11:22:44:11:48
+eth5addr=00:11:22:44:11:49
+eth6addr=00:11:22:44:11:4A
+eth7addr=00:11:22:44:11:4B
+eth8addr=00:11:22:44:11:4C
+eth9addr=00:11:22:44:11:4D
+ethaddr=00:11:22:44:11:44
+ethprime=DPMAC17@rgmii-id
+fdt_addr=0x81000000
+fdt_addr_r=0x81000000
+fdt_high=0xa0000000
+fdtfile=fsl-lx2160a-cex7.dtb
+fdtheader_addr_r=0x80100000
+hwconfig=fsl_ddr:bank_intlv=auto
+initrd_high=0xffffffffffffffff
+kernel_addr_r=0x81100000
+kernel_addr_sd=0x8000
+kernel_comp_addr_r=0x9f000000
+kernel_comp_size=0x10000000
+kernel_size=0x2800000
+kernel_size_sd=0x14000
+kernel_start=0x1000000
+kernelhdr_addr_sd=0x3000
+kernelhdr_size_sd=0x20
+kernelheader_addr_r=0x80200000
+kernelheader_size=0x40000
+kernelheader_start=0x600000
+load_addr=0xa0000000
+load_efi_dtb=load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} ${prefix}${efi_fdtfile}
+lx2160acex7_vdd_mv=800
+dpl_addr_r=0x80d00000
+mc_fw_addr_r=0x80a00000
+dpc_addr_r=0x80e00000
+mcinitcmd=mmcinfo && mmc read $mc_fw_addr_r 0x5000 0x1200 && mmc read $dpc_addr_r 0x7000 0x800 && mmc read $dpl_addr_r 0x6800 0x800 && fsl_mc start mc $mc_fw_addr_r $dpc_addr_r && fsl_mc lazyapply dpl $dpl_addr_r
+mcmemsize=0x70000000
+fsl_bootcmd_mcinitcmd_set=y
+mmc_boot=if mmc dev ${devnum}; then devtype=mmc; run scan_dev_for_boot_part; fi
+nvme_boot=run boot_pci_enum; run nvme_init; if nvme dev ${devnum}; then devtype=nvme; run scan_dev_for_boot_part; fi
+nvme_init=if ${nvme_need_init}; then setenv nvme_need_init false; nvme scan; fi
+nvme_need_init=true
+ramdisk_addr=0x85100000
+ramdisk_addr_r=0x85100000
+ramdisk_size=0x2000000
+scan_dev_for_boot=echo Scanning ${devtype} ${devnum}:${distro_bootpart}...; for prefix in ${boot_prefixes}; do run scan_dev_for_extlinux; run scan_dev_for_scripts; done;run scan_dev_for_efi;
+scan_dev_for_boot_part=part list ${devtype} ${devnum} devplist; env exists devplist || setenv devplist 1; for distro_bootpart in ${devplist}; do if fstype ${devtype} ${devnum}:${distro_bootpart} bootfstype; then run scan_dev_for_boot; fi; done
+scan_dev_for_efi=setenv efi_fdtfile ${fdtfile}; for prefix in ${efi_dtb_prefixes}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${efi_fdtfile}; then run load_efi_dtb; fi;done;run boot_efi_bootmgr;if test -e ${devtype} ${devnum}:${distro_bootpart} efi/boot/bootaa64.efi; then echo Found EFI removable media binary efi/boot/bootaa64.efi; run boot_efi_binary; echo EFI LOAD FAILED: continuing...; fi; setenv efi_fdtfile
+scan_dev_for_extlinux=if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${boot_syslinux_conf}; then echo Found ${prefix}${boot_syslinux_conf}; run boot_extlinux; echo SCRIPT FAILED: continuing...; fi
+scan_dev_for_scripts=for script in ${boot_scripts}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${script}; then echo Found U-Boot script ${prefix}${script}; run boot_a_script; echo SCRIPT FAILED: continuing...; fi; done
+scriptaddr=0x80000000
+scripthdraddr=0x80080000
+scsi_boot=run scsi_init; if scsi dev ${devnum}; then devtype=scsi; run scan_dev_for_boot_part; fi
+scsi_init=if ${scsi_need_init}; then scsi_need_init=false; scsi scan; fi
+sd_bootcmd=echo Trying load from sd card..;mmcinfo; mmc read $load_addr $kernel_addr_sd $kernel_size_sd ;env exists secureboot && mmc read $kernelheader_addr_r $kernelhdr_addr_sd $kernelhdr_size_sd  && esbc_validate ${kernelheader_addr_r};bootm $load_addr#$BOARD
+soc=fsl-layerscape
+usb_boot=usb start; if usb dev ${devnum}; then devtype=usb; run scan_dev_for_boot_part; fi
+vendor=solidrun
+xspi_bootcmd=echo Trying load from flexspi..;sf probe 0:0 && sf read $load_addr $kernel_start $kernel_size ; env exists secureboot &&sf read $kernelheader_addr_r $kernelheader_start $kernelheader_size && esbc_validate ${kernelheader_addr_r};  bootm $load_addr#$BOARD
diff --git a/configs/solidrun_lx2160acex7_defconfig b/configs/solidrun_lx2160acex7_defconfig
new file mode 100644
index 000000000000..7037821ff127
--- /dev/null
+++ b/configs/solidrun_lx2160acex7_defconfig
@@ -0,0 +1,53 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/solidrun/lx2160acex7/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="lx2160acex7"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_OVERLAY="board/solidrun/lx2160acex7/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/lx2160acex7/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.36-2.1.0)/linux-lf-6.6.36-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config board/solidrun/lx2160acex7/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-lx2160a-clearfog-cx freescale/fsl-lx2160a-honeycomb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="130M"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-5.15.71-2.2.0)/atf-lf-5.15.71-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="lx2160acex7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-5.15.71-2.2.0)/u-boot-lf-5.15.71-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lx2160acex7_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="lx2160acex7_rev2/clearfog-cx/rcw_2000_700_3200_8_5_2_sdhc.rcw"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/solidrun/lx2160acex7/u-boot-environment-sd.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x2000"
+BR2_PACKAGE_QORIQ_DDR_PHY_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY=y
+BR2_PACKAGE_QORIQ_MC_TARGET_LX2160A=y
+BR2_PACKAGE_QORIQ_MC_UTILS=y
+BR2_PACKAGE_QORIQ_MC_UTILS_DPL="lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpl.dtb"
+BR2_PACKAGE_QORIQ_MC_UTILS_DPC="lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpc.dtb"
+BR2_PACKAGE_QORIQ_RESTOOL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
