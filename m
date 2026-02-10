Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2DE94625
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A17827FD;
	Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzM51FGifHN6; Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24DB83C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682069;
	bh=JZqaOj2FKMWS5AZZouOcYWbCs4rBTUSUs3TUdfR+ht0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XREffR+Yyf6HCwPDBTaE8Bh/T00/JF2Qtq7cL6AzaYru6/FRARmDz4yMcdtVK8wIv
	 /YXqNHX2kpoXG3icz5SwnvKFnu6gKLiJoeo8p5Vt/c4NZU55vTSt2MkGBZ5D/1ZVy6
	 bJyiOcbL9s1tRM5+5tfe+ZVh3J4fwfCGwDuF+cJqdCe2tHAyh1znlMwM4wiDIer6R+
	 sYprsDk00mCoEdsHexPIZuWHiwxxlD+isO8k3GCSi6SBKa65Wra930/1KK8/RcIMxY
	 g14eFvkHmagRZoAFy9Kkq56AqOWw/mVNQntfHQEMAiuABvnDuyxGSiKnCfs/TU0JvW
	 JZFuPEY7N7v0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D24DB83C51;
	Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B7D219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8346640C59
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpD04L1d_WyH for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA7D840C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7D840C2D
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA7D840C2D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbI7vmsfr; Tue, 10 Feb 2026 01:07:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:26 +0100
Message-ID: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ2IqfWDInyav9qhFZgZkjH5kRuBDtLtbGekXDHdoZ0+Iv8m6V3LqutOhQot5QsO6GruIOav2HxHYxcRVY/PpCYFvb/PvP93inmW5AbTx/VfD/RMnI9C
 aWr+Y4NpC8bKxvejzqsHQlb1b2wn4QNs8xv0dsnaWW8q6rqCkqez40y2Do5F4Ym2RYaRQmTIM5mkC/xFYxtrz4uItkPQBzYBSVTpGTF45fvrptgwgqp4h2WD
 0NJLRPacDqWu6zIgHY2akW4t0Fvr4rUrfBIG2+2UqXOwvLF4p1O41+9mD+2I9G6RqgV8DHvC2F4P+FeXHIodjoaNQAC47Qb+LvVZp/tGytDVyf0DjVJ6K9eb
 w+YW259OTogW1j5X2cz0lNwDv6/XRIsqc9ujEkc6uc4IpcT6PLa/5zmyBZ73DpiWB0UJD+JUkshYNJ8y3GtdyW3tiOOSmh1ppPODISNHGVZxKsOBzI+i/qTV
 P61mMkSv26jcuRwSfKsQV25u9fd+wK5RVRPlEvCz+9b3xMYAtLFvucUs8o7lWHYNfVzenhW8TDLdGa5TEayp4FMdNsFxI9+g3q2W6Tv2Oh0ToqojKyFkh/22
 vKQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682064; bh=BFiKnPFaa9i9YWzX8jzALc6//e0B1QrSIwAspoT6m1c=;
 h=From:To:Subject:Date:MIME-Version;
 b=QgakiJJxxnLzHHQxztOloaBSYgGUbN9sMlc3HquFFFsFMLltOzXUKF6D/xD/PPRoB
 WeE/Mv+c/cRsaC35VUQE8ytCZZn5llJD24nopAcapOdQ8xa0V0ynfIRZxA/EcNHLNQ
 qDOSgGr4RvsSqzsc/lsssoPymNkrpUeLa10DqJV4fjx2PFs7ej4lEcpKXXf6eV8ZTi
 n/Vaw0Q32HRAOfcMQsiKMK93pZabJ/VtglyREfhjjVSMsQmGjDxfzWbPjIUIvIvl9c
 c7Jkm1MbhWaKy/U3b9h+kL3P6xJScOghb6TIvfxJmNmUOt9BCQEflZPnMZuao7C96g
 Nf9RbvLpoGvdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=QgakiJJx
Subject: [Buildroot] [PATCH v2 00/13] Boards Linux/Uboot versions bumps
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

this patchset bumps Linux/Uboot versions and moves boards to extlinux if
not already using it as well as force check hashes.
I've built and tested them all except a10_olinuxino since I don't have it
and I expect it to work.

Best regards
Giulio

---
V1->V2:
* removed common folders for bananapi and olimex and related softlink
* solved all .checkpackageignore errors
* reworded all patches according to the change of extlinux/force hash
All 3 pointed by Thomas Petazzoni
---

Giulio Benetti (13):
  configs/amarula_vyasa_rk3288: bump Linux to 6.18.8 and U-Boot to
    2026.01
  configs/asus_tinker_rk3288: bump Linux to 6.18.8 and U-Boot to 2026.01
  configs/bananapi_m2_berry: bump Linux to 6.18.8 and U-Boot to 2026.01
  configs/bananapi_m2_ultra: bump Linux to 6.18.8 and U-Boot to 2026.01
  configs/freescale_imx6ullevk: bump Linux and U-Boot to
    lf-6.12.49-2.2.0
  configs/imx6ullevk: bump Linux to 6.18.8 and U-Boot to 2026.01
  configs/mangopi_mq1rdw2: bump Linux to 6.18.8 and U-Boot to 2026.01
  configs/olimex_a10_olinuxino: bump Linux to 6.18.8 and U-Boot to
    2026.01
  configs/olimex_a13_olinuxino: bump Linux to 6.18.8 and U-Boot to
    2026.01
  board/olimex/a20_olinuxino: move rootfs_overlay to rootfs_overlay_mali
  configs/olimex_a20_olinuxino_micro: bump Linux to 6.18.8 and U-Boot to
    2026.01
  configs/olimex_a33_olinuxino: bump Linux to 6.18.8 and U-Boot to
    2026.01
  configs/olimex_a64_olinuxino: bump Linux to 6.18.8 and U-Boot to
    2026.01

 .checkpackageignore                            | 13 -------------
 board/amarula/vyasa/patches/linux/linux.hash   |  2 +-
 board/amarula/vyasa/patches/uboot/uboot.hash   |  2 +-
 .../patches/linux-headers/linux-headers.hash   |  1 +
 board/asus/tinker/patches/linux/linux.hash     |  2 ++
 board/asus/tinker/patches/uboot/uboot.hash     |  2 ++
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../bananapi-m2-berry/patches/linux/linux.hash |  2 ++
 .../bananapi-m2-berry/patches/uboot/uboot.hash |  2 ++
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../bananapi-m2-ultra/patches/linux/linux.hash |  2 ++
 .../bananapi-m2-ultra/patches/uboot/uboot.hash |  2 ++
 .../imx6ullevk/patches/linux/linux.hash        |  3 ++-
 .../imx6ullevk/patches/uboot/uboot.hash        |  3 ++-
 .../patches/linux-headers/linux-headers.hash   |  1 +
 board/mangopi/mq1rdw2/patches/linux/linux.hash |  2 ++
 board/mangopi/mq1rdw2/patches/uboot/uboot.hash |  2 ++
 board/olimex/a10_olinuxino/boot.cmd            |  1 -
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../a10_olinuxino/patches/linux/linux.hash     |  2 ++
 .../a10_olinuxino/patches/uboot/uboot.hash     |  2 ++
 board/olimex/a10_olinuxino/post-build.sh       |  1 -
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++++
 board/olimex/a13_olinuxino/boot.cmd            |  7 -------
 board/olimex/a13_olinuxino/genimage.cfg        | 18 ------------------
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../a13_olinuxino/patches/linux/linux.hash     |  2 ++
 .../a13_olinuxino/patches/uboot/uboot.hash     |  2 ++
 board/olimex/a13_olinuxino/post-build.sh       |  7 -------
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++++
 board/olimex/a20_olinuxino/boot.cmd            |  5 -----
 .../a20_olinuxino/patches/linux/linux.hash     |  1 +
 board/olimex/a20_olinuxino/post-build.sh       |  3 ---
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++--
 .../boot/extlinux/extlinux.conf                |  4 ++++
 board/olimex/a33_olinuxino/boot.cmd            |  5 -----
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../a33_olinuxino/patches/linux/linux.hash     |  2 ++
 .../a33_olinuxino/patches/uboot/uboot.hash     |  2 ++
 board/olimex/a33_olinuxino/post-build.sh       |  2 --
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++++
 board/olimex/a64-olinuxino/boot.cmd            |  6 ------
 board/olimex/a64-olinuxino/genimage.cfg        | 18 ------------------
 .../patches/linux-headers/linux-headers.hash   |  1 +
 .../a64-olinuxino/patches/linux/linux.hash     |  2 ++
 .../a64-olinuxino/patches/uboot/uboot.hash     |  2 ++
 .../rootfs_overlay/boot/extlinux/extlinux.conf |  4 ++++
 configs/amarula_vyasa_rk3288_defconfig         |  9 +++++----
 configs/asus_tinker_rk3288_defconfig           | 11 +++++++----
 configs/bananapi_m2_berry_defconfig            | 11 +++++++----
 configs/bananapi_m2_ultra_defconfig            | 11 +++++++----
 configs/freescale_imx6ullevk_defconfig         |  5 +++--
 configs/imx6ullevk_defconfig                   |  9 ++++++---
 configs/mangopi_mq1rdw2_defconfig              |  9 ++++++---
 configs/olimex_a10_olinuxino_lime_defconfig    | 16 ++++++++--------
 configs/olimex_a13_olinuxino_defconfig         | 14 ++++++++------
 configs/olimex_a20_olinuxino_lime2_defconfig   |  2 +-
 configs/olimex_a20_olinuxino_lime_defconfig    |  2 +-
 configs/olimex_a20_olinuxino_micro_defconfig   | 16 ++++++++--------
 configs/olimex_a33_olinuxino_defconfig         | 16 ++++++++--------
 configs/olimex_a64_olinuxino_defconfig         | 15 ++++++++-------
 61 files changed, 152 insertions(+), 155 deletions(-)
 create mode 120000 board/asus/tinker/patches/linux-headers/linux-headers.hash
 create mode 100644 board/asus/tinker/patches/linux/linux.hash
 create mode 100644 board/asus/tinker/patches/uboot/uboot.hash
 create mode 120000 board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash
 create mode 100644 board/bananapi/bananapi-m2-berry/patches/linux/linux.hash
 create mode 100644 board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash
 create mode 120000 board/bananapi/bananapi-m2-ultra/patches/linux-headers/linux-headers.hash
 create mode 100644 board/bananapi/bananapi-m2-ultra/patches/linux/linux.hash
 create mode 100644 board/bananapi/bananapi-m2-ultra/patches/uboot/uboot.hash
 create mode 120000 board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/linux/linux.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/uboot/uboot.hash
 delete mode 120000 board/olimex/a10_olinuxino/boot.cmd
 create mode 120000 board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a10_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a10_olinuxino/patches/uboot/uboot.hash
 delete mode 120000 board/olimex/a10_olinuxino/post-build.sh
 create mode 100644 board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
 delete mode 100644 board/olimex/a13_olinuxino/boot.cmd
 create mode 120000 board/olimex/a13_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a13_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a13_olinuxino/patches/uboot/uboot.hash
 delete mode 100755 board/olimex/a13_olinuxino/post-build.sh
 create mode 100644 board/olimex/a13_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
 delete mode 100644 board/olimex/a20_olinuxino/boot.cmd
 delete mode 100755 board/olimex/a20_olinuxino/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino/rootfs_overlay_mali/boot/extlinux/extlinux.conf
 delete mode 100644 board/olimex/a33_olinuxino/boot.cmd
 create mode 120000 board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a33_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a33_olinuxino/patches/uboot/uboot.hash
 delete mode 100755 board/olimex/a33_olinuxino/post-build.sh
 create mode 100644 board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
 delete mode 100644 board/olimex/a64-olinuxino/boot.cmd
 create mode 120000 board/olimex/a64-olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a64-olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a64-olinuxino/patches/uboot/uboot.hash
 create mode 100644 board/olimex/a64-olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
