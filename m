Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48713D1CDA9
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 06:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00422403F8;
	Tue, 22 Oct 2024 06:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKhEfU6G1V3P; Tue, 22 Oct 2024 06:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5C44043A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5C44043A;
	Tue, 22 Oct 2024 06:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 390FB963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3405140277
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7le4gaojOeF for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 06:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53E8240270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E8240270
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53E8240270
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:47:00 +0000 (UTC)
X-CSE-ConnectionGUID: Uv0VLhmKQ/uk4cMA+tMEnQ==
X-CSE-MsgGUID: 566YQFzoS8iDe2SSUkhhbg==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 22 Oct 2024 08:39:40 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id DEB5BB5A87
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 08:39:39 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id D1179B5A86
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 08:39:39 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 08:39:39 +0200
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.107)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Tue, 22 Oct 2024 08:39:39 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rumwUIfgvqz9PIzz+snJSty2tkRRTu6llJMiHEIJe2P1tFa91wRMz02f3piCMxqs9IuKTiklsoqc3M/Rh0VMrSBnPaH9P5zlmJmXD283Ws1IOnbrBQRBUSdgcrVa+wKqWughnQAlL4bYOhroogIqh21F5kK5OkFImnPCbEt2RMvYiBSM211L4zj2Z41DpPQXRpkeg3iaC6w2pVxU83WHhoU/Xa7TrhS24+B+11uFFQwLNGkSthbaKsFlPHP3GfHOlZgCjrZUSmfMuU5J99RgJYByx7K0G/JWv55QKXvOCT8dU3fItu8wlvXFBJRF7rfgfhTs1e9IDqKoNtXFDZQ9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0IrOmq9DI4XZ3etVKO5TW7dkVrhKbW1JBqfefzz1Hc=;
 b=e1sOdZAcDh+91bDPEfDjZt5EIzMEifeUXNR8dG7uYQcI64VKmeGqi0cwRUg1nl3j2w7ZnQMnMTKf0f7BElaQQ39dpPkGBabIMHUto3SZ3cfopK5+CG03hRwqotAqfemNuYyVqdCeYLXFjKovvkROGU/EcAmINFW6mz02WU40Rjy65n25UJtzpPj3folCo7g5uda/99qLANIdYG7Kp13B4I7NfalMXpy1EsUaz0uc5KPxOetWJXTvEggQki9V+KSk5G7VeB1KDxcZyWxbKCNNewanXDjVSV9Cwn3TsYkefmPmgv1tXa9hM1c+eWty5Y+03/Cka6TJN2zghiv2MgVdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AM8P250MB0279.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:39:38 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 06:39:38 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 2/2] package/libzenoh-c: bump to version 1.0.0
Thread-Index: AdskTQIYMweoq6yRTLyCvYxOMVYOKQ==
Date: Tue, 22 Oct 2024 06:39:37 +0000
Message-ID: <AS1P250MB0608702BD7D0D3CBA3819A74A94C2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AM8P250MB0279:EE_
x-ms-office365-filtering-correlation-id: 40ce1f8c-5836-41a2-7475-08dcf2644d05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oNL/XWoAyw32fF2ncgDr4ROp0WjvQQOvYhF9q8xoVfaQOcYXYVnzP6+4ouBK?=
 =?us-ascii?Q?MEHjaUGJicYFHF6TyeWnb1YW7HKb3EKeZ1dofT8nQ/n61GH7AXpWy64j3HvN?=
 =?us-ascii?Q?0Pv2yXd9WYhjfXVflzjcR4fjC/jv+iGWs+rzQ3YcnJPMKa57R6OrHg0vqD9R?=
 =?us-ascii?Q?Q2DRx9Go2KkQalmbC0eCJIZj/6Aem7l9IejOBZG3Qobc3Teos9V47dZISGax?=
 =?us-ascii?Q?fuRP9U5XVFguGAuLR8RE1jAkqD7mFa/Y9y/HwkQ/HzHKH4CArT0q4XpsAbPm?=
 =?us-ascii?Q?20FOzHL9heaUaYSuY/BDS4HIdKMbZfyjULLuhE299zC3bdYgIdClHxZLxJCa?=
 =?us-ascii?Q?Dzl0BmdfUHi8eNCcMUG3yGy3YMgsevSezSgNPQf8MZiRQir1EoPHUiDb+iad?=
 =?us-ascii?Q?DLu2iVUXEZhpiyugnxHipbXMxae8vb0DHIP3c3aNEoOY/N9p+O/7sUGjfny4?=
 =?us-ascii?Q?2pUE8C2agBvAtC2mKjoLVCrL3w+SJuFiI/euyz5KR7ZyNcekpYyfM6xdDJbU?=
 =?us-ascii?Q?dBgf8SxhFJikRPBP49E5oDpM2f1LT5sXygSSiCSCr+UZww2tAUZ0E/dj9KW6?=
 =?us-ascii?Q?km52O4Tea9yRRpS/NuGI+siwaeiuOZCoPQWdY4uYz0ASZ6+lN0Di5sl6etQW?=
 =?us-ascii?Q?o69bclw2U+7JDQoFjSJeC3CQCTPWavrfJdp2yOj+qLwFKWcMgoz+1U3TWgyG?=
 =?us-ascii?Q?7+u1KUwMC6M7TBUoOaSzzLxoqtvrk3zJm1UlxL256biRek4u+U92Qx1HXFVr?=
 =?us-ascii?Q?IKcsvfZ+Akd7zrFxFZIk/2an6NrbgYPTgzqwkzpwokWuB2kvIM9K4rwoF+cz?=
 =?us-ascii?Q?wl0ir2VFxIsMnb6uO1L+V1mhrXdkST6zB14Y6TB4Kp/dYcvxVynyqmVO8RNZ?=
 =?us-ascii?Q?uGgON/tn2sss7pbju0U9uWJ/LIkOWN1LrR7wfJbpumCtFNvfnK9bsMrapA1y?=
 =?us-ascii?Q?hyClDQYO6zro9dbX9ztR8aZZdWBJdwK/Sw0SOQ1cEpzThq93N7F9oCWoDkmv?=
 =?us-ascii?Q?xVriyZIDRpul5R1gEMovdn2Tmledrn0JIKI7YC4U+KbDQ5CB9Mn8noQt/Gry?=
 =?us-ascii?Q?TwzWdSCanJglRtDEd4QXUqvzfsZYgI3SBzkipkVgSCLgYZxZ7UP3ckGOkH0c?=
 =?us-ascii?Q?AVvyVFf2rOowWa8id4y0HiQITcivvTQikJHCUZEX7pQg89N35uBk5hpdUJGo?=
 =?us-ascii?Q?xuqLM0S87ch3D5EyWuS1Qun6HomBzHhoyEZYfVD9JMKQcO5fGpJczclAcr4D?=
 =?us-ascii?Q?7sQmIUqyhUJSsNQeXksMKUN9IGmbM/J8kD799M8Ya7VPo3n0F4j86hnjFnW0?=
 =?us-ascii?Q?/+I3YNCUHu9J1rmHGLes4iR2PE/zA9reFKSbhvGJUovfp0wBGjiXN6HEBUER?=
 =?us-ascii?Q?ob+PRry/LXb7VWLH3Z6/OlLq43TJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v0H2G7mZ5XResLzhzpw2RgDiCnzgc4y9mopIs/4cH7w3cHzw18cnMhcrXYec?=
 =?us-ascii?Q?B9eIymWLQPoiAbwvqxdYLmdOAUMSlsTXUFzyASXR3SGhxgxKISXDeS+Bu8Ab?=
 =?us-ascii?Q?EzGBWtocSyZYTBOTSrNckEFZG4bWfyNyZ/L478tiYLrt+BUQUpmk4dc5DRXe?=
 =?us-ascii?Q?Y8VSDhvLEB61tdTqkJbTIWLsS3QWnA2/SPYM+9D+FYn9mnk441y3liuIiuum?=
 =?us-ascii?Q?JNTix7+qkmoK9bNoTitzQbSS+YYC+Ol/St2C/ne0zYXkK4u7CG4lCH+P0RMJ?=
 =?us-ascii?Q?+unQ1imK1DJ9NX2h0HFwNye1Xe8PNuD4eQfhA6wxakodtDWsrdrfJqgoY57W?=
 =?us-ascii?Q?J0yush4DZn0fHtbTdXxwhAoQl6FuUl3lfNqCe0ZjIgpF9YVS1Ndxb4fchc6Q?=
 =?us-ascii?Q?gEIb5QpzyWhwN6xX6NFKughZgz7EnVOq0Um1dGfYy3UQHCQV3V3PJuu2uiKc?=
 =?us-ascii?Q?t+AjA/yArMA/z7lQO5wbLaKvmQcI9m9rLVp7n08MwcqtXTCkpe5GHpNB3PGf?=
 =?us-ascii?Q?aCxLlO8MKSBq4mtDJjoe1dPiRKCsNNmbCbdQk9WoEHlXXwAjrUZtakOoA3Jc?=
 =?us-ascii?Q?y5N2fvQrTvRo/rtmtS5pB4yEfomc0rGHs9PBVDQtnXH4ygtrKYrEYxggp1WS?=
 =?us-ascii?Q?DtnspyVpaQLZdbeBhosSocAPhNcTOd7Ebs4ppBrti16hFJHltMYnEMmlSPgx?=
 =?us-ascii?Q?fvJw4w7UPsN6ew7lpulJ/mCUZXOjtCgG1QlTgTXV9RLfrHo18JUG4ZKmlIUC?=
 =?us-ascii?Q?GXVC4WAIvTfWsMg7vAOYDfgfnLN/22PQy/XyNbawSmwwJBewhOCKQi3kR8tv?=
 =?us-ascii?Q?V9dYUgPkFkz1w03MtLT1mranTcLvJubTnRWH+NwtajwF/StyrGt3UV1nJpxG?=
 =?us-ascii?Q?9PaMCY3eWpku2PXOH6iZRcgPrB5nCIRZG4/wruKU7EtIg3fu2KCWWYyBz9j+?=
 =?us-ascii?Q?Ks69oyU3wQ5qbaHnoU9KtOcP8TWtMTD7ORfn77G8KpKp9KsQWN0FNnlsTFdp?=
 =?us-ascii?Q?ajM5DP/2nnNBf++NJEoo6Whg0h1d80RtegsMPhEufuu48JOwbEfuX1ztnddP?=
 =?us-ascii?Q?G1h+tZVqUDcrIdjC7r8431WHHZziAcvX2Iht86s7CCwkZLsnyMntdjdnmto3?=
 =?us-ascii?Q?7Fp7KehuoH21QfakEfUmEo0A9xatDm16MaFW0dWA8BKRy2WBXQg2iznps5X7?=
 =?us-ascii?Q?WT8RUBh+vXVhbFc8QYXW+w1aAk4VcR9xNWvedhb3M7tPBJFzOOwsd6fVJyqr?=
 =?us-ascii?Q?cSdJY/0iQt7VaoNNw1LH2STw4cOHXsYulTP/UaG6hHoD74j1bP4G6vwiyUqS?=
 =?us-ascii?Q?j4HVnS9gENuYEKPPW3XKbkW999kJsiAzuzB1NO4ksU2UZ6LXAyU/4Zpy/ObI?=
 =?us-ascii?Q?AIZEbrGwnBgksO5HRZ1Ne9FqUSJ2Yl7GtNCaglLJ5XU8g8EmNEaOHMDzyBGi?=
 =?us-ascii?Q?NJCVFmJFRfubIPh717gMpJqSx6t5okrnPPsYDA2+pdfgioIPCa6NEASHfb0o?=
 =?us-ascii?Q?XGgZllkqbmL+5G8FyHjitNw10wyXvKZsB+Nk5WlBQIQ2IJiU3r+dsj4IHuSK?=
 =?us-ascii?Q?BobbBYRsLrNCM9mz8vy4hVzY+A+KROELqxmGI9uDVKZUZUW28+i3u6SLzIvK?=
 =?us-ascii?Q?cw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ngu8Q42o8Alq9FbIw4sDyTKs2BEUF3Jt+cCppnEOWQRfqm1y8u8HPTmMKNCdoLlVOaZK4PeyFt+L8zu4vUL1SpWFcgAOlyrhotrEXuyzsRBdrf8gNTy/j1nmA5ohMghK6opZ13E7BGqNMEMS7Ov3J/83ckJF+EFNo/3r39CRkdztXoiwOGYUkklhtyV9Ewv0sm5J6+CPAUu7yVDnCoGn/WhKHSPBmjVD2GXq1hJ8XRvsoFcwE8gtJ3jvYVmW86mrY2wTiH171x/LKZMQHRXJBDUnVP7Ed9JsvyzeMxMqephACdvY8MA2aOPfFv5Ev4nYsV4AHUIYmXujxG4/V+SMbZ7FMSijV2yZPWj5SNzyh6b8XaOEcQG2+y5VPqscGfjI1XN3v/C4dSgBTb5BPa1VojBoKAmkKJ44pMYfwFnrFxFBchIo9hZwkfgOzBsR2uFYEj+9A5vOiOo7RG38QXTcQYPTXfyZqDRpRSLxcSI1jCGyo7WICxkd5mCOUXzTT8rVowd56lrWyZnyjLHHq69n8PpQpKlAGS6rekID0nPUewlpOAFRdncTmdVHxF2dx0L7tAkUPLpNestXB2Pmukb7Dw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ce1f8c-5836-41a2-7475-08dcf2644d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 06:39:38.2064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GE1Oc7zS2d2lv++jG57xB+Fd9VY2nhkZbHVAIu9BiHOOu/6buwkHXdJA6JDUvnb/AKIuPVoIjhzEhS1k1mfBK8sI5ebzt/TOaawBxNgz2/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P250MB0279
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0IrOmq9DI4XZ3etVKO5TW7dkVrhKbW1JBqfefzz1Hc=;
 b=na/7RT8AXA2XXbS7fVqd79JJX3YFf3U2wO/KSlhXypR3Z0jbwsWySTQF8QYscK0ZhBPYao/gefRqKiq/BNg4h8IaVauFEUAgeWi6cOjOALCK4iYOb+hl7FOZb+PWCvxClHZVBLBN3Dd/5maQv6ptiZCNi1O1Atwcd3L4w8z30eQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=na/7RT8A
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-c: bump to version 1.0.0
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

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.0
Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 66bb5282f4..3472494355 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf8ca9382a17564ceedadf8fe574cd7c73440cd298d2adfbe88fa452427f8526  libzenoh-c-0.11.0-cargo2.tar.gz
+sha256  80e3144ebd82bdbfb43ff10e7f22047826adbbe0d0ed0081b215924a6c1bdb6c  libzenoh-c-1.0.0-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index f07206f4f7..c474d98b07 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This 0.11.0 version is really newer than 0.11.0.3, so please don't
-# update 0.11.0.3 even if release-monitoring.org claims it's a newer
+# This 1.0.0 version is really newer than 1.0.0.12, so please don't
+# update 1.0.0 even if release-monitoring.org claims it's a newer
 # version.
-LIBZENOH_C_VERSION = 0.11.0
+LIBZENOH_C_VERSION = 1.0.0
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
