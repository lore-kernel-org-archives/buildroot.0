Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC1BC432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:41:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3224660E77
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3224660E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC254040A;
	Mon, 30 Aug 2021 04:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id is2_U8Cnir58; Mon, 30 Aug 2021 04:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9D34040B;
	Mon, 30 Aug 2021 04:41:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFE171BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFFE3606EF
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRyMcskxgTcm for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F07756067E
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298462; x=1661834462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GM6xRNIQy5tifS6BwaFk2va2hTuHNDjQfVLovssjrdo=;
 b=mKaybeMhk6Rvj4DvamxoRl5/SWttxrWaqU384o2iLd6Dl47a4UlWIYvJ
 lX4V86muypEC9x8UDwzX6R3kpIB4/sfysdz+N9saIrv4AAfPqEhcZ9psn
 /ipht3/3J34wdq0ULu2QI7WA75D0Wt11TbqqpCfrU3iP6MbNsrh7913xG
 4rThAdvYjgpI4A9TzHl6EM7jN3SQL6b4uqR2JpYktjYcWcEIqZb0x6zUu
 lpW1JbnkAaoki8jpRKS2SFvQmOqC8NO0ROhMC6p/J2SAZyaeP2BSCqxV9
 TeyyXSQ6k1geTGR9tfOpwajXvNu9P3PGYFZa1PnSHM4748SO7AjZVdULq w==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842477"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:02 +0800
IronPort-SDR: GV0HV+G0n8c2N2ZugD1Wyy6ifJpBZp1TiRtbBlRn5aWkCaCbsJFx2EcVZJa7PrydnJX1CLCEZ7
 4VWV4vdw/+abuwT1ODb0L9O0MxuU8aisBLCAvmRzLVzxvOrPCC6y3Wi83j7hd3cixjOqeFpu9N
 slK9ta55aEuLw3V+rBeCzKnzpgo3gJnQe5USecPla5vaq5bKTwx7HJsuAL4j4RH9DX+fgwF9qy
 G2Xo5RgwBo6+SALoSpbAF9WQMv1q4/4GBJQNbgHYgjfApeowIpNU4Y2Ycd2NLTx6Evya6M1V3f
 e+qi+iirk3PbfDbWurZBQ0P1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:17:52 -0700
IronPort-SDR: HT1MuUmMiA3NlkKv29+xeGaPRtijNsh3AoZg+1m7PxSulQjlV4/rwNBvebV/EKaaYl2mIWYKuW
 tff5yoBXcNm7Vb3Fpxd+iWK8U7KYku9wx0U9xG0sv3sdWF8OFMSH4oRxk8mPkiWO2ido6IpDZ1
 TKH5yNuEh/6/PrK2T/gxr0xubhDzsfbsEPHuILVvXOtyDJoMYD+su08f8vVatmIE38WMmY4oDw
 hmkQXPMEQ0Ox8BPtqZJaswdaCC2NBgeHvpv7+HglrABE6K1UTYvYbMztmoHi2d2Fxhp+sitqyK
 Y4Q=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:01 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:51 +0900
Message-Id: <20210830044100.260173-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This series adds support for building 64-bits RISC-V NOMMU kernel
bootable images for boards using the dual-core RISC-V 64-bits Cannan
Kendryte K210 SoC.

The first patch adds support for RV64 to the elf2flt package.
Patch 2 changes the base name of the toolchain cross-compilation
executables to avoid build errors. With these preparatory patches in
place, patch 3 makes MMU build optional for RISC-V 64-bits.

The following 5 patches add default build configuration files for
various boards: MAIX-bit, MAIX-go, MAIX-dock (Dan Dock) and MAIXDUINO
from Sipeed and the Canaan KD233 development board.

Finally, patch 9 documents how to build and install images for these
boards.

Note about patch 1: Many comments have been made on the elf2flt pull
request. The elf2flt support needs to be reworked but may take some
time. Until this is rewrite is completed, if acceptable, please take
this patch as a temporary support.

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

Christoph Hellwig (2):
  package/elf2flt: add RISC-V 64-bits support
  package/Makefile.in: Fix NOMMU RISC-V 64-bits toolchain base name

Damien Le Moal (7):
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
 board/canaan/k210-common/busybox-tiny.config  | 243 +++++++++++++
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
 configs/canaan_kd233_defconfig                |  15 +
 configs/canaan_kd233_sdcard_defconfig         |  14 +
 configs/sipeed_maix_bit_defconfig             |  15 +
 configs/sipeed_maix_bit_sdcard_defconfig      |  14 +
 configs/sipeed_maix_dock_defconfig            |  15 +
 configs/sipeed_maix_dock_sdcard_defconfig     |  14 +
 configs/sipeed_maix_go_defconfig              |  15 +
 configs/sipeed_maix_go_sdcard_defconfig       |  14 +
 configs/sipeed_maixduino_defconfig            |  15 +
 configs/sipeed_maixduino_sdcard_defconfig     |  14 +
 package/Makefile.in                           |   5 +-
 ...04-elf2flt-add-riscv-64-bits-support.patch | 299 ++++++++++++++++
 package/elf2flt/Config.in.host                |   2 +-
 29 files changed, 1069 insertions(+), 4 deletions(-)
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
