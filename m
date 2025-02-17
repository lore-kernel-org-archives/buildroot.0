Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD4BC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 13:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 470E640457;
	Mon, 17 Feb 2025 13:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lt1oAajpgjt8; Mon, 17 Feb 2025 13:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F06403F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F06403F6;
	Mon, 17 Feb 2025 13:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59276DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4360A403F6
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeOVAaMyvEni for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 13:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=136f4d29e=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C148840391
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C148840391
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C148840391
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:36:31 +0000 (UTC)
X-CSE-ConnectionGUID: MkZBZuwkRBGuhLuJZQKXsg==
X-CSE-MsgGUID: QvEsTyQoRsq+9qxpieEbig==
X-IronPort-AV: E=Sophos;i="6.13,293,1732550400"; d="scan'208";a="39306896"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 17 Feb 2025 21:36:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3RrT8miVOLMLSRtWauWpswYOe0znPU2pA9S6GQlc8yFfioVqEgEl73o/KJ6PkHvKULUYfYeV0JBZzMoBCehoyHIbel35m3ciDhJOrMHjOIp+Z/y4Xqko/caW/cfDRA2JKCFisKk0VPPoKnRmz6t3cRPC6ZqzqJhBU+4Vh9dIfuXKM8qzC0XHWeR3+H5YhWkDGi8ToVE3aUKgyZi6e7ax67QzoplsNk4+ig4wcLQumaB36MV+4HltTLWI/cTDIUan7rCKtp6y4A6WiUY9crOwv6NOCT09vQx10EwcgGyKC/SvBVHIIYBS3Ub8tqfHGEiU853dIE1ljl2AnCO7ZbowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHIVyiTxnLy4EZwPPeYRf0bMudNKUz4jnbKLTw7nXig=;
 b=eH5KMWb82o/8ODan8Jfm9WTTMLcWmRrT75W1KgovG6h138800n5qCL8BeVtQ63pyuRXj8ZeHVKr5lv2M1tn4u3fgf24ckOcQRW5pygusKyRL1i1akkn6awBqFFWtDgxulzCTFiTF+E/xgl2qNpsn9Rlw3uNlRCCaQ9yOm52UX7CxcBSqE+fXOc2pTFyrAaCfUdtLDqZcNuUy7XrkN898drI8YHtWcX85ec+/tWxceV32iUCMcHBluip1BO0mYxx8X9H9GFzBhQZoz0aSyOP8J4YHn8DKkV1PPoyEF7xeTMRq/By9v6lQNlooH391MmGvAHp9TICJ0UDPwtEZZOHJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ0PR04MB7584.namprd04.prod.outlook.com (2603:10b6:a03:324::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Mon, 17 Feb
 2025 13:36:26 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.015; Mon, 17 Feb 2025
 13:36:25 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Fiona Klute <fiona.klute@gmx.de>
CC: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, =?iso-8859-1?Q?Ga=EBl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Julien Grossholtz
 <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, =?iso-8859-1?Q?Jos=E9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow non-matching
 globs for DTBs
Thread-Index: AQHbeYPmJeZLkqwz20KkKsFWC4YpwrNAgM+AgAr8kACAABF6gA==
Date: Mon, 17 Feb 2025 13:36:25 +0000
Message-ID: <Z7M7WcyqKWCycgI4@ryzen>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-3-fiona.klute@gmx.de> <Z6n1V0BQyoJjbn4u@ryzen>
 <10299ed2-643e-4ced-9ddd-579c8ef33bfb@gmx.de>
In-Reply-To: <10299ed2-643e-4ced-9ddd-579c8ef33bfb@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ0PR04MB7584:EE_
x-ms-office365-filtering-correlation-id: 17b8dc5d-54b3-47b7-8d9f-08dd4f58136b
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?KPoYhSCc04U6+5Jd3RKGSEkLGlE2yW6Ro/GFsffSVHp2IDalPMmxd88NDc?=
 =?iso-8859-1?Q?lhFm+vim3l25LvlSGq2upi40/lNIFE6OLiCLg91xfkNL8XhqMQnGP/pA9G?=
 =?iso-8859-1?Q?0ImP26GRzwIOuZ/UN3sJhh6w69RJLIcmmx4MrxnDWeKrG64L8fHrV6sYQB?=
 =?iso-8859-1?Q?8XU4pnlzlm5cFcN2UGcYUL7NLtEPuGssZwnJsJp0H2MFb8kEcWK2jBj/y/?=
 =?iso-8859-1?Q?7sL3QMpbCQdBqOQMOGshPbIEVIiWAIrzAmeRdalWjZC1nLJERaovtOcF3H?=
 =?iso-8859-1?Q?DHresklDdWYoMMgjmZ/gCt2DLWXgi2YO0FafuMHJmwrUIb1dKz7JuNCziK?=
 =?iso-8859-1?Q?L4R8io8HkOq07YKc3TgfRPgg7pXu/vnR3pDFzTgq+pJltrD2Bt2o7PPYMe?=
 =?iso-8859-1?Q?6AU5/cprdnBlshh/Tqwb/FJPAj8ybabn8EfZwEpaHKy4qGb1IGbjmF8p5G?=
 =?iso-8859-1?Q?soXRppjhxixtuXyOM/zroMsixI3PTTTcmHBG2oqbHWDt+G5WTXZ3jDtBrK?=
 =?iso-8859-1?Q?lZnKI7/hfWG/relXgNfHERyKRIOnqsL8MFGSr9TWH2iZ/ckZuKHg+7FN4e?=
 =?iso-8859-1?Q?sjmGx6Fld+a9ieV0yeGHrPqv/zPVE0cLR3thr+NVfnpSXSh38/yMLYBhYm?=
 =?iso-8859-1?Q?yUi96g/vi7b+VuyvGOg3dLpl2l/nSTfQ5Oe3akFYbcHTq+LdoADQ8Sq7DI?=
 =?iso-8859-1?Q?tHb37S1AD0p7tWWdigNf4Ea9xPJ2iUVgJmPZubXnbI22TkjNSuOoXbMzq8?=
 =?iso-8859-1?Q?DKHsR4uSCTGwV47dZXikOM6DXxp9H7itcvMIpkSjiOQnGHUH23oFSRrLT5?=
 =?iso-8859-1?Q?wH/ObtXIcgfpoI6dGYs/1VrX781bZWTpIwIpj7d1nS1peRE6RZVFpAA0cS?=
 =?iso-8859-1?Q?hjXARRBUKQy0fNgtmFPAzSbsTLIV2+Os+d4I4lnnFlV3nkbFNSlkqSjPYd?=
 =?iso-8859-1?Q?YY39qX0IQYw7nUJFSxg+cdCwFV5ADtKszLfI3P9lHkM/t4Ro9MdC+rRs7h?=
 =?iso-8859-1?Q?U2cVC+f49WrPvjduh2GdRvKFJUJeEQHFodF/Yhhu1BJpm/952UBNUWMrye?=
 =?iso-8859-1?Q?jjjM8cYiFZ5dZBdqOOqTzkok+v9oPCd+Cv2efRgfSbrFP50dAO+DH6D+Dz?=
 =?iso-8859-1?Q?nhtkFEnQFFL5nHoeOEVsVao1cDYFiROS8JE8ZiNtfALRzLzvuUnJJGsWDr?=
 =?iso-8859-1?Q?1tJJz8CvMQBVCp/vTlUKIv4Uh4dsvcdCTiYaLxggxnYqQecgny6+bFGiH8?=
 =?iso-8859-1?Q?Xo/1rahztGZ9m1RJgBMHkMBkTVqBBFIu3i+B5JulP26xYEIKWDd46LdiUc?=
 =?iso-8859-1?Q?L2A41L4c1DL4t1cTbulCrrsXLMjpuFpSscRfA8ilwZplDS9lTmZOOJth2J?=
 =?iso-8859-1?Q?cN9EHkJOZSYzp87Gc0bvOT1IPglvqaAj1pjNfWDN0gJV98w4YHgKcnnE9Z?=
 =?iso-8859-1?Q?0eGCVJUQABkNuSAmh1VicyCOa+WxFv9/lp9FTcjA4TlehD5DpRcNs8HH3j?=
 =?iso-8859-1?Q?90ix+XZX3zNR0TiI9TixGoSut6cLhMECKzIkJXsc9qlaThVFqmafErGoC/?=
 =?iso-8859-1?Q?CcR9OY8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zip/Kt61ZCEI77mU9bIzBKcDDXI9vDpygxlkmnzvbbCWczQsG60PwJVhKs?=
 =?iso-8859-1?Q?5YssxFBy3RVing5iAdPhprM294il2HsAa4Vt/xaghIbKkfBZ41RC9vLRo8?=
 =?iso-8859-1?Q?Yg2Xsi/s4x9rMGJenyRFtXqY0EFLQK3GXNuciodu4c0OpL2m9rmqdeWiA0?=
 =?iso-8859-1?Q?qDp+l73anyUapOCOfE5zlk4XilbnTWSDDwHYyj69N+vLr4HTjns34hILcs?=
 =?iso-8859-1?Q?iOyDc1jHhzPfKNBSgEzjXNzW8Kcymk5JfoWnMBS7vZS22vKiOif3FAUDEz?=
 =?iso-8859-1?Q?1632NXn5j/DoTzPdjyh1bmS8oqIpbj4U+il7cqwJ8Zov7J+7OhyWsiWoXH?=
 =?iso-8859-1?Q?EzxDOakFnDeHCV4+XpnF3Ody6c20o0wQnd+TQwe4iAXsbXL7aQAD8yZFZ6?=
 =?iso-8859-1?Q?elssSstmc7IdWzcZ9xgUYXPwRnIYJENEaLNo5YjXZk5sClRGtGlTFdS5Hb?=
 =?iso-8859-1?Q?d5fkc4FOrTTAGmSCTJRQIYrib7GJJjFfLGsyTfSY+mvvDdXIzwKheDTVog?=
 =?iso-8859-1?Q?0CXjMO+71Pk1b39+ud2e6NVcoIMX60PZuOJAixxmhTFHf6KKXd0NcM4pt2?=
 =?iso-8859-1?Q?8AdXjx+KyfcfEnmDIfz/hp1kxHG8MmMBo+tugNEcyi/YtFSbO5i558w7/7?=
 =?iso-8859-1?Q?9kn+logWAnnIvpVZWaqFxGT5lsVde6k1V9FPTJdicglC5LcpU+F3qlUw1m?=
 =?iso-8859-1?Q?qFKK1Z2MCyMYCGwR1XpNBDnMjmj0yM1B9nseQOnEu0Wj5+4pplxo6eqIld?=
 =?iso-8859-1?Q?ZJYkV+ilYgERmmX+zgi/kQRI0nZAwmC791njq6bvlC63FoDyzj23zPUqon?=
 =?iso-8859-1?Q?p1iMRpn/l2k/XHIhUfJRRu5Vj06GL9nM8o9ogkHX29UGzxoxS+iF+ezkf7?=
 =?iso-8859-1?Q?ylVbMorivdPC0VUuKQOkpQesxDos5ZPxt7T17fBnclocArwA2cT7P0wkwA?=
 =?iso-8859-1?Q?TWAMFvjtXZPTMT/ZxLBj+KpQAQZ6URW1mLfAyLjwKLXEhYKOinzQdYRt2s?=
 =?iso-8859-1?Q?7Mo147Mgkq09dw/HuNeccu6nIdx80vagPIIeYPTzR4LuXVnNLECfqFQp8Q?=
 =?iso-8859-1?Q?KpW2SFk7nS2qhcbiGIY0EIsj333bcXLCrUr3lexTc4r0iKe6BWLUh5I2Aw?=
 =?iso-8859-1?Q?b8l3HMJutP1qrpQYsNzLpbBGGKLqgtsjqMpuioUmpdBVDB7kdqWCe52Gkk?=
 =?iso-8859-1?Q?ymNtebhCYKytWuYtw406BV+XmvYaYDIBozz0HWCKcbdeNRy7NvOhhywgY2?=
 =?iso-8859-1?Q?2IqOG65P+mRtlCT8epURTomKaoZES5737pM55I9TV683/pwsFq8Zb4f2uS?=
 =?iso-8859-1?Q?OCRUb40TexnGXT+KgZWLil+0eNC4i7RJ49cN9IbP95xwXdNwcNfoT4ncA6?=
 =?iso-8859-1?Q?WiuB0S3Rt4lpmLL129MgPuc6AEw90YXZWSLFbpMOmszOTfGy+g0Ur+Ld44?=
 =?iso-8859-1?Q?P2wbA6NrpEKqBKoU0Zi6MuqjKBnHJknwVYLqTrdIV2xytBJqI4PdHGR2Bk?=
 =?iso-8859-1?Q?hXgVYN8XNsIzAPKhk3poWCeQAvbYLKqdFdKse8XtRXEATqKGF0ApLKM8K2?=
 =?iso-8859-1?Q?QMt1CUisDqGi1/lcymIyp+uUdjBjr6UaZ6XWAnstMiOcxZn23JilWn114r?=
 =?iso-8859-1?Q?uP4+2BfezpYumCYO2BgIbiWHO+jmdDwZ/1OTWaS8rM9o4KN2Tqdd6V/Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <CDAE6029BB7A284798B348FA60502256@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oYwvyfP+bt/EZVw2kiTUDQCo3npd76XSkvKby1fM9cmuhGRXO+5w60IVcDAqy25052V16t4CKVcJNB589ZI8s+5hVS1gjDF4FDi4at1eF/P7QuZxGgkloIDFfthGBomCTW5tlf8eEHrdKh3UFKTAU2RbUsreMfwVtXmR7P+VftyEMTljGaOlafY8XvA6HMdxQ4TcJt/aAURJfJI1a1bN4NcBI19SyuRBU15tVITBxRxl6M17UQqohhirPXaS0KjgP+BYmZJvgN/hirPsXIYJeLSTQDihmmGt0Mei0pwbMY0Q5SOSYJTTDqrY239VqrTGQ6E3PhLfs8wZ03IzinAwcbpz3FYlQsq4+tsJx3HVPE5U5HfJZ4TJnbGDiy/Tt97yqi0nQqsB08IeJ+rXHMRQYyKxzXm4H/DapHbQ3fU4NDCFmQ6wbQHCFSucQqutiuyZSUhjY3jVKinMxhuKeIbfQgtqkL4yHQDYCfsTGK6SJa6rj8aX8A1LFpqPsxNJIxfS3fJTxEfVjLGx2qL3J0dEwV9NFg3JXN7C318zZHFtsS2otZlmOyVpwpM+5dg996Iwx6hzIiFdvB7LiPhhVlcRJwj/HTUh2pzKNuZQ9brPGnp06+ICbVSruImp/duLruG2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b8dc5d-54b3-47b7-8d9f-08dd4f58136b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 13:36:25.7808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ku5+8rxV8hPe8FKgrAeNxvWRQpaeVn58i3KINgQl/KqGs0GtQBTJ4dZRba8ZvZOQGU65yjDhWLWLssdCgMfxtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7584
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739799391; x=1771335391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=vHIVyiTxnLy4EZwPPeYRf0bMudNKUz4jnbKLTw7nXig=;
 b=i8SA50bZz9jDQMH/jEuGqlLvbr0on83wg9UdYPOmEpsfG2msCGrfIEdQ
 WLgJB9JjRL2t99pARN5BqXUjB0MQyBATs5MOpnMW1l5d7tXnBjkHBEr9M
 UOEjj6l0mNzBTyxi3E9cvCkOkEKGUm2T6Nxa7Fno5opi2Q9YuDGHyP7hJ
 CSXvJpOnEga1usoylmI+qpWSJUBG5JZVWv8GQV2ToVOstNAlzlFIQxN8J
 gbmD9sHSaB98Sm/3fF3ifwEimdBYiDg7RTEHZu4AdgVlPXbEaG1Wx2wJL
 5Jz7qBDrSjygjJUi9CQ9dYDna5w5dqDuP9oAz3IHDUa6+yGEDgsALaZ24
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHIVyiTxnLy4EZwPPeYRf0bMudNKUz4jnbKLTw7nXig=;
 b=HIFU0gzputFmqy8RkFkwkgvW3lRN36xxhhBLhJSIXpzh54mA1BIJgeTYUavO91oScLhVc00OIejE9QUjmiUhYgHQR9XtrOTTwZPI6mq0753c9/5VtnQTeEClnIcqM0sLESw6S5KCoP3AAVooEyiKryVYsYfj05dK1WZI5W1RKb8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=i8SA50bZ; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=HIFU0gzp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow
 non-matching globs for DTBs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 17, 2025 at 01:33:52PM +0100, Fiona Klute wrote:
> Hi Niklas!
> 
> Am 10.02.25 um 13:47 schrieb Niklas Cassel:
> > On Fri, Feb 07, 2025 at 06:14:57PM +0100, Fiona Klute via buildroot wrote:
> > > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> > > 
> > > When installing DTBs from the rpi-firmware package
> > > (BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y), there's no DTB directly in
> > > the images directory because the kernel build doesn't provide one.
> > 
> > Your new defconfig does not seem to have BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
> > set. What am I missing?
> 
> This change is independent of the defconfig, which is aimed at a board
> that's well supported by in-tree DTS (both mainline and RPi downstream).
> The only connection is that both are about support for RPi boards.
> 
> > Regardless, perhaps clarify/rephrase your commit message.
> 
> What needs clarifying in your opinion?

This series adds a new defconfig:
configs/raspberrypicm4io_64_uboot_defconfig

Since these 3 patches are in a series, it is logical that patches 1-2 are
actually needed for patch 3.

The commit message in patch 2 references
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
However, the defconfig in patch 3 does not select this config.

So, if patch 2 is completely unrelated to patch 3, why submit it in the
same series?


After looking at package/rpi-firmware/Config.in it appears that
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS is "default y"
(and you new defconfig does select BR2_PACKAGE_RPI_FIRMWARE).

So I guess the answer is: because package/rpi-firmware/Config.in is silly.

A config option to install something is usually never "default y".
To me it is very counter-intuitive that defconfigs that want firmware
installed, but do not want DTBs installed would have to do:
BR2_PACKAGE_RPI_FIRMWARE=y
# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS is not set

Rather than configs that want both installed would do:
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y

But this is unrelated to you series, so feel free to ignore my comment.


> 
> > > Using pre-compiled DTBs is discouraged, but useful for using mainline
> > > kernels until suitable DTS can be merged, or to provide U-Boot with a
> > > DTB (via the firmware bootloader) independent of whatever kernel DTB
> > > is in use.
> > 
> > I don't really understand which pre-compiled DTB you are using, since
> > your series is not adding any DTB, and your defconfig does not have
> > BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS set.
> > 
> > However, wouldn't it be much better to rebase this series on either:
> > 
> > 1) Romain's series:
> > https://lore.kernel.org/buildroot/20250204163622.192932-3-romain.naour@smile.fr/
> > which introduces BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
> > 
> > or
> > 
> > 2) Your own series:
> > https://lore.kernel.org/buildroot/20250207183455.1468220-1-fiona.klute@gmx.de/
> > 
> > 
> > Then this series could provide a DT source file (.dts) instead of a binary
> > blob (.dtb). Having a DTS file would make it easier for other buildroot
> > contributors to make changes, and once upstream has a DTS merged, you can
> > remove your DTS file provided by buildroot.
> 
> This patch has nothing to do with either series. Both of those series
> aim to support building out-of-tree DTS and installing the resulting DTB.
> 
> This patch allows the post-image script to work if the user does not
> have the kernel (or tools added by one of those series) build a DTB, and
> instead sets BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y. If they have a
> suitable DTS to build, there's no point in using that option. The
> rpi-firmware package installs its pre-compiled DTBs into
> "${BINARIES_DIR}"/rpi-firmware/, so the "${BINARIES_DIR}"/*.dtb glob
> won't match anything, and including the literal glob in the FILES list
> will lead to "file not found" errors.
> 
> In short: The purpose of this patch is only to make
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y work without forcing the user to
> adjust the post-image script.

Ok, thank you for clarifying.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
