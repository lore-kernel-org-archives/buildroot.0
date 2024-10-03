Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16148CF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FAF60787;
	Thu,  3 Oct 2024 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGAe8NVbrwPu; Thu,  3 Oct 2024 20:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E8B607DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E8B607DD;
	Thu,  3 Oct 2024 20:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5F371BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A414340544
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY0krTBRwCEE for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E3E04051A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E3E04051A
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E3E04051A
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:29:28 +0000 (UTC)
X-CSE-ConnectionGUID: lm3DqUfCTc2klrF3gM4kZg==
X-CSE-MsgGUID: iJJG9depTCO/yWyp0PdbIA==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="28609759"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:29:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4UeU6+9H4yEHyItNswXprHL6KcsW8IYvN/rHSo2fE7avzFlxYSZ18YYasFQD65pLAfZGnLI+zJ9r2HRVG3vfbnGlFN/5oFJPZ7Fqzi6NxcPg1AX1BvU1Dzeu251brzv0O7PqZ0i2YJAhcyGGS1INaNJQxC9vLivQ+KBRDtsiFTAVdEIukS+b9RWvGA2r70XnzJ8J2snbHgt+cP4FAxPUgmkY3Gy3fk+AbKY+OtU69KIn7Y2o4cwbdFmkepl1ubyH8Oo70fQKRjR3xUoTKgZ7m2MgZ51/I34Pjvnlrc6eIREKjFkFqbcgI4aV73zFXUTUlmQWN03q8cTsXnGK+6haA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnLo5gyBSzayssFLfrmm1xKf+TBZfIpVrpP4eLqrcZI=;
 b=GdPPfcmLZpgd87V8OpgX6iSmmcGBbRmx6dpKvgMWz+s84+PhVKV1oa4Agb0OCZfdO/9HwGhhmR9QJYLs4cczZWxQTFK316AUfyApcdSZopDgbOMcpa8PinLfGYlMGpXYqJWP21RPHbQhcHu+saHJxQfOneNnt16WdDGUjT6fB+TlGFySyoD4sJQpcppJARVgvrwScGW/sUcC2SuEtaHxEaBsHzoin5z2UTlaPVCWOyH0cMo7NxeLSS9IM1cipY0zMSvKAtmUePNXUnJlub+c8Nm0y8Hon5FwGurnK6gecf6GT89UDhdin2Yt/LBZ4GpiURFtrtcmBz/FMVAPHH/wOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by PH0PR04MB7205.namprd04.prod.outlook.com (2603:10b6:510:13::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:29:24 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 20:29:24 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
Thread-Index: AQHbAuUc1CB3U8OPVUq64u+ENUXuQbJXwU4AgAPx8gCADVlKgIAMIpyAgABw6QA=
Date: Thu, 3 Oct 2024 20:29:24 +0000
Message-ID: <Zv7-oGt7awRaUxVO@ryzen.lan>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
 <20240914222032.3fee5e2e@windsurf> <Zuk_RMVJAzqVO5s8@ryzen.lan>
 <20240925222613.3f62ed72@windsurf> <Zv6f6eMFxAUl5EuI@ryzen.lan>
In-Reply-To: <Zv6f6eMFxAUl5EuI@ryzen.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|PH0PR04MB7205:EE_
x-ms-office365-filtering-correlation-id: af1c0c4f-d9a0-45df-02df-08dce3ea11df
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZqndwF0CqhP/cm9HyGNNBQtkl/7Uv8hoeZclI3uI1kqJv6EmLyyZIMKiRrjl?=
 =?us-ascii?Q?t397ZlQRwUvBUggNjdCCxD4ZUK2ccR/0+gU0MdTN0+Nwo8Pl30AsWxNSNuFf?=
 =?us-ascii?Q?daTYL41li8E1mH8Q+QiJ9IHiaT8SBMl5Qms77ywPDTDpmMeMnAhOg6mtFef5?=
 =?us-ascii?Q?4uZiTiMICRFpmCaBaIWK1O36NUtWXfx43XDxpsSfcgRwFMYjp9HL9Hy+K2S6?=
 =?us-ascii?Q?ZZvixRPD21y23GfqiM25YW2HWgiuvoK+lXXNYlU6YTW5D3wl7X3atAx7b9vB?=
 =?us-ascii?Q?bj4Si8nuxh7zlj+IcWrgzgII2hbxqAVjbKqC0/kZV8W0bSaMtHj2e5olhxrh?=
 =?us-ascii?Q?BH5oaYVrLXmKn6CyNpMAfZG6hdnwXGaM9zGkbdaxeEiyZ91Wpls8eYaedjwV?=
 =?us-ascii?Q?oNtHK0jqR4BBM2DeX6QSoUksalogZGestQUteQTU163so5ssfs/pPW7WooTz?=
 =?us-ascii?Q?QtO68d5qEUC7VWEdppIO1VxwpCYvTySEpqj1AmP93Bajb1MHGYUURMjfFPB+?=
 =?us-ascii?Q?nJx6flajc6V6jqF0SGmRB6U9YlR8/IzimJKPuaOQ0F5z4hhyo6rkeenfS9jX?=
 =?us-ascii?Q?Ead6GT2/0xmJ4qcY/3+xOxEpcW1PTmSjwxyC8KJ0VTEQag8YgEiEnSY/ROFl?=
 =?us-ascii?Q?t6a6bO0hjf/tCtVrx3vwWydlnhce2oTC5yFIT9puiGCclrarfJsIqnnn4FBi?=
 =?us-ascii?Q?atM6/fDmxorGRYwMkL3tRdnoZdLNIGkzlJvCKehmuiUhzP9gFMa9DDktezFs?=
 =?us-ascii?Q?xGJVmGNI9CNbrA1hx9mvq8Rjm3SyNsVqHMyds0yJyeEtDMl68W2RD3Iycy6A?=
 =?us-ascii?Q?D1vrLMAXZuD46ovG5TEU0L8cHD9gP0rWAFqmVVfMc0DUFJ9nN7HR0tr1gE+5?=
 =?us-ascii?Q?JIj/LGY1ET3+tSrRIacu3ZjmfDTQ8jMvS+ElV5k1XVs5LIymkeIUNYMdKLAo?=
 =?us-ascii?Q?n/NQf7Rofdyfo+3DKm2f0PreaMtlgv6Kn5+wI62BXuML+BwxgDqN4AD+031I?=
 =?us-ascii?Q?Fqlqtxgj8OmYBr53SewyTEa9vX3TYZXC3vc5e93oOC2R829T3oid9TqwkarD?=
 =?us-ascii?Q?629Xbz81TcBFshmCXPbJCuBg9pi9YAJWU38XMoT3h4YHZaYZPvObNSC7pib7?=
 =?us-ascii?Q?7QteELGKakKrbDE8qkHYr97iYn0UwcGbyg5ri8zl8omq2kfqEy9ir+3WYjOf?=
 =?us-ascii?Q?hFnA4+fg0GJtWKkJo1LLnXc/FTDqwdJ4FCnQaCVHiYNfN7p2cc9m8/LBSLre?=
 =?us-ascii?Q?6gU8/38hfsFEWTj43paCizS+PWZuDhsJZITDRw+AkVWHsEfs5kQTHWo+gSO2?=
 =?us-ascii?Q?PDIfV7Ok6d6Pa3XEF50wj/V3qeuRk0YyGFtOvEWoQ+r+fA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?umMvKNoNwHbGHFwgNX0uvdWQys9b9UC4NHtYFBKo1Ugzmpnx9+5yy8HRaOy/?=
 =?us-ascii?Q?bpFPC4DF3iG9JPheDcuzlzJP8PbRKiGKkmCbj3wU1HFmLiZJGZIq0ycL0owh?=
 =?us-ascii?Q?Fr/pEamcQT1OkZKLCABNDfvoHXH7llR4WXGLFQjyaMk25fPSVV0gH6uz+pFi?=
 =?us-ascii?Q?QPUipKsE89cDWpGNNPyL4DD9pCvEVSe9oT3yczIXd7iYc0eVAy8kFlvmTm0a?=
 =?us-ascii?Q?pnQNJiRLnnqLJy+42gR17LrLR/GlEkGn1asQedyhzf83clobMl8qmlg1H/Za?=
 =?us-ascii?Q?rfEzFY8aFBdsapIXKXl+qLhnpFpeClv9CQe40G4AHwPRhc15nH9EBC64NgMO?=
 =?us-ascii?Q?otrbR2OjEgJobmy0i5AFnVHqO0mD6jQmcUay98QkP9dB+1qaqlmh4kbBa2yY?=
 =?us-ascii?Q?rlq/Cxc7QxYJYYisc663u1V6X85davV2xhUun7cVYT8ds0vtKGtQmwVuzsS5?=
 =?us-ascii?Q?oZLdDX4tQP5mNqdiPehGvwY2DmyofZ9t0f9LstBuOEpHDHH+p/qb4OMqa47o?=
 =?us-ascii?Q?Iwetn5opqtheFJIwXsxGXHY5gehrRvbE6TrN4l4d+YuHPbq1lUdjPuOuGOlw?=
 =?us-ascii?Q?QYKipY71Z1rXqtUb8sEk26z9BdGxNHik5Pa258m2AKdZlzsdfJ8RlSWVs67v?=
 =?us-ascii?Q?ZHWRmqOM/nypzdkcIdrE8umtVrRLojsWlHGiyudYQztagR34+m1YzLgAnRKL?=
 =?us-ascii?Q?U8mFiHwrrHusjl8TB1AA25sVSLI3cR4ekDFT7jrlsYpswg3IIwyTF1xvKvtu?=
 =?us-ascii?Q?KuGmHt/ndFjvL6EOmX79x27w+lgXQ0945/3UGekirQnSnOfo8S2QBFQEPRru?=
 =?us-ascii?Q?t/g51bm18a+rND8XIGPsheAC4/l5LLI8adI4/qCB/hjG/8VZPzDp8gU9E5Lk?=
 =?us-ascii?Q?TWcOAh+pXMyv+mWEt6KI0N/q1R1MPkS5Ul7xF/51dx8OalvuFNWe0j8aW+Um?=
 =?us-ascii?Q?zlb/4N11g3jYyHKSMKig3B+8djCjjqWfrSp5CUULvF0ODE3RHUD01YDTdVYw?=
 =?us-ascii?Q?WjyZ6yj97iF7K9obZVgzgQSkecMMvUNrg3B/KqzZko3dXC5CTXXDHBOHy7UX?=
 =?us-ascii?Q?LU896HQtM0eH1rkkyhnQ+chbmo9ccztnPU36s3mS0sHCmBoF3ky+ngFdUanA?=
 =?us-ascii?Q?N8DbeIZTWEqpw5eEHXl7UVCShjyG13kkIYt26MwPLAWcTqZfnx3iyzBhvcGO?=
 =?us-ascii?Q?EN5W69dDVBLpZRk3Ly1yZnOrRs09mgEo3ReJKnWtHslCWui5xDfX+upnh9He?=
 =?us-ascii?Q?+ffo1lSXvr8qTRmPZLnK/A/cFerrq3MF+L4PfcjWzHWTO2IUZvy/8J3V3dgu?=
 =?us-ascii?Q?uAwZRJ+UgsSSJqfc+gd8VyMaqRuxhF1/vreGWNmOQvqLs5uSW88IYjMbKz5R?=
 =?us-ascii?Q?vuFQAunIC20fMEzt4+QVcuumDFuf/4IwnkPSJt4thTkxnCR5HzerkXkfRsSc?=
 =?us-ascii?Q?giYFUs0ADtgRU4lyaU9NPtw8Jvh2UYG+JZhoHiWGyutIiIq+gXKWxrHmf+0F?=
 =?us-ascii?Q?/iMr0vnGuR7ORnb/4vVCsXFGqO/WUbpLZ8mtuugoRncFHiGoPFbM4gp4DEZ9?=
 =?us-ascii?Q?EQQMC8PQnb+R1EGNI8I/0Eb8mcH7/ahrzaFVUAePRgR4kGGrIkQNjvtFzxBZ?=
 =?us-ascii?Q?3Q=3D=3D?=
Content-ID: <7498D650017D8A46B5E95BE0B01921C4@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ge55gDN6XrTXmo+GU7LBP9tFilUrcOvWWdzkVhNJCRiJ7NE5Ri2/cnHyrzCMo7e6SO5vMU8scHcGRCOuMwPEXo9ply8Tir7C9XU2s2sYHJZlrbCJbhXvAdD7sgwv5Dll75f4kk5JQGVp1tGOH0ikAfHI7xlX/ObbWj1c3OlIqd0aAlkuBt8rObZu1RjweN9i6Oih4CnrfkZXaDtwOMbnT0/+UReIoh7L4g0hW/tv6+X4LNPPwoCdOVh7kkeOUyIVlQR7UyyIGNope02po0caBNNA0x0AeyrOr3c4uTmFQLnFIhPRa/XfsC6wZl2OrPakuz54pofYortgAS49ObReW602w8UtReAz11JcaDPH/RzZrmqL5d4vOcb9XouqqcD4QCcbA82TeLhm2nZvQoLmojDcE3Aj5Vr1Poxq6QVzr7yfqoR+vs4mJR4X1kZExbI4s0hSajP0ak4/EsMAeADwehigq8+3/lJ+//VDznLXJLGbjc6ezJix6oJk6GdYdzhfzwNBed/GAWfE3Y1ItGd6/0aj8VQ9SlPRxgY9S8ZuLhSWohnOnXwpBXioKZivhvoz7XYGKZKXTveKkHSzdHrbtai2X+DHri/pPM6+zE0Rcy6gTbmQGuw8tPHfJitiREHW
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1c0c4f-d9a0-45df-02df-08dce3ea11df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 20:29:24.1205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4o/ehXuTGXr+5pA/v+a32T7AK9rV0v/YWUvO50z25iEAYB3iYnJopwiPSbPehYCVTYd+kLThHDCuz/cppY7EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7205
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727987369; x=1759523369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=5FGfBEisMdCz7krUsOMKzAJP7j+oPCUi4WUvkxEyrwo=;
 b=fbc5bn5/4lQqWdY6elIBeMt6IlloGG2CsAh3p5LApjcG97cf+E0aR4hI
 WbXfj5+WJQdhyRlXlYLjUNb4l3X0+A9zOzngf7qGxgTbo8DFWUybQf90b
 2xopvAXulUlvG5a7Q1p/XLFEJJes6RBwAjCFFATUZdq1+LvokKqS7ihqx
 RPWhXXoaJ3QiyJ8NW7vzKtV6+SKSWnW+/HpR+XD39Fq3VmEX8H6Z9KD14
 hlEC7hGe6uWAixwKXxa9pGcLXNFB6VLYndH6Q7exYeXVL4GzNlPJyKs4a
 qTNJHt1UWa9BfPlWTGFB+LqSUsY/LRjAwB4mn5u62vDpD1y1Uu2pDvXUY
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnLo5gyBSzayssFLfrmm1xKf+TBZfIpVrpP4eLqrcZI=;
 b=iyBIzSnW2ttwYRnSxwJTPpeiN1OTww3L32ZsiDAoOI74/5+KUt+acJ8a9HfNOYb5nNVdetFQe7v1NBtWCpgc7MYGEa+e4ud8awJBvuG4FNTJ90lY6i9vPLKz8iakKbI5M8nDcM7KTTKhLbb0S4NfykdD71f4rCFpNDd9kBQND5c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=fbc5bn5/; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=iyBIzSnW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 03, 2024 at 03:45:13PM +0200, Niklas Cassel wrote:
> 
> Second approach:
> 
> I tried to create an empty partition:
> 	partition uboot-env {
> 		offset = 16M
> 		size = 64K
> 	}
> 
> Then I can see that uboot uses the default environment:
> Loading Environment from MMC... *** Warning - bad CRC, using default environment
> 
> However, it then continues trying to PXE boot.
> 
> It doesn't try to boot using extlinux from mmc partition 2.
> 
> Looking at why, it seems that it doesn't even find the boot flow.
> 
> 
> $ bootflow scan mmc
> $ bootflow list
> <nothing>
> 
> If I don't have the uboot-env partition:
> 
> $ bootflow scan mmc
> $ bootflow list
> Showing all bootflows
> Seq  Method       State   Uclass    Part  Name                      Filename
> ---  -----------  ------  --------  ----  ------------------------  ----------------
>   0  extlinux     ready   mmc          1  mmc@fe2c0000.bootdev.part /boot/extlinux/extlinux.conf
> ---  -----------  ------  --------  ----  ------------------------  ----------------
> (1 bootflow, 1 valid)
> 
> 
> So for some reason, bootflow does not find the extlinux if it is not on
> partition 1... I've looked at the bootflow code in uboot, an it appears
> to be able to scan multiple partitions on a device, so I'm not sure why
> it is not working.

I found out why uboot bootflow scan did not find this partition:
The partition was not marked bootable.

Apparently uboot doesn't care about the partition being marked bootable
if it is the first partition, but if it is not on the first partition,
it has to be marked bootable.

Will submit a V2 with this approach, as it is much cleaner.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
