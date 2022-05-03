Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2952C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65DB740ADE;
	Tue,  3 May 2022 14:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dewnfYavihBb; Tue,  3 May 2022 14:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4877B4036F;
	Tue,  3 May 2022 14:57:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A15851BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EC084036F
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28gztQ84EUK5 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:57:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8B52400EA
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVzAxFxOxHsuxMekfuhCS13BXfUeqZ28bBrhlVOKbkgVLJhmNwJ5e5Em37HuPI1bsOmpaGmZtntNGcyjKuABXXnLU8MUckoCpglh/3HhBQ6DzqAjaCA5SYZKYN1pyGw0pOLiJKUh0VvREshXe9TTjAR6mJkbslLJL94yWgZ7kdnVGOF5123xQMs3MbKdntoXX3h//DCuvR5wSsSpe4oesTGlfdP009yMbMYRb6ptHDOP0zq06qn5NzVIX1UGnQe2/G4oMNK9veNg1GlKBpTn4RfplIdIM2w6eJnhAe9yiR/EX1e4z6fIpGSKncxUwU2F2fLPfWQRbzgetZ46uoDWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9oxq8TnrTRKLoGx9GUHhddLr4lGRL3R4BKjv2bQ4Og=;
 b=W2vDkg8Oa1Q+9FfzWoACyrK1li1pA7FLRiFcYggwk3aESwN8P5ohHkEyoR/6AlKGek5xQun7wN599yxX/MvssZDMQu732jKCNNZxEuuDJefuGA5oUmQewmws+OgLtuhfoM6e6RYyObgJsgrW1mqH7mZW83NdqQM2nRaoTP5+ekJxMY3puYn4ViQFXP4DN/tXmna0Y9SMs5fxW6TxeKpBT7HeiBNUH4HHIACJkzK60h5B+8AdB1A5jfJYY5wBOcvki3Ewx8ufHBii91LR5zqZiBE3fouf7JYf3omQ6EnumED5W+SQlS3p0iL05j0K1VY4mBfdLBtBG2CpL8AhW5ZYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9oxq8TnrTRKLoGx9GUHhddLr4lGRL3R4BKjv2bQ4Og=;
 b=D3Wd/fk4dXO1L1pG6/8LeCba0XFEO+Oi9vW7YIgivpWKhU2v4ytHZCXKGumz4lcljdYpXgLrWlXa7D5MxZG6esLD1Cq1YrYst2CNCt3d4oZWxbV8iUlo3N2Bc6iQ8nWp2HtNqePuWQa2x0TB3I52Tj1GOLptoCaqpFRbYo2pTDI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BY5PR02MB6083.namprd02.prod.outlook.com (2603:10b6:a03:1ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Tue, 3 May
 2022 14:57:44 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 14:57:44 +0000
From: Neal Frager <nealf@xilinx.com>
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to Xilinx
 2022.1
Thread-Index: AQHYXgEWuvUaJhqW4kOEzwcFjmReG60NP9kQ
Date: Tue, 3 May 2022 14:57:44 +0000
Message-ID: <SJ0PR02MB775888CEAA472672316A68F5D7C09@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220502084506.4054715-1-neal.frager@amd.com>
In-Reply-To: <20220502084506.4054715-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3499ba00-e4ac-466a-9e9d-08da2d1547cc
x-ms-traffictypediagnostic: BY5PR02MB6083:EE_
x-microsoft-antispam-prvs: <BY5PR02MB608331FCFC439D2C0DA3E013D7C09@BY5PR02MB6083.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IV0OccuqRM59Xm3QlyR0dDdIfQVtS6jtpMmQ+IzXv1K2rIyRWZNXzKxC+eIz9caxZIQufjYfahtbIbS+6cE6/YM6x0ZvWeCCo8LUscXtWngpGSBrO9jK41Zut03M/574IjK/YvD6+kXSBuaOU0k0DNIGkKRTzDut3h7lJ9XJJbB2kfTb2n8lurSQw1+CgKQ18xCgAoAVhaN5XSU4KuDlDbt2FtuWWPl4r9rssbsNLbubzbbLi1Y62lPNRfh5vmHbJ4P4HUO8NoeZylGOprcGjQ2c1hTe8rKRD7MkLc5AW3sQKm++EZInt/a9jLbiS0fqoRtgJLlYnO0C5KZU0edrm36cUv/DZvBVjZ1oS6cFMHkljQARjxdWDJwwuGAECrmT2l1O5EiV++Nl65AHNcNJXF5TU5UfkD7XBoC4DkaYs/DybDO5gucVkGmq5dNX6VZqKOjZJczDNEXPEVkXDsZ64+fIjFPOXACE4Kf3rqUuOV7meJsnzIEaFndbSXGN96kMsm2Id861xfuhPaq/fK70Ve9xK+/LtAU9XoWxpnW5cRp7tqCdbMkvSDLVAxTXTS4G+1t9fG+oZo2I8bny0tDhksSVG0JatPVrQUweAlMEwfgJqrmDw1QC7LTIEN0Y8RR6j5Be28hLRW4BWw/gHyj+LHmTEZ9iiBBWh47yl+3c/f+Y02J2H73bvl1ZL0KCDasPX9J03SHgJxjTN3FsYXPVZhgfGcwWfuLLbYquLk17dxfcvyv7fxyKi2aoFisMeqaT1BGsngHek+YPfNYxQhXQ9Tr2LnCMw8Ccb26Eg2f16PLlxNg0nzfcHiv53rxML5VuN/rnbETfvcHtH0k1c+MmBi2WwvnhqINgnVN3uoV4gLo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(64756008)(8676002)(83380400001)(8936002)(76116006)(52536014)(71200400001)(4326008)(508600001)(66946007)(66556008)(66476007)(26005)(186003)(9686003)(86362001)(66446008)(5660300002)(7696005)(2906002)(6506007)(38070700005)(38100700002)(55016003)(122000001)(316002)(110136005)(54906003)(21314003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j9jigcYzkgh6Vw5HXnk0or7YRL5uD4BnOw8+rUJyeGchvIXceUixTww55GlX?=
 =?us-ascii?Q?pUySCv2MctdYXI9xYNYWxSGET/XH2/wRDOGPCmUg6p9Z3L3zF7ku8X0Xcoem?=
 =?us-ascii?Q?ofX/3VXLGARhTCDvdrf8l8ooOigvyV8L1ALOoIzYD1f8gxY0lYdKnyKlbBhz?=
 =?us-ascii?Q?K4d7PvDpKOJ/p7JDR/xRKhrbztQjL6p9ESzSTeQmG8XaTjYrQaVYdxbs+su5?=
 =?us-ascii?Q?WNIgSnMkYxh6107h0lofsYq84kSKQSC1oCowSvTY+JEYP8FZx3vHzqvrfOaW?=
 =?us-ascii?Q?Wj0ATzU8NKYO6nVi0Ey52AJeYNGdG5XfJbdZmvwnO5tWpMe0H8PvBvggKrfO?=
 =?us-ascii?Q?EZd92+pLQLL+5cMOwlyb7fbESUG/BOscYG86HQEGsbwwVd/pvy4Ouka8y8Ny?=
 =?us-ascii?Q?qdurWha1oZOPLPO9wfecYELbbCNkOedyF5skhRU81vSoDNAoTMewWkonKlWz?=
 =?us-ascii?Q?zdd9U5KYlDBgNI1mGIkDhoDYMKub4Oa2GH9jp2kZtG2bmB2Y2CLlD7+iSdQC?=
 =?us-ascii?Q?VeRA++FneEj26YmmkMp+f/l5cdr5j+RT/G3M37lHM3iPqQdNCMraqAqG3Mbi?=
 =?us-ascii?Q?d7cg/UHmyieLzOdrfUEbx0wP3RTHw5BAQvug0/KN7BfstMcHXch7FndcaHrG?=
 =?us-ascii?Q?d/52sGmeRf3oEfGvlr01neaCUEgZgrOHnXTZI8abDfCNMmF7ezCew+dRuryu?=
 =?us-ascii?Q?C5TEtFywR+4JqVlDUq3pl3cu06nlRW+eson0maZfbhPPcl5LeDBBqRWc++RC?=
 =?us-ascii?Q?LEGh4G1EtyBjVPAE4H5zOhcWl+kiDwAhi27r2ckNkpeueQnUOYktNg/qD2CL?=
 =?us-ascii?Q?kvoyHZJLYwaSvo+jJfolxtOS90/BmjbNkr1C8k2pd9AkjT7zU6uaPwWgAU+c?=
 =?us-ascii?Q?2AyQiFEBEJdir+s5+j9v0KlSlDEXUQmhBW6koI/F+2F+0lB1uFmlxG0h11FW?=
 =?us-ascii?Q?nDVuGlIhFtnDJqq/Onn4sauxp1u1cYLwqY6Goqfl9CdqxC+trbrVbwN65oVM?=
 =?us-ascii?Q?OqlPzjTsBlinpbaJH+OO4P02BOjGNK/gNKSWdw0GqPgr6+PtpMCQkXvdT70L?=
 =?us-ascii?Q?LsWi3aB1A03MX4mMwLh/WWEKI0LHmPEYh7cpf+bpKzLtUizRbMu5wMf6GX47?=
 =?us-ascii?Q?eMADu027oSZwqb/H11d8V6BRZ+tENKr75HOzBF/grLUAyxxLboO8uxiWX80K?=
 =?us-ascii?Q?ZvWMgnA837iJaj+GF5nXPKCVUxN9+JBnaAarjVFp47Lhgd6bISnvruWIMqOu?=
 =?us-ascii?Q?PUIuhuF5hQTJY9HQTof2FsHTno8Obr70ptSp7ei7B+fFdu0ygNMODgPZXiWZ?=
 =?us-ascii?Q?YA6LWr4z8uqusYWSisJ6+QWNXSbtzpTuJFgH3KRT/SN97t1c4QWRYsueZBX3?=
 =?us-ascii?Q?8zzTieqxM9ieSXygTecfv1fgfzZRpvt2OPI5NLFaYn94CEaztUI1pP9ZmCy3?=
 =?us-ascii?Q?qxDwYEVfKQrQ69ULS6ujHCbpWtm4UbLM5Es+16K2HF0PVfzSItrMv8qcvJeg?=
 =?us-ascii?Q?bQjUGguvIGh2aNFGEJJbAj9x+BArnEn39faBAssdw8K8ynVpJKuVNc8h6wJa?=
 =?us-ascii?Q?JiJ1Mxw8NRSOXnlAp2RlCixqEYLnWz2KSbTEMRZVdatV1jM8R4GFgZ3gu4kC?=
 =?us-ascii?Q?/O18RKQaBgssTenO+V7j0PmFQDTXBBa5SmI5ulSvO3tmcRtb6iiefwTyg57B?=
 =?us-ascii?Q?TgiuRrbCdOJIWQtj509qAnRKrTW75OJhBCaoRwc/YC81aLqcftqquHUG3N6k?=
 =?us-ascii?Q?0am6VBFKSg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3499ba00-e4ac-466a-9e9d-08da2d1547cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 14:57:44.8345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRqlS5dUpdB/dOVToQO9Vt1rDPj9jUvc1Sgj1Lr1jfCAc97+wsD6QE24KDxxJCymXOfn7l39wLFZSgeNrc639w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6083
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2022.1
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

Just a friendly reminder regarding the configs/zynq_xxx_defconfig updates.  Have you had a chance to review the patch set?

Best regards,
Neal Frager
AMD

---

This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2022.1 which includes the following updates:
  - U-Boot bumped to 2022.01
  - Linux bumped to 5.15.19
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - U-Boot migrated from git clone to tarball for faster builds

This patch has been build and run tested on a ZC706 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/extlinux.conf        |  4 ++++
 board/zynq/genimage.cfg         | 11 ++++++++---
 board/zynq/post-build.sh        |  8 ++++++++
 board/zynq/post-image.sh        |  6 ++++--
 board/zynq/zc706/uboot.fragment |  1 +
 configs/zynq_zc706_defconfig    | 20 ++++++++++----------
 6 files changed, 35 insertions(+), 15 deletions(-)  create mode 100644 board/zynq/extlinux.conf  create mode 100755 board/zynq/post-build.sh  create mode 100644 board/zynq/zc706/uboot.fragment

diff --git a/board/zynq/extlinux.conf b/board/zynq/extlinux.conf new file mode 100644 index 0000000000..3c2ab4f46a
--- /dev/null
+++ b/board/zynq/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /uImage
+  devicetree /system.dtb
+  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg index 67baca795e..78eb9275dd 100644
--- a/board/zynq/genimage.cfg
+++ b/board/zynq/genimage.cfg
@@ -3,12 +3,12 @@ image boot.vfat {
                files = {
                        "boot.bin",
                        "u-boot.img",
-                       "devicetree.dtb",
+                       "system.dtb",
                        "uImage"
                }

-               file uramdisk.image.gz {
-                       image = "rootfs.cpio.uboot"
+               file extlinux/extlinux.conf {
+                       image = extlinux.conf
                }
        }

@@ -24,4 +24,9 @@ image sdcard.img {
                bootable = "true"
                image = "boot.vfat"
        }
+
+       partition rootfs {
+               partition-type = 0x83
+               image = "rootfs.ext4"
+       }
 }
diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh new file mode 100755 index 0000000000..9fd8bbf2c8
--- /dev/null
+++ b/board/zynq/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# genimage will need to find the extlinux.conf # in the binaries 
+directory
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh index 0cf92e0aa9..ac74286cf6 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -8,6 +8,8 @@ FIRST_DT=$(sed -n \
            's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
            ${BR2_CONFIG})

-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb 
+${BINARIES_DIR}/system.dtb

-support/scripts/genimage.sh -c board/zynq/genimage.cfg
+BOARD_DIR="$(dirname $0)"
+
+support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment new file mode 100644 index 0000000000..ad5efa6204
--- /dev/null
+++ b/board/zynq/zc706/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig index e8019177d2..82c47be7a5 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
--
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
