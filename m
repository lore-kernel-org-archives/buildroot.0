Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD6CF539F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 15:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF22606C2;
	Wed, 23 Oct 2024 15:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgIw3UVVq6bI; Wed, 23 Oct 2024 15:04:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53030607CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53030607CA;
	Wed, 23 Oct 2024 15:04:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 602054C2A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E8F78169A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQWfQsA6Ah6Y for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 15:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 411AB816E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411AB816E3
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 411AB816E3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:04:21 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NCosCH024372;
 Wed, 23 Oct 2024 15:04:19 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42emh972v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2024 15:04:18 +0000
Received: from xusxph009rp010.corp.ray.com ([128.13.125.135])
 by xusxph009rp040.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NF4Hoc022268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2024 15:04:17 GMT
Received: from UUSTOE29.utcmail.com (uustoe29.utcmail.com [10.221.63.43])
 by xusxph009rp010.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49NF4H9h013018
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2024 15:04:17 GMT
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE29.utcmail.com
 (10.221.63.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 23 Oct
 2024 11:04:16 -0400
Received: from UUSTOE20.utcmail.com (10.221.63.20) by uustoe1z.utcmail.com
 (10.221.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Oct
 2024 10:04:16 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.143)
 by UUSTOE20.utcmail.com (10.221.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Wed, 23 Oct 2024 11:04:16 -0400
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::20)
 by BN2P110MB1221.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Wed, 23 Oct
 2024 15:04:23 +0000
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452]) by BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452%6]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 15:04:23 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>,
 "Buchmeyer, Neal                            Collins"
 <Neal.Buchmeyer@collins.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH v3 1/1] linux: Install
 artifacts to staging for kmod build
Thread-Index: Adsk1cvoqvWK/JpqRPCpFdnQ02fW3AAhfcAAAAA5WgA=
Date: Wed, 23 Oct 2024 15:04:23 +0000
Message-ID: <BN2P110MB11605B7A599BE61C145F1E92974DA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
References: <BN2P110MB1160D79F220B89EF4AA5F69B974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
 <ZxkOpqJgzGgZ0Wkr@smile.fi.intel.com>
In-Reply-To: <ZxkOpqJgzGgZ0Wkr@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1160:EE_|BN2P110MB1221:EE_
x-ms-office365-filtering-correlation-id: 938a81d1-3048-409e-a4a7-08dcf373fadd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SDN3Yga61Yc9S/Y4cQFGOAsf5mDdZP6dnsisi1W4YUZ91BdC9rM8BTYl3F8+?=
 =?us-ascii?Q?9Iaale++qIZlmRllbg4lQ0U8Q/fhGXxR8aDpMCCzhbRB0XxmUHjGNRgxdiGW?=
 =?us-ascii?Q?Iv5RuP3QVPXw1zKgO8SvsEbh84mouH7rBPnBtvrmFepjgQAidFGvus0fSH2b?=
 =?us-ascii?Q?PWPeM3PYdBR1YZwJetZeokYIfnx5C0OkGQpP+zNJKpMbYPll9NosZQYvzeLF?=
 =?us-ascii?Q?Za4vS3BYwSfS0pp1RtHNRu5aMqIOmf9thE2uaZ/eUzo0GCJU+ZD10Eqx1ZOW?=
 =?us-ascii?Q?1ycjWy7W0qgise08W1Nqrjq3ZQDi0NaL6nI8Bkt6ieIL53iZuxqdny/y+894?=
 =?us-ascii?Q?SRm+2DordrXE5vO4a/Ngus7zkDzAgbILIzOXzv/tQy+D1jfaDF5ExNXD8EPp?=
 =?us-ascii?Q?S8yHKYl/WRWBpce460xRY/8zzsINiq9nBEwVkaeQZBWWF/SOJl1HccCqab3m?=
 =?us-ascii?Q?zMsqG8Czv6Es3NuM3L+RPKfOvje7c52d2ehJ3rABQdraKAIgUm3Gzf+bJYXE?=
 =?us-ascii?Q?xq4tUZUZtQqZ+y9svQo7Z21ETOUFzXvc7YwE7jLFKtvTUkPqWK/pSnv89ied?=
 =?us-ascii?Q?tkrzQ4hc+v1onerttdXUz8LgbUq0c4+EbZN6JUHBGrwB/TIA4fwmX86Fjpkt?=
 =?us-ascii?Q?AydAdytRfRDEQeoo1aTwRvGm0DyaH4OMsr9MZU8z7GlQpDlhVq4At9aMNfjo?=
 =?us-ascii?Q?54bVJYqI384twqOQdvY3et2J8Yfecd2+zVZb0wWcRWWdBhMyTfMk2DgQHZui?=
 =?us-ascii?Q?RrMRP1qT3HRz9Vdl6JX/go2IyM179K16T3BG+VoldgG+tZAxSP0vODbN57V3?=
 =?us-ascii?Q?FccGPXI3BClK1iRsnm/u9j386SFKRB0HQhd91+3LK9WZrLediUppZWC/Qrdt?=
 =?us-ascii?Q?tOnwuo6AkdYWSjIQRGpSYb/JXOQhMpM1KViMUe6Y4Y7ytfNbc6+8+Bn3lVul?=
 =?us-ascii?Q?1Cn519/3C44SWm/kWedeW7XmEd6TXT+1Xpn+5+RX63FYN6/w2CIdioYlImDr?=
 =?us-ascii?Q?H2KAYTvaCBX1hy+hVHCOBOyWEQ7R3Rh7EVmIHjoibugXwssgk+Yq6hIsFbE1?=
 =?us-ascii?Q?Fa630/PE0Ve0d/SxGXhznPLQMbXkSM2YXR44NF4VSg0pT7mEiA/1QbsMCDum?=
 =?us-ascii?Q?SKwRGN4eed4znESd0y5rtqwCZtvIvANcYQc+H+MfFvvvC6bUNeVzjokM7jV2?=
 =?us-ascii?Q?VYyxUc8vdwCQxyqPR4tCav9Z4byPEFag2pehMlQKKqbW1vpghWz3y4VzoVIc?=
 =?us-ascii?Q?HgiSZsxxb/1EB7Dq1Po/S5HQZoyQmNmeqyuDKOhdKOLOlDMkQcg92b00UfL3?=
 =?us-ascii?Q?Nb2MEmDUDf0ucgrHNb41xHD71SrfFV8cdeYlBiDUaqDDCOvc7GprEHZQnkex?=
 =?us-ascii?Q?vm14H5o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xb93TRsyjMDO92kykJnQf5w6w8QKUkWRu9xYVIs2Gp4G400uQqqJb/lOq4Xx?=
 =?us-ascii?Q?/24B8RBlQIF5Rxv7kokLUFdNAd2StC2IOVxpLv6OAi2M2sZTGmKDRbakIIj0?=
 =?us-ascii?Q?8nvUzlzsIw0kqfib1/ySfKhMXT9Lyhd0F/qpkx3ASbQobJxI7bQrUspcKb9n?=
 =?us-ascii?Q?6GrrUZ1sGs9R5/X+ueSkCjRff/f5Gcm30YqsANfepckQHqfeo+LSG/jX+k30?=
 =?us-ascii?Q?uNNJ7G5uckId7hVjaufebJNkJvrFbSzB0uE/m4PMD2oDr6hse0nvCKkcpKQ1?=
 =?us-ascii?Q?W5RAIGdWXKDphIJWei/A1GKEKN4KGl3VWl/Aen4Hhkn9Wqsk497KE93UOYCd?=
 =?us-ascii?Q?5ooWAeek2gPHbDeRhKqVGRNLty3WSuLDGv2Y8AUZIk2y8fsPkKpwxS2svMOh?=
 =?us-ascii?Q?MtIym/cj9iKPwSqtpxn4lWkVk0isH7k7vUiMfiOB13Q7sXF+lcIrpLZGE98p?=
 =?us-ascii?Q?TAwBvpVphg6KI1/rK4NwnDpIbaekFgT/ozxbp/FLUgKWYFGP3/dKOruftQ05?=
 =?us-ascii?Q?xsksyfmamu8KcCR/v5+dJEn3aDmziAasTz5ig+QdgHlgfMl46jvCNQabIATo?=
 =?us-ascii?Q?K3F+1hDXZ8lT+7ZVFDyezVMTTA8PXcHMZfptYbduybZ71VO9MxBsXZuUUzR+?=
 =?us-ascii?Q?1Tr7igFz1tL/F126FxNGc1ERxclKEPaA0x5dxkyzpBAnA8DfdvzjdJN/Jo+s?=
 =?us-ascii?Q?44BHh8t75uAIPbfFR5qNIhU5V1t1LiawUkwfkzIJ73TWpBTO6hBJryLi61Q9?=
 =?us-ascii?Q?iyB55Us6ghLdgMUdCHBQ5wiAFlpVczcLAdn4qSulJewmoJRwWXTbvdlc582S?=
 =?us-ascii?Q?y6/4K6KETWipsTdVXRwIu3rumN4w2gi4LlUt75m43sSLwoH/j/SWX16qFMbo?=
 =?us-ascii?Q?kalxHvHzbUul6nxNPw65N+oOdGni8Kp8LFs3KccbiV6Js1fBbEPFWKj4fXSL?=
 =?us-ascii?Q?2D0ts373IS0l3M9yCAzQp5rukIpNLEULQxSIgq6PJ7Vz49lqVY0ZcnSGyZKN?=
 =?us-ascii?Q?ipP4bxxAWA/0h1I9Z86ACDOxObd6FqOljYVk0H/GBL0nG8Vgg0zbO2ZP1jVn?=
 =?us-ascii?Q?beQu7vhoS4xtsJmkAPNrEzXzqd4jEEdF7t1OqeFEL00s+BQxXqRI7aUd2mh8?=
 =?us-ascii?Q?pX9HN2Zx54dDk82nQUq2olJpbuXBZI4Hqzp+YtkCWBaGPnq9/vhAfF4HDOPN?=
 =?us-ascii?Q?6/VbkiBbjdKUfRd4BOVypBIk74CkraFLT3rxKEH8No6aym2VhzYxIN6kVo81?=
 =?us-ascii?Q?CDhh1122Q1YrGReTMc+Iujno0sp7tF1T+IMZYoEDRBeL1EYLBn/sQX9diQ3e?=
 =?us-ascii?Q?r/ZjnceXSUSDNrCiTOtKS0WA8IFhL26qLopK9RQOas54hWh+oDV/Mphv6u+E?=
 =?us-ascii?Q?eCZUvOhAwlZsPbcMOXpqSa3IcxyTwMCvDRYYIHdvlpzocSzHVrBOvGt6opIE?=
 =?us-ascii?Q?N1kFgU+65QG3oDY1UT2VQqGlcjA0VqpdPgkBa62ff42T2Oa+cY7Nz+19XobB?=
 =?us-ascii?Q?TlunVkNuTyffZuc=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=iaS8DZTMktrhcWqgML22E3hCmbs8TLo1sgepqw9GkSwAAnpC5fLd7sa/ZBitel4isXR6L1IWubMonXko94EFYAPOcaRsIJFyAqRSvpzH15R3CJsOdPbiM/Nnc2tJ0LevXibME3P42x6O/BZCJ+mvrjlVqxQB6hhFH6YHaOfggrbqP1qyiPC+GIKC/S+jdYGO+JTfvubmdwj8EqpaENRqLnBts1ImEf4gvGUp6+FRZWdbOt6X8M515k1M4wF1vMW7A9iU4XGzQCzLGBw5Xexz0DhPR7r/CkfqJg6366ga9fUbRyNWEvkKbYP+c8B0gH5ycMfPsa2tdhE6MWXdnvHQMw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzzES+aWocYXBZaez1tJYlZpxeFTmSGSDvRGC2yYi0s=;
 b=DtFnzPjrBX6F6EenDbdTcIGosuaJGLjGW3e5HPv8Dh+ENlI0Q7i8NX9HuuQ2wv8FxdqSuQ3Bte2l5ZvgwGd94r0tvP5as4n2KkHJalVa8CJpX22W0GiDty314qP6qi51kakA7mmJ1YGMFq+MzmshEVWJF8mxqth1mM+GMXHEqlbufYvkuwUJ+YYfGIduUeSaku2GyHMGn8cgN4+DgguPPUoogMWC7+xWaPrp/PfJes1V6je6EoR6cf/IfQX+fBhogm2NHx/y+GYts7h/aaqq2PWXpCyZTXdanbyAo2pz/K6KEiivEqyokV6u6KAguewcAWQXCVrubo+e1lKqnKpngA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 938a81d1-3048-409e-a4a7-08dcf373fadd
x-ms-exchange-crosstenant-originalarrivaltime: 23 Oct 2024 15:04:23.4950 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1221
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_13,2024-10-23_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_13,2024-10-23_01,2024-09-30_01
X-MHuser-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410230092
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410230092
X-Proofpoint-ORIG-GUID: Bki2WUTpByOF5duMAf0bEoSl-BesdVtP
X-Proofpoint-GUID: Bki2WUTpByOF5duMAf0bEoSl-BesdVtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_13,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1011 mlxscore=0 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410230092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=8s0+USdWHM+PBt9Zo3v7pZBuNtu0tNr6r2QSLmwujSU=;
 b=fSJc4Fgdutoq9Lh+7i16i+q0UDj3KBi0155SI+tL3CbP1HLtytUuh959HmRgRYXeKwHZ
 snFz5BtG7mSTeAuzYpGJdoe6QfSYWpyzTXxTYea1bB+NlAZhl5j/M5+tNCDNzp5xJpBt
 gwPRSP2vu6mfMhQ7jNswk09vduHR35VVrXZBU3iwze+G85gB3yIn7aSyW++mfMlG62Nw
 9yCOR8kmgYNxVDGwkOxurWcPxNxOpVDIWEKrgJNElp3e6uQyvw+ExzcDl4/9E3Fhxa6M
 6LpyR3EUmHShgewB6y7Yjtay+vjpKBFr/BRGnbzR7nWJxV5tWDGY2jonclV6OEbT9AVL Mg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzzES+aWocYXBZaez1tJYlZpxeFTmSGSDvRGC2yYi0s=;
 b=tjN02GHQsIihj1eovJh0ryRE99XML20l/9nJKfaeDmeYC1K6NDowlmaNP9Pp07IODF96XnNA3+0lBCRDzCP/ck0XAXdAmN8Q35tnkbTB8PsiheON1x4h2jt1dIJTxERdum3xDi4Tv6kTM+uYOrnUdl5+s5zuYSl69EUQBzgby/M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=fSJc4Fgd; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=tjN02GHQ
Subject: Re: [Buildroot] [External] Re: [PATCH v3 1/1] linux: Install
 artifacts to staging for kmod build
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

I use "git format-patch -M -n -s -o outgoing3 origin/master", but then I have to copy/paste the generated file into Outlook to send (cannot send direct with git from my dev server), and wasn't sure how much of the header info to remove. I will remove that line, too, next time.

Thank you,

Adam Michaelis
Prin. Eng. LLSW
Mission Systems
Collins Aerospace
Cedar Rapids, IA, USA

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> Sent: Wednesday, October 23, 2024 9:57 AM
> To: Michaelis, Adam J Collins <adam.michaelis@collins.com>
> Cc: buildroot@buildroot.org; thomas.petazzoni@bootlin.com; Maier,
> Brandon L Collins <Brandon.Maier@collins.com>; Buchmeyer, Neal Collins
> <Neal.Buchmeyer@collins.com>
> Subject: [External] Re: [Buildroot] [PATCH v3 1/1] linux: Install artifacts to
> staging for kmod build
>
> On Tue, Oct 22, 2024 at 11:00:04PM +0000, Michaelis, Adam J Collins via
> buildroot wrote:
> > From 59282105d9121f41386c799f4c81cd3f6546ca39 Mon Sep 17
> 00:00:00 2001
>
> How do you format your patches? The above is not supposed to be visible in
> the message.
>
> --
> With Best Regards,
> Andy Shevchenko
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
