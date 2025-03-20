Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A5EC28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 09:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DFFC8211F;
	Thu, 20 Mar 2025 09:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOJb08o51kX7; Thu, 20 Mar 2025 09:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05812819BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05812819BC;
	Thu, 20 Mar 2025 09:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16B2D12F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 09:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC85040655
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 09:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyqeCsJD_LZd for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 09:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=1678d9164=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8F354059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F354059A
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8F354059A
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 09:01:50 +0000 (UTC)
X-CSE-ConnectionGUID: sgEjiFUGRLK6NHUHmJCQ+Q==
X-CSE-MsgGUID: qu9Z2UO6QOqfMQg8KU2a3g==
X-IronPort-AV: E=Sophos;i="6.14,261,1736784000"; d="scan'208";a="56577844"
Received: from mail-centralusazlp17011031.outbound.protection.outlook.com
 (HELO DM5PR21CU001.outbound.protection.outlook.com) ([40.93.13.31])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2025 17:01:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec5FYHDwSd5e58ItLCuKCbrfPsfBFj4eEbRzqT0ee5ZdKgCITaaBPn5J5QI2S7VMigNcBRswn9c0pnBboygOMBA2TL0Ft9LnK5hvuoD1rARtZRwl02ummKgYCP/ew202YV2oWB5hzwHzbe6QWvv7TfLrKgmAuysN1brcYjnd9n5f631zidVXdqDD8pMBMLNK9LSZm/76UF3x7zfC2ITp9RWeglFWy2J9L0E3UzF/CPlXQ9TFCLtocx3PSEds/ls49RN3s1WKKh2+XjTW5hb+CNF5JnFMDnZ2HZ49htet3LluRziU3Rx6goDAeN4PVV6t2McZ9VvES3MofKN7+SXjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUC7ecsjYMeJjPAqsPxHSePSb+RpjjKbaMQmXf1+Fvo=;
 b=Q85OU9l4/+AbwA+p+SR5SQOMi2OdBcYaE2o1x9K57VFQOLiJah9PQFQKN30xeOilFSq5jm3iL1vtztccXFMNn+V1jpA/gIwJAL90CpI3YvwyQQszjvGgVdSFI1In/bH+tlF5U/fhuX3E4CmXUGukAQtH8xgadZJJr/dZOGXs5ZAWBrruuDMumHbumzkjWhl4zEUoMzdEGCZyjHNUayy3PUopHwZJZGVA3SwIxXD5Nk9cRuLgw+rvSIMr8tbm34/LrnksAEtZH0JcjjqRtlbqLgkIPIqJj5ihvWumUCM+g7aaTpBNin+XA5t72krmOogNT0DsBVj/Ih6gt970anywDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by LV3PR04MB8968.namprd04.prod.outlook.com (2603:10b6:408:19e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 09:01:46 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 09:01:45 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Damien Le Moal
 <dlemoal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "Yann E .
 MORIN" <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>, Romain Naour <romain.naour@smile.fr>,
 Julien Olivain <ju.o@free.fr>
Thread-Topic: [PATCH 2/2] package/linux-tools: selftests: Add path containing
 BPF binary to _BIN_ARCH_EXCLUDE
Thread-Index: AQHbgfKeXGXHHFuhvUaLgtfbrLA527N76YIA
Date: Thu, 20 Mar 2025 09:01:45 +0000
Message-ID: <Z9vZeCCctKVuW-BB@ryzen>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
 <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
In-Reply-To: <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|LV3PR04MB8968:EE_
x-ms-office365-filtering-correlation-id: 6e7cd9c7-5b18-43c6-ad0a-08dd678dd736
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OAHpBAW02DzoaWbLI4ND3VLe6xtKiAzeC3YZ4shDc0wHsgopoPVs4U7TmzXb?=
 =?us-ascii?Q?Z2rxrog7k9rMJPmKaotpxzGIE1IpDj5zQNmwEaqbUyKzOYsNqWhz1jvZCSq6?=
 =?us-ascii?Q?RKPaAJ4DynVN5xI7LpfIjledw5mtS5+QCyvtPBX2E3O7sgQ6pIRDtTsNj7s4?=
 =?us-ascii?Q?P8zhzZ6tqSeR5viceGQUtrigtxMhlWKTOy87UVW9sHKMYUz/ZmJeZlZrs8/3?=
 =?us-ascii?Q?4grFemORU57Kxx33kUVpIX7gwfUtNvaZf78Ft7xWBlQ3H+V0D/Xe1jWn3MPb?=
 =?us-ascii?Q?v/vlvGmivOsWOEixKuhCMZ63Nu/a5VhEJBrIt5H9dKF/T57bLL9CmB4wX01H?=
 =?us-ascii?Q?QsYB+q2F4QVmGhvoJIkFz8icNbllA8N7BJObDE1WvXjG+pny2aoHLFDvZJl3?=
 =?us-ascii?Q?yBeeGZhdCgSAP6JCR8nRgZEeKhkF9leP01Sw23AaJu6cBcHrr0P4k4MbcIFG?=
 =?us-ascii?Q?rQQkhqilJY1JYkuuOoA4Qz4uSijFrr7oU2DN32fB520bK/FGZaqLINBX+dfl?=
 =?us-ascii?Q?NMKM8bVcJ2Yh8Mtw6VbXCFFrYqHoSnIIJT3cai/bNlLwLriqj7kxEmKI9RH4?=
 =?us-ascii?Q?yuIsgmnA+iYYfcQuRfYx87ypXACFtZWsoF3PTwnkuEEX3RrUYU2qhVc4SjOX?=
 =?us-ascii?Q?JLTjwLOHdnbCf2YU35JPIxOQFSY27XMZAcOaX+b2Ej8fSI8XTx1xcdQK8ne9?=
 =?us-ascii?Q?WQgjZ5BxZsYikLi4QjCI2etsS8Vsb5ytpHf3y2FhBNfY7lFOA1BpT6fK4TPp?=
 =?us-ascii?Q?5N525NMWXC+DF0ILng74pNeiNq3o+qvOmEAmKrvWI81nCVpi9TBYlqh/cVm9?=
 =?us-ascii?Q?reFqDH8KM4ezzLN/66xFX24pUZulgqG8gc9fmDY5L34lZy38hqeH9UzsGAi9?=
 =?us-ascii?Q?UVifDbkvbBkdWv4s2fQ6HzI9n+5jIXHEfKDkff9jdzSpZUEWELvMqDPpfZyP?=
 =?us-ascii?Q?AohvTzUlMPSwmxXBQKQWGlG4+eIKy25sN1eO6VsdHdMIaS+8qhnQAq4pwG/P?=
 =?us-ascii?Q?Wyb7gguZ3YIzngUtZE0LGq6QLkvWMxpXztTryRtCDayZUJqR3Es1ELHSNIXa?=
 =?us-ascii?Q?Q9u4Mc2GVIeVQa0zcuVyQFtqXvpY21PNU2HDaSpvz/w3dfyb5yDMHMvmkZQx?=
 =?us-ascii?Q?Zq9kKUD9S7Nn3hevQM3ek3E/TPeoJmipNghsTmkDfh7JSg3sQNdbpnAtKFSp?=
 =?us-ascii?Q?W7mPsVmWqLdumX+OmRNj10K4gz0okLk/7S1xwwFNjFsnaSfeIaPBJGIDi2Tf?=
 =?us-ascii?Q?zjVX+SXmd2zEqSFbihuvs8vJkpi01LEXdV7PPzrm59B9D/BSJwDmWx9aLNqY?=
 =?us-ascii?Q?ZE1GlxqzNalIvrRozuqhtM1i+weIy+XKlK7L91fBttpneYGU472OF1IL9nBZ?=
 =?us-ascii?Q?zzlDOuW2bxU1qEBjHhERuysQ8KV7s5UHVPmN0QOe4is9jelFC1To5gnbqh7w?=
 =?us-ascii?Q?jiZqiXIDHqzZDYWtWuwnadrS/wXGi4i0cNAIRr52DxEBppPuPkyI1w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lbspFTM5YJqUTBVgwLiKQvdqOWFsF5ZGuGmXBUEpnBqr+dqaW4Hngaju/ty1?=
 =?us-ascii?Q?kR/EAeiqMG0yocoWg42XaUbJv9mrgGJs8ABFfEsWIZqBOl+hRJZVCeYa4YKo?=
 =?us-ascii?Q?VwKHNLfsixOr20KPvR/nWWJEowQOwqPggbSom9Av+29pMsGxBte36kqI3KvM?=
 =?us-ascii?Q?e40wFDpe5Tt6KGsJ03bntVjV+trX3IinHgiGNgfqlIJISYV0uaHDFps/wAx7?=
 =?us-ascii?Q?8H/Zh3V/K9SzMfPgF8CSYlxDpSiVd9FsZLKwk1UP5pcWBQfsIfTwI6G1I4Gr?=
 =?us-ascii?Q?2xXVZJvi5z09/H0y+UdjCrqimJSxRz6AI0eCFYLvtXTPPyPcM/urod6tlEyA?=
 =?us-ascii?Q?eafW63eKxA7cZaysq+ymWj7ZTy5tWEzCokQamful6RZTBz0utWMLaZ6IzXn5?=
 =?us-ascii?Q?3JenWVM+elfjKJ35AMk8dauKtYyvSqPy+tjXPRXIqWHaMar6O64dUhecAufN?=
 =?us-ascii?Q?FTW7ROCTNDEJWJ4KpZWktG/UCRfvGjlzujuPlndDCKdsftrJrF5pCXQ/YO+t?=
 =?us-ascii?Q?MpSUOeMrL17vYB0NnKs0pl0Eg/t87XLNg+0FjEvchNlvARlqRblYnu+fzgmT?=
 =?us-ascii?Q?+Hu4uXYCiep12qTKU+4Ec/oRtdjZasauU2k34P9J5unWf0+LicbXjmW/J+O8?=
 =?us-ascii?Q?9h2bnMuIrJWtdr6b4R6AzHJ9TrnHHIg9XMVZ2HcGMzRUwmzI2MwTh3sOts7T?=
 =?us-ascii?Q?EKcMpm9q1Nbo/vn48jhmn7CyGLc15fbFVdKwUE7BjO0N9g1NJ2K/1ayXvZAm?=
 =?us-ascii?Q?0IKQMFrjyGTByb4oeJ/csOVeBBK2FHAmUale1cWqQoW+G7zW+oo3bI7MZcMQ?=
 =?us-ascii?Q?uZ3GDevqIh6d2P2DtkUNvRoqot/wbkd5NPFhFXejx/52g/pC3hz9vGqvoYiv?=
 =?us-ascii?Q?BFclUwrvDUN3Wd8Qag1eQCd5rVhxzVReFgJ1rgPBcdM1HC+SkHkcV6MZmwFY?=
 =?us-ascii?Q?LJhmOZUiP7pzmldQeNpg+ZWnb2Xdw7KEoqrxxGVomIACCVBr+zaWnqPECZcc?=
 =?us-ascii?Q?YLRiPqH9In4nGYlkjoT+277oY7nSZc+Q5EVU5uAglwXzvOAYSr4j10q89OCy?=
 =?us-ascii?Q?+whQTmBRlwE9YDdODg++cjHvO35dN8SZYIDZNZgyerkv5YbMkN8n35aUl764?=
 =?us-ascii?Q?lcXmRXrYZ4mQSG/vZobHeBDpBH7JhrxvO33/rtyKCSEXUYRCe+abfLxvidne?=
 =?us-ascii?Q?OL/U3x7pnwzvyUu0GPxApKsUebd3qP4F/idJ9TgG8jNXk1ne2Mk/q0Pyk7NF?=
 =?us-ascii?Q?bnWDf/rlaf16iQ2szLuHqwNDYdBsArnTuKcTugGcV6KXlYGVBo6kIFgK4hoY?=
 =?us-ascii?Q?h7ol2rtdNKLvDDVqcG7chjy43a4l8Qkj1XUloKFuugBaty64sW1tiPZYgzkh?=
 =?us-ascii?Q?lZWhI58PKKb8oXVjYyShYVKIiVeiHPBhKGPn+YC0AGNulsj38yolIsRjwn8a?=
 =?us-ascii?Q?XSwCMC5SPaCHC+rolTm4pyWjY6sB4ogWkE8nYjeEoZumLGwZsReJh/t74gt4?=
 =?us-ascii?Q?AAz5sh5nkxowUMyx2yXqZtkVHG5IWRVyoTtwzhsEks5fBKdY+P1seprO95S9?=
 =?us-ascii?Q?7L0kLLy82U0zNHjZFXkfWGJx027x08s9y2G8Oo0dplIYVIbqvF6Gd+uLkDfN?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-ID: <20646AA5D2ED994F91F3FC8759FDB47C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SEnhqM8Iba3uX/TKXGXCyU5dAq1Fhr4evCVpsYP+SUMtIuBdN/nbTw4DS8iAIk89Vs/e9zbl7QCxPHL2iZGo/OxIAJAQ+PBjarnuiKd9gkCUfiT7oMnAw0zo4mKydlf3JcQzWd8Dgk+0VMMbnvlNOS+gY4QowOlAL4A599fs5DiuXNrEYZwFoPHJAftxfHJ6Tp4p4jxZzkBAqzPZKOCdFtMKoJkkYDJmqcPk4ck+7NkRURr9N+gExy+9/dvDTQ8CvEwBDsgTUTlDPtRHLAvJbUcvESGtLuJNHk9i8vXofxpb2kRAP0pakvSriXy1xAQ1RF/VTCgUkNNpObSSnUDehiqGkcYxXScG0tSheLUpQNpTYVrfhRn0C9EI4Hvfx+326Kl7k0gXEbZCFNKvrNr0MuISkKbr/kugi3zKcH+ny6g9HKxOYXhim+gp95/CSvmPZ2BWknOgqpN3dJA+AgaG9QM2q+MyqU/tRxoUaOZJLmDfiOyXFjg5XcZGdymPSZQCuPfuyifhY6O+DeR/RfjhKHnPKwpo+R/Kg629fH1uOK1ZYvSkxxpJ0zTTIfGCMp1YeJkvgo8VZBpp+hsdg42U2jymCsbnVbFXiMwSnHtJmt1yR1ig/CblMbLFfE6QyTc0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7cd9c7-5b18-43c6-ad0a-08dd678dd736
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 09:01:45.5159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsUf0JniaRfo/bQiC6JD23uQR/NU+tZy2QBC6ZaFcvFGLMktqSoyNRlYCSd8pUXiJxWWxAnBeITl4DSJyNndmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB8968
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1742461310; x=1773997310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=HP5KOoXYAY+9kvsVDQIUn8j7jNM7KJEQvZFZpm/uiao=;
 b=GVsnAmakYHc7pHZIZSXOZDSrdgMgJkKmPJIyIQeH5qobsDrrp+Kx87Pq
 fkIi630zYyHhLhpv5Z39aeLMOC+T0/OmTWriA46Vy9pkOATkCvzrV8faz
 0lb790Ys1VAs7Lq9p9gL6I+OlFWxr69J+HzOS4igb8QAC63KO7AVNDLdC
 9gkn6asgyzTM1bALv2sgWIoa8ATV+1/XCjLJjZxU9gvRIistesrilxskm
 Ndy3c3ewDP76dJRyES7p470+tcEM9SIIpOzHumuEpUmny/OUH1ZesT7UK
 btV4YoYiCjbnr/o/SLkmytbfbeKQ6lFwjayL6TFCQeYaojZOC8Afa+brW
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUC7ecsjYMeJjPAqsPxHSePSb+RpjjKbaMQmXf1+Fvo=;
 b=QOTmCLJAE0JuTCpM+7FlILmz225ah+vulxuL87nx4C/5rYmkkUjN6InMFT4AouLv3buBNMHWTqfFB9wFL+evryNCFuNO2G5rsJ0B14eMgrjFdf9j5nDUAGkl6kq1ep8D2/2yuzYZtFPrz2cmgUitluRrKkiyKKccuK+/zSbW4LM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=GVsnAmak; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=QOTmCLJA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-tools: selftests: Add
 path containing BPF binary to _BIN_ARCH_EXCLUDE
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 18, 2025 at 11:48:07AM +0100, Niklas Cassel wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Enabling BR2_PACKAGE_LINUX_TOOLS_SELFTESTS (on rock5b_defconfig,
> which uses kernel 6.12 at the time of writing), results in:
> 
> make[1]: Leaving directory '/br/output/build/linux-endpoint-test/tools/testing/selftests'
> ERROR: architecture for "/usr/lib/kselftests/tc-testing/action-ebpf" is "Linux BPF", should be "AArch64"
> make: *** [package/pkg-generic.mk:402: /br/output/build/linux-tools/.stamp_installed] Error 1
> 
> To solve this, add /usr/lib/kselftests/tc-testing/ to
> LINUX_TOOLS_BIN_ARCH_EXCLUDE.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  package/linux-tools/linux-tool-selftests.mk.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
> index 0bcc47af0a..db7e4fa1a3 100644
> --- a/package/linux-tools/linux-tool-selftests.mk.in
> +++ b/package/linux-tools/linux-tool-selftests.mk.in
> @@ -26,6 +26,9 @@ SELFTESTS_MAKE_FLAGS = \
>  	ARCH=$(SELFTESTS_ARCH) \
>  	KHDR_DIR=$(LINUX_DIR)/usr/include
>  
> +LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
> +	/usr/lib/kselftests/tc-testing/
> +
>  # O must be redefined here to overwrite the one used by Buildroot for
>  # out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
>  # not just $(LINUX_DIR) so that it isn't built in the root directory of the kernel
> -- 
> 2.48.1

Hello Thomas, Romain, Julien,


Any chance to get this picked up?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
