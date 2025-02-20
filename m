Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3EDC021AD
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 07:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B5740E14;
	Thu, 20 Feb 2025 07:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQrDhXGtWkhc; Thu, 20 Feb 2025 07:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41EC40E16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41EC40E16;
	Thu, 20 Feb 2025 07:28:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFA6ACF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C19BF413A6
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuhATQvyXO_v for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 07:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6ED06402D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED06402D0
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ED06402D0
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:28:33 +0000 (UTC)
X-CSE-ConnectionGUID: rljTzd1fSGS85Pvb6GtVmw==
X-CSE-MsgGUID: d6NRQKR/TBOfjvyPy9TrZA==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 20 Feb 2025 08:28:30 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id E033CB5A87
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:28:29 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 0CDE7B5A86
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:28:27 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 08:28:26 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (104.47.11.113)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Feb 2025 08:28:26 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsqInV8rmwtv5OEBDB8c90VkZ0EYbPMsyHjhWI2KzaUf8mnYZj0Uk2HnaWAphqaP689gKZq3PEcyknDSCX1PU5fPAlO7Z48I8PS7fXTuxD0q8whC/QUQKyKBlwx0ytRdH7Wy8ccDIYcovm4HFQV41HD7seCuQpIknsZyKtZfA9kROaXwT30ZiQQefGLWtZ/p4RA5Azp3cbn4W0zhSfN1bIvJnNpr8XqduHpRqs5GOpImPrsO+Xl7TMyXhiJtCLOGD0ApBpSl3yh4qWA8lk173ABZPUDWHETxq0qyyqdkbyMuSzXikm9DlyxKx8Aza1zaXolIZWuwA6Ga+5nKROwP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZgUSMo8LFofz7HN/ACxx56COz4UfzK62f22cc9EVRI=;
 b=tugTNIlvYGSo/oHySjFT8d2tJo4D7vlRszYjDcUAZPk/CaPMV1afemjuv7aAiKZD87MooXG1VSSdlsXfzg5gt2RiiE+/+OgPnELipuvrxQbwvvU7hJ3GdUM9nmObOSY/g9O5rBXmVbnMpcNnKkDP9EJT+8yVoPLlwKJFJytFY2cPCMFI/Zp733xINSGXeZ/INCBsnUflAbl9PUTQS1SQXpEb6Yx214aG9Kw9poEgR3L7gJZ/qU6+itlTxMuLexqKbrVE7sboPflBRShql9Ma8BwncI6kmbvs+KrcMezMgacMNeMDfLgxSdnJcQxmUs9Avttx/lKc91+qaQapoT1tbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DB9P250MB0595.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:334::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Thu, 20 Feb
 2025 07:28:25 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%6]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 07:28:25 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/2] package/libzenoh-pico: bump to version 1.2.1
Thread-Index: AduDaNYNF+K0Pu+5T1CWIFeaewkM7Q==
Date: Thu, 20 Feb 2025 07:28:25 +0000
Message-ID: <AS1P250MB0608ECF736D7C41395E8474BA9C42@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DB9P250MB0595:EE_
x-ms-office365-filtering-correlation-id: 6fa7d956-69f6-498f-f7ea-08dd518029bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ezVDbfaJNMn6lsqzhYhzM1ApcMK/EcphVJKMI0NFXQ/ci+n0Br3hDcn3r8JN?=
 =?us-ascii?Q?sfngWf1W7551szAK87E4VmE3qkL3jU+OcIFo8gQW7alx/Bg6zYN2ODxHBy2J?=
 =?us-ascii?Q?eGpbkbFaN7u6IWJ5EcGJNk7C4TEOhUzNZIlFQRX+SvFu4nYFFo0gG/LO4/J7?=
 =?us-ascii?Q?WRmBL8alEnZXuwsYWEDXftHvZ+1VjG8hjQTXcT3BLQNhTqvwnLpInKABYXJi?=
 =?us-ascii?Q?Vvf6wWwN/5EtO33bLkMaeYIJ7qZ9u9snuChCaq7iyHaZeEuTIVUiayNIoGen?=
 =?us-ascii?Q?9YEOQEKoMjTq9kRlkvKfAsvKBX1eNvLomQImFvka5ClPBGfDHTTq2AoOuJ65?=
 =?us-ascii?Q?DUiMYAX+0GpukQgAyTuxt+wQhmDA4Plx4A+VwudRwBsJkdYK2Ly6HJfvKAHX?=
 =?us-ascii?Q?vw//xUkBj7aoJWh3CiQEVm28d9zCSugdmyQ4L/fUmr/xBFXspNyFPQsopw6/?=
 =?us-ascii?Q?mdJ18i0aTIs/+Gr2uVDgdDs8DU9Oqe2UqtleIUwatah8bFvP+/RFmBMM3RxV?=
 =?us-ascii?Q?x6M5O4+LA7+4OBGNgtKsGAKX3wgYkq4sHkuauR76y8pkhgIhgcVsuueS8oyN?=
 =?us-ascii?Q?7s3OQ9M4zmmoQZHsc/OrkEwwu8uLeYEUi2NqrV6PKpBZEbUNvhoX80nzi7uZ?=
 =?us-ascii?Q?a9Q4jG9tApeRpwzxv3vzxqIJ1D67o/EmZAbWTDVWp0MBSuFYG2BP8qf739e+?=
 =?us-ascii?Q?tK9RljCJL4GIdMV/ZVJUseT/ak6pF/EQEJXypDrYCdOC7TleyetxsPP8WHOJ?=
 =?us-ascii?Q?DWXjrTeFLv5CLuoOTSFcNFh0xaUamT9ua7UXKM9BHfRSXWry/MJjm3riXnU3?=
 =?us-ascii?Q?X5NgBfkXVYk43HsM7DKi75R+fhAfW60BaNOGOeLUm0xRZ6Gyzw+t/7izh/IR?=
 =?us-ascii?Q?fd3BSIBIq/GAHd28oiCcq+kKBKtfyVFSmo2ERQ0v0bGXlHwmy5uf79ie4vIf?=
 =?us-ascii?Q?YPAEuslVuVTu50zkRUq9hyTrS3HiOcZQFdYvzKCLHcBttqtuq2nNEpAhgQvg?=
 =?us-ascii?Q?cxs/gjMG/rLdSWMtedGLNRpdGY6teoaw5z5dGqqfqSB/JOdfNUElGKaprOE4?=
 =?us-ascii?Q?bbemkMy0XRuDk3ciV2eTNtteZ0RfwhWnVI7oktIX6Knbnq/4dUHXr+oPZkIU?=
 =?us-ascii?Q?Srrc0Osws/MEmHcaY+CJP75om5UN1E2kxWHIYArF7AIEUt8Khmxqgvf7v0vs?=
 =?us-ascii?Q?9ewjeRzNxXrlE0xXW2KLQwf/Ddy+ifkbOfbvkSMbI4Bw3CG2GRn9OW4pzzk9?=
 =?us-ascii?Q?xvU8JmNwPss3l92a4RPt9e7nuA8Ai7qRnFaMWcpc6oS/R1JuSfp3h/LetMJR?=
 =?us-ascii?Q?7K783TrW22bnwbBEjMBynG/7QJ0oiLcAHgHF4FXgxW/JUQsCS7UuP7OF5yGn?=
 =?us-ascii?Q?JeKzEeeGLgNvc6iGtfzfiX2LdxDXEfVLzGqsoJRSCUlQ9c1/KOLaVKW+fgD4?=
 =?us-ascii?Q?B9VOAe5mVMULE/pUVMVKfp2vKhFbnsu3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+ZXEchpGXznW4zs10BB9uHpeOCcY86cidHt0jHPTTlARS9Ush2leLLlrh8Il?=
 =?us-ascii?Q?Wnkz+NPMqkIaKdaToSMJCoakAayB2fXZtVkrc5eXNYeIQePd9CbwYytmNFkp?=
 =?us-ascii?Q?x2C4q8iKDJWuSbL7xPXV45+gLHEiIyqlS/xKSzscVom/VH9yf9lIHef0fl5Q?=
 =?us-ascii?Q?NkpMtNcVzK2nF7xe2/mB31nkbCFJNX+jVxKJCmHq3YrLF1XG4EDBCEA17kFC?=
 =?us-ascii?Q?1tE9bTgtv3PpTQM5+ymXHH3SS4BbKTwuiOiES7lDkQgS0efHKCmh7+ziqxP3?=
 =?us-ascii?Q?+xD2lRLYvp4LfGTEY0Fh9j/7U6MjhUZj1xg9T8CUCV9dljPzy/gLSwrq8mCY?=
 =?us-ascii?Q?HgZshqIdjccxaVtyZawwu2p89k/rPhYJIgcExX/UhCoOT1nIdQil47Z3DF1u?=
 =?us-ascii?Q?/qx1JNjFcIQ91/viMRSxSE4fqx4LjkSRC4+6NEqZE/UxUIPupgoJuG+Mkcyu?=
 =?us-ascii?Q?jsMKNjMrqqfjHZdbIEkBgJf/2c+imQc5TUQuQsScKEUXqMcV0Ptb5rGutBwT?=
 =?us-ascii?Q?W+frEZEZ7ONk5Ik0EbkN7nW5haJWJ5MzDC6LDwu2WVgkZn6GIz+VnIHmyU0R?=
 =?us-ascii?Q?cxKSRABBwNwVz35WU/y6tF4azRgfRdFE6lVRTYR4jgrNyU2rSY84lXu/Xl8G?=
 =?us-ascii?Q?w9AdR80DM75jELmHc2PXyrgifxc36FSVW/JQz2WqLPajtr991H3eMrPyWfZm?=
 =?us-ascii?Q?Vrrhh2xemE5425JKFhXJ8nZB9hX5HQYti+6PFhbBEVn5bM0BJQFJpLm7Y59o?=
 =?us-ascii?Q?usNUqYlDyKbWioB7ieOJvbflY5enJEc+TnmPABIhKkBgW/YEudSaRFUe+ZKj?=
 =?us-ascii?Q?mfwFkiqyFVz6+vXffcGB3GzTTE6RKtWmTrPXhRgcN97M5lnTI69ZLzRw2j53?=
 =?us-ascii?Q?2VHu62SZ187OMBUms9G8xGUzzX0PSXNbVonIbD3P8zUTEC0v07Tm+REYQPC0?=
 =?us-ascii?Q?8AvBOWxwfLHSgLMoMltdLAl4EqOgtGVlJOlnoxow9oj/AhbUuJIQABrkzvuZ?=
 =?us-ascii?Q?uKy1PiNqchBzP85QqEwqq4zO0WWXT4/VD+oOblqX2PY6/xpgLzisH8fImOvA?=
 =?us-ascii?Q?9qleU+OfG0FzeqdWznzVING+spEv14asVKhE9nFhw3xD5LjJAiLp6YyJnsdP?=
 =?us-ascii?Q?I5GXm4Fi+ZmEQlPwmiHvNki1MpoQX0liLWnLoybUhoEW7uuPOdOAd2knWa59?=
 =?us-ascii?Q?Tf9nvPquLjxMZ2OlWf49iU5uCKkMdEVNuqwrptTkN3dtRFIlygCZ8derufVa?=
 =?us-ascii?Q?I48yziYR4RBXHXe2fEVXVZ80bzJP6NRRD1va4IoKfpQrMcmZInO9bVdqOyld?=
 =?us-ascii?Q?xTJvB9v/GdBG6EQbPyq4kgIYz3Fe8BYfxDvbFsMR+jDZ8stADaZ++ArghUUa?=
 =?us-ascii?Q?XlHIYwwliSYvivRCGIDtDl8Ib7hNTTMif76b0G9U6JeeUC0ipy2Th49FciQw?=
 =?us-ascii?Q?Bn5UpbP/+kYcfUym8LMad9dyxCOjP6IgG0EqM0TME/xAQAla0WR8er5Xnv18?=
 =?us-ascii?Q?T51VQm/PykTv6BaMia0Ik1m9+YM0AadIoBFjm3D9z8lrmfjzfIgqW0byUv5e?=
 =?us-ascii?Q?zYoerDi0LE/DHBXvmtbJG7i217Q5ylk/ipi18v5/3hzMRCpOTR5fVs75XqpY?=
 =?us-ascii?Q?Xw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: q3ZxbbJNoQV8jKspetAc+BJM6SjHClR6itlQWoX918WDlbapjQwvN9phJ6cK9Y6FpyIh2eoA2uysBTKXvlZzH/Hq5JgPUJxSceoS3FzFx9KKH993rsWaqPM+NBMWVPWr6YbbDLBbfYQnpW9eFa00zKezAYQKjeCNy4VoxyxrczmeTvLpbFARGWQPr7fbDkXd3SnZGkizjVQNVaz/L37rKSwvOSKPyglf5nA1L320bP5FE8CbHxiBR9sdnYFDiOApo17NE5aTDw69chSsxc2G+BviDU7cSu6TD3vTBT2Dj1JzyrlpDUqWjLyB4H0l+Z0L0PdBnEALYgEO6sHvXnnrQF9cEFbz1rWw6psyPp5Ke6D8zAF24+mFaRj4HYrilGI7cFPCiNOwj1kPeQIHoUwrNNOTRg5ra0CYvbkxcd627rkv6VeUDrHilFhzWEmZpn1CobsZaCSZvk93nHABhKpV7mo4trSF+CgjqT1weIK79tvpgI3rGo9BVSoiaxe158bB8HwZDOhisjgEhxGQtpjUWKUAXgeD1e8SOU3jOWeGxIJ2Vu5F68OlbH0phGfSHS33x+7NP0DJL+XjOE6DZd/N2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa7d956-69f6-498f-f7ea-08dd518029bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 07:28:25.3828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUEt2hhhBcf0LqNxifKCxSRDLyBWMzn5n6+41a26ZDpqSTnK60L1kACsukF8vLim6E4dWKqTlR88pK5qkXVlmTc/OIJBc9I6bX4ZjIKURuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P250MB0595
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZgUSMo8LFofz7HN/ACxx56COz4UfzK62f22cc9EVRI=;
 b=YeSUD8E8oHcaW8K5bDALcLei3TL97hpypMVYFuGzihp6JairG3BG2a7ErOPNdGF0HYgc4sDcuX07P+8WOwg2F2ruOWgq9rGIgjmQxUgHAbzcFEkUfA0eb2aoEQsE4cNbw46nq/v9wVDnTbIb3aSmjwtCtL/S76mqjA7L0rp7af4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=YeSUD8E8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-pico: bump to version 1.2.1
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

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.2.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 5bf924987a..3e0344cdaf 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4033d3867a8e94e587355639de2ad9045c0a1ed0409c7901a93dbd2cf2d9308b  libzenoh-pico-1.1.0.tar.gz
+sha256  822aaeafa47405c21b7935a1428b2ac796177ea35ac6b59580481c357edd2b78  libzenoh-pico-1.2.1.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index e243ec64fe..6e05ae340c 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 1.1.0
+LIBZENOH_PICO_VERSION = 1.2.1
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
