Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8CDC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 20:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 299684241B;
	Thu, 24 Apr 2025 20:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM1AgIloucYR; Thu, 24 Apr 2025 20:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4356042427
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4356042427;
	Thu, 24 Apr 2025 20:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDAEE159
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A423442427
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjVyiLXyFou7 for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 20:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::617;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 703AC4241A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703AC4241A
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 703AC4241A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yq9y6fqLQHF1lP6Sket+JRtvrcqzcD3Y1u0SSET4IjcRxa/Oh1m36Jqxm3/8idpUrLTpt5fZQ2zfU3NTUc2uIrjWA2FLFiz2EnrL0XJ3unWHiGkywmK6f0XyGRPT3e8vcyxkIji2LBXvzwm5qb8c3X0O1tCmhuyaitQ9DnNzB316L/ti8Czd1thvCnltzKYWOAzwJmS5wFor8y/KEa/NhS3CDahpvEQvspAEJ8Nc427Gm6kZ5z9Xn5di3QSAO3xqQ44fDjOEiFpXd4gM0J2LqSj0dAp4fP9iTpJJD+etVQCkv/YlvPUnmESxiRxW8pLz79MLTqVauzRJC982Gd7fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x282LlznJbLVIeaffc8BIErIgLkufIHCsPCd2lhX2/I=;
 b=W04dvZxHvCHw0jtgOalTnoRHcTmqudIxLAJ38Nd5ZT7KwhjPx381/IG6V1sOUDb+R+jfEMM51YasOd4fSg63RvYS9tG/JoafAfZEURecCzXHvvcPUbBG3TQn/AIjCnhxmKNweSqOqnq40ZN6/RBpl+7hvI51GIr3SYZs9n6uUW3ciUgVawuZlLSdPySmyLfDdNKK8VA/HgzLZnCN1j2s3BTImLM1Syz5upApEuz8kyPmISJgKpZiwDJWCM4aFC9flOMK+o3xsRzYf3LM3s4MR6i9fBCTV++PbpZIMB0HpQq+BsjcX1dvHX3j5/a/6VmbyKM7HYPR/Nkv5OQoYh+eHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 20:14:56 +0000
Received: from PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::81ec:c416:6667:bb81]) by PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::81ec:c416:6667:bb81%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 20:14:56 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Neal Frager via buildroot <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>, "Caccamo, Fabio"
 <fabio.caccamo@amd.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "Simek, Michal" <michal.simek@amd.com>, "arnout@mind.be" <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
Thread-Index: AQHbqHwzEb6M/nIU9ky/Ihkd+Pn2rrOwO1mAgAIlo/CAAO8vgIAABqwQ
Date: Thu, 24 Apr 2025 20:14:55 +0000
Message-ID: <PH7PR12MB5595D0145464AD340A0CECF4F0852@PH7PR12MB5595.namprd12.prod.outlook.com>
References: <20250408114834.733285-1-neal.frager@amd.com>
 <20250422223601.1ca5077b@windsurf>
 <SA1PR12MB561566BC39D926C9E2AE0D64F0852@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250424213919.2e40c109@windsurf>
In-Reply-To: <20250424213919.2e40c109@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=e01da6a5-c192-4378-ac2a-cdb4e666228a;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-24T20:03:11Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5595:EE_|CH3PR12MB7545:EE_
x-ms-office365-filtering-correlation-id: d1350d75-d4c8-4d0b-c95c-08dd836cae57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?A78guaVahPk+DJnqtw6c2fE7S34D7kGs/NLbILGica1z4igS1UEBGhTYj0dF?=
 =?us-ascii?Q?zA8NlCGeEJytVEyYlaJry1A2ueYYm1FHSwPhNs7Id/WT8znmWQZEwpwAxZGr?=
 =?us-ascii?Q?6F3k+m/+kXMRmtDhjxf/eBPnv7PluWTadl34gAvek0sFs/zJfxieviFv/3Y6?=
 =?us-ascii?Q?Gf0OOCrPfPR0QGFP1BsdSpXAqzWo2TgBh2z+v9W58v8xpceHD84LS+mFlueY?=
 =?us-ascii?Q?fmg4KVKmqYy/yg8AhXpufvJgVVUBYmxe8SsW4SQfkxM7O/dBJ7vEPnUq5cpt?=
 =?us-ascii?Q?ePZp6iF0Fj/HRq5AaEdJ3mpXvoE0XdcMsAgaIC6PMJChx1X+N1kUNiCBMaZW?=
 =?us-ascii?Q?vhOQ5o1/dXKW3G+O9SNldV/WTkgOMSkFIPBExmPNMDfwbRyZRm+f4l/Bv5x3?=
 =?us-ascii?Q?W82Kkl3HAqQwTgkYuhdZGVo4PFXsqYvgeDQ6Srtsak91IbLAb8Qr5gH30s3o?=
 =?us-ascii?Q?+3xZozu5YfcpCpZrrIcXdKGiTQwFy2d/N3vPBnZi81j2Z1gZGAwpgjjj1P3Y?=
 =?us-ascii?Q?jJM9CTF6AJ3kS3VPVBrVv/Zu+4207rrV2gqnp2LzNCP2IBwnKge/kAwvE/Xy?=
 =?us-ascii?Q?MvuoXgmHqH8+KwMwp/2K14v2E41k8YEacA7ovFN10YP4h6b5vY3QQ06Ntki7?=
 =?us-ascii?Q?ZRkATmdz9zPC+o9q45+33hS7Rwz0vCcXDQhYsg7ffD0mw0i0UV8u9fgAFXQu?=
 =?us-ascii?Q?ivlLDlj3SntrXj8KYbZzWwt5vo8nGq5QnGpl/dogjQr9WW9JzfaVBzz3Qhdx?=
 =?us-ascii?Q?bJLq7q89oddUSfvT7dcfhTCca7ZQau2h2iycC980VcZgfTw8YGaJ7iPImEUS?=
 =?us-ascii?Q?4lqJ4eSlahbOxz8Rp5ggno6gMouQxWGhGT26GB+Dq6+0uSDhdcrStkILOgP9?=
 =?us-ascii?Q?Bg3PjICTZfzOafNh6dhupMgZL/aGT9XqA8ZhjRojzj4BxYrmUMnrp034bGwl?=
 =?us-ascii?Q?AqCYWLYWxWQKniO5xRMFF59tOYndHsIuW1128YAe0cMSF7tfP9vTevTfcusX?=
 =?us-ascii?Q?HiVKKG0sAyzzgU5DQbM3rInXKEdqj0CYe5B71+axMWPRAG0Z4dP0bCsfoCmQ?=
 =?us-ascii?Q?+mnYJsvLlXACAAeYWQetZUkVPesE82skZeKn7uHeerWIjbpoz+l4J/oCEvyl?=
 =?us-ascii?Q?C4ZeOOi2U4rUn56zHdyjPccAixANcFn4kxQcqPANcBwUyFT4NLsJy3uI2GZI?=
 =?us-ascii?Q?2Q7Ivg2PnyOryzNbAZJ1Hg5MTmJoSdcQhUCB6eiqWS8zZ0FQq/G5t07ub2vs?=
 =?us-ascii?Q?qjUS/SIVFS/6TO99wjWGt6GP9YUbEBtXvRgyc0uD32vpipa2AW/TjWj0JqFA?=
 =?us-ascii?Q?uNdmMF9xD8yzbEYCPVwHWiVkQag8+4HNC0F1oDxMYL590pwUxItHqbix+2aI?=
 =?us-ascii?Q?MzhsFz2joDxVb8YKSonlCDvj8omA7B3qbi2HVizAbLH9RMZ30p9vlT2uwnAA?=
 =?us-ascii?Q?nROQFuN1MDhNrDhEvCECqwb2ATDO3mvyaBC2ViDC4Vy49T0xuDvnFfZb515Y?=
 =?us-ascii?Q?RMq9492PX7v+h4vYVqM1ZgsZ5yAJPAwYXj5Z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5595.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+b6eKjchcs+bD2D8+qDnaHyj9Ur7wKt8IrZ+23VlqV5uYYxX0M4rm7TZFsq1?=
 =?us-ascii?Q?i7epIrt8X2OCiFk6XWCSGjRvRA4cSwkhe0xLUjxgDh8ir04rqcCA9FRZDUzl?=
 =?us-ascii?Q?t5XJLwXt+Qis81UfyAh4OiYRjpNFkCcS6TuuxdNrDNjLS2DS58agsWRLkWkB?=
 =?us-ascii?Q?/qau8XBOcvYXdDgmErbi69vS7hJCXAwbBrPs+xwCdNtLYH9Hm7eVuSYxkU4i?=
 =?us-ascii?Q?o1hJXqnM8IKAFzmSPAz12Z/45SZs3//GuOmzemyq7G7dFCFwByQaPFZnEi1S?=
 =?us-ascii?Q?7umbZXvDXintzYMKZchx4dUE1zRgZkUllSn0PlhC6OuMbCeoN3S9ci9j49R6?=
 =?us-ascii?Q?PqZYJcNZwowRcdw0mdPnVM2MXVaDxdlKRGoQIq230ROfuvX9rGfXc5PAF2Pw?=
 =?us-ascii?Q?j34IHA3SsVx9s6reJ3TLKtxCaGMSX6W+NUsBOWS170XXmqivFDSx7R+B+WHi?=
 =?us-ascii?Q?tQn59dIrb5N+IHEallL2NZEp8a6reEGU6Muy9iPBte84xpCkJweg3Z/D2zX3?=
 =?us-ascii?Q?82VHNPXrX7r+G3gcuw5NxtEFgQA+VV72YgJvC7Mf5K7IjNQjPMxyEhmg0r4T?=
 =?us-ascii?Q?jQRRS0ZycDXAoQgiBk4jEhmmke/2OKC8Wwi3/YzfwbhL4DMnncV0smk/6gls?=
 =?us-ascii?Q?qLHP2JltbXNzyKGrnQM5tyJGkYOBPu5drVyuQMC1+KUzVRm7k7ROqGUYkCWr?=
 =?us-ascii?Q?EZGTsZT9YaSQ9ku86oxDV397BZXiX1J+4q/J5Va41XWZgcdIsLjGfQddXQ+E?=
 =?us-ascii?Q?+3JAjQSuc+C0gqvGjNcUGL5yhDK9Kg4CtyrjVg5Q41ceIKa6xE996hRrIUnj?=
 =?us-ascii?Q?FACuuP4YucB+tj/1XYTv3bcFjwTalqQfxJRrGHOJTbqRdqHe2YaaoQh+Nf2G?=
 =?us-ascii?Q?mjtxeQmZ5KBMxWzsF4xjNFItiP9izcjTFLFWuHmA7PPwbNm48JeZ4BoBYKmf?=
 =?us-ascii?Q?S4lDKVzD2HRUD3TEKkvhKiEwJtR5DBLrEadNSpH0Gio/dkmPkO7j05bzmyYT?=
 =?us-ascii?Q?ko476IJJZZtpb9j3zki/zvpWcAO6n3gRJZR6VZSpGtLNeAfxDPoVYoO4NcJy?=
 =?us-ascii?Q?kLYZmLkDz7GKXLG19ehcawxLmzPfzzao4aMuP5VBeMzHALRauPupeKrrLRe0?=
 =?us-ascii?Q?7p8tugi27QosN5f+8xfpkcuuA69Hf4x0SyK3ZlqDYIpMy5X2afAQC1KjDmhZ?=
 =?us-ascii?Q?stv32Vuw1jv4WEGJBt2b4nIdDvRM5ZQHHSGg3HrkwJ2OcCyiCqVj+RXVhdJ/?=
 =?us-ascii?Q?oSjqEPEuxhF7PAm5Wf4hoTiUljhbJsg6SRxmeifaq3ZU/lGECReLGGQrv7g9?=
 =?us-ascii?Q?BNTR4x+Zb3EJTMAi+d1qr5GxTYWQOCLVj04COFWj9XCaZN8nYRZEruH2Mzjh?=
 =?us-ascii?Q?63p1pTWFsxvWt6/fA3tD2fLVVbIxTP9OOSQ1Ob/jqYgNLLDpEFVwMtXovNk/?=
 =?us-ascii?Q?nkXktvP5dDfF0H/Z5VEihHMtr5dCttz+pcz0ufGA2jahVi0TorJlpCrSW2MX?=
 =?us-ascii?Q?UX6TMx29ZCYPd/Dz6r2HevxPwOJXDC0xMyA1cCk5PMCX2Wq8GB6/uxw/B/XS?=
 =?us-ascii?Q?5VW4Yx/lpyXlFXR2GKQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5595.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1350d75-d4c8-4d0b-c95c-08dd836cae57
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 20:14:55.8518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y57pGnVIQkDuT9E+hpq2PrF3pgdV2uQAiS00R1l6+qxZI47Kwbegf7MPm7Je3peL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x282LlznJbLVIeaffc8BIErIgLkufIHCsPCd2lhX2/I=;
 b=AXT0lxWxcsJu8G/oJi/TmvaeYQlvR9oHKISfkgEV5ihdQZS6P7t+S6wwezlHWSMT5gAFDQmf/xcDFMcAOA5vqTBvI/6jOvgMjobWJwylvi8rRwz2yVA9euZOUUULovFII0XcfuFYZXC4z2sn5Irs4Hz8qchRxMxLzld/VB9Slec=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AXT0lxWx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

> > This should only contain the package name, i.e "fpgautil", or if we
> > rename it "xilinx-fpgautil".
>
> Ok, I will change this.

> Thanks, I've seen your v2. Much appreciated.

> > +FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
> > +FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(FPGAUTIL_VERSION))
>
> > I was going to suggest that we download only the source file, but that
> > doesn't work because it doesn't contain the version in its file name.
> > So we have to download the whole Yocto layer just to grab one source
> > file. Sigh.
>
> I had the exact same thought, but could not come up with a better solution.
> At least the meta-xilinx repo is still <1MB in size, so the download and
> extraction time is still in the noise for the overall build process.

> Ah, it's only 1 MB, then fair enough.

> > What about using the vendor-agnostic OpenFPGALoader instead, packaged
> > as package/openfpgaloader/ ?
>
> I was not aware of this package.  Do you know how well it is maintained?

> The Buildroot package I don't know, but the upstream OpenFPGALoader
> package is very active, and well maintained. It is becoming the
> de-facto open-source standard for FPGA programming.

Yes, it is good that OpenFPGALoader already has a Buildroot package.

> At the moment, I have two reasons for wanting to still support the
> xilinx-fpgautil package.
>
> 1) The OpenFPGALoader does not seem to support Versal PDI files yet, so it
> would be incomplete for our needs.

> Correct. My point was not to claim that it was right now a drop-in
> replacement, but that it was another area where Xilinx could try to
> leverage existing vendor-neutral projects rather than inventing
> yet-another-vendor-specific-non-standard tool like vendors like to
> usually do :-)

Yes, adding Versal PDI file support to OpenFPGALoader has just become part of
my to do list.

You are absolutely right about vendors creating their own tools all the time,
and AMD / Xilinx is certainly no exception.  I think it is a combination of
wanting to have control, but also not realizing what is already available in
the open-source community.  I would expect that very few people at Xilinx are
even aware that OpenFPGALoader exists.

You may be surprised how few people at AMD / Xilinx even know about
Buildroot...

> 2) All the Xilinx documentation talks about the fpgautil program.  And on top
> of this, I had a discussion with one of my customers regarding the use of
> Buildroot vs Yocto, and their primary reason for why they felt they "had" to
> use Yocto is because it included this fpgautil program.  This is what
> triggered me to want to add it to Buildroot.  Especially since adding it is
> quite simple to do.

> Understood.

> Perhaps we could create both packages, xilinx-fpgautil and the OpenFPGALoader?

> OpenFPGALoader is already packaged in Buildroot. But yes, there's no
> problem with having packages for both.

Yes, I see the Buildroot OpenFPGALoader package now.  I wrote my last email
before checking.

Thanks again for reviewing the xilinx-fpgautil package!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
