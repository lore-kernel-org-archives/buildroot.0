Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83273C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 15:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EE06847F6;
	Wed,  5 Jun 2024 15:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd1PWZecaXuM; Wed,  5 Jun 2024 15:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F09F384805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F09F384805;
	Wed,  5 Jun 2024 15:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAB1B1BF5D7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C671A61122
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsXuvSNhG2ji for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 15:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8531E61114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8531E61114
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8531E61114
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 15:22:20 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 455EdRvp006980; Wed, 5 Jun 2024 15:22:19 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yj4fqn912-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2024 15:22:19 +0000
Received: from xusxph009rp010.corp.ray.com ([128.13.125.224])
 by xusxph009rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 455FMI0j006919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 15:22:18 GMT
Received: from UUSALE2G.utcmail.com (uusale2g.utcmail.com [10.220.63.42])
 by xusxph009rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 455FMHxx001412
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 15:22:18 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE2G.utcmail.com
 (10.220.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Jun 2024
 11:22:17 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Jun 2024
 11:22:17 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.145)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Wed, 5 Jun 2024 11:22:17 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1449.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 15:22:16 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 15:22:16 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [Buildroot] [PATCH 8/9]
 support/scripts/apply-patches: use appropriate TAR
Thread-Index: AQHat1NRmVXz80iC0E+ocXJ+DyxDVrG5SWbQ
Date: Wed, 5 Jun 2024 15:22:16 +0000
Message-ID: <BN0P110MB1673E9E877CBA8E08D780D53EBF9A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
 <e0b686dc7ac91465e02ba7d6e18635404a93ca24.1717597094.git.yann.morin.1998@free.fr>
In-Reply-To: <e0b686dc7ac91465e02ba7d6e18635404a93ca24.1717597094.git.yann.morin.1998@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1449:EE_
x-ms-office365-filtering-correlation-id: 6e517469-e462-4dcc-177c-08dc85734881
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|38070700009|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HfjrKLcmLgU0yL6WvMg7v9Exm3hZxzHdZ7PyFIkI4/NTCSvPeQ3CJfNGfl0i?=
 =?us-ascii?Q?q4owTW1uLUO1FX1R1RMaXD3334HdsN02dq8lU9cWAXiB9kejLdKkk7iNmZ4i?=
 =?us-ascii?Q?4NaNNNEh/kKUAVuxuUfDwsMT/4NhTgIP5APnD21zN0QvZz4avxbsbmA82rpL?=
 =?us-ascii?Q?Cl13ye4MnfOkUEIV7do1fZYDIkTOUx4kX8EPR7PPILpng51xvjhITgFM1aUJ?=
 =?us-ascii?Q?nQ2KTFV/lAiTvoZniywXwOwfQGZDUyjs2iaRaQ17YlC/0mwM6lGG9S2owtQQ?=
 =?us-ascii?Q?Lid6iEYakxE4PG1RlJxZR/s1YX5m4cv3fCw9suydZvXviQEpWTg0mg0GoXSv?=
 =?us-ascii?Q?p8ugOnAu2fw3HX9Xs8MK/6U9787rUYuoPjaa6OE9ugddlAx/AoJ1RrlfMzCT?=
 =?us-ascii?Q?DOul8EIrKHeLHK7pVLgSVefZgGQ7DmEIA34weeh9W0m/E35ZrPBr26Y+7SMJ?=
 =?us-ascii?Q?/kWJbZhfZQARcNgDlHF/n30WxjeEkiQ6k7g6pB1s738XGvDQ4joMQzuISbj2?=
 =?us-ascii?Q?BEpzhTsyJ95dIHfBF6gmmVBOieHVlF/+rxTB2ndbX+BJm6Q4WAt5ujtKRUPK?=
 =?us-ascii?Q?1ykXME6+msfe5UxK1lhzXhHvFq2XCPHrcbuBL6Tr6vBc/U6m2tDqXJPgFv6j?=
 =?us-ascii?Q?57FLmSxftF1mmlQGEOAtuSIw1rDOE8xrHIhhSi/op6JgAflML3ziKnzuqtY4?=
 =?us-ascii?Q?5+Ak0RCAlzRTH/1E8b8vaUQ6KnIs0hoGvCpnTmz+Ot0/J3f4KygE4sGdlIzv?=
 =?us-ascii?Q?fQ4IG41aXdc/Lz9CyrqDar5dfL9QuHgvgbNlwn58coXHEhIFRL3DTWxM9a5x?=
 =?us-ascii?Q?Kge/53SzICozh/QNv9BBuCTeSLdYLs6QQeEmnqltP9t70W+hYEgVi9qf2jzp?=
 =?us-ascii?Q?a/07pQWuraNMJk8kcVavNk49TZZe7H3Ucj7cc1CIqt/P+nkgROB8NJJT6wO2?=
 =?us-ascii?Q?3SHlK6VNsoHafkV06evXBVQ+30evAyoRZ5yVNLUP4MaqhoZHpxBQX+b1bIQs?=
 =?us-ascii?Q?9X6nXE+2HKRjkDRNt6Vset1xxqdZli8Nd2mJ0jiJqg4AEcSxJMdoW9UgJ/YF?=
 =?us-ascii?Q?SEUZqMDGHRjepE2WPLvx/EHZgwo9ab+4xtM0khJwewW7ClervUG2p5l1Igb6?=
 =?us-ascii?Q?pW0MO7+aRGFPTpgRMSfSsa8nUHDtKv56z74nLu21DbJtaDKqYmY/P0Fab8BH?=
 =?us-ascii?Q?QUV3zt9RCcZtlEtmdqxx6Z1bPSfKK/7YI8x69Kx4eGG3cCqueLHDoNycizPw?=
 =?us-ascii?Q?C2h7MhEpsqHHrSVdGvDSIi47Q3G+22MzTFY/QE9YusknRL5NAXmLyPOU0sc0?=
 =?us-ascii?Q?mYQfgoGzkXNqkHkieYcuVdNODm9XOC+A6SXzO7AqanWadEEkLeYpeJ/30hHB?=
 =?us-ascii?Q?y2FqhsnrovKZ0sqB4bCIHiT5M9MdTeNanwm9rAaXvXLchfi5fA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?leDlnQNzyhb56Vcts3sIQsck5Gcwdl1+6GqTquXTPv+3JAeLyvUmDGBNRaSf?=
 =?us-ascii?Q?9rmWVM5d9KByqxFka9SdZFHZWSkgq5ZQXJLENVQ/q0liQTW5TmVOabwoRUNT?=
 =?us-ascii?Q?SnJyC2K/bbLXri00+UC8MBS//HZ2SBaiLz2jTg9utywJBsRzQHB2mMCD7A0Z?=
 =?us-ascii?Q?OSRWuhK/YT/z4yv35aoF6P26z+UCeh+M+I+kfNfmwLj9lIXx2sBgk6+gfc+e?=
 =?us-ascii?Q?R5I7FVeEIj4GVOd39xoDDIra+0P+YDW7riN2y5e2ac1ds/PeZWsfg3CjOAwg?=
 =?us-ascii?Q?KLIT8J/JFhHn3Hm+WzqNBteH21xHNeH4DPYpsA47VtbpoCTQNoeFHF/THjKF?=
 =?us-ascii?Q?dQFllozVzkBt231FfUwh7UoFIeQBvRiF8n+QlY26dooz8vquKqCTqaPdXTSu?=
 =?us-ascii?Q?5IUSkYt36W7SKMcDvK2D1rxFQFWRduCQoie53ZYFh8iP2M9NHkPJ914sv0+2?=
 =?us-ascii?Q?ruZP5MCoTkQhRT3qvJnxpvE2f8ujhmycgmT+nOvbegDTzgfEjVqNvq2MomhU?=
 =?us-ascii?Q?nwueYuUQl5jGS/FyGgjSPVz+qhodQmF5h1/lLph88+d1zvJSBBoeMZ3C21Wn?=
 =?us-ascii?Q?hzJm8MfizfJMj5F04+ioszEAseoM+Eto/ppajBsXUvP0Zvs4l4NMvGsMk5jc?=
 =?us-ascii?Q?fH7yi/iuwQO1Fenw5R+dZfvTCc1Zp51gs+870iA0PHlN8ucLRe+8C40p/Y2d?=
 =?us-ascii?Q?HjT81LZrw7PchX0g+/fpvbmc/Ca35hQojAmgFW7yuMTkO7e0nVLKDdjMlZO/?=
 =?us-ascii?Q?1zw9Zo+mwKUREkl3hmuvL3yqU620yJ9cCiB9uWnrOwcVGKKq3L2jI4db+woe?=
 =?us-ascii?Q?VNgcJl4+kr6oAJnE7zi8U0QVohRWQJrevFKuwJEMApDTqchQv1/fJ1lOTMvq?=
 =?us-ascii?Q?72yv+n9qclOcr94+U7Q5XN9gcgaDUpI3u9PR5utjPrvPfbOBF4h1KFl7gJZZ?=
 =?us-ascii?Q?CvlpQAYrrd4LsFTFHEgEtxFmaaevrA1HjpDjkJynibU8eiwPZ3qRW72/Zcdn?=
 =?us-ascii?Q?aHUtIPqQE82OrNGX7y1r0Z1HmExL+P2ZJsFXbjAH0eS7vdwUh1VctBGOOE7q?=
 =?us-ascii?Q?UUqMjyEp6/rNf9iDyuf+MWlY+bB/jJvmJU60kXdr4pn/oFZ1pIJstO9VC/UD?=
 =?us-ascii?Q?ba+djeXG68TIDByH+C5aTse5KVgi+YJT5d20OhKUyhxka7CzAIuGC4k8cl4o?=
 =?us-ascii?Q?mAGe2wZfE8LvkjlhPA3T/M+yXsihBxPWJVmT1Y71Oq4jnQaGJ6VPrJIxKKWs?=
 =?us-ascii?Q?T9EwkZinIB8bMdhVV8qlIn6ISDs2O47k/5DA7TglDC+EyxlbifD3S6bKBpog?=
 =?us-ascii?Q?N1Gs+zWylk3ax3+DLxc5OIqVWmsX0zAXTPHAa+QVAe09/jlzxxdY4+v1Q8BG?=
 =?us-ascii?Q?ZJuWVTZKLaauUpqcsWZ9owMj0OxHi736dkV4o/rDJ37G27rmEO3jr51+ovSg?=
 =?us-ascii?Q?ExQS97p1VgamI4LUeNIAp5CaBQpZhNVa4nvv4xNVCEb4dkpzJqqSO+sRf+2+?=
 =?us-ascii?Q?RupOOBgUux26RMM=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=dYd1QzmdtGtUH2M1II61qZ6wnXxkKC29fCPACpysgYEHqncgZu8iyYJtIcypGPaRfL0T68UgGUgGyk1e5QVYus5tz5XS85fszR2I9GGhyyu+rgn681CY2y7yxJ5ySGWFSQ5TbgZ4t28ZnhR6YV4GdyU9uTNyrrkLK491R9sM6Ox3hTYb2Xkx1KQXZZO9E96hQsZil+W6uFIqK2AVJVPHE2BM44bGYxXYL5ooZFGD//vsUZab/bT4oBA3Pm4GBhFuIEXkcRSa/VaGkW4Uqdn5j4KFkiDnRmb7rzn5Nsrdl9RZSz0xuQxXCecrjt/8OXcO2J4tZtPCZ0+dQa4iuFVJ2A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdYzuBA11AxyBhJ38315XR+WzrIwMQgsBMCiFkqsbmE=;
 b=O1Or1ZfHaPWKP0MkW8DGlOEfrbtPJ5ZOGKAkzxm4Or4+cQ4o+AHOFNKBpVC5+gqgInTqFWVa0skTYoC/YpKSqrg1i/RJ8f9iwWkFUiaAo4YiUcbTH6z0NRrEudJEAyRIeews1FIJNnmBWvPMgQ3QS97Y38hWCa0fLhTesCqgznUd9M5SRblc13BD9o1tuKuJEfAwhAdxTASFRFuojCcYGyQGuxBzRnMxyNQ8/v/wYxMuB3R525L+2sLLnSD7P9+Qjwl4C+AhE/QTI8Ejc5o3h0HZEtmev5+nJUIHGQVeZppp5CNmk9ycBqnaC4IOw6yJuDwsYLagJxQxVllKkc7HMw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: /ARGkspjq+dRE0XCvxwsQYSrsnFcX87kuy+DvFzxp8M0Ae8GIM1/R+SJt152mpVMJuDhsJxuCBHMl8P9RcOFtP1+6mk5pyDywpgW+sAdm0J5AX5KQKmquHK0i5ES4oCx5TGHGWD2AbklOD+BNKUY3VZpyhcax2SM4hLJ//UADINSbNpuTiQ/wboJoCCNC8WW8LNz4eAQcCvizWNnRuwkB/XdhfonxbrmV/NAp61M0yh69i7yOoaC5L8Kf98W+7huG6yqx27JaJcWcvgQ2pyLNDeEoBUfHOIj3BG0S49Yrt+sXUn653knrtB430NBRau8ahas2oWQV969XjcOetEbQtw7Av+hUI+bjdgp17K1jEk9WxqP0twpWjfqLMUUspHxeUtayKbTWGlmxTcqZIjiRSVLU4j5WDkktz3KKK7plZPXXMo+wCnLpRskdiUGEKZoR2A6ZFtaGyBpyc7XLeeNMHDYA9ziBGSSNP1xFrDefcju4gnUBa8xWxt1TkkFzGMqy59sKpe6e5h8DfmeQtgEGGQ42zDlDebK4rl0KV28wdSODDah171IKjttVVJQUi25JYxi0633FwSR8xbpVa5FM2FtJcRdoWlSIjdegaU2F3I=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 6e517469-e462-4dcc-177c-08dc85734881
x-ms-exchange-crosstenant-originalarrivaltime: 05 Jun 2024 15:22:16.3448 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1449
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050116
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050116
X-Proofpoint-GUID: -4-W35ntHbkJXvh98Uo0Ai2IOUDxCTHV
X-Proofpoint-ORIG-GUID: -4-W35ntHbkJXvh98Uo0Ai2IOUDxCTHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=lmVmKXYbuxzGtToTONLO6ibgojplv7bCw1lVjM1rtI4=;
 b=byjoKli9dGBaJbIeHyp2feKjME+iJ2tZC90ex8AK+FTYFAQJN4dWV1h0mAGYNB8QFB6a
 hFiaIIGsMYjtBQTwe6fSTLve6KLFI4dk8TJVKO+IHgNieP+Faz/79AuxwA2cm1s17ono
 4FQG4YOh/ZK2lkTbhF8RkFB2bFKdwebnlDECY5gjLMWzhe8u8YEA0jtZmn8ygJ8QoW/d
 kaT+TBrVvHhkj5nYi9R3L5XAgiygQ5iqeNUB9hAudpHei7DjdE3kBYRmql54j7K47F9p
 JaWyzTd2kDIs+UY3J58a3rl2QBO49ERnmqXHtB3K0VJyDz9KzSjaezdHrrbEwcEuqvwZ WA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdYzuBA11AxyBhJ38315XR+WzrIwMQgsBMCiFkqsbmE=;
 b=V0Q2CkCMRwIZXtk5+Bj+mZqnV+Bp5B8GWuydbwoQTaXzVzVFGYVjao7jehKKva3q5m5JoxoPBU/JQg3E5zHlXolK1Tyl4khPN4S9td4S2OVFomy0N3oF/x3xggFXeb0e3L+av+uc4bRTm8YlH/HwZer2K/VyX3K6J57iTsXMKfM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=byjoKli9; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=V0Q2CkCM
Subject: Re: [Buildroot] [External] [PATCH 8/9]
 support/scripts/apply-patches: use appropriate TAR
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Yann E.
> MORIN
> Sent: Wednesday, June 5, 2024 9:18 AM
> To: buildroot@buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Subject: [External] [Buildroot] [PATCH 8/9] support/scripts/apply-patches:
> use appropriate TAR
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/Makefile.in              | 2 +-
>  support/scripts/apply-patches.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index f415e55f84..9dc66bc674 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -231,7 +231,7 @@ endif
>  INSTALL := $(shell which install || type -p install)
>  UNZIP := $(shell which unzip || type -p unzip) -q
>
> -APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-
> patches.sh $(if $(QUIET),-s)
> +APPLY_PATCHES = TAR=$(TAR) PATH=$(HOST_DIR)/bin:$$PATH
> support/scripts/apply-patches.sh $(if $(QUIET),-s)
>
>  HOST_CPPFLAGS  = -I$(HOST_DIR)/include
>  HOST_CFLAGS   ?= -O2
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-
> patches.sh
> index 6da83f6826..39a0c050d6 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -146,7 +146,7 @@ function scan_patchdir {
>                  unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
>                  rm -rf "$unpackedarchivedir" 2> /dev/null
>                  mkdir "$unpackedarchivedir"
> -                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
> +                $(TAR) -C "$unpackedarchivedir" -xaf "${path}/$i"

Shouldn't this be `${TAR}` since it's a shell script?

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
