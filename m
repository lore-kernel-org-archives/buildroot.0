Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C738110775E0
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 16:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D95F40B93;
	Wed, 18 Mar 2026 16:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCsSjMkB6DdP; Wed, 18 Mar 2026 16:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6E440B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773850347;
	bh=cGN/AvHyX5zmSuXL7C+li5JVCVloXhEU6YdP3RBH+IM=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UK+ZA38CNm7L4e+sSXRiCTMWvmDpuqsHiGxdsDoaPwYB96JtxxbbeH0h9piV+9h9W
	 MVp9fsRxcommQsVkUOIyPBTQMm4UvsD0ot+4kzRSDmbJH31UuWRz33tKaX93m19rQG
	 vQLkkch2o6Ipdy6Cr5Fy1iKqm6SUK0+BuUD03364MfN0SJHZf5DToBYR0DNZ15ZFG6
	 2nxNatIuozjE7CXfb2l2AWHdheV01cYqHm57Ny2ivIxlif0J7AvvmdbulXy6NdE57O
	 M1MmtnjQjx84Yvkbh3uLErcMbQ/P/LHQGLdj3Ruq2bD/4V9ATGwrmRlCpcEyFb97F9
	 bIDjKSw8urNmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6E440B3A;
	Wed, 18 Mar 2026 16:12:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B521B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 16:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14FC540456
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 16:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsJ6XvKPIIhZ for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 16:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FFF840455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FFF840455
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FFF840455
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 16:12:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbaOC8OtYDR/s/GKO95l/T0UGTeEjmQpXT92eqJegW4nT3BPqrlC9c5bh4JxnaxtILf2f6HgLVZuaNE4Xb2da+G6ed17bAChFYmPDWBOmtQIMzMngTW592KMAOkznjzedodsVCFcglYggi8GwloQKxVgOBPEyZLUvur1vxUKaJdFyYXSBKsB+JK7BBiP6jxvZJhIhQJHg69aP25/ecdh83zO8Abv4GTurB+hSR+BXaLq0+j5r19R4xGokHlxz2DgUitkGloQYNb3K7Wzl8GhIUH/oEE21LcUM/tc+dUV+QewVUcePySUiZX0NXcQr5oeCBvQ9GTWToPZz8HZJOeHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SZR/CxMaKIbhk94e9R9PqMAKsk4xbeEBn1zfbmd05M=;
 b=s/QU8edAV2DYDO+kzwjZwp8ZTbkzqcKWXGTT66CgA75RDPAMjzrPj8V9M+nITss9OXzZjvRhVBUjWJFSpmXIts6szxJ3HFBi/di8smdSlG0gZB96LOOFsGBFyEXdrKjUxYrvXmVHcxGqAwoKZZlnSb2YIz+wZjAJXPFa+JOb6zQ/cmgqjIPeq0iTGjey+hv5htGtgNNVQXaeYjAULG5yLF0atBdDMQC1Zj1jvwLcKiPsRGkBFOyE9zhnR4wx2yskSlHzcaqtGJ02jE+39pddKrJfowjSAgUovsFgTOO8onELalutKu+99ffqqAMQfpMnD2KMF5WNADeaKe5kDNv9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by EAYPR12MB999156.namprd12.prod.outlook.com (2603:10b6:303:2c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 16:12:17 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 16:12:17 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/bootgen: fix build issue if host-flex
 already built
Thread-Index: AQHctr+zX+XgqPm/40moqI8EX5SD6rW0djPg
Date: Wed, 18 Mar 2026 16:12:17 +0000
Message-ID: <BL1PR12MB50328525786C9D64F1940B7DF04EA@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260318100457.1838670-1-neal.frager@amd.com>
In-Reply-To: <20260318100457.1838670-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-18T16:11:16.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|EAYPR12MB999156:EE_
x-ms-office365-filtering-correlation-id: f405e71d-6155-41fc-8c35-08de8509204b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003|41080700001;
x-microsoft-antispam-message-info: WD2DNvzySPiLr//B/SQVst6xZf2bT4XOvg2mN/RRLX2lWsILckvD+eXII3hYRrAVfzkbns7kMq4w/MljvPgVWYleGFudyO0ouUtW7rHf+hWJKYZGIkABjTiavb+21vKDe/AR6jRGO2+ziLDGr2rW9NpHTNuHRf8l69OJOZzmugkXgip8dq2cZfoB2lLfofA/rRRSMlxu0SvfZ4JmCBIUrkmg9A012FVXqVDkK/y17CLmha/uGppwYwZ6lIIlNKmupyOCTNf4O0/okPaPuNJRyRicZE4dEiG8R3n5+KwYdRu6dBUARA9cQupPnYvJOmK0qeKrLXrb9mB7QbBo9sKhFDV9wMmdNPyKwI4feTQjcWaKXNvGV4ZZ5nTTx9rIMLGsZ1uZO5r6+ov/sOJKqBlfsXGNPj39ZXYV341d+kJ5hBLPekghNyKbGKYZ41HiKy2o/65L2dZkD4mm4bzbK9QgPjSZYxZG6cDYiFiQYlOkWCmWeUFsz8MXiYcunXyMrOFLfierBNjWz0L6k25bKXL2/NJ7h7w48M5fxr9IkK42yj88Yxwh2gN5NqTqjHe5xQ67M8tTWcNiJGI9GdPbE4m1UzyM5OnaqDkhgKWOIRFcvz8eNTdtqY/9F3und8nDRlTosO1NCygXmH28E1K1+gfSeh5TQ2iPJfem/aoV+KElvJ+o92PnAtmIPHz5irQ/UHdQVdxjn1n88KRBm9803MZsxR9sras5zUJ+JlVEHTHmUoHlZLnE/ODPEZk4LS62EUakC6QGjnZwhbC2Y+9ltrXL4eA75WLVGWHGx1yvvrkzO6tFgFyjEapgaw9vHyWSiynv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Um71Ck+GSNsjJzNemAZ3JX23QBEqKPfahcEwG6KjtIVG6o5xetlhGVkr++Wd?=
 =?us-ascii?Q?yBIoU5ysERQLo89N35EZdZ4ik9mASCQvC62IDq/qXtPnqH3btonRioIV+ipC?=
 =?us-ascii?Q?jN8YlE+fDtHqinNYFwdaEQ/yTx21UZm7ZjCTRS0AHAABH0sFWj4NUis6tO3n?=
 =?us-ascii?Q?TvBmjxZ2aIWZcPtdChna1Dg7Ee3K6QOkVSoXKEH3z1icLEGjuUbDnBnz21ZI?=
 =?us-ascii?Q?bBg0GYIzasMqmstbs6XTVVqS3WaqdCuHJ2Sy+rGE8lbkdwLTar05kW/0BuBD?=
 =?us-ascii?Q?eK9WVWeIpee0R1Tto21TAkGKtf1R//Cl10zNcZ1jkG6Y7vVW8yN49v31QXdZ?=
 =?us-ascii?Q?lNTLdIO89qj6pmCYw1rGVzjPy0Kkt6/XJwrXP2Gz85xl/+HSIt6avsooNXj0?=
 =?us-ascii?Q?ejf9k40PnT5CXGb6ypA4pxXAuWZVFSkzEuS89gbwrmmyKh4UnU6g3ZnFktlX?=
 =?us-ascii?Q?PeLHtGbaoRGX06WpH+TsLOsS7R7Fm66rCJF6+j2O05S/JwYF/mkc/tOsnn+H?=
 =?us-ascii?Q?hrfzCCZxlccLWxDrzyEeQ5Tb4sDE8Ns91uGB6Btwle6l6Xwefj9nlgPXs+qE?=
 =?us-ascii?Q?MRysiDTR9uVsYOYMxXy5lOGSBcmN6dd1+xIK9qt+wreGEGtO8ahPWfpbRnPl?=
 =?us-ascii?Q?EvAivxaMfR0GpANGKMeYGuNahMYFltJ1Iz0PKfTXYa9gr987xA6PBkgJ60Nq?=
 =?us-ascii?Q?PjzM13bgYM2vdDUx3weUbbv2fN4kV8KOPviEMl6P/bMK4eBHePC3XaEXBhQu?=
 =?us-ascii?Q?K1vZoMi7bGtK8lMe1EYt7AdLeR69sh533afh7MhyNXMOFE+oXgAsfVUCsfE9?=
 =?us-ascii?Q?U+WLKPCKAMri1e0KbzkU8fMB0zamqsiTSQEwXHOeCJvs9IDAkOR2G/GvUeas?=
 =?us-ascii?Q?PDVTjnvyicDJtkGqo1fePEfnk4N0rwtjxdDiicc7/Et/L78MHsQIU3AtpDs7?=
 =?us-ascii?Q?K9cXbzM931hqtMyDkg+uXcnRc6DmpjUEdpsXG76QBM0+mm1tvb1e79v+3EJo?=
 =?us-ascii?Q?r0Zh5fm2KXPYppEX2zUy1cvQ0iOQtdyxtvLLNIGp2mpyLOZD72h2QQB+Xip7?=
 =?us-ascii?Q?FsQoVar6mCVEF4ASbW8dcg4gerMWSRgdBJSE5Wj1XnMv194kMUuA/lZ5TrkD?=
 =?us-ascii?Q?9OBEV2qzOGFN1fNdEsIs/iysa6k8Vf2VCaTXFBv4WrR5k+yvizIaEbOYXSd+?=
 =?us-ascii?Q?NIc/UanBXkkw8DRpK7heoBpeVh71V43rlRpSJShJoE+PEWRAqdPPXQ4ofJj3?=
 =?us-ascii?Q?FUJrwJeD6EKhuzxp7Rpf7NpL4wuVnoNL47XIcF0W6oWk3YizBq52z94WVx0u?=
 =?us-ascii?Q?HWib56mH7Rkhe7wktDQgPYg38A3nb8lqth5BhykHnFR1TFaWDtnUCewaJWcs?=
 =?us-ascii?Q?jZDgQzlX01ifCAMvvuOrWBe6KxhlXSWt0gqlvtLmExvrbV3v+JiN1U+K6hdy?=
 =?us-ascii?Q?mkI2y8CKcY6cTFZB8DdMIzMfHjpqdW7WNY7POjJnWZR9kSyIQ3B/sRrnb0i6?=
 =?us-ascii?Q?lklmN3doG7SKOf4UpN7prrrs2tN/DUYxddKUpBqv7CI28z4Lj7iQ2sZegUIC?=
 =?us-ascii?Q?zzx5/w0iD6vQ01bXVqzjFgX5bnzo3I2kBuoFjIT4vLDUca/Bjlk25MoJ63+C?=
 =?us-ascii?Q?9CGUoxmcGGE2lQhhl4toQTjqUQqUgo5y5fKaLLxBzPDmtm4GBkwRwqnSwTid?=
 =?us-ascii?Q?WiPn1TOyT7iPWC+2LewJcaEqFRhVs5vBxbviHtHlnmWTCS2y?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f405e71d-6155-41fc-8c35-08de8509204b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 16:12:17.6167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxmdAM9lft7GUElVp9qrSyvlsTc1v1210j5hnLwTekqNBP9mc9LBs+7Gck8zcFLw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SZR/CxMaKIbhk94e9R9PqMAKsk4xbeEBn1zfbmd05M=;
 b=PR3QDanp+I/H7BbkHZD6/J456fDXmSEVvfwI7j8clR6rH77cMz55//VNoYg/9j+wI2sAjKC1gi91J5r2QWcE1yUEwViMzf86icFt4pIcAUNn0G1+G58XaXzJMQUndxDTYWywx6Tjkr532mbrbFaPMeGrHhtFkbZiocI+zyXUYRc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PR3QDanp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: fix build issue if
 host-flex already built
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "steven.hill@collins.com" <steven.hill@collins.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "fiona.klute@gmx.de" <fiona.klute@gmx.de>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

> Fix a silent build issue with the host-bootgen package if host-flex is already
> built. The host-flex package will install a version of the flexlexer.h header
> file that is not compatible with the version embedded in bootgen.

> While the build will still 'succeed', the binary will not be correct. This
> can be seen by just running the binary that is built. By default, running
> bootgen without any parameters should print the help menu, but if the wrong
> version of flexlexer.h is used, it will print the following instead:

> $ output/host/bin/bootgen

> ****** Bootgen v2025.1-Merged
>  **** Build date : Mar 18 2026-07:08:01
>    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
>    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.

> ERROR: syntax error
> -h

> Add a patch to the bootgen package that corrects the issue.

> Upstream: CR to AMD jira

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Hey Neal.

That fixes it. Nice job. Please add my Tested-by if you wish.

-Steve


Tested-by: Steven J. Hill steven.hill@collins.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
