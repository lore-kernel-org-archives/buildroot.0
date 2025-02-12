Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA0C0219E
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 09:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8510361023;
	Wed, 12 Feb 2025 09:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uk96sLLY5Tmy; Wed, 12 Feb 2025 09:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7068061024
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7068061024;
	Wed, 12 Feb 2025 09:26:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 178266C
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE0B741392
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J62JwcgFZJLk for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 09:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=131dbbb23=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D86444130A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86444130A
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D86444130A
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:26:06 +0000 (UTC)
X-CSE-ConnectionGUID: /F2qGXWeSVqRlQI8UT2QcA==
X-CSE-MsgGUID: /XEauh6URcaC59S/Bzg4xg==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; d="scan'208";a="268932265"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2025 02:19:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:18:18 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Feb 2025 02:18:17 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Date: Wed, 12 Feb 2025 09:21:20 +0000
Message-ID: <20250212092121.11699-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212092121.11699-1-jamie.gibbons@microchip.com>
References: <20250212092121.11699-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1739352367; x=1770888367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7uAwY7+mdfnl94BJcJyLwkPbM6xE3fWvYmddPHyyvqE=;
 b=b+A1kbPe8EsSuf+/Jem0A4/Xlkfqw5UiSKsvE5Ht/c/HtvD6sAVEeg4a
 Pxxbqa1DF06l820Y44nUUi5ro1AwhbAISsgyLRofbmYcttfRwy96dKcny
 tZnQEHp062uHVOBgqmKiDHnsS9ipvWYpe/seXusKTtkvIg/UB3hDnKQBc
 uY+I7l4p99iUPEH1yFhWHhwSBxv2BAD1x1t25JbfYmE5mhQxt6PCxAiBu
 A4nY/o18XdKLLu0Lz2YbG/KbmGI1Uf1tZzIYxEinxAANTEvAJ5Bw/pmPv
 oS8EscX8A3aPH/I5j/bnF/CGM/stfWtofPClxn3SeYRrOE5YvtqPzujfN
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=b+A1kbPe
Subject: [Buildroot] [PATCH v3 2/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
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

Following the addition of the firmware upload API in linux v6.6, using
debugfs for firmware updating has been removed. Update the
update-gateware script to use the firmware upload API with sysfs and
enable applying the overlays during boot.
The fw_upload interface can detect when there is an overlay file and
will write it correctly. Use this functionality to write the overlay
file and remove dd command related code.

Fixes: 8ce97fd550d6 ("configs/beaglev_fire: bump Linux and U-Boot")

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/boot.cmd       |  1 +
 .../usr/share/microchip/update-gateware.sh    | 51 ++++++++++++++-----
 2 files changed, 40 insertions(+), 12 deletions(-)
 mode change 100644 => 100755 board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh

diff --git a/board/beagleboard/beaglev_fire/boot.cmd b/board/beagleboard/beaglev_fire/boot.cmd
index 05f4858bac..1402458d8b 100644
--- a/board/beagleboard/beaglev_fire/boot.cmd
+++ b/board/beagleboard/beaglev_fire/boot.cmd
@@ -12,4 +12,5 @@ bootm loados ${scriptaddr};
 bootm ramdisk;
 bootm prep;
 fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr0};
+run design_overlays;
 bootm go;
diff --git a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
old mode 100644
new mode 100755
index f455037b60..249c5bd260
--- a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -13,20 +13,47 @@ fi
 cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
 cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
 
-mount -t debugfs none /sys/kernel/debug
-
 # Trash existing device tree overlay in case the rest of the process fails:
-flash_erase /dev/mtd0 0 1024
+flash_erase /dev/mtd0 0 16
 
-# # Write device tree overlay
-dd if=/lib/firmware/mpfs_dtbo.spi of=/dev/mtd0 seek=1024
+# Initiate FPGA update for dtbo
+echo 1 > /sys/class/firmware/mpfs-auto-update/loading
 
-# Fake the presence of a golden image for now.
-dd if=/dev/zero of=/dev/mtd0 count=4 bs=1
+# Write device tree overlay
+cat /lib/firmware/mpfs_dtbo.spi > /sys/class/firmware/mpfs-auto-update/data
+
+# Signal completion for dtbo load
+echo 0 > /sys/class/firmware/mpfs-auto-update/loading
 
-# Initiate FPGA update.
-echo 1 > /sys/kernel/debug/fpga/microchip_exec_update
+while [ "$(cat /sys/class/firmware/mpfs-auto-update/status)" != "idle" ]; do
+    # Do nothing, just keep checking
+    sleep 1
+done
 
-# Reboot Linux for the gateware update to take effect.
-# FPGA reprogramming takes places between Linux shut-down and HSS restarting the board.
-reboot
+# Fake the presence of a golden image for now.
+dd if=/dev/zero of=/dev/mtd0 count=1 bs=4
+
+# Initiate FPGA update for bitstream
+echo 1 > /sys/class/firmware/mpfs-auto-update/loading
+
+# Write the firmware image to the data sysfs file
+cat /lib/firmware/mpfs_bitstream.spi > /sys/class/firmware/mpfs-auto-update/data
+
+# Signal completion for bitstream load
+echo 0 > /sys/class/firmware/mpfs-auto-update/loading
+
+while [ "$(cat /sys/class/firmware/mpfs-auto-update/status)" != "idle" ]; do
+    # Do nothing, just keep checking
+    sleep 1
+done
+
+# When the status is 'idle' and no error has occured, reboot the system for
+# the gateware update to take effect. FPGA reprogramming takes places between
+# Linux shut-down and HSS restarting the board.
+if [ "$(cat /sys/class/firmware/mpfs-auto-update/error)" = "" ]; then
+    echo "FPGA update ready. Rebooting."
+    reboot
+else
+    echo "FPGA update failed with status: $(cat /sys/class/firmware/mpfs-auto-update/error)"
+    exit 1
+fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
