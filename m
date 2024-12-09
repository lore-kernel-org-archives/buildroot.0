Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0C6E77181
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1732C60845;
	Mon,  9 Dec 2024 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AKoljwNwQtA; Mon,  9 Dec 2024 12:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BB26084D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BB26084D;
	Mon,  9 Dec 2024 12:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 718006F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 12:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EEDB60845
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 12:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHsuj95LaCpo for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 12:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64A926084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A926084D
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64A926084D
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 12:24:24 +0000 (UTC)
X-CSE-ConnectionGUID: /Q56MC48Re67HemknXJFug==
X-CSE-MsgGUID: 2RNYFPSQSQuEh0AwWL+1vA==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 09 Dec 2024 13:24:17 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id A607CB5A8B
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 13:24:16 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id B6619B5A87
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 13:24:13 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 13:24:13 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.176)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 13:24:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTS9xgvizlbl265+4nInKXhDFqz9t9Q7n0SSOlXEIVeWyDecMcPe4cX0xCbXFqRI3PbtAb6+rof00GKHn18MFS9ky158TOBaGRgGvoYldUuMrAsmgR8qjqlD8lMLNLWVnCMT/j2nAGPS1wUkkyAPOY/7WD85feygFad2pX207HhfLu4flYx2M4TqFz2y9lKLyp7tgMQV9rUCiW5dyJo8yy9Dsfq+cZZhIXD4wH+xOfaXexvt/rU2HfKfZyyWXjF+gqkdyj/57COwvRX1MGucHxzHLwbSyK54pR2IlBJ2CXvnar9KwtnbHW+/EqWgv5TzMsIJ6ZuLXKodrNdy867oWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khI+Ag0JuHANzURBgxioRPXhcGya0b3OAEUo1J2X4Ig=;
 b=w5t32JL9LNIO4ftbMFdilxgbffwPujna5/QbCBYWSYpmXtRE25e9qRr/v6CCRd39+F609FA2o7UbEtasSXsGJ6tf+oHmC0vZ+0dZv+WdWMiHMpuLOHyfuGESqFWOZUNNlfEbaT09l+L7jswOdfHBvJXLE9AePDi980IE8p2LEoOQYV3OfftgdoTUukcnbCQLI7DW1LhgDTpp3V34e/yDeIMLJtQox20CoVM2LlZcXhB1PUwt/q8W8mzHGeEobox8K8PppHu5rSB+cnzZk1jY2I9AIDQpVWhFdFpUTBMXRheEa8MsXd0BTT64BBlybkCG11Evnq7EN+HKP9UhoPxiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0962.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 9 Dec
 2024 12:24:09 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 12:24:09 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 2/2] package/libzenoh-pico: bump to version 1.0.4
Thread-Index: AdtKNR/8hJRb30kRT8mznEBnf8686A==
Date: Mon, 9 Dec 2024 12:24:09 +0000
Message-ID: <AS1P250MB06083C5AC5A9549BDCA307A3A93C2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0962:EE_
x-ms-office365-filtering-correlation-id: 172e8ebb-75b3-4690-3df2-08dd184c619f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DFVfCJNbyIkqwpv0rMnug9SYxlnofsis7pM7bTtcbQF41QUzlHrJOUgRf+ZT?=
 =?us-ascii?Q?FedKYWMyhrGZGPTdVXIj07RB6dGH8FEkoykNHlohTKKkhvmZ0VQczp2+XK4H?=
 =?us-ascii?Q?QEVngCWGzQQutIUWZMC+2qJCuhNzFjlO/7hZ/JspGP4pvXbBOu1hJ9oNPkjh?=
 =?us-ascii?Q?oACUVJwliB4DEhwcR5aL3+g8nsWmHr5ZriQCu4Xth81MeVOa4V9gjx5JWxxj?=
 =?us-ascii?Q?ogYYhbgVgTUQz7Th3s70NK63f4XZm0wdF97KuUe1D2GnkX49Wt/OXYfL32Zf?=
 =?us-ascii?Q?3UWAphb75mX14lKZPqugwHRyMxx5Pf11L63kXueH12cVSQrLjCbwc2EPNgem?=
 =?us-ascii?Q?VO6JZKwRKNWMwTgE0RavFwrAgfPXpaH1VPmgUQUoUrp5eyX0VO19DnkjDNin?=
 =?us-ascii?Q?I0GsttRvuCb0opuiY1g4CqSoncOogLyP9PUyyP+BqhoahyN5Eek9IEGeJQNt?=
 =?us-ascii?Q?QCTWKdfgIQTVsBYEponCqpJRCcIhZwEy3irsWPc9sZXxc7l2MxWVgH0nw/0m?=
 =?us-ascii?Q?VWWHTqVFySYTzihDhY6O9PSqL1DlZe1hfzAW5pdj2Z/AzlduxfOitOdCHtrG?=
 =?us-ascii?Q?z4PwbY5TLuJzY3UU4Vmd8HQBw0NWc7gqr0Z7SMSWeMMN2eIuK/ghsj6aseg5?=
 =?us-ascii?Q?cb8eRpT+q4ucE98TkyX4fbNPkYPrglzzb5zl4jZTcG+TZz5kPMuUT82Dghd3?=
 =?us-ascii?Q?vOoYqwGW7KZbk01/tzHot+hAW7jwVjyC4Rcm4LiEAQTIAJOjO+0u5In+NYy7?=
 =?us-ascii?Q?dPiaDjvuEZyBGnx3aelhARbXwX7FIcdytb1yWHpNO75bb1Xyvop7Q1YiZBGP?=
 =?us-ascii?Q?0oWUE2aXXljlaiR3xDYy5z2j5rgM9vLwp/LF1flLdtkw3h5eVDg/h/JXW/37?=
 =?us-ascii?Q?PMGixL6mBBe35aCCDPdifacX87uzfaE95UFR4TFCdiFpY3pGOqbAcmyZwR9o?=
 =?us-ascii?Q?GGOBasDDJ4tumz2lWkQ+r5COfqgdzvspPji3hoUh5URkbhmNCIZ5MrVDJO3k?=
 =?us-ascii?Q?+o6GRD/oKM9F2RXo5OQY0ywFBBfck+aDr0xR/8HJOURIvd9VEKKJS2R3zVHN?=
 =?us-ascii?Q?DsbGrPNYeOwUgiwFEXP7pMuvUQrIlNhH3nRPLRbm6dgcBlrYqScKa3PcOwjn?=
 =?us-ascii?Q?CBQyRwZYItfcYbac/HeYWGGPVKHhqs8lDv64m2w6/idjgQAk7KQ36UPoDY3d?=
 =?us-ascii?Q?780aihlFC8GkhZnrYqLl5swcpc0aO6hUXRy3ij8B+3m78RML4Lmphd0CHXvl?=
 =?us-ascii?Q?tlGVIXLbg83S+EwSBT/ZNe5sI5+pt39chSjKMurs0pEUN2bjtQNCvRwztiRM?=
 =?us-ascii?Q?ysq2BhI9ttHoVoqhg/e3FlNQIdB5E9qNbNRtAu7DQNaDioNH3wQkNcJ8fI+m?=
 =?us-ascii?Q?LSR0zVtdH0rkSCj3G0WyjP70LPvwogozW3QTj0LWFA0XfAkOew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PD7f+o16TK3OVVbJPtlEqE4vyiJF+q5Dz/B6qAZ1y30jD7miOgC1pwmNM8hM?=
 =?us-ascii?Q?Wxw87SEQyK0OiNZyKEYMsCGj3StFESVjxK4/WmgLRwGVuKo92b+s316PVOU2?=
 =?us-ascii?Q?gncHh5FzbanUwWPmKPm38BheT7Qoao2+PPLujBd35hefj5/2UbuT2QTNrs7V?=
 =?us-ascii?Q?c2Rg+SozWdZOdMoG3Tg+oVdvOeTmuBXork1JYqd0CHyjNnEkNF8s1/vQgGmq?=
 =?us-ascii?Q?iFRmP0VxoQrCy/IvbGpAIGnpNCNJNfjhDUevWVuyKRx6Lcb0rDQXifYdSFqb?=
 =?us-ascii?Q?sVrOfAwELDHUtHRb0fqDX3dCnYiE1cvxie1RDLCI04lKZxnoTFNBF4uMbSLF?=
 =?us-ascii?Q?FCbzpAT1ZQPyDYSfsD6CUfhiyjaCPh7/rr/aEPG/c3cyvvPzYsQmjvsD7/Ia?=
 =?us-ascii?Q?xfyRnbHKTA74ITYAFf1I7iAFn+UeXB2ltYyUFfG5FOGim2tF4lGbIRpVhoyS?=
 =?us-ascii?Q?SElK14i/eA/xAQ7IJMP59UfJhKtp4QLdUuWR1VxeBDFJF/DfPySoXZrUuclo?=
 =?us-ascii?Q?IITA4+v4U9C6sQgYnCsdgMk4UNX8aSTYPoAfkWun8Xxk1xylBPVOL1q+aEUb?=
 =?us-ascii?Q?Qb3OF94nztHcsy4+B4baln1Dh2PTdILoiQ0l69X09N5F3fmaLDtZqky3tt/v?=
 =?us-ascii?Q?gYg/x9iXoK6KyjMpajEDgT7rCkKZtw+CuslpY4Zf4RfjgaEDGfcMvCZOxgZA?=
 =?us-ascii?Q?CxjRvZxEphVC/FtcaUOPqP0CUPzTdrlYyqcDQeP1DuyIoG7rXR/+2tvOYovv?=
 =?us-ascii?Q?7GoceQiwxeg07fOKKKnecsDEonue2zRt4JnbPaWibI55zil5P8RxC4sXek7J?=
 =?us-ascii?Q?0q314apFVI6eLdKlXmjEEgM6q7ZI5ApPVAwBh0dEZpuueI5J+14nZ5sfPSBQ?=
 =?us-ascii?Q?++7SR2vqd3GFFMSSpnNJY7hAZTRzc34CyL/GY/Si+N75tMfrznryLUCzHxSe?=
 =?us-ascii?Q?AwjKCat06k1+zOTxYt2NtyvofG2fAT06KSzhCgw5pC2KCoNadUQH1fMqpxOO?=
 =?us-ascii?Q?e83+TI6dx49uK2qm27HxYzQHEfNag2mkqECXb7awOQBoegMjg5a/+NemHMYp?=
 =?us-ascii?Q?zJZYg+UezRniJMVlHHFlKCc2cxMArpTFr+HZnqGGYaDBGyhLBpIkR7mJFZMc?=
 =?us-ascii?Q?fniCwqz62GuELzYustHbAlj2lLj59VVVxGqTYikenxKca0vdwbrT0lec0QmH?=
 =?us-ascii?Q?rzVSA3WNbT+8z0GlpwqgPx2N0IuWO8yZuRQIqIXLE4zC6VxyuClD3gLfzWVl?=
 =?us-ascii?Q?x27A+r6EAmWThxSRZh0uR/ruqyLgE88Rq3PN8m7+6LIY7u1l1XLli9D5X2D/?=
 =?us-ascii?Q?01SSA0zcOXOzRY4VH2VzPAp9JyC9niuNhw/467PjBCWD+JgwlAdDXEJWdv7w?=
 =?us-ascii?Q?20pFN9qNyRzDDAvAz+dAyn09g/58r9rVXBlC+BTzvzp7dpJ5oboceM5D7WA2?=
 =?us-ascii?Q?x5qYLtWWqs5Ur/MRFQ3VzpeNa6C56t2WtI4pcaYfSzdspzH5NeRhSY8r1w9k?=
 =?us-ascii?Q?zLh7DUbecnD0701f8rbs/QHkiYkeZXQodcXrC1mHixqFK69jWlLAzpEHAu2a?=
 =?us-ascii?Q?DFxG4ESATUHw3Prcut+sBokNBO1AgufcQlYCoZEL3VFI0bjKctjY689p5IyQ?=
 =?us-ascii?Q?qA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sQtdPL0Ei6SCGSc9YS4eJCFiv9BWE+sJwXtBxE1bvW7ddmcWzkR7EmOLsPe59rsEd4yA3LkoEcz3o7jner6O1c2fiogmb4UAUGrLzV8J74J74S/HTUUM0QRGcymghZxT9S4rTjE7sNpf24sUco4HIEQQejikSnonNmWLRttceauds/Y0SRO9bt3DzU9EpxBCknAwif7DPEj+STZ3vzlMiR073sLDXMuQiWQGDDlHFa2cbYjbBLEL6xzXNrd6nKK4ksIopC517U7ObvAs1U/Z5plS+ElJ0ppWtZw7aWaPwM6B/8SyfassVsvJnF4byyYEkuTZ1SXteVPh8GJV778gOdoN2gZ8QQVAW1mAmjeLME6f02qJPeYgXLwlYnB4SMqVUxaIvMP2JjmVbGXXz9PQ750J7HrU2hMZ8cXSwWY/CgmB0/iWCqTT5KlrZ421rukdDetgmYwGjFhScZCoWG69dbKGShGqn7EnialAhPR1CRoLPkGAJu0ebn33c+YJ8LzhwG4FAQ1rm8rGKvVeJDGXsuysb3LsGUgkeRp/LU3ZMU2hOYBeNGy5BEevKKQRkIPHXHt5zSreTa1f9Sji/z6oKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 172e8ebb-75b3-4690-3df2-08dd184c619f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 12:24:09.0357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urhE/HDKSZ1nIfGM3zF/b8BWXaNePN4rdyUW9+bhiHmpmMLUlfuQM7spW5halGst4dsLt0d4vOEfKIrpvaflSI5PrpOM89n5zOU2/HLsb4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0962
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khI+Ag0JuHANzURBgxioRPXhcGya0b3OAEUo1J2X4Ig=;
 b=UUfeLxL88fzyTKfMuBN9pRtXG8RjVQBt5zpOOjN88LN8TPM169Jt4HkKbGI93knr4E3KJN9YFv5kKoeb1X0yx2bXIAt8j098Ro9OP1y2QiAlj+FisfIzYYuxDaUnEr4ITFtuStxE8aMKVjl+NTIaeZjbl1e6SADqEH9+fc0Hauk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=UUfeLxL8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump to version 1.0.4
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

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.4

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 11c9dc5fa8..4f95f2215e 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2c7645e023cd317a21f6adc0f8c50d71ab3b058a1a630ba4a0f29f9c0eacf3a  libzenoh-pico-1.0.2.tar.gz
+sha256  c9002b4e348337c6fa522a2c80e175f512fa94d1837a9332fe095cf254e77242  libzenoh-pico-1.0.4.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 28d702c459..bd1dd763d6 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 1.0.2
+LIBZENOH_PICO_VERSION = 1.0.4
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
