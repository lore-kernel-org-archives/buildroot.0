Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D80C83F17
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 23:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A221440EC6;
	Wed,  9 Jul 2025 23:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slOw499bW88i; Wed,  9 Jul 2025 23:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDBF40EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDBF40EC7;
	Wed,  9 Jul 2025 23:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1FE15F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 23:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD1314079E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 23:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcsuG1ihTQx7 for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 23:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::62e;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CB504007F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CB504007F
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CB504007F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 23:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsVVTv2S+nLTdRVAYtkJ4G3QPTKHe/pQgURE3MoLKRssX/C+TMLFbsA3NgyhBMUwsXiw4pUA6lBLF9l4j5tf6bObCrOyMbzYkUvL84mhVlfL5P13QyHvVigWRUmxBvWsSdYrwDPUZ8FhMedo5R0gF107uYCALMBLeNurcvaJ3x56/tl1qDYwW4aiIIzQfE+UaQvFRGmQDtBiRBjMMMlzewd0O9iKDQE4QdwrushMQLulrXQOFodNZfF4m+Gnqs9qxk2V4l579iuPL6i755bjnPxj0cgYX98DpqwldLZZsFYM9Fa8NT6Hvg40HbZdUB6ILDOuPvpFfoTngnjwUXcwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyOy5MnsXjeJgLhRJ0aqGLWK+OKnpMPUGk0rqjjaQPI=;
 b=u8n5UPCWsCCyWlxarHyM7OkbqkrQgslCdbrSSMNaiRSrK8pkCCzv7Gd86aujiggzJaM0vm6aXKro6fw+Y3rSMVF2g3QmW4RapnNMI4ThOQCVOOsxI0O0aq/mjCRqpIbPxgfNRQJhnw96yWcGBVT+kzDQpRmCIWkypemA+Y5Jd+CVCAgQzcp8E0x7K7J2sBuuj+Pk0hmC99YBKhIQ6u2qrJwsLxKlYpK5LS1eSbu+WuC0xWkiMN54IJphGSoDJ+KMc8cRJn8SCIhqKupwbeO2z9EX0fINduOk3J66hlUsraHdGl6LC58Nlv00PF/Lne9Aq18hkpKdB+Wp8trmmmoJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 23:13:09 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 23:13:09 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] boot/xilinx-embeddedsw: add family variant choice
Thread-Index: AQHb38qKkHD+rrXZC0COcLpJJL1FkrQqBx8AgACB41A=
Date: Wed, 9 Jul 2025 23:13:09 +0000
Message-ID: <SA1PR12MB5615E50A2137A428191E355FF049A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250617205801.2440300-1-neal.frager@amd.com>
 <20250709170840.347d5738@booty>
In-Reply-To: <20250709170840.347d5738@booty>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-09T22:53:33.1573860Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|LV8PR12MB9619:EE_
x-ms-office365-filtering-correlation-id: 0b463b16-dc20-49b5-735e-08ddbf3e2b42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|8096899003|38070700018|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?+B3FX24AaSbNBsk3RIT/gpLj1vp6/k+gywCDAS98CxYGXM7z2eL/j08pCTZ5?=
 =?us-ascii?Q?aWA2El6OVQ4TWq4JH77YXibkVWaOYwVWsjrAeYt49h7pYKgKOI4FDDjxozpb?=
 =?us-ascii?Q?o3fSgIP96gIZHMHx0YKVhjQ84m0wE8NJzAP7VNCqCMYphjbnE16y7QCM0Qps?=
 =?us-ascii?Q?FmUyDTVfihoOOHwackXjXV/ZVb3TheBnH5M5O0TvYJhom1q5/3/ncsF+awnf?=
 =?us-ascii?Q?E+ViQ6iWJYsE2v74f1agj5WZGKcokhzZgyeNLgCx3y2KG0O9Y1lHlHWRaA4G?=
 =?us-ascii?Q?L+C3vP+3TmcQnit/qYbNzrpQhqQ3OxhxKrrl3vsZBrJ4+B8mfomNnZXcrgNI?=
 =?us-ascii?Q?+Gx7KZ3k7eceUUczR36scpjZoV32T28kyoFNUyod9e3AUEmTsje6125qBClB?=
 =?us-ascii?Q?Oz4qDBwC9mRBo/6Y9mXWrpjxjW3W8FxuBBUYFXb0Lw9sQVlcB2mTD3tEfVKx?=
 =?us-ascii?Q?/RVKebiiXY7GVVcTznEJTHYLelFXjEQ90S+Zp69t1zZHY5dqIhpFu0icJ+91?=
 =?us-ascii?Q?4JQXn1Wqn9pHfVIHd7WMMzvXfyJrNXYNnSGjBbB7Yfhg8J8VgZ7ipxzBpbSW?=
 =?us-ascii?Q?6+vZuvvnpWjEva6FqKq7NAwi5BfsHdzqq6eP/WQagYSvkvNLtcjbtwrZ6KX0?=
 =?us-ascii?Q?HLMHuBRrBa+1fvQvGQbfSknYDIue2Whczze104FEETsTq7alYera8mDjt3rz?=
 =?us-ascii?Q?m7lG8M0XX4jDGvAxNMPB1+ociyPmLAR8HRdI2t0SQz9c2hHSdFukwAxrBO1z?=
 =?us-ascii?Q?aX1hOzEhPQznDgbCGXnKdBTRz37U0tlM5NKPUFas3yVpO7O+mweViFdWNL9c?=
 =?us-ascii?Q?MDBH+EiPk1A8UFUDxB6uyAPlb1Sq1m7s2XUdXw54igGEiocUDp5YfJbkAAME?=
 =?us-ascii?Q?xhGwDXYZLmFUiy8AVp75o9HumkXCOFhmHhlt2Cmvs154KIg+ZMoRN8DvBbGE?=
 =?us-ascii?Q?eD2GivD5fu3hWYcHQvTlCDP8/ssygBs5yeWLN3SBsbYKnLmfc1Q0vIozUMf1?=
 =?us-ascii?Q?OGp0r4HkEQhQsgDCNOmD2RXxkRL5XwUPOMN6HpVp449zagzGD6YXng4hU5+G?=
 =?us-ascii?Q?5aKwfuVNTOenxXG5tLG1ejydD0Nn2aG2v+bUkKn5sSlzdYsC36ijKsdBJg+e?=
 =?us-ascii?Q?mUxT6cEl9m2DJV+aL1vIpoo97aoTcqotJd5oyqRFC3Wpz66hRXpuOwLpU2so?=
 =?us-ascii?Q?gLRDJrb3vDYgNyw18nZRIpD1TbudyIMy7qAINxkhMeaSsvzjbQv8bkg7vE0a?=
 =?us-ascii?Q?G22+ytKD9BfuOQD+GjvdU37eHjf1eI0sid8bneq5VOQcwvhJanavthw1lzfG?=
 =?us-ascii?Q?udxS4XBtClMk5gSK9Slcos1aL0y36qAobOgXtzXQalTOWhyr2uCwuTUqgNBh?=
 =?us-ascii?Q?gISiTOznUma06xDj1MkKrcvKmTGQaGwDryLTNGCtq7TLugwYE8RdvfYt240z?=
 =?us-ascii?Q?7/gDtZuQ0e62xpNT8TiuL/XyTzuuBdPZCzrEubH4Fqc9E8/BowgVCm0sAZkh?=
 =?us-ascii?Q?Sm1LIVHU5fh5osNylu/+XMPKPm06yJCEZQJp1eIoyAscD+kXGxML6o2xfA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0UIin6c12pDbaBAeW2UX147Hhw6HUv61H40GuwXaO8g+6cM/oe/RN1ZCbyMd?=
 =?us-ascii?Q?wiu28KMCvaONpPOTAa7Me/yN0Tzo6F860iD4PMcPFAR91EVKRpgBVyBx0Sfd?=
 =?us-ascii?Q?t6uLox2JpZrhV9W7eV0OEEYpd5Np5gcIagAwKs8h5m8Rz51LR4QWzzjwguN/?=
 =?us-ascii?Q?1vkisiQC4SrWS27lCPEi5XiNTLiI7fgtvqL2BoGPD1ZuCEYICuB0zokXZW8G?=
 =?us-ascii?Q?ppUkNTTFjCAMJs4OHx3Obs0h4pqEWSWIUQJHYcE8nwZ+LEKE12KRoFIQ01X6?=
 =?us-ascii?Q?wcKqpxLnIsioROanl1DOBcg9/w/Y0rSdz9WlPyQF+jlyVRUe1N80ZxC6M6VX?=
 =?us-ascii?Q?ppHyed5MDaRpuyKE665X70TupnUoMiZZDwOTXYxF4/DOEMoCndQqBSdM7Qmx?=
 =?us-ascii?Q?HxMRraebIiYiJzF7Rr5Uu5Wt0Hg5X6Q9tNTHCyIDCKm5wishwoC6OdBmx35l?=
 =?us-ascii?Q?BcRc/A3+78MxVqEnwL732r6JP1K/4oXesqM0oTVplVQyrrCsF8ykxt9cQw5E?=
 =?us-ascii?Q?scL4RBrwxySduvOVoNSuMBEOIlJOa+NFVA+rSwg4Fsa5wHKfw0YGne5NpVeI?=
 =?us-ascii?Q?D7weV3lmqWmp4KZB+7QJu9TInEvvtfn59oqc3NwdU91ouaIlzSuw7LGbQTll?=
 =?us-ascii?Q?h41tsB9/ZzcINov+yNn8DXNfCuNEGeUwajaK/4Bpq7faNWTls0VYD0Kn+keu?=
 =?us-ascii?Q?JwjkG5n9PSeeSqcWmkrtj+dauD5FekeT1rr/+F4omHrQ0hHL6cbFsL548wM3?=
 =?us-ascii?Q?xhG9zeLvElbgmc2N+sxQyKypKwRhAeja+Rq85oCvvC7cQMJFa8EeflPKK3Rl?=
 =?us-ascii?Q?PyF2NaIlqccNaGryDTfSq5JYJYZB16OTKRHveJAd1oj75Yph2PdvHyGHbclq?=
 =?us-ascii?Q?V7PrmnxlKgWfP9tHxyoYwg1D2UvwxFhs1QG+hgxIT/VSgtx7Yq0vgNWZ5Yr1?=
 =?us-ascii?Q?NUXdIczr5mq57UznRV37OIo9/XeiUCnRz1WPufOVaCy+JQ4i6KrkBLXznsOP?=
 =?us-ascii?Q?FS3sESrcFyCCAbAmj3yM1Kzbyg2WDJ7uG8eqAuk2cd0U40kceJjgLyX5syoM?=
 =?us-ascii?Q?imj8xGPxAUpR2hijSQ/weMf1tMp1wQKf78IOk4CG7Ikrp7s7nVdoxwDJYQAX?=
 =?us-ascii?Q?+K7zgJnXn94NmugHohqUwI6fDdkbp6YVsIBfDFCzN3IsGrsOmPIaxo4hLAgh?=
 =?us-ascii?Q?mE6a4hzEcgITINBWEdCH6z+sNw1FZwzGXMQKnuehHhrk9PahsQeGY4127o9q?=
 =?us-ascii?Q?13ippz82Gp7guZn0rsAsFuQW82D9YPBdo6G7xigXKgz0qTXDDegLZF5ykded?=
 =?us-ascii?Q?qjAw+7qTUNhSaCNZToqzrMvg8yB9SFYpTyimZ9cWmH1GwlKkdw+nuRqw+zTm?=
 =?us-ascii?Q?YxoExdAoo9Q2fBJxTklx64gknpRKGoONPnWihniM7khkPFTvn3K0U69s8qOq?=
 =?us-ascii?Q?yfX0LVXLvTX32KaluOdYoAgdw0LP3SKdLlRu4OTqRzRiTz7bCVQkNhbgzUFz?=
 =?us-ascii?Q?GJX4YN3K4u8fmxE6ojn8WcRi9MCp+Lh+EZ3l4bQljHYaLXAMsZWCIKiKfS2E?=
 =?us-ascii?Q?wuaUq/zuli5xChAHb8Py9g20RTrvQMQqjPzhBJ/j?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b463b16-dc20-49b5-735e-08ddbf3e2b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 23:13:09.0748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmYkaSc8KhRMDPU1q/yp/CiM7toY0ZpQKMWxFRAr1/HJDMKC0AZBGpfH0KiQ1bqO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyOy5MnsXjeJgLhRJ0aqGLWK+OKnpMPUGk0rqjjaQPI=;
 b=ZnKeDKSyfbV2sa+Ib54tjAOk7bNM00+ceTzje1hpA9bB+LSB7IrYRFA2h5iYILFwwah0H6zMFXHSQMdPW8alf++Lhgbov4Mv7MWXxHA1J2LcbnZwRuNizGB5RGoYPf2EHddo3xFJP6tU7PVIT8A8psdVyGlXUFV0qQKOSXfsfXI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZnKeDKSy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: add family
 variant choice
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="===============2752270989325245235=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2752270989325245235==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_SA1PR12MB5615E50A2137A428191E355FF049ASA1PR12MB5615namp_"

--_000_SA1PR12MB5615E50A2137A428191E355FF049ASA1PR12MB5615namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> This patch adds a family variant choice to xilinx-embeddedsw for two reas=
ons.
>
> 1. It does not make sense to build a zynqmp_pmufw for a versal platform o=
r
> versal_plm and versal_psmfw applications for a zynqmp platform.  With thi=
s
> solution, users can only select applications which are targeted for their
> device family.

> I think ZynqmMP is based on Cortex-A53 and Versal on Cortex-A72, so
> could the various Kconfig symbols depend on either  BR2_cortex_a53
> or BR2_cortex_a72, without additional symbols?

Yes, this could work.

zynqmp is cortex_a53
versal is cortex_a72
versal_gen2 is cortex_a78

> 2. Buildroot will soon be adding support for the versal_2ve_2vm second ge=
n
> family. This family has a plm boot application that generates a plm.elf j=
ust
> like the current versal platform. If a user was to select both the versal=
_plm
> and the versal_2ve_2vm_plm, two different plm.elf files will be generated
> causing a conflict at the installation step and a run-time failure when t=
he
> wrong plm.elf gets included in the boot.bin.  By having a family variant,
> only one plm.elf can be built at a time depending on the choice of family
> variant being "versal" or "versal_2ve_2vm".

> Is this new family based on A53 or A72? If it is, clearly the above
> idea won't work for the new family, so in that case see my discussion
> below.

Even though your above idea works, I still like the global family idea.

> The issue can be seen by comparing the two Makefiles which both create a
> plm.elf.
>
> versal plm:
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/s=
rc/versal
>
> versal_2ve_2vm plm:
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/s=
rc/versal_2ve_2vm
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++++
>  configs/versal_vck190_defconfig  |  1 +
>  configs/versal_vek280_defconfig  |  1 +
>  configs/versal_vpk180_defconfig  |  1 +
>  4 files changed, 18 insertions(+)
>
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Co=
nfig.in
> index 0dd6433608..7af8d59929 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -28,8 +28,21 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
>          Release version of Xilinx/embeddedsw.
>          Must be xilinx_v2023.1 or newer.
>
> +choice
> +     bool "family variant"
> +     default BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL
> +     bool "versal"
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
> +     bool "zynqmp"
> +
> +endchoice

> I agree about the overall idea. I'm not sure the xilinx-embeddedsw
> package is the ideal place, though. We already have
BR2_TARGET_UBOOT_ZYNQMP in the u-boot options, > and similar
> setting might be needed in the future for other packages. Users are in
> charge of configuring all those consistently, in different sub-menus.

> So I wonder whether it might make sense to add a family selection in a
> global place, and then have both uboot and xilinx-embeddedsw follow it.

> I'm not sure where that might be added, though. The "Target options"
> menu looks like the obvious place, but currently it is used only for
> core-specific options, not SoC-specific ones.

> Another possible place is the "Bootloaders" menu. While less ambitious,
> the need for family selection is limited to bootloader-related packages.

> Other opinions?

> Best regards,
> Luca

Perhaps a global SoC family definition for bootloaders could make sense.

For Xilinx SoCs, there are three packages which would use it:

uboot
xilinx-embeddedsw
xilinx-prebuilt

However, if we do this, both uboot and xilinx-prebuilt already have family =
definitions.

We would need to remain backwards compatible with these already defined def=
initions.

Also, we would need to think about how to handle zynqmp and kria.

For xilinx-embeddedsw and uboot, zynqmp and kria are the same,
but for xilinx-prebuilt, this is not the case.

Also, since versal products boot with a microblaze running the plm app,
and not the u-boot spl, I am not sure if uboot will ever need a versal spec=
ific config.

When I get back from vacation, I will resubmit this patch
using the BR2_cortex configs.

We can then think about whether creating a global SoC family definition
makes sense as a next step.

Best regards,
Neal Frager
AMD

--_000_SA1PR12MB5615E50A2137A428191E355FF049ASA1PR12MB5615namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">Hi Luca,<br>
<br>
&gt; This patch adds a family variant choice to xilinx-embeddedsw for two r=
easons.<br>
&gt;<br>
&gt; 1. It does not make sense to build a zynqmp_pmufw for a versal platfor=
m or<br>
&gt; versal_plm and versal_psmfw applications for a zynqmp platform.&nbsp; =
With this<br>
&gt; solution, users can only select applications which are targeted for th=
eir<br>
&gt; device family.<br>
<br>
&gt; I think ZynqmMP is based on Cortex-A53 and Versal on Cortex-A72, so<br=
>
&gt; could the various Kconfig symbols depend on either&nbsp; BR2_cortex_a5=
3<br>
&gt; or BR2_cortex_a72, without additional symbols?</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt;">Yes, this could work.</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt;">zynqmp is cortex_a53</div>
<div style=3D"font-size: 11pt;">versal is cortex_a72</div>
<div style=3D"font-size: 11pt;">versal_gen2 is cortex_a78<br>
<br>
&gt; 2. Buildroot will soon be adding support for the versal_2ve_2vm second=
 gen<br>
&gt; family. This family has a plm boot application that generates a plm.el=
f just<br>
&gt; like the current versal platform. If a user was to select both the ver=
sal_plm<br>
&gt; and the versal_2ve_2vm_plm, two different plm.elf files will be genera=
ted<br>
&gt; causing a conflict at the installation step and a run-time failure whe=
n the<br>
&gt; wrong plm.elf gets included in the boot.bin.&nbsp; By having a family =
variant,<br>
&gt; only one plm.elf can be built at a time depending on the choice of fam=
ily<br>
&gt; variant being &quot;versal&quot; or &quot;versal_2ve_2vm&quot;.<br>
<br>
&gt; Is this new family based on A53 or A72? If it is, clearly the above<br=
>
&gt; idea won't work for the new family, so in that case see my discussion<=
br>
&gt; below.</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt;">Even though your above idea works, I still =
like the global family idea.<br>
<br>
&gt; The issue can be seen by comparing the two Makefiles which both create=
 a<br>
&gt; plm.elf.<br>
&gt;<br>
&gt; versal plm:<br>
&gt; <a href=3D"https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_app=
s/versal_plm/src/versal">
https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src=
/versal</a><br>
&gt;<br>
&gt; versal_2ve_2vm plm:<br>
&gt; <a href=3D"https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_app=
s/versal_plm/src/versal_2ve_2vm">
https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src=
/versal_2ve_2vm</a><br>
&gt;<br>
&gt; Signed-off-by: Neal Frager &lt;neal.frager@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++++<br>
&gt;&nbsp; configs/versal_vck190_defconfig&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; configs/versal_vek280_defconfig&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; configs/versal_vpk180_defconfig&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 4 files changed, 18 insertions(+)<br>
&gt;<br>
&gt; diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw=
/Config.in<br>
&gt; index 0dd6433608..7af8d59929 100644<br>
&gt; --- a/boot/xilinx-embeddedsw/Config.in<br>
&gt; +++ b/boot/xilinx-embeddedsw/Config.in<br>
&gt; @@ -28,8 +28,21 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Release version =
of Xilinx/embeddedsw.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Must be xilinx_v=
2023.1 or newer.<br>
&gt;&nbsp;<br>
&gt; +choice<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;family variant&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP<=
br>
&gt; +<br>
&gt; +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;versal&quot;<br>
&gt; +<br>
&gt; +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;zynqmp&quot;<br>
&gt; +<br>
&gt; +endchoice<br>
<br>
&gt; I agree about the overall idea. I'm not sure the xilinx-embeddedsw<br>
&gt; package is the ideal place, though. We already have<br>
BR2_TARGET_UBOOT_ZYNQMP in the u-boot options, &gt; and similar<br>
&gt; setting might be needed in the future for other packages. Users are in=
<br>
&gt; charge of configuring all those consistently, in different sub-menus.<=
br>
<br>
&gt; So I wonder whether it might make sense to add a family selection in a=
<br>
&gt; global place, and then have both uboot and xilinx-embeddedsw follow it=
.<br>
<br>
&gt; I'm not sure where that might be added, though. The &quot;Target optio=
ns&quot;<br>
&gt; menu looks like the obvious place, but currently it is used only for<b=
r>
&gt; core-specific options, not SoC-specific ones.<br>
<br>
&gt; Another possible place is the &quot;Bootloaders&quot; menu. While less=
 ambitious,<br>
&gt; the need for family selection is limited to bootloader-related package=
s.<br>
<br>
&gt; Other opinions?<br>
<br>
&gt; Best regards,<br>
&gt; Luca<br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">Perhaps a global SoC family def=
inition for bootloaders could make sense.</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
For Xilinx SoCs, there are three packages which would use it:</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
uboot</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
xilinx-embeddedsw</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
xilinx-prebuilt</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
However, if we do this, both uboot and xilinx-prebuilt already have family =
definitions.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
We would need to remain backwards compatible with these already defined def=
initions.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Also, we would need to think about how to handle zynqmp and kria.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
For xilinx-embeddedsw and uboot, zynqmp and kria are the same,</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 11pt;">
but for xilinx-prebuilt, this is not the case.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Also, since versal products boot with a microblaze running the plm app,</di=
v>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
and not the u-boot spl, I am not sure if uboot will ever need a versal spec=
ific config.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
When I get back from vacation, I will resubmit this patch</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
using the BR2_cortex configs.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
We can then think about whether creating a global SoC family definition</di=
v>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 11pt;">
makes sense as a next step.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Best regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Neal Frager</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 11pt;" dir=3D"ltr">
AMD</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container" dir=3D"ltr"></div>
</div>
</div>
</body>
</html>

--_000_SA1PR12MB5615E50A2137A428191E355FF049ASA1PR12MB5615namp_--

--===============2752270989325245235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2752270989325245235==--
