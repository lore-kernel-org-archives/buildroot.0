Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 05:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE316115A;
	Tue, 31 May 2022 05:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOsPJHigtQSY; Tue, 31 May 2022 05:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008D960F84;
	Tue, 31 May 2022 05:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A05531BF375
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C8AD40489
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="S8SeM/OU";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="QOlhymlM"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4eUQg-wMzED for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 05:49:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6473400A4
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653976173; x=1685512173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YDNICyVDranm/7jcSr+tlQlTXYpekKURwAlPilDDt1g=;
 b=S8SeM/OUj0MBaP8guqccsGNszsNa0ycep68uA6Mn1ujh0r3xQuXOcucH
 4/uWJpfAiOhjKMxaVdctGcuJpE6EZKoqsAIqqWcDGL/0If0XsuH8alkLs
 MAgXoEForcvLygWLi2C3u1eWgiMu234/RYafXkHrjDxuIQTV2aJ4byzcX
 qhTbtLRyFRD9z0a60HYXdXmwCxZJWEyFNWmuTj0lrEDTHNybP5NuJBMqU
 0pTbv8f1JM2djuJ9ihsuR/0JEa1jQCXA8mWkObPiYeEoA76u51ly+AbJ9
 lHUD+uuMUXVSrIijQEEgd1bjr8G6ByxVYY4mRpP5OSMaNiXX6FnXzt3x+ Q==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647273600"; d="scan'208";a="306095075"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2022 13:49:30 +0800
IronPort-SDR: Ggitmv3WAIvhN6cPEojfNy70GxuwwaXe9PZd7CsnorBPDvcEbESwzmvDQK/hvmrBhvTprZC/VU
 qz77CQPQC9QsGh1QTRy0iboWmEns1aldZ7TSVJR70kVzy0/33DsWA/n1AkzqjHWFqXXL3Nt3xU
 ZdKyJF3OzcraJktZ6rEXaXQjh1Cl9x28o//jcLvyHrWCvbcRFeEWppcCiBAgVtFYegLG4juWBF
 m3wvjtiCalZUToLaQflJCBwv/zlwDdGkSvnNBUxldKp5q3luUcudGsl4isSn1IQpXKta/T1amK
 LTltLeOLdnjlO+8CtK2G0J9k
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:13:17 -0700
IronPort-SDR: Zo+cILjieOYpxt3H0L5jWVI6H063ouG57by06WZQe7ItmZGt2GFS6PZkB77zPw8z/soVPwMskC
 I8aw3TE0cCjqvPu/I7wphYeywdX6P5HpIyqneOmj657QmYpmgs4WYfNwjK0ApdGBNX0U8FoZHR
 tP1guUJuN+OowKNgmGPWoCIlI7r2jk+GoIPdFDXteWHq2Ip/lc9MSDurFjXxcUcvm45exNL/bD
 LK4I2yOswaGHU+FJ9CiNcJ2Ru/cp/FkglkpUnir4DKhL5cvpDT2DVDo6p9HEFOHpUbj3bn7YyZ
 PPk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:49:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LC1Z22Qf8z1SHwl
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:49:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1653976169;
 x=1656568170; bh=YDNICyVDranm/7jcSr+tlQlTXYpekKURwAlPilDDt1g=; b=
 QOlhymlMuZaFtxmJj5JvIFOf7hD6RmdK2lAdEJ+5udtGXDf/QfmUHw65REN9/Wp9
 WZnvqpPUaTY47xDfn2EvpTXA56K4dROEz2o0tja3x5M4ypEJ8u74HQ80LPCdSgZN
 rUDXRhH8ufSC+ch7LnZ3vNA+IC30fTasq2wXuB4CKUhS7z3yBzU3hfg+YE/w0iuF
 1NUJJz6hXMHZt8Z9MfxeoiMtI24iVFGRzrQRDrub8qQnkEwzaSvSiLcQLwGBtI4L
 /sin80q5IPdKcQbMJB3y1Xfu8tu0xcskne4bNEq77zJ4OL5rb7UU2dcCjhkZA/bV
 T+cODrl1OYSuETOvl6SwjQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WepviSjPZFFN for <buildroot@buildroot.org>;
 Mon, 30 May 2022 22:49:29 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.61])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LC1Z04XxJz1Rvlc;
 Mon, 30 May 2022 22:49:28 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 May 2022 14:49:19 +0900
Message-Id: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/7] Fix RV64 NOMMU and add Canaan K210 SoC
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series is a rework of the old v5 series "Add RV64 NOMMU and
Canaan K210 SoC support" already posted some (long) time ago.

This series adds support for building 64-bits RISC-V NOMMU kernels (both
bootable kernels and u-boot sdcard boot envronements) for NOMMU RISC-V
64-bits boards. The board supported include QEMU and many boards using
the dual-core RISC-V 64-bits Cannan Kendryte K210 SoC.

The first patch is a simple fix of elf2flt configuration.

Patch 2 adds the configurations files common to all K210-based boards.

The last 5 patches add support for the following K210-based boards:
* Sipeed MAIX Bit
* Sipeed MAIXDUINO
* Sipeed MAIX Dock (dan)
* Sipeed MAIX Go
* Canaan KD233 development board

For each board, a readme.txt file is added to document how to build and
install images for these boards.

Changes from v2:
* Rebased patches on next branch
* Modified patch 1 to address Thomas comments
* Removed patches already applied
* Modified patches 2 to 7 to remove the BR2_PACKAGE_HOST_ELF2FLT and
  reference the global patch directory in boar/riscv/nommu

Changes from v1:
* Modified patch 5 to add the python-kflash utility as a host package as
  the new 1.1.5 version of this utility fixes the previously identified
  problems with python dependencies.
* Fixed patch 4 (qemu riscv nommu) to have buildroot configuration file
  reference kernel 5.18.
* Fixed patch 11 (kd233 board) to have buildroot configuration file
  reference kernel 5.18.
* Modified patch 7 to 11 to add the python-kflash host package to the
  buildroot configuration files. The instructions in the readme.txt
  file for each board are also updated accordingly.

Damien Le Moal (7):
  package/elf2flt: Remove Config.in.host
  board: Add common support for Canaan K210 SoC-based boards
  board: Add Sipeed MAIX-Bit board support
  board: Add Sipeed MAIXDUINO board support
  board: Add Sipeed MAIX-Dock board support
  board: Add Sipeed MAIX-Go board support
  board: Add Canaan KD233 board support

 Config.in                                     |   2 +-
 DEVELOPERS                                    |  11 +
 arch/Config.in                                |   1 +
 board/canaan/k210-soc/busybox-tiny.config     | 231 +++++++++++++
 board/canaan/k210-soc/genimage.cfg            |  30 ++
 board/canaan/k210-soc/linux-sdcard.config     |   4 +
 board/canaan/k210-soc/post-build.sh           |  28 ++
 board/canaan/k210-soc/rootfs_overlay/init     |   1 +
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 +++
 board/canaan/k210-soc/uboot.config            |   1 +
 board/canaan/kd233/linux-cpio.config          |   2 +
 board/canaan/kd233/readme.txt                 | 149 ++++++++
 board/sipeed/maix-bit/linux-cpio.config       |   2 +
 board/sipeed/maix-bit/readme.txt              | 316 +++++++++++++++++
 board/sipeed/maix-dock/linux-cpio.config      |   2 +
 board/sipeed/maix-dock/readme.txt             | 321 ++++++++++++++++++
 board/sipeed/maix-go/linux-cpio.config        |   2 +
 board/sipeed/maix-go/readme.txt               | 320 +++++++++++++++++
 board/sipeed/maixduino/linux-cpio.config      |   2 +
 board/sipeed/maixduino/readme.txt             | 292 ++++++++++++++++
 configs/canaan_kd233_defconfig                |  39 +++
 configs/qemu_arm_versatile_nommu_defconfig    |   1 -
 configs/qemu_riscv64_nommu_virt_defconfig     |   1 -
 configs/qemu_xtensa_lx60_nommu_defconfig      |   1 -
 configs/sipeed_maix_bit_defconfig             |  39 +++
 configs/sipeed_maix_bit_sdcard_defconfig      |  57 ++++
 configs/sipeed_maix_dock_defconfig            |  39 +++
 configs/sipeed_maix_dock_sdcard_defconfig     |  57 ++++
 configs/sipeed_maix_go_defconfig              |  39 +++
 configs/sipeed_maix_go_sdcard_defconfig       |  57 ++++
 configs/sipeed_maixduino_defconfig            |  39 +++
 configs/sipeed_maixduino_sdcard_defconfig     |  57 ++++
 package/elf2flt/Config.in.host                |  13 -
 toolchain/toolchain-buildroot/Config.in       |   1 -
 34 files changed, 2180 insertions(+), 18 deletions(-)
 create mode 100644 board/canaan/k210-soc/busybox-tiny.config
 create mode 100644 board/canaan/k210-soc/genimage.cfg
 create mode 100644 board/canaan/k210-soc/linux-sdcard.config
 create mode 100755 board/canaan/k210-soc/post-build.sh
 create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/uboot.config
 create mode 100644 board/canaan/kd233/linux-cpio.config
 create mode 100644 board/canaan/kd233/readme.txt
 create mode 100644 board/sipeed/maix-bit/linux-cpio.config
 create mode 100644 board/sipeed/maix-bit/readme.txt
 create mode 100644 board/sipeed/maix-dock/linux-cpio.config
 create mode 100644 board/sipeed/maix-dock/readme.txt
 create mode 100644 board/sipeed/maix-go/linux-cpio.config
 create mode 100644 board/sipeed/maix-go/readme.txt
 create mode 100644 board/sipeed/maixduino/linux-cpio.config
 create mode 100644 board/sipeed/maixduino/readme.txt
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/sipeed_maix_bit_defconfig
 create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_go_defconfig
 create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
 delete mode 100644 package/elf2flt/Config.in.host

-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
