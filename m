Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06179C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 06:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828BB8354D;
	Fri, 26 Apr 2024 06:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjmNB1LJnX6T; Fri, 26 Apr 2024 06:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E7248355C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E7248355C;
	Fri, 26 Apr 2024 06:17:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC4231BF35B
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 06:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4BC98355C
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 06:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiMOgEEw_pA0 for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 06:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D9028354D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D9028354D
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D9028354D
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 06:17:32 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 26 Apr 2024 08:17:26 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 7EF9EB5ABD
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 08:17:26 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 4A4AEB5ABC
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 08:17:15 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 26 Apr
 2024 08:17:15 +0200
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.169)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Fri, 26 Apr 2024 08:17:15 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGf9nRm17mh8neC4XZb5D7XefXhHg27LwPCd5Uh1QToJ9WNxVd8co0bPkqZMUhXLPeG/nfuE//RGbZ0UHdwSrUj/i3zxMKV3jrm+R/sOHvlil2HPRbWAmBOkJuaMviAYtIfrrEq9uROF7kUPeqWkjGvVGi0C1qryiD3+2TKfckfLX09YvXxpGbxa9s3zYjarVZIOe9rkg8Cn55KEPL03/uZEUjoQDmHrooSXHX+xfhzGWAdIFEJni8ccc/7kv6EA2p85abvIF1pk3hJlupp/EyFl/NrpzWN94ePn5eL2sM6q9Cxr17bcNm1x42Up+kFrFPy5t6F77azamPY9mbBvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYMdpEljSiBMSe+aiE5mM7/RsUycF1fCMhp2vGefWyk=;
 b=fm1dkxFplg4iNvjrqVrbo8HcGc7UREfO2RpuA5gFrMD65CK9v1ww+DkdToQtvU14fYHle5CPqIFJ0hjwLn+Oxpzaa7uVowjOIDBgM5VUC3rBWrIcXghbWujARmTum091c7s6tGFyg8F80YIFxjr0OAe8B09b2/ALB85EYM4UnhDnMz77ZI1cQNvJe0AdRINr0x/OOeF8tLgygF7OQOCvSahI49YCfxJuY8X+N9bxFXc24NmilWFkCxU5Ihesma7ijYAwUut8ySJB2HdkhAa23aXtMZ8YcDyTWFgcnWH8XBs4O+pDOxkaex2GFCxA+FAuFEBl3MXycwgsFh8c74ohmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0063.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:238::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 06:17:13 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::ce26:2173:ee88:2920]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::ce26:2173:ee88:2920%4]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 06:17:13 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v4] package/libzenoh-c: new package
Thread-Index: AdqXnZdqjt27X+5HTqmyt31NWn23GA==
Date: Fri, 26 Apr 2024 06:17:12 +0000
Message-ID: <AS1P250MB0608D11E831C7C183BA9A256A9162@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0063:EE_
x-ms-office365-filtering-correlation-id: 7cc7bf22-56ca-41db-43a7-08dc65b88342
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?J9Czto/9mhTmdq+8QhSJS8zl06uIpzBdMS7TPUIqK8b/sKMz5QHxUjf6OCQQ?=
 =?us-ascii?Q?O2u5vfQY52llGs/KrxPQEI1mhDVHzdfxHOqxcVRNVvAx77pJzp8kSL23q7et?=
 =?us-ascii?Q?r9W7KGcP9KDrAUJ+ZWQaIWAREP/3qendCJB7696y9prYMgxLqjdq6+fv64fl?=
 =?us-ascii?Q?Z02ybld7c1BwjVzr3CMepyLr+TSLk+yI2LqWUB2p11rKS1xqjqX6t+3iikjO?=
 =?us-ascii?Q?4jMW0JCsQtfl4LFFADmn6Ps8kX4GVTWudtOm0XFo/PIx05Z++vOzyxlOW1Wy?=
 =?us-ascii?Q?Gc0U4R5NQyLJFqN4t/WHfDkW//k+6wfgc00VJSvpjPTS0Mos4lhZ2duuktQH?=
 =?us-ascii?Q?Zwa4CCEjdSHChAYS/XBP37DsSMM7/cXjun37Sbh5je0vsD94e+N5jfKHILtQ?=
 =?us-ascii?Q?2me/6idFb4x/jo4jASeptm10zUElaE7o3ECm7fwIAcYzf/31wCg1MoiseM/T?=
 =?us-ascii?Q?ySrik296+ux1I+S6QHX0JYPsDBDiRNwosS/B8Y6nRRTeBnB9Hz8MQl2/y8qr?=
 =?us-ascii?Q?TT90qizNkAgU+9jDEBDOlTCGPmFxcrd9iX/4ZDq+o5DJfTvnReLRAE/XxuSV?=
 =?us-ascii?Q?bNuuqXemiRvz0DdTgeWgXaZooW+h9j9f7o/n780otALYocwBCBW5iaLuEl/g?=
 =?us-ascii?Q?WweA15iY/d4kYzpAgNQUv7eM3gLcy6i6jD4J/FYWzwitvVvlUGt2uBLy5Ml1?=
 =?us-ascii?Q?9WWFZ48Nk00G5AK0Cs2AHqoYchxNXpE+Cm7MgJKDBWadmDO+dhdkfLVvvxi5?=
 =?us-ascii?Q?GKGo4CgSRGbHPVbZL9ZU0MFcP1aXedbrpNiBtab6HJgnWAbSuefHtXnWrmSo?=
 =?us-ascii?Q?rpe0W6Wn6rsUU0ZyLsQRSoNe1b33sylzKGPoFf5ru3ZiV6qCZK7ivUXLFxt2?=
 =?us-ascii?Q?nRjMmoi6AcTSL2xDhaPVzJfj8pl14EkV5r4EmEZylX57Lztu1lAAlz1DK3us?=
 =?us-ascii?Q?wZgFlOI6pEfq8aAlxNrb+cqlKwPp4ulsh/7lk+mlA50QRYK1XqqM10vKDzGf?=
 =?us-ascii?Q?04pRsFGAmoSaq27hTsuus7lFQ2TAgJzJtW9c/btEkDew+B8zH5SeBGSZSUoE?=
 =?us-ascii?Q?PfVk7FPdfKRv/DLzWw3neepmtRPevTCOlL9TxOVQyhkD5nj0gtzafWp86pUH?=
 =?us-ascii?Q?ga5wnY8MKXCpfM3A3YxmYUIDeIPFshQBMB0vj9v7TT/rAFhb/NB1QfG4J0dd?=
 =?us-ascii?Q?snHgt4gKXRNSfJZu+SC0zRMCsn0jtfCOxJg2VUkty4qyINP3GrLXKx8qOdry?=
 =?us-ascii?Q?MefP382dScTDDxAYumyqbswnziPNXyo5LlAaqeOJj13WH2y6c+2qteCdBuUC?=
 =?us-ascii?Q?KGo+i/fz+WYjmdR4uAvoXviNehUDG1+r0GN/qS6QADBl/A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?43rzNVsUu6wPij39yZxKDWLmsg090dkHoOuie9fnTPVheIfDGhJPbNRDXZnc?=
 =?us-ascii?Q?21KSptwbD3ojg6bxVDT+DGgBOvWxmfDV4ioBfWoVeZXqOmM6Q9SrhivTjm9j?=
 =?us-ascii?Q?lRmbIU0UvRyg/LLL3SemeOXViEGkrSshGT91SD5CoqCkNgWSW929W+B8/z2C?=
 =?us-ascii?Q?s0QuV35w9LQytOohIh74QtVUcl9T5AsH6Yo7gupbMKo0S9tokWKGaO+I+36l?=
 =?us-ascii?Q?uoRRK0pFccVrPh8/w1NUT9gvgRLmp4md6IAtd5U9pRkWlq0nV/wUsZjcIXED?=
 =?us-ascii?Q?+7dL3jPvEPc6DqwLWGweu0GzOdCdIKDlV+zsVgEMPGWQT8aaEM+ztNOZEJeU?=
 =?us-ascii?Q?njY8RQn7fQo2Sd1RmcltwxBB8c8IILXBPP1DqFJOHkfuozTY/A+P8fe+EZ+U?=
 =?us-ascii?Q?BlJGkcEc/FKdh4fDVXEIKgGOqjQOcl1xdIJfvxPCOgSRsBuGmmgs5z31r983?=
 =?us-ascii?Q?YmnnUOsJDUw2eYcYKuRFbMZMyOGm/C10kRM/kliXyshItUKrfE+QW/EAsJgx?=
 =?us-ascii?Q?ZNVHZED7ap8hQkRgD9JhFQDu39eEXJv4F6alL9fkk/5QSKAunuK/6NKIbs3a?=
 =?us-ascii?Q?9JYJ1NNKrWtWhXoeMN4Y+pf8aXUp9vY8+BPN752YIrEE+7PrnaR7/gjk7EcT?=
 =?us-ascii?Q?Y/UEwdHFkoEtUW7lqQnCw2JKHUys8/i1bOx+91dmPra44ukFFoRpiZk6+8XI?=
 =?us-ascii?Q?Qa9uKwWSBU1GWTunQuTxI/GWFv42pTIQ1ff3ZjjNtez78rSycqjp+jtOFbyb?=
 =?us-ascii?Q?1UwGcHCSSOtClIE1+1xLsJPyu3kM6CGy/5bxEjRApvBfUnj5roiW5pLX34bz?=
 =?us-ascii?Q?SDS6R5Glb1vgkxBTiVYzypeiB5F3D/M8q/Nij/qmMZVucSKJUSCUQ5WSRZzQ?=
 =?us-ascii?Q?7KxfK+7AxkHQ02lbo0yFDekxSwIlqcAIWgqFUm9y7+Ro+AqcRADBqMQqTVQO?=
 =?us-ascii?Q?jLsVf6oUyQW/+8aNo8uZHbOq4kg65nmOMNZWhxID3f+g9ckbqNSJFhOOTdIn?=
 =?us-ascii?Q?ru3NzWgAMUtv2xs98P69zrEW3nOA4holaJqz2R5jpAseF7SjlhOx+XJ2Enti?=
 =?us-ascii?Q?QvBnVJvMd77ERu/vZrIqHI7vmyny9i6Flr6lQ9XAZCya58xLhNVNN1Dyg7MN?=
 =?us-ascii?Q?HW/Kgc+vKnKtvg8n4hDzLQqkHD4kvc9rd4dD/zUZ9lkyfZp50dsNab3Yr/1L?=
 =?us-ascii?Q?HK7zWTTy98OvasYrIeAcxriG68s05nQMHVBXM2c4YHW/5wg4dHOGnZYjN7PQ?=
 =?us-ascii?Q?oZZMtgwLp84hBd/UTvnm7GGfUy9ehpF4XimwLkqOJYD6kTrcwKG3MDbMUrrp?=
 =?us-ascii?Q?IJGOZC6coxHKYQehOgbKJd2nOa1z4Wb7ndHp5RYjgI7z4z0X4O4Ac88LXJTe?=
 =?us-ascii?Q?ot0BKW+tQ4mnmP1azD41ngfhTcXdRaMfZe13tsjcCUWynilWhX89+3vHlib2?=
 =?us-ascii?Q?aqVvCL0LLs7VZYuUew6aiObvKD/69SMHn9X4M26G1TP8j8OTaiHP+U4CefD5?=
 =?us-ascii?Q?cFufDXsjmKv8h/gW6ycf/4zyP/ETc5AX+bKCv0YKz6w/IO5336ClT3r6qmSc?=
 =?us-ascii?Q?Lpc5WRvKZYcp8xt7WBwXmhKHgLucb7hIGQLdwg/A2T3LKMkV0Y5C+/IS/1Q/?=
 =?us-ascii?Q?Yg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +pMQ4GEYKn9Vw2pnK0WdvsRNLb6x6Vl4JLpA2NTTN5xzHgaGis5t/sP62S6gR3Us7wPC0hkcjaf0+0Ao2msXS1BnpOpGC/mhFBiLmARW1uSWPF+sGjVIhIdUiWJJocAkngpk/pGT2bDYUI9X8WqJCUTlGFBE6Ef/VL+jf4wOjKPJ57GRZ1GZ/RqAzA1B+W0bnUCO1vicrBzciHoNpWEX5uqztHeOqLqvToM/niBD83Rc7GbP25NNfqBaha6L8VndGYIAelWL2nnCcbmkLQOiwUzDdXw563wRTG61Srv40X/6gGuqOnYiOGyBS/WPuY/x1NSCr3HasxacT1cwPeuoO8K4CyM6M00gDCk9X66LdUSHAgSjRfs3HR9xM/OXMirhdPAdc0ThquWd4bw2EXMCb5fuFUPMDCIMHVQoWd9j+puMNkIE0p2yRagxUVcHItThSbOs2O1iyT7fGO7W2l8BOogSqLWT4QckTuyR7L0ITLYfFkprVIITs0VC/pbqCHoVrbyHZwwxb+53v5Qmi+MmK6V7bMH47P/Y9HIn99SpSux/wmdeEWMbxkQFyc/T68qLUyERsxgyMbncZq2CykMVKQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc7bf22-56ca-41db-43a7-08dc65b88342
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 06:17:12.9935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GPFL8NrsYml9/IS0tqY+gZFS82SPP8AIe+vHdlKOqdromzd56HEaOMCSspwzOB5TCTVPd+MGbOJyszTbMNzLx3OQEVTFIahyBwuNdszA4vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0063
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYMdpEljSiBMSe+aiE5mM7/RsUycF1fCMhp2vGefWyk=;
 b=cjd8x/GlB/oKva5hUbgsj1BQGeVI2L9zrF4g3j1SrEIFcagMhmRFsZVXJjAUelr9/APMSYgfTxUF4eKz5WSBhkOKFrjilG9oet7gd3RLMaYbW1816ivpJYwkpfVs1Vgnaj7uixrIzbXBrYJR/JPaskeKuf1CyrDE9l5FcnJvVno=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=cjd8x/Gl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH v4] package/libzenoh-c: new package
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a C binding based on the main
Zenoh implementation written in Rust.
Because this lib does not provide any binaries or examples,
and the cargo infra does not provide any possibility to
disable the --bins option in cargo install step, we
have to override the INSTALL_STAGING_CMDS and the
INSTALL_TARGET_CMDS macros to prevent failing of the
buildroot installation step.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

---
Changes v3 -> v4:
  - wrapped long lines to 80 characters
  - use BR2_ENABLE_DEBUG variable instead of "release" path component
  - use RUSTC_TARGET_NAME variable instead of "*" path component
  - shared macro installs only the common set of files
  - INSTALL_TARGET_CMDS installs only the lib
  - INSTALL_STAGING_CMDS installs both the lib and include files

Changes v2 -> v3:
  - bump package to 0.10.1-rc
  - set INSTALL_STAGING

Changes v1 -> v2:
  - renamed zenoh-c to libzenoh-c
  - added myself to DEVELOPERS
  - fixed LICENSE
  - install shared libraries to staging and to target
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libzenoh-c/Config.in       |  9 ++++++++
 package/libzenoh-c/libzenoh-c.hash |  3 +++
 package/libzenoh-c/libzenoh-c.mk   | 35 ++++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/libzenoh-c/Config.in
 create mode 100644 package/libzenoh-c/libzenoh-c.hash
 create mode 100644 package/libzenoh-c/libzenoh-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff..588e777bde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -83,6 +83,7 @@ N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
+F:	package/libzenoh-c/
 F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
 
diff --git a/package/Config.in b/package/Config.in
index 1935077f0f..7647eda604 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2039,6 +2039,7 @@ menu "Networking"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libzenoh-c/Config.in"
 	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
new file mode 100644
index 0000000000..d22807c047
--- /dev/null
+++ b/package/libzenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_C
+	bool "libzenoh-c"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  This package provides a C binding based on the main
+	  Zenoh implementation written in Rust.
+
+	  https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
new file mode 100644
index 0000000000..8c93a7a091
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3ede587dd08ccd6b0b7f0b44faeefa466eb5e18826db0b1cd93c51ffc59377ec  libzenoh-c-0.10.1-rc.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
new file mode 100644
index 0000000000..0ad81f3e41
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libzenoh-c
+#
+################################################################################
+
+LIBZENOH_C_VERSION = 0.10.1-rc
+LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
+LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_C_LICENSE_FILES = LICENSE
+LIBZENOH_C_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/debug
+else
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/release
+endif
+
+define LIBZENOH_C_INSTALL_FILES
+	$(INSTALL) -D -m 644 \
+		$(LIBZENOH_C_LIB_LOCATION)/libzenohc.so \
+		$(1)/usr/lib/libzenohc.so
+endef
+
+define LIBZENOH_C_INSTALL_TARGET_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(TARGET_DIR))
+endef
+
+define LIBZENOH_C_INSTALL_STAGING_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
