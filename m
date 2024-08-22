Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF2C5320E
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 09:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28EA240195;
	Thu, 22 Aug 2024 09:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VY3CQJx5GOr6; Thu, 22 Aug 2024 09:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C72BE403E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C72BE403E7;
	Thu, 22 Aug 2024 09:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9685D1BF35A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 09:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9017A403E7
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 09:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGRAHmB7Nj2S for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 09:11:08 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=148.163.155.12;
 helo=mx0b-002c1b01.pphosted.com; envelope-from=simon.rowe@nutanix.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0F1040195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F1040195
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0F1040195
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 09:11:07 +0000 (UTC)
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKIFLP029436;
 Thu, 22 Aug 2024 02:11:06 -0700
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazlp17010005.outbound.protection.outlook.com [40.93.11.5])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 414g9c5yfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 02:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtecLYgSiFdkSkeByvgKUi9u2eea3IMiWSAVOBJJksqRnuF5UvV+u1NkpL77XPUBlmOXkyWHx4O1ng9YInYljlv+7SNukXC/bHyO/yQSbc7V03UX4mdiGJDHRF4LpRgJjdNiC+7rOxZf2yNMiHH7ZgvgfvmaaM2DSMihyg5qtL0Yvul7Iwie9r51VeyULjwPM5lTLxtnvWMWBW59c+IGTk1431qMOgNVVrJY3JyUO9NUoQdodqSol4QRjUN+BRiUJbTVUKjYvu/KfCRc4hXV6RM0b/Cp04077KF7lh8PtuTODQgEjfF1qxrIArJC73QsQQsTCbj4MMarl09ISrn7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeIsAe9rLr45rQWQ3jC6/qBUr5wP+WNNZ7NgRzDHdEM=;
 b=uylFzMxmbMWNTFJN8K2ge+Zhjndm3B+CB3CEDu+dXonWA9Nv2uraGc7B0hZoYdZ5kLd9A1qz24gNumV0TMjl4LUDBqaO69wXowQjmxWcCe2JUedCshlLOv4uD8lovX2mrli8FX5FKCo4v08AT/mGNfhgyNrNq8zz/swUyHHs/ydJJa4A0GOYSVis3J05z+ASmAd2vli+plndEYaWIeqmBt+LeggsYHp4e3BKH1FqtQr/QBFzpIo8AKjh2pqpQ8kvvwxFWVEEJX9PQcpcMZOXGJ0OVMwUVwBIXcap72JtFz0/t8p/uU7NTt/c2W4pyXxQMVAr/xtxil/LBANpLiIkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 SJ0PR02MB7472.namprd02.prod.outlook.com (2603:10b6:a03:29d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 09:11:04 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::ca00:b1fb:aa3a:f3e4]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::ca00:b1fb:aa3a:f3e4%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 09:11:04 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/eudev: support configuration via drop-in
Thread-Index: AQHa7X7XSxDciM4trUmOs7BFkeKBg7IzC2DW
Date: Thu, 22 Aug 2024 09:11:04 +0000
Message-ID: <DM8PR02MB8121C7095D4416BC8697AEF2938F2@DM8PR02MB8121.namprd02.prod.outlook.com>
References: <20240813124633.197119-1-simon.rowe@nutanix.com>
In-Reply-To: <20240813124633.197119-1-simon.rowe@nutanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8121:EE_|SJ0PR02MB7472:EE_
x-ms-office365-filtering-correlation-id: a04de440-2aba-42d5-f387-08dcc28a5977
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?whwJMfCxKjfH08/2nYIDMHhkudkd1vwqYkYDT2KelMmJ8gVOQB3Qygto3pRp?=
 =?us-ascii?Q?y663khoFmHm4CT3BLbIT8q2JMG0LLe1xsi4AoDzJCO7977gAVm6YxW6WpGTV?=
 =?us-ascii?Q?TrAH17sRAQJIZK3zJ03x4EQJtjSmZC4BoXn8zl/dkTKim/0p7PmRZZv/gCcO?=
 =?us-ascii?Q?TYGoxsoLj5AY47i6HrXGMqf2MSqna1iBo7ZDGjaiROyVeuyArOi+2+rgEJLA?=
 =?us-ascii?Q?ounkZhbf38CFAHW5+Wu0EdHlEnlLiUFc3yIzngD8wGOGczTopyBIOzzfoKaQ?=
 =?us-ascii?Q?3QKzX9GwfKNcQ4KQx2G0bfMaU3pMMubDKZ86QKDvWny19l4yxbLIRWyHv7+q?=
 =?us-ascii?Q?HiEEY9DA0Exrndj3Yuv5zxFUOlUmWj3iakHQqdPmWaOO2PJx59Cr+eLU/fQi?=
 =?us-ascii?Q?MC7R6OHBlNSht7MRAPDJh+pQ4kitLiRnIMzg+SIdHyvCqIMBiLYSQlzwFuvy?=
 =?us-ascii?Q?ulJ+Pj4EKBH7ITd5n12gaheWj3BJduoe+emZ4ZHYtwH6T5IDN4sFjLlE2lvC?=
 =?us-ascii?Q?i1i13wORlqWNqLwd03YvjWuHb3WYKT19u38z4eyAMGIaAgAKwrVRWxzmzJ82?=
 =?us-ascii?Q?6+pac9oTc0cbpDrfe7X3p4uecaKfJuXyhnj7RVtCzW82HkQMu48eikX4n9SB?=
 =?us-ascii?Q?5+RO3+46R12V8n2g+ZZdYhlOF+LuWpE9c1CKBwXjhiLkpD6jDiLtNAxsUtt6?=
 =?us-ascii?Q?OObr6+1qpWTvjyq87rCEsFxp9lVfovvooSVJ2o1yul1a2Cc1n9B7SKISYGF8?=
 =?us-ascii?Q?50B4wunOaBJFVxlRBo4MX3bu4IgwwJGzji6x12VN7P8X4YQ/xTOQ9j+WnxI8?=
 =?us-ascii?Q?AVXqFjgOJJwSVM44c/CVFDwj8D/MEiK6czDiOcGqFfYY7tSPYJetGHSlxMcR?=
 =?us-ascii?Q?GtbSTBawnoo0UiCOK1ylk6MszKrXV3RzpbYL0BTvlN9/ES+fJmzZJwhfhgQc?=
 =?us-ascii?Q?pd1eB1pvq9b0e/koOTMN9lQGwev6amCwRC9DNSID2LGNHdgRHHNtS0KPVbZy?=
 =?us-ascii?Q?pIzGOBDMUBrI23mhDUW53rfSioRkl5Riypv5Bac3JnYwKB5Qq4k8T+JQQRN9?=
 =?us-ascii?Q?qzeGvyBIDFEeAsl6qLuVI281Y10VFBBC/Gh/hg+AgK8CDe+/+jjfjjBm/+ja?=
 =?us-ascii?Q?Ir4Jc3/3wI+4eJUHV094XtPZNwNbYCOpNluF2n1gczNhHPJMr3mptrxH/86S?=
 =?us-ascii?Q?Ub7a8QcgUG1dHO5rQha6YrbiTIz7aoYG+WG9xrW6q4FvOY82H7RrXzWGpXUl?=
 =?us-ascii?Q?eazW+D8opBly/4EZ6l1NTAXr2D5UNybr2VaHzOFGFOfv1ySJIb3dezc4UD3N?=
 =?us-ascii?Q?GrbkUTCQi5XHYWgqXa94L9zkbJKZZN9kegZb0+MOl4WzKvC9BKfzHxDJCnk2?=
 =?us-ascii?Q?rnF2X2lTIRgUsPIs/BfB/ZRMfIXFmANSZ1j1xFYwcQmGPgRlb0ef+x7xr9xr?=
 =?us-ascii?Q?0aqoLEr3JNOgCNF7hVKV3sju5bNWFBv5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lGuVnoOSRNeDk109JhnK9fTe9ppFeeLCaH8J+vO0pIVJMc0emuqWwZ5nQKDi?=
 =?us-ascii?Q?dEXOUI/PfEawaey1U8Y3S8vJZV1y5D/KW91PFYQhZcapdna23FX3cLVkuNDu?=
 =?us-ascii?Q?Bl2Oh2kbiJ+LnD4M05OFfFh1tRdXxdVRyfJrQZWeN6f4h2fhUgWXex2X7Gtg?=
 =?us-ascii?Q?X2bQHXT2CcXYJCHHg99dVYZWiv/YRZqOX4elK57NVbTBO0QihAL4V7fKZn1H?=
 =?us-ascii?Q?fy9xkICOU1mawUozJx76YAq6r5YKaFIu7G7RXnCXmnhIczfsk7IUuOX7zkqk?=
 =?us-ascii?Q?2yQ59JAOmzW1xQgnIaQhoBIJKhrsFCyD86VFRv/wfEGXn1NytSjpg90WiuTA?=
 =?us-ascii?Q?m23s3RwpN82/KgOX/VTCafMQZK2KYmHhnJgrYUn7s/7BcGL0CRmLeCpmt0XP?=
 =?us-ascii?Q?PH47CcUAnq9KOeZnP1WLJAsiGGVhulkkpNkiXswwBuMI7gBsQTyCLvByaKgR?=
 =?us-ascii?Q?oZ2GhxDx3zWBh0ItbEEkDyFTJZoZLnGKCAGhFZwRAeATMAFFdftSZ0Rmqodn?=
 =?us-ascii?Q?lEtgbbmyjgKk/jnu6/h9gR2mHeUSJo6t36CotO7KoZcd6bSUAU+ASSYM8yVu?=
 =?us-ascii?Q?zVn8WKMyF0hRW2GIUW+ZGoI2D+IvSAc5erdVvazyTuUzlxbOFsEeqZnZfTAR?=
 =?us-ascii?Q?YCfBZKFwnYukNGJrWdwOChS0c8k7cA2+ScRKF1dofW/aUpqXt9FRxdyZR5zN?=
 =?us-ascii?Q?x0TExMm01xIRE0uD57eJpxVaS0f8mZwcQsfRhu2/vxSFKaHygLxul2aVec1Y?=
 =?us-ascii?Q?OvGJFacbm6m/+TDVibxaSGMF+YesgCMQ+ZQIvbe/A/EwKGxxFs43ttMpULEy?=
 =?us-ascii?Q?OCwx1MuLBgO9965Z7uIJfDcSsk5IfyggOKVCxDTXode1wsAa5AO/MyVSYgFW?=
 =?us-ascii?Q?914ueOaQCYkCS7C/z2zx+f6KLR2vDGtdSm+wnp3zV6iFe8wJq12nd0kSbSpv?=
 =?us-ascii?Q?wSXtw2sa2aD83FXdy5CcvbIOjR81QaCr1HjNPgGqGCiNShvG6adQT3z6rTAE?=
 =?us-ascii?Q?hIpE04qh5Ps9ank3DJO4Bl8+IpasGM/fklksiXb3gUntyi9lbXxrW1/Uw/nE?=
 =?us-ascii?Q?wmNeiXJSms4JV/BP3eeNEYmIQR0JgSGORa0Gon7jUuanX+NlXTUDVj7jjS77?=
 =?us-ascii?Q?OcAVIrVdQ2ltciTmQAOoQ/0q57Tqw1KZdBn7pUlDn9fnJSoHtRmj/zh+W3b3?=
 =?us-ascii?Q?n+b7ZIIkZc5s3cc5ZQMiLVrMV7kRuDCR5sQ7vJTP8brWqvauwSfMECbMX/9N?=
 =?us-ascii?Q?qJyJeVb376oYlOViwvnVsc219+idwbtBIamKvw8Flg7QInSexMNURu4vgA0F?=
 =?us-ascii?Q?ancAYXm31rn/IbJIimMhTVU49o2NSOVUEad2j91bNtwobjulH/Dp8M7tU0ol?=
 =?us-ascii?Q?97Hhe8sEsA0ZzvKLx3+mMTqTx9shAm4sYKGwJOr+Z95NWpNpRu7jFqlSEDKX?=
 =?us-ascii?Q?su3eFxdBSkSD2NetgUw+wnbXPhL25UJ8NVwcQwYUZOJPDclYFulkXSU++QlO?=
 =?us-ascii?Q?+nIG0aSGV8sWoPjIbeLK0qwbteg5T6Vzjj44cTaEhIlZrRM6WSwyncp7jLK+?=
 =?us-ascii?Q?vVPEoszvefuhlhrkZdbMYSddM15UDD2K/AfiR08Iu5g5eIXKx1ixnptmn3SR?=
 =?us-ascii?Q?8g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04de440-2aba-42d5-f387-08dcc28a5977
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 09:11:04.1450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZK0OZnEJgPneEIgjO0mlho/uAMLfAFevIyGJiTDVHMQSWZ854klm8aTaR8CwtSFOpGd3QfLlOUCgx/TlMW38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7472
X-Authority-Analysis: v=2.4 cv=LM80Q4W9 c=1 sm=1 tr=0 ts=66c700aa cx=c_pps
 a=8NhCg2oU0sQOR5chO7ltBw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=0034W8JfsZAA:10 a=64Cc0HZtAAAA:8
 a=97etyuspaZ1SVtM08a0A:9 a=CjuIK1q_8ugA:10
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=YxdJHuvUVH0VW-lZxdQA:9
 a=_hwXL1MA5Whg6o5p:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10 a=14NRyaPF5x3gF6G45PvQ:22
X-Proofpoint-GUID: lNZmxLSb0wSdH2a_5gqYPdRqXBHKAbAL
X-Proofpoint-ORIG-GUID: lNZmxLSb0wSdH2a_5gqYPdRqXBHKAbAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=proofpoint20171006; bh=MeIsAe9rLr45rQW
 Q3jC6/qBUr5wP+WNNZ7NgRzDHdEM=; b=sGpp2IrYCieD5ku0Of4F2X+YpUPzHVG
 bU2CDzNrESU1clgHbw0jpezCcpE+jTywlLlhSMwbCN/OCnrZQ03nTNcnuYqtBlAl
 vuq/J9x2ZXGb5WNU2Q0Br6hWuDBudEfP8pXXNEolhhJL3Sqy2/at19WcFVSxS7QE
 IxIK5YBlfZ5xt77pyDDvGmkCxzHXhKbvR/gmSg+M+YUu/Fh9v5KGSxBuP12mcU85
 eL3IpXXMuQjkRsYuKBj6O4t+FojGFCvQYjVk8Kx3BUvr39LB+Bls9+7xmX3DTh91
 NATWxejNA3g5gLKhSnaWlR2GZLU/L1GxVlTWqL3wXic40KAb3Ugoavw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeIsAe9rLr45rQWQ3jC6/qBUr5wP+WNNZ7NgRzDHdEM=;
 b=FWBndajNNqb22gnU2BwVcD7DzcTYAjQqUOIxpXkjNV5XkfcnIwZLkhzTeZvFeJGKge3jY//0SyYXBeNDlcGtQ/1rZfJIWoVjYbVlpO6P8btW1H6VWkJ4N022E0n1gbUW0NuxGrWGqfn4+cgHO2PXQgCByZpWKvmjF3yY67nfOEIF7Pc8M1uZCPRM4WONlmqK06ICbu0k7VGgdxS+qFFrpoP0GeuroRZt9DUfj+/58QRVD7fkNOCswIEnkZtSWQlNpoCCiiziKIUqs3DgB5lfwWR6KwU/H43NlcKzcUfeh0K8vG6uaNrce8tW2XpXMUu0Sb8Y1nwPCmDpLz2FK9UUqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=nutanix.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=nutanix.com
 header.i=@nutanix.com header.a=rsa-sha256 header.s=proofpoint20171006
 header.b=sGpp2IrY; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=FWBndajN
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: support configuration
 via drop-in
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: multipart/mixed; boundary="===============3246373094549743327=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3246373094549743327==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DM8PR02MB8121C7095D4416BC8697AEF2938F2DM8PR02MB8121namp_"

--_000_DM8PR02MB8121C7095D4416BC8697AEF2938F2DM8PR02MB8121namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping?

On 13/08/2024, 13:46, "Simon Rowe" <simon.rowe@nutanix.com> wrote:

Take the arguments for the daemon and the "udevadm settle" command
from variables and support defining them in /etc/default/udevd.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
---
 package/eudev/S10udev | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 4e799d6507..6f20fc51f5 100644
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -16,6 +16,14 @@
 #       /dev/zero, /dev/null -- that's needed to boot and run this script.
 #

+DAEMON=3D"udevd"
+
+SETTLE_TIMEOUT=3D30
+UDEVD_ARGS=3D"-d"
+
+# shellcheck source=3D/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
 # Check for config file and read it
 UDEV_CONFIG=3D/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
@@ -25,10 +33,10 @@ case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
         [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /pr=
oc/sys/kernel/hotplug
-        /sbin/udevd -d || { echo "FAIL"; exit 1; }
+        /sbin/udevd $UDEVD_ARGS || { echo "FAIL"; exit 1; }
         udevadm trigger --type=3Dsubsystems --action=3Dadd
         udevadm trigger --type=3Ddevices --action=3Dadd
-        udevadm settle --timeout=3D30 || echo "udevadm settle failed"
+        udevadm settle --timeout=3D$SETTLE_TIMEOUT || echo "udevadm settle=
 failed"
         echo "done"
         ;;
     stop)
--
2.22.3

--_000_DM8PR02MB8121C7095D4416BC8697AEF2938F2DM8PR02MB8121namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ping?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<p class=3D"MsoNormal">On 13/08/2024, 13:46, &quot;Simon Rowe&quot; &lt;sim=
on.rowe@nutanix.com&gt; wrote:<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Take the arguments for the daemon and the &quot;udevadm settle&=
quot; command<br>
from variables and support defining them in /etc/default/udevd.<br>
<br>
Signed-off-by: Simon Rowe &lt;simon.rowe@nutanix.com&gt;<br>
---<br>
&nbsp;package/eudev/S10udev | 12 ++++++++++--<br>
&nbsp;1 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/eudev/S10udev b/package/eudev/S10udev<br>
index 4e799d6507..6f20fc51f5 100644<br>
--- a/package/eudev/S10udev<br>
+++ b/package/eudev/S10udev<br>
@@ -16,6 +16,14 @@<br>
&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/zero, /dev/null -- that's =
needed to boot and run this script.<br>
&nbsp;#<br>
&nbsp;<br>
+DAEMON=3D&quot;udevd&quot;<br>
+<br>
+SETTLE_TIMEOUT=3D30<br>
+UDEVD_ARGS=3D&quot;-d&quot;<br>
+<br>
+# shellcheck source=3D/dev/null<br>
+[ -r &quot;/etc/default/$DAEMON&quot; ] &amp;&amp; . &quot;/etc/default/$D=
AEMON&quot;<br>
+<br>
&nbsp;# Check for config file and read it<br>
&nbsp;UDEV_CONFIG=3D/etc/udev/udev.conf<br>
&nbsp;test -r $UDEV_CONFIG || exit 6<br>
@@ -25,10 +33,10 @@ case &quot;$1&quot; in<br>
&nbsp;&nbsp;&nbsp;&nbsp; start)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf &quot;Populating %s=
 using udev: &quot; &quot;${udev_root:-/dev}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -e /proc/sys/kernel/hotp=
lug ] &amp;&amp; printf '\000\000\000\000' &gt; /proc/sys/kernel/hotplug<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/udevd -d || { echo &quot;=
FAIL&quot;; exit 1; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/udevd $UDEVD_ARGS || { ec=
ho &quot;FAIL&quot;; exit 1; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udevadm trigger --type=3Ds=
ubsystems --action=3Dadd<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udevadm trigger --type=3Dd=
evices --action=3Dadd<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udevadm settle --timeout=3D30 |=
| echo &quot;udevadm settle failed&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udevadm settle --timeout=3D$SET=
TLE_TIMEOUT || echo &quot;udevadm settle failed&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;done&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&nbsp;&nbsp;&nbsp;&nbsp; stop)<br>
-- <br>
2.22.3<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM8PR02MB8121C7095D4416BC8697AEF2938F2DM8PR02MB8121namp_--

--===============3246373094549743327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3246373094549743327==--
