Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16345CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFFAA60807;
	Tue, 22 Oct 2024 21:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJMluuGkJKod; Tue, 22 Oct 2024 21:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8758660809
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8758660809;
	Tue, 22 Oct 2024 21:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B06B59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AEA5606F5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgHrXYRCfYgh for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E5636078B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E5636078B
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E5636078B
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:12 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MIBVQW014886;
 Tue, 22 Oct 2024 21:08:09 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42eh42st3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 21:08:09 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.135])
 by xusxph005rp040.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ML88Ns012708
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 21:08:08 GMT
Received: from UUSTOE26.utcmail.com (uustoe26.utcmail.com [10.221.63.40])
 by xusxph005rp010.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49ML881I025039
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 21:08:08 GMT
Received: from uustoe1y.utcmail.com (10.221.63.22) by UUSTOE26.utcmail.com
 (10.221.63.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Oct
 2024 17:08:08 -0400
Received: from UUSTOE20.utcmail.com (10.221.63.20) by uustoe1y.utcmail.com
 (10.221.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Oct
 2024 16:08:07 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.145)
 by UUSTOE20.utcmail.com (10.221.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 22 Oct 2024 17:08:07 -0400
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::20)
 by BN2P110MB1541.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 21:08:14 +0000
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452]) by BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 21:08:14 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Maier, Brandon L
 Collins" <Brandon.Maier@collins.com>
CC: "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org>,
 "Buchmeyer, Neal                            Collins"
 <Neal.Buchmeyer@collins.com>, Julien Olivain <ju.o@free.fr>, Romain Naour
 <romain.naour@smile.fr>
Thread-Topic: [External] Re: [Buildroot] [PATCH v2 1/1] linux: Install
 artifacts to staging for kmod build
Thread-Index: AQHbJL8n0TrdaTmTiUuGOMqERbi9g7KTNuyAgAAIu7A=
Date: Tue, 22 Oct 2024 21:08:14 +0000
Message-ID: <BN2P110MB1160A3840A5AA192F99F24C6974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
References: <BN2P110MB1160FC5A43AA27C6195B68A1974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
 <20241022212420.4e850e1c@windsurf>	<D52LZL79C2WS.1LHI702Z0GTIY@collins.com>
 <20241022222309.06d64ebe@windsurf>
In-Reply-To: <20241022222309.06d64ebe@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1160:EE_|BN2P110MB1541:EE_
x-ms-office365-filtering-correlation-id: cba53bc1-323a-4254-0e3e-08dcf2dda479
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|38070700018|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?G4RrNoVSstKdVZqIHRZ7Xh7vCWjaKl6B+c9pcJj5LZ2U2qKRTTkj4dYlPcXr?=
 =?us-ascii?Q?jS47PSELj6rnzu7jLF7qMgrqYjbEjcNz7mzJOh+uX+GyDHCviDYbstCG8s+B?=
 =?us-ascii?Q?ewCLTujqKlnADKoXjvdSRki32r7XUKPxldiTsAcBIw18taRVpXL8i8dC0bGw?=
 =?us-ascii?Q?C+QOrl0O1gN0ZNg7TUMVBR8oSA4tsMTCQKmfprFCc5DtAgijGx4BKHV6YWTG?=
 =?us-ascii?Q?nptlE7/aXVa03PqXdqonMvEygIZLxzjnGMQme25B9TsQxfyHRyi6I3Pr1Lzo?=
 =?us-ascii?Q?VCTZaQNl2/5o4bG4y+Ztpo2DuzN2uGVjreFaFC07nSSYb7wr/MQjjl6/kIHG?=
 =?us-ascii?Q?Zz+ZFaRG3s0bloY4rUEB/JpUZQq9P+skzRDyURaTo3ATxLK1UL96KuxoU50C?=
 =?us-ascii?Q?06jwtzzLFxbAJSS0PoWF19JnEKmh710GeOIoEeCLmzWpw6LRZAI8v4IWXMZb?=
 =?us-ascii?Q?stWqlhoKGaIlSp0mAd+TX+Uo3EMrb0xfWXBflPDqbXjcJ7tck/fPhqdI8pqr?=
 =?us-ascii?Q?iSbZmYqGlJzOlyGJ9xvxmNnDQJ5xdaAfEAWHXw/xv4FFNVHM6WB0tQQwZkeO?=
 =?us-ascii?Q?aUqqN9ea7le48POcTrtvxEnlI3iXEcjKqtjl0T8XJ7/mrlauqUr4uxtuhtXg?=
 =?us-ascii?Q?XMHqRploet93G+Z5rzabwltt00oVQ28KLefuVA0iHaKcx0mNBCoNfdT+uAkX?=
 =?us-ascii?Q?+T5IsHsGaTPTwQdOGu968IMmoXA7xuR8mhOWlHyNsMhJGuvk4zADeqEffPZj?=
 =?us-ascii?Q?V+DFRrdYdL9mAG1Gv9JAZTLIY5Xb/d4eBDifqA9y9xjWGbHG0z8TF5WDfiqK?=
 =?us-ascii?Q?UwVH31Dx491KvT0LErhcRfH5DeGHW9v0U81W3YE1L1CiueZXdUzjdzsTbbfS?=
 =?us-ascii?Q?6CNp66AwCyykk9e/JBjRyeaz8kaTmOOgVvmlQjHc3FN/QXLr3IgQVq/s1eWl?=
 =?us-ascii?Q?xqm/5NUoJfLdNWNjArsy7arDSdmMo0U3BKOqvvwDRx23HUv5T10RbFfDYm5s?=
 =?us-ascii?Q?yqStMAdFW4Aiz7ACC/lf0rgs5ZZdvTeA7qHIBrRAdpJtM8YI57wU5Bp8usTj?=
 =?us-ascii?Q?bDK9EFRRwbzaQSNULeOUHIyu+KhWmIuOY9HV2dNsdPWBa2s5BjoveklUQwbR?=
 =?us-ascii?Q?KHDe7mHip83MUdxWsvhj9oy8ohX7fGKzLquwEFQMzrsv9Clv3rXzJdzHrMrk?=
 =?us-ascii?Q?oDkaflxEppk1q8RY4FHcawOuX6UlnL1aNjaIWKx3gYeT6/zpvotBOL4z+qJb?=
 =?us-ascii?Q?5LbEHWpzKgk4gueEpoNlAuUmFUmmhbY/nucN2o5c5qfoYOulssVhcA8LI4sF?=
 =?us-ascii?Q?d6PicRy20/gKDvS2cXx7EtyAa5DtGX98TYtLYCgxu7rw34ufxIDewVGjmNzM?=
 =?us-ascii?Q?lMj1e/2Xe+0A3GVrtqyc+tVK1RG2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1/2xcoV8I5htt55A699MBq1Zp+x/5zxq9CBOSv3YVmCDKaCMaJ77yMxoJyG0?=
 =?us-ascii?Q?kv1ZmF+6G2K0A6UvkilChd0zqykb3SFJ4qLkqhJkL5ByW3cB/x1yxr26yRkt?=
 =?us-ascii?Q?ubzguHWblrJ2t08TcZyIb4JauCzFyHgM0PzGY51PM3HxhgGQWMuYzNnNb17P?=
 =?us-ascii?Q?cghsoMyXVCp3Ai5ug/DcY5qpVIkYwazL0dCxu/p6+RouDU5gxZWEAAEkTaDX?=
 =?us-ascii?Q?RQLvxWWnOcrGn0ITQtoiTWOeuYUtmJc8Aso/r9S1xAfzy/iP0jsg+rDO9DK9?=
 =?us-ascii?Q?r3pQOpWZcgXg5DV3nlAfm+i7DFu82QunbO+xk/eCh67JP5Qczey/krVESbN0?=
 =?us-ascii?Q?whtszDrYW9ygK2mYQDV9FIs2cBEeBudZ5CaflH70QepHE3FP/s+aIjLsFoq2?=
 =?us-ascii?Q?Nxhui1T0J4Dm7LQbiuTCmCcwcAJI6CQZXFH8dec7K/XRpko12qeOOBMK1gne?=
 =?us-ascii?Q?k5DssA2uqMa5PaZRPBTscMe7/bvgNVUuFX2j3ANpKkTCCsRn8wQfxzIUUcKN?=
 =?us-ascii?Q?czU5KsentxLGyy8cZnOifD+HrjPVeZHqGEh+zC5D5lEaTA97FRO8TVunM51G?=
 =?us-ascii?Q?pKGQBuN4XfDCO9vmURHVlpkatOI3f2wF/Zk8cin0T/HfpNdtcHqmQ3qzOTg8?=
 =?us-ascii?Q?/SBtcesDSfbyuj+OBpG415sBkV8K5IauouGR0kL9prx0QpvwKiUizvItV4ps?=
 =?us-ascii?Q?ZTzw05K1CQqCVX0WOxKEfSF4cO+fc/C4JzIa7MnZr2WoGTN+nELDzwuxf40d?=
 =?us-ascii?Q?JgqgR3WZ7z23NK9HX9P5ml4qaphA8fPqnyhEDRY+bdGfxupb7pTI78aV29iC?=
 =?us-ascii?Q?0LYCWqSt1yOyIlEBNzAGWgfU3PiKyTTcjWeTH7r4Op1tSjDGIjhPOou7fLv/?=
 =?us-ascii?Q?eQbQO3TAycu1uvFbAF0Qmp7/EWbEuVXS82SK2CMrmxiV6jFsXyE/7LPfV4v/?=
 =?us-ascii?Q?o63Xh6SuklBOW6OJUMrt0p1Ps2QBxAAtt2wDRfEwsnSbWgGsHJqDJSauVAg7?=
 =?us-ascii?Q?1Xlzd/8sEkJr0BYG3zcEQ4XD85v3sgAyyyHWi1gFPzaXvWAJcEU5+ua4yV0h?=
 =?us-ascii?Q?f2Iq9GvrgRz2F+Kaz4250gCcB7oXwv9evt0t71El+yXJByEozMIy/nNtNSqi?=
 =?us-ascii?Q?E0OcoGwB2ZQFyxNBKfkirzlYIED12nZ1yWdb8rwfFetypqWDMcWiysEfWIc2?=
 =?us-ascii?Q?AwbankXhwjRag1qcvpoU5Z/X2izgB00z5upd3ey54FWmtjA0WQtnCLfOApNL?=
 =?us-ascii?Q?+kPOFaUYCH9Q+qvBT3VVugW8L+hNLi9vNJEQQq0jsD6IGoAf09U91IS756HI?=
 =?us-ascii?Q?cncvhv6yYcBHrWoAncdwdlNzWtm4MC11k9MWG+pqFX25joBadekY8ru0K5cb?=
 =?us-ascii?Q?EHkZraXLP42HD5tofzU7XC86gpFeXchlQ8aYRfW9xbgK+PrT0sEObyLfjFQ7?=
 =?us-ascii?Q?arHSBuSPmBH2D4RlcTexVQcPpTrKNV4O5TJsEUHS1pva6MSvwpFZar1q0f2b?=
 =?us-ascii?Q?E6BsF5SH5gu9M2s=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=HDsc4Rxjx8qmzob2aNGSoF0sNjZVQrERDnizIi99a5BBwvF0MmoavAkMMw53m2geoMmNayOdssmuFjc9BhOxwYbnned6qnoDp2CRW+cfo8UQU+em9Vhs37w8ZBSma+Py+2oQMR3Gq+Ph+UlwKFQXnlfltwYIlbLjuJXteG1NgTLIwKp0PM7ODkcM2DqpwNWM5TwaYVOUXNrcMeiMIyHX2I3rPvINZJWOFhpHN7zTWBRkva2CyNZMP/QGFdCpvDwr140lgfgDbna+PxqN4careQHjVZZFPL2xmj/wFyZwPwCCGGpHOoL0XuWtRNUX38wVD676j9YBoQTHGjonRq4acQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkEFj042qssZne2sWtiiQlE4POtVAmi0fEJ1eKlmKNY=;
 b=khWr0dbdDMWa38CyGuIuJe9OM336H2MRKvgN35tjDKxiqBXGJZMweLCXBJq3/RoBuxbYVNwkMNzdGwqSKvjOQRneAHB2yH1dVmJ2Nc2u6wp2Iznl6QAbTcAQmyiwDFZE00eJZaWRB7i4MjER1vb5H7zI6J/9oM+nEk3PW28+Qtb0DN+IzxRo2+EeumnS1bV3H8s5Gq0E6dvJRzYmk2R8iDA1OujDW4OhBgmYr4/IESRR/l/K6AgNip0bTXFaSX7MsscbD2vGx5LXESftRM1IGKbvsUZYPWPcFKSKIt6+/lPC9G0aViT5GjOi5amYuqjWK/hHOCwPnhotjGNYTYZORQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: cba53bc1-323a-4254-0e3e-08dcf2dda479
x-ms-exchange-crosstenant-originalarrivaltime: 22 Oct 2024 21:08:14.0728 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1541
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_23,2024-10-22_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_23,2024-10-22_01,2024-09-30_01
X-MHuser-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220137
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410220137
X-Proofpoint-GUID: Dfw0t_syWdHyCVB5MhX6eqaZJUKjCR6N
X-Proofpoint-ORIG-GUID: Dfw0t_syWdHyCVB5MhX6eqaZJUKjCR6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_23,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=LEnxZqwSP1ZJlq9rF7D39TpiHwXcasv2ajU7TyH28hU=;
 b=ALVaUSVxxoJCGXoyRf4NdEGjioE59fqc9JVwH2EKM93KcbEbA3Tf6fQYYNoIbhSyQoHa
 rantNzmx/c8pKX755v1v7zQt+HzOOEuTGL2unZQcggH9cNZt7MpfEXE6E1gDLRvIERxG
 W2x+PpaDR+PhHoJEzjXr3No2xPuunNbk1uskJClRFtUbznP3paYN8t35hCoJ61amr6ei
 zUFJj1Y/adVFuB+FaZy+szzDOx8zjT1obSHFJ0H2hgYCNWmTb8rgf8fbBdpRaWja4Nw5
 poWcN/tdJATT7RH1ILqCZTcKgKQ9cWL98MTTG7yOmctW0PPUNNT7Mkwf2HvLRWlDkYZD Mg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkEFj042qssZne2sWtiiQlE4POtVAmi0fEJ1eKlmKNY=;
 b=3mgUUIr2XuzBa7/Wc52at9a/U3PNbe3APRmmDqpIweRLY3g7MbFKsG8QOkKZ91sawjJvJrCbaS1vJMhifqaltrBvu9FuES/eZg9PGItZYNnsUJ6ui1RhLxhTVVHzDbuyEGW0m+CPX+tElvuzljqviDt8YGpOSiA7qwyGk+o7WEg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=ALVaUSVx; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=3mgUUIr2
Subject: Re: [Buildroot] [External] Re: [PATCH v2 1/1] linux: Install
 artifacts to staging for kmod build
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

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, October 22, 2024 3:23 PM
> To: Maier, Brandon L Collins <Brandon.Maier@collins.com>
> Cc: Michaelis, Adam J Collins via buildroot <buildroot@buildroot.org>;
> Michaelis, Adam J Collins <adam.michaelis@collins.com>; Buchmeyer, Neal
> Collins <Neal.Buchmeyer@collins.com>; Julien Olivain <ju.o@free.fr>; Romain
> Naour <romain.naour@smile.fr>
> Subject: [External] Re: [Buildroot] [PATCH v2 1/1] linux: Install artifacts to
> staging for kmod build
>
> On Tue, 22 Oct 2024 20:14:54 +0000
> "Brandon Maier" <brandon.maier@collins.com> wrote:
>
> > > I am actually wondering whether this should be an option. We don't
> > > have any similar option for any other package.
> >
> > I think the main advantage to being an option is to keep the size of
> > the SDK down. This installs a large amount of the kernel source code
> > which appears to be hundreds of MBs.
>
> Then probably there is too much stuff getting copied. I think "all"
> what's needed are the configured headers + some bits of the build system.
>

I based the INSTALL_STAGING option on the INSTALL_TARGET option, though it is a different concept.

I grabbed those folders initially based on a StackOverflow answer (https://stackoverflow.com/questions/37581687/is-there-a-minimal-set-of-files-to-keep-from-a-linux-kernel-compile-for-compilin), but am exploring some additional pruning (without going as overboard as Yocto's script). My current method adds 123 MB to staging/ for the kernel build folder...

> > I looked around a bit in the kernel and couldn't find anything.
> >
> > I checked a few distro packages and they all seem to be variants of
> > this. See the following
> >
> > Arch:
> > https://urldefense.com/v3/__https://gitlab.archlinux.org/archlinux/pac
> > kaging/packages/linux/-
> /blob/main/PKGBUILD?ref_type=heads*L133__;Iw!!M
> >
> vWE!AYDJenGCr2mpiuIQtk9XA0ITnz2nHcWDrxsAjOBjAe7A9NM_fXovl1xdYQ
> poDGmbHn
> > Pvdqe7KDsjWat48yMmCdzCibdP0fK2$
> > Fedora:
> > https://urldefense.com/v3/__https://src.fedoraproject.org/rpms/kernel/
> >
> blob/rawhide/f/kernel.spec*_3507__;Iw!!MvWE!AYDJenGCr2mpiuIQtk9XA0I
> Tnz
> >
> 2nHcWDrxsAjOBjAe7A9NM_fXovl1xdYQpoDGmbHnPvdqe7KDsjWat48yMm
> CdzCiQhmYc71
> > $
> > Yocto:
> >
> https://urldefense.com/v3/__https://github.com/openembedded/openemb
> edd
> > ed-core/blob/master/meta/recipes-kernel/linux/kernel-devsrc.bb*L37__;I
> >
> w!!MvWE!AYDJenGCr2mpiuIQtk9XA0ITnz2nHcWDrxsAjOBjAe7A9NM_fXovl1
> xdYQpoDG
> > mbHnPvdqe7KDsjWat48yMmCdzCiX3vqMxD$
>
> Wargh, I just looked at the Yocto one, and it's awful.
>
> What's your use case for wanting to build out of tree modules with the SDK ?
> :-)

The general use case is having our BSP team build most of the system (kernel, rootfs, bootloader) then generate an SDK tar.gz that we can hand-off to application software (already works). But, we now have some frameworks that require a kernel module that varies and would like to enable the application software teams to build that using the SDK without having to do a full BSP Buildroot build.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training
> https://urldefense.com/v3/__https://bootlin.com__;!!MvWE!AYDJenGCr2mp
> iuIQtk9XA0ITnz2nHcWDrxsAjOBjAe7A9NM_fXovl1xdYQpoDGmbHnPvdqe7K
> DsjWat48yMmCdzCiYZVErDC$
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
