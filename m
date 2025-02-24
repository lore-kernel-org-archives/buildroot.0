Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B76C021B3
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 08:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2E3406DC;
	Mon, 24 Feb 2025 08:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc14VorsZIoZ; Mon, 24 Feb 2025 08:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788E4404F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 788E4404F5;
	Mon, 24 Feb 2025 08:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D0D943
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7308E404F5
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b78MqakiN9Dn for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 08:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=143548ff4=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DD0E403F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DD0E403F5
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DD0E403F5
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:50:27 +0000 (UTC)
X-CSE-ConnectionGUID: dcVRnp/9Sr2/i4zHRloyMw==
X-CSE-MsgGUID: JOEkpaSxReuiuWdFLs1eIA==
X-IronPort-AV: E=Sophos;i="6.13,309,1732550400"; d="scan'208";a="39951147"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2025 16:50:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHz5FpUQxrsZXuvcpIF57d3UEDodHrCduwmH47jSInxTXLt07GrEzVrVcEshHA6zJ1gGA1ZdbVMRS/Sj7nfSeiOMEMDdvMLth+MChuKhJGybAqAFrf4YAVg64DZ4iH3atYrxcYwSZj1XdpSF2eZAvlyt2fAbt7FK0Po0gyI4IHBgNv1VgAwhYndLvqInBKiG5/IQabpLFMTF22QQ7GOAPPVp1j8qTFgDwqdBkGo6oVs+i8ENE6VW+8D1G+am0IzoW2WUeCr/iL/CCDGyZnKOHMwR7CBRwqYYqKCc19xK64OxAQdUN1EW76lITSRkSTTsl0esLBoBIS1nmjASr8WLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5BvEnqNUV0ZFOwKIhSsyCTz1Kd1CuTS2T//yJ/iEAU=;
 b=f/krb/h9ye702TBYz5H1I9aG79nweXvRVcp7l2KTscZyh4elWp2ESwpE+EnHhajTBF16FfYVkLOx9LDNEICCdMkFzZu7Le82HaYYAcMIgNzR/j+SpXao38b8DfIPd4bx1DyCbIMGMn5mfUdD89awnJVAMuXLvnkrSZUmz3RXEsp1ZKjUwnwRj7SjtgQ9banRCoBy6xO2a7MaNPaJzWHxD29qdFKDikZU1iNskhw7gwzCW6jkk2rMvyJX4q9xOjeSOAnYuuF7g5H/zFjbLgVJcxF8pWAgF3PXmMzJoo7r3pEetu7XO1fbAVcrnflMmqyP8kEGY4hjLMBGhZrCIbl3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by CO1PR04MB8283.namprd04.prod.outlook.com (2603:10b6:303:152::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 08:50:20 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:50:20 +0000
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Michael Walle
 <michael@walle.cc>, =?iso-8859-1?Q?Ga=EBl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Chris Packham <judge.packham@gmail.com>, Edgar
 Bonet <bonet@grenoble.cnrs.fr>
Thread-Topic: [Buildroot] [PATCH v6 3/5] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
Thread-Index: AQHbhLPDhI/KaA7hbUyMEu5a3lD0vrNWKNuA
Date: Mon, 24 Feb 2025 08:50:20 +0000
Message-ID: <Z7wyy7HiZ2KHCiVw@ryzen>
References: <20250221225529.441084-1-romain.naour@smile.fr>
 <20250221225529.441084-3-romain.naour@smile.fr>
In-Reply-To: <20250221225529.441084-3-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|CO1PR04MB8283:EE_
x-ms-office365-filtering-correlation-id: d6289abf-4f4f-421f-46b0-08dd54b044d0
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/oEk/czCg4vYqZbTIMKCLONnCK5PS2yVYnCXwrbAZLxJ/kbq3kGNSZ4f4/?=
 =?iso-8859-1?Q?DJtEbgFGulQd/eaYEcWLTo3HHKkn7zrlHs+8eCh07/yg2akJ21YySiGBWb?=
 =?iso-8859-1?Q?7q06PwBW+KjdEqyVoL2CWIYLPw9Xf7V31oZf7dAr64EqeoXal1GCgtXk0F?=
 =?iso-8859-1?Q?sdHkHTm3gjpfQSFhZ6EL/LL1qWs/n+cejary1y4RYxyzIpuG73ZWqQGJIY?=
 =?iso-8859-1?Q?HZ72sM6Pa8v21jZens4pyU5dEFwgflWMZE5OMoFWG4xDqTpPPah8ni0Tt8?=
 =?iso-8859-1?Q?pVFXzIBRuzSara6mMkKWSYp6ILcywA+oi+fpb4bY1aPGGRGoE/BgDuq3eJ?=
 =?iso-8859-1?Q?qIP/FgVTKt+nqI+EhKiwogyT0loz4chpDUtN8uAtbNjv8jf6R54JJwkehf?=
 =?iso-8859-1?Q?X2oiptqbShETT/yEsDAGlwxNrdKLDpUm5oqdGtq/7z8UNnX3Ctam18m2G/?=
 =?iso-8859-1?Q?iVgOZM5Vxw5kpLbWTJvy/ldWHkvYaisFWd2dfQ/RRxWOGHBbMuqD4GlC2e?=
 =?iso-8859-1?Q?2CL390ftDVk4xUshcOCqLelv7DR1btZOhPJufHN2pnxkgY3BJzJUm5eS4G?=
 =?iso-8859-1?Q?c4TCBkY57STJVp01AYUdFKHOnnzCR5SBckx/qx46h0W7rxUFATmbEM2bbE?=
 =?iso-8859-1?Q?HgcOaKew+2Z17h5hFRjy1idleL4VRzSq92tGwFGQaf+TLk7AztzLATM9Ph?=
 =?iso-8859-1?Q?fsczBOO0AoDDVOrK1InDgyUi8Rp5z5dWSl7d0LXRL8wW1G8NPfuc19eci2?=
 =?iso-8859-1?Q?JIJGe2jvFbGiVSIili4xOrh5kBUfQfekdULdcUdfBK4gdhL1ZeFDNp1eQp?=
 =?iso-8859-1?Q?acx7DHt/+pKbb9tNp2nhW1eUYB5ex73nMGAc6prGi5IlwK/77M49D+iH4z?=
 =?iso-8859-1?Q?uKDqBNZ5BmLqQuyu/a6wjwwveTnjK3YYwmLhhDP7UFC0zcONOLcs3ZkKD7?=
 =?iso-8859-1?Q?AZZooZ4AtLW6wc8BHD5n9t1pk/g573LpzA5YBsNKuDrgXrVkoxy66fB5BS?=
 =?iso-8859-1?Q?dyTAunhFwXq1YF3Q6oeKL2zakYBTTwMk+6sxQzgBoSXDy0sXBuocB63vY9?=
 =?iso-8859-1?Q?GRsl8HGCkzBvHveVLlRQxHENx8lsD4aWSR/RZXWDQ4kRTWlVqMWc5RJ5cs?=
 =?iso-8859-1?Q?M8N24NWVQ39BxQ+j7nOC8qqJLO7xZJTGnKljag1nmuy+6OZngjPc8cFVV1?=
 =?iso-8859-1?Q?PtvingI7xwnkIdiBFhwA1rFS9wo0Vw5BOY42/JUD/qILNLMBC5fX7FZsA7?=
 =?iso-8859-1?Q?6QqCOxzAH/BIKT5l6YgC+XD0mQnfoB61ke/6LVT9C3aJJw+WSwH1ddy7fG?=
 =?iso-8859-1?Q?5QM39QPNwk0WgNFDw7c05E8Ssk7mGsqOabp0FhnHgXbAaMy49J3aI/Q9pM?=
 =?iso-8859-1?Q?+lZtCRhbLU1oicg2QmTHDm0WX2lUGV2ipSWuzHsMkuHJvgtgCCwgSIq97r?=
 =?iso-8859-1?Q?U5OyK/P9ErNRdqDJxz2wufWAqOkVSF0X/BDjsoAo3DlYif9mqIlcRaGvfI?=
 =?iso-8859-1?Q?nEfIaIz/ubB5lh6Elox2ut?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?M+g2ktFv2+fKSGXgFGDO3S46ITujzRj7tD8+s+DsCqMwEOti+TFAi0ibAF?=
 =?iso-8859-1?Q?WBhIQNP3EZsELzr1jlnFMgOgXDW9sFelZADEoy7Bxu4A97Sks5Sx7IDn1A?=
 =?iso-8859-1?Q?M3zPRJzcBDwfQ9+amsGO9rWcLW8J6BPrxEA8sOnvEdyYVTShm/dIBe5iig?=
 =?iso-8859-1?Q?f2Bmh431gMpnwEohxdTer4/8WLJMWupNdzI+q/Wg6THGW2vNXCmnkxd5Fi?=
 =?iso-8859-1?Q?mRsHbWZzBzJrDr7NE0+BxaO9zN4eaUz8C3AdvY1GX6RybIZYuikmLLHMt8?=
 =?iso-8859-1?Q?5Uzmq0PefUa5+cMDQZmN8p9L7vPFZcIanxf/RbViUxWC4F+qvueWodDT21?=
 =?iso-8859-1?Q?xgpnuHzlcYuRD8hzS5Cc3Mn20e3H+7P5DMMsrTVHOumxHKNANwt2WhFtu5?=
 =?iso-8859-1?Q?hQbZA5ycYvW2rhTDA7Mb20kMzSx9pkPHqtRdRk66TnMt31FVQZmAlfcBKr?=
 =?iso-8859-1?Q?IFTCmpJ1mCrMlBjwS3PG/5DIj3Jh2AjbnqMH2iOMhyyVVEpa1F+x9hrcOG?=
 =?iso-8859-1?Q?5nY2BCq2OKy7xaPwS/DGrr29y1xshd2WCGuYRJ4hcq8fQ1t/rC2itjIGRt?=
 =?iso-8859-1?Q?PXvUSYbRLrbssaqkwPy8Ro+t/PHRU2xGZa2NG4B1UyfM94P7I8/XJMOi9j?=
 =?iso-8859-1?Q?y1clN5CIS6ULO4DEIlWsrtlCxZQ5WOhgm/QElVZmDv/jokVd1uueAek+ac?=
 =?iso-8859-1?Q?zF1f3051AbVeHwOIueRFD7qA36/iIYA7Z7dJcSi2+RXSUUvzzfAlLVAhL2?=
 =?iso-8859-1?Q?HqxfL7iyLHHHd8WYGmWwoSitPoWJTDEJZ7mo1ox/3TQSgKG6ll/Q+E54D+?=
 =?iso-8859-1?Q?RVnfrjbDjHSDqkpZDDiFxaBlCpUvsDWJd28o8S4S9n/Wnt2yRwbGUpOPIs?=
 =?iso-8859-1?Q?+DTZX7/ckSy1r7uPo06GBdinIyKsumiw8IO021Tn4RmXTUDEERKJj4j/NY?=
 =?iso-8859-1?Q?D9Pd8PGr8+UPAmbVduDeAao0IXvxG9WQuxwn2S7mHPk8zSDqDaB/p+qkuM?=
 =?iso-8859-1?Q?Bg1XJCC9+jjEehSo/gNemtDHxHwTTeZ9+roz3mow9NgQkyk3UZJyySZaN0?=
 =?iso-8859-1?Q?q9sXY2S73KLcCgCTX9hx5XP7VVAOklDYmhkOxeu4CVY414MthGv2zZL5+0?=
 =?iso-8859-1?Q?e8MxkTg3kU7LyAy6Hvdaw70Jmcpc7L2Ana51CuT5NZzk9nnDOsI3qALtfk?=
 =?iso-8859-1?Q?+NRr8FFsLMphCHMFiWQGYDeRH4eE5tGcyYTEhAGuwC3QNF1zPdoy0re6D2?=
 =?iso-8859-1?Q?uVCJJkFySrGe/NqGD2+SgmVd5Bay+0ptDQTSTmNY+eK85jKGkfGf/VYZRJ?=
 =?iso-8859-1?Q?fYjwORdBlydw2vLXs8/z/uS78za7FRQVRJfHLeGUkOYoLnmvDK2s6LUao8?=
 =?iso-8859-1?Q?F0rGaDzGE2FKkIRd9rk9vBZMLynxVt4EWJE5YrwATL3ZFYUG3134/DXU3S?=
 =?iso-8859-1?Q?xk0qNo9xs4vYro0kxcomVoL4DTBj5cCKzzh2dVPm4QemxrYYkIpJKBjI53?=
 =?iso-8859-1?Q?fKftkG3lDjOglcmSNr0iok8hEDyCshzS6p6M9zNGEW+JcedJyVvhLWyCr/?=
 =?iso-8859-1?Q?G94sGUHTx9SvFC7NC956+j3dofK8CSKMR9NgXlG2YDLhs+QjkH1Rg+gqPB?=
 =?iso-8859-1?Q?Ghjs42X9jEO5NVayQIK0NZm2zq3mbwOTcqf5IGQVsUeeNT7dgfXXYutw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <80196C742ECBAF45B1DE223375858EA9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0ok+k1gKOSpmZIuqb0Q4JZD7h+vVik0cc+zB+y3zgCnE2VyYT4APX2aOpGGpuZjMG6fj/WwqzIm9iLdcP0PrjW1inILxSLg9R03Hi2J9YYIKjq3/6qSkXhczYB+WFOvKkU86iyvkbq3t438SXDztdRmx8NbmW4Bp6Jj8c6tPOpw2gWYuN9GfyFYf/TeWys+bV1QsdUSliw3XtS3uuEJhCOvYX8p9O7GVpFLc/R5Prh+RRtpEmbAGEl1iMcCqE++c9O6sUMaZ80HCxdcMP0olx0qPi3D6T9324syb5MZTvObkkDPcYkOH5+N7Y9pyWswqOHrTSmtHGlxPF97g6Cv3vy2vu2ygcJ7vBd3KnMoMbi4nVKjpLkBJ9lTl5SBmujc+WlYAXd623y037Pmd1Lr108GYPEWeLNMIXY/ngXvlbY61cACo4slbzuQf8jRvMbaifMT4XoJfwgb2dq4OU5hfb/6RaDPo6AQ4YLUi9/SittCDOVpvcpXuEB4UV+K62418bVy+raXN8ZC5vQqecL6Se5ncBrgIu54L2e0ntKsxZiC8EccHKBP3dTuL2acHLxlXag1R5G6Sj2n4Z7RAFFHIxhoTD4WReZbA+Cpv+mQpqslGzZ+K2/aBLQJfxhOxBdhc
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6289abf-4f4f-421f-46b0-08dd54b044d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 08:50:20.1441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pioc824pLB2nSuxKIUBUkQz8QCUSDX2psLjuYl2FEfiqooqtlrjgtV9Qehp/G1R+NMSAgZHiO/gCLswEfPOKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8283
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740387027; x=1771923027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=I5BvEnqNUV0ZFOwKIhSsyCTz1Kd1CuTS2T//yJ/iEAU=;
 b=S/hbBnZYOrcSbccU9QeeaxlYFIRpJ6j9ZKhDTgNAar1l0on3wkaUfzbC
 3DT2yx2evIr7zUtUoFf9hh7lZV8qQf9iovNW1CABtjZL+vKrpZq23UWG0
 izMu1f3ZgqE87WQKI7RkIoc4QMdm0uK6CgpbJAkqX2B8urHQXtQpky9b7
 WQD52yCw7HbUcSZmBPRZiEE405WDRWX0/Us8s6gmqeIij8QcX+CkVKDOf
 BSg4S2dKwdrHdetaos3IdZHsFrtcjdzxBHWUJENqJS5dHsXy9rlMs6hR1
 NtvCiFuJuKjAMsyFQQlGJv258LSeRt24PI5qwKs2DX5WsfVr/9KHDj7j4
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5BvEnqNUV0ZFOwKIhSsyCTz1Kd1CuTS2T//yJ/iEAU=;
 b=dh+3QabMWK27pwIM5O9REkufsINofpzOZtsM6oJSuFS4MykAcZBP52OlBz/nxhnOeyfA69VsQ4Ebu6DoIVouQt4P8a5UILYQFJjhYzclBPn6v08I5KGr78XKF17fR5BmCILOcMkN1jEJdhT7FGmFDuHSTvuiM0DHTsj1etkPtQI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=S/hbBnZY; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=dh+3QabM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v6 3/5] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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

On Fri, Feb 21, 2025 at 11:55:27PM +0100, Romain Naour via buildroot wrote:
> 
> Note: We want to create a list of dts files (LINUX_DTS_LIST) present in
> diectrories listed by BR2_LINUX_KERNEL_CUSTOM_DTS_DIR. But
> LINUX_DTS_LIST must not contain BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
> paths. Use GNU 'find' print format %P to print each dts file path
> without their respective dts overlay directory path.
> Do the same for LINUX_DTSO_LIST.

Personally, I would drop this Note: from the commit message.

I think that your commit message is doing a really good job of explaining
the problem (and the solution), but I don't think it needs implementation
details like this in the commit message.

If you think this is important enough to keep, then it should probably be
included as a comment next to the definition of LINUX_DTS_LIST instead of
being in the commit message.

Regardless (if you chose to kill it, or to have it as a comment), I don't
think you need to send a new version just for this, it could be fixed up
while applying.

Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
