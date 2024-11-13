Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E8AD41C2A
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0678115B;
	Wed, 13 Nov 2024 09:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yt1ujvjySJLq; Wed, 13 Nov 2024 09:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E352E81165
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E352E81165;
	Wed, 13 Nov 2024 09:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C3AE2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA02A8115B
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKkbLR3cYMgE for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6F3281165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F3281165
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6F3281165
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:48:27 +0000 (UTC)
X-CSE-ConnectionGUID: WSw2DFLXQHi13faXA3W+0g==
X-CSE-MsgGUID: qCr/l6LHTgWn1S8t9B3bFA==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 13 Nov 2024 10:48:24 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 82315B5A87
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:48:23 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 9F771B5A86
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:48:20 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 10:48:20 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.104)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 10:48:20 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz6Tb/X7J9mRAxaVgHifebIhbpfgdOUDmsN7t1s8hBRbbvPL8r8lJZTDY2+5w/LmgcnpnhGCQ7M46mOJ0/KbBtaNQ6dgWyFp4qnDX3T+Ru+z3dsQSoCGYjwZcWDqN5WWf+ln8OJFEldcocvhcrv3FfY3X/bpYZKNrB8c6M0cAT8vn8GLCug+MBnA2BcVvEFgnadJfxFzPhKA600xncgUIU+a4PWGwO6TzGgzVcJdjC5BRpbiQEafS2lm0Eal6aKdP/F5W/QvbIux5dOlwYWCWTUidf46qfy3W4WC6tb8OhWFO3hXbbUkTAx7/FH9A3VVqWrMe6OhlooxzXoeiUGl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yA5gr/xXqrMc16C1586XuTDAwHhEl9GdPOhLIy4LEkA=;
 b=JFolbNGXJGncRddTU553rXEh2L5/Ys1VbUgMwGdoeHeNdojBud67nTsck4j2swebymBZWkfUHGtL8fOsU6attqqN+nvaLE4ALe3CPMbl2qV0D1Z33KyEb8InLojJ0uUxE7KAsE/CnhKcmsSWmMVe6LGkQJDs2m2uAHG7BbbfKT16dBqhacfaZ/WGNn8DZFryNjvR3y/rfT0zb4qgh/DxohUdHq6Xzr34BNlnWQHtwgYG2UkeTj2woT44p614Nzp4linxGvv8FuTjh/JQqipYi2cGcnfuAKXtcqri0YcEoYshyKT4sOfemQpRyqdbcocaaHtM78GsR6Z6Ft0SoJgy0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by GV2P250MB0804.EURP250.PROD.OUTLOOK.COM (2603:10a6:150:7e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 09:48:17 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 09:48:17 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/2] package/libzenoh-c: bump to version 1.0.2
Thread-Index: Ads1sPUTYcfXVPbjRLuGo5YrtVOb1A==
Date: Wed, 13 Nov 2024 09:48:16 +0000
Message-ID: <AS1P250MB0608A6F40DB013B7B6024202A95A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|GV2P250MB0804:EE_
x-ms-office365-filtering-correlation-id: 00df205d-f90a-43ab-89a7-08dd03c84c96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QbL0BXHK9eFUB61Ttd7oQjASeUfXu5Z9D8WQ9REROJowKqpIFvTu1MFDM8KM?=
 =?us-ascii?Q?D+9FIs3i3u35WhrChafejBvoLSN+Fnr+q00B2h3L7tuWwrg/gvOYHHkLcJp6?=
 =?us-ascii?Q?nfZScK9bWaeKK19/OY2yXMN8/r8KIHMqEPNJ28cSMlUA4/mtR/GZfKX4guJG?=
 =?us-ascii?Q?kitzytbRG4pweSxayTpH141kn3C9WVYsIGBgaSc6Y4K9w+2mJE5u1Zn54Pw4?=
 =?us-ascii?Q?F1jfv6T6riuc4dAxZzR6PeRWqEm4i3xdI4WeKkr6sXmkRiGrU3tEpjG4Bsf7?=
 =?us-ascii?Q?LkGzJRhwbARb1equqRW5/8J0YmcXN/84x2bicGzGUeqFqlXgogmuHX6ANc40?=
 =?us-ascii?Q?CJOsNWRigoCSB5Tft7iQH4DIM3wqwWBZHVMDY8DQRWnCZIbfwA8PetB8zDgm?=
 =?us-ascii?Q?WoZlzAq92d4PNSsAXcV95m1XzNcykDbLdMsRfettBDycQdY/1UgzaxLpkmKr?=
 =?us-ascii?Q?nf4UR0r5Mtn+5iR/LAGkfPoMpyDerGc0Qw4ubRqeSPdrGBbwsU0XNqpZ0KJL?=
 =?us-ascii?Q?CKMKg3qWacIoCevvA1xjvWIYRkpsV8n95wy1FKYQyGIlyuJujUasuW0F6uLA?=
 =?us-ascii?Q?ScvklpU1EXYnL3v7vUn1IYWU/NuFx2D10dGDxyi7fPua11fg4C6Wx/KjdU9D?=
 =?us-ascii?Q?4Z9nYzPm3bd8uwjvkMDtYH0RZizdb95VxGXFufsFV6qeNbAOr6I/t5KBi/EW?=
 =?us-ascii?Q?1ONqdSIEKlMLsEGPX1ldFaV+7Odmk+7qRTYujG2lPAZ9u6J+uGZPARMep6WI?=
 =?us-ascii?Q?0q3sUZJwDq4sW5y5DiT/XOMzttbodRTfLYhIwPyY5UmuACgwORbcGma3xDYv?=
 =?us-ascii?Q?bxb/xqnxBQAHYYKBR8VN0zafh6NyAxxNlWRV4bmWStiuBFQY2pbseGR6a4XM?=
 =?us-ascii?Q?+mDZws8f9j65lGr9K/BuPRftbQ7bMY6Z0q+1lfAwNCOnVUVq4QZnmYsctSrz?=
 =?us-ascii?Q?66ht4Wq8FYOattR/XnSJHEwT8J29b9nL0s29Jk1pAbYTrtJbNqVBVZX2gVw2?=
 =?us-ascii?Q?t/aOmln8PUPqnP+8VbOJXp2cOiChBmG42KOfU+9NlqLTaA4ehHQDLiWHUJn6?=
 =?us-ascii?Q?QvcVKk5Xr958gNz6RiBDIHvrw0HUAphc3GW/EzVD68XZpVIUvnhJzncjmzPe?=
 =?us-ascii?Q?j1jeVsUULOhIgby5HVlrKsulh8gEm5B9PrrPtQBcLXMQBpNJWv3c3/ekpOQp?=
 =?us-ascii?Q?tijzACyAXiJ9HrcHi0ZEDWSi8bUGzh8LwMAhJrEIijuykAMc9atsWOIKZth2?=
 =?us-ascii?Q?jmgi82fuAPm1b1z49/2aoYrqLHSAlRtfJJLY1gyh4P0IlhGpPaUwLe4syooC?=
 =?us-ascii?Q?LWPxmJjMKqc1BLewT/NcPSPbI1C1bVrQuYg48+2c2rDnVOImZL6aysiJ570n?=
 =?us-ascii?Q?5ugXqVUpHuUl6NhjaEWikd1qxIMf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j0T+sR4nuXDw1Bg+ZDfEGJgrw76zr5aKqwkUdx3Dr8H3kmZeOBko/x9lMHSB?=
 =?us-ascii?Q?g7NpqoECKqpIddo0oES2Fm91Ee4ifohW2xsUJqIBEnZL8B9L26iL4cjmkc4P?=
 =?us-ascii?Q?Q318+rCa6jPdR3Ps0+b9xkObDIDc/PuDpFGMv7tLCyHriZ6QfOkrDQG3MZdI?=
 =?us-ascii?Q?hIJMVkRdOKqAtIfs97xGu6zAwfuq5ANiyVrqleZBLGSMNWIdCoSRVfPc/7AP?=
 =?us-ascii?Q?N+vfrB2ry54KLvTfCWOqADquXmH2hY31m0foZK4w4oXcz1YhMnHJBAZdrXqt?=
 =?us-ascii?Q?+2GhclfDONaQu4yWpZCiuBLl4R2xOQDF2hSuaA+Embj5HrkyDnieP2aaKUat?=
 =?us-ascii?Q?QMLa6bODXPiH26zOE4hJf+29PQGBD1gwm2/noXT/7l3PZ66U70YzqYK10E+t?=
 =?us-ascii?Q?+mp4LEaVamezqt2YEPT95Xyr9w68Wxf/WGuTr/VrE2I0tjuh2s/7AwzpqFml?=
 =?us-ascii?Q?sXKu0H0+Jksj6OIomlL2rPl+EtM3Ni8LPRYi+iPUwI6M2NIaH0w6kVyUOeoz?=
 =?us-ascii?Q?RjKScTx2vLhRb68PeZgXODH4HJDdYBnaX0tuHuehlGZRRXrioRJuL9jNhd9u?=
 =?us-ascii?Q?NVL1uf5AeI34W57+UTNwYnbaL0rcQ0iKH/IUv3Rz5eDg66znmTtoOSRCtAco?=
 =?us-ascii?Q?zbfueivP9x/9s7J5b/taUFFjp16OXZaVB+oG0r4NwhgDFrqaneed6yChBz/u?=
 =?us-ascii?Q?QQSAbvp0MLAHJ6A3dVVSvAVKlQQDnvSg59RiphwIMUe6QjUhSs9tyEL0unD+?=
 =?us-ascii?Q?W6yXBFojHxIisnOc5AWwfMaPc0wRJQ/Jfc7jPjQs8nC0F/I5U3vvumKC6M5Y?=
 =?us-ascii?Q?p8htXzBSb8NKoqFByIkn3NtEpLe9tZm36++/JHyf/Wk9D1Ct9bDIbGrNg6fP?=
 =?us-ascii?Q?FFMPdE+E0K+B/SchCnfewF/ccrUX9yx7iA3nCNYGijbfh5bL9OL/bQbNCqbG?=
 =?us-ascii?Q?sdpmVJQ9JrwtUDjGbitrOn+aVI4vAOSWpVaB+gAL/Mfic11NHbLQSudgnIgY?=
 =?us-ascii?Q?9gabLDHb1Au3SZlLDcyEm9HCp8llI965Zi+bsGJ22ysTqDgMoxOGUfe4mXf2?=
 =?us-ascii?Q?CaSvrmt4ON8TNHdAy2CE+o8zek9lKXVJG5OWZT1sUR1xgkr4yM3Ofwgc+ae5?=
 =?us-ascii?Q?Fn26FcNUrF2yzwnoF9g6XSyBWrPoSj6KXlNL4HFzsyiior9+sXji9NRlAyRi?=
 =?us-ascii?Q?5kR1cxzvv974HD9oF+kPVCMLz4ghx1nllAdeZucRWd0ejJFyBIuYK9gYG6PS?=
 =?us-ascii?Q?ph0qz7a0LYLXQHWR3JEotn9bjjTAp9sxAd7L/phdpv7smaUJ/i61e4FJiIzQ?=
 =?us-ascii?Q?lhw8eTV70+dFBSanLN2WvWJ7mWk95uxSLX3yjAVaIZWfDHDr5irVp9RhfgU6?=
 =?us-ascii?Q?gqxRikCT8MQptTOkct5cKLxjaSAmRVMlhS38t2Hk9YGOPKJa1F4wpuasJziL?=
 =?us-ascii?Q?gLzWVBdEGKod4PgRkaA1fB7O9Kv3yTLlfFE7Y9Qj+tytkI5fqiod7UT9HcqK?=
 =?us-ascii?Q?qHpst4OJxmABAReWSdsSPljwbvib+f1ENWu22EotJ67T2j5O1uTOx5TmTZ84?=
 =?us-ascii?Q?sIDi0p2pBYPBHwCaRn5VMY1nLeb/lBIDCFraKIz2+Owac7haSLDlRNRUl1Jk?=
 =?us-ascii?Q?+g=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ViCT+qIZnj5wm5YUMkmJrgrXoVLYjU81E5VuQXoK+j0PTLsWxWtaNw1garOzPTchk4tEt6s+//fDZc4QIdoj7gmhfxud8PlDWbWV5hjAHAVWAJ9XS/nBaSXCGQBgEJO18i21EK7K8oLN6s67zxsY0q6/MRHWiahzzqUVeN4TCGrXbYL+2XA7Ae44BS0AxiWmyvs/4SkLDlJhTzyBg4Plwa0QQGUnTaOHvjGa1HvAWHCl6vjUOsR084593Nh8/553hMKmnJIBRH8Q1pyA+1/HjUYd3ummYooTXe/GfxtqiqBS1qTSbLOZto2TAB48IoB4nlD9vvExBaOw1RQ5yfl44Fc+S6yE5QDsP+g9YNpm9zVw20OTzsvWsAEfHn5ekeMJnb+ijBvN07oq4hXeRypNyejNLneTmYGHCbwzATh6zFX3AIUHyG/yCmf4DWs3k1SA+Oqs8tKEY0jWiqGL3w3TLxO2b8sbUBh60xXfMTo6LoHC+30iao157pgppCsyo0LKTzQ5S4UZ3EOkP+OuYf8WGvYZu27pHX46Pn3QhKWsJAXFNwAmCmxqnJIZMPbG/BiMLZuXGS/9jXPoB0l/36k/ig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00df205d-f90a-43ab-89a7-08dd03c84c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 09:48:16.9302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmXkTysZ2wYVi1DGev1gElmFBjidWVgQpldit/UkT8rz2NzxgbC8FfNbKXdB7NEQDWTVtnhAqdFUisb0P8Suf0eoNukIJ63DBguUTXJwPZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P250MB0804
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA5gr/xXqrMc16C1586XuTDAwHhEl9GdPOhLIy4LEkA=;
 b=II2afP5gxY2TkD76PsxfOfNK9GzDT/m8v3Ephrhp6HD+rc/mqP5ut0Nmh2koSu0kbGHNHJeC6yLtvfGT0cQEpu5xGU+ix7D7yGviOTsLKYMsTRij6xxluXbHN2IqNUiMJDMVgtHT3zlwrZB4W8iCX2sUxqKCBULcvwEwBeEcqlU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=II2afP5g
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version 1.0.2
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

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.2

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 124128736e..da4596e4dc 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7765bc1bdbab608da4770db7624ec868ac3cdf7e63707d7aff406d85558bfc15  libzenoh-c-1.0.1-cargo2.tar.gz
+sha256  6e3419a3ef9c1d0c65a2749728e332cbc5a8da2ba3dfbc24f310fa8735fb5949  libzenoh-c-1.0.2-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index c037420d86..a697146049 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 1.0.1
+LIBZENOH_C_VERSION = 1.0.2
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
