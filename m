Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B17C25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 16:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA47405DF;
	Thu, 23 May 2024 16:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSB3_3fejeKo; Thu, 23 May 2024 16:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B3B3405B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3B3405B5;
	Thu, 23 May 2024 16:41:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 187041C5B85
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 16:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04B0740544
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 16:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GU1KTYTzoNGM for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 16:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D3824013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D3824013B
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D3824013B
 for <buildroot@buildroot.org>; Thu, 23 May 2024 16:41:03 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44NFFSbF017088; Thu, 23 May 2024 16:40:58 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y9sxsr68j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2024 16:40:58 +0000
Received: from xusxph004rp010.corp.ray.com ([128.13.120.224])
 by xusxph004rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44NGeuMJ010428
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 May 2024 16:40:56 GMT
Received: from UUSALE2G.utcmail.com (uusale2g.utcmail.com [10.220.63.42])
 by xusxph004rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44NGeomn004098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 May 2024 16:40:56 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2G.utcmail.com
 (10.220.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 May
 2024 12:40:55 -0400
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 May
 2024 12:40:55 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.149)
 by UUSALE2B.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 23 May 2024 12:40:55 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB2260.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 16:40:54 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7587.037; Thu, 23 May 2024
 16:40:54 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMFowE2uXfIQUOGHsknX9Ab6bGk+wUAgAAKYJA=
Date: Thu, 23 May 2024 16:40:54 +0000
Message-ID: <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB2260:EE_
x-ms-office365-filtering-correlation-id: eee9fabf-0a83-452c-239f-08dc7b471d44
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?2Ny0pQuO0Rsrq5/JXdTPuGGqBeSdfg/7jbzljcjP+grfQhVf9UOqMP/8BuAu?=
 =?us-ascii?Q?9vx6xcG4FXh6doFhjDUcU9WRtexuU0ofEZOfYxEpaIes0oljhocmsfmkjeaU?=
 =?us-ascii?Q?VECAZYbDHfmurU9KakVA+NDO4MiQb54HT+VDen6EsLcfmY+FaSuzQ8wg0OjJ?=
 =?us-ascii?Q?M6EwpKVHJWpG8WBdMIwcAOeyeVJX7tlXgnugVuPpIYdxAw7icwAyVsCnDEXu?=
 =?us-ascii?Q?XvncIuFDzrqM4djLgKxOURWRSBMHsuQuMoscc0TrH2Y/RuPTtxqodEHpsW5r?=
 =?us-ascii?Q?6VsQ7K8iAi6rqUQGiaGwc4duzjs5taxWqbR4KZN3TuI7yyBCh5RcoQv54sFT?=
 =?us-ascii?Q?5MjQjQ0rL/WlE7eoBG4pFpxhB+VYNf3eej+LmnTF9HWV4cVASHfDVqkdv4u9?=
 =?us-ascii?Q?t2n6PiwsGiWkmK3tSi3zqIVldW0Ct07ElMNENZTESnuQJyUhxR9wlBxN58mo?=
 =?us-ascii?Q?om186ETH0ZeaLQ/6/dFe1Au5AMiXj3Qc8K0HsJqYA+JUgzo8WpmQ9CoJnsFs?=
 =?us-ascii?Q?hutKfMZAGHpRBKTWIca+iUrIijXOT18F3EkwQvZS7xzSN4mdtaq/LtVbQ8F/?=
 =?us-ascii?Q?mZ5aUTSOFjhzcgBakKUCVmNPsbmyfDs+/sl2JclxUJ7Q13ua75IsX3SU9ctV?=
 =?us-ascii?Q?1zIWcTN45R6bWJL37omm2ZbRY808IwDpj9ZsGHRg07d2+0jXMJHJeK5NIktc?=
 =?us-ascii?Q?x1zP3RcAmKgFZR7UfFVTEvoFkspGQWNi43YRhBlPsWE9EV71p5M8XgEl4c5A?=
 =?us-ascii?Q?CMFBJHj3vXfaphUcCxedvsbJWSvlX788wpYAK1cO1kJg4AQ/MV5eGfpyRUQZ?=
 =?us-ascii?Q?ehL+0Azvr4sf3X4M1V08V1FfRGiIXgSC7zBPZi6bC7ZK0iACMMGAt7pSAY3c?=
 =?us-ascii?Q?uonSygdkhgSBJkNh2MkT6W9nEsAQcTMMfXUrEz4hZHAM7ANuWO34Id1t75At?=
 =?us-ascii?Q?smdKM/jPeUxylSNVYwnPjQUnz0XX0XeiuhcHUAZEulko8RESODF5uGVlxRA9?=
 =?us-ascii?Q?28Muz8plafA4yqkKzulw07UYBFc+UfMsrnT8s2uPDbBe06PlSLIYIEEmYHhK?=
 =?us-ascii?Q?W85Ytpud42pbpGpOYtFXqc9KffMCyYypfCZ2KBnRizF67swqfwuRFG4K9gXo?=
 =?us-ascii?Q?DECAW6D48/Bcqtt5w05nr2cK+1Iav9aUhnPoASQIP9RDcNlLB3rp8ICQepl2?=
 =?us-ascii?Q?d2xIZl5gfQeV7Y+O7/7QDzgg2L6awif2eQwXoGTcAG3tn4TfslXRm1i3p1H5?=
 =?us-ascii?Q?SHjpbOc93Di8qvMMMpCiefn44W403b053UV3rCRSGg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ICFfcWOufu9Fs2eoP9zD9LaZn93HkCYaolZx207w56cid4zzHh0yfFimo9Vj?=
 =?us-ascii?Q?IVLPil65Qf6Cn2AF+RsERsfBKn1jz6ab5EWMa5V1REE3GTvXZ0Xh7bSXGCpC?=
 =?us-ascii?Q?CLUTzXlnqhNF/ZVz7GKTVE9qb7CH/JPNmsFQArSgLRXv8/osC7Q3jujuPaeZ?=
 =?us-ascii?Q?iuMs2miKveALX6gOVw7AmFg7Nvdu0klWLGzId88tCAWEnJ5l2m3gh5+OcmQv?=
 =?us-ascii?Q?75H1/wUDhPX1IBOGhNMMx29kX/abzjB4nAEDx5JxlferETK45aAC6sGmuMFD?=
 =?us-ascii?Q?nFrdsUSb6q++mgL5SQ1cigsH4q4FXV1vmfTBYaJuC1rkIm0eIob3hYqIw0XL?=
 =?us-ascii?Q?vebky3lj8W6rIL84utZDM3sjjZ1D6ZuqTAWwNyMhLYetIL4/DKfXLA8XKInM?=
 =?us-ascii?Q?LztdMT0oASNdq0h/qtr73cMRzE15UxCmCSn6qQA2N0jqES2wl6JHvBPyTwD+?=
 =?us-ascii?Q?NV9ZMugzXDQ0IQyiA9qn68LIYwMth47TwgVJ4Zz1+dvFjLgETDPX4kXsRNUs?=
 =?us-ascii?Q?cT31CFzaDK04sZ+VtexL5za7m4U0Oz63iL18BNZ/nHkG78vsAknjzCDKdrEP?=
 =?us-ascii?Q?25Skco1PaI3No1U/KdWLRIFwz1Z2rg1VkiC6fyq5XLlbTxGgy8kdsBg82DjL?=
 =?us-ascii?Q?5zMG6PQuUF2/9DX1rJy0z2yg8xsu+4JtlM0K8GnsCh18iX/WTvprzxCs5gfq?=
 =?us-ascii?Q?HisqaWQZ0CfwUz58oFuT3yfWRZZBG/3jmeMtwslJoX2SyG8WTwlo8ygQJ/zc?=
 =?us-ascii?Q?KQUaruYCHjN6ZixY4rHtv0JZdIjEiSovx/koMnSCs7m7uP859IozqMQRO1JN?=
 =?us-ascii?Q?GAx603964dnPoanoo5ue/S7lja8pCft/tioD2x6VZfI0Z+PA7N2lGLWdtpQj?=
 =?us-ascii?Q?9XNHUBppvMvWkaQUEnSrna/H5A+GppwC7O+hNP2xLux+gdZUkhja/1N2cyne?=
 =?us-ascii?Q?i8LtejQkH9zchH7rzYpjY/WyWJN4C9U0UAywyE+iWFV03VHyOPSHuu4Un0f1?=
 =?us-ascii?Q?x+0sqPQ2dwFNApO6VkKALm1h+38Q2TXP4VabGP0/UDUTJvdpDqItTD9NR/4h?=
 =?us-ascii?Q?VKOHFhqV2cnm7AC9EVbxzoLKOZ/3IbWRprgbG8Sh1G0TDvjUUUWnfKCdjZXD?=
 =?us-ascii?Q?tUCPYHsfELX62GGBYjNL6amp4gQN6BSUCJpivWMs0/6WLM/QQgph4XdqF2P1?=
 =?us-ascii?Q?2oagKPJOLx4im6SObm/gX1vl9PJd+p6oYgs4DswcQnOwS1qAB4gpxbLEjbnW?=
 =?us-ascii?Q?cjQujKtgqFCiUn9kJEoYSEirw7k0Segbh2jFcGE1s2epKCT+SySAjjPQw+m6?=
 =?us-ascii?Q?kzkiZPYeCEICdSp5f6pOEWUyB5k6vpEuwksTB7/glhZLnu4/B9qt4ZAcOn02?=
 =?us-ascii?Q?smDER2gY4tn8eUx+C1aMYbu+0f9s4qo3BuQGI1mR3mMDVCDpk0G97mS0DDDG?=
 =?us-ascii?Q?INjLF5laX04cwzH4RMWwQodpvhYNKNDr8CA5O5VnKaelQ6o6OLXYILLNF9MT?=
 =?us-ascii?Q?IcWubFDz3+Z76DU=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=U6yttTnVR8KyLW7FBuEWvXoyM64J3weAE31n4Z94rQEPtNN5+vlJLdjaYyNTK3Qc63Miubc+r4ip2Qtm6yZ0IufmDMth9DIoM3fcbW7w2KmQEZzjrJVVDAm9b1vnnifLgZzYvjadsWVO9SD0ud3tJsAOEiBBvCp3FPuBcPuXdyzB0W1rYhFnf7jT5X1rLcD4oooQ2vbr9hPCAaNWDA8+KMR9Blj0VOdoCFA4TyyGpMXnTJaUSdAKaiH5qQjfbRjfHyHdILsFx5hY2aDVMNp9aHluJREK2wviAptwQznTHfDQdeSp8xg4Oy+9WcyS+YRcpS9XMVd4b/wo3N8C5Vz7vA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu6cDtony0R+RyhWDiuZcOs2CLIT94t+jhGE8qRCNhg=;
 b=IGgeBnCSPM0wS3PzqFCdT3rnAfi9Q/kqhYXNe9B3hy25+brsPLlRE+4UfJObL+VrmlX2F6iVjSc5rQVg/PUJAUFWizVq89xH/s4ZzgX/1hEscjAS6I7/Ci2q2OpiBkEsjPClW8L7cu4OjdSKzxqquCRSQbDwQDjnSgYsXOK8lMDtrEElU/e70lUOkoS9vp+XtGeYzA2K8EnHjqiWfp3bXsRqOaK65o8nN+Tmz9SKEV8L7HxwtH6ODJg3XzGe62LgXdffWndf2Zrwt+43Czji515LB42X6aCTR+fKdDArKLpuepeGr4oIkpPIY74ImX8y/+JWf4J7B/K3cSe5AP562g==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: GRDb/6Z1e59hdVWcfbh/4yjfIqx1fNqiAA0u/moTw5ZTI+wHdQLsckXsNxJggmuphCQNxG0PdvPJPceRpgDz3pClMJIgEwY5yGrVvf8Z/XWg2Jpf3tfzhdU2Qxbkvqdan2wcamoPjsnGTgPMG132UrJYBVWfxLacDfdm3UEelTXZaqhw7AQUS+xXlEn9mSFfIR0kjsMPHWkh09Oal6EuAaoJLwW2zrADzvqAeIYXNuPbdVfEVlY+02rjl7Omc3on9zq7CgXKrQF85+hJFY51fNi2Bcpz3MRLElP/+ugf08Ei7UKfN8nagL68BvMtkiFN4utGrZYgBRWcQwnqTsYKCAETkn0DASGJVKBCSPj1mFGl3dAvYxs/UwpCB1792wcT7eOKCa0DBMpXum6TRr3fSRDTA1DDcp8/iTCD5ZQc5wS5L5AyIu8riyA4Fh6rv8Uz3pqbCHfl9gJXzopE5KIk3ogGoyFjbI2aPErCUa4OjTup+FnF0/diRKq5xki1ASpw/WZI7uRmO15trHVPLTPNbWtNwUVo8e/N4FUSSdOCho7hqubtUxzoNni+LZfDGl17opd1BkcpA4NjEqr0daD3U4GM6XtRFCvld1qc4MeYrM3g/gmghU0Up7N/TToc2a2g
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: eee9fabf-0a83-452c-239f-08dc7b471d44
x-ms-exchange-crosstenant-originalarrivaltime: 23 May 2024 16:40:54.3383 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB2260
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_09,2024-05-23_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_09,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=599 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405230115
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=660 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230115
X-Proofpoint-GUID: HpTL8oAXObGs2X5ySH1qq_Df7lLBqauu
X-Proofpoint-ORIG-GUID: HpTL8oAXObGs2X5ySH1qq_Df7lLBqauu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_09,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 mlxlogscore=671 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405230115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=JxoOqJkrh5YnOyvkZARPjuVQ5N9mqyhxR/t39w7XueY=;
 b=OPzB7gsIqXJtL5Tk5JFLVPDgy3QlXUxaLLbjsZGo0iDl3MvmC6Y3Sz2fO8vnLDa8w+aW
 h+y3h7kkvCDq8T+SBqrqYcEweZuuXih5/DU2pRfEmG2Ck3cstxKaziEDurR0Xo4MAS7V
 tZ+LCHes3Ilc6aCVQa9VJZuJAAzHFUWONZK5RqVsjvypNKSd4Xlmfq1LyabQ/3I6yFyi
 NS4zFB1H8Bnn9QMTzYZTf69/mV8zUdSn8BslSbDGDBf4dO8zrv7zukNLGO05AlBBbuQq
 KGQHmb77wltXo3kgHpH2ErAmEEloH0Qb/uFdcKvdvyGSifclgAB4r+anK16bHG4loXRj Xg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu6cDtony0R+RyhWDiuZcOs2CLIT94t+jhGE8qRCNhg=;
 b=tNc4Oc9CJm05zKJzaQjp/46KS90QMO/eIk4gDfqXnt4WKM2XdSn+XxpnnaOllCdwo20R3+ZScTs3kRO50RKXAcjelx1VIGyWQo7tfVLT5ZbtENr9BH+Yh0F7tXD6uQDI0LlVhbMJx2U98QD48uXez8f/NojmbjGx9EUb7obpQ50=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=OPzB7gsI; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=tNc4Oc9C
Subject: Re: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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

Hello Neal,

> My only concern is that this patch conflicts with the following patch set which is still waiting for additional review.  The patch set below changes the versal-firmware package from one that downloads pre-built binaries to a version which builds the binaries from source.  If the patch set below gets applied first, then the hash for the versal-firmware-xilinx_v2023.2.tar.gz
file will be wrong.
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=397588
>
> Could we apply this patch set first, and then go through and add all the correct hashes for the zynq, zynqmp and versal defconfigs?

I'm for that approach, I will decline this patch. Please CC me when the zynqmp-firmware series is applied, and I will spin hashes for the Xilinx boards.

Thanks,
Brandon


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
