Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A714C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 23:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2E782477;
	Fri, 15 Mar 2024 23:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOXM-Qfm0A0b; Fri, 15 Mar 2024 23:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B6C82479
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B6C82479;
	Fri, 15 Mar 2024 23:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81BB31BF362
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 23:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DF0F4036E
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 23:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upwQcfKRxqpM for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 23:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D2FE40298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D2FE40298
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D2FE40298
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 23:37:40 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 42FGUCKC031477; Fri, 15 Mar 2024 23:37:37 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3wvswmbdk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Mar 2024 23:37:36 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 42FNbMkT028518
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Mar 2024 23:37:36 GMT
Received: from UUSALE2C.utcmail.com (uusale2c.utcmail.com [10.220.63.38])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 42FNb5gL024616
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Mar 2024 23:37:21 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE2C.utcmail.com
 (10.220.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 15 Mar
 2024 19:37:10 -0400
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 15 Mar
 2024 19:37:10 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.144)
 by UUSALE29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Fri, 15 Mar 2024 19:37:10 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1891.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.54; Fri, 15 Mar
 2024 23:37:09 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::93a5:a91f:8d3e:a43e]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::93a5:a91f:8d3e:a43e%6]) with mapi id 15.20.7316.054; Fri, 15 Mar 2024
 23:37:09 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1] package/gmp: fix target
 build with host gcc 4.9
Thread-Index: AQHadLDk1cL51CGwXk6sednVeRgX3bE5SYuAgAAsHvA=
Date: Fri, 15 Mar 2024 23:37:09 +0000
Message-ID: <BN0P110MB16733D5E3C46F040E0016047EB28A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240312190954.71227-1-brandon.maier@collins.com>
 <c650fc8c-1040-44c6-b13a-4b7240d2544b@mind.be>
In-Reply-To: <c650fc8c-1040-44c6-b13a-4b7240d2544b@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1891:EE_
x-ms-office365-filtering-correlation-id: df11ac6f-eba4-4ec4-5e27-08dc4548d518
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x5g2bPe3bG2BRU95BNZW/qiGtOBV/66Qud49BeTV52K0DBBaPZz2lSCHGwmIgBqR/9hFRlsQ+SyeWZub7z1Y8vES5dS+WYicv0zz3MvsyDRsvKpSSlqLMIQTfJqgMsdLtrrIr5O3gvI2YngK9EpSNwCKea1gUlcf4AB/yiU+PbrpouSCIz2YD+enQSl6Og0mj7U+ZMwoBa6GE6O5sbZFwMbZzIoHQq/Ijgf9RB1KGD7zaqxzzInoczm6YjZpgRYNJ63a+oXSRPjzC/5lECiQ8COjeapPGRsZJLxiTsNmTdkTe6qIn0l4rgDRrWv26cghqLwDNuMx1xRKcqQTLUFu8JddGhj0JX+N6ObabF6cKW5XuSpMnoItyAAMWdAgqio+nhOzH0hhz8j8ZMncDj8VEwxEcHb/5SMa57GMN3fQAWx8F6Mp2DbHD5nQE5GYXrMW3xsnYc+cUsBmTtxPMwcxm31UmYwjPTNXLytj9xYN+iJrQJM024/SpX3Gj/g30GV464Wyp3yQhjh7ury8NWEw5MxZbRGVhh23TMGtAjx5tXS4Rx/edZj+17NlXTJl4sA1EstwMr9qMPeHYWchS2A+BHu+l5aYk8NT45Iuz27hRzBX2Bv4lRpLi+H54eGKCZpCVZRUV013e1+z4WrC8fILebiGWMEubBa2IYuKqjgn7TPK9NHQWu5cPAXzomjy9Q+NpbimEMzenwGeZUTmhVKvcPSub/lFh29nt8GcsHaUO1A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2VoRDJrK0tyRDJWNWIzNldvbmsrak53U2RBQjJqZ1MxWnJ3V3EvWGFaaFhS?=
 =?utf-8?B?MTVJejNGMHJUS0lIajlQRk1KUGl1UEFwZmpxOXl4M3I5UFo5azZiQjdyM2J3?=
 =?utf-8?B?bmRGb0poUTJ4MXlJQkZyMGg0cmxYQTNLWksrNVRiSTF0ZFdWWE9yT1NQNFFN?=
 =?utf-8?B?TkF3NWwyMzZkWEo5TzVCallsWFVtcTVjZVlRdjZLMzFVQWlXSkRRaTgwTXpz?=
 =?utf-8?B?c2RXbkc1aE5lVGh0YU5ZaEkzSWd1MGVBK0s1Z1FrdkRteDhpSkg2dnZSb1ZC?=
 =?utf-8?B?eVkvSzVjN1lwbXVKZGdpNnZBNDUrbUdGbjlFalFYQ25seXRHMHFjVHVpQmpw?=
 =?utf-8?B?NktKcGN1QUVsaStyZk0rLytPOFJ6N09XTU9heHowWUdvakFmWldSQ3R6MHRS?=
 =?utf-8?B?RnJJem5TdmdSUHRIeUFLVDIzMEhyV1BMMGdnSTJnbE1oUkFhZi96cXdXS0Jz?=
 =?utf-8?B?MVIrRjc2Y1A5VnZ0V1Ewa00xSmVRRGd3aE5XV01DYUkrY0VzMFk3LzZJY0pr?=
 =?utf-8?B?S04rdnR0bmYwRWhJQ05vOHpvTDRkSlYwZzViaE9jTVBNVXhlejN6RXJtZi9X?=
 =?utf-8?B?TUpHSjJSRGZETGRYdUJ0dmhybzNPUGNDUlRRK21qcVlWdTNYam1BUHBPTWx2?=
 =?utf-8?B?Y09qcWdyYzE2ZUxDSktiQUlVdWQ1bnYzRVRMQjQ5ZkZMYktORHR2eEUxYUp2?=
 =?utf-8?B?Z2I4UXJPc2kweWdCUE0vTEVrZzF3dFRUMkFqaHVaTlhlcWJ1cWUxSnltSWh1?=
 =?utf-8?B?M1lSY09JUDREMXlFaTFsQXRpcENhNXdHdTZuM1plTFlmZnFrTEpkU1FodjNM?=
 =?utf-8?B?ZlNvaC92YXBkc1RBQ0lXK0dqMGZockRmRGRmMWtWRXJubExBRmlkOEIyQmRC?=
 =?utf-8?B?Ym9lcjZHWW1LN0tFVm9CYTJTak16c1pLbC83NmxOSXI2MDBaVmVOaDJrTnZ2?=
 =?utf-8?B?WEtONGxuQWFQT29hb1VUK0ZxaWh1NWsyVThFMGd1K09XYlNEVzg0SHZpempu?=
 =?utf-8?B?R0NzWU5NR3c5eCt2bEtLQUFnYnRBRW5tSXFHY3pBN1VrUG01U0NaU3A4Q3pw?=
 =?utf-8?B?a0VIYVR0cjNmQjlBM2NGZUcxODROTzMrZHJsNUxITlE1dkYwTHFVQ2xnM0Uy?=
 =?utf-8?B?ZnFoY0phTVlKS0oxMVBGbnpWQ2N0UUkyaGFrVVQwTVlNdGV0KzZFaTFkUHQr?=
 =?utf-8?B?RXY4Wng4Z0pkQXBBZXplbFVUanhJbzNwRHBBL1lDYTQ0OTFVTnA2SG5yUkR3?=
 =?utf-8?B?YnFlV0VUcEpyK3JSY1BYTnVXN25DZHBtK3RFN1FmSnlCYjN1SmN6UTF3bFpq?=
 =?utf-8?B?aFcyOGEwSmRUU0hBaXlZS2ttdm91YXdRaHRUenlNcDRUUG5TdzdGWXk0K0tn?=
 =?utf-8?B?OWlLODRwWjRxajFmZzFVL08xMXpqWHk0V3dPVUxSdk9SZGRaQ0ExRnJMV3dB?=
 =?utf-8?B?YXcrZ094QU9uZ1l4MlN6Y3BxMUkrd242SnZIcmlTSXBvdXdUZjB6OVVoSVU0?=
 =?utf-8?B?ZWpCUUZDZmsyNnViZWwyNU1vby9NOHU1WHJCSWdLckJya0IycDNlRFFReE53?=
 =?utf-8?B?UkZYNXM1d3VRRXhhR1hCVTBKOWgvNGNUbkVDc0xGc0JlWHJjTGVpbXBFSFhs?=
 =?utf-8?B?Wm9rQ2ROYkFMc3lrTzZlUmZXbWxSWEtJTVlCWW41emZLRExwQ1dreWo5aTc3?=
 =?utf-8?B?WnhwUGhxeWx0YzNmNHg1UWhBRXlWMWg3RURQSHRUWkxXSGllQXA4OVhnbUxp?=
 =?utf-8?B?Vk1jTTAwSlhpS0VMS0dhbW1BT1BzUWRiV2tOTXNzTVREbE9DMVkweGZCVW5H?=
 =?utf-8?B?dGYzOVl1bG9abVduZGNXbnBPRlRRMmp0c1laLzhVVEQ0dXZNbXpHVzEwczdm?=
 =?utf-8?B?eVdQcUZDNzJLb0hQNWZWdFNhMDVJZGRZYnB0Q01BdnRaNXNWVmZJZlNVOEZn?=
 =?utf-8?B?eEpwa3lQcFZOT2ZIeVR4U1l1MnNsbjdGN2tibHlYK3FIU3Ivd0ZqN1ptZzhQ?=
 =?utf-8?B?NWp1NlMwcWYvMndhWEpTN2JPbkwzWEphQWdlcS9ndzRjd2Fid1Bzd1g3Z2dB?=
 =?utf-8?Q?a6rLCb?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=qAWzeogmVOCVMNOMPTb7C+UXVyaS70juugkg5YUSdhreOwjZy2XA4qe6Xn1EH3HnYRIIKYqO7A9RJ+Y7JeWQ4r2iQPrsIXF0P+FCYETmQ8cwsA54DAsUNImi/uIM1pAG19JIyy9vQ6xZ+zgK0iPUaVh5kyqifAIdhCXLy00dQ3F8R+NmMlbgdabSls8jhZhuv/LHt5/UnJ0I7ezZ41RWGYO/+Pw0D5AXjtCuUP7BY+l+spvnSr1MI4yTZ7dJooZ1b75KJF6UpmQCEC7fZIHjhWvS/B3pmXeQ76t5ywiFsYlXuvT2/FrW2+6gHfQgv7oltaJGn7qofVtkQl+5Do/gXQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZY+N3x6y+gnJfA3h7Qp0ENzH95MLiTYSr1t4klXfJdc=;
 b=ut8RNAqeUNcnvu1OLPzasJpszWyzDyH2LOIP59h40xm7xzlgpmlTHIpOSoixcTGUvg6+ELk1mzbQVZ0gphEDIZaH+Yz8OUzMLkHcsWJ4aIgWgbeGhUjOavXLqbYnWNbI1wLG7ZcKe761++icOdD9kipQ2wBgrHRghegCMfG+PozKfOZV+5aZF2WGB6gotq+QY6uhiqLZ9A4+x4cyk/OAQowEkyjlkuwSznVmzBQGSKQfFGXRhXgX64cFeaCiF7RzJoYnMWjgNkUHwCc0uY+KDnDDdQ6b0gEyf1o77L9RaQt0SubJcstCzPyzZ9ZQiB1FVh8P/m2cNlXZTOvyme/fSg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: K8xAKJhMR8iOHllBslBa0Bxh5xMI8NzNbftUujdk3BlCu1ECmIl802vBT2QekV80YUNF5SsnV/L0rL042k8WMcYc0twkfwV0DZOB+FrCXqyPUHMoopvR/BdrolJqpEpI+j4BAJvxzsfh3ea+Akg9MzL8S5mHjqPm7GOZN4T12Ka6GeW/ZGuimiv+ip3U5USu9vYyZue5vQl5/DW3fmxOJQFh16qYIo4vP9fsC/yoiQRaxf9xq4M4ghAxuLwRU6z5zcPt3Lc9mvuxaP5LvJ5cJIDCd9NBOEWu01EDKF4JtwUZesTfr2J7t+/M7rehL/rL6BM48pvPNun/nDmDFeh8B+CrB3gMGaNIDZKfXCE4Rx1+xyXTLYf6v45XFpEBX8sAjQ+f6gMiShkbr8cDbiRu/Dg3w3XvZZgdtxh9NL/6Q9LOXPQEL+nMz7B4VkLoAfphOqhbsYHpbq6o9A/Yud7yPvo9RBu6QFzZe63UfTlHxoXvfEiLdtKxA0Ha6pRlenaTUOfBW+8sxzhv16cJlAJ/nuYnxWsZoQLzIFHqqAEccthT8utH22JOxFbY3TbR6LkCY/DiwBLqlzZq0FAV1MndoThas3ED1WbIU0Zte9HSpXnrNdvDZAy0UIfXmOkSicwq
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: df11ac6f-eba4-4ec4-5e27-08dc4548d518
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2024 23:37:09.4720 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1891
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_08,2024-03-15_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_08,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403150189
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403150188
X-Proofpoint-ORIG-GUID: lK8615fyV1IEcehlujq5ppV2n_g84mQM
X-Proofpoint-GUID: lK8615fyV1IEcehlujq5ppV2n_g84mQM
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2403140000
 definitions=main-2403150188
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=6AmU97lJqlz3dQ3kNQJHzMnvQtnGEO2aGQbjBoW8WiE=;
 b=HT7aSWjLFReR7rmRwSCR6spteMXDNY4hqDj10bJ5ImeuPzjaKONphjvWX0aWfYsdtAFw
 Ta8H/iphJJOO9AWdi1fGc0H1C3B/GE8M+WCaRoHX8h2D/cboPdTTXsagFiYXDgWohnp5
 M9hU7s0+RSwdLq6EbG3K3DdDRW/MUw2I7C9W0XiTjtpKTundyZTaXKY+j5qKOX3Nubar
 5c48U9PSxPatOH/+7dg7COowi2muPfeG1KOuZK1eDqa29hMKnopvIiEUphpiPC+9QhV9
 /d9yBtAKr2TzSyxZvlzSY8aJzEzfwXYgqRNsDKNz2nyp63738l8sKCznERNlZ+/Oa80y zg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZY+N3x6y+gnJfA3h7Qp0ENzH95MLiTYSr1t4klXfJdc=;
 b=ii9EhNMK656/bL6QyONWAI+jGjwSyC53sxRdFNEToQTG779Ej1l25kecnCId44sZ1/CZrYIufn7q92SmonutSDt+ec4fFB2gZYplxFYLIBmZHCE1Rqvn+YH8dXPkRBoR0FZdhhg2vt0LFQvEhjOgqMSleO4pVUybiDjJO9jKT1I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=HT7aSWjL; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=ii9EhNMK
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] package/gmp: fix target
 build with host gcc 4.9
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
From: "Maier, Brandon Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon Collins" <Brandon.Maier@collins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Friday, March 15, 2024 3:44 PM
> To: Maier, Brandon Collins <Brandon.Maier@collins.com>;
> buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: [External] Re: [Buildroot] [PATCH 1/1] package/gmp: fix target build with
> host gcc 4.9
>
>
>
> On 12/03/2024 20:09, Brandon Maier via buildroot wrote:
> > GMP does not build if the host gcc is v4.9 due to the following error
>
>   Oh boy, are you still using host GCC 4.9? Poor man...

Yeah, it's not great

>
> >
> >    gen-sieve.c: In function 'setmask':
> >    gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or
> C11 mode
> >       for (unsigned i = 0; i < 2 * a * b; ++i)
> >       ^
> >    gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -
> std=gnu11 to compile your code
> >
> > The gen-sieve utility was added in GMP v6.3.0. It is built using
> > CC_FOR_BUILD (host compiler) during cross compilation as it generates
> > build files. Autoconf does not have a macro for add -std=c99 to
> > CC_FOR_BUILD, so it must be set manually.
> >
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> >   package/gmp/gmp.mk | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> > index bd401c6a80..85836a8c72 100644
> > --- a/package/gmp/gmp.mk
> > +++ b/package/gmp/gmp.mk
> > @@ -14,6 +14,11 @@ GMP_CPE_ID_VENDOR = gmplib
> >   GMP_DEPENDENCIES = host-m4
> >   HOST_GMP_DEPENDENCIES = host-m4
> >
> > +# The compiler for build requires C99 but GCC 4.9 defaults to C89
>
>   I don't think the comment is really needed.
>
> > +ifeq ($(BR2_HOST_GCC_AT_LEAST_5),)
>
>   In all the other places where we pass -std=c99, we do that unconditionally. So
> I'd do the same here.
>
> > +GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"
>
>   Don't you need something similar for host-gmp as well? All the rest I could
> have fixed up while applying, but I don't have a host gcc 4.9 with which to test
> host-gmp :-)

The issue only occurs when cross-compiling because Autoconf does not set -std=c99 for the host compiler. When host compiling, Autoconf uses the same compiler for target as host, and target it does correctly enable -std=c99 using AC_PROG_CC_C99. As far as I could find, there is no AC_PROG_CC_C99 equivalent for the host compiler.

That's my understanding anyway, I have very little experience dealing with Autotools.

Agree with the other comments, I can resend with those fixed.

Thanks,
Brandon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
