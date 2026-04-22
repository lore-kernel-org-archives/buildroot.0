Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E92F94CDB
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 07:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C57C402E1;
	Wed, 22 Apr 2026 07:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQFnclmZpq-4; Wed, 22 Apr 2026 07:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7546340295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776841507;
	bh=unELuwxO74wtpfjNEXFEty1xRA1C4RRFheGNoOGnEGk=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nL66W5+aY+4/vZFl0+7cFCU7DzLo0gh/HURMJenqmsIuzDk+x0UVpFPSjotQxrDQY
	 hJ+tq7KFVU30OgddIFbxSSQrU/2yhoOECNwK5HcTTcFS/i0zFtaB7BQAU/IhPrxXGS
	 C7sK3d5H78SqbBSs//0fxyn42mU7Q1L9IGaOjExy36PzeAx+BsD2VOp9lt1MLkDOZb
	 Mwo+dw0h2yK1kz2ACVJLDgcjKvsykM264HnUu/vVhip4uFz3u+g1obgAYLyzdqVLTl
	 nVZbMEEhpvru8KS6vFGRsB1FqvXOyLNkeEpmpdBMBsIdQ061zksVeflfEEVP1RKtU5
	 iqBfghMY1Ojsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7546340295;
	Wed, 22 Apr 2026 07:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA11724D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABDFC40293
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9REVE3wCbr9 for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 07:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1D6740291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D6740291
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1D6740291
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfxL2B4kyo7ql6qb9k77QDMbO27FOmC1ZXRuuydhEPEPoUwmy90yCzVdR1/OicSu97kyjwfW9WhwM2S0A4Zrj5e+sw6hNXW4mgfN0xd6IQ3gN1gVekN4z+OBIDIMpnwAimm2QveDNxnbXAwXTKVhFozUVgx/3zF2G6qRVPh7gVOWYkpXvM7thNI3jTyi4gYteUNza/SWsma6OJhivI8wa6AeHAsR50MsNe07kIGy/Oq71BGk2SDiN0SK1m921ChknctFubDornoHDezPeKB2/OVnux7gNKVjH5x6haSjGk68FBIetZ6LOZby0zfBWPz+gh1Xw+r6u0hrr7UP6pc10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoWj6s5w/BqaqWTDl7/UjRvo/Ff4VyUZ4piPGt7eS9I=;
 b=ZX0ZK39LXFy8j4LY31RYGEcoms10tqdJ9U1Kx087eJOUTV6vvsOnp061j++xQIpbZEuKtntb6+ellNE2MRSGZ76SBIVX3w87kmO2SKI0Gu2SWWeVTzAJEqA9jWrdiy8E5G+DsfLWGuRAc+UolrNTcnSaRrZHNK2+7fkMXK7HhD+flAujcQXFyDHMWF6vBP0yDSQ1mqmOEVDs4BRnqFlaB2hAErVrZ8LmPNRlISen2AR0PAMoyhXQXA5cS2+SwCYDmRIg9Mu9RdSPjrRy76Qi8m3pVxZTaEGi/5gYVhsd/GZ8XAuUniL015GFx3Zey0Ixcvx+q0fRxmGqsXTwD8q8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by CY1PR12MB9557.namprd12.prod.outlook.com (2603:10b6:930:fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 07:05:00 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.20.9846.014; Wed, 22 Apr 2026
 07:05:00 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/6] board/xilinx: add Linux 6.12.70 hash
Thread-Index: AQHc0OyYasIvK4oujk6Y3Y+NJOtQk7Xp611+gAC+jrA=
Date: Wed, 22 Apr 2026 07:05:00 +0000
Message-ID: <BL1PR12MB5032D5735473E22770076804F02D2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
 <877bq0hzmw.fsf@dell.be.48ers.dk>
In-Reply-To: <877bq0hzmw.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-04-22T07:01:46.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|CY1PR12MB9557:EE_
x-ms-office365-filtering-correlation-id: d0cc1b96-f932-444f-d948-08dea03d781a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|56012099003|22082099003|41080700001;
x-microsoft-antispam-message-info: X34S68UuWzFfgYLGO8xUr6yoQkoofy46Hs/jEnWEfDAAEntL/o5f+smF2IhZVVscamrMd7J4q8lyCSly3zDDiwHWKn9OFiEQxuLs86k7N99lXOuxgDDGzLuPLhvQWXLGYlBecruifds/hrBJDTzYJ2z2otTXfA27XXt7Jdi7bosoICRPZIw8u1/4u71w8PKdWbsiVr49tppAFZVzlBmRkcz7uq18SUl1aAAfro6/FrIn6mse/D+oxaIJNO0QHbA1vZABYF1YKAhLZMJjYtdfjeLPAMmcy3gucs/wxOcLSxEpgbMUWZgXUDRY6k+aEX0rJPxAhggF0ccRr+y+uRdZb5QtqkkaMwcJ8bICPfugxgWjSe3m+Ngu/88jr/mpYCwUHGVEtTUdBz7NjLAZPqDgytLhYYbYr+4RCoRLDn+ayV1GOvhirZD9aGLAmLeEcDKsVuZgi9TpvGNvtCSLQSrtu4BZJZdw1hMO0vMnmDluKkRX5l8voJR7EFMLfu2tc3Aer4iCd7CWnaeBvLz7cG+Q1sHWhFZvasFA0EXXs0dy86G34OeToxywTuk2xdt+9JTLWekLmn2kMxuUHNpq2yasKeQrQTIPJliiMIgRPVqdnZo3YhnFywq/Pt/nvHKT87i7fawcpErNDwp6jOPUxieDUXa4toR3GL8/HE8qbEpPuShIMumxKpX280GS0AzyNVcHLHebeqAouEihn/I9IAf/sy/R4NvQN46FgzVdoM1Q51GlVvIYiEoOjOfFP+xFdp2YPIk78wYooyTrWGgPX/uzzXwvcwESQVUcmN+N5KRG/GleqqMfokq1DrDweBaufEsArQ/8wWU9weYtS9t5Ri46rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MgbdYPSB5g5jzzSoQKsepzyx71B0nVZwbnJpm3f5PHHBvwKSiH/lj8H4eWww?=
 =?us-ascii?Q?glglyrPh2UNa25OpgvwKiq3x4W9WPHmIMXYHCokmyNUrKrhLU5JEg5RG273n?=
 =?us-ascii?Q?J/YKWQtrXcmnDG+KhA++2Kebh1zWLoWaxcKHkJ55caMMzRim5i6lBweRhIxv?=
 =?us-ascii?Q?rjH7ZyvsFy5Mr7Z0iijLCz7MWoqO72yLtYAKJQ0PCgDdRYGziPgDr6PptGvA?=
 =?us-ascii?Q?PEdUjBR1vu6i8BKjfmKwX4h3FSDDr2e4GrnreQ8c+HIYO/5vpxkRqwjDfgol?=
 =?us-ascii?Q?f+5oj8Heht3v1yNg3/D7QGefYKi/ZtyELdJxzxQKWQF+LSutUfD9Q1bEp0xU?=
 =?us-ascii?Q?0jQCaI+A5Q+urF92j8qaUwSjiitOBeyZ8euiup8aj70jBY4eA/Zc2JdYcC9R?=
 =?us-ascii?Q?tX/Pks7XDMAFlfs+1XQdYpwaWy98YgNZ61zsqPJPZoWcMe2g7rM3aEuuz3iQ?=
 =?us-ascii?Q?gFVEfue9Y7WYtbnHmOBhnU2qa1K+WuaM8kY2/b0XSJQba01Rkr9/Hka6R8Z0?=
 =?us-ascii?Q?cDeZN9kJwfz45xRRV960iRCJkeWR72nmGf1mcE2SCXPpfk/9yiLwh7PB6sNO?=
 =?us-ascii?Q?EE3sHphjgoF/XjmX1tx1bQ0qYN2CkkC2LoYuNELJ/o5E8t4LRYi79gzcCcVa?=
 =?us-ascii?Q?aeNDDgr00FNL6WgWYfi3h9ikz+LBQjCzgX6dlfnaTxO3FKL7jSKwVronmk2E?=
 =?us-ascii?Q?TxKRSU3bPJ+mhKZUUKoWcojI4QqFQ+PZ5ttHGA98UVHQvMHsjSfa2wPledNj?=
 =?us-ascii?Q?I+RM+Ahuu9rJWAoL8cAYIAQz0gwwXuM9OU7cR1nUGCw7WaJe0ESBdZgh5Mm9?=
 =?us-ascii?Q?ImFU99s+NSfNF8wwJRC3WbikDXTDgR6wngr056NRGJ9V1LcDvTFwAdjTMHzt?=
 =?us-ascii?Q?XGZvkChGSHfIrQpEFNEv7IXM1vAnZOyqrZE6t5lqnWqiwH6TiVfxLewDEkVU?=
 =?us-ascii?Q?SlHs3vjCbe2aQOOz5M3oId151SeG1mL96g439Igxe2thZKehSjEWP0STn4lF?=
 =?us-ascii?Q?Jf8iFy/vAyxxYkUI9tukQSJBFiFnjS6TgZ775SsBKbqjgTaRZsJ3Jiq9/tqG?=
 =?us-ascii?Q?7wzHPCijjk81Vt7xlPDf8Exey6U5JL+IKHNWgkqy11xLiafKhjpNdJZIyfEY?=
 =?us-ascii?Q?edl5gPDgv61Sm5NzvjlPlldn7tr8wHpSd6O+x6Y0gQzqdnzsIPe1p/2NePwr?=
 =?us-ascii?Q?oAqhpNz+nKeb7+svzbqxMxHvCzzXkIJGX8OhxQ5U/hbdTpba27YIpqzeIymz?=
 =?us-ascii?Q?ag16xiCvAF3iOJVHCtD1S0qGWl7HL/6MD9+SLbF/PJ/iFwVC0Fit6325Fxo6?=
 =?us-ascii?Q?GwUVsG8bRfDAvPgccsP+XzNDcN4IymXviXlkA32WO12jhLQ2dSMBi2C1+9HD?=
 =?us-ascii?Q?PQtJgS6bBUvc43/kQpVo5DdfsCB+JlWeaS5g7RtUoeI4rGiTslJNvLHEWmh4?=
 =?us-ascii?Q?3o6NNITxlcn8a5nqEphN6j2cNlIrtnZB3PDKMkbSY2pM7ZxJhW4MuxSV6Ueq?=
 =?us-ascii?Q?ReKZqhIuzlB6kRT9Qp0ri5SrNdl8WtWkPhtsz2gRYVW1V7LQQPhKJMuQNG3r?=
 =?us-ascii?Q?cYWxarS2ts0/VpVWgm4u/2/du+Cn79BtmQDqRMt97jJ+NEo0Rp4xws9HG9qh?=
 =?us-ascii?Q?mfcFGKaDpur5dcJFB64ktSE2B+gXFuOajQIIm/jFwOBaI4dQCvWxh2ySfpVS?=
 =?us-ascii?Q?9NH91dYJ6lGwnbs8FWxoFY6uUagjiDdtD7BlL7jEtzlR/PAw?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cc1b96-f932-444f-d948-08dea03d781a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 07:05:00.1237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjbAs0mRjnuLoARjHRIAEdROkwLorWB8h1mj25ebde7X5Ka4yER6vPl4xlCeWMRs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9557
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoWj6s5w/BqaqWTDl7/UjRvo/Ff4VyUZ4piPGt7eS9I=;
 b=T5vUpIy0EmAbb5Nk53jQQ1OK8ZzaOHPGj+hZB11+hfnjBaXfze6feKUxbgd7ncg9AL9W8qwCGgbasK4uxCWyisW6AwvfZX9q2PVtmT/CAdWsnFz4ud/Oeh796a3AhM52Tf4RcjtoNdA9CsjhuMA0p9f31LTALUOSeFRo5GMqe/0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=T5vUpIy0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/6] board/xilinx: add Linux 6.12.70 hash
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, 
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Peter,

> Hi Neal,

 > Add the hash for the Xilinx Linux 6.12.70 release tag.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  board/xilinx/patches/linux/linux.hash | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
 > index d843dafb20..87db73fc78 100644
 > --- a/board/xilinx/patches/linux/linux.hash
 > +++ b/board/xilinx/patches/linux/linux.hash
 > @@ -1,5 +1,6 @@
 >  # Locally calculated
 >  sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
 > +sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz

> Somewhat related: Is there any specific reason why an un-annotated tag
> was used this time? Earlier the tags were always annotated and signed
> (git tag -u), E.G.:

> tag xlnx_rebase_v6.12_LTS_2025.1_update_merge_6.12.60
> Tagger: Manikanta Sreeram <manikanta.sreeram@amd.com>
> Date:   Mon Jan 5 07:25:30 2026 -0700

> tag for 6.12.60 upstream merge
> -----BEGIN PGP SIGNATURE-----

Good question!  I was not aware.

After asking, I learned the following:

This is apparently the first release tag which was pushed by a new automated
system on our side. We have raised this issue internally, so that we can
implement a solution for the automated release tags to still have a signature.

Hopefully this will be the only time this happens.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
