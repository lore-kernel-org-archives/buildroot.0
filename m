Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B5D39013
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E2D81160;
	Wed, 14 Jan 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CrfvCn5d_v9; Wed, 14 Jan 2026 19:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306C681181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420505;
	bh=tULqvfSIzcF4RoQg2xNie7UYEB+ExDuM9mxm/zlrh3k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lK0oeo5Zd2qDFVd6fiaHGau54JJO6M1vSKfnyKnLoFzV0cr7BRl0cHBnDEuU4BrAo
	 vAkV6J4wX7ltrVbVJzlWaMH7zYNVHo4UfvpjyAVtNNWMAPmMtjkF3xKfOqWaZQ6GsA
	 O8Yqz7pH8824POtKhUpqhcdlSKm5uYZyjGcmPL+rqdMp4tY78tuKQlF8XX0KiQ1dOJ
	 0t6RR8rl+XltDDV3tNaPcgbM9afwCa9Pcg/HvTDa3zKHT/VajqpwWpH3DGrm6ZxlYt
	 u4xgH9HfD7Pw1VHuFwnsEnB64VpAHiapctBVVzmTITugXGCwSdXMIX5Z8/WsVPD4gk
	 s7Nh/sy0kblAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306C681181;
	Wed, 14 Jan 2026 19:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F25232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DCC960BBF
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hw-Khw8R9lUt for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EAE360BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EAE360BBC
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EAE360BBC
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xAvzgaY; Wed, 14 Jan 2026 20:54:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:33 +0100
Message-ID: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCgihcE5ANmE4LoHgsJ0LdLfOfwXyZ3Wgr7NMVIpSAtKb/gCpuHhOcVSMxAytoPXiqI5fhxDf9hH/9Aico/jP0oh8SMLt12r69TB593xFV12CpUJiwmt
 iVoFKbMBHRwEdRtw+k8RrbLuuXxCxTGgp97TSaP+Qhkb0jMST2CRNv2ZCnezo+D9F+7AKHLxXoKvVVLYS5gdenKcmBwnsA8hDQJYZecQGdpuCEei1zyaoN5L
 WIRs6xIb/ac/arWlhDpTS5YrmAYQjBoM6d1LtjjkdNM/Fbg3i4NRilmcmnrNYL00QzjVKkuhRNkVzBhZrB6aR0IT5qbMcDNDDEnS8zhxKjlz9xPyW1OaWh5t
 pGQELGGZWehu8sRFmI4fLwfYBOMXSGTwEtVweX4OxWANLEdIGPuz4xzRyTtL2ssyOyCKLlXJmIg6Q8tfYxG0mG76UuwiiGOuV0jWRh7Tf7ryOGMsmufeC2Mx
 OCIWZvLYHeWBr+OIvgJDD22Sdok6qgXhQ1IV4NmFWRwf6XImidWQtDBXSkYfAt/CdEOt8TpX/93NQIGz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420493; bh=RGJqGcyECmNCJwJYCM3kTqch623xjc8yHLUaWemQffE=;
 h=From:To:Subject:Date:MIME-Version;
 b=WapJzc0SYEFNnn5t1caBb4eTDX0Pm/7PGdjL4HkQVfM50ToIRSEfFsAn0XqZ2c8UP
 IKXt4kJWv2m9NBfjD7BjV+SNBimoHDA3CWfRpi53hnOhAwNQoYSY0WJga0dG8+3aXK
 oGBqzr5A/88i1UD3nVaFBhxj+oQDJbYm3uqRt1z5J5DsA6AlH71UwCDXBXS9O3BU1h
 +oxDlLSJy3kp+Bn6t1wDgise4CIv8fZlQnoqtzrJgmKCKBxu8i2Q+yMzku090/O/fa
 CfnRGvw3ghwjPrAvYboZFmxaF8V/s2ob+aorEr4icDYSNimYxYJPpqI0n3dC8/eHO1
 D3LknXNTv3MQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WapJzc0S
Subject: [Buildroot] [PATCH 00/17] Boards Linux/Uboot versions bumps and
 folder simplification
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

with this patchset I try to simplify bananapi and olimex boards to have a
common structure to reduce file count and redundancy. I do this while bumping
Linux/Uboot versions and moving every board to extlinux.
I've built and tested them all except a10_olinuxino since I don't have it
and I expect it to work.

Best regards
Giulio

Giulio Benetti (17):
  configs/amarula_vyasa_rk3288: bump Linux to 6.18.5 and U-Boot to
    2026.01
  configs/asus_tinker_rk3288: bump Linux to 6.18.5 and U-Boot to 2026.01
  board/bananapi: simplify berry and ultra configurations
  configs/bananapi_m2_berry: bump Linux to 6.18.5 and U-Boot to 2026.01
  configs/bananapi_m2_ultra: bump Linux to 6.18.5 and U-Boot to 2026.01
  configs/freescale_imx6ullevk: bump Linux and U-Boot to
    lf-6.12.49-2.2.0
  configs/imx6ullevk: bump Linux to 6.18.5 and U-Boot to 2026.01
  configs/mangopi_mq1rdw2: bump Linux to 6.18.5 and U-Boot to 2026.01
  board/olimex/axx-common: introduce folder to avoid files redundancy
  configs/olimex_a10_olinuxino: bump Linux to 6.18.5 and U-Boot to
    2026.01
  configs/olimex_a13_olinuxino: bump Linux to 6.18.5 and U-Boot to
    2026.01
  board/olimex/axx-common: add Linux patch to fix non-deterministic MMC
    enumeration
  configs/olimex_a20_lime: switch to axx-common
  configs/olimex_a20_lime2: switch to axx-common
  configs/olimex_a20_olinuxino_micro: bump Linux to 6.18.5 and U-Boot to
    2026.01
  configs/olimex_a33_olinuxino: bump Linux to 6.18.5 and U-Boot to
    2026.01
  configs/olimex_a64_olinuxino: bump Linux to 6.18.5 and U-Boot to
    2026.01

 board/amarula/vyasa/patches/linux/linux.hash  |  2 +-
 board/amarula/vyasa/patches/uboot/uboot.hash  |  2 +-
 .../patches/linux-headers/linux-headers.hash  |  0
 board/asus/tinker/patches/linux/linux.hash    |  2 ++
 .../tinker}/patches/uboot/uboot.hash          |  0
 .../bananapi/bananapi-m2-berry/extlinux.conf  |  4 ---
 .../bananapi/bananapi-m2-berry/post-build.sh  |  6 ----
 .../bananapi/bananapi-m2-ultra/extlinux.conf  |  4 ---
 board/bananapi/bananapi-m2-ultra/genimage.cfg | 16 ---------
 .../bananapi/bananapi-m2-ultra/post-build.sh  |  6 ----
 .../genimage.cfg                              |  0
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../bananapi/common/patches/linux/linux.hash  |  2 ++
 .../bananapi/common/patches/uboot/uboot.hash  |  2 ++
 .../boot/extlinux/extlinux.conf               |  4 +++
 .../imx6ullevk/patches/linux/linux.hash       |  3 +-
 .../imx6ullevk/patches/uboot/uboot.hash       |  3 +-
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../mangopi/mq1rdw2/patches/linux/linux.hash  |  2 ++
 .../mangopi/mq1rdw2/patches/uboot/uboot.hash  |  2 ++
 board/olimex/a10_olinuxino/boot.cmd           |  1 -
 board/olimex/a10_olinuxino/genimage.cfg       |  1 -
 board/olimex/a10_olinuxino/post-build.sh      |  1 -
 board/olimex/a13_olinuxino/boot.cmd           |  7 ----
 board/olimex/a13_olinuxino/genimage.cfg       | 34 ------------------
 board/olimex/a13_olinuxino/post-build.sh      |  7 ----
 board/olimex/a20_olinuxino/boot.cmd           |  5 ---
 board/olimex/a20_olinuxino/post-build.sh      |  3 --
 board/olimex/a33_olinuxino/boot.cmd           |  5 ---
 board/olimex/a33_olinuxino/genimage.cfg       | 17 ---------
 board/olimex/a33_olinuxino/post-build.sh      |  2 --
 board/olimex/a33_olinuxino/readme.txt         |  2 +-
 board/olimex/a64-olinuxino/boot.cmd           |  6 ----
 board/olimex/a64-olinuxino/genimage.cfg       | 34 ------------------
 .../genimage.cfg                              |  0
 .../patches/linux-headers/linux-headers.hash  |  1 +
 ...-sun7i-a20-fix-MMC-index-enumeration.patch | 36 +++++++++++++++++++
 .../patches/linux/linux.hash                  |  1 +
 .../axx-common/patches/uboot/uboot.hash       |  2 ++
 .../boot/extlinux/extlinux.conf               |  4 +++
 configs/amarula_vyasa_rk3288_defconfig        |  9 ++---
 configs/asus_tinker_rk3288_defconfig          | 11 +++---
 configs/bananapi_m2_berry_defconfig           | 15 ++++----
 configs/bananapi_m2_ultra_defconfig           | 14 ++++----
 configs/freescale_imx6ullevk_defconfig        |  5 +--
 configs/imx6ullevk_defconfig                  |  9 +++--
 configs/mangopi_mq1rdw2_defconfig             |  9 +++--
 configs/olimex_a10_olinuxino_lime_defconfig   | 18 +++++-----
 configs/olimex_a13_olinuxino_defconfig        | 16 +++++----
 configs/olimex_a20_olinuxino_lime2_defconfig  |  4 +--
 configs/olimex_a20_olinuxino_lime_defconfig   |  4 +--
 configs/olimex_a20_olinuxino_micro_defconfig  | 18 +++++-----
 configs/olimex_a33_olinuxino_defconfig        | 18 +++++-----
 configs/olimex_a64_olinuxino_defconfig        | 20 ++++++-----
 54 files changed, 162 insertions(+), 239 deletions(-)
 rename board/{olimex/a20_olinuxino => asus/tinker}/patches/linux-headers/linux-headers.hash (100%)
 create mode 100644 board/asus/tinker/patches/linux/linux.hash
 rename board/{olimex/a20_olinuxino => asus/tinker}/patches/uboot/uboot.hash (100%)
 delete mode 100644 board/bananapi/bananapi-m2-berry/extlinux.conf
 delete mode 100755 board/bananapi/bananapi-m2-berry/post-build.sh
 delete mode 100644 board/bananapi/bananapi-m2-ultra/extlinux.conf
 delete mode 100644 board/bananapi/bananapi-m2-ultra/genimage.cfg
 delete mode 100755 board/bananapi/bananapi-m2-ultra/post-build.sh
 rename board/bananapi/{bananapi-m2-berry => common}/genimage.cfg (100%)
 create mode 120000 board/bananapi/common/patches/linux-headers/linux-headers.hash
 create mode 100644 board/bananapi/common/patches/linux/linux.hash
 create mode 100644 board/bananapi/common/patches/uboot/uboot.hash
 create mode 100644 board/bananapi/common/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 120000 board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/linux/linux.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/uboot/uboot.hash
 delete mode 120000 board/olimex/a10_olinuxino/boot.cmd
 delete mode 120000 board/olimex/a10_olinuxino/genimage.cfg
 delete mode 120000 board/olimex/a10_olinuxino/post-build.sh
 delete mode 100644 board/olimex/a13_olinuxino/boot.cmd
 delete mode 100644 board/olimex/a13_olinuxino/genimage.cfg
 delete mode 100755 board/olimex/a13_olinuxino/post-build.sh
 delete mode 100644 board/olimex/a20_olinuxino/boot.cmd
 delete mode 100755 board/olimex/a20_olinuxino/post-build.sh
 delete mode 100644 board/olimex/a33_olinuxino/boot.cmd
 delete mode 100644 board/olimex/a33_olinuxino/genimage.cfg
 delete mode 100755 board/olimex/a33_olinuxino/post-build.sh
 delete mode 100644 board/olimex/a64-olinuxino/boot.cmd
 delete mode 100644 board/olimex/a64-olinuxino/genimage.cfg
 rename board/olimex/{a20_olinuxino => axx-common}/genimage.cfg (100%)
 create mode 120000 board/olimex/axx-common/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/axx-common/patches/linux/0001-ARM-dts-sun7i-a20-fix-MMC-index-enumeration.patch
 rename board/olimex/{a20_olinuxino => axx-common}/patches/linux/linux.hash (54%)
 create mode 100644 board/olimex/axx-common/patches/uboot/uboot.hash
 create mode 100644 board/olimex/axx-common/rootfs_overlay/boot/extlinux/extlinux.conf

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
