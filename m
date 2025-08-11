Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483A2C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 08:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053BA83D00;
	Mon, 11 Aug 2025 08:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jo6-SsmDNt5t; Mon, 11 Aug 2025 08:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E864383CE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E864383CE7;
	Mon, 11 Aug 2025 08:33:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27B1A1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E16E4116B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Nq4gAuU9CfN for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 08:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::609;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58E9C41169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E9C41169
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::609])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58E9C41169
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZerQ3ghBYQ0RXYH/rEgCf4cxkur00eNSnd0aBsq96oCzufvsrBeUAKwJ/OVVqn4CsZto6yH+bWTBhocf91lBCF2pQDNUqy2suetEZtq8viwyuFd/n5a5ZgEv6VZ7/Ppj+WHsD+olMZ48horjygRWCtP5dhTqGe5YVhO+sQwigeBAtd3LTFvJTt0viGFCFW32XZYz1nvp5L87Fm48SLIQUaU5oDDI+b+wKJHGmOrz15Zca/r+0oee1a2havgX4sruqMMA9EwPLDMghcp2LxO8WfwsTxIGFZhJc6Z89xTx2L9YyNxl7jxsmVhI/5E19Bzt6JadV6eufVltcOunP6CuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDGV29KAyyACTZvizrIoQECoKmV1peBWPthsGkAV/80=;
 b=P1yekXX7AI5BEwxZR5JgWBEhzJo2yw7aODdHkqt7J/9MRpnX3JK7d5fckuqiAmMYYBZ7ywXMOju478n2mv7p7+maMrflGdHM/jggQrTGCIEmi2SSgGz3BgBsTgX6GVpvYNAPdZEXUN6g2BF5uCzL0KoDY3FpjWlZucyDouZm4LTRTJErBQjxSmGxxy3Wbq56FWBxD0jRbtR5Czccx1tjEtNo5f8Jqewta00v05EPKN8ttLF3c+NouFxjIg+AUBdMTSUFC+XKhrB4FBOa9Q9CrSNmp5XqX0/LMvpPaU6lHzsZGTkKOIS3PJVMd70m4BTh9IGjZzY9gxrr+K6WKfKQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 08:33:48 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 08:33:48 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "romain.naour@gmail.com" <romain.naour@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
Thread-Index: AQHb/3tY44weAeBzXUS5kQIFu+ZUxbRS8GKAgADFLBCAAAwggIAAJYAQgAAJrwCAAi6DgIAHAnUQgAAOeICAAAWkkA==
Date: Mon, 11 Aug 2025 08:33:48 +0000
Message-ID: <SA1PR12MB5615BF7BD79B49730E8E7CE8F028A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
 <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805100953.380f13df@windsurf>
 <SA1PR12MB5615E2ACED00D66546CC13E7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805125846.31c941c1@windsurf>	<20250806221745.03c267a0@windsurf>
 <SA1PR12MB5615011C2D74AFE14B29CE08F028A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250811101209.001faf6a@windsurf>
In-Reply-To: <20250811101209.001faf6a@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-11T08:32:20.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH7PR12MB7796:EE_
x-ms-office365-filtering-correlation-id: 1db4942f-86e2-4696-660a-08ddd8b1caec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IoXlo+pdUpOHZzwJIvmKSO77yKQdqu7NUFyZPsoXgifzbudy4i1nbAHQUARb?=
 =?us-ascii?Q?g4jUp0A+IGb3OusxflFsaOnwgxzpH+cuIKWoXeRu/IbQOpmMibM+Y7MAqFx8?=
 =?us-ascii?Q?fmGzn16GMBVAdDacm0c0Q2l07cIEisg3ICIP5gVdoqJy1My+Be6r9aL1Zc03?=
 =?us-ascii?Q?5igPrDwECD3kM2r6YqyBmuE9SUspnmJHv+3NjXRDRSM398u0XrYz/naF7gPh?=
 =?us-ascii?Q?2g4mQxmpNXl6Z8KdkUZH52dPwqBhcxhrJH1YLzg7S5wMgJFYVekOFOVXT+h9?=
 =?us-ascii?Q?myCfSqKEsekl5zhnIWkugQPf+OZBcs5vW1kS7qxXX4xn6rXslSjpnmyazuGz?=
 =?us-ascii?Q?V3jTJY0t8yRa71Kr43NuuER+0AGoQEHYLyBKEnUo8EIXVKvl/o85tkKFQOku?=
 =?us-ascii?Q?HOx3/14+NkG7LHcpjvbodv7H/PdUBURSypKBj4HMn5ytQ7fHoQXQTpG6QPdx?=
 =?us-ascii?Q?wrxSrRhaG9Q1OHXLfbjYkq5H0E+p9KtklsSvSYFsv3pzrPjvxOWwfhieQ8dj?=
 =?us-ascii?Q?hccO0ipnAEZ/BszLdESfVer7lxvFiZ8itiMPK0hb9v0oFRnoYVc3bQ+GLAwu?=
 =?us-ascii?Q?74Osnu2ltp9xoomxSpVWgtuTIjZE1NLl1lgz+jP4I5o8RQs7Rwd+qXkMVeSN?=
 =?us-ascii?Q?nuyWLCCbbb/3vMwxTIXapI8sgo3GUaAmVMndKc+vxd3NV9vO8fssMmvvqhbI?=
 =?us-ascii?Q?A8xetAYhFm09Ba9CJeVwsSPOzjbKz38BoG7ZHDsk9N2F7s68xDytx+1yC/LP?=
 =?us-ascii?Q?6oolHMBPD58QxEtkfrHYsCc+36g5pss5vbXafsY8jw6jAIyL6A2/kjc7JeyT?=
 =?us-ascii?Q?97wdg4jmhiB7iqsUvBC56TVNnZm/YrGeutJLUvB2IV5mfPONsoBD0bJHm2TF?=
 =?us-ascii?Q?jOqTdnaiZ8ZLPPWLvlz5GhhtTU9wallPgE3vokt4QwM73hC1FndGVvtR5Stb?=
 =?us-ascii?Q?3SAGbi7L6JPCXshyKy/nf8e1HsdcjYvCiPsypC20fov9TiiknZ5s4mC3NjbY?=
 =?us-ascii?Q?1ZKF7g364p1F8OO6B1ZxOQheQcG549kf7IcH7GLMlaD/H9jBjZMuoV0YJ+Cy?=
 =?us-ascii?Q?flVU726rmkaU26Grb0/4gaamh3qApc+FH7uRaba7qOwjcqWknmn7Kgg72RO6?=
 =?us-ascii?Q?2X+e6DxDLsYXbmzuhRByF0bIZP2OUPiHepNsePUS+viFbgkiGshUGrTWwmPi?=
 =?us-ascii?Q?EVdxMjOD2wKMH45vWsJEDtnJ7ycSdMrTQugQ0NPmJpWiwEfnD8aG55KmK7dN?=
 =?us-ascii?Q?7AutU7adHYV+4hPosPbsTB9GMD76HMai1plYV75eJWqHA/FH75tDF+cZMMFQ?=
 =?us-ascii?Q?/yjdjqMgz5/DWB8map4XwS8KW2k9A9XwC/yQtu915WnFtL8CPP/Go27gh+OX?=
 =?us-ascii?Q?d8r1AEw2fjim0BUmq75kUR3cDufJeKd4OK+giZD6qDKSVdrhymAX1INaa84D?=
 =?us-ascii?Q?U5HzaIBVY883Phx5NQcSW7MIkX8Qg2hhoZPmpzXXmyXcJK+vlt1U9c3P0Km6?=
 =?us-ascii?Q?dtsKKgrOEniFwoKX59XGnOv8Y79w5igOAxSf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fThMg6LSfIgUEQA5zGr7NCiKqBqBRR6Fx6U/YiAIqKsxpZYZ8+B7WqqXptyk?=
 =?us-ascii?Q?TQRSyQqfOcNFmUpJz40+m01d2DASYfHQoZWE+8zgpwRVxwVlCG4rhsKOZXNK?=
 =?us-ascii?Q?ll0XogSXIOOcoZMA/U6uUEwihYzwsGVf/LG8XHHiuFFYX9JQ22S87JL7iTzs?=
 =?us-ascii?Q?6/NLfmkvenPLA1RzsiPQxWMzNSGf9XhAYZhSyjnlh6T101MGhUQXNNFYcSOg?=
 =?us-ascii?Q?zcd4jmIKLsRmhpDcOOY2xqHURiKwOcPO+XMt2jDV+uwT11mPXQn63n0QkyL9?=
 =?us-ascii?Q?I1h67yj1AYPasOxQHpRMv4iRHRtz/PpxPvb3CDJwsSogrEQ2KVP7JSRxbIsp?=
 =?us-ascii?Q?SotS7R+T59ckSURTvaAzeYVPzsZH5Hc8dYZokgI4KoRYK7Shyd/eTPHOlhAk?=
 =?us-ascii?Q?vO5qLtH/FcnP/z5E6Uyu9WsGaSdaonXVypDsPJ7hXqxBnHcX922zi6+1viLn?=
 =?us-ascii?Q?RyM5yWwInWjAkIC1t7EtNNmZfeF+hviKiyuY+RHpViPxJqx8BRtCZ+n5Srex?=
 =?us-ascii?Q?lW/P73YZJ1Q6HAXT+483P9DqBx7tRoFEz3464p92HCkfq1jf7YFIw4J/yk4X?=
 =?us-ascii?Q?jzhoUbhGuHwpOaseqBONDuvMgIzf+eXZiC8/+urZKexXWrNWHk9M+oXLpBfj?=
 =?us-ascii?Q?Ebul05YBlzCqoNP0oN+KTJfEQZLDrKbJz6DiHtIdvWpuYCzTJVFid5L/F1cO?=
 =?us-ascii?Q?lBUPfCmTd3Tt2wTQnL0Vmlo7tfvg6JBTr924KIGASXK9Qk6WQ+f1JkpDD5k0?=
 =?us-ascii?Q?x9fHp+Igtmxh6AQhGGZsQipmn7WYYOLfZyrposSY4FsX2hSWSI3GUUD571V6?=
 =?us-ascii?Q?cgjrEKes0QX3Nlx/C49qG5sY9LruDCBdzK76Te6bRSdycFasHKMRkvGHwmk7?=
 =?us-ascii?Q?X7J8hNb/yG3sO49MqmGfw9rrodPLGAcic4S3Nd8iyWvxR8CNUeslSxc2BHwk?=
 =?us-ascii?Q?QeQE62XsCPIFe1q8a1E8frJkjBVNkDLgFGK3pD9OfDtKCfTPWjupx633KYcn?=
 =?us-ascii?Q?edREsfpGM14t+z/rU/9quhcpRg+8VcYD2xJgDt6HyxfOqnlMZhz4VJhZ71oU?=
 =?us-ascii?Q?M4bhNzJWqmo+qShGaMVX2yJ41xuRK4RlqLoPo1rNaBTu8iJ+78Ty75WTGjKb?=
 =?us-ascii?Q?funTvp3L60MpTJpYZdTspKSoSICSRRYRi0dzYcysEixSug2P4HdsbxqkoF0G?=
 =?us-ascii?Q?5bmd0+FwLebcmVm6NCSaflo9Meo/u/E+BLzagJLYhiMrK7cNOdd3saohc1D1?=
 =?us-ascii?Q?I1k0OVvmqSo8E+j10sE0i3bImmj688r/JtzFmzYNhgriVdpH1NpUeRuh6rky?=
 =?us-ascii?Q?B1ppCMmQt2zrE1lHzLDstX1oPmyom8uLGJhwtxnbjG5SLhosSWnI13PuVzII?=
 =?us-ascii?Q?h+yXthIY11NYQsBl4DP+EtSpLy+AHkHWUCBP2d2i0jIS6OLS21Y7+mmmJ6n8?=
 =?us-ascii?Q?RjAT5LklbbXyAN9tdMK643ztoazOW1s2xCAtJ9VP4FVPRLpOCDdp3cCExxiE?=
 =?us-ascii?Q?MxQYWLtvs8LCxp1B8SxxW1kEjDHuR+U1GXn+bUQlpfuv1hc0+pwsfiEuh28g?=
 =?us-ascii?Q?7Va6mjTU1FRAR8urfk0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db4942f-86e2-4696-660a-08ddd8b1caec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 08:33:48.1555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56qIDlYDhf3n5z+0XCK9gcdxg02009fOuOa2BPWuXREYhfcixht+Apir6DcpfXPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDGV29KAyyACTZvizrIoQECoKmV1peBWPthsGkAV/80=;
 b=I2yTcJCXKkNFwtNQuPglZCUFHvLPiP6e3tunJlwOL6xxK1oAwQJqvK4P6BcaAXsXTGegGT34jVPWsKqj6yAIc5HgbsIDa5iHt3zXs1wWZkmbdFiNq38RnA+303Cp2RS3VmRz5CKjFVd26o6EEP35unCFxm1Gvat+em9vCJdleXs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I2yTcJCX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

> You guys are amazing!
>
> I was planning to start working on this today, but you have not only already
> created a work around, but have basically shared everything the gcc team
> should need to fix the issue correctly.

> Well, not yet. They are still waiting for me to share the irq.i
> before/after the problematic GCC commit. So we have for now pointed at
> the issue, but not actually provided enough information to fix it.

Ok sure, but the hard part is done already.  You have narrowed the issue down
to a single c file which by chance is fairly short.

If one of them wanted to, they could create the irq.i files and handle the
rest.

I am still impressed!  Great work!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
