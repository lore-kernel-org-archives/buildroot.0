Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1567C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 22:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F77860AD2;
	Sat,  6 Jan 2024 22:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F77860AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrMlMSGA09qX; Sat,  6 Jan 2024 22:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728ED60AE5;
	Sat,  6 Jan 2024 22:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 728ED60AE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 770EA1BF3C6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C21C83BBC
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 22:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C21C83BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWCmyYv0TelN for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 22:22:20 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F5F683BB3
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 22:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5F683BB3
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 406Kgedm002281; Sat, 6 Jan 2024 14:22:14 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vf6rp9813-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jan 2024 14:22:13 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 658004048E;
 Sat,  6 Jan 2024 22:22:13 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id D72D0A0085;
 Sat,  6 Jan 2024 22:22:12 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 47DB6401F2;
 Sat,  6 Jan 2024 22:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHy3rWuRdXmuzTUcWhGhIVJU3vHNrW2Nji1HnfLDDvWx3peDiYaIJIQbA65lKhySxveQJcMOcJ0ZxwsjABOjZMhWru6X8syw4buMyhw59sVKDxnH9gXbqQRvXGrTxtxk51RMvRR7xgT4Hb45Pf2q7rF7cqBIP4rXJ1ybFO+gEdK21nYxO64OueVzomlURHGn9OOQ0cvdURraiIbciim49MIrpt8N54/ilTInuQCRQTODFdPE52a2w//SNJW795bkU9t1NR2w9UYc1KQEJJH60gf6AcO+MeaFmGCVx0J1eYG6MD4ysX27G4+0Y/Qy9F9zLDlBZZFAHh6frRsq3UVybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLfZB8Roi8uhJYZ4EyjercZYXYuRk6RbF1ZyMXeXp6M=;
 b=Re6+bd/1vxjekuIpKyV93SXu0d70PYXUQxHDwB8tZktu53i7sDuthTz36gpf+j1m77l4s9+eVXZeWXa2EnyB34pTJfMrvz3Zdc4IR1piaAyc2UEIK6OrZSYWmgAm8fL76eoqih70LU++2hoHp6CtNPojFEfdro4wii0Fon3afM67H9LiVjDFRylaDOuy6dQtKBXKk6qNZLPfbJng18nrXt/AndjInnzJ547dNt4sexA0CqNVU9YMwihFExgxWy5pfI9vGHkk8UNCaBoZKF8779W+c2Q5S9Pidq5cuIQgOlwcyPVeVjngC2cNA1UmAgVBk9CYEQ7l5CtnNgOaX7rHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.20; Sat, 6 Jan 2024 22:22:05 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7159.018; Sat, 6 Jan 2024
 22:22:05 +0000
X-SNPS-Relay: synopsys.com
To: Waldemar Brodkorb <wbx@openadk.org>
Thread-Topic: [arc-buildroot] [PATCH 4/6] configs/qemu: add qemu_arc_defconfig
Thread-Index: AQHaPA6Az2NQvm3MdkGtCM4qoL8t/rDNXIve
Date: Sat, 6 Jan 2024 22:22:04 +0000
Message-ID: <DS7PR12MB90419FC093D4B4A820A5FCB4A1652@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-5-wbx@openadk.org>
In-Reply-To: <20231231172538.1279608-5-wbx@openadk.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|DM6PR12MB4076:EE_
x-ms-office365-filtering-correlation-id: 104cc3a4-f630-407a-53a1-08dc0f05e9bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hOu3qs+Ge3xTWT5U6yoM1+6IcOubavcqWhFWWjbIcX05RVapqjSWXRj0wjeIXqn1Om/00AbuHZaOt54rW7e6RVad8dhDB9ueAGdVAo+Z8tTSulUkQw/+PAGM6XYCE8/eIaehQddPup4Me6CfGI+8y0FPJMxRkA54Jgb7MW8H48P1JwQEBR60aeOuI2Ho3AOlcPzVqxqQKmDz5097StEPuG1Gh77rkxwfNMhcNw/W8fBbXS0F1yZC6hMuEalEhApEsfxAko/Fri3zBFqHP9/hxWmMklDFAKbhfooUAmiJVFmihb90KfyE6He/v5DUHmEMZyrD2/wKr7qVovEfDbSWcdvAot2DDsEndCD2B43H3QQUSGllzXmz8ArAnCzY+4+TaN1QrqyxBNkDgK7AuYpVMjiQjSwQJxxTMoJr49j+xCyYDp9KhdpxJa5dVLL2aUwNkh4PmRktq3Fe6hsSf2iPZbcePWvBgiWas+EIUZYAV+mixMfZminCsaN+8ffjjxira/BWH5O9bGBeQIqNgwb0WpU+4DQRF3Q/lWplKApwc5I+vu0V7DxzpzXGrN+itU3yH+GsEatbn6yBnSEL6r1pCDb3BmvwGfrtBLtAAo0y8csDt1TmFtU0FJiTm27jxmvV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39850400004)(136003)(346002)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(9686003)(26005)(7696005)(71200400001)(478600001)(6506007)(83380400001)(5660300002)(2906002)(41300700001)(66946007)(64756008)(66446008)(66476007)(66556008)(54906003)(76116006)(316002)(6916009)(91956017)(8676002)(8936002)(52536014)(4326008)(38070700009)(38100700002)(122000001)(33656002)(86362001)(66899024)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V40uLFsccrzz08GOS99IJfjuI03a/6dXQ2DKAt/SdQfxV8YieRKfLSB2WD?=
 =?iso-8859-1?Q?DaA6sVVuqHCs8NRTQQ94qh+9fmO6ks/SoGxGgY+xDsM3fTBruc1K5ltyGU?=
 =?iso-8859-1?Q?iymWBWffbYhU0k3NDEmuJvwu9HmTN8FUgdAetoeeV34pAMHTtNPKtxosp+?=
 =?iso-8859-1?Q?IDQjq4/nAxk/7A3j/z09ezC9ADJfi8QV7CE3p9hiuLBFsmyPxXlK8zDRCQ?=
 =?iso-8859-1?Q?CDrxjssyw50K7bFvsdLykuKQGSy4C5EwuyOfiTbl2z+rgqGrMILTHGarrN?=
 =?iso-8859-1?Q?1GzPJnTyNUmPmlkZ3G7qR5yYxJJZs/KBfsTBdhy5xY1LXqrS9y0VGoIVJ4?=
 =?iso-8859-1?Q?KeagUq8CSWZ0xwdNK75m+LNm2J1T0i6pz7xxR8BVLgeaBmoffkVvpnbhX5?=
 =?iso-8859-1?Q?IfUCI7q+Ks66hdOJwNgz8DJco48dIYlY0+t1jzOMZTwWntK4SBAVq272c+?=
 =?iso-8859-1?Q?NueYh9TqiNgQLXJrKDtBVkK1XWwv3++GGZXv80aeHse+ic8Lr166Du/aj5?=
 =?iso-8859-1?Q?rKf+uX+D69FuGdKYs03BjfB90TwW/ziO/gqixZCLCt5qI79yX9pDGHBWi6?=
 =?iso-8859-1?Q?z1K3Xiiav52iPQsMxqObe7ABxuAZiMOkCvuQH9behmNNtdq/QW4vZd7GGR?=
 =?iso-8859-1?Q?ppHhfGVaXp55DiNCInaaUlx6AWkmLv+k/VHBAHr1tcD4hgPeuiFSKuzvkg?=
 =?iso-8859-1?Q?tE6PJ+1tP+m1XWJRNQmrWzJ1QxGby4bdLvTMkwPRkovHx+b1Dv+tlH/IAj?=
 =?iso-8859-1?Q?Jv4+5TrEwcIHy0p6/4RGOC4kYZn07oRx5YhRAdYhME4HnZMzMWG/0IR0s1?=
 =?iso-8859-1?Q?0eov5fxTIiaStzTjtTI5yioCWSj7w7XByx8LReYgLIodtWtP0FsSvvNWq6?=
 =?iso-8859-1?Q?26aXvAg+5Cg55UskxJfduShhEkAQZX3K9SUD0A+ohszZ2eOmAwoZVpCgKs?=
 =?iso-8859-1?Q?FMgXXHgUhb1wtlf3OhiuRUSo2zUdzMjSqLFT0q+nyu2X2PxdGQEOz+hexz?=
 =?iso-8859-1?Q?zeBj0kusgc+aPawYg1Zbb5de9zQyISTYBumzsEiLtImENpUWMMWVL7hF9O?=
 =?iso-8859-1?Q?r0MK6UA0YciHGYoFjEVgG83T6Ze9NK8TRL0V5RLV2gv2geBtKsCmkStiNB?=
 =?iso-8859-1?Q?zAJ66w14YpQ5Xx9n2D4xMPCzrGc/4XWJVgnjQvh1chzHEjRorpXeL8IAVu?=
 =?iso-8859-1?Q?EYx/72Ci/4Cdt958iGzDbpXN9+JJ55RdCZZZWYCytFY2K36EZYFqlytYnf?=
 =?iso-8859-1?Q?l07BfHhPmNI+Cc55fKq8wiYsWjkDKyehUmYNTeMOYuJi8dA2GVL7kXk6XA?=
 =?iso-8859-1?Q?jDGhvpQq1gRci5bIiBHS/M8mzAz44UKbqllntW2SGdjbmgx/jWTjQzt4oP?=
 =?iso-8859-1?Q?o5IIxdGeOxyEzZXzoHM3991WmowFTc1bA5iOZmpyEAkb8sMP36vulmiwEk?=
 =?iso-8859-1?Q?/RKGVS7o0uxD+1bpYkjCzzN/UVkmOUGqqhqCwZaqSBALcmpROc9euG1XeI?=
 =?iso-8859-1?Q?Y67v9yvEUkel5jRSs0/lm3ORLOZAQxU+DES0XqkPk+twCPCJtGRboejjsP?=
 =?iso-8859-1?Q?x+qfyC0n78zHLqpCkoxwdADRd/pCJMRM/gyyQ88T6TaG1apNp6/Phtaf9X?=
 =?iso-8859-1?Q?yiy1URbRwpDZFI80OriyfS4zDfsAgP0i1B?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pEh+HOmlBD7JiVmFvFLtfgHJEuJlyZvUTmQLtIT9UtxpqXlded6PDCJX7/u7TsnOBQK/Wij6n9hq39P2AG5lvAAXgjHMWWfBCUn3LbeeTMsaTgbQ8ZVWYt3YYuNlziZE17VRbMdHWSl06nV5Un4T07TNx80WwpdZoNi+ms2ZinjEF4yT9ladlDyigcHLfhI8Fw0YANQ5p3PERrO0Xs4cI2paBU0i/3yZPmHRk1Fwi3LvaIM9rLVtmjfv8fNPOnrAXuxkJEPj4pooPIjbjRtfrXtgA1l2jwlPSWkc/S1MD5ombxgkClgRQh+C0zQC1fLDayX6ghJ+XjRi3P/S+Fbovc/Vf+an4BZjJ8/6xr5oVi/chpex5GvZYPV30cDYtLfDW1rU2zUVdUrCoXvJeLO/Z1z6p7Xo1I0rFGnNkv5ufXl+fvxhxMwljUUeLtvmFxQRLlpbpbKJCfQ1AtX//1JXtJeNVBXxwiitKM/1dZx/WpycuJ7eyr7ldnQXTfv4vcwgQZuukWlGu1DloaxoFLwpV70xvQDGXZrCxu5eJKYxs420X0ua0CslJfC/a4X34xUFKMwnnZWJ/0R+CjuWuEOx+KcbMtzzS2kKiVfm23a44b7QwkBvBrDBnWg+hu9BZqJY36s0HJWHyu3L7AVb0EruRg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104cc3a4-f630-407a-53a1-08dc0f05e9bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2024 22:22:04.9772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQowcg4ayvrQh2U1Kx8qn9TfeRHL66pHYsPDauPKWsl9Sgc6zItIQweLBJn6P0jvFkkMhaRGyhcZgEeW/VLeeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076
X-Proofpoint-ORIG-GUID: GPw2x6tDLtw44TA1J3C5AHTxsPDRZ8UX
X-Proofpoint-GUID: GPw2x6tDLtw44TA1J3C5AHTxsPDRZ8UX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401060144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=sLfZB8Roi8uhJYZ4EyjercZYXYuRk6RbF1ZyMXeXp6M=; b=
 jBYvn+O7agPETop/W39bKW9hRe9QrLxoy/IjAx6EHZk6p6fKFAy2Cock0bUvQVbK
 oJs35E0uZH36XvcURFwtyQG6C++Z+kvdCvQw58mAcTbjvyAKmDCc3S6Lbz74+/hn
 hVK61M2ZENrMpludWvFjmEEEpG9w8i12DVJ/j5p12NlDBfQ/DTR9dkAxC7FVWsMZ
 gw7YLzBIQBQQH9Pq6/CFpLhkHzh4o5Jx1+EVe9GyHu1iougjYCMcumP2kXxoD6de
 DXOeYkR9QsruEAAYGyhaVF/vzoy2i/j/UpOPhyrAAJbQshJHy7xC9pgMRLbRbm1v
 MItcv4c/IXnorHY+l7VBnA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704579733; bh=gXmHd+2JL2yWGnVFptcUGzdy+Uk/0+IQTR14r0biJQU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UIUhsIdpMg5xwNT5XABPF3pHN/fFLcmFmJWwoo+QMvMDCAcSg7RIiIOSGdz4b4fle
 yWOs1FgwM/KhJ6bAGQu0TCl5bDhgkXwmPyetLNZTtdoqAmD0qHB8wFeosOVivKmGq4
 bjVmO9rg6LTagkbJqSjs1C4KdzrGiQY1ShyUyLrbn0y5I9XpF0G0V10l7HQPSMOioO
 2Izaqsw6g3cYHKATqslLb2jBBXNDrRQ25kNYk3E4lQMvmLzgIdtRgGVXaX3AZrFBhQ
 aIWQTN8n0RshzfDQId4p51J3cnkln/2R67BtgtjrbTjh8Hm5AsWRzP1wgnXj2xOGZZ
 KESUaYbouuvkQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLfZB8Roi8uhJYZ4EyjercZYXYuRk6RbF1ZyMXeXp6M=;
 b=aNga84kwOPjomsWU1LVNQ8nZM9yuiSPBin7dwx4paVkiDaxtweD+1AxgnBmNRce93rUDMc+nkSgGynR8wqe2aTCy3BnuJ9ca85YBM/20CEFWxgKvQFCCU7uG5P7IgOCK0xC/OHLr5niNxuReiadv0TRZ/Ln8iq2Pe5Yi2o/c2qY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=jBYvn+O7; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=UIUhsIdp; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=aNga84kw
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=aNga84kw; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 4/6] configs/qemu: add
 qemu_arc_defconfig
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

So that's another good trigger from your side ;)

>  board/qemu/arc/linux.config | 32 ++++++++++++++++++++++++++++++++
>  board/qemu/arc/readme.txt   |  8 ++++++++
>  configs/qemu_arc_defconfig  | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 board/qemu/arc/linux.config
>  create mode 100644 board/qemu/arc/readme.txt
>  create mode 100644 configs/qemu_arc_defconfig

As a matter of fact, we may do it much simpler as most of the things are
already in place. We just need to switch HAPS defconfig to a UP kernel,
enable DHCP on eth0:
----------------->8--------------
diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index 02e020bb47..c2ec480806 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -6,6 +6,7 @@ BR2_archs38=y
 BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_SYSTEM_DHCP="eth0"

 # Linux headers same as kernel, a 5.16 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
@@ -14,5 +15,5 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
-BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
+BR2_LINUX_KERNEL_DEFCONFIG="haps_hs"
 BR2_LINUX_KERNEL_VMLINUX=y
----------------->8--------------

and voila!
----------------->8--------------
qemu-system-arc -M virt,ram_start=0x80000000 -cpu archs -m 2G -display none -nographic -monitor none -kernel output/images/vmlinux -netdev user,id=net0 -device virtio-net-device,netdev=net0 -device virtio-rng-pci

Linux version 5.16.0 (abrodkin@us01arcgnu3) (arc-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11-520-g38ba3bd175-dirty) 13.1.1 20230516, GNU ld (GNU Binutils) 2.40.90.20230703) #2 PREEMPT Sat Jan 6 14:15:43 PST 2024
Memory @ 80000000 [1024M]
Memory @ 100000000 [1024M] Not used
OF: fdt: Machine model: snps,zebu_hs
earlycon: uart8250 at MMIO32 0xf0000000 (options '115200n8')
printk: bootconsole [uart8250] enabled
archs-intc      : 16 priority levels (default 1) FIRQ (not used)

IDENTITY        : ARCVER [0x54] ARCNUM [0x0] CHIPID [0xffff]
processor [0]   : HS38 R3.10a (ARCv2 ISA)
Timers          : Timer0 Timer1
ISA Extn        : atomic ll64 unalign mpy[opt 9] div_rem
MMU [v4]        : 8k PAGE, 2M Super Page (not used) , swalk 2 lvl, JTLB 1024 (256x4), uDTLB 8, uITLB 4, PAE40 (not used)
I-Cache         : 64K, 4way/set, 64B Line, VIPT aliasing
D-Cache         : 64K, 2way/set, 64B Line, PIPT
Peripherals     : 0xc0000000
Vector Table    : 0x80000000
FPU             : SP DP

...

Freeing unused kernel image (initmem) memory: 1296K
This architecture does not have kernel memory protection.
Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=/
    TERM=linux
Saving 2048 bits of non-creditable seed for next boot
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Starting network: udhcpc: started, v1.36.1
udhcpc: broadcasting discover
udhcpc: broadcasting select for 10.0.2.15, server 10.0.2.2
udhcpc: lease of 10.0.2.15 obtained from 10.0.2.2, lease time 86400
deleting routers
adding dns 10.0.2.3
OK

Welcome to the HAPS Development Platform
zebu_hs login: root
# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global eth0
       valid_lft forever preferred_lft forever
# ping 10.0.2.2
PING 10.0.2.2 (10.0.2.2): 56 data bytes
64 bytes from 10.0.2.2: seq=0 ttl=255 time=1.046 ms
64 bytes from 10.0.2.2: seq=1 ttl=255 time=0.068 ms
64 bytes from 10.0.2.2: seq=2 ttl=255 time=0.040 ms
----------------->8--------------

Let me send yet another substitution for another patch of yours, sorry ;)

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
