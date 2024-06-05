Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DCCC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 19:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDB084844;
	Wed,  5 Jun 2024 19:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDWboOhmCuR0; Wed,  5 Jun 2024 19:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3457B8484B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3457B8484B;
	Wed,  5 Jun 2024 19:27:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16A9C1BF5AD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 19:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02091405F3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 19:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f7PKWlc0r-b for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 19:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95D25400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D25400D1
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95D25400D1
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 19:27:18 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 455ID9vY023317; Wed, 5 Jun 2024 19:27:17 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yjs64mte3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2024 19:27:17 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph004rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 455JRGF3025817
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 19:27:16 GMT
Received: from UUSALE2G.utcmail.com (uusale2g.utcmail.com [10.220.63.42])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 455JRFmJ015792
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 19:27:16 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2G.utcmail.com
 (10.220.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Jun 2024
 15:27:15 -0400
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Jun 2024
 15:27:15 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.143)
 by UUSALE29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Wed, 5 Jun 2024 15:27:15 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1836.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 19:27:14 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 19:27:14 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [PATCH 09/10 v2] support/scripts/apply-patches: use
 appropriate TAR
Thread-Index: AQHat3FKBwOM2reYZUSJqndei6bS8LG5jVlQ
Date: Wed, 5 Jun 2024 19:27:14 +0000
Message-ID: <BN0P110MB1673BC662CE05367D7C910D8EBF9A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <14bb90c566707dbbe9c66b7cf5ae2a05413eeb40.1717609998.git.yann.morin.1998@free.fr>
In-Reply-To: <14bb90c566707dbbe9c66b7cf5ae2a05413eeb40.1717609998.git.yann.morin.1998@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1836:EE_
x-ms-office365-filtering-correlation-id: fad8dfee-1c28-4951-b879-08dc85958143
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|38070700009|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dGZSPYoVtRqjk/sCoOqeykw0qqbMTsSdLRdFIZvrl5/4yx0MP6NhXrPhq080?=
 =?us-ascii?Q?PE8ADOFi/29NlLdEj5EFr0UInlKD83AvxooFLL7ygQqPOlz9hDr80uL3XTIL?=
 =?us-ascii?Q?HWvTILMDlmnSoyjXiW4+olMsKk9nE4pdyB65fGyVMVMbwAnln6uGRKARr02p?=
 =?us-ascii?Q?z3BHUpHrJFYrYWh5+Jp+ry/WySmSYQQtmuzIrc5SWpUkyP1QTn87vcwNIn0l?=
 =?us-ascii?Q?y3wIVPOEQStD5pyrjGc1Jkd7InO/LJbFYiOAI7YBJRZJBmd7QAV30IcSUJux?=
 =?us-ascii?Q?N2nxYN+AMn8pFamsZ8/IPGITzHdm1vxq0CPS4nkT/uu2RK4aoQWiTP7hdAPR?=
 =?us-ascii?Q?0ooWFV+2PeeHGhdzj7vEvmGz8LlI12CBp+7XPQNpMzLiyMeDdAXM/vhr+G7t?=
 =?us-ascii?Q?FaJxsbje5RWvKkBOiA5DxY1e37myX9uBeANcn5zGRbtOespwxW+M+t/BsbZ2?=
 =?us-ascii?Q?DXdGJOtbwwhNjmRsNOi3Az2ud436DL6F00EADfvByZE6VgkLRvlXpYQdDd43?=
 =?us-ascii?Q?jElUN1csA6ckOOqv2fK8napItX+YnptdKHCd7NvMlF0y82un7Zb5hH2IQZmy?=
 =?us-ascii?Q?Aq2ESg0egSI8PYL901s7dUqIefAD+O/nkIRDFTEMq1CuF8b8YMk4DniGPwGm?=
 =?us-ascii?Q?IoU5vcgYnvP1MhaxDyVrdr8WC9voiLq0NBJyPISIYpxIPc9rf9wtsSlUMZqp?=
 =?us-ascii?Q?JUktCNnLOBrbT23UfZy5USQqk+KtBrRPoJcoVTynfHjzADuwIao9K74MY1jK?=
 =?us-ascii?Q?xaKbZkOQJL8avPsmeqhpBJOhMvAA51+m/W2HoyPOG8akv5g9te/mSjegVK5U?=
 =?us-ascii?Q?xQr4Hxozc530JJUR98LTfPgtG3EMkcicBf92ZjX02hENcYSm1/8ULvXEespQ?=
 =?us-ascii?Q?wflYSUl7Kgv4KuIzquMAvPKYbZmKRQvCijnu82ZawQ7QRCZPx+scOZ/P3MpV?=
 =?us-ascii?Q?MPUBTRA2FqZOfn9UKbhvDonNqD3tzTB0hHn32BXxhvmfNRQ9bkp1r1u18CuG?=
 =?us-ascii?Q?C1fcmDHEjdFM3nj6LpY6nJjXp6G3tCygmEv8b6YEJr+lxBDwIM/BRWBviRdI?=
 =?us-ascii?Q?cna3AuTcjG/dZ7b505I4NSLbXZ0iS1JeUphFidJpwLOOIA/5Fb2EoEaj5Ovq?=
 =?us-ascii?Q?dA8XmifKEehUYSysipwVjbH60xETxWJuELW0RKZZ7IWt9fAE9LrHwOmS3lk1?=
 =?us-ascii?Q?DFIn9FEhimXtBuRtBpNhLmag24jbE1bQNB/uMe2O1a+jTyPYOdBYN+djwAJR?=
 =?us-ascii?Q?0rWpEbMdK2PCPkMsRnyvm8rAbHENgK2Z67MAQuZoHD3pVgVzxObtGy/oljTT?=
 =?us-ascii?Q?1+5hpKE6qSo+Ul1OYvGRCueBh6ewhAK3LXin5fbVBPI14/SPEKX1e3TBrgpW?=
 =?us-ascii?Q?y5zO16iLQKdTO2o/mA8U452x0b7QydEMHZWVaarlPLSP3JNBGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hChgcWrF8waXrIf1f+fgyMwD7wo6VD2UyUKSYmRv+4lROSEzQHZyn5zCPdra?=
 =?us-ascii?Q?FWIqRe8hwDU2O3uLP9xjq9NSlfswpQ2p3DdJgP1rPHet6qJncFsJbJKhS0Ym?=
 =?us-ascii?Q?NWzC6pjHPqdLZ+rqSQfAqnmh5w6vgUSyGRn3cqW/YxePkvt/45jUzlnT52Bd?=
 =?us-ascii?Q?BS2KNcnPdTOzfwpy1VlpADrUnz/2D+Lf+1Ou77hUww8tyvLEr9IchWyaFuVM?=
 =?us-ascii?Q?kjRXJDDE0x9sFWEeTThXzLL3MomvvGhJqsQ/M7EX9AwHasM6Sqqve+D2mBbE?=
 =?us-ascii?Q?dSast+m/FqQScEdeVNkOXoTEtErtoVHnXVQ52pI6ibAvWe4bjykyY1TOT4J4?=
 =?us-ascii?Q?bTQ8ai3gcXyOaZ5yzGw6BgYZ4owP+868p3CscMhp92rWc44KMdurHrSalAdi?=
 =?us-ascii?Q?2XAV7BY0oC9+D0K5X9QclFh40p8YoG03ynvwV3jRRQur4OZ3WeCkUyLdRHjv?=
 =?us-ascii?Q?a1nhP7YqGLkhqXtB23zPBHqFtn1VQn/F1scUCbnanY0P0zUdJdeFR3ENSeA7?=
 =?us-ascii?Q?+pi0D5kXO4Mvn0qP+ah2AZ5sdQ2TM+Ithdrrb4g7Gx+QhxEqmMDSwzKNqHNJ?=
 =?us-ascii?Q?4iOfyav3sKDONKLUfYEkxSr+WESEWgUuReV5TVlJFTct2dHqM0H9Acdefv6h?=
 =?us-ascii?Q?sV5Pw16DLJ6DsBFMN+5MXznFwn0xt0aWXL//TFC+v5xHs21XipVEdVn6yrwg?=
 =?us-ascii?Q?xKl/y0p0Ktxpa43pNM+/UjmgQrc07OU+CFo5aHDKaVDveJ6R5j6nuUE4IArq?=
 =?us-ascii?Q?EMA0mYvmsGml3VgudjyeXS9l8I4ScGbSo/6JLlaO6hSvj1k1al9MIlfbHdaL?=
 =?us-ascii?Q?hyHCJdzv8MXvYTUVSEfedJEka2ESTZfIi5pfmFRh+qzc46sOOZdc2mOEZrHk?=
 =?us-ascii?Q?be0bXgs/qkOMEsztKb1hyFP44+Nv7XC+7cmvV7IYrseL5/9kmwtOEzKI/Z2d?=
 =?us-ascii?Q?R5jgdXW8mim+8XwpANSZXJ+v6CQYLj6aSw4ReNUMkCZ0EbJPeqGfL6EIilRl?=
 =?us-ascii?Q?TYc16kA+RqlCsNBAFjXuizQO85270D7F/RjjrtqtzrJsDzeOFSjTEe942MQt?=
 =?us-ascii?Q?OCmKD9emG+w+nB1Ki3+06DmqYoIT2wjxDPpR9suyE2U+etCyhlgeVQm3kG1P?=
 =?us-ascii?Q?7T5jQetNT0L1JCFyK+kNvWZdbutBfTOBsUdGeNRz0Xay52UxSRAl7Qpe3Ts+?=
 =?us-ascii?Q?FVxg/BB0T7BRGwF/ROb5Pp+XHd3BRaMStNCzAi5ArYU1NP7M/pSG/n0/086I?=
 =?us-ascii?Q?xlV4WEN2OhZBHDC0VQ6cIsR5PIlqIMRWpzaOB5iQ3obkwYwZIzUc6q2hLv1b?=
 =?us-ascii?Q?2aNiCebiaRb5bA1gZ5E2x7uS+KjXCwVkD7YM1UGZQCPvliOVb9reMAsLXwLb?=
 =?us-ascii?Q?SN8yxwVO9LFKBFU41srlmdMRw3kYeC04ic3wr7jiYKWao4O/iVoztxvWBX+c?=
 =?us-ascii?Q?O599b9AJjg43adfSD46Z5DYt2CZBO92UIWBxdCF7MeYNMRQuTh5LcUhl/4nI?=
 =?us-ascii?Q?OH2bF0W8c6O1RaA=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vLY+jiaBYcQBNFLMw7CSFBhevNgBI1pRX1RrSURAY2OduZ+BV7orzY47sUU5OWp+tq58es1x03K1vcOnWWF1yeN7UV9yI1XsnRd8KlJj3mxXIH/uLP/UAAgfMx34uVLLbGizSZoSTrnauIlGlSZVj2TzEkvmkPBr//XHKVJJvsJchXIzp9a4syLIaPGsuYiDHpwq/A70+OfRYdC2JrOu/fr8oPlT4M/y94+kbF0b3sI53wq6LAD3sfoErUAvI68t2EH10TvWj5Y0MYMRAMehdpV7w8JZ6SFv9fmdr6T8mQbG+7AovV0N8GB7h+Tzs5bN54ltNqSE1mu5uK5UUFtXhQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HoG1viYt+p/eIN9DsVBoWSPf3uiSkKtTUt/vRv0eII=;
 b=IrpcWw2S+V1DQ5feGY0pG+qtK4lZ2h1HL6cbG4fZJRgC+DrT1Jh+UpCFUUxSNMneoRePKmKNGMJ+tXn5JS08eTw0J6GlHNK5NP0t7awT96X95tLUyWJyywxoY04yzJHZ/TmL5Z6eW6QOPrLP/W+hkUaE/5Bh7Spn44LQmU2xtejg9qCnmd1T/+eeVJg+/1UTuAA/CRTfN/bfGo0jRqfckBnjkQ6/C9J6Omuek2YLJDH9CAIE3a0C1W4yOx9QKQS5xsJc12ITMsBA4Q+BTOfNmuzBT2LM3Llu85JI/zQ0em1GkYjafwnGn/F4zZIibb1J1Fad+Qe0IGOVbdZnjwAKzA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: HY7RqbLTTNE+9pz3P+qjEnDWXIZm8uzLmherEXFBogSs2a4T60zWExG0fcJvSM4/URWFpOpNs078qaZoCH7pQ0JTTdckCN2Qyn6zCbzqLpRpXU9IhL+c66hPdBbjs3Dtv2iiR6Nm+9DUgLimEtpiG2nLeP2hHl77tejvxWrKelwjh85Ak16HMRXfZMGu17SxxSU+T3gM+9NXkA8ZnE9xRqHgW88cuZZxszvc0aJuga9hgSZrpwBOCjEhGixQpzbA5zAe3dHcE0MlmDuu75/g7Mu1EDXvtKa5N64Zw/giXAZO/NGq7v4Le64Gfp/kYqg95FPPT4J3CoFjmQK8ztYNWR0hatEaXggBX/GEVCXyaihQ6RyQH072BVvpCEnOBsxgqRbDq/JrdleB5Z2SkwYvoHRuJW/9cwy+arxR0MKn7f+FeEIOeDuxuHYbhV8OOvAsGnEiqPp/dwYwUzWGVfNsFaF757KFyejFO+lUpx/HC+DVWW0qv75rbQmGpelL7YfX6Zmv11zWlpbc6HKhXmq09ESPq7LmAaa+/r4T0Ng52kjhCAYbvK4LAUHyYebYV/axCThxUB72i3EHfEcJGxb/Otvdm7Odd2aBGKo7uDZjE7o=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: fad8dfee-1c28-4951-b879-08dc85958143
x-ms-exchange-crosstenant-originalarrivaltime: 05 Jun 2024 19:27:14.4623 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1836
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=910 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050147
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=972
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050147
X-Proofpoint-ORIG-GUID: CYXFeLbYiADOQH5Z6nUQAqX4RnP5nRCl
X-Proofpoint-GUID: CYXFeLbYiADOQH5Z6nUQAqX4RnP5nRCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=983 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=9KxJrysrFZQlWmVs6KMphyhN5mctlD8N2YMxWLQF1NI=;
 b=D7Ueh7kp+scxLe7sNiiBSDga4mb0MQ2tHtWtBE3FwZKncE1N5PqpOwOlZHoMi7Rf3XrO
 6K7XswVReIRuErwy/Xv0wJkScamAPBgJeXmy/R/RhpjJaxeIQnJKibeZsFsx+73sb5ZK
 R8kxmgJ98jqXsJ+zn52K4PTmmevshCd/K/DzYin7W6ql/v5iWi6iWXlHWFel9wnEFamG
 2AzAIMhc9AYzl6FVaP0Unnu0hUhe5J6O/x7+Ym9B1gZ3xWYAYxuhk5apIYwwCSvx72UC
 8p07SmRjS08aRWBWg78eErfCdNQoF8rAFthkSL7Si86ttO1I0NXiehDciqNA/YRx5B0f JA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HoG1viYt+p/eIN9DsVBoWSPf3uiSkKtTUt/vRv0eII=;
 b=o9rHuBU6AKzFTlPk1IqiU8HjOy+USwQgolhENdnhVPJMcvYyqVKI2MKU+RLqqnqn0Junl7al8trJsh1Le+luhmLQ/6b/+5ZlFW/wDItZhHpxWnteMarxlN/2cb3epLd5T9gsl6mYmx0cRN6SV8oFauH7rzSVXPdX4vtFPj6tUXI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=D7Ueh7kp; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=o9rHuBU6
Subject: Re: [Buildroot] [External] [PATCH 09/10 v2]
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



> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E.
> MORIN
> Sent: Wednesday, June 5, 2024 12:53 PM
> To: buildroot@buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Maier, Brandon L Collins
> <Brandon.Maier@collins.com>
> Subject: [External] [PATCH 09/10 v2] support/scripts/apply-patches: use
> appropriate TAR
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>

LGTM
Reviewed-by: brandon.maier@collins.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
