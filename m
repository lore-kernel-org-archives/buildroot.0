Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E551AC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 18:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B59881E86;
	Tue, 28 Nov 2023 18:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B59881E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsXfwZGMtBoW; Tue, 28 Nov 2023 18:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8EB81F1D;
	Tue, 28 Nov 2023 18:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8EB81F1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 733DD1BF419
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 18:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57D246109A
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 18:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D246109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sybv_n1AEYZZ for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 18:04:09 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3523661099
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 18:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3523661099
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASFwEBN014581; Tue, 28 Nov 2023 18:04:06 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3un2nks450-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 18:04:06 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph009rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3ASI43YI032516
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 18:04:04 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3ASI3x5F014214
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Nov 2023 18:04:03 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 28 Nov
 2023 13:04:03 -0500
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 28 Nov
 2023 13:04:03 -0500
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Tue, 28 Nov 2023 13:04:03 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB0966.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.36; Tue, 28 Nov
 2023 18:04:01 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9321:c5a1:ca0e:86c0]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9321:c5a1:ca0e:86c0%3]) with mapi id 15.20.7002.035; Tue, 28 Nov 2023
 18:04:01 +0000
To: Herve Codina <herve.codina@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [External] Re: [PATCH 1/1] ppd-merge: speed up per-package-rsync
Thread-Index: AQHaIYLsV8AJIpANYk65UyS8zIN2bbCP4eAAgAAYU2CAAAqvAIAAAhaA
Date: Tue, 28 Nov 2023 18:04:01 +0000
Message-ID: <BN0P110MB16736A42500E585C1E07017FEBBCA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20231127224139.35969-1-brandon.maier@collins.com>
 <20231128164920.75ac695e@bootlin.com>
 <BN0P110MB1673DA4D93BA42393EF18D4BEBBCA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <20231128185438.79867282@bootlin.com>
In-Reply-To: <20231128185438.79867282@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB0966:EE_
x-ms-office365-filtering-correlation-id: 4f8c4302-d8d1-467e-7c31-08dbf03c669d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mFc64oevKCw67NwQM4USJrPnD1s2C5beG7RwZ69KcW8EiaWoV+FnnmmXUCvcOJszqGE8jtm3a0wHhfPIHWfoVN1cD3Cqa9WzXF3vLQgmFPSbS1CP6EBIsB9iRv96wO1uQfFcc2B6B4RrQYmVUfXvZXbrilrnhfOjLKyJVy+LBhTg0gs7OPuKsEx8rzM6fgidqWnUMg3G1FeXr+rV2621qjg8kdb27W/f8m4TE1ELp48nLSITv6l9MoT+cdlmn2/Z2TY1yaQh8U8/c9wL0kJmZcrA2qZQdylDYLeKX8Jbsz6JM143gZigVs8I8AAZr0+a1THZeJZ/yZR7pm/lHFliw89/Bat5ZnvZ6lw87EY7bvskTpCasQJNnv7JCzCFPh6SF3R/oYmOM49iJHg7WTpaqNcv7eA1/KYH8r5BANnuu5ulRDmo2l4SP4UxIAjd0UCOOjYUVN7FCd/vb5MwBKKd5yxmnZdHpFz3Qle0gRql97/Gk3/d01BzNGkWzOiZWUflogriLn/Jgaz0hmokv0AxBzEh3WsvByCZ1b98DKKSziIIwPq9iqg6JwVJLZsvcIICQWOMZ81bx9yQZSNuH0+wmxEXchjqq+mEomrpn8f+Yohvc4xk4vccWH/wTXKovYroKxul8TE9UORo0HOpdgOLPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(1800799012)(186009)(451199024)(38070700009)(55016003)(5660300002)(33656002)(122000001)(2906002)(26005)(86362001)(38100700002)(9686003)(6506007)(82960400001)(7696005)(71200400001)(19627235002)(498600001)(966005)(66476007)(66556008)(66946007)(66446008)(8676002)(76116006)(4326008)(110136005)(8936002)(52536014)(64756008)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEJ3Tnlqc2lOb2QvcCtYOUUvb3RiWVFuTE9jSjV2Tm95YkJGTktGQjFMUHBl?=
 =?utf-8?B?OG9LY0s1dFk3RmNKcnJ5YkN3Y0hEZTFCWTlUM2lVNGR6NXo1OXg4eUhZbTA1?=
 =?utf-8?B?R0srTzZZZjArb2tyQ1BIeU9Eci9rMkdkb1JsM3BkbTRmQU0vT0VRdVBmWFBY?=
 =?utf-8?B?b08zTlBoTFh0ZUwweGg3dzV5a2VZdWRzRFRhWG10YWlCZEhFVnRiM093WXFZ?=
 =?utf-8?B?M2hYOUUva3BMRkppYmJYUnVHekMyZndGTlFkbW9zTDhzKzI4RENIdzlpL01H?=
 =?utf-8?B?clhtSmhselBsUSt3MlpiS3NYUCtXUGllY21sVDV1N0xGUEQxNmFkM0pTVHZ0?=
 =?utf-8?B?MUZrZlJ3UFJ3T0hQeS9hYUgzdkNoSm9oQlY0S05XQkpUeXhOdGVtRGdLZ25n?=
 =?utf-8?B?NDRsMm5kREhBeE9kVitwU1FqTllvTnBTYTJER2FvVTZWVEJPYzlTNENVZDRw?=
 =?utf-8?B?aUF3c0luNWlTblZERit0QjQvYXVLUnFtLzFtV0pHUk10U3F1WmJ4REdSbkZy?=
 =?utf-8?B?amVhV3dOVzA1aWQrZDBaTk1tWi9acnJFUmpnTHRnVW9GRHVHa0trdEJzZnRN?=
 =?utf-8?B?SjA3SGJUeUNwSCswZ2hjN3cyZDBpOFNhaUxOd3MxVGxEb2cxemNnWVVoaWVa?=
 =?utf-8?B?aGJMc1ExQWJEenFiSk1qc2M3RWpCeVhaS0lkeGdvUTQ0V3RRcktUVVJUOGt2?=
 =?utf-8?B?Ny9WZXdGZWEzdCt3RWhnenJxTm44WW1JdHh3Nm1TUWVGM1piaDk0UXYvUVph?=
 =?utf-8?B?R0VFTkkycHFhN3RhcGk3WE16WW0wQ3pxQVlrZ1U0cmZRanVIL0djZmJtQm14?=
 =?utf-8?B?aDRkNDhFTzRudUtyVXo0ZnRreVUxVkY5Y2pUQklrZkgwVVAydGY2Q1Z3c01S?=
 =?utf-8?B?UGxXRjdDUHJBSWw3QTA0MXdvcDJnUFpnWmd1Nm85UGZkM29GQTRMZXBKVGla?=
 =?utf-8?B?dVFaZUorcFo3S1pGRkxaZi9LTWhFcjkwTTUvRHlwbjJSNGdIMFRSTmd4bDZ0?=
 =?utf-8?B?VitIK2pkM0haSlUzOTF3LzBybVM0QkRyaGNhVzRVME5yZnNGTVhGOFVQQmxo?=
 =?utf-8?B?a3FKUms1ZWlSVXlNaE1HaEJWNFd5bi9la3dmRm1XckU3SEZTU0V1TDBjWjhJ?=
 =?utf-8?B?SkVnNTV5TnlseDBONW5pUW5lbzlwWndzYUY0bDBrT0VBYk9zOVJsVmg0SC9t?=
 =?utf-8?B?Q2hycE1QbG9DTEQ1anBEbkF5NkQwQXBvYmJCOUcxckQvWFdGQStqSjRXZXRH?=
 =?utf-8?B?NWJ6OU1LUHgxY1M4WG1YMWsrWXd6MHhrOHlndXkydXFvNXEveXg5MFZkd2c5?=
 =?utf-8?B?Wk5WVzZtYitIcTJ1NGRHa284Z1JyMjNScmNqYno1R2loWjFIY25uWmczWG9o?=
 =?utf-8?B?azU5UHFwR0lBaUNCdXZIYWx1bG9JUFlQdmxJUytRLzdLdGhreUdBRXhld1l3?=
 =?utf-8?B?SkVLaUxabkdLZkRLLytBd0FTMGxaUG45NldjMEM0aTk4NVpUTzlDaFV3cnEx?=
 =?utf-8?B?VlNWYTAxRlBJaVpPK3FleWQ0dk1xZUk0WWg1RzJjaWp3WHBaeG10SDZTeXcr?=
 =?utf-8?B?T0NKdk5KeXZHakJweVpiV2Z3TzVhbFcrcU9JU2hhTkhhdVFIYkFydUtFemx6?=
 =?utf-8?B?MDYvcGw1ZE5wYVd5TUd3RkpqaGNvU3liNUNzUEhaMU4vN003bkhrZ1hrVjI5?=
 =?utf-8?B?NlRVaXF5WG1vNS9EdWhQR2lXT1BpbUd4clVudklBTjNuL0JjQngyVmxaVkRP?=
 =?utf-8?B?NFkwMEI3MUo2S1hoVStZdWtSSm9jUWN0SWpIZVJJU0xOQmNzRTAySlJhQ3hI?=
 =?utf-8?B?TnlLMktxWjMzVGcyZnNwelhSVU05aDArYkxUTStKdGRSZHVsV2xoYmp4VXNW?=
 =?utf-8?B?SVg3WmRIeUZIMVdtS2djd3I4THdUYit6VFFkdkVSM2IvWW9RTTlrL0FRZHNz?=
 =?utf-8?B?RnZ4T2VtelV1ZHJqckxoVkpBazBJU2VabHRTdXVVelRQWi9lbHZtSjM3a2dS?=
 =?utf-8?B?VlRIaVRnYm5aVFNVbFdORVVXTHl5U0dJZlM1bk1PdVA4dWtPLzZmV0R4YnBT?=
 =?utf-8?Q?A+Du9c?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=TWfNzDnPAVp273FXz3SMFo0I7bciVUYUH0J/ZAJOeD6IHRj4dLHQ0SYYNASt9zxP+YgGs8+4IltCTB6W3q0tFXyN6sM2os2S74YKLZhzRG+v9UeSRYFbmVeWjn6zcE5PwM8PgIZnA1cPM5QUVOwwkeSxoTMtXt8LUyUhaO6FfZMDzd0sxCseHekRiuTBIOjye8G2QfS4wdeqeRjh6j1cxRmi4fVhHKgNEM3xw10Ut3Z/waQBbZcefPM3nCIoBFMZnwXu42AvfRD1nnwI3bogb9Gf6Bq4gKZjp4JmpiWFi61uiJNJ4n6sk3u55IdrE4O7nQx66Cx/vjOP5f1qAtrHLA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0XktWhmH/gsUbQ9/fs5cpNGKqRCiIEoq8pmKH0IPgU=;
 b=IjHjkGFGYZe9Gnk50ACVnoHwW5TOqH/xbiNH1EySDcJwSY65bXdICdJbnsoVvx8/qceubX53wXPo0f2aJVH5wx8dwojasp6AWKm8TAqu+8fGIrSlH3o7uJ/WQd0BR1G62wgCGC5VMevc78LL+OqNM/v3id6fEcszv4+iZ7qqdKjdYSL9vuPeOZdCL6fhPa0TbYdIaJFiwgNlsgARkMFpc3Y/6vTqTUp/SPuoZURrhPpENuWhlp5FCuXygo825/tAqqQNUDf/DMMoQT9j56rElX/yCUtTD9yyQ5dSXKqUQFzggAYpedlkmHUTqyRIAVEPFgAFC3lOjjg+j9/whygdVQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: mTtckUATFF/QaSx/8pNTyHLLsYCK1qy0Gfnh1A1l2uAvmL3NjMKA3Ga9uDLqlQ0V7W6Z2qPfvw3rOZqzupSivy+aglp9zmu1kYpxpDekAA6WkiL05OictS0FNSzxI6pFfpEPQYIjVw21roFykVkeBDcw0xjYgkMoiDLfAPFop6DKL5r7p45wLLNT3/uzxggqVw2YxWmEmv7aJ6PmrD4XLVSX5Vd4pU5HRXGA4w/l27Br/WkmqXGkO4QEiuGcB+Arru1g6wfpA/db0wF+WO3tYG5cSftIgcMyNTiXnPG7JFLmBpS2Bse9snRQYf6brCgndFC6wruKVS0YumxnqNave6MA/7vP1EEWGGNK8ZkRJ4sQ+hi7qJPzHd7xDfnNJ2gdfQ9f0RFLaNFSNZLu7chyl+2QeWv1q9+2ijhLDKKP1PJUdeh1i00lEAWla3XXpZm4WW1C6ehcaLQPQ37OCXJATZ7gVg24GIV0npsMyGlGQpNRm0HnDnsBAADfjsfWcMYuRb1G640AKk8ck7hRtXKJJYcakxKuXE0MWIG+1S3eLH9Pg2JaglJA3aRIp/7v+/o+WJysWI2edY7rf3J6IWjw/2FA89puvSHIVHqDEdtxsmzzfZdkcbjBlJ5LwsW7c0uaQgLDgJFcFAaP8ElYV73GJaqYWuK7oZpxM4fznQhoObqs/h7j8G0pgubdk0PA3W52SIMcISeLVLEZ+Vh9HTMkjtlSev2COBnDfZdGi7eAh6iO2Y79EPbvYZH5cpJ2qoTSHUSAybqmNpG1/GJ9cTyokaWnPWa+qYOrDtl/2ovLLQ8jaHpWYL+CrgycSgjIdIv2
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 4f8c4302-d8d1-467e-7c31-08dbf03c669d
x-ms-exchange-crosstenant-originalarrivaltime: 28 Nov 2023 18:04:01.2788 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB0966
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_20,2023-11-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_20,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=789
 suspectscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280144
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=780
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280144
X-Proofpoint-GUID: JFA9EIDlWorDDIeXMzOhTPTN0IYcHXnK
X-Proofpoint-ORIG-GUID: JFA9EIDlWorDDIeXMzOhTPTN0IYcHXnK
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=862 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=n+WNw/JEBBiBFPmM8fazMBdhUOc3tS0MtcN4Faa2Z2o=;
 b=py0dglFiE1xO/NBDesiNZUKPViSppTQC4ONJx/mHDQdt9t18Z6Xf1RYX63IFUXsHaMGG
 49KMKlYkSUEKxjJNVSGW47yMtNCqWsH6rBXbqcz6baBgmqmoU5u7pYLVJ1s7MpO3nWPt
 vasP72mO2y2KCoPY2/fuPfIH4ltVSRq8W/ZzFh3az+J4LWqhxcAg66WpIz9TfRKpo3aT
 YxK5hAOlPfOZ/N08EsBsG6gXplx6q9W44s6tdDVsDZ7rMH3pnMiitBf+Rfe2hVu1p6zy
 uSll2e9mlPS8hnvgZr0kWNI7R5OCwYL5hBP1YYRKu/L5vScgdDkjKA2mvb1NVcdimmig iw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0XktWhmH/gsUbQ9/fs5cpNGKqRCiIEoq8pmKH0IPgU=;
 b=kE4lPClFRid/B9xCEw8e+ShvfG8ZksKjsY/uuSq36/bL/fvBH/4x6jYr64fiN+cLN7JHBYpAhksCZIraZJNXlDFi+pzfvNWwjgZMsIEo2caulg9QatKotpgPIv0MxS5rS3LJQPGhcKFNo3HBPOOSJY2CZCVcjQH+kKrBMAxmkD4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=py0dglFi; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=kE4lPClF
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] ppd-merge: speed up
 per-package-rsync
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSGVydmUsIFlhbm4NCg0KPiBbLi4uXQ0KPiA+ID4gPiArICAgUEVSX1BBQ0tBR0VfRElSPSQo
UEVSX1BBQ0tBR0VfRElSKSBcDQo+ID4gPiA+ICsgICAgICAgICAgICQoVE9QRElSKS9zdXBwb3J0
L3NjcmlwdHMvcHBkLW1lcmdlLnNoIFwNCj4gPiA+ID4gKyAgICAgICAgICAgJCgyKSAkKDMpICQo
NCkgJCgxKQ0KPiA+ID4NCj4gPiA+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHBhc3NpbmcgdGhl
IFBFUl9QQUNLQUdFX0RJUiBieSBwYXJhbWV0ZXINCj4gPiA+IGluc3RlYWQgb2YNCj4gPiA+IG1p
eGluZyBlbnZpcm9ubWVudCB2YWx1ZXMgYW5kIHBhcmFtZXRlcnMgPw0KPiA+DQo+ID4gSSB3YXMg
dHJ5aW5nIHRvIGNvcHkgdGhlIHN0eWxlIG9mIHN1cHBvcnQvc2NyaXB0cy9maXgtcnBhdGgsIHdo
aWNoIHRha2VzDQo+IFBFUl9QQUNLQUdFX0RJUiBmcm9tIHRoZSBlbnZpcm9ubWVudC4gRm9yIGV4
YW1wbGUsIHNlZSAuL01ha2VmaWxlDQo+ICJwcmVwYXJlLXNkazoiIHRhcmdldC4NCj4gPg0KPg0K
PiBNYWtlcyBzZW5zZS4NCj4gT24gdGhlIG90aGVyIGhhbmQsIHN1cHBvcnQvc2NyaXB0cy9jaGVj
ay1ob3N0LXJwYXRoIHRha2VzDQo+IFBFUl9QQUNLQUdFX0RJUiBmcm9tIHBhcmFtZXRlcnMuDQo+
ICAgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tDQo+IC9ibG9iL21hc3Rlci9wYWNrYWdlL3BrZy0NCj4gZ2VuZXJp
Yy5taz9yZWZfdHlwZT1oZWFkcypMNjJfXztJdyEhTXZXRSFFX3VZdzFuMURfcmRjbFNiaDJEV0V0
WHANCj4ga09SNnBlVFJXR3B2ak5pVEZ5dlN6XzBQRkEtDQo+IHpENHVjMXhYb3FRbDBUNENwX3dq
SjZPNmtZSGtPcUhvVVJYN2ViUkEkDQo+DQo+IEkgaGF2ZSBubyBvcGluaW9uIGFib3V0IHdoYXQg
aXMgdGhlIGJlc3QgdG8gZG8uDQo+IE1heWJlIFlhbm4gPw0KDQpBbmQgb29wcywgSSBtaXNzZWQg
Y2hlY2staG9zdC1ycGF0aCA6KS4gSXQncyBhIHRyaXZpYWwgY2hhbmdlIHNvIEkgY2FuIHNlbmQg
YSB2MiB3aXRoIHRoYXQgaWYgaXQncyBwcmVmZXJyZWQuDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBI
ZXJ2w6kNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
