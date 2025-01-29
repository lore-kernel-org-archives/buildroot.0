Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D03C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACFAA608EA;
	Wed, 29 Jan 2025 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGzmKDufhDan; Wed, 29 Jan 2025 20:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51F7610D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51F7610D2;
	Wed, 29 Jan 2025 20:04:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5A51942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3597608EA
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XG3bhQfJjMtH for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 20:04:25 +0000 (UTC)
X-Greylist: delayed 1077 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 29 Jan 2025 20:04:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 659B4610D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659B4610D2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.183.227;
 helo=mx07-0015a003.pphosted.com; envelope-from=ian.merin@entrust.com;
 receiver=<UNKNOWN> 
Received: from mx07-0015a003.pphosted.com (mx07-0015a003.pphosted.com
 [185.132.183.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 659B4610D2
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:04:23 +0000 (UTC)
Received: from pps.filterd (m0242864.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TJKn6Y017664;
 Wed, 29 Jan 2025 13:46:26 -0600
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 44fg02ar2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 13:46:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5UrFXJN9PhWvXPq0pRMhnlE/3nELrQAnLPZ2RxeywMYUEzMNhd6yrQr9vdD1O6YUxr3OJDNcUVnyuqMW4H5BaqKFV0LEZByV7gzgUW9LLWcIaIcDS7UMT6K7mPS28OQON7X5zUv1kQTKK1X4ffDt5K1sfPTQXTSLEOE5FjJBtBp76Dm7yo5CAtR+exoxxNu51082qEFtjfu54LQc8ZPBF5x9NDR3LO/kiW8E2RaJEfUkfd1Mvf1BPXUgwW6L4+V7mNCk8vyNXCUVhmUQUa8B/rkhUtMrGnTR8wfajITeeuEYXhtDcbpUIF5kCnj90pVmPJvUQWOeOc7wd8H52aAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW+pgLpxlMi8cVhp8HN7YnXM2U44+9DBH1VWVEn7wF4=;
 b=hrkMPQx6HTNXJ2agNb3Nbg/beeJQVa0i7F+RNen2ocTYltWoooY6aLmj24lsvG1hky6OdEsS53a3jqifnofCBYPse/RF6lgVf3ISUAV01IWOAl8iZS0Vq1q6CFBnKCVAmUB3n5DuJD+efa7p4RfgsQowD+7+BmZEiPzQS190wQ/33JOYGMImbiLt6Cfn2K/L+T+hAPqEMp9NuAiQ36E0l7w31arBnwZo/SnXnYjjXpmSE+NSquWdoAc4ZiwPI4dtmyT23kxDu0mQiBl4kqbw72T6XG0jVsKaN9e0kd+ACp9mFlnNbXwXdQnKovU18fRpEfspWGt9/thIHd0kghbeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 19:46:22 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 19:46:22 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "jezz@sysmic.org" <jezz@sysmic.org>
Thread-Topic: [PATCH] package/lxc: add libapparmor optional dependency
Thread-Index: AdtyhlQpJ6IRrcZ9T5SlFwYsoImpeg==
Date: Wed, 29 Jan 2025 19:46:22 +0000
Message-ID: <BN7PR11MB2788D839BE96640DA8286B62FFEE2@BN7PR11MB2788.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|PH0PR11MB7544:EE_
x-ms-office365-filtering-correlation-id: db88d3c7-aeaf-42b4-02ad-08dd409d9bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Lc6yjA8+QMg7jsnaAO5LgoZMm2gJV3JMZbccH+zsaQfgwL8oKm2lBwsTPfbK?=
 =?us-ascii?Q?+/ylEfSAOTuSXx+mRCTpTZ5RPmwKAM0EuWmzOOR00g+ahi7Gg6Tra1mkUBFR?=
 =?us-ascii?Q?V0RBajm0XKSmazmK3NyVoR3F6dds97IGH1e+0Ny7W2AIsIGmKT5kVoG9akXX?=
 =?us-ascii?Q?SJxwJjltZLFESxQ1fxAu9CvBgTPIzsVyZsCLMEKgZyEBBBhREU9rWRKufrFu?=
 =?us-ascii?Q?dxiJKMiYFfOQ9y+H3/NLCIBCww5ytIralgFzzYNRS44hAGpVLUHn0XMJ53LV?=
 =?us-ascii?Q?YjXcs1y0t3BGp/Lu/GzFCMZIsWKu7AFCa84dil8IMAam25gl+ZjHBAUp7sHn?=
 =?us-ascii?Q?o0xCPGRpFKbSEERP9Q/82LJ9SGrRaJJviAodarft8Sw3ncPuBEPJXgyeaYRI?=
 =?us-ascii?Q?9Pixa6fz9lUFSAR74drWZdJjMvO25WejZu0yNES5uBMp9ERYZkTbzom3ZiKW?=
 =?us-ascii?Q?3yaWixzAkSF0dvH7eEGH3phsCC+n8AaqD6dt6A+yDKVOHQbjNvTrID/GD/XB?=
 =?us-ascii?Q?Y5Isk1eeL5qEbuFyWv6CPNhaQGKCVKigpSwAsm5Rodcf4Qky9cao2mlgl5r2?=
 =?us-ascii?Q?SsgiiptKJCO1j6bg4c0nBg9pxJ38mlnrAsn6VNNM3w8jg8vVPGFurC7Tolip?=
 =?us-ascii?Q?rBXCY+Gl0BtWweaJTetZsLU3kzuaQiWw/QnYI1K3UyBQMl8f8d8pCSyFyCSP?=
 =?us-ascii?Q?1sdTr92lHdEr0p7uc8+mT3UG7PdjfXNHBLWwK9XN1ILC6ST/jxH+tz9fdu4h?=
 =?us-ascii?Q?u0KdpDFDdkN4NMZF5R5WIVdn3xYNfDd6uVcz9fC1uL7eoTWtbGLQ5pErJoVO?=
 =?us-ascii?Q?cBVzqHLVb1/ZcpSynhKetjq4cwi1BgRcQWJNDm9qm+a/KJU1PwZ3zPnBoKb6?=
 =?us-ascii?Q?+3ZOy0ujMNeC9w8GlW9QGlQKAR2CGIOLILNZg953bLi34bX9JDfVuRdx415C?=
 =?us-ascii?Q?/dxni+KwlLRImjJYwcNGXPhZqzJLDVzyBFVRHjqHPMFRUwkZc+SVZe+gGbnP?=
 =?us-ascii?Q?qACh6QtUX2CjIoRsLylgUb7KKZqo34uccatX1O0LWzJ+Jrx2BHqtCVwQoWQ/?=
 =?us-ascii?Q?yz93nDsXrsHOMUX8jal/6cKSEDs9035HHDwt0lx6nVoBNKGOalgUkPbkpu2d?=
 =?us-ascii?Q?IaIJNbtkKXWoJkELyxO7jWPLAJx6GQw4ja3IuI2ew86Dm2JEpKTBjcTMZL9k?=
 =?us-ascii?Q?Tp33CIISYCen9FBnGS9l5SVLnVKLFF8URlsgIsB8gam3pD50tW4xzHMu88Db?=
 =?us-ascii?Q?Fha5qIwGi/LKw4QPI+w7cm0/GSa8bsjRc25Uk3mm9D+NOLV4bs+nXvmL+G7Z?=
 =?us-ascii?Q?ZpqNW21IvJns1uRc5jvJvU2NPJOQ8Cr2pUSD5L5hGvupKsX8EEF08l/TroEb?=
 =?us-ascii?Q?Cl3AY/48umXwvgJxrhtXXnQEeap7r77FzgrPv9nOf/X0aTWcPmefNm8byQcV?=
 =?us-ascii?Q?fH38dPVNMpTUmzAQQHg0uHBHwHEnnQC9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TtoV9vN38mdDFKzjh8RKB2PxdvNtQEmaaF15Zp94qH8msK0mAbxoIzaG/cmJ?=
 =?us-ascii?Q?vpgS5pF70Ta4j+n+LvUPiYHq0RpTcVzM+dHcUaHzWEdsD2NhcnV5G/pW8WVH?=
 =?us-ascii?Q?hymjION+rA+OGkvMmI3ZPaRnnszuuvk7rLcg2YL/Bhr9e+WEVVNQxwmuU38N?=
 =?us-ascii?Q?bWAA324bIHDByDAOK2OkXHfHE2j+bY/zLTBJKAfBP0CIEDippdtTo9F+lVHY?=
 =?us-ascii?Q?T4xRQMz8gVwYAGOV6SF1jAUyfIc2IU7cRCt9dR430JzQWn212DBkblWDtfk7?=
 =?us-ascii?Q?qkWCrRHoPSpfm8/yucEyvuTpSnVbJjHCAYPpJS3kbKvm+sgzBLKZLA/wrP/G?=
 =?us-ascii?Q?ZdSFFA36VOsJr7MjENWihvisiZjjnPMKGZHRE3yXN3QOlMhBKKkxtGB0Db9C?=
 =?us-ascii?Q?eL6rgZaUAnQdR0JMVjaHrKMC8K50GG4GZC1IESSYZTK/bzjxb49lnCibloXn?=
 =?us-ascii?Q?UfY3SaW7pyKNE141DZWWOTUSSm6oWnq23cR/NwJOGBF3J2Bj11GIa4BSBscs?=
 =?us-ascii?Q?1kA/mUsFKRYyaUaQaQpl7sbjnbsGyA+hsXEK59acrzu0+qoPqobxLY0A3BcO?=
 =?us-ascii?Q?56gxqGeodSPKRGrZZlZQl0O92S7zpOsOEj0wLQKblgtSLOzU3PO0A34wvhLI?=
 =?us-ascii?Q?pVe0j4shYLSWqGciplyXT/4DENrtWGqRtMdS8e6Ykh4cHw4riqZxxzmEpwdY?=
 =?us-ascii?Q?NM5eq8hS7wFv0bwn6vsL+5rPDCwQZz5DcatKpz+e4yV94WdmVGan5cOxj/fK?=
 =?us-ascii?Q?kNzJygTysJQJXbvJ6zrpjKmm8WW5sjzYUkiPjYB/c37Q0QASGzc5910Lyoyh?=
 =?us-ascii?Q?VVJIfZSV1XtW2H/dhY0pnjRctrWoD8auxqw1dz5iOYQ0BnUjdQZY4jHQgwuo?=
 =?us-ascii?Q?ib47qkWgcVDASxeLfuKuSEtdRZ6WZHYYWGe54ediPhDC6Yk6LX4B8xjFBufp?=
 =?us-ascii?Q?K5MblBoxVk3EhqJ0qO0J4Yu7pMr5Z7p8vNlt+U+1qlA0gKYES+BOyCUhUJ5/?=
 =?us-ascii?Q?X89H3BLVaAU5Xog2P7jyVjiu6BUSDc3aja+uVwZh+Y3e5d6b0+Tq6QQvgbkW?=
 =?us-ascii?Q?ItBgHxvUs2uPAJzmTKx3opmX/5dPO+5Bv1qGQ7DIlooGdzO+qWFN+yvrUSBj?=
 =?us-ascii?Q?ITxk1VETS7RgpOSua2bNIcE+PvKmviYjqQMWa0aCwZaWiT8KziWTiX++9L7P?=
 =?us-ascii?Q?Zr0t2spNamnMj3+2CU4P5wZ/bMzg7UUscUErvLqkf9qdSEJSFDryinuGBygU?=
 =?us-ascii?Q?kmlibRzebLOPTApLIRIrNrKbLH4FiSvbBBL8SoNDyutBW/jN6eBO1slFCxhz?=
 =?us-ascii?Q?4f/W2LoZuCc6TY0jQautOGeAxva2nMSSXlZMqocGFbOTaDQ0GupSxzUSYUDp?=
 =?us-ascii?Q?9eCYndiPx9jqxXuohtS5EMP7sYgnkh2eZtTsWifXAv0jydqY++GA1KcXubZl?=
 =?us-ascii?Q?vm8l3R75ubIv4k6nW5yCe6B0HYRvST0BBShh/fhW0anEZ2dLtbk8bnNtup45?=
 =?us-ascii?Q?RImVR46Zca0ucZ7gmKwxmR4dp8dpZ/VumkvGPPG9UYAZv5yyKJL8wH6ZQHFQ?=
 =?us-ascii?Q?yzO13RKS24B83B5jganK+eSfuxmAH6AHNRTt5wpf?=
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db88d3c7-aeaf-42b4-02ad-08dd409d9bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 19:46:22.4032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9GfU16a/VxrnNk4a8uSOiWOlkCFD8EiwpYHG54IcZQCO/IAW/jmt66lBJnR9sIQOn2kcTOwPnl3Tix6p+FtxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-Authority-Analysis: v=2.4 cv=T9J2T+KQ c=1 sm=1 tr=0 ts=679a8591 cx=c_pps
 a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=dVDJzTMCqzgA:10 a=FEbzDYiKvWYA:10
 a=XDZnj_NiAAAA:8 a=_avXZ9AP4hCRhWvol4kA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=faD4rtzqHI1zvxisDNYA:9 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10
 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10 a=Kam8I3mwdY3oFHMCdhp_:22
X-Proofpoint-GUID: wr6FHwT5pT69GS3c4msMsWapoPvH2I9n
X-Proofpoint-ORIG-GUID: wr6FHwT5pT69GS3c4msMsWapoPvH2I9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=967 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501290153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 mail1; bh=iW+pgLpxlMi8cVhp8HN7YnXM2U44+9DBH1VWVEn7wF4=; b=kbr9y5
 pQsCEivf8aaky6/d0cqZ7JhrMbODA8/NIgG3s3BQCGm3lKw4b/Dgi8q1tLtT91Ls
 f+MCSSkyDY8vWHqAgO9GjsyppKkGV71RPJbWr2oghlIiHpiXCB53mBeY4Ogdxnrf
 J22iHJrSncJgSxCAVAppCfEMsET559r6OLfBaJsAzb+wEIeJyHSKNOhPBa644OXs
 J+h4Lqx80xlDySkDSyhIBmpOitU8XtpxeU3LhBMN5qtc1MpJlXANx99WT59Ur95t
 mLnhSGuHaQti4LhBX5KDWgSFcYR2Aj5onnXw9yTcRDUT4bMsXMVo3FXBWiJ5oCGH
 PT17x0oDQJ0+KH1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=entrust.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=entrust.com header.i=@entrust.com header.a=rsa-sha256
 header.s=mail1 header.b=kbr9y5pQ
Subject: [Buildroot] [PATCH] package/lxc: add libapparmor optional dependency
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
From: Ian Merin via buildroot <buildroot@buildroot.org>
Reply-To: Ian Merin <Ian.Merin@entrust.com>
Content-Type: multipart/mixed; boundary="===============6737554238880795464=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6737554238880795464==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR11MB2788D839BE96640DA8286B62FFEE2BN7PR11MB2788namp_"

--_000_BN7PR11MB2788D839BE96640DA8286B62FFEE2BN7PR11MB2788namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From e56f77419a6516fef7f63746120755400948e5d3 Mon Sep 17 00:00:00 2001
From: Ian Merin <Ian.Merin@ncipher.com>
Date: Wed, 29 Jan 2025 11:15:20 -0500
Subject: [PATCH] package/lxc: add libapparmor optional dependency

Signed-off-by: Ian Merin <Ian.Merin+Entrust@ncipher.com>
---
package/lxc/lxc.mk | 8 +++++++-
1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b2afb978e6..d2227c3760 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -13,7 +13,6 @@ LXC_DEPENDENCIES =3D host-pkgconf
LXC_INSTALL_STAGING =3D YES

LXC_CONF_OPTS =3D \
-       -Dapparmor=3Dfalse \
       -Dexamples=3Dfalse \
       -Dman=3Dfalse

@@ -21,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
LXC_DEPENDENCIES +=3D bash-completion
endif

+ifeq ($(BR2_PACKAGE_APPARMOR),y)
+LXC_CONF_OPTS +=3D -Dapparmor=3Dtrue
+LXC_DEPENDENCIES +=3D libapparmor
+else
+LXC_CONF_OPTS +=3D -Dapparmor=3Dfalse
+endif
+
ifeq ($(BR2_PACKAGE_LIBCAP),y)
LXC_CONF_OPTS +=3D -Dcapabilities=3Dtrue
LXC_DEPENDENCIES +=3D libcap
--
2.25.1
Any email and files/attachments transmitted with it are intended solely for=
 the use of the individual or entity to whom they are addressed. If this me=
ssage has been sent to you in error, you must not copy, distribute or discl=
ose of the information it contains. Please notify Entrust immediately and d=
elete the message from your system.


--_000_BN7PR11MB2788D839BE96640DA8286B62FFEE2BN7PR11MB2788namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">From e56f77419a6516fef7f63746120755400948e5d3 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Ian Merin &lt;Ian.Merin@ncipher.com&gt;<o:p></=
o:p></p>
<p class=3D"MsoNormal">Date: Wed, 29 Jan 2025 11:15:20 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] package/lxc: add libapparmor option=
al dependency<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Ian Merin &lt;Ian.Merin+Entrust@nciph=
er.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">package/lxc/lxc.mk | 8 +++++++-<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 7 insertions(+), 1 deletion(-)<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk=
<o:p></o:p></p>
<p class=3D"MsoNormal">index b2afb978e6..d2227c3760 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/package/lxc/lxc.mk<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/package/lxc/lxc.mk<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -13,7 +13,6 @@ LXC_DEPENDENCIES =3D host-pkgconf<=
o:p></o:p></p>
<p class=3D"MsoNormal">LXC_INSTALL_STAGING =3D YES<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">LXC_CONF_OPTS =3D \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dapparmor=3Df=
alse \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dexamples=3Dfa=
lse \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dman=3Dfalse<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">@@ -21,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETI=
ON),y)<o:p></o:p></p>
<p class=3D"MsoNormal">LXC_DEPENDENCIES +=3D bash-completion<o:p></o:p></p>
<p class=3D"MsoNormal">endif<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">+ifeq ($(BR2_PACKAGE_APPARMOR),y)<o:p></o:p></p>
<p class=3D"MsoNormal">+LXC_CONF_OPTS +=3D -Dapparmor=3Dtrue<o:p></o:p></p>
<p class=3D"MsoNormal">+LXC_DEPENDENCIES +=3D libapparmor<o:p></o:p></p>
<p class=3D"MsoNormal">+else<o:p></o:p></p>
<p class=3D"MsoNormal">+LXC_CONF_OPTS +=3D -Dapparmor=3Dfalse<o:p></o:p></p=
>
<p class=3D"MsoNormal">+endif<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">ifeq ($(BR2_PACKAGE_LIBCAP),y)<o:p></o:p></p>
<p class=3D"MsoNormal">LXC_CONF_OPTS +=3D -Dcapabilities=3Dtrue<o:p></o:p><=
/p>
<p class=3D"MsoNormal">LXC_DEPENDENCIES +=3D libcap<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
</div>
<i>Any email and files/attachments transmitted with it are intended solely =
for the use of the individual or entity to whom they are addressed. If this=
 message has been sent to you in error, you must not copy, distribute or di=
sclose of the information it contains.
<u>Please notify Entrust immediately and delete the message from your syste=
m.</u></i><br>
<br>
</body>
</html>

--_000_BN7PR11MB2788D839BE96640DA8286B62FFEE2BN7PR11MB2788namp_--

--===============6737554238880795464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6737554238880795464==--
