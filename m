Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5F8C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 09:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7402849C8;
	Tue, 21 Jan 2025 09:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eu8xmAQRbUuc; Tue, 21 Jan 2025 09:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C207849D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C207849D4;
	Tue, 21 Jan 2025 09:09:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5615569
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE9640A91
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rZ5pfcOQSqL for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 09:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=1098f6abb=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B24FE409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24FE409F2
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B24FE409F2
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:48 +0000 (UTC)
X-CSE-ConnectionGUID: EKfiuyhISJSGu431ctdL0A==
X-CSE-MsgGUID: 60wwq7AOR7u1PjcSTtTSKg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732604400"; d="scan'208";a="204253194"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jan 2025 02:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 21 Jan 2025 02:02:13 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 21 Jan 2025 02:02:11 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Date: Tue, 21 Jan 2025 09:05:13 +0000
Message-ID: <20250121090513.3375533-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1737450588; x=1768986588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LgLCgux9+en9xEIWBh607wTqgR80Pfv2tOVtA4wAKFw=;
 b=NqNtFZU5cdUGci84OKOWWvlfIp4U51dkCYwL3tvZPZmsZ6UcPBJGZxb9
 a2YpIlYQMhHChzT/eAixrdYi+U5XKGVSJfMpvlc4Hp0U4GFei5yk2E2ym
 8zJHZaZEpL2hgNLJZo+r7Tmm8HgkMTYdKz8oGVPNTMnJszXxyEfy039Kx
 Rj7yTX0bh+3CAuVFpeJ+7fQ+RXIf2i7oVuxXiIXdO30tXdHoGa5RQ5mHr
 lpaHLqmdvhci0xxENnwZ1ff2gO33FbTynCenDrrB9kEBKUMBv1ayc5r6w
 HYy3wQvVU9r2kKsjJuZCgpCxDrl/3s9nGPtV4H1J6aN5oAcsDPxFULrmI
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=NqNtFZU5
Subject: [Buildroot] [PATCH v2 3/3] board/beagleboard/beaglev_fire: cleanup
 gatewate update
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

Update the README following the update gateware fix and optimise the
script, making it easier for the user to use.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/README.txt     | 13 +++-------
 .../usr/share/microchip/update-gateware.sh    | 24 ++++++++++++-------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/README.txt b/board/beagleboard/beaglev_fire/README.txt
index c9a824b67f..6484cca8e1 100644
--- a/board/beagleboard/beaglev_fire/README.txt
+++ b/board/beagleboard/beaglev_fire/README.txt
@@ -113,7 +113,7 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   On your Linux host development computer, copy the bitstream to BeagleV-Fire
   board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
   system.
-    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/etc/'
+    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/lib/firmware/'
 
   To apply these changes to your image, make sure to re-build it with:
     `make`
@@ -121,14 +121,7 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   Then, re-flash your image - to ensure you have the necessary firmware files - by
   following the above section "Flashing the image to your eMMC".
 
-  On BeagleV-Fire,
-    1. Make your update gateware script executable
-      'chmod +x /usr/share/microchip/update-gateware.sh'
-    2. Create a firmware directory
-      'mkdir /lib/firmware'
-    3. Change to the directory of your gateware script
-      `cd /usr/share/microchip/`
-    3. initiate the reprogramming of the FPGA with your gateware bitstream:
-      './update-gateware.sh /etc/LinuxProgramming/'
+  On BeagleV-Fire initiate the reprogramming of the FPGA with your gateware bitstream:
+    `/usr/share/microchip/update-gateware.sh`
 
   Wait for a couple of minutes for the BeagleV-Fire to reprogram itself.
diff --git a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
index 249c5bd260..7e05d4b7eb 100755
--- a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -1,17 +1,25 @@
 #!/bin/sh
 
-if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+if [ $# -eq 0 ]; then
+    echo "No gateware location provided. Checking default location."
+    if [ ! -e /lib/firmware/mpfs_bitstream.spi ]; then
         echo "No gateware file found."
         exit 1
+    fi
+else
+    echo "Gateware location provided: $1"
+    if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+        echo "No gateware file found."
+        exit 1
+    else
+        if [ ! -d /lib/firmware ]; then
+            mkdir /lib/firmware
+        fi
+        cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
+        cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
+    fi
 fi
 
-if [ ! -d /lib/firmware ]
-then
-    mkdir /lib/firmware
-fi
-
-cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
-cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
 
 # Trash existing device tree overlay in case the rest of the process fails:
 flash_erase /dev/mtd0 0 16
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
