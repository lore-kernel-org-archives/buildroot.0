Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61206C27C55
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 04:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1499817B0;
	Tue, 11 Jun 2024 04:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znKIe2d2ZNDs; Tue, 11 Jun 2024 04:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 413F7817A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413F7817A9;
	Tue, 11 Jun 2024 04:25:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87B5D1BF3A1
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 04:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F3260885
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 04:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRT_GC2z2KYe for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 04:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13B58606A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B58606A2
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13B58606A2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 04:25:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0mcyKNsGims+YGY72Oqe1eypfC9yYaCu6F77OmOsRpm7os7xamszDj0K98S9r7jFjtBOKrm6LX04Ba4/Macu05ySoJFP9R0XMcMmd7TFwvhauThNQ1uLsvaZgJH+PPdtGI4+xZIlxmPJZOnY8p5xTZiGia7X/Jpqu5dOppyosq+7m2W0EqqokyvUOjvxCaFtupIAJLA9VHAQN7yiiw3zSA+n/lTBo14SAKDd3OCWR6tIlyjDF88UmKXZ+nrVCo01eeox1I3QmcEOlX+jd4fUiKQKnLjeOgjG/BAe6vwH007vXTcPAFBmWYjbXWxn5XcMQwBmRQtkEur2z0sK12PGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX3DWCFX8jhlskhyFkPSWGMJw3RQnSHj1UCklHC826E=;
 b=beJyoIxdG2F98RqD4v4DMQy6NEjRwACdZ8WBy+437vpm4RIZAfn6Q+70FX+62oKqBKJMFt6b2vY7gO7mXNexGKMcasurpfHjq0HwRuO8yaHzRv0BtL+nedTkvscviq8EPYmMOGRa7tZiSBhMkQm1lljlUzITc18B4RUNXiXPUV+cV7noPYVAFGSip7TO6gb2aPWNA9FH83EGUeQs2T2q8grnvnDSAmeVRDkVuBqhuIbG5F8GrHNVjXR9E5SL7fDIs48C3W4+0txFMYM6bDzKA67DYa+juxFZtN6MhaQxk3MEOu2txJK8apAl29AqtCHlT1Lyit+xohlaKnFcWbqPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 04:25:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 04:25:18 +0000
To: Brandon Maier <brandon.maier@collins.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
 firmware
Thread-Index: AQHauL+w9GZ3wdE+SE+CYlYttlT1wbHA/isAgAD+odA=
Date: Tue, 11 Jun 2024 04:25:18 +0000
Message-ID: <CH2PR12MB50042C00F9855873491C5ACEF0C72@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240607094705.1962913-1-neal.frager@amd.com>
 <Zmb7uMNqFU1ihhVg@bspbox.kirk>
In-Reply-To: <Zmb7uMNqFU1ihhVg@bspbox.kirk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CYYPR12MB8856:EE_
x-ms-office365-filtering-correlation-id: cd689f96-bcb3-4622-0da1-08dc89ce7fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YLL+EfRcYabaCoNsBQ5b+P6fkFAtN5E1zDyjkcCAv88Lri4HL4esgcw7W1vs?=
 =?us-ascii?Q?AXM34e/ngcM8Aeb9JCQxUo9OaR6MBjxLWiB42xlxYpf29Evl3z1pm5WLjdpO?=
 =?us-ascii?Q?pgg3hcWtnkBrazeLqdlXXuUCAewq6rbKq0HuHrCbUe5Imv554zgIdl1ibtC6?=
 =?us-ascii?Q?6G3SDgL/M56w3lHxiv+1nmE3Sd3XPHImjZ5kSu7CginN4qmVB89asduXmkgv?=
 =?us-ascii?Q?bDJ/GveMTc/hOBwYa0AxbfDl9sXAvMlY3LRb9UrjJOSn69F5BJd1M3EVNFSp?=
 =?us-ascii?Q?tKd/McIcgZq4aYv9NGBEUE3mLuRh9xfMcgwTnO61vMYr0JiIxc/5aeF8pt3M?=
 =?us-ascii?Q?93n21xxP1/oPU+vnxgbmSXIN7qC403rywXb181ZHcOvn7T39VlTzuwAo4Z/J?=
 =?us-ascii?Q?g86IrPH+7cT+bf+ScHeJSW3hsJym+kpiKtHwImoJyy7l1Dxkp4X54DOvmDC1?=
 =?us-ascii?Q?G0qTR1tC9klLoddBjI0Qww7TDIJ7gfzcR+iwip6dniKh/vGwUKv5DYTscruz?=
 =?us-ascii?Q?7K4MgcTAzKCIURG7tIjMaY2SgOzM9BmgYyUTKQ7dr+liiCK/DIoZ+JQttbeU?=
 =?us-ascii?Q?Wq1w/OGh2Ihe16Buv0Jf8O3qXXE3oF1IxuejfNvYELS6WR5s5TvrDtllwXdm?=
 =?us-ascii?Q?XuWVI8WJfNM4H73PMBR0QwQI/jLhMkqsJPJUiHDqQTjEx2GbDp/GmGnvab37?=
 =?us-ascii?Q?G8hhIY6JdnIdof+TdnqeXNgfvEZnRT5wjGYruk95ZVFYW7BW07WLGYlS89Zl?=
 =?us-ascii?Q?yGbC5w+pwPdoeS+km8RFho9rHlB72ZBgoxPBZA4K7G1JCsY4fCTVyDSsRI3h?=
 =?us-ascii?Q?YURzcYm26O1wRcI0jjoc8pnZ1UyBBmssJCKqE2UuKkGuCAwI7DbUZe1j/34n?=
 =?us-ascii?Q?NS+7ckpoOH35o8+V06OtbgJobG3uwwvOM6AIpOMV/DBirq6ohPXT3DtmWYFy?=
 =?us-ascii?Q?f7Bnk1gh2G5JGnBdxlzBCRRpG1NNJpReMylXdIsgTNalFSZ1GDgwXCJzrz2L?=
 =?us-ascii?Q?COEMrW+Opdo4YBHH44ajh7y6+n3VDJ5TQMlCaNiztKPhNFAN6rnm5fGbuDpF?=
 =?us-ascii?Q?d9jt9hBFiJ2/xZHH7EpV+lNVkx+cuuoEELwENuTXAnrRtz9IZF4RD+ddAUzK?=
 =?us-ascii?Q?hbsTdo2Hj5Wooc9+PDBu09hlbg7CCXnsJ2ThzhrnvdCbedFzeN0Ob/u9+WFM?=
 =?us-ascii?Q?kHg/n11NBXL+0UwCkN4m7Jual7Hk0+2xgodmi//Kr1eNXbA0HYsUdbMgW3Mq?=
 =?us-ascii?Q?IdaGAQDRLzClI528cS29jyqXb8fR1l0f+s+D/irEOIGOjv6Qlg9MCA8H8oOZ?=
 =?us-ascii?Q?JV6Xze8aFuSUfZ5r6dcM1RevyKvTnW9Wz/ifVUSJ/zFmHg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jo9nt2MpM3q6RUKBlILkh7a/sbwV1GMQpMhOYcyy61fEJxCL+dKqkB2qgbEH?=
 =?us-ascii?Q?CMARuPAy2HM5soPkTW0ASC8jUuqPFIwtuglTbPxum/BDZbgtjOI/4Fmtqm3J?=
 =?us-ascii?Q?kMvOHKabp59ak+kknBOIUVfuGs/iJjMta7o3/SOUQ2vIit19fs2iWf0Jtfei?=
 =?us-ascii?Q?CJ6pOphQgHsb0IytU+b10iODs5ktN+Umt74PYmFNHg52Pne+K81BJqkRC6OG?=
 =?us-ascii?Q?BBekA9T9MS7cp6/2S9HPafcxIB8Mc6PUTX+uK7q7/MzL9WXIithZ3Hrdj5tW?=
 =?us-ascii?Q?96GDbrxNwvqtbly7tZ8Ez13RHs3BeiSzuiXGRsF7qEFj2A3Mt5DJILCOUtBh?=
 =?us-ascii?Q?Vsu7RR9HPqFUXnYiGZMEbQabijej4h6zM/U+l5MAJxqvzb7A6RzhKGTiMPkl?=
 =?us-ascii?Q?TL9OqVs17Tn20nguBQsPKiq6Wt2ULel+lups3VNUZPleDv3HnNFZev946XHd?=
 =?us-ascii?Q?2M1zmirFfOXxp5/B17tly3xX6iPGV6WTdecZiWVaBrqz0+9r0T+baoNKUIBh?=
 =?us-ascii?Q?vceKXkj3RdoGvTap3BYsToaGFIpKiQFmTxl0xwvpuQT2wz9C6y+Or8mb650E?=
 =?us-ascii?Q?E3/sbv6IiompPaGQ21EbWaSGYCXxZU+zcWT+TolK7fBpBBC5yMOFpzfLJ0zu?=
 =?us-ascii?Q?JgONg2zRmJwIwPKljjeWAbOfp+A/52lMXIESQYiM9hWTvQluapBp5EczzXd8?=
 =?us-ascii?Q?Bgvzh7aCZGGyDBTGv0/EHfdQRve7vQmVRc//u1168M325vmQixhkcyNPtq9D?=
 =?us-ascii?Q?RgYYPxCCuRn9p3msTqOR9KPMpyB3LiHX6VXWaRwiAoCScmyj+YOZZ4cuByiZ?=
 =?us-ascii?Q?769SKvckhlwVZJ9+m40ayCsPyF6zbWLPf+4oKxQ1o1/cggPzEqybPHEUHUbf?=
 =?us-ascii?Q?TdLKEEwn0IOqdXjDXhdg7+AMSC7IpUeCIMwdsfM8u0XkH4vetDfFzR6+semw?=
 =?us-ascii?Q?3EOjZKyHUGyKYsL6AN6/tFHk/FEdZ2wcEkl4nDBNHw3VGYYag2tIhVraynMB?=
 =?us-ascii?Q?fRv1H/YgyzvosrG7fWl+ujD4F4q0shlpzWRelAkZwB6orm+17KSo2Ovpts7P?=
 =?us-ascii?Q?Prx1ZLtgMKRPOU5KSJvBDMyoivev4EQPNv/qc4Mby+F3Dt3vqUrdKzgy03wk?=
 =?us-ascii?Q?1S+qKArdx7OtDNiL9LVqj+BxAYyHxkWSyyZ1VDieOXDUzpzp4HCZMnNDdxhx?=
 =?us-ascii?Q?yZTbhVynJtEJ3IOBxldeq2cr6GsHvHpyLsgjyCk0Tw8AnJcAoIzaNhf0u2/P?=
 =?us-ascii?Q?PFLJDwN7zQmeUD9YBVrdBHll/vIDjxx9GJHjzPthFBe3zZCBPWmsUz8XBmWj?=
 =?us-ascii?Q?CmliQSaQOipi9+seNZl8NK2AJPlt+XPAkeA8HmuqmDsRg7/r++IoinPnjnA2?=
 =?us-ascii?Q?MiLkHIFqhzY6Wu/Qzc3dskPS9XfSBeKFuZCY+X3HUAZcQbbDFYBHbLrRcwvO?=
 =?us-ascii?Q?Wv28N2Qvvl568TDcBotkaHX8RaFqpu4LW4xdpRHMHsP9vzKKp98HsCt1HnRf?=
 =?us-ascii?Q?kWInOIxgXsj4yu04ESdx6Qq4+cn6cxEWLEsveHWIF/8E3v7aO+dMz02x3eOG?=
 =?us-ascii?Q?zBHnOd6oI1cOI0HKfgI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd689f96-bcb3-4622-0da1-08dc89ce7fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 04:25:18.1906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MaS7uKWbJwDz6SMM2toblQTW4LVAlYUJN1ZNCndHbdn4dW0gv9x3U5fk8MUw2SMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX3DWCFX8jhlskhyFkPSWGMJw3RQnSHj1UCklHC826E=;
 b=BN3ZetYm/u1X0vsX4wyVnW9+5EffFdgcBdMkqphRSllfKR9aASfJ8LB5L/DaTB+HPjHBqAxt9CA4zfvn3kzwsmbh8aBSvtaQyQgTXYNpiz3/dbxxpNrHRdLRDMZN2SrR4fOVXFhO6Xu47WKGsAe8krZ8JM2mienKm+1zaWW717c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BN3ZetYm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
 firmware
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - builds a bare-metal gcc toolchain instead of requiring an external
>    microblaze toolchain
> V2->V3:
>  - corrected custom cflags option
>  - added support for xilinx_v2022.2 version
>  - added zynqmp-firmware.hash
> V3->V4:
>  - no changes
> V4->V5:
>  - reduced all lines to <80 chars
> V5->V6:
>  - migrated to toolchain-bare-metal-buildroot
> V6->V7:
>  - removed patch numbers
>  - changed dependency to toolchain-bare-metal-buildroot
>  - removed hash since version is configurable
> V7->V9:
>  - no changes
> V9->V10:
>  - removed patches for supporting versions older than xilinx_v2023.2
> V10->V11:
>  - set default BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
>    "microblazeel-xilinx-elf" to avoid stand-alone build failure
> V11->V12:
>  - replace select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT with depends
>  - change variable name for check-package warning
> ---
>  DEVELOPERS                              |  1 +
>  boot/Config.in                          |  1 +
>  boot/zynqmp-firmware/Config.in          | 25 +++++++++++++++++++
>  boot/zynqmp-firmware/zynqmp-firmware.mk | 33 +++++++++++++++++++++++++
>  4 files changed, 60 insertions(+)
>  create mode 100644 boot/zynqmp-firmware/Config.in
>  create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cf48e01037..f3ff2cbbd5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2337,6 +2337,7 @@ N:	Neal Frager <neal.frager@amd.com>
>  F:	board/versal/
>  F:	board/zynq/
>  F:	board/zynqmp/
> +F:	boot/zynqmp-firmware/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/boot/Config.in b/boot/Config.in
> index 87e1b7c00e..64b1c8c420 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -23,5 +23,6 @@ source "boot/ti-k3-boot-firmware/Config.in"
>  source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
> +source "boot/zynqmp-firmware/Config.in"
>  
>  endmenu
> diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
> new file mode 100644
> index 0000000000..478d58d552
> --- /dev/null
> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  This package builds the PMU Firmware application required
> +	  to run U-Boot and Linux in the Zynq MPSoC devices.
> +
> +if BR2_TARGET_ZYNQMP_FIRMWARE
> +
> +comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> +
> +config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
> +	string "firmware version"
> +	default "xilinx_v2024.1"
> +	help
> +	  Release version of zynqmp firmware.
> +	  Only versions xilinx_v2023.2 and newer are supported.
> +
> +config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
> +	string "custom cflags"
> +	help
> +	  Adds additional CFLAGS for building zynqmp firmware.
> +
> +endif # BR2_TARGET_ZYNQMP_FIRMWARE
> diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
> new file mode 100644
> index 0000000000..dafb2dbe55
> --- /dev/null
> +++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# zynqmp-firmware
> +#
> +################################################################################
> +
> +ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_LICENSE = MIT

> In the license.txt there are other SPDX licenses types.

>  $ grep SPDX license.txt | awk '{print $1 " " $2}' | sort | uniq
>  SPDX-License-Identifier: BSD-2-Clause
>  SPDX-License-Identifier: BSD-3-Clause
>  SPDX-License-Identifier: GPL-2.0
>  SPDX-License-Identifier: MIT

> Should these be added?

> From https://github.com/Xilinx/embeddedsw/blob/master/license.txt

I am not sure.  While the Xilinx/embeddedsw repo contains code under all of
these licenses, all of the code used by the zynqmp_pmufw application is under
MIT license.  Do we need to include the other licenses because we are
downloading software covered by these licenses even if we are not actually
using it?

Perhaps someone more knowledgable about software licensing can advise?

> +ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
> +ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
> +ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
> +ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
> +ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
> +
> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
> +endef
> +
> +ZYNQMP_FIRMWARE = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
> +
> +define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(ZYNQMP_FIRMWARE) $(BINARIES_DIR)/pmufw.elf
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
