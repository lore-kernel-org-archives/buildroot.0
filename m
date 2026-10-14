Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3004ECC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 06:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 984336081A;
	Wed, 14 Oct 2026 06:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16qPxmCC_Au5; Wed, 14 Oct 2026 06:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C0DFC60808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791959241;
	b=BsdOluya7xyUG7twwr9wvKvfGzgMmrc8uGnvuJ5n6EkKYwukAH6W3Nh8s9EdaMqlf4zP
	 HGDbllGwHHdHDySuhuI+DibAWDYCSGJsYXqVaNtQ9A2gKLvBkAgBL2SUB5s8E64H4tnGH
	 OKnwn9pjsOXd71F0B6tClxbybv6OOvkvGsTaQuvRg+jRtPzfFB+TLJLDUOw1bLbjEBBpC
	 XBjQpWP9P3TyXv1ZtdbbpNtnJChkYO99s6Xs9Gjsr1tO+dVRgbaJRmsTlqdmEzoWzBJwB
	 JVfE8vscGriYgio6mhSUJhD/bhX4TP+RS9PEWXQnZm0+M1a0OgGT7Y2qRnmLotsDUug==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791959241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:CC:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xYZ6Bg9R5djvf7aR9yngbufKi7x7t2WUjyAZUG9y/DA=;
	b=bPhAFvrqdGtXBLq5JI+rbNK0VHWtTgvUu85s+yfpQG0FesfgP0QE+wvPYfLxvIQjGNqY
	 eHe1YZ30MLU1JDfysWcWqDzF+pB6EXNhDc4znxdNsn5Gqo/xOyUytkhUksZo8cQUZ3P9X
	 5MRX7p13O4mvrZ95cQivIKl3gYw+F76uFOh3tZdQK+VqabMC5z6L57kQRzpqMFbWoyFed
	 Xk7nxzdlz5Jqw5gjnY2ovOfbtb1m53Yevohxaytsaxu55O7EolCQ/47t0dt0I2lS7n7/g
	 NqIbPUfEdJ0uW+umRVhcGl0TmzoG5LVz80SuWhTy/EghtsYrBSRdDv2Vt9iXBaAjCUw==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791959241;
	bh=xYZ6Bg9R5djvf7aR9yngbufKi7x7t2WUjyAZUG9y/DA=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BE+GjeD+fGbLqT7QY+RlJhl2YUl1lowdX2V4VM1oWHDguNDcWRfQq7pk5BWa7BzvG
	 hYSmw/RfNfvLEMdMigC2vrYuY8kJGBzcd1gqeImZ0C5b8Q2nWUkpSHxjervivMlTqi
	 A2hntx3cPs5HvvUEVZxth2f0o2H0G/of+b2pB/0ko7K6/C9dGYFptJXhum7NqOHnhz
	 EzsGo46lFrCWIgz5iW7gc4GxV8eOEK+9ORzGX7EfwhywmNUrf8JaUfk9laRGAYk2hq
	 /ssiXFqYCl6SvPek2shg0SqBzbaf33WBdBCnqcDkAcbpA9rr2RKJAJJb1l/5byNQtw
	 G99A+d5RSfMhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DFC60808;
	Wed, 14 Oct 2026 06:27:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E91CA255
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 06:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DACBA40666
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 06:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SvmrKnYR4Es for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 06:27:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CDCC4065F
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791959239;
 b=YOny5qOhVbsz+6UWaeleEoLm7xld47WQVvsz3+5KnFL0Fcb9/7cGT8v7/cj1QE0AKchB
 xhVUGZQCSDtCqwMvMIQGherkLvzr1A+40icedPEKpgqCAxSBahy3q4G1iHfZ2eb6HMMQV
 HNHOTXV/YWEm6PW75+HPr4DaaBaQhvfaxdx5pRaQ2IcWbNKTywxD4Tf6Qkc1/Q7iZvQbq
 gMoHG5FiiPV/L3eKzgMEnU6b21ts2Z0niJWtzvJ4hn8i+W20mjAT3k7VhBXwSxySkwRel
 4QDjNRMldaByyaL7r1gLemd7HdV+VlhI7zUI9qy/8t0a9+oawU3CCkPCeV3kOfJTb0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791959239;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
 x-ms-exchange-antispam-relay:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=EzP1/J14TiWO8zEdLX1cSaJUtU5MU5Pfvf4ix9q55ys=;
 b=YWGoGvKVyPg0xSszyPJfWbG8omV5O+6TGBYpiy7aTE6bL+RTbTrzI/WbW93iCoB2dP9o
 NhCuYjb3Iy9huyI5XLMBG1tSELqEmFBnoIHX71MkCijxnGT2vNcfPM1TH6NtQPtbpgH/C
 fHvZa5KBMCx5AKTg9sBFTx4wc7mYYo5ew44DDcJR6gKWkYzlZYGYr3Au8xLrJ0awQEI2t
 vn/3D6F/W9ZGPNHUQygQid1fiJnQNRh9/kq3ml079PRnxCipjDS8iQgIm+WSql50wJacW
 1XM+qJWFDW/NSOHI0nrF7UAyRYi4NfiUec4Sc1Ob4MkurDXFzpwXMA+Ii3RjqVy+Ocg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=amd.com;
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Qx0AyVjJ; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c10d::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CDCC4065F
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 06:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcJRJKZ4xV2tTR13WCYSF/6JkhsYqvOSWY/W6eKdxrW3ey8dCI2lY5xCqCSUakZ+oFivGKM7O8EiWtIGI+mDEWZvWMkdSSH7CJ6shs6jOV4HWMRcQt85ZBtC13BBB+ooKVFw8qwqDSQZzgyEAc+jVssT0U7ZOd8klhAKRSaXta1HgBS4A9efzscUX6PYmY8NzyCCNW1xoYIXWzvQdaAxFAM3aoCFxh30KiyTee1DvPQipfMdC9tBbHX84TZrDJzWl4WPnCcsoqTkdOgY3+KcnCBVVLrojVLr5xicWllmvZz3PQLm1QYGScP1qO81tKR7AZAYfvmn/AOm9V8SVYI29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzP1/J14TiWO8zEdLX1cSaJUtU5MU5Pfvf4ix9q55ys=;
 b=Aox+9uPWWYHnyn/qdkIrDDcTWUEMIb3vBTLkfKLUK2g46cJEQQYMQN5E9vYty3ESxg/dxLVaoJdQHx0ciNPkVe3IPcqli3/6wAJHrHwY6WyqgPLNcxpScuaHyCUVRTojZlut8eEdZFF2CInYOS60HrZcEA+8nwJ/lAwF77yWG+nf+zppLSg+QwJnt8U9q24b7YCqbRiWuEsvGDcQg8U89YQaaelh+XAeWwOerbF6pMnasWIUT9tzCsVOs3YCdFcFcH1IM2OH/MvVRD77EJQIJWD9c9kSf10+XgnYKBVXjpphozMi6W7mzV+yfBBeolbLqdkht8MYSoxRHTLPC5mS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Wed, 14 Oct 2026 06:27:11 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 06:27:11 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "joseph@anodize.com"
 <joseph@anodize.com>, "ramin.moussavi@yacoub.de" <ramin.moussavi@yacoub.de>,
 "thesamprice@gmail.com" <thesamprice@gmail.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "arnout@rnout.be" <arnout@rnout.be>, "lordrasmus@gmail.com"
 <lordrasmus@gmail.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "Simek, Michal" <michal.simek@amd.com>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
Thread-Index: AQHdOo/JyztJoKd3BkiNgChDw90O7Lb3gm6AgACAQ6CAACEjgIAEsM9Q
Date: Wed, 14 Oct 2026 06:27:11 +0000
Message-ID: <BL1PR12MB5032A78423288B24AB58EF2FF09D2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260902040121.1583600-1-neal.frager@amd.com>
 <asqptBFqe5itH4RQ@windsurf>
 <BL1PR12MB5032C1DBCFDE52533D8A1BE2F0902@BL1PR12MB5032.namprd12.prod.outlook.com>
 <assxFoQCpRtNjAkx@windsurf>
In-Reply-To: <assxFoQCpRtNjAkx@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-14T06:26:00.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|DM4PR12MB6661:EE_
x-ms-office365-filtering-correlation-id: 69c15fe5-43bc-45af-5a4e-08df29bc2de6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|23010399003|1800799024|366016|18002099003|10067099003|22082099003|38070700021|11063799006|4143699003|56012099006|41080700001;
x-microsoft-antispam-message-info: AVmgv4LTWi6aQqM0WFDm//vLyx7j/xW/1Mp2bGaBiE6HxGzRt2IXWIqPRh9wMeVkgkrJCUrUnNvnrgoovdDBBjszKV0DBI14rOEJt7NTSNSv+Imr2teKvwiTANI15DcThrU/2n1nyUXUMgfZToM9p94iGVlBD4TvjeW30u9TNIQUKtOa4TuelkK5Vx9Z+y08qU6snLEd9zRSooHm0yC74BrYJVApdaWJPSMZGTz8I/3NlOiBnmcjhKTm/KFRWKtA8O2R1pcJuS10xQzujYAT5/rz7L6VaSd8mByYa3CvaXHVtCvbh1xnaZSZ0Co0CjtkGjBQSVpN6/IREEb4EFdbBsykgTeMJ/vjFe1f1C0AdxjiARckRcQzCPedXwX2G96s0tfF8vDpPD6V5wiUgoP4Zk+QuymC0Xy2Rcl1SA+3o+WKBqJ0fye7nbHl9PYUH4rxGpH/uepoFd0qp/svka9z+K40g1fnVmavoG3XjJlJOuhj31EVVygFsHa2xnE14Zthslbu0P2xLrj4WtX95j/tmMAmeu1gtWtHRJ0TZdglXUMrSjk8A7PZzJMYJvmG4cvOtIZzrYR5+etngmdUKcmOjIt5eHa+CV1eN8mWsbTe4Tz6F+jqdCBuqwJ5G/YyLbFhEywjFasZOCiqgotiLdl7BAju7msytnMDnGKAW2XwWsB9QpsHiZ1UubXcqpu5eZ3pLFM9jNR50cSsYl/8ETD/0eQLrgHLiJzkYAp3VQ4ek19Gd9NFQ8oSCNBViSgV1kkA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(18002099003)(10067099003)(22082099003)(38070700021)(11063799006)(4143699003)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SCF0D1pD+DZHTe6HglSN5zkFr9N0V8nR7cGrb0x5dphwi6TRgxI/7esdN0Fd?=
 =?us-ascii?Q?Chv/Yyrjdq9d1Akf3AFb2oIAw7AbGOu7R7x8Hg9IS9AjCx2BfBruImUj1Pfi?=
 =?us-ascii?Q?GpOg/NPj2DX1Hm7Upsh+mDS2k9SxKnadJpbZz/p+6DlNrwpYvkP47W9Lhaiq?=
 =?us-ascii?Q?5a/Suu+Ihiuy499IUP0a4fEqsIw2LjA+SABdYHmyABqGcLAbwpqHZhZuAMbw?=
 =?us-ascii?Q?cdOBnwsda20QVyvbt5ywsYCJu64NoDHqfBMqu/uPtTU80U2A7GW6UHZP0lnL?=
 =?us-ascii?Q?qDz7qaUU9zf7StTJgtmuIXUkFISlhhvNBa9NiVmO1L6V3aXxetalb10VcKkn?=
 =?us-ascii?Q?4wGhnvp5gvc9E9RkELcg+8rYzIuKHAYtLVBYHiXO65VxCbk+l+hLaN/8SS2L?=
 =?us-ascii?Q?j36H2y8A99JdTZtXDCuhIw46XoF+Hx5MeT8gO/Wnco96o/aWHVHmDIaT/njD?=
 =?us-ascii?Q?oyt3WHqcDi0eBZ4wo6y7K06RCw2ZCd+/Vt7MPOqJE4msMjruP058d4QKpAh7?=
 =?us-ascii?Q?g1Fb7jUj4bpj2iQJD4mSKBRuY17F8u+D+cy5kNh1oSE2oFXvS2PxscVowWi8?=
 =?us-ascii?Q?HGlyyC6JcU53FTgEbMk8wXf50QdB4UpIR/9a+5lH3nsJTFrPpp3lDdeRWY+h?=
 =?us-ascii?Q?l/3sOhCi0dIWqmJYnPlNjvfqz0B5GbjvkKRPFNTSyJs2oZF2z+5YwStsDvvq?=
 =?us-ascii?Q?N8tlWruPYHSAwujAc4AL+1Z0XFoRy2myFWpgBENL/blJPn8n6oUYL0deoEEd?=
 =?us-ascii?Q?en1efPe873ETSNt0RyCftT7oe+FYEXzSGX9xnIEcT0GV6Qq0sx0/R+Ig/8Ry?=
 =?us-ascii?Q?v5w9qTJ+pQ54HOF2vay3qpzkOiQ71ph8m0zrmJCVxTt4QcfFgtxfwC0ZYT7S?=
 =?us-ascii?Q?MdY3HDr7kGHWcT3QqZ/eaUhiMxt61i6wNlb9tVrCEPZvfeblvl2IoP208Brw?=
 =?us-ascii?Q?a5ImMe2hZY4wnuyBT974htrHC9xHhyVB0Ex4E9/U5Sl1C58iI9WkJYWYxsBe?=
 =?us-ascii?Q?8jS/QCy9WSje/ZnveIu6MIbvnTK9d+qvJowpVFn23wW2unTPk1tYH56FKqvw?=
 =?us-ascii?Q?JnGRgWtOGfRonH737w2YBbgyNh45n6fi5VeG7TpoDnN6e1E2VggFWNn3PnnS?=
 =?us-ascii?Q?PSpB+Bf7OTmhZBofEikWLGlx72sELaI/8awVIl2nybHZAr6qHjOGPlDTEFzU?=
 =?us-ascii?Q?Vty4BsA9MI+eDtfWTNQQlg2mSo6JxNDjzB9hbs8JX08ZnVQzYMC0Hq5/aMFJ?=
 =?us-ascii?Q?x8gkJspK82PBfn4q+a1kQFli04aobWPdi8zs14AMVHmd8olZPrCld9PRRNEg?=
 =?us-ascii?Q?epvdwYqagimd+k+wiJxymCoeBSLyAP4AEU0IS5CboMU9i6asyqK/6Ighsr1d?=
 =?us-ascii?Q?X1FZ2RjQlLbYg/Gn/jphHvS4PZskmcSBaZtUw44CBySJhf+30qs4wuUkXkY0?=
 =?us-ascii?Q?9GEOXjJggkNXobPjw3QvOerS1EKMnhjVI04f91Xze1WTukwhYcVi2Nj5R5OM?=
 =?us-ascii?Q?BFd3JVbdJFIrl56mH0KnQAGCjBFJ8+/7dZB9Unun9/ez463tUby9NnROvLFa?=
 =?us-ascii?Q?nnhN2V0qYpZtxR1z+JobZY9EknPyfYPmSQM2/E/4biJ79z7ZZxaPt2OHuPGF?=
 =?us-ascii?Q?QphO0Jg7pki+6O1PFbHkHHliAvuUQ9tl1MUwa3eczjafwsvc21izCNHTX6yW?=
 =?us-ascii?Q?xQv+Olx227Bv79yyo/NVcWu9l13s/DLflXBxjIySzf0QUCDS?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c15fe5-43bc-45af-5a4e-08df29bc2de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 06:27:11.0323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDPLvVeRtVRawBF36qwmRrBc5oSH4rZVp+GW2ORkF9kGUP84WbgHP5Jz6apPcDx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Thomas,

> > Applied to master, thanks. What about gcc 14.x? The issue didn't exist?
>
> I believe gcc 14.x needs this patch too. I just never tested gcc 14.x.

> So, will you send a patch for GCC 14.x ? :-)

I am testing the patch with GCC 14.4.0 now.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
