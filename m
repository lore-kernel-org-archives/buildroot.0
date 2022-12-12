Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95FC4167B
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 13:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D1CB405EC;
	Mon, 12 Dec 2022 13:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D1CB405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PI8mI2V_AHF; Mon, 12 Dec 2022 13:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 387A1405E3;
	Mon, 12 Dec 2022 13:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 387A1405E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 302F51BF389
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 13:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F03F960D94
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 13:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03F960D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0eu0M2vClWQ for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 13:47:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06CC60D91
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C06CC60D91
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 13:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1XZhcIo0L80GetKpKIJTW6aWTXdRqkbmcg3DPjl6i3Y1O4C5RG1yrJALPdlZet1WafiY/ODemgL7cQmRI2coTzRNp7tg9u3t8aUMsUGVKE0hDePuxD4vtPSuAoMa1i+C87dpZeIuX0lPUrnlMzhvs4CJY53JtCIKBnu8Zh+25tp4kgUH06QICvBGeZ9getzG7AWyWGR7KbdoS0hqFxDdFwBLCiAGaQUXKBxib2HhUxPV0i4/m9q7UMMh/8USV9+ZI8H2T834oKF8eE2ZardQ6CbgefXPpZr0fUsl3HLjPfno3ZhwTvfRMHFPIMyrrHM4pXx+j9HR7YFWsvhQGg4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE1D4M7G5l02RC7oFMJXi95P0u28Sz/mPl7JsvpSETk=;
 b=mIUdk9NzRDimLtCbLlKn7uCo026Cwq+cNZdYNI+PJPhrorwK51qGA9jcAGKAzvvwoUUPcQE2qm09OGtF1kC8y/OWiPVng6GOK3TBBlGxQGLe+bISIQFyqKEABZ6IjmPtD78BNUIlVH8yfyb17gw5SkoZaaFL4HL2C7HTk/LEPIf4OGrepZ/zsFBbaj7AEEfTiK9QoEuzIoW0FmhTk85d20o14/l9/V1Bt5MYKGSYG94W0btumD0tPyzqjFpuiw2Ui6j4NBXD1YAem0uUjRQAABe4TrsJNXL6dk+LIEB4v/7KXJ+wkpSse0yrZwewJAdixEn+aBsuzTfsJpGkuGytQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 13:47:29 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 13:47:29 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
Thread-Index: AQHZCjpT0S0ONWlwlEyKRNS8isY6ba5o8I8AgAAMLwCAAU0LUA==
Date: Mon, 12 Dec 2022 13:47:29 +0000
Message-ID: <CH2PR12MB50045ED2EDE0ABD845FC8D8CF0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221207124855.1831-1-neal.frager@amd.com>
 <20221211180336.79ea5b05@windsurf>
 <CH2PR12MB5004CD2B62F990D72C7EDFFEF01E9@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004CD2B62F990D72C7EDFFEF01E9@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH8PR12MB6796:EE_
x-ms-office365-filtering-correlation-id: 0213e9af-c19e-4ccc-6519-08dadc476978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mDKdms7KlxfkPsX+ULdExZWTOPEMyhDeZMMOFeHbawF1BOoAfmc3oLzYRDu9TaBPLnkOGGStxGwimho+nx8cStRccTYF2Af/2KgqJ356rEOxzC/BXOsdryLGCIuEOgkeqcwX0iE7FWB2L68rX3Vbhnj5xXFemwKy6ynY3gQK78MsbOihzUQXVEMXMO+VlqjwHrohBj7CL3uPfpntEbp0gFjn5RW06777PJvkmDim/2rrq94aQY/uZd9sFMGbhRJoPP30zdoDtGeMesEvC0E6wZ1v2i1GS2wYVTrHoKtNCtsrI9PD0YWGWc2qj6QFmKiG41HWXzjB2x9FMWnVFtIRwu/fylVVCCQJ1RQWDycKxE1qUPXYbBhjmWNua9ttpfjagtm+ju870ZjQJXgTLfgJAEbzjb7oN1YMjIBUXuHEYRN9HvVBiGl2we+7S79RtKPO3kuup18kRuzgCSonU27UnJP7yK0nkDGXDz2QDxNWdnRAkN+QURXjYLkLq5qoLX5W3lVRNGqkHDfLTTOsWGdR2qwe3xtv1iN6vJwqwpq+/okS5wx96ibhXq72kxQe14XHzHH7b1o9U0vYL4upe7TAqNYU7rXPmmVfCbgM3+Z1/2CVrJN0/+ObHe83YIhcLsoI9k82ZSEnjbmy/dDmDp1E0p3pnnw24Tm+j8MpjH/gk7GefJoRKTlgvQF09YWAWwuRprsTL+8ea/Ut2hR0hA5W2aWb9l15IZ7vhRTsMwqd6cupaPDkCLQ60HZN4k8oNoDkvLfB1AT/74FO3jwWs+uiHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199015)(316002)(19627235002)(110136005)(54906003)(7696005)(38070700005)(52536014)(8936002)(5660300002)(66946007)(8676002)(66556008)(66446008)(64756008)(66476007)(26005)(41300700001)(9686003)(76116006)(86362001)(4326008)(6506007)(83380400001)(186003)(33656002)(478600001)(966005)(71200400001)(2906002)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NhuWEzAfWB/GPXjp3HchE7dnSVrTpxTycC+r5PMi5hMHAzGZpjs46lTki/k6?=
 =?us-ascii?Q?gSS6YwrkoslZ4XpxpZfiXWqvWeUtCrmuexat97hQtwaTSsy5VvwuZtYoVd6m?=
 =?us-ascii?Q?zDpk6sYRjsdWdEJNj/UAyJ8rE+LiWl74FSUg8arhqtwWlQXPr7yR+E/O2PxW?=
 =?us-ascii?Q?fyqkCMu4SfxXauHEvUTxWxGDQifayiZI+mG8K+GI/PkAcQdbYuEqWd9A8qVF?=
 =?us-ascii?Q?64qy3w0l/vPL6XVtBXitShszdsWTJWIn9DL6n2cDpDa1cZQLVWqCOfz9j2uv?=
 =?us-ascii?Q?C9wy5Z0c3sf2YslBQyyolVroGUWSimQPucsdomcULsSjNcfXhRjqsEQ2NoMM?=
 =?us-ascii?Q?VFIHyhRItBJd8ToSyHmeVFdDWKyDiVnomJdh8+jR8HFgOJduqw4bChLLE4Et?=
 =?us-ascii?Q?ncmti6Aakqu5sTdM3w6CPNswVF0RJp1OnElfOdP20FahNRrsiX0C4P29A8Nr?=
 =?us-ascii?Q?gAZgd62GXjRBasZvAmB9MGRySeQpdQM6/JayKMXRCNEa7edyLOOVpmC3Jb4d?=
 =?us-ascii?Q?k7AcCDmyIQvo9XBMDz7SnDDe+IeCw3a4ZHA5q7wx8hoBggvHpNtDZV/iBYkF?=
 =?us-ascii?Q?8xV+S3mB8aJ7Xx0Gr+gOvnmqjWSOGOaejQSk+jUkmiIIIUSs1f3/RMoVB5cJ?=
 =?us-ascii?Q?fJmCsb0CJlRxqtMuFhjSBVOYyqwTfWcGjrqlSa58lDadgXpOLl9VmkS1nw8L?=
 =?us-ascii?Q?NfX0JI9j3h5b4X25j9gQUtqQcce7rvI+miMmEN8OgjNfs6/zExUwNUy6bBwY?=
 =?us-ascii?Q?z932XnwxpkvhuGn7SmETH+dmXVSXLHMhb2bc/R48H1sKQk0EfND5eAnbTzIf?=
 =?us-ascii?Q?01Hqtbyn69+PMRXvoCq/NCP2910qWrBZ9ySJPByz8i3n3jtCerbys3q3ISpT?=
 =?us-ascii?Q?MG4tV068ecDi+JIFoDiBXgdnB1t+gMtzT6l1nanGAIL3CEKL9jAPVAexxnQu?=
 =?us-ascii?Q?w7XcRbMZO+jQhuKYswT/fEr1IOlSUIW+Z/D1DXD3BvxSaT/GbhCtWMHlNmk4?=
 =?us-ascii?Q?IT4YmTOezCScNCeGlYtc914AS+NAwAi73V2pQz+xz81b9g1rJflFKJ9Gz7D4?=
 =?us-ascii?Q?jDGayFu5cUGnK9zBNASwWKly6YZja8cFWKz3OQoqHeZHYSXmmEaz5byljJAT?=
 =?us-ascii?Q?BAfBJ3NJHY8k7/kGBzDOMd3ESaJdlDf5GBCBRoPXAiZPScPJkJ40rdkD6jT+?=
 =?us-ascii?Q?hBMOrg/ggVS+55UB3HQ406Y2QiH4ieCH1cR9+JIlkjTlVIlzvhnvPqngCmMN?=
 =?us-ascii?Q?Gxoa59aWF9YXkVSNuvC5hX90dTaydhIPqJexTtcquXoLJozoMg56yyv8wyBV?=
 =?us-ascii?Q?2RcretJyhgcN4PqLLKIhFGMOLxyOrWHip1QQwuS7Yz6qJKW+TZkoW72fuZXG?=
 =?us-ascii?Q?kdpLD1YcI2gPOyhQh9NT62CW80UHtDhLG5Mm22V4RiOzlKxBEhFBHWvgryXB?=
 =?us-ascii?Q?IdGWSH9i/K6AQ82f9LrEuhu7gZOMveWpXbwUroltYursvK8GVNonfbbnCPM9?=
 =?us-ascii?Q?5pr1v8ZdawUEXfWO2bdDiWqE654YVMyZNn8cson3VP2PPCu1Y/n9fQ6oPtlL?=
 =?us-ascii?Q?TiYvbphkEnd11Eosp28=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0213e9af-c19e-4ccc-6519-08dadc476978
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 13:47:29.6008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/tGytC/iGOCE/a7iVVLEaRRyO0SuyxFpYIHWNWhdwjLDapHMXpOXTtUW9ZWNPsO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE1D4M7G5l02RC7oFMJXi95P0u28Sz/mPl7JsvpSETk=;
 b=dyITkHjkPNWT1IF4K5sS1NVf8BGSo4SB44PJZTqI4Z52iO7LAVtj2NbEUguPggl6u6SdQS6woJV15U+5LYwUCv6eduMFlivlrag8pR+K99B/1ejB9G8QG/4x6tTCWl1EDJjlb4O93afbrzzjzQFnLRWuhiBKnnG2JDrKtb7/EHQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dyITkHjk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> And in fact, it seems this patch is also broken: there is no Device Tree named zynqmp-smk-k26-revA-sck-kv-g-revB.dts:

> $ make zynqmp_kria_kv260_defconfig
> $ make linux-patch
> $ find output/build/linux-custom/ -name 'zynqmp-smk-k26-revA-sck-kv-g-revB.dts'

> I have done a full build and run test on all of these patches you have been committing, including this one.

In case my last message was not absolutely clear, the mistake I made when updating the zynqmp_kria_kv260_defconfig from Xilinx 2022.1 to 2022.2 was not handling the device tree name change.

2022.1 used smk-k26-revA-sck-kv-g-revB.dtb
https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v5.15_2022.1/arch/arm64/boot/dts/xilinx/Makefile
smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
dtb-$(CONFIG_ARCH_ZYNQMP) += smk-k26-revA-sck-kv-g-revB.dtb

2022.2 changed to zynqmp-smk-k26-revA-sck-kv-g-revB.dtb
https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v5.15_2022.2/arch/arm64/boot/dts/xilinx/Makefile
zynqmp-smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revB.dtb

In both cases, the defconfig remains the default zynqmp xilinx_zynqmp_virt_defconfig which is used for all zynqmp builds.

In the future, I will be more thorough to fully check and test the details before bumping to a new software version.  I have learned my lesson that assuming things will stay the same is a mistake.

Please let me know if this is clear and if you have any questions.  Thank you for your understanding.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
