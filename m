Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4FACF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 21:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF94740338;
	Thu,  3 Oct 2024 21:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-7nrPIcu_ut; Thu,  3 Oct 2024 21:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4BAF4057C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4BAF4057C;
	Thu,  3 Oct 2024 21:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77E7A1BF34E
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 669DE607F0
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 21:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3A_Yud46l2mS for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 21:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 034DE607E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034DE607E8
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 034DE607E8
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 21:18:14 +0000 (UTC)
X-CSE-ConnectionGUID: fdIdjpb6S8aNh1V0a0HImg==
X-CSE-MsgGUID: IDXfgpI7Tk2rWj6P8krNqA==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="27574070"
Received: from mail-eastus2azlp17010002.outbound.protection.outlook.com (HELO
 BN1PR04CU002.outbound.protection.outlook.com) ([40.93.12.2])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 05:18:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYDgbMAuW5ltAichtpEHze4l+ZRIV7uYxr/Ohv7kzs+TjcqgRBLJAm1NR6GKs0bRbI03fr7OYnI71/JkknXdSdgXNlhQ3SsUJ4JPE71sFPUvC0ikjvRGtxNbedm+BbKtueyKAs6mTuBGgvS7sX1HIQqy3JJ4synAvu/9Dqer2+0BhTSCntynqO7Z88BH6wOrWwhd+Ow8+ib0tO1tHFTRYW44eyJyhv85IEEs540H3RdbTjCOxquQ5sqj87v48u6Wo18WFCZlEgXWv3ckQ8OaeIq/FWqD6ChKc097cEbS4OuD9cMbG+/QdX7VRIzDYJuT51O7MIMFV0xzJs0UgZ93Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgsM1++OSg2FbacvveDyVj+dv3QM9kK67ADnfZYJqvI=;
 b=X9H1O12y67DV/LisJBZW3i539jeP9Dfmw550WYDtkabHRLpRlzTQVmEFk4QhuKUaMNA6N0ea6txAIy6VTsN7CPNC2cCM7QaUl4g0g6xx4GvquPcrCCO2Lb5nC3IUH2ZoDRKXAe2SDG4ZmQNcpf0bBXXUm37CpKLWUFikRYMwT2z8KFXHsyOWhl0yY8YmOr969Gyvd4H7MCEUW22q2UL2L6Y5kpJe/6pLxoBbYDvmaZhPwJnSsvhE6RICeL4XdE4B3wHk4W3YFXe5+cru1uKYK1Q2HQmZvCxbRmNwCZr9fMDXRuxQ0RFEzb1LEmqygXOuESHJ3pBo6Z/RuGT4gJfyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN6PR04MB9382.namprd04.prod.outlook.com (2603:10b6:208:4f0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 21:18:10 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 21:18:10 +0000
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v2 1/4] configs/rock5b: update to linux
 6.10.10
Thread-Index: AQHbFdU0HK5TSxTgPEmCUQfP6u9qLrJ1gYCAgAAGVAA=
Date: Thu, 3 Oct 2024 21:18:10 +0000
Message-ID: <Zv8KEm0yWWtNv8T-@ryzen.lan>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
 <20241003204515.403551-2-niklas.cassel@wdc.com>
 <76588525-e39c-4bd7-9311-bb3bc412cbae@mail.de>
In-Reply-To: <76588525-e39c-4bd7-9311-bb3bc412cbae@mail.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN6PR04MB9382:EE_
x-ms-office365-filtering-correlation-id: f05c743c-9b08-4a13-90e6-08dce3f0e24a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tTjALokRCBd9AIL1G1n4ZzjqDFOUzBS1J4iLTuuGX/xH0XiC0pG3SnTu2TWx?=
 =?us-ascii?Q?b0ukBwGGoWiy4bjypEzUVFvBInGW96+r3L/VuoiCv+2wzq6pymVYjgXs9Y9P?=
 =?us-ascii?Q?g759MYzAHtnbUKogUG+2KGq5rtiW1n+yzh9ZHeDKTazqRYLrAayFe3APXvhw?=
 =?us-ascii?Q?LxsHhcYBxFCZ1boYuUVJr0k2wh/DI8c5KjLHOZYB68FSl6l32L/Mwjl/6YrY?=
 =?us-ascii?Q?k8ze8G0qh+lB5HZS4ptkdTj/865EC5DQDlIAvtj+p60wLKhyUfjR6Dzprp4g?=
 =?us-ascii?Q?iEmXKqpxzQGS93vVSfft1Dgm6omp7OuLh9ii1b8VhAqgclaeOYzPSGDjpKPa?=
 =?us-ascii?Q?SNryQFjuuY/yt18diqKk9ZomHUNB1700txW4feSBrL+QxlmrLpUnqn1F1ox9?=
 =?us-ascii?Q?BFtj1HV+zVrrNR7kounm29xwy8FmdZ2IW2XZVaGiJihHxhwEItH8ntYFaucR?=
 =?us-ascii?Q?2afjo89aCZK686DHiIafnUUlzwJjvgiK45HQcqp0s5krtEBuQQMDFb63y+wI?=
 =?us-ascii?Q?Q6u+h+Z/DnYSmB+Q9baWjOGlPLmLGutpd3qS0lsFzL1VYlJ2w21fY3k0WLiD?=
 =?us-ascii?Q?ziv74we/0VTcvirGptQs0WSkfUqBErwUOJfWetmzNEErhuoFyHam5aem/C2C?=
 =?us-ascii?Q?BMXxBF+G4ZLJy2PyAMvKMXRMVwDCqpLgymd0n5rVR9p6xh2prjzfduAzK4H1?=
 =?us-ascii?Q?izjog+tgRbWEIbvK5zXJkmhAZBIeinYYdXrMl0mpvIi9WTZZWBURyiUz9QlD?=
 =?us-ascii?Q?G94SWaqdMjKzaCePXNItDOfamB1MhqJJOGHcCMg0mpqZlvCtEh6LxcNxxARp?=
 =?us-ascii?Q?zqgYgk1Kkgmzwf4+pwBYECDmTzk0Pka+yE3KrEy5ebsvDQIpio6KAeu4bK4L?=
 =?us-ascii?Q?xEEo3xoOkB6bRmCkdd1pVYMhRqc0YPJR2zXp3m6PdiyE4swiP1YZIbBoW1GM?=
 =?us-ascii?Q?dZyxvaI+i1xIA554xHKSBE94q5SUHEg3VAJqW9FTgkLs2SPhwnHKJcBWjoi9?=
 =?us-ascii?Q?8MvNe1BbUR1wWFOeFfmLs8a7P4TtyDVCizy927GmI8k5t8Mwgvn5eQ2Zk9E0?=
 =?us-ascii?Q?9eKeaHsEqB0VK6xPtv4apaisoRl1GQDeWICki2uWLxF7O9lkp5mMwqs5rJIl?=
 =?us-ascii?Q?+my+rHnqHilIn9LeNsUpdXtyDIZqYb2emJBin/c+IaqcPM4i+MmIykRAgIwC?=
 =?us-ascii?Q?Rc0PBN6+pvMUaEylCMXxPSSWhFrNtgKGjy50rNzTZsV/LWB2L0aOo3qryVip?=
 =?us-ascii?Q?yRg715fMgi80cw4pCQqqbfrTiYQeRWT4kOWiEdconQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dXmvWPHVM3gF+lE3GXNutjcSBCAod/y8iCG3trn1wjUMpm/yPodvek7hskbl?=
 =?us-ascii?Q?EvBZdJG53oC0VySbXEiab5Qw0BkaWklrLy42mdMCIR1umUgsKU6ZHx5A6dFB?=
 =?us-ascii?Q?iKHmlxuC3GEDZx8/X0MPIXMAu6mLsY4/Yd18QNsET4MmUVmx+ierLx85VOmN?=
 =?us-ascii?Q?ZHcN95QrQuhGvJhSuHopK/V9ZdWa/y6PaFXFCiNpwyl8ruUCcJmBf1EaolTn?=
 =?us-ascii?Q?evk0oz5mixEJ0LLOXZWB0pI5R5J0iJTga+/O6U9iTNM0pxQA8Es9op1++mjx?=
 =?us-ascii?Q?tkdq/dTxQZhUE2IYJEdfQgtWEtnzaN3cIgJ1vHR3K8rs93SLl/9SPDBQL7xp?=
 =?us-ascii?Q?HQLJRHptb1RjVTTkfxlR32ocgchM5JjCq537OLUfy362fbr7rCMMEIG/mgZZ?=
 =?us-ascii?Q?Ys+1cOBErhPZAiDQMgHMWGxGgmkVb5XsT6UQWj0tzgGWNoDHhBK8JbJHVrAn?=
 =?us-ascii?Q?F6yZx+3EiB6jI/lz7hgn5Fbqy2YWsKtGmoJkfukC36+jVRZKll4Nxj9nn4hS?=
 =?us-ascii?Q?6YNdhf0z5jmYsAgq1/+GtJaKCpndI1f880YsavipifwJuLQtLtk2rKZ8TbD5?=
 =?us-ascii?Q?lJfP1vwrevlRjH3RKvYpkQxRJGztt83RIFQhHNE8QxvCJMSzcBh4GuCihkmH?=
 =?us-ascii?Q?pn/+eU6xxrw5+puvDqAZM+x2qtlGsANF8Yoxm/SXXlAwu8+x3xPt9V5HjJsV?=
 =?us-ascii?Q?JHwTXIDwgTjCcnBNDNrKDFqedEZh1/VxIfxJHl161dRZ+DrjySNp8wM2jc6b?=
 =?us-ascii?Q?1WJ2REwrZq3K4umrdD/2Gc4tUY7mznw6F0evGfbK+eO5Se8UIfHe/WtTUyvg?=
 =?us-ascii?Q?4xkqB9pqZVVCD+SjDTWrqsI2KvYLPAo+D4blu6w0eI8Hu89UH1raljxQ9T+L?=
 =?us-ascii?Q?jpSSCQLOr52lWMkR539dDdGAcg2Jvf6x+KCsTZJtbjdw1SqTgTpeVYvIxYs0?=
 =?us-ascii?Q?DxGQTC3qk6xWsUovDtAagreOnMdgr/ISk6JwuYUhHr2wV7ftlPspskFdVlvE?=
 =?us-ascii?Q?Z72UApwokDuqrCAnXmipX+1CuGD+4LVOxpoBqP132OLq5nOnk3+tJmm0getC?=
 =?us-ascii?Q?9X+PEsklg7VEij3Dmw0YVEyinUk7kSCE21y4qCiH+6ApevhQK3MPaUGQ2Eao?=
 =?us-ascii?Q?OGJz8o02SP1Kx+El2NbA0b6FcHWRk+WzDFXI9d+0w2BqfI4UhQY22rxQ4QCy?=
 =?us-ascii?Q?bHSac9V+gzVZ8v0VXiSSrEKrVnQrHMOKHH4XJUBu8MBT1r91rfBTTVtm7s2i?=
 =?us-ascii?Q?pOBFJo/elkxLJ0OtP2qMqVqdI/zZEkaPz+kWNdL6S2xSKU0asu+tFnCVTOu6?=
 =?us-ascii?Q?oTCMEh1WlhL63a17fRP1WHVVkU33iz13VALiX1oyLzuBGRgBN0/d+isYBR+i?=
 =?us-ascii?Q?A08oub/SCt2EnW4H2xNATOQaDuN+e16+oA4xbvB2k19nWPU8jb7q9gBSWqz+?=
 =?us-ascii?Q?kEAdVR38GDJll7n8u8pWvR6qukPMWzy8GHmL/cTzoXKDeAhpscQwnwOBi5Bm?=
 =?us-ascii?Q?iFy3wvTb53oSiuW0quQaMn8fHAcJmI0cWDmp1lHoPVuXJAqjwr07XzOYDlAo?=
 =?us-ascii?Q?RFEmjJzpR5tbBsrOPYi47VnW9xENWnrR3y0Sqf9b20yh09bsqKGAn4q+/e4C?=
 =?us-ascii?Q?cw=3D=3D?=
Content-ID: <8B21EEB6FDAB9B4FACCF43E4C473757A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ql3KP/omVxneR/9I3efugk3sR1kWLGSqt6w+qI8yKHUKOTKNGrP18mGBLw+1GJs+kArTeB0oRZUQNQ24cFQI7Lq7XtNNjyOFvC/8WWBWfwxsN6Uhu46aX1igqWRF8t6pQCgugO1RYUM21niqsvhjMEantQOrG24TAqbWqcLn29j5VkuET3kvpgfjQbFjLyH4RkdD4oiXvoK/2YZcK4JcrBPhQiKgqOgBKIZ+GVXCEqn8EPRC1WbQbrXaIhagZw/s0YuqF2iIhgqLj/g2Tw2V1+bvZtfoKIHMHChdHyda1OsYsrly8yzzBbBGOYvw4wrxIiJNyuQ72dGcSn1WEAJ+7gU0QGy+iBpvxhLlKh25rQ9kGbYTP3cZ4ZpIlXZcRdS9bcGtrcmUWa6sJokEtaDuv1WzH8R4Xj09A48z29Q4kUHNo9eH7ennfWd3m2UAo2sPcPp1cYyhzqPD599llvCw0P+w1tauY1/sY8J2FAagh5IaP3nAOQ5nIzAEmrboTWKYlPE7Kerw2S3DIvlumMHKcVR2UkQiAMHFllfAmFMRxyrflGm34YqS8uZqimgDCGLpn/iyO9/W0ktC9/P+fD1o/L+WqErpL/J7q0oW9+RGTvgyiQ7LmeuZTeRQnh1RKiIh
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05c743c-9b08-4a13-90e6-08dce3f0e24a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 21:18:10.7522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jX61kUPnmkAvSkN6WoOT4qUwVdhXjANidFcMyAqpFmoz06zXqekm7zD/vpUxE8ElcIQzsWIE18cMPa91WOZAkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR04MB9382
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727990295; x=1759526295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=NgsM1++OSg2FbacvveDyVj+dv3QM9kK67ADnfZYJqvI=;
 b=Nd+iyDn0pD7SG0OCnNvX98E9sDMxSZEWTIXAaQSkJlDvuaVBilL66OEz
 +pgAwPXHKjTems/a1xDZwleSsai1vTWi555G4HmH8LXufUWLgBPaHEFO/
 +R9GITQf4hpy7lpAV0CJIAo7DTPMzyo/VxR9CPT2SnK7QXJwhXxfNxwaW
 XG7Qpm7lJ347MtTI9ZEKI921R+qg5Hex3sGh66LWHdG5nhPuvm8mIiWbJ
 fCJ/jE8g7b0RfR0AQPoMTjUimbpH6s5tsyxI8hhgCReYopnfz1DT4yPeb
 /KHR1GY4lo6FYimph76Gb1s9qZscuIirAqu4LWoDCUmL3+8+5mj1/RN92
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgsM1++OSg2FbacvveDyVj+dv3QM9kK67ADnfZYJqvI=;
 b=tjwB37XnTxUtmI0IIUshKN3eTOAo8Ik4FdpsFJFlPEQcH7kIi+Ct1pN2w/kOERNNNArS+u42HB8wqf1l96NnMxk5FdEQC4SUwhlxNhkkaNJb7Uccbg4catOxfgYakcsrG1TlwMG2ain/S30+TZ8ASjf8IH5UQg85wV/rZ1vV27c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Nd+iyDn0; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=tjwB37Xn
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/4] configs/rock5b: update to linux
 6.10.10
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 03, 2024 at 10:55:31PM +0200, Kilian Zinnecker wrote:
> Hello Niklas,
> 
> thanks for all your patches improving the Rock5b board support!
> 
> > A bunch of new hardware has been enabled for rock5b in linux 6.10,
> > most notably USB3 host controller support and GPU support.
> 
> That's great! However, recently Bernd Kuhls submitted patches to support
> Kernel 6.11 in Buildroot, see here:
> 
> https://lists.buildroot.org/pipermail/buildroot/2024-September/763467.html
> https://lists.buildroot.org/pipermail/buildroot/2024-September/763468.html
> 
> So far, they are not yet committed, but I'd assume that this maybe happens
> soon? 6.11 also brings improvements for the Rock5b:
> 
> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md
> 
> So maybe wait a bit and then directly bump to 6.11?

I don't have any strong opinion on this one.

We either pick up this patch now, and bump it again once 6.11 support has
been merged in buildroot
or
we simply drop this patch and wait for you or someone else to send a bump
once 6.11 support has been added.

Either is fine with me. I just thought that the current version (6.7 was
a bit old). I'm happy with whatever Thomas decides.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
