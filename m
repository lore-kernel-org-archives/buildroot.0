Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF72DC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 18:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5196083D0A;
	Fri,  5 Jan 2024 18:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5196083D0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ser8iVdl4MlM; Fri,  5 Jan 2024 18:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BEC83CDF;
	Fri,  5 Jan 2024 18:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BEC83CDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCC181BF389
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8086A4227D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8086A4227D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fwif0kHcwlJ for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 18:09:36 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF7924227B
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 18:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF7924227B
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405H14Sr030367; Fri, 5 Jan 2024 10:09:20 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ve95x3gkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 10:09:19 -0800 (PST)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 698C2401C2;
 Fri,  5 Jan 2024 18:09:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A3556A00A1;
 Fri,  5 Jan 2024 18:09:16 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E4549401F6;
 Fri,  5 Jan 2024 18:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+Ev5+iM8RZwEaNhwRAcXT2Io/XMoJTcV++K0jTKKrmAUTlLbI7DPyCFp0w2PdM1O/qzeRzh60LwHMD+c2/msuk0Xpq2KE7VXCRSqjmiZChIp1bstAb26lTYhZ3+glNZ62UhJBC8VQFI5tgxkzcmdguGiBtyl4aQWqm/Vjbtltg+kqYAoQz+m0s6T46yn+FBMCZ+0FGaXkKrZpATtXG7NiIQGob3wfS/fh+RwLybIMt3Cq5iqwKcq/RWM7h4TrV4U5X7Kazb9V5ixBBthHNGhj0x2u9vhEF0Az90ZxyC/nu2OjWI8xsJOT+okCdHD+c4K3MBj6L+EiA+D7ZM+pIPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZQlwuWoz+qIDuJDiE269URw6Hp2txPTtEEH4Rbp0zg=;
 b=i7MUHuBAVF8KL+aZdMSE79XnP4pO0sZLRTsTI347QWf4ELbUsAf1I9CnAxnB3dENsSydKP4oxzbaGgH9sgmDQV0RGQgnMLukfBWIx/bcaR8CNdzdb7eMtCBh0o8QtHQExk4/r0VPxFjyQz/WNlmMn19X1j1CVRx2remX0lHaEV3TRo4wQZNwL0fATYoC9NOoGDVmSmlT0aiiRh8030atAymKdYL547t49LDY7GzSxxWSL0n9mJ+oR0z4xGAeqqdu8toxe4bzaINWCYQRT3iMiJ8rlVkPoToygl+OLtRzGRN+cNprVYhxrIH9Ssj9FNiX87y2rWmO5bUyVVsoOY+ovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 18:09:10 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 18:09:10 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] ARC: Switch toolchain components to
 arc-2023.09-release
Thread-Index: AQHaPzE45H5VI6Kdk0euUvxDXyvey7DK59uAgACd7ug=
Date: Fri, 5 Jan 2024 18:09:09 +0000
Message-ID: <DS7PR12MB904101CE6E4D80699790708EA1662@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240104171224.1469776-1-abrodkin@synopsys.com>
 <20240105094231.318fd50f@windsurf>
In-Reply-To: <20240105094231.318fd50f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|IA1PR12MB8286:EE_
x-ms-office365-filtering-correlation-id: a93bedb0-b8a6-4d5b-8079-08dc0e196a1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNjjx7gNozOiC2MaduYqmlJHRI3P5kg7ZYkNOPCP5asOCkO9nPzB+KF0k1rMamBqylSGzcXOEdEUK1A0eM+YIFjJVFiGFYrkCyoQ1b3cAUJPt8mxeo3UYp2NWAZcC+OwW6P6YuitFX1mqxNfELynZUhCFdW5d808vxGvK8yL8IDve9XvPDEMTnvFntA1HVH87/YAl7z1PSwIcfKJxd2n0ZlNpXtgX9fRnvqmI5QBxlRDDx+gOzjp0qPHHmdqWJlp1U+aDB3a3cBGqzozTvugLnvJ6luMVDe1q49hElK+Om5baIu+bIfIxx66c5T1iiHm1QR4WzKyF0TaBKK2jFm1/xvbDZOxvpl/2PWlz3kRJn98q8OAbsiEesDbOAoXBh/sK7Caxn7ER6xglUBy5EmjHL/aVWouLoNBDdiWqpMPQVeK4fGB62H66aVsSm0mH65y5o+Seva9pO3Cze6QQdm2/YcpXp62U5ag26xa8Rr1m6uxXQV7AiFnAH8R7shXRuxzzdB0zNG6Gtxp7EcQmegMykpMgE+njJuo+v7p6etfVkj6TVgYY+oGu/el3YATE2QZOECHXOMlVFSRB1r9XSIB7smO92Owajijqck+O5yOH8eJ350n7fDvvKhjx3V4izMs8oLg1xu72IwDGIgNQtC6+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(966005)(8936002)(64756008)(478600001)(316002)(4326008)(8676002)(6916009)(91956017)(66446008)(66946007)(66556008)(76116006)(54906003)(66476007)(9686003)(6506007)(71200400001)(52536014)(26005)(7696005)(2906002)(41300700001)(33656002)(5660300002)(38070700009)(122000001)(38100700002)(86362001)(55016003)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0kZe1dmtQLck4rP/wir333sCL7NcWlqbc1XJTYD67rZFisTGiz8P+952NI?=
 =?iso-8859-1?Q?AEvvtSWUtFjS+FIPb6AquRo1/106tc5A92ZFivK87Kx71WGrIBRriV985v?=
 =?iso-8859-1?Q?zXxzPtB1ndsS2tX54ORLoYyAblrNEmPQ2gKAe06GhnoGkcCoUQGrWQeUWZ?=
 =?iso-8859-1?Q?DdwpIxdjVysFOIdL0vOQQV2BmJ5PYUQERUCmHrY8KKYgysSb5qcOSNISjd?=
 =?iso-8859-1?Q?qxcvCy8WoZON2G1GgBAFJT869lb9OxX4nD5NAsdr5FN0T0ISjq9xuknMkM?=
 =?iso-8859-1?Q?oCNdWmN2K1NhHF06gXzQpqESst8tthEprXySZ+QJOy2Oiwivlguz1/PEym?=
 =?iso-8859-1?Q?biAUWjzZBC8WG9fqxMVdKMRZY0SVkN1w/CeZbmJOO8W5RCftcdByxqDWWh?=
 =?iso-8859-1?Q?52akwf4UBhzdY2yL9hRvOxByZbqGmJseLSC7CvgAdafWU7pTcUp04TvD11?=
 =?iso-8859-1?Q?bws85y5LwJmhMFdTTycLs4LWJmWPjMJW03mr6HB0TI5IXY3xYVT96pFuj/?=
 =?iso-8859-1?Q?+pCkVCrWlD2pBMKjYoDy51RHrR9H/zEQldmmQ9d1Mkyz0Kcwya4STOBFUt?=
 =?iso-8859-1?Q?qXwhuKqJyiPK5U/WW0BaEMg0B5o+39XO+4foEws2HEUP0pNltUGA5EF++z?=
 =?iso-8859-1?Q?VqUAXMDaciQ67G2/G6SB8cbY1AwpI1FdjGQJRo9yilbMa8Y6u9rzqJH0F3?=
 =?iso-8859-1?Q?vtpBxO7WeBJx0wrBGXyRqwWuFWyQcd4jSbZ3z7FEG0ntyhPGx5ckyDvNSi?=
 =?iso-8859-1?Q?eMV6JgDF+sz/jFMgCE3g/c9XuCmQGXdq+Ow40XMwhewOtUDt3Jo/7+3sHX?=
 =?iso-8859-1?Q?FDQB0oX6FCDfaFAGZbAlLcN0J5cMy72y5a+ZzjE43obLSRH3JgxavlFTVP?=
 =?iso-8859-1?Q?4Jlf/UzGYijhoZKA8TTAEoLvf8vQDXeyE+dcJBU1q1xVknBgm6hnG0JbBX?=
 =?iso-8859-1?Q?f6t4o0tf+E9XM5A54ACvmKF2jhmsetchB7flfAnsY9NREtUTjRRRl6kbeU?=
 =?iso-8859-1?Q?mfWs5mc22X2z9kndws9S71frP1ArFtly5KWmywoGc7iJ4SVNuGeCe2JPzA?=
 =?iso-8859-1?Q?JSoXY6xH7XElJnh2Bemy/b3NQAGCq7R/RnTrGiGYE4aVaiclg1QJwxV14B?=
 =?iso-8859-1?Q?k0xuhX+Nj0s8aT7SDIL/Cp7cmBjlW1QJQmFaExL4WkTJT9qLhDbTEqF/aZ?=
 =?iso-8859-1?Q?DLiiaEkcMSwX/M3+UceGMg+AluUM8sqvujyLvGBnCc4hHO/11I3jOm2Uq5?=
 =?iso-8859-1?Q?DGcuyz4acmgdjohG4lnRuuB0k8DtJAjfe8HGVE337hc07ZmhsWhFjUQ532?=
 =?iso-8859-1?Q?OT7BML0nzSLgqJ0pJLT8Nbd7jPjNKlqXK6YW0uescJ1WYZd3R+Z/3QASNV?=
 =?iso-8859-1?Q?dd9iQk9ZPwzDmc/+MVcrJDcRD5Hm56NIyLrIY6bSNrJ0bETrhwjO3s4SNx?=
 =?iso-8859-1?Q?nyFRPGfQe4WCyUidc15rXkck5MktX/DiYwKfLNU9au7DI9YGlrAKdR43p7?=
 =?iso-8859-1?Q?ZJpa+yW91cQLzxjRJtjcRmO/YNvysy2OD9guSpFem8uKjvo5/N3cwZMAIR?=
 =?iso-8859-1?Q?jZkxO2zy4673VwxF7SMfhHdDRT6YJ7cOfmAbrnAhTSXlSyIArbKgFCjAAF?=
 =?iso-8859-1?Q?6zEsL+plSxRfjUQoth6DlsNjC2Y1U+hhug?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cNoRCtpqn0uFdVlcG7Z4KDV0c7qWItWz7Nli0XgsN5agSIkClxuxubnYDB6psknH78J4Fd7CRWiyd7Uurm4qhJq5U3gMT/plWgJ09WhSVOZnlB/v0oHAsgHJB9Npfym//gN8O3tmvk58D61F13+X3Sh0cR4OgvdaXcJ/JmdJ5D5SG9EX0CCFdClIxvIh0C8zpRtTllu7Xf5NgrZRCr266ncXSWuw795pRpA4HV9Tuigubx2dQIbcmC2ylLe1Xk0nRsoZ4WOHb/VgeNFQOkrlvqxfVPM4lmRQQ10ZoieM1wRHMyO8eWT38Boq2KATd/cVXvRKMrB+7NiLJ42CBCo07s9z+1HiYyk5yRSISkhSEbSrP3s3lnK0izbV+lfTyVhqHe9y8c+duY6NZ9nKE4f18SfgcOaPDbe1zaSPv8cXJoJWXR+yjmHNNL0pzDP2bjXIj72sPGOFxQznYweJhQ+zWYy5/W96T74XId2E/FWbL63Zk8qgLsbfihpn/MsCp0U7gDMcLokG5JqsRjJuSBvUJS4PjfYTk9Nu2LkP0fIKgUbh1nWUarHfodEaNnoiKMsjz6Ja+Dsbu4FKpGd43ehG5b5nrEeKNm2m27yfLGYGUa91/m4DUcBFTgqlnbqDsgfNycEaUBMHSFsCZQ0Aq1iSaQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93bedb0-b8a6-4d5b-8079-08dc0e196a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 18:09:09.6501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GuABK2cUpvRRCabUeSM4cszloR1I+b1k0JyfxlD3lD9aJcwN1R2jd9zJa+KuVm3dAZTiMc08CYw0quVIvXHNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
X-Proofpoint-GUID: s2HpMm4cXhK6AC88fdqyGWorfkCA31w_
X-Proofpoint-ORIG-GUID: s2HpMm4cXhK6AC88fdqyGWorfkCA31w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=706 mlxscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401050149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=2ZQlwuWoz+qIDuJDiE269URw6Hp2txPTtEEH4Rbp0zg=; b=
 Zeth8pAh8x5n1U1zfGssgYrwfx0duZuhwVZ+c8EcE0yZrK4We3mhV6FUoy2zhbRQ
 YEOD2NPE8lOJY1/LiDNTFZPMXJnvIjoaISGqfcM3co4uZajiaYOzxQ5Pdkcs+Sd6
 ycLhDvA7m/mF+uZ5o61N0CmkSur9kQWcURGrSzFGJiX904vRBylWAHWctFe6lxhz
 lo7q1uSgKW92xj5epdMW2jwwHkxDflxjnelH0LcEMIS4u2o3EZSBrM9fg2DUbUyU
 UrbXkA1pCDWDoCZehZl4a1T5K3HJtCKTfhzhiclvWsuLcNTMwEyorx9pajEOMzBW
 Iz4vaoTRhZ8SqCGDFqP+Bw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704478158; bh=eTWw07NLppTb4qRhw/iiFnpITm2HOxRIG0Nk9JQDkaY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ccmruLLWsnKmCaVvDbUvy4x3fyH6sKdXg2fZHQqorAovvz/oBhlL7xjmx8mXhfu6j
 pMC26KECtPYxgvw8OAOtB1IrP6ISWe4g2hpO10KXzMDawHeqR4tMvUXB+ugs4520k0
 fOfh/5inZ26JnPscT0GCafvLGxByqUhGrtJb/cpmqUTIzIiQCEUt/dsUwZPM0/cKvp
 7EIJAPKr0/V2c7ohJOmIuw80cqoWRyFukPnLdld3bxyjzhWK1h9k+8IYdzu6Jm8DCI
 Wp0aZrI2yuy7rjQmQ7+06BZcveZmvMaR2vluCS3hwHloaTpMRo/PVvBXUqdxPa75V7
 nZlNlMSUApHDw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZQlwuWoz+qIDuJDiE269URw6Hp2txPTtEEH4Rbp0zg=;
 b=oL0a41rd06K6LTrg1og/oOXOr0EVuPBtL19jhh5l7Ee33VLlDd8oLZqOfN+G0oSEJRoOnRtkyrUa0dGCXRRY3eX+NsKy0TCCFT9AujOKl2Boqapqfqsbo3ZDc3cb9E+LmqLky9RaqKugR1K5oNFjACt6AUO6OZZB6MN5ETQjKBI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=Zeth8pAh; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=ccmruLLW; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=oL0a41rd
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=oL0a41rd; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH] ARC: Switch toolchain components to
 arc-2023.09-release
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
Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Alexey Brodkin via buildroot <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> On Thu,  4 Jan 2024 09:12:24 -0800
> Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:
> 
> >  .../0001-poison-system-directories.patch      | 310 ------------------
> 
> You removed this patch without re-adding it for the new ARC toolchain
> version. When reviewing it, I thought: "but in fact, the other system
> directory poisoning patches in binutils are useless, because we are now
> doing this in the toolchain wrapper" and I even went all the way to
> writing a patch to remove those binutils patches.
> 
> Except that binutils tools are not wrapped by the toolchain wrapper
> (only gcc/g++/etc. are), and this is why we have kept the system
> directory poisoning patches on binutils.
> 
> Therefore, could you re-add this system directory poisoning patch for
> the ARC-specific binutils version, so that we have something that is
> aligned between binutils versions?
> 
> It should be as easy as taking the binutils patch from the
> corresponding binutils version.

Good catch, indeed. It was completely unintentionally done.
So fixed via https://lists.buildroot.org/pipermail/buildroot/2024-January/682394.html
now!

Thanks,
Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
