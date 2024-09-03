Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FADECA101E
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 05:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E2F80EC2;
	Tue,  3 Sep 2024 05:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdZhR28AKQIx; Tue,  3 Sep 2024 05:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87FF80EC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87FF80EC3;
	Tue,  3 Sep 2024 05:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA0E1BF399
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 05:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F68401EB
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 05:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ot-WX5B1opE for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 05:37:40 +0000 (UTC)
X-Greylist: delayed 437 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Sep 2024 05:37:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEE5640185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEE5640185
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEE5640185
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 05:37:37 +0000 (UTC)
X-CSE-ConnectionGUID: EvCCu+iQRK2L8dDYQYqPlw==
X-CSE-MsgGUID: R7BOHRI2QDKw2WhRHzPuMA==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 03 Sep 2024 07:30:16 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 581DBB5A87
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 07:30:16 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 74216B5A86
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 07:30:04 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 3 Sep
 2024 07:30:04 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.108)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Tue, 3 Sep 2024 07:30:04 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEV+9JTskNr1E4MoscKCRMYHdPSb93tbqxg3HtGfhTkRMis8x0tBpc0ZExug224JA18cq5H6m24y4yLLZiYXYv/P7Po/z6ghnn7VxEXL14sU5UP786pnt7NLZCNQtRlzUZk7FdhwigurzPV0OoL94xB31QlnjkcQ0R/KipvEnlWEF3eJOXi52nvzP8OKF23JZ27iI3CkcBst9wAgFlKam2Rd2lu4M3lMvzGEkve1Ch+PmTUnowxwRp9mUg+be7JgCGj58kiXMku0lGI9uIa9GLBBhnUg//wtQDYyiHNVr2jAvKRcTtvdPw72hcVw5mATRubJeju6zfrRBueZn35Fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV1vMjrHGETA2Mw4xgZRSJ+dG+5X5W3MwZbHnVepOAk=;
 b=vZTtDhhojcV5L7Un8ES5cbkY0xpUX6SY4xY0yEboUW+fEmkqxXDjplFsSLWaeZQLMY6Roo+locfUbFKHqY4CVNcEp8dtQH2czufBKhTZtulWvxz0V+vwN5TWP0CW28InBBP7eJbpgotIL5XgGY1fm2katvSd5MdL5huBwPDHjmk5BumfbbkZ4ILuY6qVOq8P9RGf7B1sQN0VBcCEjfgJ6F2wuaEajRSdRaGwHay4A9A1TbsUJdnd/L2fjuwBkmVc+TpcwJlSwSepIUCNeJh+FEJ/lkcCFpVw5dX+RUZk6wuOCCrE3hj+zSOBjGif04j64fT3PA7LLeoJcfoyrgu/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0336.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:27d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 05:30:01 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 05:30:01 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/network-manager-openvpn: bump to version
 1.12.0
Thread-Index: Adr9wL+F8Nq6IIqBSvijT3AC2DM3yA==
Date: Tue, 3 Sep 2024 05:30:01 +0000
Message-ID: <AS1P250MB0608E95391462F88D8DC7F02A9932@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0336:EE_
x-ms-office365-filtering-correlation-id: ea8da4a3-ab38-4ff4-f344-08dccbd974ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ng3yjruSTYQMeZS7NCYZ4rlKopztS8togZKI2Jl1OwFQbX//Ksw7DacXDq1O?=
 =?us-ascii?Q?SW75yLY7ZchZjLruymVAHf7ZtT5be/57NJsjN8BBeEmmojkyIS085LjLNBPM?=
 =?us-ascii?Q?qb0GqbwZImauLZnSDt7XIPQCIlYgZUhBhTi6CIzQOIvqHmyLpRRQ/hdb8rf6?=
 =?us-ascii?Q?Cwdau8I5AElna5bCHOZLvHTKCsDCdd1oeDEuu98UVo/C3+Q6QrCLe3FVtusW?=
 =?us-ascii?Q?r5ki/pKm+NJyJ4Z6nC2QPLIKGU38do42w+MRWI2tvgZg0HMXAUpBylsQ1KbI?=
 =?us-ascii?Q?8X/JY56gJgvAWmZzgboeFYkDcFtVnE/VSmYcgtOGMCW3KdbPwBlwRtPKdbEn?=
 =?us-ascii?Q?x0gpqoOmDCs95IfDCMtcJhQEP/9k+Fnjq3L0DoTEezvEAyFdFml3CJy6YUE1?=
 =?us-ascii?Q?7LwpzfgR0vVeyqG0d8CGkWEthdlci+T5h1pyeg+YPn3ethgIdxnO3u7otqKK?=
 =?us-ascii?Q?EUdjhmk4sEMHT7fWNAttRHnyINEcoWdLpFiAkSABaiBkcmjHZMMHCtML6DRN?=
 =?us-ascii?Q?wO0ieDYca+gjBoVVPoeOBZVlCO3caOnYDxrepQWuaHP5OmgB/GeYhE4eYwUq?=
 =?us-ascii?Q?iSrgtuWRYVz4kSR5ibQ9FVlyfjcQELXblPQX7K1z7MyDAe1A1t6QdQLAqwc6?=
 =?us-ascii?Q?cJ7UizwG2X5bniG/Z7kRks3nfjDxBb/fMHQx/5g5DwAde7uYuOk3pL/EVUJJ?=
 =?us-ascii?Q?vJ6/btewWXyB7sqa0FJ9nv/l+x61k7jpSBDtPJl3K+nn976L/sOaAyNSIyvh?=
 =?us-ascii?Q?LTiIDmfBGCNvuOV8Q6fU+O3TagBYeBKqydzrNZSKWBnKM4cGMsZC3BS+Fdc6?=
 =?us-ascii?Q?mK5abuOAAlmG78PNsvTi76iE7wx+Sr9LuMh85XrmX6n+MYT5rQlzQrtTkftT?=
 =?us-ascii?Q?y1vG73bm+2aOvgPbAoZNqA0YmO0ujc4quovULiX0uJyePC9DcfKwW6bcczrp?=
 =?us-ascii?Q?70IHgtlmfGMlAcjk2T3QNwmWhcbYBRf28Umo+8NYIPaJHYKjfZok3wbPKUo6?=
 =?us-ascii?Q?iA6uICkUw3mDeT/XX6dAlluvryK0QG1DOPJrDFbrvH6sHX12ACQTCLtei5k7?=
 =?us-ascii?Q?6ykOM9M1zbRjyF8hiC8/gwZMD/Ba79W+uXdj7/MlCiW5KH9Jltw1ifIxionE?=
 =?us-ascii?Q?kDLx86YQE1Ceo0s3ld6FAeS7AR6D10D589yVr1yYPCGVbNrI4wa3Q60+1imw?=
 =?us-ascii?Q?QNh8UJzDUUtWjolJtMSaQCKLp4ejhR4ly3MzrcMYuiVRQ8MSw9Z8awc7cU4q?=
 =?us-ascii?Q?EsrY24nK3tioTf+fYwMUdqHWw0JRJMOrZgCEEaUcPLCh1P07RhrFIY+qj/g5?=
 =?us-ascii?Q?SkIDasXi8qsnRnRT8B5ivZb9yhXYI083Jfv/cxLojPbPZIxcJ10yEHDEkytE?=
 =?us-ascii?Q?Gppm9gQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kq8WVUTpxPBUIySYnbHwi8jf+xPBTM8bKRaG1ioFH5G38ZhTaWUXWShgffO8?=
 =?us-ascii?Q?Vtckc3+yENWrme/qe9N0V78fVXl2tmNKR9o3wgvlfbUxrQ5daTqPChH3Dgj1?=
 =?us-ascii?Q?6kctZiSvyVGFzwHicIkpM3dVDulWtKfurFz5shWtBjow9wpKwpD4tYY7hfpQ?=
 =?us-ascii?Q?UbOTNZXNLQc6XFDqvTbQuj4lFoX0oEWhmGEPDhe1aZEpyREChITfcba6MJ32?=
 =?us-ascii?Q?eboRgm3ZjltoCHebnhCcLGlwUaMCTXPf/ExfjvhnKSj1940zXfi4W2bAopgh?=
 =?us-ascii?Q?dm1otGdewMF4ETSS2urOIxX/bBQJxX7Udm/Z3wU/1q4X+TWv+D4Xo69JYMDs?=
 =?us-ascii?Q?hTUwivARHagXAPMUYC6e6cHMSwceH81ikQsaYZ4eBf0IK4gRq6ONrGTCvGvr?=
 =?us-ascii?Q?GKDm2PkFkA+ohWyqIjLNRBXjR/OQgOZj3DUPAVlH7Dga87rh01axCgawoi99?=
 =?us-ascii?Q?eP0WGBc9mDolz3xZsnBoGgMktEdhUR71QDnIATVAsA7YZPfsn7YQneCXFDZw?=
 =?us-ascii?Q?YIiebRQcx1QYUze/Xd9CE3S4K+6swSH2ogJizhSWdoulff+GPbnAD8gQN329?=
 =?us-ascii?Q?nPPpcLwUW/tq9OrcYIq/Pguv42Q53sqbHdB6m+nAkSXwyJFQTHBp/LhmN/kp?=
 =?us-ascii?Q?wCXGeFqIaXc8i3Rky3ulvDrs8QB4rTexOzJqbAEwuBW1ADSecdw15lfsVwyp?=
 =?us-ascii?Q?Z1Pgc1fREJvJdwwa47JyR+IXGEuWqx2UZnzN55Mh1TtjtOJxvgf4/3rvp2ZP?=
 =?us-ascii?Q?ijhkPSoDHDT+DfeSCYOeqPkVAiW1qQb0l07bmhqf4lEdc5mR/YZ1n/njS9Da?=
 =?us-ascii?Q?tpD5qnKsq7/8MgzXCuppRA5nVVHGUrUhT8WwE0ELfSn5aNELEIZJY8UYrqBm?=
 =?us-ascii?Q?mggj59sTIkcMSa/DeBvMTL2Oj4fFMTWeuk8sXJ+K0fLoEIJgKoIpbbotNpxC?=
 =?us-ascii?Q?IvEBelDFCslQXVjCGvByn2PvZ3dnLgEdExfrIRN6DCiy6NVYDmQvjmcexWFn?=
 =?us-ascii?Q?cJ2Osf0q7VV+DMSW/XZt9pOozfUDea9y43JatOgmlTcX3fXZq4ipMG7fboB0?=
 =?us-ascii?Q?Tx/9LFcouywO6tJs5sEOPVpp3j1/xXt5GFbLFPDYpShXiqWSBdpncyYlDKPr?=
 =?us-ascii?Q?GF2fkjjgxrX1B0hN+ZElX/OQ+qYxFBPPdZKg3+BsDeS10+WEq1Vaq6VmniZa?=
 =?us-ascii?Q?Of1dhaLp0tJghHmR1U73029Pd3bJuU8UT31hXl9hwcn+sYtWoDFk2gyHuM35?=
 =?us-ascii?Q?HsNZ1eA7ZXHVy9Bhq4U0+8mfWIgFyu8n8hjDRF/YcKtmlVwp9/DXQuO3fNi3?=
 =?us-ascii?Q?3dHNk34YSy7njw94D4emlHjKnlirgNDywEf/e6fjmxQnZVudxBRZvMO1JNCC?=
 =?us-ascii?Q?MGdKZ/i3tCPtKJtWlPaVoLfz2AZ4UUoM8ab1BXPrfyIGkDG0Lkgd3Xi8yEZ+?=
 =?us-ascii?Q?xm6GQm76DmSwYsjb2h5eZRuxAUZkgMfj4qmdjaQVgItKRiGc3cr9hB3R7m6o?=
 =?us-ascii?Q?NZ8ZACs+iRKqmgaTvZXq9V7RZJJ+/3t+5NktOqkJY/EEtjp+xdHpSGx2sO6j?=
 =?us-ascii?Q?NuXwsqlrxE9Tnucv3BI74jUshailI8qVZsspAKDSJ7QgN3GPzhdoNfe38s0h?=
 =?us-ascii?Q?8Q=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: clQCBZVrajnbEKPH3AwrSMXhHkzvPqMrUnQBLRkUo1h37jhSuldCjxHoqR/447gM2GIOf5qP2yNx+qkJp0X0/3SQ3k+Ou2p+Q/Ix2KJEACfcSCxJTGig/nJEEUhO+ZGK81w10fT8997GocxI2nEG0jPXX1xrqdqThJyxV5Qxw98j1lZ5+FyUAONg4upy7x03ekmGRJtqzduvmMQZw2QXE37F8vw1Ijj2qfhsKOVLB43RQmJSisYjrcyxlT2qduNdUjyg0QBX6UIFvPgcHyUlt5TJUY7d+f9y0Pbwq0BpnkLnji84Bh3pNNxom4KSBezXPc57xI2uIvAQgc+y5IrIUm8K4Y7NGsp8SF1v2L341mhUqJIxllkC8pUJWTInwJbjp8dP6Q+6+zTOx87jhxfHglVU30EdNNhSbJfZfl3cnx8k8okDnAFzKbjoK5i6U3PbaNXSm5yYfBKEnp72tcARFfzFQdcis8p5m+qdxA1CmnZ95bbu6SQ4jspUdnpDdUEIn+J+buZenqpFnFmJRM/wZpAE78otmouBKzm/3oO2J/4q9eyOvBrWIx1eFQ6T64d/eozEOkOUZ+N6czoPffZr8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8da4a3-ab38-4ff4-f344-08dccbd974ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 05:30:01.0744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: by3SnE6xsYi7RO1ticbbzabpbdy32EIhIV44h3ho1cNlWcAUYXWe8xgur8B6QCj8/5NMF+He2Fa7v2cAcBdBhHohALaBm94AH4KaDHgpXX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0336
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV1vMjrHGETA2Mw4xgZRSJ+dG+5X5W3MwZbHnVepOAk=;
 b=X2yoA2Tb8U2Ava5bwfr0q04QHbsFmJbo11RCdW+rt2+IvAOOLlYGAJaZWVuV9anyVxi5qgqngUNqq4rIA7LL3rDpr0f118Hqph3nrVV4kMwaZ6xpqmNp84I5HPWzFcS6YcFT4jDqKyX1u9cg7OIPsVNWJwC0jrh790jHzwyAEwE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=X2yoA2Tb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: bump to
 version 1.12.0
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://download.gnome.org/sources/NetworkManager-openvpn/1.12/NetworkManager-openvpn-1.12.0.news

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/network-manager-openvpn/network-manager-openvpn.hash | 2 +-
 package/network-manager-openvpn/network-manager-openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
index 59d03fae2a..902dc599b9 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.hash
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -1,4 +1,4 @@
 # From https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.sha256sum
-sha256  2128de06f91b33c13d63cdaa6e178bc1ca57fc770cde3bc7c24891f4d9824501  NetworkManager-openvpn-1.11.0.tar.xz
+sha256  903fd4c0aebd2aa7ac70c9d8c2bed8df922655d22d764514403566ae89b7e886  NetworkManager-openvpn-1.12.0.tar.xz
 # Locally computed
 sha256  c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index f39edf3209..b8a4325493 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.11
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.12
 NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).0
 NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
