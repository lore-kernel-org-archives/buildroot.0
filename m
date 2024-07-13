Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE02C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 07:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7DF400D0;
	Sat, 13 Jul 2024 07:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83I74k_IgPyj; Sat, 13 Jul 2024 07:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD0340175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD0340175;
	Sat, 13 Jul 2024 07:48:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F26E71BF5DA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 07:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC9A1845CC
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 07:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yB0szjRhh88 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 07:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2613::701;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8532D80FB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8532D80FB5
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::701])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8532D80FB5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zrf5x8mmXVP8kGeJY4hjpSSSwlcirzziN8lKdIypRJ8KSkxxn0/bAcGV8d88Su8R4hgcq/5cW9Z6M6lt2BNzkFhbL0/p3VlEwHtIcAp6OShwuilRwH8tfjbWWsyjWLBQi25fT8HY36HioKzSoCSz2jwYzKFtKUcq6XI4YQhB3mATs83PbmhzCC8+DkNqq4r5YzEBSq12yce8pGYKY273S4BQrDgpPwz96+Kx1InTtjLZcnS1Qv2OaKy6UlB8mMnWqKhheXGWFv0fEIn4T5jcpNr8YYr4rD6DzW67K+1Tta4WdjUC5I5e4PLLyFuVkv3sAWy7Glw1w2tp6GEr1lEhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sI8W3vXC+EGj49Z300AMrXsUavxcE7kg9GYluAjAljY=;
 b=kV99Z3DDggfYtOeM/msglHzd6Df+mda5k3i4WfJAntdWlGK/04JjGjGqhlFgj77T0HC6IsD887zsxoYawuZTV9ujgdDljaWz+nxp+UXcpFMMXbTXwhDvTtiEFfF6PHAgKVQK/qCvnWAPVYTfklMTX8CgbLhT1Gg9r38ENZBvQqI5Zyh81ApaVRza3q+doqexnjDZLqAUpIoTqGfETjVA0D4uIKE3Be0C3Zza2WqKl+W5cv4+VGOtCio7h055YV3YY7bvupAax884sME+gOsYoL3+SODNi+skSAU00PvTWyRQq6UvZzil7+7IWZh0Ei4+tEgxBdM3jXe0nzJPIXv5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rtone.fr; dmarc=pass action=none header.from=rtone.fr;
 dkim=pass header.d=rtone.fr; arc=none
Received: from AS1PR07MB8902.eurprd07.prod.outlook.com (2603:10a6:20b:47e::6)
 by DB8PR07MB6476.eurprd07.prod.outlook.com (2603:10a6:10:135::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.6; Sat, 13 Jul
 2024 07:47:58 +0000
Received: from AS1PR07MB8902.eurprd07.prod.outlook.com
 ([fe80::24e9:651d:fd3d:9ca5]) by AS1PR07MB8902.eurprd07.prod.outlook.com
 ([fe80::24e9:651d:fd3d:9ca5%4]) with mapi id 15.20.7784.009; Sat, 13 Jul 2024
 07:47:58 +0000
From: Gael PORTAY <gael.portay@rtone.fr>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 2/3] package/raspberrypi-usbboot: bump
 version to master (commit 4a3d311)
Thread-Index: AQHaxDLuWm0dA2s28UGXy6cyArhfTbHu+3GAgAJ2/wCAAvY6Rg==
Date: Sat, 13 Jul 2024 07:47:58 +0000
Message-ID: <AS1PR07MB890221440A8F4878F1EFCDB782A72@AS1PR07MB8902.eurprd07.prod.outlook.com>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <20240603230940.51746-2-foss@athaariq.my.id>
 <20240709225233.7e44e407@windsurf>
 <f52e97f3-5fcf-4f0b-98e7-af5bbe3d5d57@athaariq.my.id>
In-Reply-To: <f52e97f3-5fcf-4f0b-98e7-af5bbe3d5d57@athaariq.my.id>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR07MB8902:EE_|DB8PR07MB6476:EE_
x-ms-office365-filtering-correlation-id: f8c0258b-f277-49eb-2bbb-08dca3101d58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?XPb9MmmHsFG9AbdROD9pR+iath+WoObZVYfkp/5/5TO8D3XLUbhiJEaFjC?=
 =?iso-8859-1?Q?Z6p//p4yNe56CJ0fhBoqWvy5/bZrSoUMah38HTkX0ZaB3TmNlEzgLyqE+1?=
 =?iso-8859-1?Q?eN0CPjXcgSspmwbp4vexJaodQ1ugdARY625WpB6/wwvGBxrk5k5ZqrL5mj?=
 =?iso-8859-1?Q?H5Pg4dM4HeDKGK8rZl+ZuUxFNhB60rLblawQOYBj0TQnXlRPoaDSt7/Tx/?=
 =?iso-8859-1?Q?zME4VuZ9mIc16O92XgsiWWiX74eL46Te8hbDTGA+fDzJcHTqbMcmvSAwq7?=
 =?iso-8859-1?Q?WJA8mbr4DaAR5YSCCst3fIhBnBDK9UI3uyx5V6M2A60CfZrVviTzZ63wIw?=
 =?iso-8859-1?Q?ppE5toRTCDM9ZqL1GI4BKkrVLaNFuiO+HwV8HiMK1sQ5gwPem7VgDiExQH?=
 =?iso-8859-1?Q?5W9VoiNVE9sarSBxHXsVRWnXJb+FtAljCO9QzdSHEb1rGkxwuC8UtAt+84?=
 =?iso-8859-1?Q?jvAO7g0yKB4A0DJcCYo0JqBr4PSPf4XYhnoRggUdQUYzs+tJZpcGMhiwwF?=
 =?iso-8859-1?Q?L504A2Oplh45eMaqCA/46WaRvAcF3LtKrZstejK8P5y1XMo5IxILKIam65?=
 =?iso-8859-1?Q?cdhsr+m+6r1Ki6VmVL2tGKSV0LZrNcvYEFG3W5E4v993zDv+koY8XeVfJG?=
 =?iso-8859-1?Q?LsXI77Rof7heHg5w2tIW1OGbopx2GlNC0weVpz5Vm8kl/0WkHEpeGBmbpt?=
 =?iso-8859-1?Q?SNjXJAwybwVeU7OHoK5BtLqp6lxVgU1NT/aYhynGiYemCLmIRboJnkZh+l?=
 =?iso-8859-1?Q?vGhWljzej9yJpikeTkD7p2ilQMoXMq/t+JINd3UcfojzaMjoUOUScQ/pn7?=
 =?iso-8859-1?Q?I+SpYPDAMcRmR8cWnDpgnU3Lt67COYx5Gc/IYCgUzL72eFW9CoQ/B/D3LC?=
 =?iso-8859-1?Q?9YYc7cirSQ6LrqrfLHXu8iAweI6mxUDr6t34RhNer6crtSOa0x9l2Yanzi?=
 =?iso-8859-1?Q?V+Ep+/0QiEh90Ti7hOBGudY4vY/u+QduItV6d2vtEUIy3ZrlAGdu1qetmZ?=
 =?iso-8859-1?Q?ZcLTYMqzuGJDTb1Ke1HEylcPp1sfOsaD7flmI7V+6FACbRM73mjuYd9s2t?=
 =?iso-8859-1?Q?+mX1Bb0+S4en9/qduCK7hN2r0/9XZSp7tQw82RlxrOceKXcC7Kl5WQEV6t?=
 =?iso-8859-1?Q?4NXR/6BNDra6pCxNy3eU6Y7ufbr2u8gNhxf4GLTmQNHiCGWxypjvBJgidA?=
 =?iso-8859-1?Q?6jA8JFooXMKbvSKZcya3f8PoDWqMLEzz2l+o1qjoUAxn9y4etx/ZReBxgG?=
 =?iso-8859-1?Q?iFkT0CrgNBtjOdn1i6kDFjAurIvrBwXLyEgNL2h93PTyqquDkkgek+KdSe?=
 =?iso-8859-1?Q?BPV4ZYbG8LEZOFSGGwid7i4t0twewjlMfcJzbCvxvdWoy0KDAeFZkrlcaj?=
 =?iso-8859-1?Q?4L/7WSKHRNZVCSsWtrw6q5bxYVcdfuEItLfbT8Cq75uNqiylINvHE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1PR07MB8902.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uqbZdZnEKpph659mjpXy5koOSvFYRdaXr4FVswbeyFXhxCkl141Hj3IggV?=
 =?iso-8859-1?Q?MJ21hwRQev+zbkPbmcfxLYtx4igfIfT2fIfU52D2ENBdxj9ZZx8/lu46h8?=
 =?iso-8859-1?Q?PgicSMnGLw6XkS9kUoUO+jIUTaeNGjqhbtbqcegFFGnj4H2EEoKeoVyFm5?=
 =?iso-8859-1?Q?hWQZUvCZyNNrIIeuUvzkZaYOPwfMmt0QN6S4IQG/MjN9Z2VVmTSQGAz+Nc?=
 =?iso-8859-1?Q?vKEDn45NRomEvJCKocQ8D4cNL7dEKpJJTXSi537AH6gjNUMIKaRNrdGBgf?=
 =?iso-8859-1?Q?jyiExLLwuQYEjgZO/tkWeMrNBeep6a9cBctnSYZ8KiMi6cainBEho8CZYv?=
 =?iso-8859-1?Q?hz7HC/cXl8ANv4aY64T3TtCuqwSS7Q8b4kqQBHl5TJkVFsXBK3IQLg7nZm?=
 =?iso-8859-1?Q?zmm3L1xsOvHnzAzMvomUp9G1hjfyecFGGOX+0iq0ypF5RpFjHM7OlR2rjZ?=
 =?iso-8859-1?Q?5+E+aEBcmpwS/1vpsvl2SauOgs1MY6J6mYAMAS+cQOk7hbdUGZfRXoukbr?=
 =?iso-8859-1?Q?y5JgSmpgeFyEDRoWpgXIL+c6Ng2ChIfQ1a/y2hpcKSyPKKO9yXXhhqyrLF?=
 =?iso-8859-1?Q?SEq1k0+4ENaw8rHclJt75WKjyE5HfGRmGI5vcBM1uYD+ATI0MkfIL53p01?=
 =?iso-8859-1?Q?g/rEBLOst9zk9FxTWJgtukN8JzILvVctPNjSe4a/riNq7MnTqJwttN4GGm?=
 =?iso-8859-1?Q?Tj17/2MNROej6xwBErJ8Iiyuk3P/XATYSoxZz5LPvy7u18eLAyNhcYFVBA?=
 =?iso-8859-1?Q?HMtlSVlkvhIiO1u8AanqYowP0qY9PJh6LZjP104rTick2n7kYurWucaYqs?=
 =?iso-8859-1?Q?9HI+MU/8ds6C+Dp/zgtO+BP2nnB4tigu1RnZswQ0JzZNpbtCP9pRIMmjOM?=
 =?iso-8859-1?Q?tU7rWwMjAZIy6WfcYgHgnP2kjxGtFPL6N1+E/A2UdRTVB5hIMvRxa85PkB?=
 =?iso-8859-1?Q?l1utZBtcQuvoOI/ns4iFDafw0hVucM4KTQkiK3zq4cMupxbxwKtLeO9S5Q?=
 =?iso-8859-1?Q?+bSizr5nVdixT5pg4ecpMIiYn9V/OyFv+FPuQDQanI/OXkVF0X7jhFf8o7?=
 =?iso-8859-1?Q?r3DIWxjf/di3whBPZWP5s2xwrGs7FfRRi35f3CENI5qhbAUrdQMRemX+ZA?=
 =?iso-8859-1?Q?A0m8+36CGkjW3pJOjdYapJIYSKl5RudEfBc8Xc6mWUoVim1Ekhd763y01P?=
 =?iso-8859-1?Q?Q03EHvkTFLOgHVIhLu9c6UtZO3MRukLbkEnF5z+t1tMeZEVa6NbLhfC9me?=
 =?iso-8859-1?Q?o0cQs2Cgu3MQbXN3vbtfLdVZ6l4UcMbZZfetBotu4T/k/B4Gywqg7aZhcI?=
 =?iso-8859-1?Q?UR3QpA7J+He0tJYZp2pBye583coiXBS3v0jkEln+nBosHwX+dLUWCWbezU?=
 =?iso-8859-1?Q?Ayrjw+9wqt/E6hIs+2veNCXIcmavJgVa7ZKArWGCZkUj3zUc4IXRzuxjJ7?=
 =?iso-8859-1?Q?Di2r4bDulCBFCpUoFKajMk2Le0fV0j+jzq5ygldiIbqijzUo/0A6sGgqZH?=
 =?iso-8859-1?Q?0RqsB2/lKjXliXKlO44NZUCbXv/i9/gJ2eRLzxwADBb/l0nBd+Hldtjldj?=
 =?iso-8859-1?Q?855JTZ2iwIoMHhOd5BPiELMr+jwoGON+JfLxVCNn/uiKxTrsmI0avH54Z7?=
 =?iso-8859-1?Q?5pFhGt7G+8ors=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rtone.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR07MB8902.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c0258b-f277-49eb-2bbb-08dca3101d58
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2024 07:47:58.6299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3fe99b51-e7b8-4586-ac15-d51c0df4d4a4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20CY93mbMgQA/eGvGanYA+E5LE9u/miuzmSVdT9pL6gD6nIXWpyRLAkMKlfj51rkOOmFHBPCfYboATKvSeB9eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=houseofhr.onmicrosoft.com; s=selector2-houseofhr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sI8W3vXC+EGj49Z300AMrXsUavxcE7kg9GYluAjAljY=;
 b=iXDxv0ExIRIY25svY30Q8uENC6LANMUGQaSKy6V4Bbl7nQKSB8Iy1qSc6DMZLPyPBlQUCewK2r4PKOXH0B56E2ru+Ldy5i3KYnQ+uL11NmEdlpFuIucd3XCXzO1BeSWRXlf4K6/QkIyiWjrJq3xDzOjYAjgzN1cn4TC9PRXjlEOolPsMU6K0RbZchxWB3fOO1Hiw0eLHOOcK40CtFEQBCKYpQ2uLXSCQ6+SUfQ8IgzBqd7sXRM8kJ8j2WKNVBx7U8Gab54dfPcYpcPpRwbsFWgUpvrK7kGui1pqG6NOH+UFLkAWhaF1EukXP9glxEVqpeSdYVvs/jToZELn9i7yxig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=houseofhr.onmicrosoft.com
 header.i=@houseofhr.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-houseofhr-onmicrosoft-com header.b=iXDxv0Ex
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rtone.fr;
Subject: Re: [Buildroot] [PATCH v3 2/3] package/raspberrypi-usbboot: bump
 version to master (commit 4a3d311)
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
Cc: =?iso-8859-1?Q?Ga=EBl_PORTAY?= <gael.portay@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Athaariq,

> ________________________________________
> De : buildroot <buildroot-bounces@buildroot.org> de la part de Athaariq A=
rdhiansyah <foss@athaariq.my.id>
> Envoy=E9 : jeudi 11 juillet 2024 12:30
> =C0 : Thomas Petazzoni
> Cc : Fiona Klute; buildroot@buildroot.org
> Objet : Re: [Buildroot] [PATCH v3 2/3] package/raspberrypi-usbboot: bump =
version to master (commit 4a3d311)
>
> Attention: Il s'agit d'un courriel externe et pourrait =EAtre malveillant=
. Veuillez v=E9rifier que vous reconnaissez l'adresse e-mail avant d'ouvrir=
 les liens ou pi=E8ces jointes.
>
>
> Hello Thomas,
>
> > I have for now applied the older patch from Fiona Klute. Please submit
> > an updated patch if it still makes sense to update raspberry-usbboot
> > even further.
>
> Thank you for the Raspberry Pi 5 support! Unfortunately, I broke my
> Raspberry Pi 5, so I can't do anything for now. Let's see if I can get a
> new one on the next payday this month.
>

I am sorry to hear that.
Do not worry, I can do the testing for you if you like (if you tell me how =
to proceed) ;)

> Regards,
> Athaariq Ardhiansyah
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Regards,
Ga=EBl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
