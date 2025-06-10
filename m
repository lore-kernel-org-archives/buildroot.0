Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB35DC5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 02:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370B26085A;
	Tue, 10 Jun 2025 02:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXzQZqZ4hnw2; Tue, 10 Jun 2025 02:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A17A7614F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17A7614F0;
	Tue, 10 Jun 2025 02:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA321F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 02:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 379F441E92
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 02:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ciDvsziBj8T for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 02:58:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::2;
 helo=ma0pr01cu012.outbound.protection.outlook.com;
 envelope-from=sunilkumar.dora@blackfigtech.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C90E641ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90E641ED6
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C90E641ED6
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 02:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFtvgHEAwPlWGGwCdc7Q/NVPdBYUHDWpDJlPs7whtSu5o4To6p+gqXDCdPXoiGqBk8nWGuu6wh7zhLtn6f0QvfVwAH34EUrz+n43ZkTWx/+UGH/WtZ+L5zmYnI6qYLMV5qubA4rxu8uVvrcsQBgZyVYvyKMJ83xZqU5ZSfA6q3WPtTdqJw2z8hPBhAPgpfQYZiPFNX2gcl9qs+FK49DmjqayMP1uOWNiX/dRK0HZfrUsGQppBeZtj8KgtkDZTNM+uRSo9xlw95L7w15PRVI7o/0tbt1GCeYQ5Vg4FJFIAYJaoDmsM0gS1LXbJ1YW2vopX/eDNUFyTb5VqzJiSWImBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA0gj2Xt2SdKCOU48HGYZdTFz9Im4NvOW+LMjQ3bSpI=;
 b=tMNs0zxCf0tbIyWTjxvTLXOKBCcT4lUWTrmwSsEgoF9m8ZZgZgkpBesehWWyWKWhB0byFCqAQrhIaXjSjTfDaRVJ3jCF7+D7E67iHu/lUjyF9OkMVia3YCx/c+Fiicnf5m5+1YFS9j+R9/aC9HyvFtgIGpbxO4TXjt+f0BeyJN8J+oVS3inueY8XV7ARB4VWHd6irKLWyQA0JtdY8eyCUVIcYgr2o6/N6+Yly8m+gVTEAN3RxgvNv2FnBsJxcdR+s/M5wR68SkDw4rnlEuP4qJlJicaGgbrXMBQ9vDQBpRu3gIJte+jOVhy2lETq/zp9LmkHPh+zrrEqXJNxcg9hkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blackfigtech.com; dmarc=pass action=none
 header.from=blackfigtech.com; dkim=pass header.d=blackfigtech.com; arc=none
Received: from MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:88::11)
 by MA0PR01MB10171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 02:57:53 +0000
Received: from MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::911e:5414:4fd9:9354]) by MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::911e:5414:4fd9:9354%6]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 02:57:53 +0000
From: Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>
To: Baruch Siach <baruch@tkos.co.il>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: EXTERNAL-Re: [Buildroot] [Question] -- Inquiry: GCC's
 -Wpoison-system-directories in Buildroot
Thread-Index: AQHb2WTaLCNGH3FD6EeTrGYNWMTswbP7HKadgACV4J0=
Date: Tue, 10 Jun 2025 02:57:53 +0000
Message-ID: <MAZPR01MB83717C749CFCEBC3CA78E91A9B6AA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
References: <MAZPR01MB837141FB4F42F5F5EA84F1F29B6BA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
 <87bjqwx0j5.fsf@tarshish>
In-Reply-To: <87bjqwx0j5.fsf@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8371:EE_|MA0PR01MB10171:EE_
x-ms-office365-filtering-correlation-id: 9251edf0-e5e8-41d3-d28c-08dda7ca982b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3613699012|38070700018|8096899003|7053199007|13003099007;
x-microsoft-antispam-message-info: =?Windows-1252?Q?z95HCHEg8fajFYb64VWH7d0ye/vfcx66pbHTzoECrOpmQbr+J9l6U4S1?=
 =?Windows-1252?Q?Zb2LYGng1lW4aYcW9jbT84I5xaYNUUJ4tp3ILLtu0M6exXK+pyvPaVFM?=
 =?Windows-1252?Q?XDucB0ldgmcPQ41s1z/1OoOfSCdltE7MnZ7zv/IMOtBZUKcvA5rMtQwX?=
 =?Windows-1252?Q?AMfno/DSInQ+sslRr+efwgx9V59Y5vVfbP+50zTFrBuML7NDneyCxmmJ?=
 =?Windows-1252?Q?B1F01QB3TrpiUdCvjRRucjaLab1V1Z9NHpxaqVF3nG25ztIzmEe1KAnk?=
 =?Windows-1252?Q?BES464o/TnqPx6T+DDGin8kp9G2UVguWC9tq2hUXlpGn+wDZzwbWddNc?=
 =?Windows-1252?Q?2+1t4N+gtyDOh3qGt3ex+HiDaRPq9KoO7WW0wEQCiroOqldlfjl9OPnE?=
 =?Windows-1252?Q?Voh8qbNELLFkcV0jjjCxF6KqiSjLDjWskJG4EEkhZCk3LUxxL43zxNOs?=
 =?Windows-1252?Q?SmCE25WFf38XsMV/K06o/+qsqKZ7pudOoYzYLfHoggGjnfvv5sG7ssEb?=
 =?Windows-1252?Q?UwlFCCNmvM8nJBxb+y6GI04waD3IWG4ksGwAB9Ihurqy5gA52xWw9iNz?=
 =?Windows-1252?Q?estvi5VwYV5vOPFN/Q3kd3bQh5+ZBU3Q5wMzJH4FXQIy20WNYyxH96cX?=
 =?Windows-1252?Q?ZfZ2KzrhEBxhrPDQorZ3No+hu2RnSvgByurTs1hB5HquDNhgy5J30go9?=
 =?Windows-1252?Q?nL0YyKUtfHgqd3usHfDL6/KTXl7uyKYIw3SWus2BOkiCmha0naQmz2i5?=
 =?Windows-1252?Q?nhNSBJZnUQHRfFmWhLnR6xPTC932WZY9a3r1W5/HT9SOkDhcvXtm0ibT?=
 =?Windows-1252?Q?ZEuTxIX3jV07G53CdzH2TYeZytIaw4qp5MRyqiNBqROyJ/HKwnwTA2wL?=
 =?Windows-1252?Q?acPvX26i4BYk7QRW1xh0v2IC/RrOiIi4umctFye/rV3Cb/bAnTdeh6gr?=
 =?Windows-1252?Q?WWVVuoqr65kjzGGVoDDn+j4Cs93bP6mWsf7y6Gjmaudyq7Y4Z01bbUY4?=
 =?Windows-1252?Q?8Ih16wyv4n/9qqznp17sAEbl/JGY7OeR5BMK+IquugZ3dowcOhxwJS6A?=
 =?Windows-1252?Q?cLrWF06SElgwBKCyvIgvBOemrvm9BMAjGsEJXE/+HFFPuRiAZlX11g19?=
 =?Windows-1252?Q?Vt1hqviC+6EoP0oG9IUz/xnlEjH68vPzxGf4i6+OgaLZx+9jivR1B4hw?=
 =?Windows-1252?Q?S2ZC041Go5+U3nKXo5yKP+CnKBXHF8+xkoJZ3wHLw4ksiFzLcrCLQcOZ?=
 =?Windows-1252?Q?uyE3IXfR5DvBuZ3jZGDli6VxfLbiPy/dMiGNTZvwjYTmdUidfy0FOsoQ?=
 =?Windows-1252?Q?pe33bICJtpINDEWLtxgtd24qqeQl9+hERmoL1jHgWqxIbVMEL+Tl7RXJ?=
 =?Windows-1252?Q?bXp29pi/x6Y0uUYpeSniOwF1IkbYg9142QD1a9hDd7tRICmFYUcEp/XY?=
 =?Windows-1252?Q?P435sVhLu0ScH6DIj8R4Po7drpG5zsD5rvS2k0BsZzNjyOb8A0VnbTLX?=
 =?Windows-1252?Q?RZtFp9910VDh2zETUSjcfSZ2gkkh6EIc7DAw1UhGjf930b2YMsaiDEF7?=
 =?Windows-1252?Q?m8qh8t1JSMnfGjVw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3613699012)(38070700018)(8096899003)(7053199007)(13003099007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?LZoK/X+BsH6mVcik2/HaR1/y9VvfNOPFvKMNyjX8u1xK/XiEBQTa2x1F?=
 =?Windows-1252?Q?pvStkQNOY7ibwwxjsy0UDBc1BCui0g066ej+V+pJcouM0oHwAmjwe0oe?=
 =?Windows-1252?Q?BTfYlybmECeswHpwEgOZ2rOokbxQakTtgbdif9qAu585cxrP7lcsjszG?=
 =?Windows-1252?Q?Gm/jozG/c1jMjmJM6ytQ0FXVq8u/5+cwHUo+rCljgm5k06QCJaxBbPC9?=
 =?Windows-1252?Q?HUZnpM5B1mIAhZY3SoHnY3lIhzg5eB+cr4W9p192xizVsmqDtCuQxt1/?=
 =?Windows-1252?Q?UtGWrb4ZdPiE1kcE8lofIh/h2Pn6hv2WAyhKQAH7BMdUl/cLBP4GOYcP?=
 =?Windows-1252?Q?85AYiWQyjX+2AStKLe6VE4IAHTemBjcH6yu6fMoqaP8Raj/wmtvaGo2E?=
 =?Windows-1252?Q?VDTYhatIjhFnht5Y3vr6MesNVfJ/kFyXgD5vp2ICEQeMcwXlK/1bNcOY?=
 =?Windows-1252?Q?AQZ7Lu8PrV/3hU0TCpk+QPJSo4oqmMi6Yi2hGO+CMOBvNTZsbEuttMCq?=
 =?Windows-1252?Q?3DSVGvlRztcMmQ/jpjRG0Q/LSPMZyozezBbj1WvahSqX3fouZ45JZYgh?=
 =?Windows-1252?Q?gTXDh6bYJU45s3LvzBzL5jX0F2Zyl+lCkHCXv8pmDFC/T/Ou0TS+R8ME?=
 =?Windows-1252?Q?1StsgwkxUR9HhTVjAZN4DWgOmoRKj8Qd03MdPsOSawZMVhNZcxabFos6?=
 =?Windows-1252?Q?CKolwnRpNDvaOy/ABGs+ED814vzVwdL8PEsV6lP/4RUe2Q2PvrsQY837?=
 =?Windows-1252?Q?bjeO9kjSBBknaNFjIAkAV0+L913CZ6jocenfBKl8HQ/h0XXS+IpDM1MK?=
 =?Windows-1252?Q?aTzhOayG9e8KyKXAnSiRBJajPKSsPjkrDdE2jwupQMq0p8Kk7wpORDEq?=
 =?Windows-1252?Q?0kFGhzxp6vkObArnRx5Vxz7IIR/A23XA0hVsIlV5uygLwhaf+epr2Trg?=
 =?Windows-1252?Q?mENjOf12ShRRDSao8OEfgNnqr964h22Re3uFkj3872DW6ssLGdBr/Fg1?=
 =?Windows-1252?Q?5+X629fH6tOKJ4r0tiLsvsS97SwWQ4sz4BsOSeHgoZK601bs3CuZa1t0?=
 =?Windows-1252?Q?MJh4t/58Sxbpnly7EM9Qzj8igGVLv+ZXPjHkbdvw+NMPtE1V7msnZGRo?=
 =?Windows-1252?Q?XjpiARCVbMSq2rXJmMYndkLZPvR4dbF/fd6JzB8E0qFkgLv5GEGfyiy5?=
 =?Windows-1252?Q?d2LV/TXSwiWug9SEeCytL2qF8u/otyudXh+Zc/tDjU2t9diHdfdZMzFQ?=
 =?Windows-1252?Q?vLuyRQ76XeJ0O1lZgCQG61xfE8JZz68x+cFkckergjTwT25K9DMYeP3R?=
 =?Windows-1252?Q?eYDDe08tSQ4MzKmXAYECVnbDmc3xwHYi+EmxnHVNHAEbvJHkSbCQ2/nW?=
 =?Windows-1252?Q?Kp1e8HXEP+G6kImacEBPmyLncWAmPvNjPRmu/dsMsqR+p8vZXfaIE1z9?=
 =?Windows-1252?Q?xhmUx7jn+1NTnM5z0LXkasHNUCLcJHwaWg0y1wzWW8VQy05yKmQML9mm?=
 =?Windows-1252?Q?SM7hqgkyGPD6KwnDhd34azSMPnzsAHsidgqIHvtiEm72UYe6VTgPIxLm?=
 =?Windows-1252?Q?msMsDN5SbVwyIwJODIUdDJIi6DCxQueIT5CD6a4LqUhsLmelSs/fACBb?=
 =?Windows-1252?Q?LpxFcl9X8urqBHlWA6+RTFt9C0fD/rhI6MSvi1vMommYDOzIb7AF9+Jp?=
 =?Windows-1252?Q?qhX1iHPCFQpTlypemQvPZDy++8s1WkiXC9aNNahm+LLQzEjmRrwsdA?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: blackfigtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9251edf0-e5e8-41d3-d28c-08dda7ca982b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 02:57:53.4460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75dd016f-4b86-42d9-9a4d-6df5b9790019
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ujrtzh1pH5pXScqmYXd125IVRbJ89R4q5K6ZkId9/MlZRlWCudV+ybJYSEoYr1zCM2aS4hrJzmNreJE782UAQ5OMgkxBFKO23hgbPpwAI5ldOfN/qArcPYYZj8NvgyIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10171
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackfig.onmicrosoft.com; s=selector2-blackfig-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA0gj2Xt2SdKCOU48HGYZdTFz9Im4NvOW+LMjQ3bSpI=;
 b=hY48jL37yYByEKq/K6dSQ1q8Epp8ZP+CfcB9d9p8WjCs7gAVfclp04zZ2uz2y4MSjpZClsYgbg7VI2QEI0eS09AXZxR11rz1x6YEk6DqMJHzJwDIBnPDhowsiYcAlu5n8YST3d+8HE6rsYL9UMT9m7s+FU81nMEFp6fOgOzdJ7c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blackfigtech.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=blackfig.onmicrosoft.com
 header.i=@blackfig.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-blackfig-onmicrosoft-com header.b=hY48jL37
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=blackfigtech.com;
Subject: Re: [Buildroot] EXTERNAL-Re: [Question] -- Inquiry: GCC's
 -Wpoison-system-directories in Buildroot
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
Content-Type: multipart/mixed; boundary="===============5724944441423230993=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5724944441423230993==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB83717C749CFCEBC3CA78E91A9B6AAMAZPR01MB8371INDP_"

--_000_MAZPR01MB83717C749CFCEBC3CA78E91A9B6AAMAZPR01MB8371INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank you, Baruch for the update.

The current poison-system-directories patch in Binutils effectively blocks =
unsafe library paths (via -L flags), but cross-compilation safety also depe=
nds on preventing accidental use of host headers (via -I flags). Since Buil=
droot doesn=92t patch GCC to warn about -I paths to directories like /usr/i=
nclude, this leaves a potential gap:

Risk: Projects might still pick up host headers during compilation, leading=
 to subtle breaks.
Comparison: Yocto addresses this by patching both GCC (for -I) and Binutils=
 (for -L).

Questions:
Is this intentional (e.g., deemed unnecessary for typical Buildroot use cas=
es)?
Would a GCC patch for -I paths align with Buildroot=92s goals?
Am I missing any existing mechanisms (e.g., environment variables, wrapper =
scripts) that mitigate this?

Thanks,
Sunil Dora
________________________________
From: buildroot <buildroot-bounces@buildroot.org> on behalf of Baruch Siach=
 via buildroot <buildroot@buildroot.org>
Sent: Monday, June 9, 2025 11:25 PM
To: Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>
Subject: EXTERNAL-Re: [Buildroot] [Question] -- Inquiry: GCC's -Wpoison-sys=
tem-directories in Buildroot

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


Hi Sunil Kumar,

On Mon, Jun 09 2025, Sunil Kumar Dora wrote:
> I noticed that GCC once had a `-Wpoison-system-directories` flag to
> warn about unsafe system include paths, but it seems absent in modern
> GCC. Does Buildroot apply any patches to handle this case (e.g.,
> preventing accidental mixing of system and local headers)? If not, is
> there a recommended alternative for embedded builds?

This is a binutils patch that Buildroot applies to its toolchaind:

  https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblob%2Fmaster%2Fpackage%2Fbinutils%=
2F2.44%2F0002-poison-system-directories.patch&data=3D05%7C02%7Csunilkumar.d=
ora%40blackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d=
99a4d6df5b9790019%7C0%7C0%7C638850885432217898%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DMOYMBxa7Qt7dkj3kf3Rkmfewgv5bBJsOMQnZI2om=
QxQ%3D&reserved=3D0<https://gitlab.com/buildroot.org/buildroot/-/blob/maste=
r/package/binutils/2.44/0002-poison-system-directories.patch>

baruch

--
                                                     ~. .~   Tk Open System=
s
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, https://ind01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.tkos.co.il%2F&data=3D05%7C02%7C=
sunilkumar.dora%40blackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75d=
d016f4b8642d99a4d6df5b9790019%7C0%7C0%7C638850885432242858%7CUnknown%7CTWFp=
bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjo=
iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DPjqW7n6fUT8hn%2FYw3EOAZy4%2F=
5T66O4HUzW9UQjrjgR4%3D&reserved=3D0<http://www.tkos.co.il/> -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.b=
uildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&data=3D05%7C02%7Csunilkumar.d=
ora%40blackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d=
99a4d6df5b9790019%7C0%7C0%7C638850885432255555%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DVE%2BHwNQgR8%2Ft1hr1t055jmANb6gQ6IlrmPxA=
rfg25BQ%3D&reserved=3D0<https://lists.buildroot.org/mailman/listinfo/buildr=
oot>

--_000_MAZPR01MB83717C749CFCEBC3CA78E91A9B6AAMAZPR01MB8371INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thank you, Baruch for the update.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The current poison-system-directories patch in Binutils effectively blocks =
unsafe library paths (via -L flags), but cross-compilation safety also depe=
nds on preventing accidental use of host headers (via -I flags). Since Buil=
droot doesn=92t patch GCC to warn
 about -I paths to directories like /usr/include, this leaves a potential g=
ap:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Risk</b>: Projects might still pick up host headers during compilation, =
leading to subtle breaks.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Comparison</b>: Yocto addresses this by patching both GCC (for -I) and B=
inutils (for -L).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Questions:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Is this intentional (e.g., deemed unnecessary for typical Buildroot use cas=
es)?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Would a GCC patch for -I paths align with Buildroot=92s goals?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Am I missing any existing mechanisms</b>&nbsp;(e.g., environment variabl=
es, wrapper scripts) that mitigate this?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sunil Dora</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> buildroot &lt;buildro=
ot-bounces@buildroot.org&gt; on behalf of Baruch Siach via buildroot &lt;bu=
ildroot@buildroot.org&gt;<br>
<b>Sent:</b> Monday, June 9, 2025 11:25 PM<br>
<b>To:</b> Sunil Kumar Dora &lt;sunilkumar.dora@blackfigtech.com&gt;<br>
<b>Cc:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Subject:</b> EXTERNAL-Re: [Buildroot] [Question] -- Inquiry: GCC's -Wpoi=
son-system-directories in Buildroot</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email originated from outside of the=
 organization. Do not click links or open attachments unless you recognize =
the sender and know the content is safe.<br>
<br>
<br>
Hi Sunil Kumar,<br>
<br>
On Mon, Jun 09 2025, Sunil Kumar Dora wrote:<br>
&gt; I noticed that GCC once had a `-Wpoison-system-directories` flag to<br=
>
&gt; warn about unsafe system include paths, but it seems absent in modern<=
br>
&gt; GCC. Does Buildroot apply any patches to handle this case (e.g.,<br>
&gt; preventing accidental mixing of system and local headers)? If not, is<=
br>
&gt; there a recommended alternative for embedded builds?<br>
<br>
This is a binutils patch that Buildroot applies to its toolchaind:<br>
<br>
&nbsp; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blob/master/=
package/binutils/2.44/0002-poison-system-directories.patch">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblob%2Fmaster%2Fpackage%2Fbinutils%2F=
2.44%2F0002-poison-system-directories.patch&amp;data=3D05%7C02%7Csunilkumar=
.dora%40blackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b864=
2d99a4d6df5b9790019%7C0%7C0%7C638850885432217898%7CUnknown%7CTWFpbGZsb3d8ey=
JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsI=
ldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DMOYMBxa7Qt7dkj3kf3Rkmfewgv5bBJsOMQ=
nZI2omQxQ%3D&amp;reserved=3D0</a><br>
<br>
baruch<br>
<br>
--<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ~. .~&nbsp;&nbsp; Tk Open Systems<br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
&nbsp;&nbsp; - baruch@tkos.co.il - tel: +972.52.368.4656, <a href=3D"http:/=
/www.tkos.co.il/">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.tkos=
.co.il%2F&amp;data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.com%7C4c63491=
04c1543a8fd7608dda77ed77b%7C75dd016f4b8642d99a4d6df5b9790019%7C0%7C0%7C6388=
50885432242858%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAu=
MDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;s=
data=3DPjqW7n6fUT8hn%2FYw3EOAZy4%2F5T66O4HUzW9UQjrjgR4%3D&amp;reserved=3D0<=
/a>
 -<br>
_______________________________________________<br>
buildroot mailing list<br>
buildroot@buildroot.org<br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">https://=
ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.buildroot=
.org%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=3D05%7C02%7Csunilkumar.dora%=
40blackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d99a4=
d6df5b9790019%7C0%7C0%7C638850885432255555%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0=
eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DVE%2BHwNQgR8%2Ft1hr1t055jmANb6gQ6IlrmPxA=
rfg25BQ%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MAZPR01MB83717C749CFCEBC3CA78E91A9B6AAMAZPR01MB8371INDP_--

--===============5724944441423230993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5724944441423230993==--
