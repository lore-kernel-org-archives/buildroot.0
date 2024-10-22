Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6F8D1CDA8
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 06:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121FF605C1;
	Tue, 22 Oct 2024 06:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zifpAvBl7IoY; Tue, 22 Oct 2024 06:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0947360699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0947360699;
	Tue, 22 Oct 2024 06:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 997672072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77FF340277
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nt8uD2u4myfc for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 06:46:59 +0000 (UTC)
X-Greylist: delayed 436 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Oct 2024 06:46:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EA5C40272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA5C40272
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EA5C40272
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:46:56 +0000 (UTC)
X-CSE-ConnectionGUID: kCrHjiM0SuW0q9233oh5rw==
X-CSE-MsgGUID: /zRwjHF4SiiSxNfV4wmzMw==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 22 Oct 2024 08:39:36 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id E85E2B5A87
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 08:39:35 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id D867AB5A86
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 08:39:32 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 08:39:32 +0200
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.107)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Tue, 22 Oct 2024 08:39:32 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNvskIT1NbJPnA3uc7S/Lu6qbuKPQt6i0g4WaFCCfMjILGX3ys9zVVG50aGPYHv2Srgt4+oQ9aa8cqiOEpn+Gfx2DC3W2SY5GSWljnnRCq256cvoqYY/RuHATpuILKzun88NqbrdZebpfeGpt8oHSdOjcnbYhqNNLq0U+kruyJAH58ZyoBt+fXlN7KeRHs28UjBVZ3sNRS1Z4kd/uPEm4W09wdKwyL4naYjoobtsvzl8E+nc2ETWrByEZC4qbcU96YvNU83sVqPnt4ClOLzSkQ4cLkd9nizWoUd6c41q4LOX1NVVQnGfSKkH3Qace4MM+Izt4vyiS/OQM01MeqIWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNEhpV2JFNNzMYeCkucJPM4FK31VJiydRl4+ir+AepA=;
 b=ZzgSIa+1VO5KbEKfk7aijvMJy6NK3yqsgTj9wOS5OOhP+bIwadKpJsZBs1DMdJCFQhLyeTtg1kDNbcyaCR3ztm6yfo0L46CAYcKIdzKyrSqWftXQ6LOLGfAQDCkuYZQt9F0W/2FAuNXGm7YmISsrDfZtDLTP8cSQ0XCIcZjyazLguyVX4sphXgUd0argycptjcfMJduVSZ0GAlUyryum6rwN4ptq5GRWSrSsh9hIRdlF15sl0atjssMnOXHd3h0KMq4HzmSr2WlWMfBcIZ9sOHJZ1BgDhZzJZ5CH+WFqfTYrH1O9mpucofs1dRFHJz8MgX1qujtDjmkDNb/7q6ezXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AM8P250MB0279.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:39:30 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 06:39:30 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/2] package/libzenoh-pico: bump version to 1.0.0
Thread-Index: AdskTO2wCP2CaCzpT+GbM0DzSVsmNQ==
Date: Tue, 22 Oct 2024 06:39:30 +0000
Message-ID: <AS1P250MB06084A83D030B95E26EF7746A94C2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AM8P250MB0279:EE_
x-ms-office365-filtering-correlation-id: 17523399-c2dc-48ab-0244-08dcf2644871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oLStZ6QoCCXRaWeu8L/Z9jup0yg6UavRmi4Kp0uCpqu+Kqdpsfc6LBHt3Mk9?=
 =?us-ascii?Q?HNWTjHEaRtnmhDENmoDSYVXao4NLEAMFiOmSzkLBB56mtLvn/JkBi56QdEKx?=
 =?us-ascii?Q?fJIllRN+teZwODIQVJtlSlH5UpQieIkJSdeIllIyo6wADVZCg3uUX3DOW5NP?=
 =?us-ascii?Q?pgyQuwAAC3QHRjllovTg/p8p1G7reADcZjW9mKCEJ+R7RVgMDbyctG65muhj?=
 =?us-ascii?Q?f/j/6N6v2tP8ZCBw3IhqSS9yqdAx3xz0MdYLg73SMyTomNSsX0oUR6iUJyIy?=
 =?us-ascii?Q?S6wfG12/PVEvuN5NFIw5TIqwEhP//+ZQCAr4QxdecZWAXcH9DQ1YkdGWpZ2g?=
 =?us-ascii?Q?NoG3XynynrzxZ8HzYu0Uy4cVwdRcfw+kXLQnolstG/KpESBG42P92BZa5g8N?=
 =?us-ascii?Q?NcM+mIU7C+LTVLfMYzMIA0h8C2i/ZTG6yC1avEc0TkECw0FwzgtipxiKTzG/?=
 =?us-ascii?Q?EpAk+21UT1z3N15WEDzRjW6+zxKQdwSeU4O61bx4Py2NrT7B7mwgeUWvTtMZ?=
 =?us-ascii?Q?Ceyu1AD6ypSMc3lonrvJ0oDVofIvJu5wzk5uWtTDl6rp6fEprxE/5XFgGmbJ?=
 =?us-ascii?Q?LKk4ur2sSYh9D1dqnmfQginEU30QgHoC8IYqZcK6Lt1DkxDIRYCdht+qf1wf?=
 =?us-ascii?Q?+TUaDcT3XZHhAy108YbVaGYyfjYfLwQb3rNu9uBmdCPMWRPSK1Wy/CsKiU9+?=
 =?us-ascii?Q?vtn3ARvq918ZWvnsaXgjLi4APJ4qiXJuGhZPfEX9rjJACb4WJD/5mZJOvMcd?=
 =?us-ascii?Q?dMVu4vvtRtUpnFePPnXgkdZVr9f9iTLcWc+yuCoazcgh/ez19bQ73aC7sD1Y?=
 =?us-ascii?Q?eukkazl6CaGqBLP+NqIYBokya9xPPJ4LazcEsvSpdaxYTeshJEo/vTFG4/Dk?=
 =?us-ascii?Q?WN/ICeryYOuOeUHffpw4jTPQ+HvQ6QlXov5PgzNzcpNAD50aQjqr5bRQzSPO?=
 =?us-ascii?Q?w1MRLl7zScJxp6NZ1OgpeAw5m4qQ+Lk5WDq1tiv3XAg0+KrLmkEC2RKsUVdR?=
 =?us-ascii?Q?KwbyvlCFlRj+FtnxoGUND2olHM3sjqMmWksWnh18RQKHM9MIHTvTPT5MPcaq?=
 =?us-ascii?Q?FbjHShswkHTKI7k6U4jwSuRTN7OrSjuG+h/s8exJUcI3j8GWJ3LaakRllh0n?=
 =?us-ascii?Q?rv/eLQZzNyBTk6h76XYnQZvR/zi3aP2XhLRAsOk9DE4sueyasNMo2Eb36I0h?=
 =?us-ascii?Q?uCS041MvBi9NgyIxXqPKccFXuHtX1zG67NbGYMpP7b2HsyNFlD7j6hQCeQ2P?=
 =?us-ascii?Q?MDKICUB39DBvRfDevigaI2cgX7tEJSrvxTAhttyWjxXyXW7rIz6mt1KxaIyd?=
 =?us-ascii?Q?MLlPy9vTqFl+5F5GJ7elRfnakxWPSFoPJzyvFxqt58zQ4oWnwwQB0IhoWqTd?=
 =?us-ascii?Q?a+6mH5eeZoahEed8qA2MeuwZq3iK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jC9KtJFk5UyfQMoJt7N7qxdsKDx3Aoox/kHatTnKypBA2gCBCDoMZLNzJ5NB?=
 =?us-ascii?Q?f/goun6abnz65ARL66ce5y5Ww9Fi+ITq9sYaq8aBRH1s+gq+guhZpbsQ+Bsk?=
 =?us-ascii?Q?ZIAoSXl9fhYZQK7c6FBi0gZWNAaxLT4VITbyhLOm5jV4qEcbqtWkRnn6036C?=
 =?us-ascii?Q?kOZwkbCOcRuYSmhw4/8nKgekUDS6fZlddq9iytZSG36XX1RAKhKsVZaT80E0?=
 =?us-ascii?Q?oYbujieqWG5kIjfuEXxpPZCpkw4EorjV6foddN2Nqw08t6io+AHeyycL02y3?=
 =?us-ascii?Q?GDRrEKouBwvajWqla9ZFhgZ4Ljga7k9hhHqFv+47vPHPQKZDK/hI2oyIMVeZ?=
 =?us-ascii?Q?b6tNmfpFSp8mCa38DXcXo2qLFw2K5L6wiHhMP/t6RzF/UiBrzwquoNJ0SibW?=
 =?us-ascii?Q?X4oqXHaa0GJH+aFm6Aiya2jFzmDGXgd4u67lxPRVhuhwlluSvnfFfEEqcBp7?=
 =?us-ascii?Q?5/Nyp3S7D9Bl/z/CIOU6jaRUnSU0YtQgKccZGL1PaNnomCTru5qdLGT+S57w?=
 =?us-ascii?Q?Cg92wVskgrrQJDa4q4bW12McDmuFITFjcnuH058O4oH0+gCRWSiOAQpRjYQM?=
 =?us-ascii?Q?0w2YsVfN7hUyKkEFP5WOzNkFwD9IgJEn4GPDlP7bRAL92WlDnX3vwocqbFM5?=
 =?us-ascii?Q?9bahFVtn9cS4mEn4HEfYFlQvMfm2/bGQfc70fy8JGZnJNZVRMfY88elOrGZz?=
 =?us-ascii?Q?ykGqg6jsDfjGs1Lr1y2clsnh5nDbBDfjwc7GuOeht53po5VZbk43OFbNVUDy?=
 =?us-ascii?Q?gJGWBOxszjDt6ZrAOQa6QKUe9bNbiQgDPT3XdztQDkq4SCKnsXIRN6uTKKw+?=
 =?us-ascii?Q?fAC9VxELc3xS/RZA4cx4z+io1XbEMp77aTt2AWuxmR4Zc7E+XYT2pyBTrZoD?=
 =?us-ascii?Q?+FPEU1b+nUZ/rf7rHkHwKZhXiXVOGEIzqkVwtOs7/P2CzATOSNICKQPH16/b?=
 =?us-ascii?Q?vfXHEkulxru+hEXZvwUFCKYv1Z84Z3Ds9Rf31n7wHlpkgO6+cAELPqzZ//g3?=
 =?us-ascii?Q?9bflaK/PJee4Re+A0lLHy/wjYG67xwIhwcNGXOaOjjYXfMTP5OccOEdtt3oH?=
 =?us-ascii?Q?YtPlMavFs0nDU/RSB1FOCCWjOdIIzEFWecURRTai/H0XnGQ3DjYLdfF7Jabe?=
 =?us-ascii?Q?NAszsP/7Lh7jPIKdvJvEVdB+TQcT9FyabI2ALredXwDm2tuxY9LBybl9BD2o?=
 =?us-ascii?Q?aVYfYEEWhQATOFqSIy8KAKRB2jjwgvwMjCU6rIHgJIssDvUY2qqqg4WN0kD+?=
 =?us-ascii?Q?7Sqp8vKUFsibHd4uRtQcmNfRYpztUF9fNxzK5shnmh4bBtTJ0sK5fGxIY0Fr?=
 =?us-ascii?Q?nRBPG7Gn/eC6CcrTSw4LxPh+On+5qUqvnCFX9nF/uoxOfZeMSoRalNVRnun1?=
 =?us-ascii?Q?2TB561+sD9sD0xqtTtPCFnX/MVd+f00nKe+/PnRvtkYdM2taIkFFS/tNm8i8?=
 =?us-ascii?Q?LyQDNN3Z7VznLkV/MzWWj0j7Pcl0h5XnsSrbRramo4NohQ+r86aaohx03w+P?=
 =?us-ascii?Q?YKaDZoO6syUNTtlksDRKcplkIfTi5jzL1htOuWut2OfrnUk7stLoApMgNyzF?=
 =?us-ascii?Q?5x9Zs3Z805gQDBeBM9gHolMwIyY3sfzjuy7mfxwRU2DBlYP5SvxAV647bWjX?=
 =?us-ascii?Q?8w=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: KkOwaBX26sOEFyoxnSzpq60j6E7Et6iakv6wknlQtZP5YOHTC9W0w3Thn6ztnE5AWhz+26itJU7LNztkC7MOB6w1vrGI5mJK/VLkh7ga5BV4pwiUc7rsLsPiavITdGco8J9RAKcJcL/RZZJlTiukQd1HIu5tjGO+IdpG32cDvOIWqkXeu+WzKmmJZfifm/E3lie9WPnI3693kD0LpXu8OlXcAQ04OUobvycTEo/kljkcQxagXDgKH2gVMg9D5wI4RaB95oMKNzw47LY6TEW6y+alRoK27I2aacGnY7BS1UxghUD/RGlqF6kZAWn/bsOH6dUDg+2KtPrp4shHITK9GDwhchoAbTHXnF+EwrUTDu1DZeV4eDBdAsha5/KJN54qUNUjgasdEBP6yw2iEvgN7CCUqteE+hHgBZBOCLxbG4lcdOWdtUttIxDrGl+bJKa7hlz+sY3Y6PrFQ9IsVqx4eV+7szW/WnL4UlfucW/BgVOx4yvR1BgzupPqRKIR3U36QUxJLlb853Ne41Tsu2ANQ2zTNtZjPG28+hDQNOla6lgi/EYWgy73eFIslArwCZsof1rpVpLytMYTEpw7pXnCkw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17523399-c2dc-48ab-0244-08dcf2644871
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 06:39:30.5668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: za/iQX40nEE0wTGwfKTL2gT0+0+r2QMRGIOwUi3kOLxZzAgWTH4ORhW1uPcvSAPcaR8K8wV3MKb/vivQnDWoRv+xl6yz2hst0iJZexDT+CE=
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
 bh=FNEhpV2JFNNzMYeCkucJPM4FK31VJiydRl4+ir+AepA=;
 b=FYsKvG0yRXS4O41gOs9PIbFLFPqhLXuYV3XF0GAZYhJyjnH/IESXycpQa4tTRSx+HdMNoY7/ocuKVV160iGXHLPRag16MoXbJaI96tuN9OXYPcFYZo1WasXd4+ZkFh6aW0EPGoUDqyJrGarY6euBqmi/zJ+bYUiUCDU1udywsRk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=FYsKvG0y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-pico: bump version to 1.0.0
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

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.0
Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 3e017b79c8..66f5285cfd 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db1eca9d84ca581731cf1f3f88aca785d58fb2b1972f2f07d09a0cf022ee02f9  libzenoh-pico-0.11.0.tar.gz
+sha256  f489e0fdd3ae07be1a6483bd47113727ae931749968379d823e957cbdde9e8dc  libzenoh-pico-1.0.0.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 9f91926f0e..6009b7d8bb 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This 0.11.0 version is really newer than 0.11.0.3, so please don't
-# update 0.11.0.3 even if release-monitoring.org claims it's a newer
+# This 1.0.0 version is really newer than 1.0.0.12, so please don't
+# update 1.0.0 even if release-monitoring.org claims it's a newer
 # version.
-LIBZENOH_PICO_VERSION = 0.11.0
+LIBZENOH_PICO_VERSION = 1.0.0
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
