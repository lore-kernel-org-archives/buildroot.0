Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69676C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D9A061412;
	Fri, 22 Apr 2022 22:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwwqulZoKUhJ; Fri, 22 Apr 2022 22:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C793E6140D;
	Fri, 22 Apr 2022 22:36:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9521BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B93541676
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vPX5DcO5mIc for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:36:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.186])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD4164162C
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:36:55 +0000 (UTC)
Received: from 1ni1tT-0003ok-Vm by out3a.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1ni1tV-0003rg-WC; Fri, 22 Apr 2022 15:36:53 -0700
Received: by emcmailer; Fri, 22 Apr 2022 15:36:53 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3a.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1ni1tT-0003ok-Vm; Fri, 22 Apr 2022 15:36:51 -0700
Received: from tsdebian.ts-local.net (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 1A53840836;
 Fri, 22 Apr 2022 15:36:51 -0700 (MST)
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 15:36:07 -0700
Message-Id: <20220422223611.10443-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121; h=Message-Id:Date:To:From;
 bh=Ex0PQjaojduH0/324T3N4qDE2310vTe7vEg9XtHvnbQ=;
 b=PRtxsShboQEqON7gE7ttQoI+bCkRFJer4+xqb4xR0QKqFKQFwJVIWq+O9Yo4AYPVKBLJJzIdqZ/rkSUY9BRj48h0Aad1UluNW7t/A70KXDe5e2ryaT1KJhPtww+uVG3lUrm8eKXQWtn4dqiXaWW7DA5WxRANhz075eD8eZE9Ght9zm81EaBmgpvT59Kqkl/w5mQa61BwBdWMeiWYpvfUGUKnZq0isKl50N9Mhng5eAYh4AvCl+tSLBt5aqdi7gFLD2OUyW4cRk0DgG/lZgvKaxsDyMcr21RlH2wsBL/6uOX7PXDRXY5r5zheoIXIg6JmyOlrXwwUqXUV6FmAzGWsaQ==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH v2 0/4] Pull in WILC Wi-Fi updates
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series bumps WILC1000/3000 firmware to the latest available from
Microchip, updates existing defconfig files to include both WILC1000
and WILC3000 blobs, and adds a package to build the wilc driver as
an external kernel module.

The previous wilc1000-firmware package was extremely outdated, no longer
available on github, and installed the firmware files to the wrong
location for the current upstream kernel wilc1000 driver and Microchip's
separately maintained driver.

Since the firmware change includes individual WILC1000 and WILC3000
config options, this package is renamed to wilc-firmware.

The defconfigs of all platforms that used WILC1000 firmware were
touched to also include WILC3000 firmware. They either natively
have WILC3000 or can support either WILC1000/WILC3000 being connected
to these platforms.

I've attempted to test the firmware changes against
microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig as this is a board I
have in my possession. However, the defconfig appears broken (Microchip
now maintains the evk in their own BR2_EXTERNAL repo):

...
Kernel command line: console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw
...
RAMDISK: Couldn't find valid RAM disk image starting at 0.
mmc0: new ultra high speed DDR50 SDHC card at address aaaa
List of all partitions:
...
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(1,0)
CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.80-linux4microchip-2021.10 #1
Hardware name: Atmel SAMA5
Function entered at [<c010c0fc>] from [<c010974c>]
Function entered at [<c010974c>] from [<c087e37c>]
Function entered at [<c087e37c>] from [<c0b014bc>]
Function entered at [<c0b014bc>] from [<c0b01788>]
Function entered at [<c0b01788>] from [<c08872c0>]
Function entered at [<c08872c0>] from [<c0100148>]
Exception stack(0xc2c29fb0 to 0xc2c29ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(1,0) ]---

The firmware and driver changes have been thoroughly tested, however,
on an embeddedTS platform (BR patch for this in the future, waiting on
kernel accepting FDT) that includes the WILC3000 device. We have a number
of platforms that all use this same device and are starting to push for
better upstream support overall. So this patch series is us laying the
groundwork for that.

Changes v1 -> v2:
	- Add un-prompted BR2_PACKAGE_WILC_FIRMWARE symbol to ensure that
	  wilc-firmware is built as part of make
	- Fix check-patch warning in wilc-firmware
	- Add wilc-firmware license copied Microchip's buildroot-external repo
	- Bump wilc-driver to linux4microchip-2021.10-1, removes kernel version
	  check that doesn't need to be there yet.

Kris Bahnsen (4):
  package/wilc1000-firmware: bump to 15.6
  package/wilc-firmware: rename from wilc1000-firmware
  configs: add WILC3000_FIRMWARE to compatible devices
  package/wilc-driver: new package

 DEVELOPERS                                         |  6 ++-
 configs/at91sam9x5ek_dev_defconfig                 |  1 +
 configs/at91sam9x5ek_mmc_dev_defconfig             |  1 +
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig   |  1 +
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig   |  1 +
 configs/atmel_sama5d3_xplained_dev_defconfig       |  1 +
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig   |  1 +
 configs/atmel_sama5d4_xplained_dev_defconfig       |  1 +
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig   |  1 +
 configs/microchip_sam9x60ek_mmc_dev_defconfig      |  1 +
 .../microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig |  1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig    |  1 +
 configs/microchip_sama7g5ek_mmc_dev_defconfig      |  1 +
 package/Config.in                                  |  3 +-
 package/wilc-driver/Config.in                      | 58 ++++++++++++++++++++++
 package/wilc-driver/wilc-driver.hash               |  2 +
 package/wilc-driver/wilc-driver.mk                 | 29 +++++++++++
 package/wilc-firmware/Config.in                    | 34 +++++++++++++
 package/wilc-firmware/wilc-firmware.hash           |  2 +
 package/wilc-firmware/wilc-firmware.mk             | 35 +++++++++++++
 package/wilc1000-firmware/Config.in                |  6 ---
 package/wilc1000-firmware/wilc1000-firmware.hash   |  2 -
 package/wilc1000-firmware/wilc1000-firmware.mk     | 24 ---------
 23 files changed, 179 insertions(+), 34 deletions(-)
 create mode 100644 package/wilc-driver/Config.in
 create mode 100644 package/wilc-driver/wilc-driver.hash
 create mode 100644 package/wilc-driver/wilc-driver.mk
 create mode 100644 package/wilc-firmware/Config.in
 create mode 100644 package/wilc-firmware/wilc-firmware.hash
 create mode 100644 package/wilc-firmware/wilc-firmware.mk
 delete mode 100644 package/wilc1000-firmware/Config.in
 delete mode 100644 package/wilc1000-firmware/wilc1000-firmware.hash
 delete mode 100644 package/wilc1000-firmware/wilc1000-firmware.mk

-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
