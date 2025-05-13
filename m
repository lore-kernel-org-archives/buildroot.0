Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FF6C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 10:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D671040D4E;
	Tue, 13 May 2025 10:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aITg1vP3Pzbs; Tue, 13 May 2025 10:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2369840D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2369840D50;
	Tue, 13 May 2025 10:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD43150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6136B40D50
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ME3z2tIa3YX1 for <buildroot@buildroot.org>;
 Tue, 13 May 2025 10:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61e;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE3D440D4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3D440D4E
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE3D440D4E
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:34:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKpbPhK3g0Rr63b9yQNBuI7Dn+D9LSACfRYT7Q5DucHy6WSmSIIbYumpmYEAF7JzfR4dhvM0okNbBgsY+UnOh+pIlaH9ln8lIUNopw5HjFQkdq7nSVMgwNGBduM8X94UOB+fspFB0LhB4rUyghCAG61DSSZ/Qp8pgR4QV6qzUxfd3f+B5zQrFnZzDn4vxktQvrpzxm2TW67jnlSebKMG/5ogVkKwidbdSb5XcivES6EXrcmGTrN11WU6XSQfJpBRC5P1Hi8p0Kff749DFv7ugiPDrnztOLas4b8JGK/EnCrYcuM8sHgnusiNYDXWyupa1hT11I++MoW14B5+mi0YbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx/cZjyK7bvlqVknn7yQ6mhvYqvzxQfbhBhIZKxwaLo=;
 b=hmSIJuNypt9ZNsXKyfNkhaqgO7OcATqWUHgmDuQS44Sd1E5w/uUcZz5+C4UPa3k/yWuA7X2sfl1qMq1DfgVvPmPsd9dHaWV/nf2Tchm/cqFOeQkVVaIAO+u5vbN0ypE5dR3yWEs+nvRC6/Psbp9up+JCsjCl71P/LWXFCJZdHXtdL8ZFHBlsqOo/aBpfRKonRyDKn95Fa+IWUH0Kc1eK2dYDzc1HBNQXCTWwCrNH151o5LuwxNjmV0lMF2Zg/FrbmEjAMP1QwbnEi+MClI6SgrBlb+TD1P7CadcpQNoL7GkCJXEnnUHvWgP0TNBL2m0vtOlWJP+mh119OJ2rrjJ1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 13 May 2025 10:34:17 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 10:34:17 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 1/3] boot/xilinx-embeddedsw: rename toolchain vendor
 to buildroot
Thread-Index: AQHbqRtChc7/MKRTuEqmyDdbX7oR5rPQkqyg
Date: Tue, 13 May 2025 10:34:17 +0000
Message-ID: <SA1PR12MB56155371341FC3C1C6E9955AF096A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
In-Reply-To: <20250409064711.3024937-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ea2d815e-809f-4ebe-b19d-c7d5156d71b8;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-13T10:33:19Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS7PR12MB5814:EE_
x-ms-office365-filtering-correlation-id: a69e7448-68d5-4d34-fae4-08dd9209b6b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Igr9UhUSoiN5XhX6pJUFlZmKDZCjBBf3vuiEH4QFAEaXLqNrGiSzxos+eB4T?=
 =?us-ascii?Q?WEd0XfZQIOo278grbD9U1u225tcqQA751J0XP/hRLhLoM3BnVydUBb7vX2VP?=
 =?us-ascii?Q?uBFl5J4f9va1P+OHPYi25nI36OEdAHINIIUwpv1QIIDWHmqSMNmb4GkkQ1Wk?=
 =?us-ascii?Q?lejMM8FSVl2EzTLXFzj7COCD8tjljnlbWdB96xJFr8WSL28NGjtLRgwW4kRu?=
 =?us-ascii?Q?es8ztdC2YSgBC90aiNP/1aYX3LbkAjMSrvjdraeLKTpfXWS0FYHMzQzZ0jv/?=
 =?us-ascii?Q?EXWe2eqmQPH3STm6+G6bedtwHVoit3GMFeAsGsGi5aQj2buNORlbbUw+AEOv?=
 =?us-ascii?Q?PF4G2KqIXApp7WPPxud8MV5zMxZ2fncISKvKJ34atMEtFb4hcXMDEDFtgOjh?=
 =?us-ascii?Q?dd/xpAlZgXy7kVpSYx+3SQcJr0BQMW5WmmWEB/oCrHB4GTbSwBeguadS/h2u?=
 =?us-ascii?Q?lIb5y18IZAY78DEN4CbELRa4WRVk4PTllxcnRmsCfhIngXx6eFBV82aepbcs?=
 =?us-ascii?Q?BpvNAGhJImdYiJldngYdH2UFnUQn84cnRLB7ZA3+HhpcFyqr3uQZp5RNUbUk?=
 =?us-ascii?Q?5PknvDi2cUo9Gx1+6PQj8JzZiI5u39TqjQvaYT4DydLN/lBFl2KxDIzIHH+K?=
 =?us-ascii?Q?gHKb93T17alem115eXIXZWzBdbWZxF1fFrvs7P2Ljzv+mgdkGxFd1NHfmw5X?=
 =?us-ascii?Q?M2B/cfKQQT3T5GMsLgC1MCN++/yl+S2K9vIGEin58bOy9A6PmoDa6mukKIZr?=
 =?us-ascii?Q?gnqfAIawGTQ8qH2v25rQe7iCBDCmqMh/rzl6BMOxelcfZh31RBC8+7QxtrbG?=
 =?us-ascii?Q?9Ng7+fkBzCMgPoXRvw0pohTzWqXZVSPsDmO4lnUsn6s7QzVt01mlSviLrAIk?=
 =?us-ascii?Q?xPHvILGJbNIT2/VG5UQxWVvDeYdEdoLa8lV1PblmZ22B7VwqyFnoNE+d+77X?=
 =?us-ascii?Q?uGQCToV+8oB+73BJsAKOZ0Ph/8Wz+yivEeJw7FSiDhELKRPhkd/T3HtZbxUq?=
 =?us-ascii?Q?ueEt+d+lZzJ+fM5+mZaU3qs9AtaArpcV+q6TNG8t3bPzKFBrVudkhW8qbay/?=
 =?us-ascii?Q?WJeSAAoKp3SFLEk/fdxeLbqdaQEfiEMw8AnT55rxdMf74HecaccKkXfDuBdH?=
 =?us-ascii?Q?Eekk4+Jw2mu1fyyZdJyUzUq2+jo6v+FtlNOxpx9TaAO5t+/BqjD7HZKZrbyp?=
 =?us-ascii?Q?dbNste/LZR0eI/P53jKPyF6mp+M/UUYNrV9D0nvvfMgp0RrhIWH+OPnY9l0P?=
 =?us-ascii?Q?EZ0mB6EeQ0Eu0WKxgbPv1eSlQVJXmcZCCqYN0NsQtSYpy5wLwv3GLTCUDikT?=
 =?us-ascii?Q?IwrZrA/SakHohz4+lgNUkPx25Gh/DXw14pkC+3WW52B1RhEGNRycrhP7lr21?=
 =?us-ascii?Q?Fjxy4V4dTDdFfPsyGGelPkU26mBqdatq2Acyted0q8mX6PRT39E5Dd+Z95UU?=
 =?us-ascii?Q?CvaFzuXoC5lngycZzlytrEjhyEPNuNpaGOaLgeQKvJSe9qVJGkf4Yo/0NBKE?=
 =?us-ascii?Q?zIuQYnGYMwouz3wll6J5zVu8ehfCAn31VgS3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?um/toJdex2rD4gJRPFxs0WWHBS/MjGV6R2r7xGs68p6rrqwhUoQbQ91qDSk9?=
 =?us-ascii?Q?h7y7XuKipr7cE2rrY5a3DyKogeM+GDhfZujJ5/PCPOdAUGBwlBxaKxegp4Gz?=
 =?us-ascii?Q?UpNQY4edTBs5TUWFiQR8l497Hf96OYXvhwyv2geOKfH5vAXvZTH0bQLgCE75?=
 =?us-ascii?Q?9v12kO8DNGx2xCX2mtnHzHLX/X53/2cyRq9iyWkNW8cTIGkGYg4NU0eFTcCp?=
 =?us-ascii?Q?uc/tN2Ndkln03eHH6Dpr7fA+otGrNkodEwOTblUoqgpKCcrlP0oEoTnIguGP?=
 =?us-ascii?Q?IelQZUdVQPMYQlai1q1jRg7bthLNtWR0vmFODzd5X/2fhiAebJHDplJXtfRK?=
 =?us-ascii?Q?cgFvVmtD7FPibvor8rdIYNqLPrJWSlzYdb8ptjS6AI8h8VuG4eG38My2Zcci?=
 =?us-ascii?Q?ETbiC2RvP+fA+u71ZSwlbQ69mb1dOL4DAr08ucpq8MuryiGszn/BVX+tnPhx?=
 =?us-ascii?Q?8zlRuaX315tYjd+SPd7e+L+w7RaS5limjc61Fm01Ng3iwPEec+x8OQpS0eoL?=
 =?us-ascii?Q?0AsFhBDnzn9ZeAXj2PoGC0gFPvv/sbOMyhH/4iuBKZDicLxuLEBTKTatDYsk?=
 =?us-ascii?Q?qaczUQ9hjn2Mn1xMiKF+5UMvypiD5zOswB3VxU3SbC5BfalPp+7HvDx+CJNf?=
 =?us-ascii?Q?+lh58qdLfAXXoRYzJoqAKjz1euiVeYTrzlRkKIoI+TPB2oW/Zh7wQhrNtZnC?=
 =?us-ascii?Q?NcOchbfRV2dU1gWziPJhP9iDvNR0jyLMP28ZKqyGlRaf+vVUi7bLgV6ISyuB?=
 =?us-ascii?Q?7Zuk5slWVlsu2yNWGK8ZxH856hik1q7M5RZKXB9DUFEJgio3wr2lL75nc+h5?=
 =?us-ascii?Q?/Eaz6/0GYE9jk/rqPErEuRvkzUyNUIstdWo3sSaFqzLTp1LymnoUveUqt+wV?=
 =?us-ascii?Q?6KI4H3Oelv9G7xDW+mQT26qWqte8C2nfQn5chyVmhx+xS686pFC8QLdeMj/W?=
 =?us-ascii?Q?Ywd2JF+ul6dLPsWf6Bk6emiV4fMDKMXWhmhlPJExnqqIKr1R65pRpSvqCf51?=
 =?us-ascii?Q?WzD+QhE+VQpbOcLoQATfuMu39rG800QZmM+g+LnmThtwUu8G/+I5no41cKNa?=
 =?us-ascii?Q?NTJtzVzXDLHDrI6/ATv+w1rhjeBJUDeAulnDoMWzvahF5tGKMhV8Z7VBxp4k?=
 =?us-ascii?Q?RSMp6rqiXVzp3lnDjnpwU7HP9EKGI7GfBduR8ZDJ5UAQdfzacDt/pa25qAg5?=
 =?us-ascii?Q?h6SLGlSY+ereVNWZ5W1dNsjCmbH5tl4D0TbnG3jgTlpS38JeYzzfyhSTSqJt?=
 =?us-ascii?Q?c7wxOGvwzR0GjvIXT2CvuO0RKsCk1RVLPOLWUcfqFf3IUeg75q1JtEtaBZNy?=
 =?us-ascii?Q?JwI1pFWtP1WRkjXX4RXIkWbiDTzDb+JP/mKqh4DmqW9ATFKEzvtWBJatB8yL?=
 =?us-ascii?Q?hoHUenkJMovs4pHrKEtNye/w0Meuvvb3GPjZ1sCnQZg6GbqjAX99hcRUbWi9?=
 =?us-ascii?Q?LQFNRaFlydYg6j7kjkQh18otE/8ZgTdoE0X/CQ2Xzwab8iCbSchy9k+mRPGG?=
 =?us-ascii?Q?qiwyAeFXRRjMnRZcGrhdZF6LNrA6iq2eKp0CiEAuuM9KIusR5AHATYRs2w4M?=
 =?us-ascii?Q?nZXVxJnyXvo1gR7nlpg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69e7448-68d5-4d34-fae4-08dd9209b6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 10:34:17.3474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3U2ySLzoPGLuuvrWDhFInaIrpgk0w9jGiZeoke9PNMlzz/EdXTGqaXzfkV95lhKk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx/cZjyK7bvlqVknn7yQ6mhvYqvzxQfbhBhIZKxwaLo=;
 b=C20e3g8tZbU9e2sMu4OWutGAoqbMry4af1YLFa0QcJYgp0xfrvQ96PU9zvxkA06TZPKiiata50LXbfsqiuV9+m+LPwvQvNa+ej1LL64e3Qf7B/UZu/QIMbv92nV6IdVMmyaWwiVr5Cw7fYnEAd7G4ILFqljg94xd+tx8qT16Fvo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=C20e3g8t
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>, "arnout@mind.be" <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

Just a friendly reminder for this patch set.

> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> other toolchains built by Buildroot.

> To build the Microblaze applications available with the xilinx-embeddedsw
> package, the following config is now needed:

> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"

> This change keeps backwards compatibility for users already using the
> following architecture tuple:

> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

> Either vendor name is now valid, but the documentation will describe using
> the Buildroot vendor name.

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
