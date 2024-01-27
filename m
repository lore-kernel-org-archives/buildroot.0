Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCD6C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 22:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BA283440;
	Sat, 27 Jan 2024 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11BA283440
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjTXsVTPNA6h; Sat, 27 Jan 2024 22:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B29283449;
	Sat, 27 Jan 2024 22:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B29283449
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D55881BF5A5
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 22:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2A994172F
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 22:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A994172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W58n81vGnXPE for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 22:25:59 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94F3041726
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 22:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F3041726
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40RCYjMc014994; Sat, 27 Jan 2024 14:25:55 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vw1y613q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jan 2024 14:25:55 -0800 (PST)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2E92E405A9;
 Sat, 27 Jan 2024 22:25:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E5DBDA00AF;
 Sat, 27 Jan 2024 22:25:51 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A443B400A2;
 Sat, 27 Jan 2024 22:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmJhTZEONwCuy7mLGmWvXtX4cxEMfTwweN5sDa/QOY1eXNYsCLHPYWdxL+LSlilZ3vO+gPqTR/6ittXRYnjdSSrF6aQnMc3me+8XBYK3ZHzjtMBlsuMup1oZaI1/ana3IZsDa4tncP6J7DPAhnkdZEB/Q6ChDpdhvoU5HjlHU+5q8nmgulzuc96RmN4+3CM/S1wwt625UIK6Y3IeU2W6WcJJG9mAk/okgUnoRk+PyCCxmWBDkxqWU+Nzi91CDXUd3NXmlmh7WjSAp9pcDH/H5C8Msqb06LhhdWxxOEhWBOl/ezLdkIUMtam3N69UCF7P5vq1/RPmVzUGVvlBrGQKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAOQDLgwUB3svHpKUrCDqPG+D6do8exEZRM+E1SFLA8=;
 b=PxaOw9tsbeJdMPZn5i/4Xxbh3ZwfXvNmDn+g7cLo8QxWLT52PHh9bnlXT+36PD0Vha+6S/uQiuXM+8CQhMMVIKHCNxX3fkA1PcGGhlo/EYAly433UTqWR587AwiS2qxdUb11JGuZ11/v841jMFsbheqj28XrpqiawFRjgQl0vmnA8bHXNL/H0e0II12zdKZh24z0UJrmJkuH440Gs4/rfuJhz+B5nD9z7ElPFle4ohvDsqem7wC/cl+lhwojc6EwpwLVtcXX2fwImQ6ZX/YN7PAjVzGw19L9zCyJWLzMPTcl8O1jUmaiCThmpKdQUSsTSzApDr9S5Ke3aB+iQlcZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 SJ0PR12MB6830.namprd12.prod.outlook.com (2603:10b6:a03:47c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28; Sat, 27 Jan
 2024 22:25:41 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::9821:2a24:81f2:7315]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::9821:2a24:81f2:7315%4]) with mapi id 15.20.7228.029; Sat, 27 Jan 2024
 22:25:40 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Yann E.MORIN
 <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 0/3] Add support for ARCv3 ISA  processors
Thread-Index: AQHaP0EDp5dU7LYeKkePQcOOwv6Bi7DKuCMAgCOn4Hs=
Date: Sat, 27 Jan 2024 22:25:40 +0000
Message-ID: <DS7PR12MB9041CDF8F795401990F490BBA1782@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
 <ZZeZClA0xpt7gTO5@waldemar-brodkorb.de>
In-Reply-To: <ZZeZClA0xpt7gTO5@waldemar-brodkorb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|SJ0PR12MB6830:EE_
x-ms-office365-filtering-correlation-id: debc72f4-436e-464a-cfd6-08dc1f86e50b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UcOmwUqyDIvdYhgTI1i0u/fXuwtXNfs053z4ACGXSl0AXAO3Lq873if9Q6GqqILPD9nLISEWzpv4dk60EGkXw41+ldXmzajmhgAzw3ke0+NaUJRa+qfmaI6txovpERgC064EwX6kOElEB+OAAgfLFutgDljNTifB7tJAVuSypTvHOpQir5z5FzndyzGlZY4UhtJEhhfX7xNWMlCe+dAY2OxwHapRIKlAI7U0sPSXICHBmdzQ04UP/oqkymq2Mjy7YTzUIO3HzPASE3bGNuns4OjQm5eS4+8h/Za/O8PYB3RgSpOFdTlAsRus7XTCxwSP8E0jkR4xdqRbdPSKjL8zYQ+0zjOqDBohjltUXy1wn77cjS5xTTG/khx8ZaanmZfeoxIAI+zHF0CA3ZdDBaRW8APorigKphb5a2MGcScypgHei3xzcRER/kMhkIZvKdbPTK6RpGAciao0F9ZNGqscNXHtqMh1ZessY6Esbb1xzLiZpRl7QDXmSWwSHHXrVCJR9YY464W3mRfe//02rS7Lt392qgSBddX9cTqN/I3zwYjW6OXaHdYeZ9EXCp3N0t+4FzlTL+A3Cofj4GIWAH6cTK3p0Ir9jO9G4Ig4MN9iKawb9Y51Tev0VRy2fDj+HYR0NE1udIDwOdSutW4n9DQOrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(26005)(7696005)(6506007)(9686003)(38100700002)(122000001)(5660300002)(4326008)(8936002)(8676002)(52536014)(41300700001)(2906002)(71200400001)(478600001)(316002)(91956017)(66446008)(54906003)(110136005)(64756008)(66946007)(76116006)(66556008)(66476007)(33656002)(86362001)(38070700009)(55016003)(19627405001)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yf6lWQBDJpO/bxpYYKwgVBjSu61t/bzF+fjdaPuNVbB8d6+qb/um/jJD0r?=
 =?iso-8859-1?Q?LCxOzVYPKtUjUo/L974emJZa0l1oTCmiR+L5Jz5hno4FrlInMIwemQKbpn?=
 =?iso-8859-1?Q?Eh8TR5wokLTJv8QVD5MV1TNLc7Hvruqr/a6waegBTd06HkBEJlTxdF+sTy?=
 =?iso-8859-1?Q?Fc7zowEQzsE7R4oR9/2r0VN24qp5LheUNc3Fqt1dkI14CYdJhlshw8G/BU?=
 =?iso-8859-1?Q?37heMtWvv6uG+ROYjHtxF/Ybzr5JsxDM/SFunoAtNOF77gTZ/ErD8kjEII?=
 =?iso-8859-1?Q?zDka+E8YGJT2DIhzy9vlzsoxBqR4sEvCR3/XZbb7SYyHThKb++wvMRhUon?=
 =?iso-8859-1?Q?SbUZiKiIH/cwAjsIdCyx+Q+XfLmAStrC456xhYN3v1RotAzIxtsCEZzCp0?=
 =?iso-8859-1?Q?aXxM/6wYrF3VKedayOk0Aom4EmWNTpFeDxq9rdKSwFBvt3NmZaBb+3Alcn?=
 =?iso-8859-1?Q?Qn5wT4/arCuZpdn4q5nX+eMbZEqWXK/bI4Twgim3Gz0j3JwAic1gnB1h+u?=
 =?iso-8859-1?Q?1b/cynX4lKkKQbZL8J1vmf9BW1yEMUfIrujcOf2fKfzlve1ziXziSjzXlg?=
 =?iso-8859-1?Q?Ibgl4gBqryVyJHgkxa1B+pT+dcU2yzMb/89HX0iOlTee6i/pmA1NSoCC2v?=
 =?iso-8859-1?Q?JwlVVjCvbH6j3qiHbDKXLDermTVOWvFE1byL/WC2nZt/VPqmh6W7jXfAow?=
 =?iso-8859-1?Q?Zjol/+z1dEz7z/zYzmrZBQyelMU+tH63O6o/XH2FpA93RoW1VPa5RHfE0V?=
 =?iso-8859-1?Q?CFwrmrlAZ7kCZ/05jgFLzgQcvxGrOgbfj3foHP/twUedA4fwCg/zIISuR9?=
 =?iso-8859-1?Q?QFUH6koDtEoViTv1DSuKp/eS0vyj/9CMtrH8MPyvu7/Uat/oGX26iQwIRJ?=
 =?iso-8859-1?Q?dLOmvg34as7N5ZxPPcOyrKo1znrt0QMUoIB5lwdx5CzMN3Koeo40NLNB87?=
 =?iso-8859-1?Q?xhNXae4fkyTbp/ELnhwVo6I/H2bG4Sga+BmMVsyLzlnA9TZF10RY8vgbWD?=
 =?iso-8859-1?Q?UWt5mPx/IGUUAuzSGyq8gwOqcYG/oBq+nhHPlSlUP+1/+g97zhRvOw3Z0z?=
 =?iso-8859-1?Q?ykb/Y1ZK6s4WabX5hUDwLRG/LWjSnrtQwFEX8Vf4PzVD96iugjeduiaboZ?=
 =?iso-8859-1?Q?wLYI3EVL2BH5mLaffm/UAXvuXmR4/kuO1aokhRu93XWNYRZ9owbjboOEMg?=
 =?iso-8859-1?Q?BrW6IoaYspTx8jargA4m6t21oBgS5E32uw1FRLNeEJyqNBXtfZ6JvRH3PJ?=
 =?iso-8859-1?Q?lev+LEJdO0MMmqP9iAhPeg3eK76FE0au8P6qUWE2V8otA6qKFaSsVwth70?=
 =?iso-8859-1?Q?wSluZCbYzoGulMa7kK6BlAJJEDRJhGy17MUwLvnmlRbuX4Omj9OF3g71o/?=
 =?iso-8859-1?Q?kYVItY3yDMlfvqhrQvMYCiybj6Aq5JKxB0sC1O3qXhlRvR0mm8s7ftTfpR?=
 =?iso-8859-1?Q?VvFtUWqYFc1BarSJoenjBESDXNrhMyEIR2CeTKialNB59jVztiWo20sO8E?=
 =?iso-8859-1?Q?epGUJvN97ErbyzuAkt3544+VpuWoEhnOXIAeE266xfzMWlbkVui8weZepN?=
 =?iso-8859-1?Q?LxRjorSFNPrKwidkUuZRgsxTL+if//LQGyxXPPXgrGDD9kmhfEOSsgFbZ3?=
 =?iso-8859-1?Q?GzSI8l3M4unT1YBeT7C3l6GasuN4xRbAkc?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 12b3J2dVymLF4nxJoy7MzYTn+tOoZ3QnfklCHzJn/sjUv+ePTZ3msvA0eHRccGlLs2MPys415L2KCNYC8JgTP1XCcGcZxW2CibnbyGsr9ytXzbr5hYp9pQdV4OBYzke9/wqqUkxM9DCNQdDd2LTDKGRUF8bNJ568RG9mdsthT3TLBjRKTV37dRHboHSK7l73NcvTg3gXy8gmsHja6iWog0Hfd+WE9pud67TUT6PJBoRw8hFC0daJBRVbIsagNl5Boc3pSecUJ0lJdAkERDQrfP8lKcAEY0EdzYb/L3Z54DinEMhmxubcuH88898YoW1yV+2rVWbMqxoW3pTZztDBRKajGXOdtlJt0m+8DUY4qAmfGvitpxwb8bN8SOhyxLB6GQdieB8qAQj3GMZWhJnkd4CnrRAzP7Py+c1zvw1qF/XLEdAr5ew/ETDsNcF8NwJyZ64BTj4450rCGDsEUVjvFaJw9kGkbSgx3x4vV6rgVfTEZy+PVhyuWdKaLhIWMIlrnu6Qrwpc1DF82B7J9Zfh1q9nXJkZ1D156M4gpoE82pkVB65X7mFZqq0gEF65AY5K8JjKtclWOPlpYwTHfVmfXj6aYaW+pQ0oO9gZ1ql+r32jRilPnRwrTSV2jaxiBjOueCVZVeXqePUw4BsM0Df29A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debc72f4-436e-464a-cfd6-08dc1f86e50b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2024 22:25:40.8147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0DW0+yyLF3XF0pDcxbgOR0FsaMrsgmV7ZetbEf3i/6lHfMC8BvRLu6p2oj1+w1E19bFAGgeL+k8yODXC0PQjog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6830
X-Proofpoint-GUID: uhCvO7fS9-M6W1g4MYr6Q7XruqK5gjDX
X-Proofpoint-ORIG-GUID: uhCvO7fS9-M6W1g4MYr6Q7XruqK5gjDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1011 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401270170
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=pfptdkimsnps; bh=WAOQDLgwUB3svHpKU
 rCDqPG+D6do8exEZRM+E1SFLA8=; b=DIewmnyZTZf4WYPlnApTM4WdgLod/Jkmg
 vSeK5LIrS7Zmh/qNBthm5gkxabYrF9Puj3M5UWVt0GfXEqsNpm1SKDWP8L/Bzn8r
 Pq7KehEpQ3zWSOyvkvcXxCAioR435T84/0yGxItIU5id33f89nohHwd2H9XFxP5D
 35EqA+V4rlWHl2WMi/xpN6jGQ9hDWOfDzELl0NFGxBk8sFs/07+05GMAZ9lB7+wN
 nTcBMevF9wCimaPHw5QVkve+cEBRBujeBojl+jKEavR836/DKD6Ayu6E2LvLvvFY
 0pN/8pHgTNhPbj5giAqKl+DTsTIPpNHLqEnvh6NgowwhWDkF6sB+Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1706394354; bh=WAOQDLgwUB3svHpKUrCDqPG+D6do8exEZRM+E1SFLA8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SN9RGKkj2FExDP81kymMxS5RNRIZLBmH6oERYcUHV5Xw/csawRBQOldVlATki665B
 y9s27SXprqrgKxIpIxG3qRXfGdQJ2oIl99JjEBrdeCOLc72n+/WtNDpson8itojkPt
 JhMVKJOV7JSHOkDVvES94t+ztUoQ4C0ItQvSGLRCSmtKdHaRffkRRyzAQIm3H42ktR
 AtKdu2XR5VETx4Uahs1UM3uixDkmw7UUiez6diIyakj8dfwCz0/oebmZToxofbMXS5
 2bqR2SYWjWCrI7Gqa6ZNs4bspEiJcnHi6rd9B9od1zCx430WsUFRQLPRaz+QIurd6+
 S8duCeS0fxXoA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAOQDLgwUB3svHpKUrCDqPG+D6do8exEZRM+E1SFLA8=;
 b=n9pGUl+KAScrI0AnhPe/KRJEz+OT+CV4E8XioGtGe4oCnRH6kg/9hvGJvGxFKb3O7qy5VU2wxfsikL4J/m0nicYKGI8xWDH0Ge3qASVVxR3KsxVyHFnUo85iSL56DJHnwd2UsvU2GcS8DXIRPJc7U4Em3ud/WfB2OPFVfA6KWs0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=DIewmnyZ; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=SN9RGKkj; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=n9pGUl+K
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=n9pGUl+K; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH 0/3] Add support for ARCv3 ISA  processors
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
Cc: "geomatsi@gmail.com" <geomatsi@gmail.com>,
 "artem.panfilov@nokia.com" <artem.panfilov@nokia.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "VVIsaev@gmail.com" <VVIsaev@gmail.com>,
 "vgupta@kernel.org" <vgupta@kernel.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4881300191561372968=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4881300191561372968==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS7PR12MB9041CDF8F795401990F490BBA1782DS7PR12MB9041namp_"

--_000_DS7PR12MB9041CDF8F795401990F490BBA1782DS7PR12MB9041namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Thomas, Yann,

> Hi Alexey, All,
> Alexey Brodkin via buildroot wrote,
>
> > It's been quite some time since introduction to the market
> > of new Synopsys ARCv3 ISA processors, which are meant to
> > build on top of success of their predecessors in ARCv2 family.
> >
> > ARCv3 ISA is meant to improve efficiency of high-performance
> > embedded microprocessors and thus by definition is not binary
> > compatible with previous generation of ARC cores such as ARCompact
> > (ARC600 and ARC700 processors) and ARCv2 (ARC EM and ARC HS processors)=
.
> >
> > Moreover, finally in ARCv3 line there's a 64-bit processor family calle=
d
> > ARC HS6x meant to cover cases when 32-bit address space is not enough.
> >
> > Since ARCv3 ISA in not binary compatible with older ARC cores, we have
> > to switch to newer tools, which in fact are already available as a part
> > of ARC GNU toolchain v2023.09, see [1] & integration of them into
> > Buildroot [2].
> >
> > Even though that update is long overdue (for too long we kept all that =
in
> > our GitHub repo [3]) it's better late than never.
> >
> > I'd like to say thank you for all the folks who used to work on Linux
> > bring-up on ARCv3 processors, most of whom did contribute to these
> > changes I'm sending out today, some even no longer work with us, but
> > still it's another amazing example of close and efficient collaboration
> > of a group of truly highly motivated professionals. And it is my
> > pleasure to work with such talented and bright people!
>
> You can add a
> Tested-By: Waldemar Brodkorb <wbx@openadk.org>
>
> Thanks for working on this. I think I can mark my patches as
> superseded. At least my work on this kicked you out of the silence
> ;=3D)

It's been some time since the series is sitting in the mailing list
and the only response was from Waldemar (see above).

Any chance to get it merged if there're no commments or objections?

-Alexey

--_000_DS7PR12MB9041CDF8F795401990F490BBA1782DS7PR12MB9041namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">Hi Thomas, Yann,</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; Hi Alexey, All,</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; Alexey Brodkin via buildroot wrote,</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; It's been quite some time since introduction to the market</spa=
n></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; of new Synopsys ARCv3 ISA processors, which are meant to</span>=
</div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; build on top of success of their predecessors in ARCv2 family.<=
/span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; ARCv3 ISA is meant to improve efficiency of high-performance</s=
pan></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; embedded microprocessors and thus by definition is not binary</=
span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; compatible with previous generation of ARC cores such as ARComp=
act</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; (ARC600 and ARC700 processors) and ARCv2 (ARC EM and ARC HS pro=
cessors).</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; Moreover, finally in ARCv3 line there's a 64-bit processor fami=
ly called</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; ARC HS6x meant to cover cases when 32-bit address space is not =
enough.</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; Since ARCv3 ISA in not binary compatible with older ARC cores, =
we have</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; to switch to newer tools, which in fact are already available a=
s a part</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; of ARC GNU toolchain v2023.09, see [1] &amp; integration of the=
m into</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; Buildroot [2].</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; Even though that update is long overdue (for too long we kept a=
ll that in</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; our GitHub repo [3]) it's better late than never.</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; I'd like to say thank you for all the folks who used to work on=
 Linux</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; bring-up on ARCv3 processors, most of whom did contribute to th=
ese</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; changes I'm sending out today, some even no longer work with us=
, but</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; still it's another amazing example of close and efficient colla=
boration</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; of a group of truly highly motivated professionals. And it is m=
y</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; &gt; pleasure to work with such talented and bright people!</span></=
div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; You can add a</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; Tested-By: Waldemar Brodkorb &lt;wbx@openadk.org&gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; Thanks for working on this. I think I can mark my patches as</span><=
/div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; superseded. At least my work on this kicked you out of the silence</=
span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">&gt; ;=3D)</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">It's been some time since the series is sitting in the mailing list</span=
></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">and the only response was from Waldemar (see above).</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
">Any chance to get it merged if there're no commments or objections?</span=
></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">-Alexey</span></div>
</body>
</html>

--_000_DS7PR12MB9041CDF8F795401990F490BBA1782DS7PR12MB9041namp_--

--===============4881300191561372968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4881300191561372968==--
