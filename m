Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CF7D3C52C
	for <buildroot@archiver.kernel.org>; Thu, 17 Oct 2024 20:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DBF660AA7;
	Thu, 17 Oct 2024 20:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlrJdlihtZ7c; Thu, 17 Oct 2024 20:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABDDA606F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDDA606F7;
	Thu, 17 Oct 2024 20:24:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDF0712
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A9B4083C
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAmvGIH5rA2l for <buildroot@buildroot.org>;
 Thu, 17 Oct 2024 20:24:12 +0000 (UTC)
X-Greylist: delayed 517 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Oct 2024 20:24:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F9CF40833
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F9CF40833
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F9CF40833
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:24:12 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HIUd1O022170
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:15:35 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42b5334r16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:15:34 +0000
Received: from xusxph009rp010.corp.ray.com ([128.13.125.135])
 by xusxph008rp040.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HKFXdY000723
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:15:34 GMT
Received: from UUSTOE28.utcmail.com (uustoe28.utcmail.com [10.221.63.42])
 by xusxph009rp010.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49HKFWr0004554
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:15:33 GMT
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE28.utcmail.com
 (10.221.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 16:15:32 -0400
Received: from uustoe1z.utcmail.com (10.221.63.19) by uustoe1z.utcmail.com
 (10.221.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 15:15:32 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.151)
 by uustoe1z.utcmail.com (10.221.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 17 Oct 2024 15:15:32 -0500
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::20)
 by BN2P110MB1541.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.29; Thu, 17 Oct
 2024 20:15:36 +0000
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452]) by BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452%6]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 20:15:36 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "Buchmeyer, Neal
 Collins" <Neal.Buchmeyer@collins.com>
Thread-Topic: [PATCH 1/1] linux: Install artifacts to staging for kmod build
Thread-Index: Adsg0U+fOb8CAmPfRIWa827hK/CKhA==
Date: Thu, 17 Oct 2024 20:15:36 +0000
Message-ID: <BN2P110MB1160EBDE7D3EA4A56AC52B1C9747A@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1160:EE_|BN2P110MB1541:EE_
x-ms-office365-filtering-correlation-id: f8a24ace-e17d-49d3-c324-08dceee87618
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rf2UmkrzXViergd683aae5Af8oAimeVZYMPRgZ2Kb63i493NvVj+jwHNNT4f?=
 =?us-ascii?Q?aWT4c8V9mIpCkWQk5ukbAwLXrDAT2pLN/ngDMFtC21GqHHFs0E9KaYyzkAVx?=
 =?us-ascii?Q?otg3cf4mBSrYNcPhBEG2jNDpOqTEQK99gjt/jTthyD02g8OdaO2yKNGilS9u?=
 =?us-ascii?Q?tAJylN5crTXwI0mu+4uQoQdiAH+wcftJ81WhZgJnbAJ2dhz7LHln+qx0XbgB?=
 =?us-ascii?Q?a3M/MfXHeMeAL7D7MuhHe/xDpmB4CRwFES0txZxonNaJA+AAyftzXhWDh7k5?=
 =?us-ascii?Q?Cd55pn+2/sfwPuVYG0SN9feVnJ23kg8EDjTWxxvppDtA9NVV80phqGdGZcav?=
 =?us-ascii?Q?vNtOdJK5JR2BlUZ3bJTuBasOwnKll8RlTQDbZEVoG6NuYY3bgfmM7duf3vPs?=
 =?us-ascii?Q?siggYNLyIU7oGs7tkwFtRXzRg7aDY3xoH3gHM0usX99y1flIOK3bk8FJe8a4?=
 =?us-ascii?Q?hypb/rRRSXJDkxAKUf9gt5KusOizIEARxaMCA55gPfIsdz61wdbXbuvUkRD/?=
 =?us-ascii?Q?kV0AvhKNOil+ocAYcytZUpa1jD8Yk8vikV5+BOzDE8xHsQRIRYt9PZvR9HPe?=
 =?us-ascii?Q?1NuFr2aHfBLdQyv+7VakfWzioQ8inkzRaEQJAJSgvLQChFKi1geAaST+iUii?=
 =?us-ascii?Q?8eJpcdQdLTyjaLP5NcGMYTjowNnosUHbu1z6cuEVwAZYD1TEOsUYcUprfRIK?=
 =?us-ascii?Q?gRdoYebEiYlJjSBMS7EUboc7jXcRL0sSTU72ondY+juHMKjQgxNDshMwT/ci?=
 =?us-ascii?Q?WJsyX9+peFNxWPST8kb8lO/ws+ftLZRATbRBnrtpOb84pB6VbR+JF2G/VsOC?=
 =?us-ascii?Q?XP5Z6GAh5QcYVVOxuf1DscztjjtBlqQgBtSdPF+wfTKlyK1huJ9VbJ3pjfMg?=
 =?us-ascii?Q?sWoUXA2Q/PchUiAgOpfhUIAPeMuvA2BLl/ULLuBuUOJ1fdf24bUI6DIGogRz?=
 =?us-ascii?Q?9Ca5TRMpR0RXpbFqxQ4a+mSwuphyN8hyHPAwgpff7BtH4T7gpiPCeRY/Ketx?=
 =?us-ascii?Q?y5ujyaQ6ABxSSch78ajtsA8IM353A6FWbqZYiLXvAGfw6KLdFuOCukWq6por?=
 =?us-ascii?Q?oyyDYma1aP1NygLdgnadVyy0iyILeWlPyKt4f4gXIPXybs2Y6BtR7kUW3NGK?=
 =?us-ascii?Q?O+K2eiXWjmhQ4Lw4hUU9l7UseymHsVPADJh7GNnX3iLhbHhB99LRh3C0Joua?=
 =?us-ascii?Q?sFar/SGxAxuEj4UW665wEEo4DBklg50YKHEVP1U8IRtzF43BU4y45BSN4t7z?=
 =?us-ascii?Q?vV6piyL/WCJ56dMuarAKA0h7ABpJYIp6Lo4+K5fBvf/Ks7+UPe9G7brZsa2u?=
 =?us-ascii?Q?KMbbPLoFOcH67WaHTcZ6CGA+Aq8OsKlkhoZK+UC1fvd0+3udWjzHsqaiKeUl?=
 =?us-ascii?Q?XkK1sBQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4EclhlPXEFw8IthWdLcfxkLlCaWf0pd2OFW1DUeXXuD7co4GJU2JHF9bXq0b?=
 =?us-ascii?Q?l0zRd8GWJbqp2WUU8nJpK0aSx2NSEHsot+wiY6HQ4lWEsAVJfJ39iA0S8y08?=
 =?us-ascii?Q?8KuTaqY7lCPuqOpSXiuCzhXS+A4u0zLVuQexKmwwwGAZHhysi9JsCHAQFWfQ?=
 =?us-ascii?Q?Xz1UbNYRhkuMmv49GGOwHRE4L/dd/WsAiHuZmkTrP8e11JvAK3ujbl+e9A1H?=
 =?us-ascii?Q?fiI1y3SSDQbA1i4IIiQGsgoRto/F5OopoUkjGVh+eShdndZzYbqKi7/pnf+Q?=
 =?us-ascii?Q?ioJYm6Q6ek8Q2rCI0aZam3OkUb9K3m+fVzEWMzLq4BFCiwCa+TTTOKgurFB/?=
 =?us-ascii?Q?Y2eMpSqWAGwiEzud+RKovXXHNrkJU0Zp/28Da4jdKaO98F7MU+bDTJD68V+z?=
 =?us-ascii?Q?UJEJ1sLCeXvAYcj7F8Ydm/iyzt9W1MemYgNF5FnlpUsh6F85KU235vU1GeRP?=
 =?us-ascii?Q?VbCNX2mx6oNXsMuIarFZJUY4IJ9a1vjn+Q21dUovXkKC1TiWqNCBjRZINIge?=
 =?us-ascii?Q?5TMfM1TnDeSfJXgf9ibhL33QOwAU5ETtP2A42gPUp6hCbWUmIxpPpWr3BzoP?=
 =?us-ascii?Q?k4jJ5HQbZrIMkrArFu3O/0y5D834XtPjwladY4+W1KAA5XJ7tx3NEIgtM3j4?=
 =?us-ascii?Q?p44pL/IDaipDG4/3Y5V6lciPRv+n841sRodChGS6V1CdGkCADnsaknpYz+3z?=
 =?us-ascii?Q?ecPf28dmWrTiAU5gVjBiK5JcYG1RiRaF8U6bMpveufAiPCVKzO86R5p5GvV1?=
 =?us-ascii?Q?E5NLNH/e3r0+5jedkQXbdEBfvhTmizAeQbJJchVNTohJbk9ftr63DP6J6jKK?=
 =?us-ascii?Q?XFel/OcXsJ+Lfr7TpvwXWWMOYZ6zvL5h82bKRMDt5M3RxHVVoYNihkIami53?=
 =?us-ascii?Q?U/G3aY1vVvfxf05jWumnwG0XuqcTQARJURWGBShCedZn82XCMywbXUHy7qEc?=
 =?us-ascii?Q?L77guklA+e6Y7IaDswwU2yq9B4Tq6maBnBPVHGGHV3BvMxeWPwYgLlM4Mm3S?=
 =?us-ascii?Q?gHdL5jzyaTitppfUYV/QpvLP+QESKszblLB8xefp9ejBeIOYwHP1b14w3DYr?=
 =?us-ascii?Q?aTNm3mtTs8jkiGcnzRmKujF2TI0Ygr2Ytm8TqVKyy0ucUuABpSTPcZmfY3lH?=
 =?us-ascii?Q?VL4Q+CoSYr2elyIMfc/jqu9lrsPuHveKcwByJfrVAJYe92m+ktyYek7gcc20?=
 =?us-ascii?Q?/cYiPPofoICwBEa0BrU16BSe5o31ie+Pxtd+9QczFZkR1mOn8m48AMgvyZ05?=
 =?us-ascii?Q?UgbdKbrelk8LQ1vzbFfS8JTS4DM0m/9YIJMafP8O+Tf0VLT3nfgX8iqU4+N7?=
 =?us-ascii?Q?bbBZ7p6UImQ8M8jpmZZjNPK60RVBSBaz4sFn41Mqmqk4UR18ho10Dmynt2IE?=
 =?us-ascii?Q?OgauB3wYek8Sh//qbD3fgdjs11eSZKOZYrB+3j7kxKbQ1RwsugIt9uibEXX1?=
 =?us-ascii?Q?xnmoLP49m2C7wf4Awd2dwqPII4e991Q42ksWcLSyKQOohNarXH3K9EZ8nyLh?=
 =?us-ascii?Q?sRyQyaVO2tI2vyo=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vAql3NyiV8jMvHfKRfCBG/UEflD8wyEupsHgnhO1IJ0QfMbZbu72xJMv0TnFn2wI+tO8wVdfM9CHBY42k/v0yeFUDHQoTA7HuEuWUTIlUNSoi7TTuB0MpATJkbEupatyraHmu4TpdE0ZyhIvXc3m7L6KmDn7MHAWv9HHs+07hopkfjAKx9O4QjYmu6ANGuRoO6g+Rw6FtOQGD7H3X0ShM20FpAiGxryf7dZxUjUnPTfcnkVqpAgqvVz8F0GrFcpPF0fxyXLvlmi/2hHQwFawdl1g1rHjabPyHt4GcRVfdNwLY/n+MrNgiwX3yRBryUcP1TY5G1j/UJkh2sFvil2veg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m8y5VWA+aYuW/jAj0G3SBT1LnGE7LdGC0VxO1XQs8A=;
 b=rE9gbmg0FKWy/ItmpX6d1TqD4+CvnDWaLVR96CtWNS3OD/Vy30tr+LGWi3MIL17Un7NxpQxB0oETLiAOwRzNN3X42QyN+C4eZwR2dZ1opjoFqfHnhaNBGTAKobCHIMrgeUmNC3Jap9EbVhw8OakWI7+8J5hiw2wYNiIdEd4NzY4xSYy/49WcNPz/yIbFVVzWVT/xlkaiBDWMvRzeHZoysrZ6KMWTMrWZW4EPblwMV/bHmhsTNmnInq07n47Dcrzbwask0Ttqk92zgZ+y/alIWzZYLqQ8TJbSmYSQVoYUIKgktzDLC+WkzCjPawjF6PqiBf9JC0ZtI189IhsphrC8LA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: f8a24ace-e17d-49d3-c324-08dceee87618
x-ms-exchange-crosstenant-originalarrivaltime: 17 Oct 2024 20:15:36.0665 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1541
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_22,2024-10-17_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_22,2024-10-17_01,2024-09-30_01
X-MHuser-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410170136
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410170136
X-Proofpoint-GUID: 4jRlz_3bSsLaAhYDxHCnKs-Fe7R3WgpB
X-Proofpoint-ORIG-GUID: 4jRlz_3bSsLaAhYDxHCnKs-Fe7R3WgpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_22,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410170136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=OYlUJN18DuLCk1r/NRYgS4HSVmExFE+6+FlMLHBGIUQ=;
 b=qyUAEB/Gcjq9FGIuMXdwnkjXfOBfpTOP2K6koKzhUKZZMV7moDrEM55DEI5SZx4J9EMX
 pCuTt33VfbmqZvToWz8JmfJFHEOiORNqWSvrUYqKFqzA6XinP2jCtRtu77MnUdtqRfAP
 NGiEPIgceBuE/7XiF/aBDaAXdz2J801AR9+plTM8GXMbhQJGTWheKUDELTVHznmXrWWE
 N4mh9trmnk+j9S+YVLEi6nZRHfqy8tyLZSTUAbOSmHt1KYfftSXwBWrAjkNrD4INDAcY
 5tioJBIuSuGTC/bhz2Hd90S1c29T0xAVdwoivg+x34Zc0ypWLEc2XRCZ7EYMQuucfyZ0 2A== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m8y5VWA+aYuW/jAj0G3SBT1LnGE7LdGC0VxO1XQs8A=;
 b=RCisa5QZoP3ZPpftHLmzPhYhwFnEQaTKJ4q1G5oHpnOutKJVYW+NMbehSGZ6kMUJvCIQs4kDEGFinQA7P922D6BdoxS1qjNg4T28TrxvS6K31m3J+cz+FY/mKMtOeJn2Kp2zbzolpSV1n1ChXTdXBjx/CmyvzFq55KDw2+5bD4U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=qyUAEB/G; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=RCisa5QZ
Subject: [Buildroot] [PATCH 1/1] linux: Install artifacts to staging for
 kmod build
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
From: "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Michaelis, Adam J Collins" <adam.michaelis@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From a7d8db0280813419c578e8a48f4114a164db5672 Mon Sep 17 00:00:00 2001
From: Adam Michaelis <adam.michaelis@collins.com>
Date: Wed, 16 Oct 2024 09:06:14 -0500
Subject: [PATCH 1/1] linux: Install artifacts to staging for kmod build

Installing kernel build artifacts to staging so that the user could use the exported SDK to build out-of-tree kernel modules.

Signed-off-by: Adam Michaelis <adam.michaelis@collins.com>
---
 linux/Config.in |  8 ++++++++
 linux/linux.mk  | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in index e8c0722de0f9..372cd9ddd7aa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -454,6 +454,14 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
          /boot if DTBs have been generated by the kernel build
          process.

+config BR2_LINUX_KERNEL_INSTALL_STAGING
+       bool "Install kmod build files to staging"
+       help
+         Select this option to have the kernel files required for
+         out-of-tree module building installed to staging. This will
+         then enable module building from an exported SDK without
+         the full Linux build and Buildroot.
+
 config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
        bool "Needs host OpenSSL"
        help
diff --git a/linux/linux.mk b/linux/linux.mk index 469a80db9f55..fc7cd2c6a45c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -585,6 +585,22 @@ define LINUX_RUN_DEPMOD  endef  LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD

+ifeq ($(BR2_LINUX_KERNEL_INSTALL_STAGING),y)
+LINUX_INSTALL_STAGING=YES
+endif
+
+define LINUX_INSTALL_STAGING_CMDS
+       # Install artifacts needed for module builds into staging for SDK use
+       if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
+               install -d "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch" && \
+               rsync --exclude "*.o" -a "$(@D)/arch/$(KERNEL_ARCH)" \
+                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch/" && \
+               rsync --exclude "*.o" -a "$(@D)/include" "$(@D)/scripts" \
+                       "$(@D)/Makefile" "$(@D)/Module.symvers" "$(@D)/.config" \
+                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/" ;\
+       fi
+endef
+
 # Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
--
2.29.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
