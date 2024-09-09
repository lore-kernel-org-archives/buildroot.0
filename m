Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A901ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 11:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F56605A6;
	Mon,  9 Sep 2024 11:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOh828UMJPGy; Mon,  9 Sep 2024 11:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D956071D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D956071D;
	Mon,  9 Sep 2024 11:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A93B71BF386
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 11:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A401E80E26
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 11:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zzW6zjIveBM for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 11:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=975aea9dd=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A502680E08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A502680E08
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A502680E08
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 11:11:51 +0000 (UTC)
X-CSE-ConnectionGUID: OuLtq1H8RZuU85itVl3RgQ==
X-CSE-MsgGUID: MONAmb3hT26zIihU4icCOg==
X-IronPort-AV: E=Sophos;i="6.10,214,1719849600"; d="scan'208";a="26250148"
Received: from mail-mw2nam10lp2044.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.44])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2024 19:11:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+3d4e3ct0n6YzlV9XHjXUY2skADGZzFi6K6w5jEC06fV9f7szY/u785u7Lx3pmsOAMhTi1iGkJyKeVeIrLlpDifXX3FYsfX+oIBIG+iIhBOYb8KlpeC2zI/gF5KAUlKq7DbY8PZUMclyAtdSze+ZfMnmpFHeodv0a1EiiTmWrRS0YsKML19PvWJ6WDRViCYGVxOd4zJFnb8KZ1dTaYydgdo7ulJJnVq50Vvh/G2zu2mbRWz6e9Rzl84zaAy/T0SPy+vhpiXBz7xyyMutjHFwkgBcBLYSo5ELHyZo4nCLVxrTqAjbiQElLL77OKwMTiOz/3xCJICS1Yy2WdjCDIlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OZ0pQxqm/Gq+XD3+hTzwjTDb5vMhN+qxq31ifP4h+s=;
 b=iyKqMmtncVyFUCm6+IcUxBRqzJxHOKhsZYJxmn5J7bdCRSzPWagMLynq8iHR9XWLHa8ekgGD+j5+aPK8Tf87GUKjawuAT18l3hcDTfKjJVrX3z/0o79mMdA8wHD3p25SjkAj6HMEQFmN5V/urDOWnrXgHjPozfpVH+rdfqLN2MOOqpLbLHSosSWWVpIzS3nRtQu9qOSxTYLWmKyPvzG9lHuxF4HrPjOz+G1efX6PakcnSENEN5SrpN3jJ0DYp3KlbpnomzJqSNEize8d8nero+kHO72f2uhEnTzo3oMRTVpEWet7kvMlO5fIdRo3IFYcIYUhAvq8/P2y/VEIeHcMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8324.namprd04.prod.outlook.com (2603:10b6:510:db::11)
 by MN2PR04MB6654.namprd04.prod.outlook.com (2603:10b6:208:1f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 11:11:46 +0000
Received: from PH0PR04MB8324.namprd04.prod.outlook.com
 ([fe80::2b06:73cb:e6c5:cb9a]) by PH0PR04MB8324.namprd04.prod.outlook.com
 ([fe80::2b06:73cb:e6c5:cb9a%3]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 11:11:46 +0000
To: Arnout Vandecappelle <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
Thread-Index: AQHa/SUvwik4mZfGrECETvuPU521UrJGc/mAgAAG54CAAARhgIAAEe4AgAjGo4A=
Date: Mon, 9 Sep 2024 11:11:46 +0000
Message-ID: <Zt7X8Q6OPCMb-CNy@ryzen.lan>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf>
 <a31976ae-fdf5-4a62-aece-52fb70775b39@mind.be> <ZtdsSR6M9nD614Ka@ryzen.lan>
 <12031021-a104-4ca6-b4fb-669b6892e69a@mind.be>
In-Reply-To: <12031021-a104-4ca6-b4fb-669b6892e69a@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8324:EE_|MN2PR04MB6654:EE_
x-ms-office365-filtering-correlation-id: 19ff2c0e-fd98-43cf-9533-08dcd0c031d0
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vyvsE9Ik6w9uetIjaoa1oehqMJRJIGXB9scembzTjMhnHYA6Ppd8hh19Slr2?=
 =?us-ascii?Q?ZHTYv0NCa5KKIc2G2+IhmsxbBOBykp7Q7gTbRv9kgLG0WXnMCgvpqqgIEBHd?=
 =?us-ascii?Q?qnSyUBUnQXhDmCFSf+nBNKqzVxIylaLmOpnHU0JP+QQJtBL0GXlt8/roHXGQ?=
 =?us-ascii?Q?QEEVy1ByH4B3ZiR8Da89sklozjTjlp6yJcqrqGVgPXDwxwZSwecPF2ac/j9T?=
 =?us-ascii?Q?Y0SoAo4zaRs75PkMupVwX2RSZ+6SED610FpNBpMU7sUki97fnenoXus7+2kf?=
 =?us-ascii?Q?cb8eMRnr3INRIYigREfjZwrWmaXNItWWgO7qk+Zuk2af4z3Qz2lgyEPAzhB5?=
 =?us-ascii?Q?ECeNqq3OIClcGs4fwI/vh6MkRC/kdV1fK/gi79AeqvZ2krP5ZXNJrvNQuRFZ?=
 =?us-ascii?Q?4o+oBv8ZGLJ3hubImZSRdN7h7zW2SgY7UW5EWy/OV3Q5ietQWCsb4CfmyMA9?=
 =?us-ascii?Q?jdBKOEtVR8cc5Xf3vVb2L2uQiT7H/6d7uDgSm8Ivw9rWE57fiC3MBKaSBtoc?=
 =?us-ascii?Q?ZcLeT5LdBQe02pQnQGdx4zSfzV/IJG1nI6ZBxDcvk5USTFMU2vEBa6jpp3Ni?=
 =?us-ascii?Q?E8Fa1w3zIgK6BXaw0XQTdptiHsbVZsHr0z6JiAYHO5vwhWdMw0c4LwuKmAVZ?=
 =?us-ascii?Q?ElYvQPXUAZahAD6SlU6y0oAywnZwJqUTjQ3p7JzRTpImlVjzZ74VvtnSeYVl?=
 =?us-ascii?Q?ViyaOJN30fpoPzLOwbY2ozvnRbny65PZZP+Yn0vLfuHuHNK9DuLP2+DMtlXL?=
 =?us-ascii?Q?Mow8QG9K+X0oXmCaqLr0f3bQP5St8gpDe92XZ24dXalLtiCZ3oogwvYN+H8R?=
 =?us-ascii?Q?kM4LTRUtn8+sWvUWPTzrfv9UKYG/mjcA6JltuzKk+eZy3w43WRPnE6EcorDw?=
 =?us-ascii?Q?VREva4+aYo1nsrni4kA7fEARFPcNr7xsfQAKOJ1iP0EIsT1gxcPrNQRBzdoe?=
 =?us-ascii?Q?9eu4MLbPpVgHLBx4NeOW9TfsR5Msz323CKfyTAGBEyQTHE0L3inkmWLWbMEO?=
 =?us-ascii?Q?lKta0UamoRHNoz2+7+p0iJO2benAFc6rJFoRb3+PQxMsP7ahNiBeV79qq+2y?=
 =?us-ascii?Q?RHm1oocCVCx74IzWGVlha01cDtrVi080LVy1aaneXkS/rHTMXYapnQM/ioNM?=
 =?us-ascii?Q?CUZ9RmeJBFyEFS9lFnsnlXYT2VvgkKs5g4v7KdDnZXvuKsOKYA28uLgtksmR?=
 =?us-ascii?Q?CN8BPyV87QZgLYRKxgN9Z4KYGvamSscB0rwwmYVCt2RyYPOQY1l5Bj7SIH56?=
 =?us-ascii?Q?BPmKT9ra+CiunY9CyQIN9JSJpeO4f4WrP93jW08AhbRFl5igS/b83xNnLFgn?=
 =?us-ascii?Q?jzoygtNvuGLap4Ag6C0/gBDOxFXsOvjEb5U6ldPBVzHQlg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8324.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u7gIcNmhz5Ke0s/NTozUTh4CEbPeZLwfYArzizeOsVMtrYKOlKvRy1gdH/B1?=
 =?us-ascii?Q?Di1gJLphR2SFaJv5viH+tRmJ+Sz4msctKTYkmUPjwlA8/8IMZF5Db/DF7E2O?=
 =?us-ascii?Q?TrlL2UupoUJh3Rxd+9OhAhDu6RuUB7iS3YsDyHpeB4mxgOnIdq/M0ZFE6gvW?=
 =?us-ascii?Q?mpQWy7tRSV0LU32jX51QzCYHKC4O+Vh+X4wA7gwx32op+WQqfLFffVxrmLu0?=
 =?us-ascii?Q?kItRpQJXQqou8b9J9+FQ27sTNoEKV9U6NcVf2xIE29lheJ+KjkyETkY/FYUF?=
 =?us-ascii?Q?clPrzTY/rakJmV82jcF9NwohGE5xcGb1/7p8NuL/vKamVyQ45/AznhB/0di5?=
 =?us-ascii?Q?P0Jr+fPMzfAdQmSPgoLHT9nRxLA577Xq0cCcofBQSRu/qC+xUYNNhXFb0TAZ?=
 =?us-ascii?Q?SZATNiWQY2tEEUOsdVRkkn0WZOxLQ/U0xPQjd5jvV4ZPjYN+xxhNPupWPu1B?=
 =?us-ascii?Q?uCIuJxDPBAeayuQoPUsh6Dqt7TQH3mmN7zaGR8/LhuZ013QbpS+iPLBi/FCF?=
 =?us-ascii?Q?Y1/YgB44OhwglHLWx2KLlkJ+eveg2Pgrs1PrsjoFvWH7lGNu/F2RXdO6h/Hs?=
 =?us-ascii?Q?SMemN+xpk8R9BIeA5p8dubf1nsC7zivA7r8PYDKUkwVGPZSDTdaDkOWOHTCE?=
 =?us-ascii?Q?YLtu01VLYtgf1uhc6B/3EDVQb6AYw0iscLNGKnM79zGilIcLWt9xcSXKQbWb?=
 =?us-ascii?Q?880GlfcFSIWwbj7Mh00SzSV7xyLvzMwQ2vGq3ljSbh3sRnmCFroZSnw7Fh0H?=
 =?us-ascii?Q?rS4uVIVg+EVWzoZfLNEqa9TMMnZBXjks7rBQtcphVrzWV7kxOF56ZMg9/pL/?=
 =?us-ascii?Q?qbQHceZTqCItHhQqGX0Wt9wagkGZRuhUvRfbszd1IdIqDqzvLr60flQhwW3+?=
 =?us-ascii?Q?erso7tjtM52QbvcekI/SxBLjXz7tqS4aVMDQJLBqdO3XouGBSgTLxR4iFvCg?=
 =?us-ascii?Q?7BTEXr0Jqd9jaQqwm+7VWwuCtMOyeBA2LRMqe3MIs+z1nenMpoyEx8yGCnqJ?=
 =?us-ascii?Q?xw/Tm4YrCJgUSn70IKrKpCZBu/Jv8eOj+vUI8h3ZkR+uIqxOrL0E94a5IMEb?=
 =?us-ascii?Q?n8TN7lQEYUs3o1u2BJW6fG3l3v4kAlQCDGl2ymJzd+m+2jcDG0KcRQdCPn86?=
 =?us-ascii?Q?WoQo/dyqDXMNEnvIVJvI8sGdCzeJPRpzWzyN2kzVBVO991NQPrERkoKzatht?=
 =?us-ascii?Q?veG1uqv4tovGIvtuNTgfZf45i8B20TbdFWtoCerx8TRflXml4Gnjb1XOgWDl?=
 =?us-ascii?Q?SGfPx//zKN2Po+AkIm9blIlVN4G0GguBktlbxDRs5OVpJb2AtuCHPpHaYIhy?=
 =?us-ascii?Q?WA5I/YYw4nuZikblkOLRf4rKRiki7oC5aJ//4sgM40UkZJOuFf1WMj0b1bj5?=
 =?us-ascii?Q?3sC7b+bhSbN9Xh/NIAFdwJWeeXyG+k6IgBBsIdX3rJLsRmDj/n12/x1mz+D3?=
 =?us-ascii?Q?97MovwXedTzbUyZfMS4TEkgNhjrEaNw+fuxZSv0b6crDSvqvnIdJ5RdXEvRh?=
 =?us-ascii?Q?zFXdxdeXR2uvuW5+Y5EhlR0JPSEsw3DjGsJ8EAOo+FJXLvNbQTSZMcR7vPRD?=
 =?us-ascii?Q?YkwxtWCLn2IhUp1EuTCgUPaX6mXS0hK/4aHThmU+lXdmbAlI1R1TJlhhldou?=
 =?us-ascii?Q?jA=3D=3D?=
Content-ID: <11819E1948A74949BADB73F9BC193E80@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Pg36+oKEcs2ENtNGjQRaBkaq3UebIeYpCigRjKJEMG9gKfh1EhgTinescE2RlBo2BHEokf29d8paSQQ7hiQ9fJKcONW6ZPiyz5h6mESDmf06pZiE6v/Rpg/XH7wQthyBY1kI5rh312+371vd26YWUXT0QSn+/CmAFGcxaxlzarnhK+zZRSvHl7Dz20u+CMPmgdvvLf6iqwgPt+oqbu2iBC5cxf6jUtKadPs7FFQKEs//S2vT68C1ayJ5xwaHLlaCyUnxR3o8GdH8Qcl9vdhJMAXo2F3nS0tF3HowgpYjb9r8K5HZR8BbGkXAPaOZpLjUXboyaTWSWtzhFyal9Cao/p/XCSpZ5TcVg/tGMlUIuuX4NIX40FCpY8o9yZIdOiP1eiYiNBMtiH/kYA7B45lrs7tNOelblRyu6jd84MLCBAM5b/V/xP9/NCju1sIN18qNIuCQ7hoVDJ54awC/2DJ4Hjb2GpOuvY1fa3y6pIAGKAiwjS7ZLqDqy6DaN8/8swjdD5M8odnzlp0CFcFjkrON6QV10JCSa3DEfNvOoT8+3huec2bHzxXfPxcxlaSjQzPOehT7J4CGqrBrUUGpp2jfG+7kyxCTLHN700tV0VwvuG1BAmYbAiI1eFJbGNaJEFVI
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8324.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ff2c0e-fd98-43cf-9533-08dcd0c031d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 11:11:46.7273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UOXA2yB67JQsMSJz7zi5ktOlgxC0DAR6UEul3AyVu62Lt6lNuKTf3nQSqURDR/UHA3nH2N+epFeLOxS+s6KtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725880311; x=1757416311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Oxhj/FkzD2/t4hhY4RhO2tEofd0X89M3HYkb7BFZGU0=;
 b=amM30P1rLLUPhXUxP77hvfmCpyXVh8Pa5icmjvTu8Z9SVSvAQFtO0CxT
 UvPC23ddZJcUJk9bbRr+8LXT+3ORTh4d/JWkN4F2mTnjydGwN1Whzk2jc
 vgT7SXeDthec9xp6MkkoXjm6Hm+JfT2oNEQ+LFkTBWsg1PLjQij62PrQx
 izQUxzqtzsZUq5elhR0++qkUIdZ78yJcy60D9rkwQAA5R2Qq16qcbBb1N
 bcD9ywUwfkmgeGFHzMZBHGXEelraGXc5dFVoxaPsB4qgpZclTQMV0aBK0
 JQGPzfQP/EagNMmF3QNk1el3kf6qXfznt/nLBovVln2S0s6kx1a0XS08u
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OZ0pQxqm/Gq+XD3+hTzwjTDb5vMhN+qxq31ifP4h+s=;
 b=THgEnIjTcPJB0b9x6jbJkmQmNRi7fLhvjkvGljHfvrSMVjydUxcUtwPf1dyUKTxRXE9knyerzXWo6rNM1vZpMJ2hlNVeWsXLO51q2murgPPDAtPgFGyjOmLmv/b01lMggNLL8oOUDjkTKPSBwW5lcslpb+lWDKI0Ho5nEz8Swms=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=amM30P1r; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=THgEnIjT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 03, 2024 at 11:10:44PM +0200, Arnout Vandecappelle wrote:
> > 
> > Without udev (i.e. with the current buildroot rock5b_defconfig)
> > none of these modules will be loaded.
> 
>  That is a very good reaosn to want eudev, indeed! The alternative is to
> extend the linux config fragment to include all of these as builtins, but I
> guess that's not even possible for hantro_vpu...
> 
> 
>  Then another question is whether we should use eudev or mdev. We currently
> have 25 confgs that enable mdev and 30 that enable eudev. Some consistency
> there would be nice as well!

I remember that long ago, mdev did not support automatically loading kernel
modules when hotplugging devices.

See e.g.:
https://wiki.gentoo.org/wiki/Mdev#Miscellaneous
that still says:
"mdev unlike udev does not support auto-modules loading."

However, it appears that since:
https://github.com/buildroot/buildroot/commit/07f46c2b6daec44a6176039c90be67e66c4c2e42

mdev does support automatic module loading.


I changed from:
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
to
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

in my defconfig, and did a:
make clean && make rock5b_defconfig && make

and:
$ lsmod | wc -l
45

shows the same amout of loaded kernel modules both with udev and mdev.

Plugging in a USB to Ethernet also loads the correct kernel module with mdev.


Using mdev will also avoid "udev predictable NIC names",
so I the patch in this series that adds net.ifnames=0 is no longer needed.


I will resubmit a patch that enables MDEV and will simply drop the patch
that adds net.ifnames=0 to the kernel command line.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
