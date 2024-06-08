Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943FEC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 08:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EBAB405E8;
	Sat,  8 Jun 2024 08:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bYbv_QgEO5f; Sat,  8 Jun 2024 08:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4B84278A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4B84278A;
	Sat,  8 Jun 2024 08:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC09A1BF421
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C72DB401B7
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnL3JOsbXHZn for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 08:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60e;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98FE040154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98FE040154
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98FE040154
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 08:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9iXl5E5heA6Bkgi7KZ2bZ87hCoAao7vu2RAtDorxA+328xd35n2SZokqnRTFfiwKcYxFnHm+uOUZvEeLuSnPWeF1luK+tr0PhTQ9BIDtvW7pe46Xub6Mo213orwDvHiIyqNYutzhqPE0Ms8i1H8//bLWMzAtx9WwaJSVwdCdPrQKOjfw1C+TQth+gsOe8ZW8gbtV8HMbV+BT5F5DiFMB0PjdT4frY3hmJ9lNr35pH+jEUNnDnFrzSARDZFqF8VB6ncrSpiHG2wbwfHrP32BW2Jp4g4EE+sT4smq5n22KS0/fusloH+OiT5TeW8U7GcCVXuptUBlBp5kcDztiIWYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mm5facfHxKEXuFYRJbwqTb3CxX9ViIroba6SOR3gQw=;
 b=ejmgiHae/ZZFUW4Dhxhb9I+p/FX46N1L/mMnJRXqRyaCML485xqa7VuleDqA8MyU3/CmAIeWJ1CnAKdfcaKCxJ6kytHfRczirza/x5iG4SsOCivLm2ZEjTFDEsl4HZd4SEw/mj3ccHja6YgIqOextDFT2zfhHRsDjrUk/qLZBvOT0YwoJhx03uUvsvAc2ff0V0nXz0wrhqlkCV7GwSJ5xr6VhpI4UfsNzDZjr+On0gP2PJRu7Xxw49ADrL0S4hJB/G+pWKV2m6DFmYDJsJJd6HCaxlVDGjD+IvuPxCIcHZJYydegq0QSKSDQ10nunaWE7yEdv+4UszX6Cfjb76dONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sat, 8 Jun
 2024 08:19:47 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 08:19:47 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 2/2] utils/checkpackagelib: extend hint about
 unscopped variables
Thread-Index: AQHauXw1UhF2L1Zu3k24BibSyIBRv7G9heCw
Date: Sat, 8 Jun 2024 08:19:46 +0000
Message-ID: <CH2PR12MB50045CA7655B8B5517D3E15EF0C42@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240607134848.2974069-1-yann.morin.1998@free.fr>
 <20240607134848.2974069-2-yann.morin.1998@free.fr>
In-Reply-To: <20240607134848.2974069-2-yann.morin.1998@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB8523:EE_
x-ms-office365-filtering-correlation-id: 96fbd67d-20ab-4eed-ac99-08dc8793c25a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|376005|38070700009|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qqcUMkwZy25RjBVbwPCPwnHHtffFnIEeWxVlKhGeO+awfnOWMdM1qLTi2ZX3?=
 =?us-ascii?Q?qb6UP1uIYWSK6PmBa1vF0tyRaPMtgP1kg0cf8+iaMV6fqIyJYjUU8/CYCH0T?=
 =?us-ascii?Q?t3FONVPSWG7Xr/oyXXFoBrAS43+Riy1ZOcaLD0zzikI0/tj/CFImiwsU7nD7?=
 =?us-ascii?Q?87ShVogutjiMlnROPJB7pcvDs/Qrn/WxAAR+kbwlKSuU8PrNj6os8jrypaQ9?=
 =?us-ascii?Q?RlRBe5lyi1bkF0/4qbgwZeDHrtVc/EUha/ben2ftQ8JaXF+M4dW7/r98Hm6u?=
 =?us-ascii?Q?mljYlyEOUzwPw1Xzitlk4Nn+JEKgHVKvwnSEeWhyC9I6HevR0rubTWOOU3ZG?=
 =?us-ascii?Q?aaWyzkxWTS3If2vmXj1A1jFJYymgop2Vgqr7H4893LeRX+PZ+tT6nUVGwGCg?=
 =?us-ascii?Q?1goyu1rF51o3AVBoN2TqYqTI5K5YSyhoAJNjsIV2C+bxwL3LGkLsFUryCFsG?=
 =?us-ascii?Q?Kmr7gjwC8OVPTOyMWjLXxVKQ5nl0qxNY18iGJru1ZmYz5YFUZdTPZ8vTfDr4?=
 =?us-ascii?Q?FRwe1FF94HzlKXvJ/oLPK1hCE/kqj9wQzvBfGToMdqEfFY1ZCk+6aYhWZgNO?=
 =?us-ascii?Q?IER9WqbK0sr2IggsAA5yg9j1gtN8EAD2K1hcef2cW2+7ME7ZVM89BdDDUOhN?=
 =?us-ascii?Q?jIh2Lxile387qmErvpT+6XrgycGeifC5Wd8MW3CAHBbiWWxKwxUsf1kIJOp9?=
 =?us-ascii?Q?wC4u+nWDn2u/+Vdo82bpoOLhPBHPuA7A7yQ1NXUhWjOnvPlkVGObyZAB09yH?=
 =?us-ascii?Q?UfNmS070oAh9FlPQAfAAT82DJPL45QhNYay+JndymSIZNGjjFF4Qn2Id21/j?=
 =?us-ascii?Q?+fMKeGGLkgzM5woPqWmFTbJy1IlpuGOOBbQygk4VsOR19UClUSZlXaW+/wEm?=
 =?us-ascii?Q?EUH05Lw1muQqq2iqulUmabyb3KNd4uA/HK/jydv/GlNJHF2NqKmVOc5+mpPH?=
 =?us-ascii?Q?QvM3BJCunfVegZPl55kK+FpqvI53ooxAwXxd7lFJo8dMV2FDTw4ks/kQd7zd?=
 =?us-ascii?Q?fr18H+InzGtVcQ3GvWQx0dZHRnuSHv9RpeymaR1Nwa6SZe1MMTHxuymBoa9m?=
 =?us-ascii?Q?fj9khmc0fbDqRPkfhIZJqTFbUQRX9deHiOSnEgXQTCjODT4i0k9BZkav0CB+?=
 =?us-ascii?Q?a2ovIjppHLIRReNDv25lx51SQcs0FByxtrH9sAkXdWmVrMaEsQj1HPZ7uyNU?=
 =?us-ascii?Q?7sXMTYoF+VdUOphL/V1vUR3P40AZJbQwbTiGKk6Bm+nLX1i3SsHnEUu0vu/p?=
 =?us-ascii?Q?ZIUnsEwaXPdeFT8mAnoh8qlsGNpzCrGERHGCKa0k3vLvr5HTNTYjc8GQC2/7?=
 =?us-ascii?Q?TLq/YKalPvhdIQMavTrqCBId9hFdQWDItpP1PT4RV2tfvU0YFDwF0+GK7fP4?=
 =?us-ascii?Q?DYTJrAog8A6SA+RMbOjyXGAQcG8M3YW4E239/v2/lvgkICwMjQkIeuSO3RT4?=
 =?us-ascii?Q?PkPuKNGE2H8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SyA60yPRfe/zQDaEbeRSBnxweh7VjJz+WHh6sxkrFSJdLj7+v0epEpvBgJ1Q?=
 =?us-ascii?Q?2+rm9xLLNi938XjSRbjyuBMRaTsoGPIC1dGDRdaWgjMbDGuYiZ55LPfIFV/B?=
 =?us-ascii?Q?eM2vZauAA6tJC+FTv8yEhWPkiwAGBcrELPjgoliQpyx2rcqspUjCFF4gKUJr?=
 =?us-ascii?Q?JYBVQfKxQoRjWdLuMLfgG37uM5rbOG8wJvEAwSX9Q6Dum0CzhTRUxXu5WXz5?=
 =?us-ascii?Q?yrbMumSrJT8rfsA5py9y6VtjlA9RhCYWv6h0SNL1z4PP+CgmITIwxbtyjZuj?=
 =?us-ascii?Q?EvEZUZ6g7pt9l1ymqbTAMaM17dh9UI+1hwYTB9yUhRhyNoHKgCRpeqcRkgE/?=
 =?us-ascii?Q?nQD1FiP/023NIpETbFs12+pzKGnZTkFrfmUpjeOCE0CPqz5EEIocF6pKXnRF?=
 =?us-ascii?Q?BB4yOTmeHLoxBARf+tohME+rKP7kJ956p0Xv0BPf2Rdx7mG6ePbnXMKb7os2?=
 =?us-ascii?Q?nDcAkBreWA2LqAO0dLUtT63E58XbWPVLmDQbHpduAIszMKf5a1fe7VlQCB4v?=
 =?us-ascii?Q?JPK4Epei736lwjtWfF+k052JVck+3/z86xUwseJ6AikGmS67wAZ0jw2uU8cn?=
 =?us-ascii?Q?Tt+1Uoe6k4UqFx9545IhLQSo88UxagfSAjouucMHbIFl1dzskSAqRH1gQhiP?=
 =?us-ascii?Q?rjByd6OPzeJq6qgETTji/Np54XA7C09jAtmkFZiuekjTL+oyGUX12uh0nRO2?=
 =?us-ascii?Q?QUSdadVlNQSu6q0LV7hKok71ZTrN7mrcob2KTVwEKm0dXseb6tq57npq+0DM?=
 =?us-ascii?Q?0KFB8X30I3QyTM/7WP05SM4OmF35Kw39akv+SLP3tyHQJ2RS3a5lrNsEK5FO?=
 =?us-ascii?Q?XWy5X6wtJD4TN0geOEQVTOo15eaXGLT+y+/FqcNqsqjDk/Hl+s3FxqRLQ+ku?=
 =?us-ascii?Q?v5K4YShmbYfshNdZcetumbNJ+bCW7no6mgoBHFMu9xiP11rKamU4Q9+fbYr2?=
 =?us-ascii?Q?bIKqsvwHKGuF2JPcMzIRz8YwuuSrI0y3SH7CrvL57NrdRJ3dvNnjY/ovIw2M?=
 =?us-ascii?Q?vRlLRv1H4Z+vNFIwky6ccbF+rTNLy04Nncp2CIhSZs+9gN5YsxXCY+ZydXnp?=
 =?us-ascii?Q?uO6010cGtYFkzaAKC0wA9yXFQxH2VZF83WvNt6pqA/gRjxFPPkWI7iLM55MV?=
 =?us-ascii?Q?mYA+QS1iyeJnmb8GdcPAXwG13J65dK6uiH2lL1+h/wQHnfsotWFM5Jwak0Jc?=
 =?us-ascii?Q?/9n/6ukAmUbnMIKs+WQAIxEZWXEkGscGtcMnPHAIJvz97CfwpSrRZBSx1htw?=
 =?us-ascii?Q?83upI0GeP4/pWDmcpP+VFZfTqE+Q+w3H5PtEmv5fQPDysvVPgj8a9QV4BDba?=
 =?us-ascii?Q?98CXQ2fXB5818i3JDvopNX2QukmvzEj0vxPHntz76P80N3VcxHIYBFiyWUC1?=
 =?us-ascii?Q?r0JuGfK2vYChhHMWZ9/AE6uBOVFElpfvIrOTq8l6hN/hYBa+37rAF6tJ33Q4?=
 =?us-ascii?Q?ccuQ9b0Evsp5KEk53JLDHG1jr1EoUxPv8HGZxI7qHOQ7OhPEuyyyTYg0zcJ1?=
 =?us-ascii?Q?1g2vsj9K50C8R1sXnsLJmZGOYyLfsdP+2oL5kqcJw1JrVxbEKGnBtWLavoEe?=
 =?us-ascii?Q?2Qiaouia7bJLAKH2JW8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fbd67d-20ab-4eed-ac99-08dc8793c25a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2024 08:19:46.9995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37jvU6+WIJVDvGOi7e1UL6Kcy6lQgm0BvSqd/a0oJE2Xu/TgXwitKermXkyrPn0K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mm5facfHxKEXuFYRJbwqTb3CxX9ViIroba6SOR3gQw=;
 b=AgoYqzMKyjC4l51OZfcHXF43T0r/1g4cTruV7YdiQuOmSgc8jrqwzpSVFqbN2k3db+sTV86mcgyJ4qqHQQF6BFy3P+xYks4yXzBQ4SaZFMUtClr9r9pcR3KJd+Gb2p0W8Jd1hy/PmCHy4RA8YQVk2GXnCP8m6LqJ6qfhf/hR5dI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AgoYqzMK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 2/2] utils/checkpackagelib: extend hint
 about unscopped variables
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> User may get confused when they see the current hint, and take that as
> the proper replacement, while we're only reporting the stem of the
> variable name:

>    .../foo.mk:16: possible typo: BLA -> *FOO*

> There is usually no easy way to actually suggest the proper variable
> name, though, so let's make it a little bit more obvious that we meant
> the variable was improperly scoped:

>    .../foo.mk:16: possible typo, variable not properly scoped: BLA -> *FOO_XXX*

> And while at it, throw in the URL to the corresponding manual entry.

> Adapt the test accordingly.

> Reported-by: "Frager, Neal" <neal.frager@amd.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
