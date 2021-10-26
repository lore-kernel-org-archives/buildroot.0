Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B606C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:25:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 485CD60FC2
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 485CD60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 237A060626;
	Tue, 26 Oct 2021 07:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGAEWmVqJX3y; Tue, 26 Oct 2021 07:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F9D608CC;
	Tue, 26 Oct 2021 07:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D10E1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 672C34024E
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qevshuHsVLTc for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:37 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A515240234
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233075; x=1666769075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zvu8i0OQEPtxKaiRu9ZJhQuDZ8+3F7cGb1BUkdnX9dQ=;
 b=rhKkZUFk+73c1wYYmHru6OrSJmexguW33s+HQyqA99v2hOsE/osudGIb
 qRfFcfCHkyQrCwYQDcbDObEhMl9pq3Tma+kGGVwCniGBsGkUehUUyuvJl
 MzX+c1D0V8Df2ThOI2PPe+ycBvc3dAWGuknsYeSFFx4wiR0y5k9FZo+4w
 8g3Sf7Vm+Uc/NWQ7UkmcJJqCui1K3HY4BULsohI2/wtHfgAzTeU1Zf14t
 3PVABIuBsq+WMKOWJ8USLXKvE2txv3QYpUoJcbry3dUQ2bD3ZrIa0sPRb
 hHWt05bjettvamP8EZomUrqDc0YgROqgfb40htzMB9dJzIvrNkQaAXFOP A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623056"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:29 +0800
IronPort-SDR: HzOD4vyXn9nVJjYKDfQlzH+sumcrTMsmET2ZZEc68nMJ8qpMk7Pf+bgxW/WY8js4gxxU7o6r/W
 Puwz1htfpOQaPH08JvcwX4U/wu7azPKuY86H7amMHsLDlKOMyE5iaY4szpWjzohgE5K6dCDYuO
 aXdJb6Fer+tYdLYswBpYedH/XSAvhikjR03BWxhtzHqu9nh3vc5obU/6UVwQcedEKG3gXIlylv
 If5v6rqgV66pKuFXj2SRJhIV+OYCc9gGnH/OhpTA2FaT/xe2tcE58WemKd5DDLqdq8I/ORe13d
 KnZqsUyx+EK5OJnk6CjJZDs6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:27 -0700
IronPort-SDR: 4pgIhkcS5ZYWfM9LLkIaSFx/0DAw1KseKO2SU2pbrUwf5erSZRqBym6FHpzHH4bNE4grxUL873
 sEyp4cqsCoFUtuf08jbq10ELlPtBR+/ZmJVrTth3uCxoU5w4vQ03KXlzs9Fi9VAz5KyIDNbIOA
 NrAYvijg62ZJYp5X6zAmNMnjoQPSiogNsHrES3U34hrzgNGD8s69O08v3ro6jzRTpqpb2To7R9
 zQlXcEz3UMHIE8yCmkyhfXf+1R41L3LRMIIfw9/TAlweIX4zW4b86M7HAoKEOqmxfhMzAaVsYF
 cIc=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:30 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:18 +0900
Message-Id: <20211026071728.954356-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 00/10] Add RV64 NOMMU and Canaan K210 SoC
 support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for building 64-bits RISC-V NOMMU kernel
bootable images for boards using the dual-core RISC-V 64-bits Cannan
Kendryte K210 SoC.

The first patch fixes invocation of elf2flt with NOMMU builds to fit the
requirements of RV64 builds. The second patch adds support for RV64 to
the elf2flt package. Patch 3 changes the base name of the toolchain
cross-compilation executables to avoid build errors. With these
preparatory patches in place, patch 4 makes MMU builds optional for
RISC-V 64-bits architecture.

The following 5 patches add default build configuration files for
various boards based on the Canaan K210 SoC: MAIX-bit, MAIX-go,
MAIX-dock (Dan Dock) and MAIXDUINO from Sipeed and the Canaan KD233
development board.

Finally, patch 10 documents how to build and install images for these
boards.

Changes from v4:
* Added patch 1 to address build options specification common to all
  packages.
* Removed busybox additional CFLAGS and LDFLAGS options from the
  busybox-tiny config file.

Changes from v3:
* Rebased on latest tree

Changes from v2:
* Reorder patches: former patch 1 is now patch 3.
* Clearly state in the first 3 patch commit messages that the NOMMU
  support introduced is for RISC-V 64-bits only and does not affect
  RV32.
* Modify patch 3 to allow NOMMU builds only for RV64 as opposed to both
  RV32 and RV64 before.
* Add reference to upstream elf2flt pull request in patch 1.
* Simplify the configurations for all boards, keeping default settings
  when a special value is not needed (e.g. gcc version).
* Dropped busybox-tiny-initramfs.config configuration and replaced it
  with a busybox fragment configuration file updating the default
  busybox-minimal.config configuration (used now for all boards).
* Changed common k210 rootfs overlay to replace the default /init script
  with a symbolic link pointing to the overlay provided /sbin/init
  script.

Changes from v1:
* Rebased on latest master
* Simplified patch 3 as suggested by Baruch
* Fixed typos in documentation (patch 9)
* Added reviewed-by tags

Christoph Hellwig (1):
  package/Makefile.in: Fix NOMMU RISC-V 64-bits toolchain base name

Damien Le Moal (9):
  package: Makefile.in: fix elf2flt invocation options
  package/elf2flt: add RISC-V 64-bits support
  arch/config: Make RISC-V 64-bits MMU optional
  board: Add Sipeed MAIX-bit support
  board: Add Sipeed MAIX-Go support
  board: Add Sipeed MAIXDUINO support
  board: Add Sipeed MAIX-Dock support
  board: Add Canaan KD233 support
  board: Document Canaan K210 based boards support

 arch/Config.in                                |   1 -
 arch/Config.in.riscv                          |   2 +
 board/canaan/k210-common/README.md            | 318 ++++++++++++++++++
 board/canaan/k210-common/busybox-tiny.config  | 241 +++++++++++++
 board/canaan/k210-common/rootfs_overlay/init  |   1 +
 .../k210-common/rootfs_overlay/sbin/init      |  27 ++
 board/canaan/kd233/README.md                  |   4 +
 board/canaan/kd233/linux-dtb.config           |   2 +
 board/sipeed/maix-bit/README.md               |   4 +
 board/sipeed/maix-bit/linux-dtb.config        |   2 +
 board/sipeed/maix-dock/README.md              |   4 +
 board/sipeed/maix-dock/linux-dtb.config       |   2 +
 board/sipeed/maix-go/README.md                |   4 +
 board/sipeed/maix-go/linux-dtb.config         |   2 +
 board/sipeed/maixduino/README.md              |   4 +
 board/sipeed/maixduino/linux-dtb.config       |   2 +
 configs/canaan_kd233_defconfig                |  14 +
 configs/canaan_kd233_sdcard_defconfig         |  13 +
 configs/sipeed_maix_bit_defconfig             |  14 +
 configs/sipeed_maix_bit_sdcard_defconfig      |  13 +
 configs/sipeed_maix_dock_defconfig            |  14 +
 configs/sipeed_maix_dock_sdcard_defconfig     |  13 +
 configs/sipeed_maix_go_defconfig              |  14 +
 configs/sipeed_maix_go_sdcard_defconfig       |  13 +
 configs/sipeed_maixduino_defconfig            |  14 +
 configs/sipeed_maixduino_sdcard_defconfig     |  13 +
 package/Makefile.in                           |  26 +-
 ...04-elf2flt-add-riscv-64-bits-support.patch | 137 ++++++++
 package/elf2flt/Config.in.host                |   2 +-
 29 files changed, 910 insertions(+), 10 deletions(-)
 create mode 100644 board/canaan/k210-common/README.md
 create mode 100644 board/canaan/k210-common/busybox-tiny.config
 create mode 120000 board/canaan/k210-common/rootfs_overlay/init
 create mode 100755 board/canaan/k210-common/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/kd233/README.md
 create mode 100644 board/canaan/kd233/linux-dtb.config
 create mode 100644 board/sipeed/maix-bit/README.md
 create mode 100644 board/sipeed/maix-bit/linux-dtb.config
 create mode 100644 board/sipeed/maix-dock/README.md
 create mode 100644 board/sipeed/maix-dock/linux-dtb.config
 create mode 100644 board/sipeed/maix-go/README.md
 create mode 100644 board/sipeed/maix-go/linux-dtb.config
 create mode 100644 board/sipeed/maixduino/README.md
 create mode 100644 board/sipeed/maixduino/linux-dtb.config
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/canaan_kd233_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_bit_defconfig
 create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_go_defconfig
 create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
 create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
