Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D48CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 12:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DE18405A;
	Thu, 14 Aug 2025 12:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyeUvwgA2gc9; Thu, 14 Aug 2025 12:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F28A84093
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F28A84093;
	Thu, 14 Aug 2025 12:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AC0B271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 049B8840F1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIIBunhyCQDf for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=314aab60a=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 503D483E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503D483E65
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 503D483E65
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
X-CSE-ConnectionGUID: TQIC9rrWQ0uPj2LhEUDt9g==
X-CSE-MsgGUID: D0Jebh1BQeWSfTQL7duQ4g==
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="45784400"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2025 05:12:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 14 Aug 2025 05:12:37 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 14 Aug 2025 05:12:35 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>
Date: Thu, 14 Aug 2025 13:16:36 +0100
Message-ID: <20250814121637.3775660-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
References: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1755173998; x=1786709998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IeQbjgUvC5bNw2zQvFwNVu7qXsWyp7kAh87BK6jWeqI=;
 b=NVgpooDN50kdcsL81bpXWn7me+ytDy54/Xsjzeedu+xste9nW1a1NF9D
 tTSJkyF3k9mwW5Sr64/HXlrP0J4X3wvIrb3CDKlhReHD1/HLoMVA3h3vH
 v5aguob06I8bW7bP2l3yu+TLjOIbr7vmGtMSC32bzC3BFH8O6w1TxQxLv
 BU6G095c/FSWuwTZTiQqGhw+NrMO4MJb7Srsm0yMyevc732cVR8ZaBegT
 Jhp5w8v0rVC5AI+GOPEjP95lDKqZNKdwF6c8/ijlvFvvJPSK3/iG5jWhT
 rv/xeNslYMkk7QIvIaIq1cU5ynCwa0x6/iRGvhT6enlxr2BQqK+D2fxbx
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=NVgpooDN
Subject: [Buildroot] [PATCH 2/3] board: microchip: mpfs_icicle: update to
 support production silicon
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the introduction of the production silicon Icicle Kit comes the
need to support multiple board device trees. The HSS puts a minimal dtb
in it's payload's ancillary-data immediately after U-Boot in memory.
CONFIG_OF_BOARD will use this dtb that the HSS carries with the bare
minimum of nodes enabled. It allows for firmware to provide the address
of the devicetree in memory using the `a1` register.
Use the device tree compatible from the hart software services to
essentially "detect" which board is in use and therefore select the
appropiate device tree for the board.
Add a fdt production node to the .its referencing the production Icicle
Kit DTB with appropriate attributes. Introduce matching configuration
entries to enable selection of the production Icicle kit FDT blob for
the MPFS Icicle Production Silicon board.
Update the configuration names to match the device tree compatibles for
each board configuration. With these updates, change image node and
configuration node names with more appropriate names.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/microchip/mpfs_icicle/mpfs_icicle.its   | 36 +++++++++++++++----
 board/microchip/mpfs_icicle/uboot-env.txt     | 21 ++++++-----
 .../mpfs_icicle/uboot-fragment-rootfs.config  |  1 +
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/board/microchip/mpfs_icicle/mpfs_icicle.its b/board/microchip/mpfs_icicle/mpfs_icicle.its
index a62b079fa1..2f89a6ee2f 100644
--- a/board/microchip/mpfs_icicle/mpfs_icicle.its
+++ b/board/microchip/mpfs_icicle/mpfs_icicle.its
@@ -24,7 +24,7 @@
 					algo = "sha256";
 				};
 			};
-			base_fdt {
+			fdt-mpfs-icicle-kit.dtb {
 				description = "Flattened Device Tree blob";
 				data = /incbin/("./mpfs-icicle-kit.dtb");
 				type = "flat_dt";
@@ -35,19 +35,41 @@
 					algo = "sha256";
 				};
 			};
+			fdt-mpfs-icicle-kit-prod.dtb {
+				description = "Flattened Device Tree blob";
+				data = /incbin/("./mpfs-icicle-kit-prod.dtb");
+				type = "flat_dt";
+				arch = "riscv";
+				compression = "none";
+				load = <0x8a000000>;
+				hash-1 {
+					algo = "sha256";
+				};
+			};
 		};
 
 		configurations {
-			default = "kernel_dtb";
-			kernel_dtb {
+			default = "conf-microchip,mpfs-icicle-kit-prod";
+			conf-microchip,mpfs-icicle-kit {
 				description = "1 Linux kernel, FDT blob";
 				kernel = "kernel";
-				fdt = "base_fdt";
+				fdt = "fdt-mpfs-icicle-kit.dtb";
 			};
 
-			base_dtb {
+			conf-microchip,mpfs-icicle-kit-prod {
+				description = "1 Linux kernel, FDT blob";
+				kernel = "kernel";
+				fdt = "fdt-mpfs-icicle-kit-prod.dtb";
+			};
+
+			conf-microchip,fdt-mpfs-icicle-kit.dtb {
 				description = "Base FDT blob for MPFS Icicle board";
-				fdt = "base_fdt";
+				fdt = "fdt-mpfs-icicle-kit.dtb";
+			};
+
+			conf-microchip,fdt-mpfs-icicle-kit-prod.dtb {
+				description = "Base FDT blob for MPFS Icicle Production board";
+				fdt = "fdt-mpfs-icicle-kit-prod.dtb";
 			};
 		};
-};
+};
\ No newline at end of file
diff --git a/board/microchip/mpfs_icicle/uboot-env.txt b/board/microchip/mpfs_icicle/uboot-env.txt
index 8a655085ed..befbfa2006 100644
--- a/board/microchip/mpfs_icicle/uboot-env.txt
+++ b/board/microchip/mpfs_icicle/uboot-env.txt
@@ -5,12 +5,15 @@
 setenv fdt_high 0xffffffffffffffff
 setenv initrd_high 0xffffffffffffffff
 
-load mmc 0:${distro_bootpart} ${scriptaddr} mpfs_icicle.itb;
-bootm start ${scriptaddr}#kernel_dtb;
-bootm loados ${scriptaddr};
-# Try to load a ramdisk if available inside fitImage
-bootm ramdisk;
-bootm prep;
-fdt set /soc/ethernet@20112000 mac-address ${icicle_mac_addr0};
-fdt set /soc/ethernet@20110000 mac-address ${icicle_mac_addr1};
-bootm go;
+fdt addr ${fdtcontroladdr}
+fdt get value board_compatible / compatible 1
+
+setenv fitconf conf-${board_compatible}
+
+load mmc 0:${distro_bootpart} ${scriptaddr} mpfs_icicle.itb
+bootm start ${scriptaddr}#${fitconf}
+bootm loados ${scriptaddr}
+bootm ramdisk
+bootm prep
+run design_overlays
+bootm go
diff --git a/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config b/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
index e2a5eb9438..47f4c35ea4 100644
--- a/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
+++ b/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
@@ -1,3 +1,4 @@
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mmcblk0p3 rootwait uio_pdrv_genirq.of_id=generic-uio"
 CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
+CONFIG_OF_BOARD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
