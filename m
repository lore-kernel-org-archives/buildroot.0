Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D5ED609D5
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D48827E0;
	Tue, 16 Dec 2025 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Yh0fCdcO804; Tue, 16 Dec 2025 17:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE73827B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765907044;
	bh=Ijw5KAZMOibQhBmiO6VgPNKIhK9LX39HQfeQo6+u72o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GPz4tVJEXRcgnm/F/b7v1StObsY7S3eoichtXEGbcrYNxy4EgNLIAlJDG5/PHYHOW
	 SVvVZ7K0CgKcpGFLIRWtdaD7BssSK+tQW45jEElRQM+ooEZRTzPwjTmFYQNSyMtJ0y
	 3aMcOelgm3SWx/ihVgCtVhNSE5nOfHWAuNgjs8kDwYTwKw/npSSG7TZ2EkN8TVlKuH
	 D9cp37zOPMF0/Gz4Fd2baYHCd3VsktSnG1EtP+niGwhWC3u47vqMUXJ68w0T3FxoRO
	 C9AMuipCvk8K8fK83sukOzljTSjf4Zv00Sj6OpGBugdv/R7NwN5aFWo1SxDkPw8IIe
	 ZROch/epGYFmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE73827B5;
	Tue, 16 Dec 2025 17:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D36C364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F6A4827B5
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nToeuR2jdYYk for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 17:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98D0881EC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D0881EC7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98D0881EC7
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7C42660137;
 Tue, 16 Dec 2025 18:43:57 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Tue, 16 Dec 2025 18:43:51 +0100
Message-ID: <20251216174352.11588-2-vjardin@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216174352.11588-1-vjardin@free.fr>
References: <20251216174352.11588-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765907039;
 bh=eC7xFZElEydLtnhKcRgL+/ZlbB2sqawhDssxLnkqXnE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n6W7P5cmeDMPeZIpt4j7DEUmcJDDrfATIb4CVqolSYhwV9HTvTB5u/mnLj5IK9jZk
 Syxbz7clHbLyR3hCltGA1m6dio6lC0S03r56+M8lPPwBrgzz3Vy627gAToOquUEvmQ
 6q7y+OSchuN+UDW5yuB6HDyuNwrkiUY86aNAT1fvbjCkdRNjHCrANiPEU9KYtaoFML
 8WfmXp8iApe643MIdAK1wKv9ULDOYhf0iLc7qutjtmk6WDYYXuYEorD6N7Fk3r/miH
 hHVC+S0w6K6E/20o7ZVa8Hxsvn1DV9If4FBbfI6T9faKUb+Ezd1uESdD5yB/D7sUQX
 BYjAcYlcNPKQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n6W7P5cm
Subject: [Buildroot] [PATCH v1 1/2] board/marvell: add Armada 8040 DB board
 files
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add board support files for the Marvell Armada 8040 Development Board
(DB-88F8040). This includes:

- readme.txt: Documentation for SPI NOR boot, TFTP/eMMC kernel loading
- linux-extras.config: Kernel config fragment for mvpp2 and Marvell PHY

The DB-88F8040 is Marvell's reference design for the Armada 8040 SoC,
featuring quad-core Cortex-A72 at 2.0 GHz.

Boot method:
- ATF + U-Boot flashed to SPI NOR (flash-image.bin)
- Kernel with embedded initramfs loaded via TFTP or from eMMC

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../armada-8040-db/linux-extras.config        |   2 +
 board/marvell/armada-8040-db/readme.txt       | 110 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 board/marvell/armada-8040-db/linux-extras.config
 create mode 100644 board/marvell/armada-8040-db/readme.txt

diff --git a/board/marvell/armada-8040-db/linux-extras.config b/board/marvell/armada-8040-db/linux-extras.config
new file mode 100644
index 0000000000..18c854c142
--- /dev/null
+++ b/board/marvell/armada-8040-db/linux-extras.config
@@ -0,0 +1,2 @@
+CONFIG_MARVELL_PHY=y
+CONFIG_MVPP2=y
diff --git a/board/marvell/armada-8040-db/readme.txt b/board/marvell/armada-8040-db/readme.txt
new file mode 100644
index 0000000000..18bc72909e
--- /dev/null
+++ b/board/marvell/armada-8040-db/readme.txt
@@ -0,0 +1,110 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with
+the buildroot environment for the Marvell Armada 8040 DB (Development
+Board) based on the Marvell Armada 8040 SoC.
+
+This configuration produces:
+ - flash-image.bin: ATF + U-Boot for SPI NOR flash
+ - Image: Linux kernel with embedded initramfs
+ - armada-8040-db.dtb: Device tree blob
+
+How to build
+============
+
+Default configuration provides the following BSP versions:
+ - Linux 6.12.8 (LTS kernel)
+ - U-Boot 2024.10
+ - ARM Trusted Firmware v2.12
+
+To build images run the following commands:
+
+    $ make marvell_armada8040_db_defconfig
+    $ make
+
+Output files will be in output/images/:
+ - flash-image.bin
+ - Image (with embedded initramfs)
+ - armada-8040-db.dtb
+
+How to flash the SPI NOR
+========================
+
+The flash-image.bin must be written to SPI NOR flash. This can be done
+from U-Boot using TFTP:
+
+1. Set up TFTP server with flash-image.bin
+2. Boot board to existing U-Boot prompt
+3. Run:
+
+    => setenv serverip <TFTP_SERVER_IP>
+    => setenv ipaddr <BOARD_IP>
+    => tftpboot $loadaddr flash-image.bin
+    => sf probe
+    => sf erase 0 0x200000
+    => sf write $loadaddr 0 $filesize
+    => reset
+
+Or use UART recovery (xmodem) if SPI is corrupted:
+Set SW5 to Boot Mode 0xE (UART boot), then use the download-serial.sh
+script to send flash-image.bin via xmodem.
+
+How to boot the kernel
+======================
+
+The kernel (with embedded initramfs) can be loaded from eMMC or TFTP.
+
+Option 1: Boot from TFTP
+------------------------
+
+Copy Image and armada-8040-db.dtb to TFTP server.
+
+In U-Boot:
+
+    => setenv serverip <TFTP_SERVER_IP>
+    => setenv ipaddr <BOARD_IP>
+    => tftpboot 0x5000000 Image
+    => tftpboot 0x4f00000 armada-8040-db.dtb
+    => setenv bootargs console=ttyS0,115200
+    => booti 0x5000000 - 0x4f00000
+
+Save as boot script:
+
+    => setenv bootcmd_tftp 'tftpboot 0x5000000 Image; tftpboot 0x4f00000 armada-8040-db.dtb; setenv bootargs console=ttyS0,115200; booti 0x5000000 - 0x4f00000'
+    => saveenv
+
+Option 2: Boot from eMMC
+------------------------
+
+Copy files to eMMC (ext4 partition):
+
+    /boot/Image
+    /boot/armada-8040-db.dtb
+
+In U-Boot:
+
+    => mmc dev 1
+    => ext4load mmc 1:1 0x5000000 /boot/Image
+    => ext4load mmc 1:1 0x4f00000 /boot/armada-8040-db.dtb
+    => setenv bootargs console=ttyS0,115200
+    => booti 0x5000000 - 0x4f00000
+
+Boot Mode Switches (SW5)
+========================
+
+For SPI flash boot:
+ - Boot Mode 0x34 (SPI): positions 3,5,6 ON; others OFF
+
+For UART recovery:
+ - Boot Mode 0x0E (UART): positions 2,3,4 ON; others OFF
+
+Ethernet Configuration
+======================
+
+The DB-88F8040 uses CP0 RGMII interface with a PHY at MDIO address 1.
+The Linux device is typically eth2 (cp0_eth2).
+
+Note: You may need to set the MAC address in U-Boot:
+    => setenv ethaddr 02:00:00:00:00:01
+    => saveenv
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
