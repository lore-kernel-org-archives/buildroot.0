Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A700CC433FE
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 03:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D3B60EBF;
	Mon, 30 May 2022 03:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4Vis7i1XxMH; Mon, 30 May 2022 03:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17FDD60E1A;
	Mon, 30 May 2022 03:38:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4AFF1BF834
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A081340C01
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="DTJypH/z";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="us4msAis"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6TfekSQCR-3 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 03:38:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1043D4000B
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653881920; x=1685417920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SSxNyVdChM96mJ4ySoEoascKQAZ52I9pYApNugOdb98=;
 b=DTJypH/zANjNoyQenFZd6DeaMOeSprMJYmbue0RHlkKP/S00MeyQAqWf
 QnClDbqLOyVj796zf+2/5o+0MgmoYeSGcaIzOd+xPaJ5WHW+bHcZhU0+J
 R6ONRKjc1AJ92lUJsIQQ8iIYQ+1pDwjLWEq1Y65+n4TCcCu33bq8shyMM
 P3E4/RxSy2fJs/a926fPkPYSwsjv/I08YFD8qubqtrGMCYt8+7DHF1UUP
 WUW/3fHPMtwiOr1XA1aeSGpnFfXL8Accqlh9/LuwrPKX8oWYi37n+Jgte
 iU21IArjyOO+Tr/ilJgaxC2vx/jI8/tKOgEW21BXNzq7Pew+CwK0MDGYR A==;
X-IronPort-AV: E=Sophos;i="5.91,261,1647273600"; d="scan'208";a="313781108"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 11:38:40 +0800
IronPort-SDR: Y1xUwf4qnJNWYGXdaiY+gMfgvhqusW54J617tvvBb+XTv4gu8yXFIoztBsU9hw/eqn6Q2SX6Wr
 /ViSf/kPKYBK70NeK8N8djZ2kp4HwI9K68jz0/7HtkjQd1KIPASB3KFt1JDy/g9GDOthTHuNiG
 coB48u3vzemGEen0w9EHj98EKofHO0G8DKlieGXgn3o7VwKBi1DGcC6T3DnJyNPKR60BXDlZiQ
 VfCmMIyKcQ3Vf80aBx+nT7x0YhmRm7kQP4Dhj/HYwXWkVIPq7MPlUi159h7oP4LLEivIc5XYhg
 bzwuRHusQrXebo4dgXnyvILm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 19:58:05 -0700
IronPort-SDR: J6cg2KRRCer4i1tszPhvk3iYSUA+/99K0Oc66p52qJ9tV3Gpo1fOI1nxjR53M5UrYNH0fIo/65
 omytVLGMSh18mepixo6vDeuPY4w5nzxZCS7qH+7ubDbVfrhby1mtfqV7PwcRdMyPT6n15cDPFF
 rRzutYIxMlXpTI4yUH6SV1Jun2gYPxcY495iFvosN45gj38Er7S4Ph6aXbZyXqyK9znWGstXdN
 J5Abnco8K7/c4mcYyIwxUSYV/0NRxMRq/iAFlWes5I9W4ddfr8kFAuLg679h6X9oxSI5UsNfYs
 mr8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 20:38:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LBLjW4Ts0z1SVp0
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:38:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1653881918;
 x=1656473919; bh=SSxNyVdChM96mJ4ySoEoascKQAZ52I9pYApNugOdb98=; b=
 us4msAisRl0Do4LJcxUrJ1qNndwmWHCE+ZiDzcAtsW+iJaK2Klef13S73cQl3ElZ
 FL51z6KJaGdpU4atpUQFxMae6HarXFKOTnHvN9NK/ZD/fYyXUwDxCUewSxqlsDz2
 Q5vroMwFJxoty/ps2rJAuPL0WBeuVXrI7yG97qeXmrnGo1qnoLz9bsWAz0eotWCP
 XsaU/EULsplejT9c55dP9mXaRHuSzS0UtTTv4uPv+kxMIiYkW3sGTRDgZ7mOKJJb
 Z5RYx6QJz/YtMzx/pDcvkAs4nb3X2EbHkq4LxL8qs0f5b4BZvEsSrZr7SP4QDY3x
 42IcMYGSsIko56C/bUUA0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dGdrf_TolXj1 for <buildroot@buildroot.org>;
 Sun, 29 May 2022 20:38:38 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LBLjT3vwYz1Rvlc;
 Sun, 29 May 2022 20:38:37 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 May 2022 12:38:25 +0900
Message-Id: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 00/11] Fix RV64 NOMMU and add Canaan K210 SoC
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
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

The first patch is a simple fix of elf2flt configuration menu entry.
The second patch fixes the existing elf2flt RISC-V 64-bits support.

The third patch adds a Linux kernel patch that must be used for all
NOMMU RISC-V builds. This patch will be present in the upcoming 5.19
kernel.

Patch 4 adds a buildroot configuration file for QEMU NOMMU RISC-V
64-bits builds.

Patch 5 adds the python-kflash utility as a host package to allow users
to program their K210-based boards with bootable images. This patch also
modifies the python-serial package to add its host package definition to
make the python-miniterm utility available to users to open serial
consoles with their K210-based boards.

Patch 6 adds the configurations files common to all K210-based boards.

Finally, the last 5 patches add support for the following K210-based
boards:
* Sipeed MAIX Bit
* Sipeed MAIXDUINO
* Sipeed MAIX Dock (dan)
* Sipeed MAIX Go
* Canaan KD233 development board

For each board, a readme.txt file is added to document how to build and
install images for these  
boards.

CHanges from v1:
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

Damien Le Moal (10):
  package: elf2flt: fix config menu entry description
  package: elf2flt: Update RISC-V 64-bits support
  board: Add common Linux kernel support for RISCV NOMMU builds
  package: python-kflash: Kendryte K210 UART ISP Utility
  board: Add common support for Canaan K210 SoC-based boards
  board: Add Sipeed MAIX-Bit board support
  board: Add Sipeed MAIXDUINO board support
  board: Add Sipeed MAIX-Dock board support
  board: Add Sipeed MAIX-Go board support
  board: Add Canaan KD233 board support

Niklas Cassel (1):
  configs/qemu_riscv64_nommu_virt_defconfig: new defconfig

 DEVELOPERS                                    |  14 +
 board/canaan/k210-soc/busybox-tiny.config     | 231 +++++++++++++
 board/canaan/k210-soc/genimage.cfg            |  30 ++
 board/canaan/k210-soc/linux-sdcard.config     |   4 +
 board/canaan/k210-soc/post-build.sh           |  28 ++
 board/canaan/k210-soc/rootfs_overlay/init     |   1 +
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 +++
 board/canaan/k210-soc/uboot.config            |   1 +
 board/canaan/kd233/linux-cpio.config          |   2 +
 board/canaan/kd233/readme.txt                 | 149 ++++++++
 board/qemu/riscv64-virt/readme.txt            |   2 +
 ...ot-stop-relocating-GOT-entries-prema.patch | 110 ++++++
 board/riscv/nommu/readme.txt                  |   3 +
 board/sipeed/maix-bit/linux-cpio.config       |   2 +
 board/sipeed/maix-bit/readme.txt              | 316 +++++++++++++++++
 board/sipeed/maix-dock/linux-cpio.config      |   2 +
 board/sipeed/maix-dock/readme.txt             | 321 ++++++++++++++++++
 board/sipeed/maix-go/linux-cpio.config        |   2 +
 board/sipeed/maix-go/readme.txt               | 320 +++++++++++++++++
 board/sipeed/maixduino/linux-cpio.config      |   2 +
 board/sipeed/maixduino/readme.txt             | 292 ++++++++++++++++
 configs/canaan_kd233_defconfig                |  38 +++
 configs/qemu_riscv64_nommu_virt_defconfig     |  35 ++
 configs/sipeed_maix_bit_defconfig             |  38 +++
 configs/sipeed_maix_bit_sdcard_defconfig      |  56 +++
 configs/sipeed_maix_dock_defconfig            |  38 +++
 configs/sipeed_maix_dock_sdcard_defconfig     |  56 +++
 configs/sipeed_maix_go_defconfig              |  38 +++
 configs/sipeed_maix_go_sdcard_defconfig       |  56 +++
 configs/sipeed_maixduino_defconfig            |  38 +++
 configs/sipeed_maixduino_sdcard_defconfig     |  56 +++
 package/Config.in.host                        |   3 +
 ...tate-32-byte-alignment-for-.data-sec.patch |  81 +++++
 ...f2flt-fix-.eh_frame-section-handling.patch |  73 ++++
 ...4-elf2flt-add-riscv-64-bits-support.patch} |  80 ++---
 package/elf2flt/Config.in.host                |   2 +-
 package/python-kflash/Config.in.host          |   9 +
 package/python-kflash/python-kflash.hash      |   5 +
 package/python-kflash/python-kflash.mk        |  15 +
 package/python-pyelftools/Config.in.host      |   7 +
 package/python-serial/Config.in.host          |   6 +
 package/python-serial/python-serial.mk        |   1 +
 42 files changed, 2550 insertions(+), 54 deletions(-)
 create mode 100644 board/canaan/k210-soc/busybox-tiny.config
 create mode 100644 board/canaan/k210-soc/genimage.cfg
 create mode 100644 board/canaan/k210-soc/linux-sdcard.config
 create mode 100755 board/canaan/k210-soc/post-build.sh
 create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/uboot.config
 create mode 100644 board/canaan/kd233/linux-cpio.config
 create mode 100644 board/canaan/kd233/readme.txt
 create mode 100644 board/riscv/nommu/kernel_patches/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
 create mode 100644 board/riscv/nommu/readme.txt
 create mode 100644 board/sipeed/maix-bit/linux-cpio.config
 create mode 100644 board/sipeed/maix-bit/readme.txt
 create mode 100644 board/sipeed/maix-dock/linux-cpio.config
 create mode 100644 board/sipeed/maix-dock/readme.txt
 create mode 100644 board/sipeed/maix-go/linux-cpio.config
 create mode 100644 board/sipeed/maix-go/readme.txt
 create mode 100644 board/sipeed/maixduino/linux-cpio.config
 create mode 100644 board/sipeed/maixduino/readme.txt
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/qemu_riscv64_nommu_virt_defconfig
 create mode 100644 configs/sipeed_maix_bit_defconfig
 create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_go_defconfig
 create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
 create mode 100644 package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
 create mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
 rename package/elf2flt/{0002-elf2flt-add-riscv-64-bits-support.patch => 0004-elf2flt-add-riscv-64-bits-support.patch} (52%)
 create mode 100644 package/python-kflash/Config.in.host
 create mode 100644 package/python-kflash/python-kflash.hash
 create mode 100644 package/python-kflash/python-kflash.mk
 create mode 100644 package/python-pyelftools/Config.in.host
 create mode 100644 package/python-serial/Config.in.host

-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
