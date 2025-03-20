Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88886C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 12:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03341417B6;
	Thu, 20 Mar 2025 12:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsnCBDEjv_Sx; Thu, 20 Mar 2025 12:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5471417AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5471417AE;
	Thu, 20 Mar 2025 12:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6680D1A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 12:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4944341957
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 12:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Q9wPRZhym5y for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 12:25:05 +0000 (UTC)
X-Greylist: delayed 794 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Mar 2025 12:25:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A8C64026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A8C64026B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.183.227;
 helo=mx07-0015a003.pphosted.com; envelope-from=ian.merin@entrust.com;
 receiver=<UNKNOWN> 
Received: from mx07-0015a003.pphosted.com (mx07-0015a003.pphosted.com
 [185.132.183.227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A8C64026B
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 12:25:04 +0000 (UTC)
Received: from pps.filterd (m0242864.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K930dL020433
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 07:11:48 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 45gg208gua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 07:11:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr+9BEZ1y7LwrpyzptbGil3JR/uvRdlShi5QLEFrNAROEP3QGXdbY7JFwo8QTyqeDCclwu7yv5oOT/uDtRkeYm2oFPFieMCc+DDtiYHjZQLedNmP+cCao1Mxw2Ft4DWOp7lRQrN1PEmLjvFX9/4Ki6Z2GEt+RjmTXeoxLb0OEoGFUKNOnvwJKKnyJinnD0lbIpPHvvIMBbFlfGEHNVUaP8siP+Alqu4Fs5URWN6UBlt2MqzTihsOlb80kribPsrnjBj2rJM2XHa4l3yTt6Fq0PCuaq2PdMesL9RpzSfUCz2/+eykbzh1VUzfyyBGlDEcF8bCHFoQqHLJq9GDs0dcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nc8IIclROC5p+NRoxjlIPWPb5iMMbXMfnQIC0th9sI=;
 b=mEYTpYeEW0r3Tkr8u2ItE6XIhzVGVhPPVm8KWFqjBoNqxJOrQ5ZJ3AnUxZY/sd/XPhLEQ+pdkpXsw0thU8prrz8UXr2rYFh0Dbf2tLpIIIcdqcaJXC23mljSpEmlNioPXdD49WtHuDE7meeKbW/Bx+XhY6MFVm7ieXGGi0DaNXKLz5TjisSIg1gg3GGVpY/kzdh/surxI1nJBasvNwzKRVVkfRGAaEGvR7YEPzPgduqiyES0Ty9WLjYgTAl4jF2yAWIVTodRPVuvPV3MNYMgmrSprbyA/P89/iBqTKeEft0VtZ0RMFk7G9IldY50PZUoKuozKvpwoj9ecbpVDETBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 12:11:40 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:11:39 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Apparmor.mk references libapparmor variables
Thread-Index: AduZkOysXBjJ+T3/R3OJS6k/XqKJFw==
Date: Thu, 20 Mar 2025 12:11:39 +0000
Message-ID: <BN7PR11MB278825F154A3B6A0FDB55E90FFD82@BN7PR11MB2788.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|PH8PR11MB6754:EE_
x-ms-office365-filtering-correlation-id: a3343e7d-ffba-4206-4d86-08dd67a85ec8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Sa5hPMtCnz7XsShBwQ08ZPWubc7k4hu15oYuCyI8N3r1wzLJOrnrCR/79S4U?=
 =?us-ascii?Q?lO0E3/8BBSlDHwjDDX8YlE4qfOu2IRHyyLwmpemRlbbY74mZXMknPiY1sU2T?=
 =?us-ascii?Q?o4kwsqEy5V0xjuGf+xCSK4o/V3C9GZGxpLZfW0S3vDaBKDFqmDuRMe3eTNGM?=
 =?us-ascii?Q?Kpofg8DNRD9bukyvAjqSefXwbD7hiDzhcFJHAYm6jbCVPERzp/wV4boLWnJS?=
 =?us-ascii?Q?Vt72CfvBKxzuoMDGmX2UC8lycBwmN13xXS19pfFLpo5fbbf3b4DwdFnm/COs?=
 =?us-ascii?Q?rS6m6RzoYg9Dp5c1ftU/1RNCQQFhvYCbajDGzN+h+tyBqjuEyp64JyAtTaGo?=
 =?us-ascii?Q?MDeF5kAA2s1T/BNLeMyCNxd5xSfQ87uajbNTe3NpMorkKgTYEUgXdzUoCxi0?=
 =?us-ascii?Q?bF0JCNWPsVKwzwZK84qbIcibWSD/6EZSyjsInOymHhU40xPXldfRetSz/Khl?=
 =?us-ascii?Q?7Qo+XNEibEIJEmTwpRJGNqEeKZOcCgDM+3ixCniQHL9UT8O86QXtgAm2Y2jo?=
 =?us-ascii?Q?3/w5ruah7jEfR5bDZJAoXm9/1kMDFzkArA9GLyrlaWn0sS8crGdw5jgOBgLi?=
 =?us-ascii?Q?jI8R9pUTKNH/BI2DcHnYLq9xyC+NJ7OQB+5kpxh8AGSnKHj/Ym3RXgaE5GR0?=
 =?us-ascii?Q?z6TprBYWQhyuBGYa/Ap4+V4g6CKIwppUXZ6l/zevU4o1IRfJ0TXoLWJefvnG?=
 =?us-ascii?Q?dA0cM3I8RqDKPLDtDuCaWT/7t8E03BlyZn1E0VeSC4UrPeSvpMEUNllOR8a4?=
 =?us-ascii?Q?9mNwPuY/RpxpAlHsHQtXouWIndEDprJB3sUXAb4PRRjJn58VFYQxJOZp5mdN?=
 =?us-ascii?Q?1gQTP0rAkHZfpy/B387B6vhSEXsnanS/4nwLMHFjrLFWzGfxIYsaRWz3R8Ln?=
 =?us-ascii?Q?1ObMrgXvoIBdKxO+fYyChS6VgGJC6O+Xt41DH8kK6kmg5nLXd0tFECrxTNMU?=
 =?us-ascii?Q?HBr+OQ+vlqfUiZQG6TXG3GKNg32NBf7gvLqXgpX6QAyuVBwEkqGNLjCy0JKG?=
 =?us-ascii?Q?dc+ZNmA5738qyu3y4biHJYVxS2zFd1Oe5xgLWH4NAfhT7iGZJLlEnt5Dwrnr?=
 =?us-ascii?Q?EOdpF9GdW7BtmY/TpSNmm95QrVmhIYib1StX97A9AtqkeUCfUuk6ZC0d4JoM?=
 =?us-ascii?Q?ixTXFV/VVyapGwdEmvLpfTYYltvtA0wbfNyP4i3zyK7XQqOe0RIVITrnlZLT?=
 =?us-ascii?Q?NiABoJjkuSK//9XGT9mmS1vnTJups8N/BjrIa7Ey9kQCSwxoGpLsd8rsB8nf?=
 =?us-ascii?Q?wXLhO3kgGvHs7qk8I6iZJZp00kmYQhvlePuuUsw3K0HIlaMI6CMjahW0ufk1?=
 =?us-ascii?Q?In/SL/ig7GkeIrwjCMeDBnzC9kJIzZc3e+w04L5Yyhi+bQFiLLST6rfEFE/P?=
 =?us-ascii?Q?wOVC9S+TUUtcPAKpKKvL6jIE/KgSVmFoJQ3mFO5ui8OciyhWwydsYWry2JLr?=
 =?us-ascii?Q?ZmbA8yyRsAtGi5JCipBhaLnVFddRtlCv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rp3OCHTU8hhEH3YWF+CEb/UcP4Q/+fAyns5rWCoM9Q6bOFB5VxYivnA9rdUm?=
 =?us-ascii?Q?diAwHyI2KZiWVy0ZSSRN2E3PdsUhpt2wAwscbIJl5/CqE499uMhFbk66J7BL?=
 =?us-ascii?Q?NKZQje1C5QqyK5htiFYwCtFQ5vTUw++q+E+bwaVDsQw8G/KK9Ithj2FQiCDQ?=
 =?us-ascii?Q?5N1jbNu0/VDUmKhrJA3RFk6wCUM5S86+FnrWJYAIuT8RSXJXckVAUbeDyv1N?=
 =?us-ascii?Q?uvZTU9YtpZeG+byF6lKOkjtN3cB8dSGt8BTlzrXGR2NLFOwX051W8JY65DA3?=
 =?us-ascii?Q?qtsU0t1T1QvXqhAhXdrjCHeSkRzy8/LEuq/C/0EvrHx9YgWHEsRAPivuxgCs?=
 =?us-ascii?Q?kn6KUwBXQaNWRLnbl+w8u2iW67Vy7yxb8VDIsQm+T/d4K5LSK3zUSklmlVz6?=
 =?us-ascii?Q?74VEcU19/INjub+JsaBujg2LcyF9FpR7C1ly2sptQ9MzTF1IReU//oWiyK0n?=
 =?us-ascii?Q?VWfkHYa5TyJwlytSGGMqkhPq3ErcbeD2//s2Ytzvupx0EyPsQIMnDQjW4xCB?=
 =?us-ascii?Q?3IJANXFtTZrFqAudq/LqwssyN0cDzWdnqvfwQYKA7EL+dQTFrbUt1I9PnJUS?=
 =?us-ascii?Q?/s+pbpl08ES/lzocP+F8fzm8mCDVp6LcKGxle7NDlGQRXjX/N+tllsqZQrdG?=
 =?us-ascii?Q?Z38sWRWoOe47pD91ub03F3pb8MxXbLWKJUvAf23GVmlLJFseX4fKMrz1ySrz?=
 =?us-ascii?Q?AGT4G1nag6ypOYv5Mo005ds3DE0TXituSd6JT7pQtFVRgTfifWDgSP2C9ha1?=
 =?us-ascii?Q?SkgBg29P96SePwX5Fwp8uBtSiOkM7RqXhgsLYvAXqRUj5yjERdyRE7WofUBl?=
 =?us-ascii?Q?OkDLgQCFlJjX799/U1Uq52E/b0nEI3ckQdWjjZkCr/wEA+KnrNB3YHz6ywdK?=
 =?us-ascii?Q?Xhu4WkMdHfzl2kNH02dj9JpLqJ08A/jxDJXU1X1dntL6SrBw6rWiiF3nJw4G?=
 =?us-ascii?Q?7wsHjrB45jFsRRS25OjTJs6IPc2V2kioy4AYkZkjrsqUyPkBdlzYjIHtR0Wr?=
 =?us-ascii?Q?dS+hYSPxfdysUY17o5H90IYBhuaKtZlVhQN4u1XV/GNVxCoCvaLgrjGTJXOx?=
 =?us-ascii?Q?DPwuBCzKbML11Q9OtBKAI7zDngA+eHCBn1XPs+fA/gjO6+2yTXJjLLq+VWqp?=
 =?us-ascii?Q?P54CliRyePmN3mOb++waRuP2iTQUCSZddS339fr3qLkO48o1YlcCxGAz4ybf?=
 =?us-ascii?Q?BW/obgRf3RU1JcUf4jkyxjbM0lgTNPN6FE5rCzncY080+npx7m99jbLK0RpO?=
 =?us-ascii?Q?bMl+P87N0dYL5V0AhCuZ7/azg4RkrUpmAwerTCte9DJ0Qeabz/v9xedOlwGq?=
 =?us-ascii?Q?qd8Q83B2eH97CT3cuj+rv5oPD+Z0vukcA5Hw9d9ITnPgcFk9VrmdyVO0UjvX?=
 =?us-ascii?Q?dndH2TTTCj0sVDGhv4kac3w71yXdjfPL9UGfx0rtakhpTHJLXBw3w1DvNenM?=
 =?us-ascii?Q?xfHGjy+9yjoke/pTfoV1PH0nbqwvCCLKrHz+xMaSSiPMDTyS1NX5Oibu90+r?=
 =?us-ascii?Q?05nnt1U8msF/59UY7RcNmVNjKxsmuqULgqeP4JfnFRki0ceHEMMg8buW6sjd?=
 =?us-ascii?Q?0S09yyvJYPheyV2TqhniELDsNfoxRvvugI4guWHx?=
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3343e7d-ffba-4206-4d86-08dd67a85ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 12:11:39.8308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y3DHm+IPN+5om//QUxEO9M6lhsQvXKYsDjcygAJLDCCqeY7WII5vWpw9pWwXhodEw7NThcC50sZeWFKN3cGgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
X-Proofpoint-GUID: 8MBCgbXk65Y3m-AuBwWnXHoRALhRyg8u
X-Proofpoint-ORIG-GUID: 8MBCgbXk65Y3m-AuBwWnXHoRALhRyg8u
X-Authority-Analysis: v=2.4 cv=cdDSrmDM c=1 sm=1 tr=0 ts=67dc0604 cx=c_pps
 a=AuG0SFjpmAmqNFFXyzUckA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=FEbzDYiKvWYA:10 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8
 a=Dpm-dxPRuvrIagQXJJwA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=89goTulxMKBr6O1s:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=774
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503200074
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=
 content-type:date:from:message-id:mime-version:subject:to; s=
 mail1; bh=0nc8IIclROC5p+NRoxjlIPWPb5iMMbXMfnQIC0th9sI=; b=NB2FQn
 8fg2cgSyvFU86Wu0R/vAW9kD/EVdD+/gsqBihcvmSBQF5I4raQFMLj+Tko7pDQhM
 PYw7xKmhSpMC1FnPCP6Ik9U26d9jglWmEm7qf5lKa/iYq7EgFthWFVh9Lp8Aih2f
 ymTEr9DM3pt50iyxGKTj23TLghbOBPyyc2UdIk31ntxHrW7mb4PZUKpIWg+UvFfL
 2/07PCZSTp4sq2APjb1kOvHJX25OamJYFR5ifP7BqA2IJm9VlPif0EYP3aZAbORP
 kTxKBgAQgxj5aQK8i6Ks77VNOM9Igjhm7xedVCKt5KHPJ1V5qN5SFIGO40f9UuLP
 WWcIb+3C1yTB+sMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=entrust.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=entrust.com header.i=@entrust.com header.a=rsa-sha256
 header.s=mail1 header.b=NB2FQn8f
Subject: [Buildroot] Apparmor.mk references libapparmor variables
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
Content-Type: multipart/mixed; boundary="===============8020072451173381270=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8020072451173381270==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR11MB278825F154A3B6A0FDB55E90FFD82BN7PR11MB2788namp_"

--_000_BN7PR11MB278825F154A3B6A0FDB55E90FFD82BN7PR11MB2788namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

apparmor.mk is using ${LIBAPPARMOR_VERSION} in the source URI instead of ${=
APPARMOR_VERSION} as it was previously

Is this an expected change or is it a copy/paste error?


# When updating the version here, please also update the libapparmor packag=
e
APPARMOR_VERSION_MAJOR =3D 3.1
APPARMOR_VERSION =3D $(APPARMOR_VERSION_MAJOR).7
APPARMOR_SOURCE =3D apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
APPARMOR_SITE =3D https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPA=
RMOR_VERSION)
APPARMOR_DL_SUBDIR =3D libapparmor

https://github.com/buildroot/buildroot/commit/5649202ddccdbc4d6e2a6aca8330c=
0846d9cd999
Any email and files/attachments transmitted with it are intended solely for=
 the use of the individual or entity to whom they are addressed. If this me=
ssage has been sent to you in error, you must not copy, distribute or discl=
ose of the information it contains. Please notify Entrust immediately and d=
elete the message from your system.


--_000_BN7PR11MB278825F154A3B6A0FDB55E90FFD82BN7PR11MB2788namp_
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
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">apparmor.mk is usin=
g ${LIBAPPARMOR_VERSION} in the source URI instead of ${APPARMOR_VERSION} a=
s it was previously<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Is this an expected=
 change or is it a copy/paste error?<br>
<br>
<br>
# When updating the version here, please also update the libapparmor packag=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">APPARMOR_VERSION_MA=
JOR =3D 3.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">APPARMOR_VERSION =
=3D $(APPARMOR_VERSION_MAJOR).7<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">APPARMOR_SOURCE =3D=
 apparmor-v$(LIBAPPARMOR_VERSION).tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">APPARMOR_SITE =3D <=
a href=3D"https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VER=
SION)">
https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)</a><=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">APPARMOR_DL_SUBDIR =
=3D libapparmor<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><a href=3D"https://=
github.com/buildroot/buildroot/commit/5649202ddccdbc4d6e2a6aca8330c0846d9cd=
999">https://github.com/buildroot/buildroot/commit/5649202ddccdbc4d6e2a6aca=
8330c0846d9cd999</a><o:p></o:p></span></p>
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

--_000_BN7PR11MB278825F154A3B6A0FDB55E90FFD82BN7PR11MB2788namp_--

--===============8020072451173381270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8020072451173381270==--
