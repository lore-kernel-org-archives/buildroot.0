Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C85C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 02:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990F682F8A;
	Tue,  7 Jun 2022 02:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTIqiTqRoHYT; Tue,  7 Jun 2022 02:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794C182D75;
	Tue,  7 Jun 2022 02:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EB481BF476
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 02:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17C3482D75
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 02:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9iKryhC-23V for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 02:31:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A83F982CF1
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 02:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654569105; x=1686105105;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wyr0Bf1LORmUzAORKROsM89g4TmvjTkniFCrhJkKEOM=;
 b=CS/SdaxRqjUltPVy6NrDoEhM6C1G1LXR0LR+uNcLYsPy9egvq2GFz7Ii
 LdwO35diMK73BtVeWKjbQCpSS65mWcjda8ZCJnIOJEV+VMD+9gpcPSUH5
 GDiq4TYIUdtytGtApQSiwZuNHNSWlbbZgC+t2R1qMdYJN3KAWPidPzEyv
 un4mIVAVbvgT1b6QSgWBR5szP4lxPGfV6aialALOidnao29ZuEewIlAWc
 TfOGljUgXNk6Z0/+51U8yaqKayquXfGHlJHywsTW5CHdvjrKQ8tqpUupT
 9iFnGkYJaMd8HgmBWKnlZ2O4/ir3z760ADZroa++Z/0oS/8yddYI9YtXf A==;
X-IronPort-AV: E=Sophos;i="5.91,282,1647273600"; d="scan'208";a="201171032"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jun 2022 10:31:36 +0800
IronPort-SDR: 1VEDJWlMS1EKKZQfFXkFT+oKrQPJtBhLQgv31LWWO9lVpVBlHg/RUWdMMsRqBcqHtFC/HsCqG1
 iUDqLDsgnSXqG4C8jdB9Be/n1FSPKUtO5iNb30ECw7lnelkJk+heqMYgJD0EUAjFo5CtOYjGOt
 rv/aOHmKRuffqpvlIGbxjJsuRoq0PBQq97DqZ4kY7g2DPYymejJ2xWXZZlu80hVHCZXJAAroG4
 qcw3neZUJJJXmG2ixo9M9hizZxhB98UR6cJbkDfwEw9Msm/aTyn4xaqJWCYBM57evJzLwVmTMX
 Is4H4POAMi0Po/T9XTj/mqpR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2022 18:50:33 -0700
IronPort-SDR: 7hIYXreygTtL34ne+ED3XOI0kE2w+Xv2SnBLIKIg/8WIk1+HmbCT7gXDV6FngrRIagCLomO5LS
 M72mpFFHXnyZ38INK3t4FLK4oJbBCMb5YlsudumEWotHK0gZmc2uWVm1wJokvyhCIXYjGCz7UX
 w8wmM2fuZMTsTblJHZ/lY1Lp9/sDHJ/HpybaJo/GQV0SluL+SFWrBl9XA1rVlIvUAEZrW2YJnF
 NmrT6Eiy22Qg+6BY+dT4REES8XscBd/Ny5g2yo1gFMUaUlZwCEDjMOo1ncprT8eSvo9HnPaAZn
 nWs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2022 19:31:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LHDrS4nRBz1SVnx
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 19:31:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1654569095; x=1657161096; bh=wyr0Bf1LORmUzAORKROsM89g4TmvjTkniFC
 rhJkKEOM=; b=lhc0wdlRDaHr7q646VGLMPOJoF4GcWBwA15tWIBwfRL2t44woXv
 RPBtYE6I7OXzu9aXqpV+jedwBPiSj0a8rUZR6+N821PrrRl8Y4/7yNTima+PJKqy
 m/1pMVUZAIg9mOa+6Ucga4yRdUBrGLGLvfkDCQA5g1i1vD/hEGr2DjUf4x1um3+U
 jeE3UtNd8c6LLgWHp9yixJemPauyxGPiXC+Nc6vQp9Aa0z3vooRHArgtQBbcPUKs
 O1B5Iyou5cJ7JIc3rQ2VPigo7dvc5+j+YahnCwG6u1hUIeveBKUCKND+GHpoifqv
 naD0qJf7A56UcAe4chghVD/Kh3JaMmbNSFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IHOSZYG_16K7 for <buildroot@buildroot.org>;
 Mon,  6 Jun 2022 19:31:35 -0700 (PDT)
Received: from [10.89.82.246] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.82.246])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LHDrQ5ySqz1Rvlc;
 Mon,  6 Jun 2022 19:31:34 -0700 (PDT)
Message-ID: <e58d937e-3550-d063-c7d1-2cdde0ecd898@opensource.wdc.com>
Date: Tue, 7 Jun 2022 11:31:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Content-Language: en-US
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
Subject: Re: [Buildroot] [PATCH v3 0/7] Fix RV64 NOMMU and add Canaan K210
 SoC support
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

On 2022/05/31 14:49, Damien Le Moal via buildroot wrote:
> This patch series is a rework of the old v5 series "Add RV64 NOMMU and
> Canaan K210 SoC support" already posted some (long) time ago.
> 
> This series adds support for building 64-bits RISC-V NOMMU kernels (both
> bootable kernels and u-boot sdcard boot envronements) for NOMMU RISC-V
> 64-bits boards. The board supported include QEMU and many boards using
> the dual-core RISC-V 64-bits Cannan Kendryte K210 SoC.
> 
> The first patch is a simple fix of elf2flt configuration.
> 
> Patch 2 adds the configurations files common to all K210-based boards.
> 
> The last 5 patches add support for the following K210-based boards:
> * Sipeed MAIX Bit
> * Sipeed MAIXDUINO
> * Sipeed MAIX Dock (dan)
> * Sipeed MAIX Go
> * Canaan KD233 development board
> 
> For each board, a readme.txt file is added to document how to build and
> install images for these boards.

Thomas,

Ping ? Large backlog ?

> 
> Changes from v2:
> * Rebased patches on next branch
> * Modified patch 1 to address Thomas comments
> * Removed patches already applied
> * Modified patches 2 to 7 to remove the BR2_PACKAGE_HOST_ELF2FLT and
>   reference the global patch directory in boar/riscv/nommu
> 
> Changes from v1:
> * Modified patch 5 to add the python-kflash utility as a host package as
>   the new 1.1.5 version of this utility fixes the previously identified
>   problems with python dependencies.
> * Fixed patch 4 (qemu riscv nommu) to have buildroot configuration file
>   reference kernel 5.18.
> * Fixed patch 11 (kd233 board) to have buildroot configuration file
>   reference kernel 5.18.
> * Modified patch 7 to 11 to add the python-kflash host package to the
>   buildroot configuration files. The instructions in the readme.txt
>   file for each board are also updated accordingly.
> 
> Damien Le Moal (7):
>   package/elf2flt: Remove Config.in.host
>   board: Add common support for Canaan K210 SoC-based boards
>   board: Add Sipeed MAIX-Bit board support
>   board: Add Sipeed MAIXDUINO board support
>   board: Add Sipeed MAIX-Dock board support
>   board: Add Sipeed MAIX-Go board support
>   board: Add Canaan KD233 board support
> 
>  Config.in                                     |   2 +-
>  DEVELOPERS                                    |  11 +
>  arch/Config.in                                |   1 +
>  board/canaan/k210-soc/busybox-tiny.config     | 231 +++++++++++++
>  board/canaan/k210-soc/genimage.cfg            |  30 ++
>  board/canaan/k210-soc/linux-sdcard.config     |   4 +
>  board/canaan/k210-soc/post-build.sh           |  28 ++
>  board/canaan/k210-soc/rootfs_overlay/init     |   1 +
>  .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 +++
>  board/canaan/k210-soc/uboot.config            |   1 +
>  board/canaan/kd233/linux-cpio.config          |   2 +
>  board/canaan/kd233/readme.txt                 | 149 ++++++++
>  board/sipeed/maix-bit/linux-cpio.config       |   2 +
>  board/sipeed/maix-bit/readme.txt              | 316 +++++++++++++++++
>  board/sipeed/maix-dock/linux-cpio.config      |   2 +
>  board/sipeed/maix-dock/readme.txt             | 321 ++++++++++++++++++
>  board/sipeed/maix-go/linux-cpio.config        |   2 +
>  board/sipeed/maix-go/readme.txt               | 320 +++++++++++++++++
>  board/sipeed/maixduino/linux-cpio.config      |   2 +
>  board/sipeed/maixduino/readme.txt             | 292 ++++++++++++++++
>  configs/canaan_kd233_defconfig                |  39 +++
>  configs/qemu_arm_versatile_nommu_defconfig    |   1 -
>  configs/qemu_riscv64_nommu_virt_defconfig     |   1 -
>  configs/qemu_xtensa_lx60_nommu_defconfig      |   1 -
>  configs/sipeed_maix_bit_defconfig             |  39 +++
>  configs/sipeed_maix_bit_sdcard_defconfig      |  57 ++++
>  configs/sipeed_maix_dock_defconfig            |  39 +++
>  configs/sipeed_maix_dock_sdcard_defconfig     |  57 ++++
>  configs/sipeed_maix_go_defconfig              |  39 +++
>  configs/sipeed_maix_go_sdcard_defconfig       |  57 ++++
>  configs/sipeed_maixduino_defconfig            |  39 +++
>  configs/sipeed_maixduino_sdcard_defconfig     |  57 ++++
>  package/elf2flt/Config.in.host                |  13 -
>  toolchain/toolchain-buildroot/Config.in       |   1 -
>  34 files changed, 2180 insertions(+), 18 deletions(-)
>  create mode 100644 board/canaan/k210-soc/busybox-tiny.config
>  create mode 100644 board/canaan/k210-soc/genimage.cfg
>  create mode 100644 board/canaan/k210-soc/linux-sdcard.config
>  create mode 100755 board/canaan/k210-soc/post-build.sh
>  create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
>  create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
>  create mode 100644 board/canaan/k210-soc/uboot.config
>  create mode 100644 board/canaan/kd233/linux-cpio.config
>  create mode 100644 board/canaan/kd233/readme.txt
>  create mode 100644 board/sipeed/maix-bit/linux-cpio.config
>  create mode 100644 board/sipeed/maix-bit/readme.txt
>  create mode 100644 board/sipeed/maix-dock/linux-cpio.config
>  create mode 100644 board/sipeed/maix-dock/readme.txt
>  create mode 100644 board/sipeed/maix-go/linux-cpio.config
>  create mode 100644 board/sipeed/maix-go/readme.txt
>  create mode 100644 board/sipeed/maixduino/linux-cpio.config
>  create mode 100644 board/sipeed/maixduino/readme.txt
>  create mode 100644 configs/canaan_kd233_defconfig
>  create mode 100644 configs/sipeed_maix_bit_defconfig
>  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_dock_defconfig
>  create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_go_defconfig
>  create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
>  create mode 100644 configs/sipeed_maixduino_defconfig
>  create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
>  delete mode 100644 package/elf2flt/Config.in.host
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
