Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425BEC87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 07:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE10241147;
	Mon, 11 Aug 2025 07:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKdMCdxgC_lv; Mon, 11 Aug 2025 07:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E41E41177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E41E41177;
	Mon, 11 Aug 2025 07:31:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7871D154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 07:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A15C40C3D
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 07:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuXxo-UslSWu for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 07:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::609;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7769340C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7769340C44
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7769340C44
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 07:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nn+C3mODT8xqJIF4or6YSqA6pxPJup7jC9yxq1J23eNON6TXjSh3sX1arwrxb4u08ijPYhgH9OxEQt/JsLS2D0OseTqoItoy+vcWl0F7XhF3WNCVVgTgKiNxnqVcn5sUfn8oqSVzY3zv2sRNcGySDfeMK0Ce0asIWsxMOu1DGidRIDsLbgfkP/IoWSk9pLEhV5rg2suY875qgGsr0cMCTYj0x844zL7hqLjsU49uoJopnfc29QC+CAaaqGVgqLMuKlYYuMKeJ/42jLA02BCgwF1LbURWpP9x4oxCYtgfJXuzGXMa3RYLN/Jk8LeWT0xAyPqK6CrSAFaFaeL8QsDGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsgPFQKJk4ExIzGl4PlxEZ1pp3WZww3cG9JlIk+eSng=;
 b=xaoNwcrD2SrcFWG7yxBPGEk2Wn3LNg09u0wFBN6DF+5OigwdWBqcL5Wsvg2AbpnK6Af9F22nCdJ82vsKKVVfak91l5jAftKaiVtjHAna3pFKtolQ5iOXQv9kiGoFYne4aJb7gcdEttX+LtlUVYtJDl6Q0aWc4HjsAX1aHDM97+GXQ7btV276XXKWW8gYfDvPHZ/Lfkes4Pq7WE5wFIHu6uxfshFFTvufdbe2i6Em+glFLpXNGCDE1W6LCMa5aLRaznRJD5iZWbs+3SRPUHIE03Dne2qwx1egya/Es2qgy6igyh+nsVo+zlMb/wG9B+yiRojrmkITtS2Cxf3Qx10O9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 07:31:50 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 07:31:50 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
Thread-Index: AQHb/3tY44weAeBzXUS5kQIFu+ZUxbRS8GKAgADFLBCAAAwggIAAJYAQgAAJrwCAAi6DgIAHAnUQ
Date: Mon, 11 Aug 2025 07:31:50 +0000
Message-ID: <SA1PR12MB5615011C2D74AFE14B29CE08F028A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
 <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805100953.380f13df@windsurf>
 <SA1PR12MB5615E2ACED00D66546CC13E7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805125846.31c941c1@windsurf> <20250806221745.03c267a0@windsurf>
In-Reply-To: <20250806221745.03c267a0@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-11T07:20:22.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW4PR12MB6898:EE_
x-ms-office365-filtering-correlation-id: 26fa969e-82e8-4f0d-a1fa-08ddd8a92327
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AeNrMGfW4ip0hILDw7i1Gg+JT34OslwvAqUr82lE0PcQ9ZrEcW8orCl5P/WS?=
 =?us-ascii?Q?F7tj8MmC8FsTy1qtpOpK8TFGVSHdj3+F7w2ORFC0WGIpFVTTyPRGnE+fsfQB?=
 =?us-ascii?Q?mrZTRtr1NvhupMpa56FxLTatP6Ojp4tLHY/MS4B0UMWkTwOzpBFzycirM0iJ?=
 =?us-ascii?Q?+kO3WAveTF5vqCpdV6ZpyYf+8X6/vSrLLofutvICrZlehwHiaVXVQHFk4akV?=
 =?us-ascii?Q?FskwGffcT2Zq0ER7SHP44KN1g9CtgesMX0r4N4/XPeX8LGkZr/g83DVW4oLR?=
 =?us-ascii?Q?ejl5H0Gzekg7+nUnl1MEzzOdtDWOPeCqmk731JcT6ey2i7+ggyXZbf0oJxUU?=
 =?us-ascii?Q?/bG/BspqXZmoaXN22ra2F591eaDztJQig2Y5PbhbJCgqcTA2gBmUkFlZUX0r?=
 =?us-ascii?Q?6k+Me1fooebyC8dwBMd5rnT2HNWByD0TnruX9glAFyZNWpWNP4hV9AGaegHu?=
 =?us-ascii?Q?Tnj5OMb6oYX4O4AU5SkdMQ8UGEg+nW0F3rWFqOucUSheIBjEj3XHDM0P8ag9?=
 =?us-ascii?Q?lD/6zwqmsZbapYJfVSf8V4+aHiNK3Yj4M8MlpSLWSHUyAOC6PJaNCJWrPSGS?=
 =?us-ascii?Q?eYYDVSTHOWGbQO3ndkW/GndcX/f0LdUHsvrH4T3uH7kST0AYIb8wXbFH/Xxc?=
 =?us-ascii?Q?9E3bgyL0L3xpWflgBCIDYp8BWgnwVReuZQhyIpSokIU2Kz42+P7IGAoEKiQQ?=
 =?us-ascii?Q?UGhZK1wmnhOQAKQ5bL11H6siSlP3p2zJGAHUHRirxh3rURsZLhqL1lxfLSj0?=
 =?us-ascii?Q?SIz9ke/gtToSLFFQ38YTrtxmNd47EWb70XN4qJDg9oQiX0uHzhAYe202LWPH?=
 =?us-ascii?Q?M8Ai5ZoMe6g0BLxMOEPxJKGvJS5ZHAizWGr/Vdz228JKrQTbVIc+S1TQTN40?=
 =?us-ascii?Q?nOG4hqx5VzyTVH2pURlTFiAylFOdYNnekh5t0cZECs4E/WfQwEugL+zl88Xu?=
 =?us-ascii?Q?qOW1d5bRCEWcIQXrpxatlBNuXydAUOa/qfv2k3BPaxBGsIRf/6mqLch1WKvG?=
 =?us-ascii?Q?cFXbQgg/r2Wj1gNmBj2eN0oxNhDCW8reipKUtOK3YJ8WredCBSoU1hg8hoJU?=
 =?us-ascii?Q?Tq2jBK4xKWZ9Tn5kks8GZFuB7A/W2y0+5mjIHYYGpR9EhudYZXhmmTeHuEWu?=
 =?us-ascii?Q?rUEvkXUgnK/AjjoOpe9dt9gcS9fZrSwLKhDX7imOO5MSvqNhgVdMSaU+/6CZ?=
 =?us-ascii?Q?6UuM8sgHeTjhipWpGv95geM3MfJYcBDWQvF2f1bPtbL1AU3g4EPN4j4bc1eI?=
 =?us-ascii?Q?F3ZoPuLPCMbPyCUKsbQRJrUQhRBDnviAGnUjdZaIjgKK85NloEn/erVQNogH?=
 =?us-ascii?Q?koYmAs+UBTRaeCZSaQRR65SSzq+OGL1rRPujiIjXESeMBCqFJyxIIVKSyKng?=
 =?us-ascii?Q?KtNr5UNSIKCsh80NeRxewTHgu7R+5/MnuwzfgYPyaFHwYgC8YWNjPcCVNyQX?=
 =?us-ascii?Q?ruuM72lD6Ase8P3NYpbxP7goxo8E6CHcCPIKd6NMEp4RjlxNADnCu4e/YStI?=
 =?us-ascii?Q?jPHzatP8wy4tAj6Yyw0CknFjzKWaJme+fSMx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nSdQbuVp4V8pZtEFTrTp5rOcvaGgZx4Qma6hm2MlecPyA3C3tnpZTr9R3nCw?=
 =?us-ascii?Q?bw8MgCAfAxTFBP8VpnGrO0Tt8dSKBE94PqWAxvT8tVxsyxqgoxYWDlfZLaXq?=
 =?us-ascii?Q?C1YRC+Hmk3p+DSM/VmPqmu8dnbeJn4Xg9vOpGQU8+kNKxfZM4jxV5PhV8lqZ?=
 =?us-ascii?Q?N34cYQoZmGWVg286SPs+4L2jVA8Zo7uhNY63pttdmpkiPTnEnkPEYXLc4nau?=
 =?us-ascii?Q?xWPue2PSPB/UmFZbJs9HnBETfuBdqXpTcjKqJhZ0If9riHdPElUvZAmVaA9x?=
 =?us-ascii?Q?bfuAV3a6VAlYfsK+ftXvvQSZ5CX9ZOn4gweEYESznFCCCZfai6lFWDVEsNYz?=
 =?us-ascii?Q?4cPx9tz+zEQ8RktxFlDmV4OVaqonirBIb2SD3QhfFcf2bqL3hXxcY2N+WGbe?=
 =?us-ascii?Q?y9T8sJoxyXmcBjUFD5CwK4enE+T8V11IauCQRthg8u0rvzVmemvhHZGerXoc?=
 =?us-ascii?Q?sbjCLzRMY9ty5iu31cUCo6/qJv8TgZ0JXi2Di1Ad7XGU0+ipZERLPa8wEATQ?=
 =?us-ascii?Q?JWFr7ORcpmg+CQMQ40x2HAgj2x+0ykMeOBn38D4FECBNpiHieAOd/vHSN9a+?=
 =?us-ascii?Q?EDsZ5VVcpl7yZQ8sz9vclQSfN3SaTGH9YDkdf7LTyru92iZwyekeOVNqsm6k?=
 =?us-ascii?Q?D8lIPcru12gr0/krYyLNrXewBnpffNmbKUiNecEb47d4X0NPmTXAvQD/i3Pu?=
 =?us-ascii?Q?n4ccPRK8e+3FXPdSkVaPKSm3eUz6co9A9O9G77euECBsDYRFHJi4GPJETg7T?=
 =?us-ascii?Q?YBglIOyHx6IlUSiskGyDWeQlHPoZfS/MTal32drhyJ832T0ESlwn5HUNVONt?=
 =?us-ascii?Q?Prhhq3LGwR+k5kncP6TB33AhLrXu96IEDpTp5TTKc0Lz4DZ6pgtwLzQmE0W2?=
 =?us-ascii?Q?JfDD0ml3mQbTv961OTRulrXNoxsfss/p0A9iWPiy86I9YBVTrEZncXkY+rWy?=
 =?us-ascii?Q?kVDxERZQoBxfmNv9qEAWW+PJJMr0RwBrfsyH8blvNgEsKo7hWABWC8nhryRF?=
 =?us-ascii?Q?XretKFQk7ZR5Z5QJ8ZtTESxjg1nTdikcPco4+c9jumfXbWOu66U9C/PFS763?=
 =?us-ascii?Q?RWyvYt3Rnt5FfWEV2ODtSnSntwAltj6RhV+BaFXqWfLEVgCUHIukLMNNTfvR?=
 =?us-ascii?Q?cqOnCU2g5IT/NuBWnQmJhNQcby66vy8O2zJiqdDU/ilofQUNLsBit9U4S/xF?=
 =?us-ascii?Q?Ob9MxVbEeoRLRz2oA05G3LB9EvKKFEOWYoz49O5uuW0Lh7M6bS1wRCt+SjHq?=
 =?us-ascii?Q?25lWvO4Tw8sxb6L70aTTHbfLCGw1gajZnNppaP3cVB9FXrwrJZdGVjcCZtoW?=
 =?us-ascii?Q?y66OJDTZUGVsE8AZVNiKWw+zZfzbZJZjj3h/yDjmKI3198CSU8945qfUtfDx?=
 =?us-ascii?Q?TDwE3DpiBY3VscOGjmD2KRjto7S7KlyoY22fU8B0n9ukv67vzyN9Ea7XonXZ?=
 =?us-ascii?Q?ooKBv79aOByeoeT+VS9gPVHY/d0gWqMb0keYCGM6Bm7yHiezdyKYxhlndH06?=
 =?us-ascii?Q?WLvIvZZLUIQ7XI2c4iOMkT0Fz5/8FxUoDCTa0F0bOxmYJOlswdL5gxpxb0b3?=
 =?us-ascii?Q?NMzrrQ7TK54bh0zejkw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fa969e-82e8-4f0d-a1fa-08ddd8a92327
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 07:31:50.7243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjPPrPkVYj0WCW+MHwKCvcJm34j2Hu4WL/NCQ3MybgX3c9rC738jJijSFJHzYpYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsgPFQKJk4ExIzGl4PlxEZ1pp3WZww3cG9JlIk+eSng=;
 b=ELGfUYd2maSA567D7JxDOj3ApqG1dK051csJmDgwZo4JnIAAqLir5V4uBfMznvtdQPNnG9N3mUzwrrZdBdxDYongoIBkR5ZCFJrQOZLmTr0XJlojmnRG87UcfP7U3ysXXcgzSiKhsjqxqldFMebJ/P6DAh7bcKvHiD5ZoeNj/DA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ELGfUYd2
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

Hello Thomas, Romain,

> > There seems to be something specific in the init script that is failing.
> > Should we consider creating another gcc bug report against gcc 15.x?
>
> We can certainly do so, but we don't have a lot of data to provide at
> the moment :/

> I went through the tedious process of bisecting which GCC commit
> introduced the bug, and therefore collected a little bit more useful
> data and consequently submitted a GCC bug report:

>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432

You guys are amazing!

I was planning to start working on this today, but you have not only already
created a work around, but have basically shared everything the gcc team
should need to fix the issue correctly.

Great job!  Bravo!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
