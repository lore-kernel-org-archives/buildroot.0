Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B9C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451B284527;
	Fri, 12 Jul 2024 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6b4piD39fRbV; Fri, 12 Jul 2024 19:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80127841A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80127841A7;
	Fri, 12 Jul 2024 19:52:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 546F81BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDE8B6064A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xp-h_xGMfHIO for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e1a::70a;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D81F60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D81F60655
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::70a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D81F60655
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+Mc+h91dM5C/xHnfZdjWr0qzmfWifOgluwlNyJ/Bv5RPnfoZ3koo0QgYUvmOJ+BOFS5Sq177UkTD9x1n79SGS60Iw5ntxpzcYyOGVQfxAOFjkCcfU+/xctHILlvdVTtIFz6NnDuq42our98E/+KGhT2+M4an6IkguAdw4tRX5EPpH6ROYAo5ggWyPBT7zmO2Zj2Hlju2kNfjHOl9vBwDrxAmxZRRiohKtUsojSNhO+hogHhZ9etsejAqTJxuldOzpO+O0T2XeppjZd9T9CRTa7V3t5DTb8XraIP2tmUqtf7q4oa2ZwlGJrkid1AwYpjF0fX2A+lqCIALL9A8SYCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzJI9K7bfyQpLq4VTFALWDEEot+2aOSm84nTWqnx2TA=;
 b=V0V6ElTC33znwzcwjlJffmD15V/nSg+jm0bwHnrqqG7L2u4pQzRX9XxkapuB9GDUBP/vpWd5iOACp+fRdUZLZPDcJ3UyMorPCDaEUc2jSoLOudHLBiSwFzdq68uOXxsTbILd6MQojOndiy1vFCTG9KTbk/w8exmrBzvrZ6wEdE73dY1emtxmkrZ8/Kq/hkID1csMcWntIWCC7QjIDWsEtm1BAzfwUkeO4gO/pGQAiuaMhRgZvJ13dSbernhuIYKLIQLbMK/Wa5lBuyYcFL+CLVizGrOexwaA5AiKtG7//XBZDu6IO+gxpWxTt/l4cHkXrMDFs1fGOFrUc1zecCBFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rtone.fr; dmarc=pass action=none header.from=rtone.fr;
 dkim=pass header.d=rtone.fr; arc=none
Received: from AS1PR07MB8902.eurprd07.prod.outlook.com (2603:10a6:20b:47e::6)
 by AS8PR07MB8341.eurprd07.prod.outlook.com (2603:10a6:20b:440::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.8; Fri, 12 Jul
 2024 19:52:05 +0000
Received: from AS1PR07MB8902.eurprd07.prod.outlook.com
 ([fe80::24e9:651d:fd3d:9ca5]) by AS1PR07MB8902.eurprd07.prod.outlook.com
 ([fe80::24e9:651d:fd3d:9ca5%4]) with mapi id 15.20.7784.009; Fri, 12 Jul 2024
 19:52:05 +0000
From: Gael PORTAY <gael.portay@rtone.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version to
 v1.20240529
Thread-Index: AQHaxDLu9E1l0Blby02DoBXulSGRNbHSwYAAgAPLmmWAHL+ngIAAPaKn
Date: Fri, 12 Jul 2024 19:52:05 +0000
Message-ID: <DB9PR07MB8893F42BE2C4D474E9C3613C82A62@DB9PR07MB8893.eurprd07.prod.outlook.com>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <0f36a666-274b-4980-aa08-e738f0fccb79@mind.be>
 <DB9PR07MB9104EEDA904AF785C1A5205182D42@DB9PR07MB9104.eurprd07.prod.outlook.com>
 <20240712164837.214641d2@windsurf>
In-Reply-To: <20240712164837.214641d2@windsurf>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR07MB8902:EE_|AS8PR07MB8341:EE_
x-ms-office365-filtering-correlation-id: 0191ce1a-b18e-40ee-3f67-08dca2ac1b49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?V8Z8TaWeyelYiLd/NuTJxhc0hxFRcaui2Y1DPQ1lN+TTVvJ1e/rGCc+Dki?=
 =?iso-8859-1?Q?3TPBZMAsuYVq6zxbyLYT91GNffiMvYfWVgGc4tIXSxWSxHKe4CzDTfZhao?=
 =?iso-8859-1?Q?/zIIEIMuidGLRFToDNi3aFtHlDDqkjPbM53clZhms4U9NC4OCcE6Db2mM8?=
 =?iso-8859-1?Q?VySmGrPdFym4w/aMifEYFgcHPh3qXG7GHS6MNjto+jCSviPXe12oIWRFVe?=
 =?iso-8859-1?Q?jDLzRujxwUy5M1St3iKg06kD+a/2i6SvHO//5Obr8iYCtVr+Hjhlk/Cy1a?=
 =?iso-8859-1?Q?OobpoJGNQkGpL5cG4O3yGl53P8aLwJidYspRYCKNTKQJRaVL+kO/ntqpsC?=
 =?iso-8859-1?Q?YOMJFrrzmweiwbmrZVw4ShGS9iRpisHmjYiCEroTV+6uubmtkAYMFMFRw1?=
 =?iso-8859-1?Q?mnD3mfDIcpv2dgtMazaKdTo+WOtK4vVsdz7yg7D7fLRilNh9DGmz1XGfYQ?=
 =?iso-8859-1?Q?5c1PhORUp/HjTPJFKAR0Fec5O358bBrho4l88kvVUEf3BaqKJRJF1wIi/z?=
 =?iso-8859-1?Q?nS1wNQx/2w7kg2haN67o4AQBOFVxWOW/b42GsmPy2cnTTpcQHc/y8Chnai?=
 =?iso-8859-1?Q?4uH7lm7ua6KvJgC6aWgnr58D3y6eXe7oFvxRzKOnbcUVImdY+ZYHYxp6K/?=
 =?iso-8859-1?Q?OFh+yi0yl9Qws+xf6eSt8quFt3NycRu9u8gSuT8+/gc1LsZQnRsAb/olwC?=
 =?iso-8859-1?Q?gAqXoW3go9SEkrqDUgFFatTEhZGbehDma9nLLJFEXXNFxa6kp6y8rwtLXu?=
 =?iso-8859-1?Q?cXzri5K+aXUD7MDe8o/fxlJLKfKRfaiIcatr6K9zwzZxX+R/fkngw1hSHP?=
 =?iso-8859-1?Q?jvBfnbmo7PKKofOhoBAeYTvI9ontrXbOvDvR2dle68Y7uKgpBsOXLndGXr?=
 =?iso-8859-1?Q?wWqk+/M9EWU7N+w699IURQY2uNktamm9zM+tfQPqk07RRDUSt+bYbxkXSw?=
 =?iso-8859-1?Q?P+Z3CDnFLoYR8fxfgdejCNJGKNmeUg0HyXpRGRtMjMhtJZNjxhVURtIufd?=
 =?iso-8859-1?Q?mSZLRTPfcOpj/DakvgQj3OgvO0SEZo+E3ZKAnWW3KTVn4eGG5EMjbiZZw6?=
 =?iso-8859-1?Q?T4h1s1Rvz5bGfDasGw9+82b+Sa/OdgxEDKGG9aNb1ckWM4oGEn/3C8v0+0?=
 =?iso-8859-1?Q?E7nGAgYWbMlGYFg7MpkOlw9YViBgRS8LE8jJQ2hpYYPHrlkIoQ5FihlUHe?=
 =?iso-8859-1?Q?gm8Xi8txqXejfB53Gu4HWVq8m0GAFGpFlJnFH88bDczWLF/rI2+BXU7yLJ?=
 =?iso-8859-1?Q?/VWKovdw5gMcr9mZZ5hPAs3mBe2pH8DVwgbodM36Grfp3SjlEOQ8IQIGZ0?=
 =?iso-8859-1?Q?fEmUmOqeuyuK6784dRWqOuRCZWnlggSHdI557ZDZsv8ZWcLNpEZXZHWtqr?=
 =?iso-8859-1?Q?RcG+YO4ZN8pjRVEZnvIMenrDJWYi7YUg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1PR07MB8902.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FI8a/WnMuUayQXHESVCkrVWND+btX+4uuPtJpIRuQTvtsNHbv81TYAv7Nq?=
 =?iso-8859-1?Q?R6Mr8MDvB8CCp0hOTFoAxYxAzbE8aoCGl6UF4WSh2ogcu9bwk95RBwAhfz?=
 =?iso-8859-1?Q?NVzHHCmP2pU+6AbOwqfNSsGgfeGH3nwVT3rag/D6nVJURnsIHgDbGrTvUo?=
 =?iso-8859-1?Q?TWgyRXKD+Av2z/24DAPsWYb1ynPslMD4ohsXYsspo/qzO8o2PqU3Iwv2BN?=
 =?iso-8859-1?Q?O+KVd6Oc+Ez+vL5W9FahI82A9dgnIfC9zX2yzxPYK/5JuXMrcPOOjEaMDa?=
 =?iso-8859-1?Q?AUnQ4D/aB08donfIMhBuhAWdhJtDS4qKoUWecTr+nTKUZBYYvZocZMMxSH?=
 =?iso-8859-1?Q?r0/yrvRrHV+khlplhkY+pdD4SsRsxr85/p47UoPCfIOO42PLWIWicqU4Uv?=
 =?iso-8859-1?Q?nRCBaK7ZLepoCKxraGStd1Mxiov2WAbZM/n/Sqvu44AMt4X3v5fiLfFH4V?=
 =?iso-8859-1?Q?SZgQVBWLFsGcxP+uQIJydNKC5Y0lvnYVHH11NAwIMefIbFFxgxKO8v5pi2?=
 =?iso-8859-1?Q?CcEVjIFezDNkIIXMVEl17SHIIGOmQTqJ2VZNVrlxEZ1mz+SkRaWY5mT7x3?=
 =?iso-8859-1?Q?3y3VQrlNQrUYkAm2arP74ECZZvnVV1V+NhGE81MdEnso4AX2xaHUzDHyEI?=
 =?iso-8859-1?Q?25/jJZCmah6Khv7sBb4fgVtyHkLG+TlDo2GmRXpwJ9Z9a0D3tEoYJvRb1i?=
 =?iso-8859-1?Q?0i2gGUPhqabAJCumHS/3ADGpJT36C6tNsHQqNIj6AaLgrYxigagssK/SGT?=
 =?iso-8859-1?Q?ZLodxfDIUmi2jN9BMe20PUph6ctohQERSBySkaalFGqE1PkM4ioYmgIDl8?=
 =?iso-8859-1?Q?uccxqIFjyLe0mrmzVFmNI/CJZcbwBMYXnASomZJYSCwJgj7TaEWvCj6ao3?=
 =?iso-8859-1?Q?L4CaDGk6XLtzg2ZSJmY60b2qBJmczAfdJnhb357mbWBb0FuEVub99qmVKm?=
 =?iso-8859-1?Q?E/kg4BzC+Urixjo27Bn5YNFlelQBSf/xT8s9GDCE9MrZM9XonCVEgkk586?=
 =?iso-8859-1?Q?7keuthw0aPAzIJdJYLjnC9aECkCCVtROPNEBbCTTJC93VCAco7toEFg9u+?=
 =?iso-8859-1?Q?usyxbsqQ2Nvq+2nqBa0xE3JlC4qinNokg6Y87IJmr/LLBYtBwXw5Qwus1Z?=
 =?iso-8859-1?Q?q99C/7gfUYDYiNeo396vKYQRxtqx9bT9wG0sV8iKmK7wks2uC9Gj6QTN6A?=
 =?iso-8859-1?Q?l03fsNhzm1WLBY6/Gq+GkQo0WGJxevoKeo11rFKvdGSo5YwDsaER9pessx?=
 =?iso-8859-1?Q?FjpZS2ZzARVlgqSowBG3A6dxypLps6TjHLow70XHkzrFXyB4+A0/9N8JTz?=
 =?iso-8859-1?Q?TSVSE4A895R7NaNz3fYCZ81IN3Q7nBFyQsh+6mVQkyiyo618LLor8fqQvA?=
 =?iso-8859-1?Q?qw74a1L1xBpwPeLkyhcOdZZ3jDjWg5TVMHnwtvCqWTjzfkTNK4Kvn+nawL?=
 =?iso-8859-1?Q?PkCBklEImjZe3tBO5GOiJJcFp/nLfMJBIt6O/QJnTV70cWKx78OwcGcHPm?=
 =?iso-8859-1?Q?0R9j2YYfTFF9Q5EH2B/pL8wf1fkZBipwSa1cWNlivk/LZ5Y3IqRApuMgMf?=
 =?iso-8859-1?Q?qZUD6ItvHperr3gM7AjixKrTdpty0HwsQwyewD3CAJvg5cCEspmQo1Vou8?=
 =?iso-8859-1?Q?WWZBKNlyCVOMs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rtone.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR07MB8902.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191ce1a-b18e-40ee-3f67-08dca2ac1b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 19:52:05.5217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3fe99b51-e7b8-4586-ac15-d51c0df4d4a4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZGtK2jpjqEHoGB8DZYV0D4HZ2JnWPSh0igARlx9UvfeeARp4gJBccmhfVj/WxbdLOFmrRe6JO2W4K1LibTWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8341
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=houseofhr.onmicrosoft.com; s=selector2-houseofhr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzJI9K7bfyQpLq4VTFALWDEEot+2aOSm84nTWqnx2TA=;
 b=fj+VkaH00Xr7l3ji57WhLiT+GsNeSCFpno3atSsaSMlBnPeGbJUTFIFdw3yslCqEkwl8n32AidZp6nBnycA3A+7xahkzdJ2hWH4zE6+ceFrY279oM2ohKyELgtvb+xacBeGuhCuOvXSjDqyZ99gk7v2NqAeqJZrb326gAJwI9ou82O96oVMnDB79Jjjnu43AICEanqqR2rph2oMTYSY+tIQ/IJINlE3WrKdmdPwfLY4SttFNxORIYvCLWLzpsJLl8WyuX5aNM78CotabAJiOy/Iagxph9uAqN9LbWoGPzgQhKh+NcuzedRVkI18L79Kny6pTAuB0UaiRlsQ8c6S4nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=houseofhr.onmicrosoft.com
 header.i=@houseofhr.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-houseofhr-onmicrosoft-com header.b=fj+VkaH0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rtone.fr;
Subject: Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version
 to v1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

> ________________________________________
> De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Envoy=E9 : vendredi 12 juillet 2024 16:48
> =C0 : Gael PORTAY
> Cc : Athaariq Ardhiansyah; buildroot@buildroot.org; Arnout Vandecappelle;=
 Martin Bark; Fiona Klute; Mahyar Koshkouei
> Objet : Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version=
 to v1.20240529
>
> Attention: Il s'agit d'un courriel externe et pourrait =EAtre malveillant=
. Veuillez v=E9rifier que vous reconnaissez l'adresse e-mail avant d'ouvrir=
 les liens ou pi=E8ces jointes.
>
>
> Hello,
>
> On Mon, 24 Jun 2024 08:31:57 +0000
> Gael PORTAY <gael.portay@rtone.fr> wrote:
>
> > [I hope I am not responding in HTML, I have no choice but to use a new =
e-mail since today].
>
> Argh, your HTML e-mail is a mess.
>

The good new it the
> > Arnout, I agree, that symbol is unneeded.
> >
> > However, BR requires that package to install the device-tree to boot
> > the system because of the device-trees and device-tree overlays.
>
> Apparently, not in the case of RPi5, because the patch from Athaariq
> has:
>
> +BR2_PACKAGE_RPI_FIRMWARE=3Dy
> +BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5=3Dy
> +BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE=3D"board/raspberrypi5/config_5.txt"
>
> so neither BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS nor
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS are enabled. Therefore
> the rpi-firmware package does not install DTBs or DTBOs.
>

> > And I agree, there is possible work to get rid of that package for
> > pi5.
> >
> > BR could provides its own bare minimal config.txt for every pi, it
> > can be overriden by menuconfig.
> >
> > Also, I have that attempt to install the dtb and dtbo from the kernel
> > package instead of using the ones from the rpi-firmware package.
> >
> > https://patchwork.ozlabs.org/project/buildroot/patch/20240412140945.162=
6579-2-gael.portay@rtone.fr/
>
> OK, but for the time being, I wouldn't mind to see a RPi 5
> configuration merged that works in the current setup. Then we can
> improve later on. We really want to have a RPi5 configuration in
> Buildroot soon.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com/

Ga=EBl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
