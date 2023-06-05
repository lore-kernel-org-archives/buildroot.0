Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2C7C7EE2E
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 930D660E80;
	Mon,  5 Jun 2023 08:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 930D660E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wi4HazeYJydA; Mon,  5 Jun 2023 08:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6297060E1D;
	Mon,  5 Jun 2023 08:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6297060E1D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 062291BF4E7
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 863E141746
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863E141746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr36pt3A9J2I for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:49:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C010741744
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::619])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C010741744
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD1h6dEa8h0b+xtWbBtFkk+3j/dbZSX5w/e7Kq4tfhD6McbJ74ZOmfwItvVKAOz/ppAW4p1Y0hbRx9xprwuPoX/8fYYsYzJc4n/UnNialkn6pmhMb9b0LCCuMmkra0ScFf5qn8UtW0W6clV0T/Xfb2pYdbIgxxHdoaGlI/utTyVsSCqv7VIv9olx7QRAaKr76hxesE7rXRJNtYdZYSkZOsvo0fX/4qPebvWktEOyipnNS/BB4lzR3Lu224iqVqc1pPLpRcWQVa+mZfSutFIaO1Ti8NEaqYb4ZkjqXP922dCF+59qKeZhlQSfRu4CVp14dHShEr0t3IyFRQbCxtpR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt9J9zm5SorojDpDrO6RNsr6O8QwrShXbj9rxqPuJLQ=;
 b=OmtC5nQymV4A0FiSIv6Xkh7dVuzwUNzo8DOIFx6gnjoeMy6TcGM1qXY1oXNXL7NPu18mLtjBKbs/tXSaFqNnm2P8EORcTmUsZEd5rNRVgVOpXTT+ZxbGX9qt4Pe0+KKqqe5TWe26MLfhYcWBnxnSWhSUex7nSJueLa/CtEncY/y4igiC2c2FeGTW+I5UWjLGHC70nsJlkKme2P2rG13Cs3aMBaco2FSoc063Kb6RM1yyNkVLClbFq74dDXrVz/u6bT6d+qyv57Rd+YrN3ayQUMKnRUnWNRFNyV1Kh1KtEOsAxWDAqC3tsjvc+BNaLGvo95HFUQgOQ+JZ/Xq10M3UaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Mon, 5 Jun
 2023 08:49:33 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 08:49:33 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Simek, Michal"
 <michal.simek@amd.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig: new defconfig
Thread-Index: AQHZk7FNmf5aUGuSHkeT7n/TSbG9Qa976ZuAgAAAdtA=
Date: Mon, 5 Jun 2023 08:49:32 +0000
Message-ID: <CH2PR12MB5004C7CFDAA48AA6B4EB0142F04DA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230531111602.1623985-1-neal.frager@amd.com>
 <20230605103409.129d9ea9@booty>
In-Reply-To: <20230605103409.129d9ea9@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH2PR12MB4310:EE_
x-ms-office365-filtering-correlation-id: 0c45f24f-6571-413c-0073-08db65a1c830
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vhFPfrutcfBZut7iiX8l7tFQwbQtP1IHQg6Zz34/PN/JrFl8ITgYPU+OLeoEoNEu4peGHe4PJEDiqfsoLn09guAwD2eH/PurVWPtxbH2d3y3i+4peX0tmIBQ9eaccgMSjM9rA4YftH7S/i7a5w+2YR4124zhWrjusMZpqVecg4dut0ThbwXeDmMcQRXkl2bwf2ENsNvSnk+4OrlFKZWu1YJdFb9vcjPkIoCpOqJ+b57UblxS32+2iSEqW+jgdZ70QOzSF8ZDUkitGH0WbUNMVe2+yyABHOt5RAb54qbNvlT7TARDCmm9Pa1tXdioHcGd68lWF/mTqYB9dtnrOwPncwSg2q9z9hh47A212KRLRH2sd5DqV1x7eM+dANDk4J+CXIMJEcS6Eh3HWBiez9awAW4qFP/1uUD7gbN0rGzpWYS1bq7G/o/n5hfFf2DZpcSbLz5W0cPLsE3Xe1VNXmiY41ga3ji6BF5WDSr2Gqbx1i2ivWD/cjZgT5oum+ayiyuOu551kjG+N3UqgrPzGX2KfwonPMDd5EvaIpnWqsSZ0ALpTUpsVlqePol9KQob56PEdOvbIb5AQuLbwLphPsIaOb+ttmfVf8t2abOQKJoWkpI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199021)(71200400001)(478600001)(83380400001)(33656002)(55016003)(9686003)(186003)(6506007)(7696005)(966005)(316002)(38070700005)(41300700001)(66946007)(76116006)(66476007)(66556008)(4326008)(6636002)(64756008)(66446008)(86362001)(2906002)(52536014)(5660300002)(8936002)(8676002)(110136005)(54906003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZM6ukPCHUsgVBIGAULfQc+FHCwXEjPNgre5d9wlMFCnY4ybLSmOBMcSHSlNl?=
 =?us-ascii?Q?IgPU773f7xGb3E0VKFFAux8aDxBcZYKYc2NRfQWUwbJeJHUv6WIU7SOVZwC8?=
 =?us-ascii?Q?Yw55SVlMGDWdLdxClOlwXfWNgQTyXWXjqVRGWR8oxrlgeJ8LNLQnxvdatBg3?=
 =?us-ascii?Q?3gHpGxys59qq8DSh7eB2JHoemiOs9kGjY8tR7mEtvTTHP69oHbel7+VJCkbr?=
 =?us-ascii?Q?nQnRM7ig/jKSYIh0DtcGBJ7KDucQBxT/kt27uX84QI1oT7d3c3tIkZ2/sJVa?=
 =?us-ascii?Q?x7r/+8MTy2DIgmd1cWshPGpkpfRwuFVaDf9UR+QEMRZRkJZCk+E/Cn4YPb2o?=
 =?us-ascii?Q?uNu12NCckICDfie/XJRcxYnOy6BldbRZYnpKnylpyGRmnpDkywCv0l0vlVzd?=
 =?us-ascii?Q?3nutLc34x993bLXggvB7Mf1u7mg6ab73dOZUP54vbZ7mkD78vJ5oefjK/Ttq?=
 =?us-ascii?Q?5kKUL3v4V74053nDGzOW+k8dqjFEBnhZLyAkANSddZjEfX78vL7vZzE6hdEE?=
 =?us-ascii?Q?EoudDIywdO5fdY9cYPBewMUOWm9jvLnmUQyfujqZg51F21dUzde3/HBnKuMu?=
 =?us-ascii?Q?1FnRGeywaXqmJ+uilKI8+DLmfDjZZE76I2XtHUA/2gtN+PnsCRarLSEhIQWG?=
 =?us-ascii?Q?r8/ApvtmgRmTisrKHMf+rL/VPNiCMY8S9ZOs5sA6/E55PBW7BQ/BSC9SdALR?=
 =?us-ascii?Q?vl+GjnKMxn8PH1PgCVM06D78nqxRXMH67hOlGijEYkxt3OR/B/JGLgCXQcnE?=
 =?us-ascii?Q?8p5Mu7JAsolJY1YiXf1ZxwrS5OsQDCi/g8ms/JhhLoHOIzmeENfvJgkEU5+Z?=
 =?us-ascii?Q?UM4S4xef4IAh8FkfQpqA7YmwepXjz0V15rO94Wl59xbYFSeDLKI1rai7AVV3?=
 =?us-ascii?Q?vCXcrxclUMWkN3Fqq7nv23hJrmKNiGyVDus4OAq42hyypKGb/MDDjhW8RqdO?=
 =?us-ascii?Q?y6wYW+irn8vXpdQprFomnUqj9lvvfsfmfi0vVh4Pkf0n74UscP4vnkpTSVSL?=
 =?us-ascii?Q?tIgMQrlaOEAKVtCJI9JGNU+/DRK9MxUeEPnxTgxflqOmRALTg/KwacOhxW5u?=
 =?us-ascii?Q?n6/ZKkLiwkm5oamcX4mB+Po6Lmn1KOdjoKnZ29rUz70fNa/SQJOENwznlUl0?=
 =?us-ascii?Q?1XAzIogGwv+KKe9zGBvYdvvgApcPJV5tWRLvG86sXiytRfhZD7eSibc6raN0?=
 =?us-ascii?Q?o3RKJ5e0QBNgTtWMQM6FEIRwDCpXkIMXeJesgRrATox6ZYt152LJsleIZ1+I?=
 =?us-ascii?Q?58ofl3eyhKE4xK22PHc9QC71u5rY5N+9ytUkXt9l/wLLUdhQGZjunveq2JlP?=
 =?us-ascii?Q?InqxZwD7+mewdstqigT2NeFoQ+UHbjxACRMYar9hPmOQzZd3M1ZIASEj8nna?=
 =?us-ascii?Q?d7Ke/6iK8W7hxqAG+Dq7gbpsYjoXVvp5+G8+48QzrMTSO+BQKCYIo76B5gtt?=
 =?us-ascii?Q?AwI3qXiMxIqyrgiNEKJ1ggyNsXatGDbJ+QJqybaeXjpqoebe1hnnfB0WbvB3?=
 =?us-ascii?Q?Ncjaa44fqf/vBdYZ2FQTXE+G7deZRoCiLrTGxzdTxfrqhi/NxX9TaNkiHZgM?=
 =?us-ascii?Q?Eiy3XQqrBPwRqOKtuIzm+a5uD/bP+JSZ2wzYd0lpPZZD2Qy973X+VBhIDQ57?=
 =?us-ascii?Q?tq72d/6hkdBspT184odqQQs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c45f24f-6571-413c-0073-08db65a1c830
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 08:49:32.5730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysVPk8eNxp0Xhp02zr+9f3ibJDIKLHYvB3i2xKjLhtOcYfSHVifB8ELM3uOkRM66
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt9J9zm5SorojDpDrO6RNsr6O8QwrShXbj9rxqPuJLQ=;
 b=03MiqGO/tQHkHwqba9k02WZySQcNnAU87RH3JpuVc4nsjiaFWTaA//kR8Mfa+ykpQp6hAEHhATiuz8si2/V6UO7TVAbiP1JPAMQYfFXLh2QyQ0Ca6Qogq9kWuztbbmPXphzZY5bhJTIZGOi99uNI/RA41TDgh/joFMhmR43adNs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=03MiqGO/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Bradley.Gamble@entrust.com" <Bradley.Gamble@entrust.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "david.evans@ebv.com" <david.evans@ebv.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hi Neal,


> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.ht
> ml
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key boot 
> config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus hard 
> configured for QSPI flash. A pre-programmed boot.bin comes with every 
> Starter Kit. U-Boot can then find the Linux kernel and file system on 
> the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash can 
> be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+
> K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this 
> reason, Kria Starter Kits will use a separate extlinux.conf file from 
> other ZynqMP evaluation boards.
> 
> 3. The KR260 has a USB to SD card bridge, so the Linux kernel and file 
> system are found on /dev/sda1 and /dev/sda2.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  DEVELOPERS                                    |   3 +-
>  board/zynqmp/kria/kr260/kr260.sh              |  12 +
>  ...inctrl-zynqmp-add-tri-state-controls.patch |  90 ++++
>  board/zynqmp/kria/kr260/pm_cfg_obj.c          | 496 ++++++++++++++++++
>  board/zynqmp/kria/readme.txt                  |  29 +-
>  configs/zynqmp_kria_kr260_defconfig           |  42 ++
>  6 files changed, 665 insertions(+), 7 deletions(-)  create mode 
> 100755 board/zynqmp/kria/kr260/kr260.sh  create mode 100644 
> board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-a
> dd-tri-state-controls.patch  create mode 100644 
> board/zynqmp/kria/kr260/pm_cfg_obj.c
>  create mode 100644 configs/zynqmp_kria_kr260_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e76717e845..26bcf93b0a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2152,9 +2152,10 @@ F:	board/zynqmp/
>  F:	board/zynqmp/kria/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc706_defconfig
> +F:	configs/zynqmp_kria_kr260_defconfig
> +F:	configs/zynqmp_kria_kv260_defconfig
>  F:	configs/zynqmp_zcu102_defconfig
>  F:	configs/zynqmp_zcu106_defconfig
> -F:	configs/zynqmp_kria_kv260_defconfig
>  F:	package/bootgen/
>  F:	package/versal-firmware/
>  
> diff --git a/board/zynqmp/kria/kr260/kr260.sh 
> b/board/zynqmp/kria/kr260/kr260.sh
> new file mode 100755
> index 0000000000..df8b0ccde5
> --- /dev/null
> +++ b/board/zynqmp/kria/kr260/kr260.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +# This is a temporary work around for generating kr260 u-boot.itb.
> +# The problem is there is no way to currently configure u-boot to 
> +apply # the carrier board dtb overlay during build, so all kr260 
> +carrier board # drivers are missing.
> +# This will be removed when u-boot can build the kr260 u-boot.itb natively.
> +
> +UBOOT_DIR=$4
> +
> +fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i 
> +${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb 
> +${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo
> +${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 
> +${BINARIES_DIR}/u-boot.itb
> diff --git 
> a/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp
> -add-tri-state-controls.patch 
> b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp
> -add-tri-state-controls.patch

> I know we have a similar script for the KV260 carrier, but I wonder whether U-Boot would be able to load the base dtb and then apply the overlay at runtime before loading Linux.

> Another question is of course: is there any effort ongoing to fix this upstream?

Applying the overlay at runtime could be a solution, but we would need a way to get the overlay file to u-boot, in this case.  
Without the overlay, we do not have the sd card interface, so it would need to be written to the qspi.

Perhaps Michal Simek can speak about our plans to fix this upstream, so the post-build fixup of the u-boot.itb is no longer necessary.

> new file mode 100644
> index 0000000000..422a5d091c
> --- /dev/null
> +++ b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zy
> +++ nqmp-add-tri-state-controls.patch
> @@ -0,0 +1,90 @@
> +From 560b2e0b6de66c4c9f4b261308263dd091c6002a Mon Sep 17 00:00:00 
> +2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Tue, 28 Mar 2023 14:42:59 +0100
> +Subject: [PATCH v1 1/1] drivers: pinctrl-zynqmp: add tri-state 
> +controls
> +
> +This patch enables u-boot pinctrl of the tri-state registers.  As it 
> +does not check pmufw version, it assumes version 2 of the pmufw 
> +pinctrl driver which comes only in pmufw 2023.1 or newer.

> Why is this needed? Since you are using a vendor U-Boot, it feels strange that you need further patches on top.

The u-boot 2023.1 release is missing control of the tri-state registers via the pinctrl driver.  
Without this patch, the usb bridge to the sd card interface will not be configured properly, so we have no sd card for booting Linux.

> Is this patch being upstreamed?

Our software team is working on it.  The pinctrl driver works with the pmufw underneath.  
Before 2023.1, the pmufw was missing the proper support for the tri-state registers, so the patch I am adding got reverted as you can see below:
https://github.com/Xilinx/u-boot-xlnx/commit/ab8bc7989b3ede27e5bc7666a0a2a4f6fed4b1dd

I expect by 2023.2, this will be fixed, so my patch can be removed from buildroot, but perhaps Michal can comment?

> As a general rule, every commit message should always explain _why_ the patch is needed. Explaining _what_ the patch changes is often evident from the diff and thus useless in the commit message.

Good point.  I could update the commit message.

> Otherwise looks good.

Thanks!

Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
