Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E34EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D6B241C28;
	Wed, 25 May 2022 13:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5CI86t07YA6; Wed, 25 May 2022 13:35:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C81D41C10;
	Wed, 25 May 2022 13:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EB7B1BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CA656130C
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRIkAOOfw3N8 for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:38 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 140C4612F5
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485677; x=1685021677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SCPAmH/3YZbHTI7SUTLgoi5PZuorMGgr4mIn+IZ19zI=;
 b=Tf4V/mtBKRLibkOjqMjI66BuVdXyZRrCI9pBoK/kUq8P543e3OyYwzZ2
 qGKEC8u9wgE6CYp20SKd2rOseC/e7nF64HUYkBU3F8vtxtUD9J9+E6Oa8
 qN12Gls6BJye7j3vbdR29kpX+gBPE5rt2oJVNyl2rGbRHY/0N1yi+3MWF
 KCfiB0sQl7WR0AeurX0jvfd88uEtx5rms/gGMV97tQxQOWYXWY/PrV0CG
 S1O8TmrvPObdeDderVp7VtjpCqMJTsdituJwACo+9ax05Bg4GMTZf4nfs
 7XF3cUH9jROCAsEuAeSedNRnZh7LLKWJ3wWu4i/BZR3ctfVE62scbvrHV Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635081"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:31 +0800
IronPort-SDR: Br6Zc9+NneGGrCn8hM+irlxz773pUIzj9pEgfh40p2AvRKCXGWGlp5ttI4MUj5lHRkYxYftqni
 F7a1STlDHMhvOzaGgX3Q2xh8WZ48eR1+lesOeGZkUzrOrgEz6tRhMDcbLpsJlxcuzxyQuMYWuB
 gpQDpvW4rN26olCa5NNSSJnGnbJTexCh4CAlLG/hadelHwydPOma/1F4ieig5uIVldzn3j8LXn
 7X5QSRgwHSBD4gd44PoXeBIonEsimXkO2f05j8azH3e0eZlVHJij63RaEUTREtBZlTXpGg3cvG
 Xqa29FLrJONp5Bof7oCk+Kif
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:27 -0700
IronPort-SDR: oPcM8AxHMpULOOEIS87hCF8RZVZA/qV802sk9l5c3Bu78K/slSKajZSuR9oo17p7AEc6h4gel0
 KU1u28CzsOMsBCmb+6rnaXGfVXykf0GMFyZYSrOUhtuvW/iw9cCtXnthOhdKOAngLWD/QyeyO+
 Q5AKp5C2fURXXiWqpp/9aJ3kpQTE52SzTc6Wx7YrD6Pyyqw5jlTiaUN9uGDEmFcQriJY3GqIe5
 CW7E2sQqjTkqhIST44XVE7x23cV/4+xIBIcoUxmbbeunbwf0CLJjyIF9jhnYIUKvfcSJuJ6oQZ
 zsM=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:30 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:18 +0900
Message-Id: <20220525132729.2349105-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 00/11] Fix RV64 NOMMU and add Canaan K210 SoC
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
Reply-To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Damien Le Moal <damien.lemoal@opensource.wdc.com>

(resend using subscribed email address)

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

Patch 5 modifies the python-serial package definition so that it can be
used as a host package to open serial consoles with the K210-based
boards.

Patch 6 adds all configurations bits common to all K210-based boards.

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

One thing that is missing from this patch series is the addition of the
python-based Kendryte K210 UART ISP utility kflash
(https://github.com/vowstar/kflash.py). This utility is available
as a package on the pypi.org package index but adding it as a buildroot
package is difficult due to the package dependencies needed. These
dependencies end up requiring other packages to be enable and end up
with an openssl build conflict resulting in u-boot compilation failures.
For this reason, this utility is not added as a package. Its
installation and use is documented in the readme file for the K210
boards.

Damien Le Moal (10):
  package: elf2flt: fix config menu entry description
  package: elf2flt: Update RISC-V 64-bits support
  board: Add common Linux kernel support for RISCV NOMMU builds
  package: python-serial: Define host package
  board: Add common support for Canaan K210 SoC-based boards
  board: Add Sipeed MAIX-Bit board support
  board: Add Sipeed MAIXDUINO board support
  board: Add Sipeed MAIX-Dock board support
  board: Add Sipeed MAIX-Go board support
  board: Add Canaan KD233 board support

Niklas Cassel (1):
  configs/qemu_riscv64_nommu_virt_defconfig: new defconfig

 DEVELOPERS                                    |  13 +
 board/canaan/k210-soc/busybox-tiny.config     | 231 +++++++++++++
 board/canaan/k210-soc/genimage.cfg            |  30 ++
 board/canaan/k210-soc/linux-sdcard.config     |   4 +
 board/canaan/k210-soc/post-build.sh           |  28 ++
 board/canaan/k210-soc/rootfs_overlay/init     |   1 +
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 +++
 board/canaan/k210-soc/uboot.config            |   1 +
 board/canaan/kd233/linux-cpio.config          |   2 +
 board/canaan/kd233/readme.txt                 | 142 ++++++++
 board/qemu/riscv64-virt/readme.txt            |   2 +
 ...ot-stop-relocating-GOT-entries-prema.patch | 110 ++++++
 board/riscv/nommu/readme.txt                  |   3 +
 board/sipeed/maix-bit/linux-cpio.config       |   2 +
 board/sipeed/maix-bit/readme.txt              | 309 +++++++++++++++++
 board/sipeed/maix-dock/linux-cpio.config      |   2 +
 board/sipeed/maix-dock/readme.txt             | 314 ++++++++++++++++++
 board/sipeed/maix-go/linux-cpio.config        |   2 +
 board/sipeed/maix-go/readme.txt               | 313 +++++++++++++++++
 board/sipeed/maixduino/linux-cpio.config      |   2 +
 board/sipeed/maixduino/readme.txt             | 286 ++++++++++++++++
 configs/canaan_kd233_defconfig                |  41 +++
 configs/qemu_riscv64_nommu_virt_defconfig     |  38 +++
 configs/sipeed_maix_bit_defconfig             |  38 +++
 configs/sipeed_maix_bit_sdcard_defconfig      |  56 ++++
 configs/sipeed_maix_dock_defconfig            |  38 +++
 configs/sipeed_maix_dock_sdcard_defconfig     |  56 ++++
 configs/sipeed_maix_go_defconfig              |  38 +++
 configs/sipeed_maix_go_sdcard_defconfig       |  56 ++++
 configs/sipeed_maixduino_defconfig            |  38 +++
 configs/sipeed_maixduino_sdcard_defconfig     |  56 ++++
 package/Config.in.host                        |   1 +
 ...tate-32-byte-alignment-for-.data-sec.patch |  81 +++++
 ...f2flt-fix-.eh_frame-section-handling.patch |  73 ++++
 ...4-elf2flt-add-riscv-64-bits-support.patch} |  80 ++---
 package/elf2flt/Config.in.host                |   2 +-
 package/python-serial/Config.in.host          |   6 +
 package/python-serial/python-serial.mk        |   1 +
 38 files changed, 2483 insertions(+), 54 deletions(-)
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
 create mode 100644 package/python-serial/Config.in.host

-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
