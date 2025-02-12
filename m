Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9132C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E7EA60677;
	Fri, 28 Feb 2025 17:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdSgDGgOSePU; Fri, 28 Feb 2025 17:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3436C606F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3436C606F0;
	Fri, 28 Feb 2025 17:18:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D97711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E1B744A2F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN45x-hXpEF9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5BD452E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5BD452E7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 960038780F; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 23:25:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 452cb98323f4aadf8ada8c9bacf1238f7b3b3e89
X-Git-Newrev: 3fb075afad96a8d6f1877c0c2b202f61cb5993aa
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.960038780F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/beagleboard/beaglev_fire: fix update gateware feature
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fb075afad96a8d6f1877c0c2b202f61cb5993aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/beagleboard/beaglev_fire/boot.cmd            |  1 +
 .../usr/share/microchip/update-gateware.sh         | 51 +++++++++++++++++-----
 2 files changed, 40 insertions(+), 12 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
