Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50010D2CDF8
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 16:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CFAB6079A;
	Tue, 22 Oct 2024 16:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXGqkiOT_WL9; Tue, 22 Oct 2024 16:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B4A460646
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4A460646;
	Tue, 22 Oct 2024 16:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C82542072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B622E80D8C
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIv_gpKfwQWL for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 16:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB87C80D53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB87C80D53
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB87C80D53
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:38 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MEWEmb028500
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:38 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42e0r6ertb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:36 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.135])
 by xusxph009rp040.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MG6XJj032132
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:33 GMT
Received: from UUSTOE25.utcmail.com (uustoe25.utcmail.com [10.221.63.39])
 by xusxph005rp010.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49MG6Fdg007140
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:06:33 GMT
Received: from uustoe1y.utcmail.com (10.221.63.22) by UUSTOE25.utcmail.com
 (10.221.63.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Oct
 2024 12:06:21 -0400
Received: from uustoe1z.utcmail.com (10.221.63.19) by uustoe1y.utcmail.com
 (10.221.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Oct
 2024 11:06:21 -0500
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by uustoe1z.utcmail.com (10.221.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 22 Oct 2024 11:06:21 -0500
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::20)
 by BN2P110MB1431.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 22 Oct
 2024 16:06:27 +0000
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452]) by BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 16:06:27 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "Buchmeyer, Neal
 Collins" <Neal.Buchmeyer@collins.com>
Thread-Topic: [PATCH v2 1/1] linux: Install artifacts to staging for kmod build
Thread-Index: AdsknEUW0UpYEvgEQzGuha0yKwI2qQ==
Date: Tue, 22 Oct 2024 16:06:27 +0000
Message-ID: <BN2P110MB1160FC5A43AA27C6195B68A1974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1160:EE_|BN2P110MB1431:EE_
x-ms-office365-filtering-correlation-id: 3dff7f73-d324-4380-39ca-08dcf2b37c43
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ClYg5xaFnXBISIfzvZLNkA/sZaJmeD5xgRnx0J7ogekvT6uo62Q89hpw3tKV?=
 =?us-ascii?Q?dtFmQ+W8i1zjC7z8uAj4ATAIvU6pZSKENM7jDLDCrpDpS1w+df+cs7/aA25g?=
 =?us-ascii?Q?mjB3j1LC5/CpZR6v5j3afKs267K05jaCRCED/mvdEjoRAlYrY4ihBpa3yarS?=
 =?us-ascii?Q?5JM/5g5VGm8ymD3cE/XX5mVLtdkDV0+/lda3I3JpeB2e46pGKKQSOSc2gGnP?=
 =?us-ascii?Q?tLVC/NtaAbgReNzoa3Sk5m9glwtnR+9MACnwHwngTzPry+NXfnC0uxSeF5/6?=
 =?us-ascii?Q?SlyKIV3QCFz5OST/eeDk1K1I/ZxGRaKiiUS0aHR/+0iexBri4J4bVW7ch0Iu?=
 =?us-ascii?Q?1YeFF7DOEsb+jNWhtcHUYqDKr0dp1Ea6xdCBvgi1Jd4yN/nXiVaNSIEEoOFU?=
 =?us-ascii?Q?s8QdQDBP0ZaIy6oK5kBFdAA3mOc+51C+xuVgX9YF6++G2Ljf6N0lDKgsguDY?=
 =?us-ascii?Q?C/zhX/O9p4q1Xt1NK08PJ3ih4QBqZgrV4csXTnlGt09n9coGgVoYARHEYghc?=
 =?us-ascii?Q?Ic8P3ACVfUALXGbq0BjH6CqRTXMFTO29X1HJRwRdVh5CSV6Fn9N4WvVHivrF?=
 =?us-ascii?Q?RAR6OTuQ2SAdEfVuwCcMzewaSb1kqQBpBaXIydsN0e43yTZclnrCqi3wIC41?=
 =?us-ascii?Q?Gyv1a36wcJN/xOS9Mc/0Zx9nkWk54qxt26iQmxd6ekpO1hMCKGBK0jbmXSv6?=
 =?us-ascii?Q?ed9CFC0OSFh99Mg1nFhc7R32mgfpSZA45dnaD7IhBmV6qd9jEuU/ab/NjUa0?=
 =?us-ascii?Q?aV62gV/qUZwUkUPRGsC5QdKhnXSeAtfJDe96l2ZYv6ONNyOrR1bqw/FBTUfn?=
 =?us-ascii?Q?SnehqgGIguSmZFelEZeBdouu3dx4DZDJ9ZSh+lwr7TnDf1YFc2N2MMSoFPw9?=
 =?us-ascii?Q?dsXr0ijQhJePiferBurxrgdez4gEdd7F28KtG9+ncKAQ5SfZ+V7B+YqsaOU2?=
 =?us-ascii?Q?sQ0qEUss8/E4omvLzSuAh3bogzxruKgiLdUZTh3ZydUGuAmXIw8oBkZ8msp9?=
 =?us-ascii?Q?Exufn0Le2l7WRsB2t2pj41Btf9gnZ2wWGhLzexPrzRlb7T9Hdw1dZbYcaxyY?=
 =?us-ascii?Q?SH5Bx3ChpN0wGH4+L7QRmkBrGlyE3NcDFGXNSm1v9wv4jv4ImzhXTIWzQptP?=
 =?us-ascii?Q?QfT68nSBemflbgV25UD/KI/x9u0s7c8G3/vjssKmNdFu5mI4CQGen4fcqP8w?=
 =?us-ascii?Q?0ab2pXLaYWepdUxEKkI0595xVJ038pilDXAlnCHa/1U8wfxDfDbjBKPGAWTK?=
 =?us-ascii?Q?ehQkKfan0luKrItGycIMhNZ5lSAmEM0jI27GUFGuytdY6wvvbFEEFcdHcR8a?=
 =?us-ascii?Q?bih7xx90dHTYvEUdkvEJyF0C3Ef+ENPcwwPObWqHeHfaGi6UkM7XtPNN6tSG?=
 =?us-ascii?Q?r+L8T1A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HPMy6kwtVE9qKoG/tvyazeByb5ahgx9P5GvsM4FrIaRJry9SAHPLKJ8XgUaJ?=
 =?us-ascii?Q?I6Vjr1an/oBqri/yA8KoQ4Uxuz653woTANolPGhlcZS2pfxvZCpKBdhRLrbj?=
 =?us-ascii?Q?2E7LMOSb5S4+9amYjkCeypPYS53FNNmQTSTfhUXYJS4dZ5ttq+nDd5sH5uSh?=
 =?us-ascii?Q?A73mW3Vs50LZYO6HHAWflFkZLyKUc1CB/qT2s4XkfSkw8T+sViGLKc7exFuf?=
 =?us-ascii?Q?7qO9t3DhnbphCZYkB/Ka+UEnOkTABsCfJr+iu968fBi7DnWPIYg4a/MXWUcj?=
 =?us-ascii?Q?TfW5UOPomDFKJXbQ1IeZ1s8inruYh3fq0HoKWhwBch8aY8FyEhs/Fv6FE65k?=
 =?us-ascii?Q?YGKm/QzCadQNVyXbchEOnDrJ574xA8PRef0F99Q9/EDjVmoLKbed+/IO9xHE?=
 =?us-ascii?Q?Li0LO7EEY8QFWhm/nlfvF2+mIa2vYUSJnvxHF2GJr9E3KCS4v39aD/uOcPLe?=
 =?us-ascii?Q?WxjuUBqrwE/tY8BflWXfL9UfxDX1Lm81p6hqmWJ3at4jxLouMXN4oNgP3Tnl?=
 =?us-ascii?Q?g9S9JS3iKGmHCKloyOLKogHl1jraE23N+HMWh5CTKxlhmg0HWsE4Efh7EoIw?=
 =?us-ascii?Q?gPMe5Cu5VixeETklm8LvLKFh+iolpeQMjfWh05bQ0JZhwkU86scHqTw4xCvf?=
 =?us-ascii?Q?jh2Tg8i+A9VajJ5OBRIAYiu1wpxDX2IXPMVk5Xm6rlFKdj/Bt9W9k0nszKz+?=
 =?us-ascii?Q?NuV7Vyr4lgwh19RqeWdsazM87G08sTirM9zVBLXriseamvFTQlZLe7MQB2uD?=
 =?us-ascii?Q?d7axk6oZ7OpwPsbWaQOmXaihGzAwk3HX/CUHlYY10Cwj5UXWn2WI3w2eKoaG?=
 =?us-ascii?Q?yJCIEcMD3sgll0AfJnbW2ZMC0Fd9LbLAxW6qFeIsND+JMBs/6/X5nUXjKhQV?=
 =?us-ascii?Q?Lg7Rl7jeEHuSFg4geU6fqwKGdmhG7it3bqat7WE9kR+kPmSzwqmiqIlQFxYd?=
 =?us-ascii?Q?xL/yck+ZhrXx83d0dHyGb4B85EjMfBE2HQf14MHpTjQCddUF/PRVG18jsLzY?=
 =?us-ascii?Q?tpvSh67jVCsds4YoLIi2bXjp0mbHw7BqvsY4RMHFmvIlLtCB2R8d7frnv/f8?=
 =?us-ascii?Q?WdWC9FoD/Qfzz1u78oNQCUnW/GtRIYIV1Uv+gCE5G832Bhu+bbrIwJDw1VjU?=
 =?us-ascii?Q?AQH1dekEuGrUkVoYE2Nx2ICB4CanF5VtXb+Cg56qDFFKvKlJ1t2G/TXMPZbJ?=
 =?us-ascii?Q?HUvxG3OsjaDfRTUnunsVhNPdTo0DGbEuHVYSKmTqi5KG0sYHE3ctih3KQLaZ?=
 =?us-ascii?Q?8CdcFNTNKnNwkYYMhNA45aiAAVBpghUIyUif88hEOXyvCu01QiihLp+LqgBW?=
 =?us-ascii?Q?ace6exq0bMa3FVvHkmg5OarVWmISh00yvd/EcRVJSEaoo1SFSRKt0FAb+o5E?=
 =?us-ascii?Q?IKoQMNc0rgkCcEpErahul+4Kw+QqAOwLKOaO2bhnUjzm2LarEtu9u8Z86nhb?=
 =?us-ascii?Q?WJ83rwo5Znn4VYbldSqVd28/4qOqXJXtF98UiqjsvcLmwl3GVdYZlw4TzJEq?=
 =?us-ascii?Q?ytmxtPQBKp/TYpM=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=PVXAEmdnak23cPEOMvdOjb3W+jS6yXJ9t7E5nZqLB5BDUs/QFG7WNkEvFHAxOFeAELLpSviNP7QxTecDloYN41PIt8teyVj3EswiCKN4gEHx7ECUGqoBTsJS4KmWPmw6PjuTaWCPqW1cDo8fTJ/1D5HC6gLk4ze2R6VYq512Lt8fyMJaoZ6VIu7zuDhPMNKuSncTTe0KDKGaHTSh7Dd4NewicafLQxG6zoiVllOJtUUrfK+Gmh8te4tTetLmyt/cFxMOatGe9ekLMpmEdEvy3aRnN7bQ29Hy3DThn+tAtbLIV2kicVanI4pBF/mgOOdGzoegPQQemjStOLrOXCp2VQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDUK7wFg/Afr3EGmL9PJSFpWjcvaXrmKYfLuo38pV58=;
 b=TKeAm4cJRELdYdotwjE5RJYRB5fD+WmiNPpAzFPUjP9EhKfb4PWrfpoNq6+O1o87Cu7y3pZLHAP/rC5dnQZNolwCMl6HSGnH4Mqe98xgDJ7aCfK28V83/HlVE4/woQUn71NREmSwUKZDTKqZau6QBtn6lRXGGXFQ0nrGMKSLHVkkjGNyW32xxLQvqMWluGz8liPNyTrWCafCixkS3JdQfeOq/TGgZ5Wy4sH0omdmwVCKzTuSANn6QsrrbR8wy6AfHEeoV/mA6ul8qLHAfQWONWjl4mxtUb3ZPGatxRPmUf7z3PRbJy5RCbbZ9dMvI9TiQaHn1NXDa6PFysydYzYrDw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 3dff7f73-d324-4380-39ca-08dcf2b37c43
x-ms-exchange-crosstenant-originalarrivaltime: 22 Oct 2024 16:06:27.6993 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1431
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_16,2024-10-22_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_16,2024-10-22_01,2024-09-30_01
X-MHuser-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220103
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220103
X-Proofpoint-ORIG-GUID: N3YOwxzm2KE5ctsn9dM0i7udIVHx1hZY
X-Proofpoint-GUID: N3YOwxzm2KE5ctsn9dM0i7udIVHx1hZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_16,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410220103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=hr57TIkEtFMxsQn2DyWVQpsMeXoFTk0MD2feCUu/QlI=;
 b=qdynujKUlUHa+bHov8/w0Fce/N1dhbCu2HH9nK7Cmue2rUqAxY24dsGrEmB7xBUHZ9RT
 7oGmZhbNzc2NmU3Qh5SnCh5Xy+dCYwZPRGgv1U+V/quwSqGcftU8Q6PFNFdDMV4+C2b+
 LsXZBEwWx2du5SoBV8fKuXAT05Izi6euN5w5ySgkFGHVnJEj6vY0S89pedA200OdaAhL
 NjsLcIJUPVmn2KngknthmxHdBFWH71u5P+HZ586TlQckJy239AI69OiTwxV3bdG756QJ
 6XB0TycqZGvyphM9lZR7GPkGgavTfnmq9/XTD1nctS+RjRyOikSDheBoQHTeSnM7JoA7 Iw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDUK7wFg/Afr3EGmL9PJSFpWjcvaXrmKYfLuo38pV58=;
 b=iRQiB9sWAqB2iJR3N5FerRz78BH2IWP6gPZCktrGNC9Ja9KIDv81ZgtXnrvzVl1Dd83vO4S8qYHVxzPNdMMyXe3aHBXbzS9OYFQwKYW7Z9IVNdQjCQpqkSuGnThPF9xaA6AyXtrZ7YtZRk3TpyAEX0osObcxEF15eL3QEfuoaaI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=qdynujKU; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=iRQiB9sW
Subject: [Buildroot] [PATCH v2 1/1] linux: Install artifacts to staging for
 kmod build
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
From: "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Michaelis, Adam J Collins" <adam.michaelis@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From 45b18a0b5af619fd90194634530cc75f995ea57a Mon Sep 17 00:00:00 2001
From: Adam Michaelis <adam.michaelis@collins.com>
Date: Wed, 16 Oct 2024 09:06:14 -0500
Subject: [PATCH v2 1/1] linux: Install artifacts to staging for kmod build

Installing kernel build artifacts to staging so that the user could use
the exported SDK to build out-of-tree kernel modules.

Signed-off-by: Adam Michaelis <adam.michaelis@collins.com>
---
 linux/Config.in |  8 ++++++++
 linux/linux.mk  | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index e8c0722de0f9..372cd9ddd7aa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -454,6 +454,14 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
          /boot if DTBs have been generated by the kernel build
          process.

+config BR2_LINUX_KERNEL_INSTALL_STAGING
+       bool "Install kmod build files to staging"
+       help
+         Select this option to have the kernel files required for
+         out-of-tree module building installed to staging. This will
+         then enable module building from an exported SDK without
+         the full Linux build and Buildroot.
+
 config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
        bool "Needs host OpenSSL"
        help
diff --git a/linux/linux.mk b/linux/linux.mk
index 469a80db9f55..8d46f2e4b7f2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -585,6 +585,23 @@ define LINUX_RUN_DEPMOD
 endef
 LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD

+ifeq ($(BR2_LINUX_KERNEL_INSTALL_STAGING),y)
+LINUX_INSTALL_STAGING=YES
+endif
+
+define LINUX_INSTALL_STAGING_CMDS
+       # Install artifacts needed for module builds into staging for SDK use
+       if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
+               install -d "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch" && \
+               rsync --exclude "*.o" -a "$(@D)/arch/$(KERNEL_ARCH)" \
+                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch/" && \
+               rsync --exclude "*.o" --exclude "*.a" -a "$(@D)/include" \
+                       "$(@D)/scripts" "$(@D)/certs" "$(@D)/Makefile" \
+                       "$(@D)/Module.symvers" "$(@D)/.config" \
+                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/" ;\
+       fi
+endef
+
 # Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
--
2.29.0


Adam Michaelis
Prin. Eng. LLSW
Mission Systems
Collins Aerospace
Cedar Rapids, IA, USA

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
