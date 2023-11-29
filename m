Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFD4C07E98
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 00:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA0740124;
	Wed, 29 Nov 2023 00:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA0740124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stQStprf0VhF; Wed, 29 Nov 2023 00:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8C840179;
	Wed, 29 Nov 2023 00:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8C840179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33F5A1BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 00:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 092CE40179
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 00:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 092CE40179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOE_u-sft2WK for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 00:00:50 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB25A40124
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 00:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB25A40124
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASL2x55017319; Wed, 29 Nov 2023 00:00:45 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3un62mb11w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Nov 2023 00:00:44 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph008rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3AT00L0E024157
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Nov 2023 00:00:21 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3AT00EBv028261
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Nov 2023 00:00:21 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 28 Nov
 2023 19:00:20 -0500
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 28 Nov
 2023 19:00:20 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.152)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Tue, 28 Nov 2023 19:00:20 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB2292.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.38; Wed, 29 Nov
 2023 00:00:19 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9321:c5a1:ca0e:86c0]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9321:c5a1:ca0e:86c0%3]) with mapi id 15.20.7002.037; Wed, 29 Nov 2023
 00:00:19 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [External] Re: [PATCH 1/1] ppd-merge: speed up per-package-rsync
Thread-Index: AQHaIYLsV8AJIpANYk65UyS8zIN2bbCQOraAgAAt89A=
Date: Wed, 29 Nov 2023 00:00:19 +0000
Message-ID: <BN0P110MB16733141A3FF6E7AC5BD8847EB83A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20231127224139.35969-1-brandon.maier@collins.com>
 <20231128210717.GA107928@scaer>
In-Reply-To: <20231128210717.GA107928@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB2292:EE_
x-ms-office365-filtering-correlation-id: 5dfe0c30-63d0-4bbc-136d-08dbf06e2cbf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CxDY699sku4QW4Q8hzvjvhdtlvO0gfi3F3LIKnz5up9APfuokFH7sZQxEHzUA3NLyoPFQk1v7iZOkg3Zl9klO2ccvHKCspA169iyMNlu33VbsO7dRjtaOr0rfBqbzJCep6TpKe6mmzszRAxfb+PDwLLhGc9kKv3UUBps15hSeO4vR1dek27RS7t7dVCp8I+PXeqo0g5Trv7GKU4kxngnpvYA0uL7yt3aQst4rhHBS6d4BMEMTcbCmjV4k/L0jmPeIX2BhJPVvq2+LlNx4gdFRgdUPfTnbvT7vJ3UjqIVVWe2nWwHYpIMOY6Jb9wkKm21vX+pQ9Fo9xsDOINQU+F7/hiULAPKC1GFLkYS5zuy/4xcNlAmp7Pi7z/uMHYOR2L2ssPLfu0SbltuLx5QrBHc1JKHU+QVuOX9LBL5oNlrW5NhR+UbHSDV655edF96g3Y6rq2GNNP2P3viMy6afztNTThTj2EkEceL+ld7xsJ8LjbFY6zzyz9msvEnRNuKlgRFBb6p7aCDlTeFmFfrSGxNL12B9bg2BBCVADARK95RpIVEHUVE4EuODvOocJUYqSulvctCq7foaEU3ClpHpWkCJiPtpbWnxpmmayfyiaBP+FFHtEhZ+kt5wZFGBf1sANIVst0Of33CAOKx+NCy4GQyVQxIyXP/uOvq8JB6Xb/BV62JWlQYuVfZj8HeSeBZf21Kr8nY8N7vo0vxVLLCYq9EaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(451199024)(55016003)(38070700009)(4001150100001)(122000001)(33656002)(5660300002)(2906002)(86362001)(53546011)(9686003)(71200400001)(83380400001)(82960400001)(38100700002)(7696005)(26005)(6506007)(76116006)(52536014)(966005)(498600001)(66946007)(4326008)(8676002)(8936002)(66476007)(6916009)(64756008)(66446008)(66556008)(54906003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUtiQXoxbnJEcjZwZjJ2VzNkd0xST1lHaGFUSnFGcGpLRXNXVjlSelU2NFVj?=
 =?utf-8?B?MEJRL1B3MlpOc2FwNWM4YVo3b2NHNEpwUXNLOWs4SHFvWUhPNi9ZQ1NQZXdy?=
 =?utf-8?B?bW1tR1FzZ2ZlRm1vZkdhaFh6UWZqNExUdFkzRnNBL0xrZXcxOGtvU05Tb3pC?=
 =?utf-8?B?b1RjRWZkd3EybXRqTGdWNXN3ZHNTQkNRK092V29RTEo4TTRXYkRwbVo3eEhk?=
 =?utf-8?B?dFdRcm9NNG9oNElrczlYRnJ6cTlCUU9vbHZEQi9nTjBIV0VMT0Y1TnlFTkR1?=
 =?utf-8?B?TmlONEtHWlY2OEFlS2JnQ1IvcnR5Mkh3OEtrWnE1aEsrRWU0MktkQkRqc3My?=
 =?utf-8?B?d2VOaWdjUEQ4ZnQ0dDlIYUdqYlJSSGpRMVErT2xsV0RnK2NVdEVHNHdyWU1Z?=
 =?utf-8?B?L1JhZGZicHRCM2N6RGlXL1F2V1RwQ0t6TlFRb2IzQ0YzUXNsT3JXVjBXRkVK?=
 =?utf-8?B?ZUgyTHlOOGtVNXdkZGlOQlEyMlBLREhEZDkrTXg1YW5rMnV6WjVQbWdueWlt?=
 =?utf-8?B?VUs5eHNxS2VQOXJiNlNJU04rU25YWUw3QU96WFQ5SjBsZDNvdFVpUzZJNG1q?=
 =?utf-8?B?d2lCTnd1MWE5SkhZU3A2OXpkMmVvVHo5Z1l3TUlWL3VTWGFqeVEyL2JiMThX?=
 =?utf-8?B?SVBNRUEyZFNhWVFUdHpNSFBDc0xwOUlJdThXSFVwdFFLMW1hdXJoQm02MDRr?=
 =?utf-8?B?ZFB2N3pVMlN1Tld2dXN4MGRnWXNmL0tsb0I3aE5TZXgrbXlCT1g3NUNQYi8y?=
 =?utf-8?B?cy9rS0ZxZFk3blBFK0g3K0dMc2djNDFpQ0l2Zm5pSm8xQ3Mzd2NQOXZWd3Fm?=
 =?utf-8?B?TFEwZitaTXFPYjJRd29VSWtuQUo2VmplR2ZVWGdJQ2xXR2M5Y3dRanl6NlF2?=
 =?utf-8?B?QWZkNVgzT2VBOTVua0tqcXlLcmt1SEdzcS9RRTg2eGZRSVNhcTlDSVhXdG83?=
 =?utf-8?B?ZVFyS2h5ZTZXMjUveWlhSEdxdkhvbDFlZWJUMEE1MWtxOEQ3Ly9MbG9NdlFk?=
 =?utf-8?B?NGw1UFVJSjhTVkVyWXIrVUFmWlpLMFJ0NlR4TEQxa05lS0RJT3dQcVpoUHVV?=
 =?utf-8?B?alJCZXFHTjhybHdHRTI0N1VoWDhUc3lpenU3cm44Vm94eWNYVkFOOVpRWmps?=
 =?utf-8?B?dlhLSVdrZitKT2hvdVNQOXJQZWZER0szbGE1ZVQrbVg4M3dMRGQ1ZUlyZStH?=
 =?utf-8?B?WmM1NU1UbUg3NnBZUjVPS0N5b2RoTlhjU0JoeUsreHYwMEZ1SUhwYVYyM1FJ?=
 =?utf-8?B?WnhjWThjZnlueExUTUtERUNJYzVzb0xJN3JlUlZGUitib2kremo5NnZmMnlI?=
 =?utf-8?B?VkV0NWN6YWNJT3ZmeGw3M2ZhVzVNZ1R0SzUwKy9QVkNmZ21reXhEbGY5UzhT?=
 =?utf-8?B?MXBIdTYrTGtqbTZkNlljajkrMG9KZkNnUU5mSWYza29qU0gvR1FucTR5V3J0?=
 =?utf-8?B?QVFvN0d2SXV4azh0M0xyV1p2bkl2VEk2dVhtS0hKb2tPK2I0MG9yVDJjWXQ0?=
 =?utf-8?B?eFFjSDdRajJIVisybGN5Z08vY09qVTBVaFp0UHZIQUp6UERBZUhMUlRueTdP?=
 =?utf-8?B?T01kWUhLdjZoRUdEakxJaXk4d2haYUdwdHZKVE9HMUtVLzA1eHlMOVJrcUhv?=
 =?utf-8?B?ME1PRUVEYzZkV1dzT09FL0hZekQ5dHQ2SVdGZ2ZZRzdlOFFGRXJjTFlQTU84?=
 =?utf-8?B?SWJ2VWtpd0pRb2l2L2lkZmorYWlpbU16eWFuaHF1RkhxbTMyWHpYWHZhSDR0?=
 =?utf-8?B?cjlZb3dQYk5ac0dUY2xLQ0RzUTFVVmZmYno3dllHdVowa2cxZEY4NlI1dU50?=
 =?utf-8?B?cFpsYmlYaURqN3hpVVF5dEFRNXRVbi85V1pqS1VlWkEvbUFBZ3BlRTZTUE1P?=
 =?utf-8?B?T3hBc05yQjhaTHM5eU5CMEIyMExoOW9LM1ZzWG8zZ1RiZ3JjelRFaGlvUkVE?=
 =?utf-8?B?dG5hc1hoSjJTYUdZODR2MExtMkhldUt0YkdPc3BUbFoyWG5VbDBDdEVTbDlD?=
 =?utf-8?B?dGE0VTByejhvWUR0MFloTnpvVVRHeURIMUkwd3BRdU1kSW9nMWlKR1BYWWtp?=
 =?utf-8?Q?1EvCap?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ey2J68FsiYPbjWybr48ANFuoQU43AE9OWrrcEyHXveEApIRuQHcwQkM9VpftAK1OCOC3cJRw6n5B51mnIIYvdXk82mIayWGBolbnidMtOpPFc7t0R2t7aDQ7VyXSq2KOfTewtVa2hWke9pmc+3mI24E+jMeyhJJiQcXhfjKjd97b7SScORMrZVNsnHqKK7pFmnLLU76AjAbEvOXyUmhJnm87xwks7IgA63HkejDRzJejFzleaQ4xcUciRwQL5cges0bc6KboHqPmVbYQhJ2Ehw/hex5cbvOa/aYApgNz6JKS26ZWHVws1qLFZV5gFZ8nG92DIOdehqrvTvF3ur7iAA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDiOi3Ob6EpeXkadjz2UESwuKOvibIt2hXeSFyci7Uw=;
 b=PmuuV/St4tuUvV8sq69LvhxDVJUoEMSTnU//AklS4j9fpdv9rsOR2j2sfzAHx5lbml90IkKxEq5qBAlZqaVFhMzWISk9HtQ7NRwGjPyJrjAVsk6vPAKf1jz6Qd1zY3laU6pNz6ZB8/FzMff4zpumpCMkmrEEct0OpBvKkqIBitQE6+zzb0BbtXNF5OY7Bf8PaRlTM6+DpGKWCNLheoCuVRV6pluVq309LrTJXq0DhHi68xHvzZ5T2bfkon4PsikILeOQVopLVXym8Swsvgw+fdeWELDmNf7c12zwxOGQPJFpUcz4phTgLO506/fFdyWRo1Mdjx+2rZscSaNCSgnSiQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: 8VTailrIsouREbRafJhna4HomYJ3dcK5WzaeBq/FmUeS3dk3R7Y3rGpbheJtib/djWhSHJdILcvm6zt7xMXhxGBNyELCmYfrMJEq1QIEAV8XVMBEKeGjfPPiW2o0+ygnaHwqC51RU3EVpR00b/dPqm2YmU9HvDxe/mcrVwvoQMLKfNMUGZ4TJMubUK1CTS59vUytv5AgD9XBS5E+CG+gDRD1pgh1b4udiRa2MAuSWFktDd/P9CDJQpFU3sq5ENE+Hwbb0D4HIb7B25TthGTjLVurHBOY6M+d17mGcXQQiBgETU32d5Sh9yGvu47FYKYGp0feicaWhcljCIVf6XOz434P2Ei9v/2gbXeuRw1Rc6T4RtlVMoLIrmATXYBwGqC6KZ78mfh/HiJszNmh9c/qLllxZoeW7qhy4ktRHga7YLWUW3o4T2fiZ/PKdVu2Nfn1KbFTKBTf6c81tGUTzsWzJfxq6nCeXh+saGUbTPX1/WK2u/JAWcatfYZCIXrZRXpML3VeqcK2ukHigoLdKZit0cKdJKCn8ryrX4icAlH7kUKVIC7KD9hjOZo4re65GezBfYOryQQaEpo26YK3a1FNQEMkooKFF+ioPv6kdTtHaM7uenoHx//fbTY7zrG3ZxfgjqnOGmCL7ORG7r+4Mv5BDjKNoVoQ9Ssvn5di/pFYNOTNu1sh0Ie4EWT2IMigUKEhynkk5U7jhM+4yQrJ0bbWzJyb8etHrbYXI97E8UfAkdndcogQT5a+aRmTCalyETF0K0ZdaMX/C5KNJcdOeb9xnnSnXVFsya8Y9jzYH9TclfT7DOhVi9tngLw5lOsbhOEy
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 5dfe0c30-63d0-4bbc-136d-08dbf06e2cbf
x-ms-exchange-crosstenant-originalarrivaltime: 29 Nov 2023 00:00:19.0507 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB2292
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_25,2023-11-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_25,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280188
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280188
X-Proofpoint-GUID: N9Lj3m45BcEK4_m8u8Ttv6JH6yRU9jkj
X-Proofpoint-ORIG-GUID: N9Lj3m45BcEK4_m8u8Ttv6JH6yRU9jkj
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=jbEl1Y+0HKcVr8lHAQdpyQFftZofeqOq5GzYKI6s1Dk=;
 b=NHafm7js8T7U0tZskQh08VqY/nugoNmfV6SrDmKi3HtYa7Vzzd6Nt+gYQ0WtJWSgikzL
 pfMxN/We/kVgbK/KRPu+Up2kssyYD7R4sdy53Nvyye7QGauSwVz70frLDwgA9rQj3x05
 8WEyoAbYMitbsZF9zhdyNyG9mfNPiCSbw6eTEs6oQEO+L6vJ4KcNYGEDJ4Zn/C48U0EJ
 hkr/fyU4h9/uZFf+rdnh8lQ7OVuDq4jDSyg/5VYwf2Ma/QH322Bm7wnfhXtma++xf/Xu
 NzrvdN5VF/+EHUb3P4qDFMbG/A2NJBQBNtemZqd7ptBKgi+G8C6E5wv6caMt4CxJ3k9k Ng== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDiOi3Ob6EpeXkadjz2UESwuKOvibIt2hXeSFyci7Uw=;
 b=R+MYF+3kizFK/iE1hYw6BjH84LPawDpoazSUQqa4PXnYugW/jZj0SrjwE2Lt3wWu1wbfjbT15Y22kdWSB0e/CSAm9aqPPhhavXbbDA5RDNPdA+hNXBTcF1ywfWshv2T+LePn7t4AyexVcMrYvBw3/xNSuvxF5CKVK2M69czFRL4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=NHafm7js; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=R+MYF+3k
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1i
ZXIgMjgsIDIwMjMgMzowNyBQTQ0KPiBUbzogTWFpZXIsIEJyYW5kb24gTCBDb2xsaW5zIDxCcmFu
ZG9uLk1haWVyQGNvbGxpbnMuY29tPg0KPiBDYzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmc7IEhl
cnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPjsNCj4gVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4NCj4gU3ViamVjdDogW0V4dGVybmFsXSBS
ZTogW1BBVENIIDEvMV0gcHBkLW1lcmdlOiBzcGVlZCB1cCBwZXItcGFja2FnZS1yc3luYw0KPg0K
PiBCcmFuZG9uLCBBbGwsDQo+DQo+ICtUaG9tYXMgZm9yIHRoZSBpbnRpYWwgd29yayBvbiB0aGlz
IHRvcGljDQo+DQo+IE9uIDIwMjMtMTEtMjcgMjI6NDEgKzAwMDAsIEJyYW5kb24gTWFpZXIgc3Bh
a2UgdGh1c2x5Og0KPiA+IFRoZSBwZXItcGFja2FnZS1yc3luYyBzdGFnZSBjYW4gYWRkIGEgc2ln
bmlmaWNhbnQgYW1vdW50IG9mIHRpbWUgdG8NCj4gPiBidWlsZHMuIFRoZXkgY2FuIGFsc28gYmUg
YW5ub3lpbmcgYXMgdGhlIHNsb3dlc3QgcnN5bmNzLCB0aGUgZmluYWwNCj4gPiB0YXJnZXQtZmlu
YWxpemUgYW5kIGhvc3QtZmluYWxpemUgc3RhZ2VzLCBydW4gb24gYG1ha2UgYWxsYCB3aGljaCB3
ZSB1c2UNCj4gPiBmcmVxdWVudGx5IGR1cmluZyBkZXZlbG9wbWVudC4NCj4gPg0KPiA+IFRoZSBw
ZXItcGFja2FnZS1yc3luYyBpcyBzbG93IGJlY2F1c2UgaXQgbGF1bmNoZXMgYSBuZXcgcnN5bmMg
Zm9yIGVhY2gNCj4gPiBzb3VyY2UgdHJlZSwgYW5kIGVhY2ggcnN5bmMgbXVzdCByZXNjYW4gdGhl
IGRlc3RpbmF0aW9uIGRpcmVjdG9yeSBhbmQNCj4gPiBwb3RlbnRpYWxseSBvdmVyd3JpdGUgZmls
ZXMgbXVsdGlwbGUgdGltZXMuIFNvIGluc3RlYWQgd2UgbWFudWFsbHkgd2Fsaw0KPiA+IHRoZSBz
b3VyY2UgdHJlZXMgdG8gZmluZCBvbmx5IHRoZSBmaWxlcyB0aGF0IHNob3VsZCBiZSB3cml0dGVu
IHRvIHRoZQ0KPiA+IGRlc3RpbmF0aW9uLCB0aGVuIGZlZWQgdGhhdCB0byBhIHNpbmdsZSBpbnN0
YW5jZSBvZiByc3luYy4NCj4NCj4gU29ycnksIEkgaGF2ZW4ndCBsb29rZWQgaW50byB0aGUgc2Ny
aXB0IGluIGRldGFpbHMsIGJ1dCB3aHkgY2FuJ3Qgd2UNCj4ganVzdCBkbyBzb21ldGhpbmcgbGlr
ZToNCj4NCj4gICAgIHJzeW5jIC1hIFwNCj4gICAgICAgICAtLWhhcmQtbGlua3MgXA0KPiAgICAg
ICAgICQoaWYgJChmaWx0ZXIgaGFyZGxpbmssJCg0KSksIFwNCj4gICAgICAgICAgICAgLS1saW5r
LWRlc3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLywgXA0KPiAgICAgICAgICAgICAk
KGlmICQoZmlsdGVyIGNvcHksJCg0KSksIFwNCj4gICAgICAgICAgICAgICAgICQoZW1wdHkpLCBc
DQo+ICAgICAgICAgICAgICAgICAkKGVycm9yIHBlci1wYWNrYWdlLXJzeW5jIGNhbiBvbmx5ICJj
b3B5IiBvciAiaGFyZGxpbmsiLCBub3QgIiQoNCkiKSBcDQo+ICAgICAgICAgICAgICkgXA0KPiAg
ICAgICAgICkgXA0KPiAgICAgICAgICQocGF0c3Vic3QgJSwgJChQRVJfUEFDS0FHRV9ESVIpLyUv
JCgyKS8sICQoMSkpIFwNCj4gICAgICAgICAkKDMpDQo+DQo+IHJzeW5jIGNhbiB0YWtlIG11bHRp
cGxlIHNvdXJjZXMsIGFuZCBpcyB1c3VhbGx5IHByZXR0eSBmYXN0LCBzbyBJIHdvdWxkDQo+IHZl
cnkgbXVjaCBwcmVmZXIgdGhhdCB3ZSBkbyBub3QgaW52ZW50IG91ciBvd24gdG9vbGluZyBpZiBh
IHNpbmdsZSByc3luYw0KPiBjYW4gZG8gdGhlIGpvYi4NCg0KSSBvcmlnaW5hbGx5IHRob3VnaHQg
dGhpcyB3YXNuJ3QgcG9zc2libGUsIGJlY2F1c2UgIi0tZGVzdC1saW5rIiBvbmx5IHN1cHBvcnRz
IHVwIHRvIDIwIGlucHV0IHRyZWVzLiBIb3dldmVyIGl0IGxvb2tzIGxpa2UgYmF0Y2hpbmcgdXAg
dGhlIHJzeW5jJ3MgaW50byBncm91cHMgb2YgMjAsIHdhbGtpbmcgdGhlIHRyZWVzIGJhY2t3YXJk
cywgYW5kIHVzaW5nICItLWlnbm9yZS1leGlzdGluZyIgbWFrZXMgaXQgcG9zc2libGUgdG8gcmVj
cmVhdGUgdGhlIG9yaWdpbmFsIGJlaGF2aW9yIHdpdGggbXVjaCBsZXNzIGNvZGUuIFNvbWUgcHJl
bGltaW5hcnkgYmVuY2htYXJrcyBpdCBydW5zIG9ubHkgYWJvdXQgMjAlIHNsb3dlciwgd2hpY2gg
aXMgc3RpbGwgc2lnbmlmaWNhbnRseSBiZXR0ZXIgdGhlbiB0aGUgb3JpZ2luYWwgdmVyc2lvbi4N
Cg0KSSB3aWxsIG1ha2Ugc29tZSB1cGRhdGVzIGFuZCBzdWJtaXQgYSB2Mi4NCg0KPg0KPiBBbHNv
LCB0aGUgY29weSBzaXR1YXRpb24gaXMgbm93IG9ubHkgZXZlciBuZWVkZWQgd2hlbiB3ZSBhZ2dy
ZWdhdGUgdGhlDQo+IGZpbmFsIHRhcmdldCBhbmQgaG9zdCBkaXJlY3Rvcmllcywgd2hpbGUgdGhl
IGhhcmQtbGlua2luZyBjYXNlIGlzIHVzZWQNCj4gd2hlbiBhc3NlbWJsaW5nIGVhY2ggcGVyLXBh
Y2thZ2U7IHNvIHRoZXJlIGlzIG5vIHBvaW50IGluIGJlbmNobWFya2luZw0KPiB0aGUgY29weSBt
b2RlIGZvciB0aGUgcGVyLXBhY2thZ2UgcHJlcGFyYXRpb24sIG9yIHRoZSBoYXJkLWxpbmtpbmcg
Zm9yDQo+IHRoZSBmaW5hbCB0YXJnZXQgYW5kIGhvc3QgYXNzZW1ibGluZy4NCg0KSSB3YXMganVz
dCB1c2luZyBpdCBhcyBhIHN0YXRpYyBiZW5jaG1hcmsgdG8gY29tcGFyZSB0aGUgcGVyZm9ybWFu
Y2Ugb2YgdGhlIG5ldyB2cyBvbGQgaGFyZGxpbmtpbmcgYW5kIG5ldyB2cyBvbGQgY29weWluZy4g
SXQgaXMgbm90IG1lYW50IHRvIHJlZmxlY3QgcmVhbCB3b3JsZCBpbXByb3ZlbWVudHMsIGFzIHRo
b3NlIHdpbGwgdmFyeSB3aWxkbHkgd2l0aCB3aGljaCBwYWNrYWdlcyBhIGRlZmNvbmZpZyBpcyB1
c2luZy4NCg0KPiBIZXJ2w6ksIFRob21hcywgZG8geW91IHJlbWVtYmVyIGlmIHdlIGV2ZXIgYWRk
cmVzc2VkIHVzaW5nIGEgc2luZ2xlIHJzeW5jDQo+IHJhdGhlciB0aGFuIG11bHRpcGxlIG9uZXMg
aW4geW91ciBwcmV2aW91cyB3b3JrIG9uIHRoZSB0b3BpYywgYW5kIGlmIHNvLA0KPiB3aHkgd2Ug
ZGlkIG5vdCB1c2UgdGhhdD8NCj4NCj4gUmVnYXJkcywNCj4gWWFubiBFLiBNT1JJTi4NCj4NCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNzU1IHN1cHBvcnQvc2NyaXB0cy9wcGQtbWVyZ2Uuc2gNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy11dGlscy5tayBiL3BhY2thZ2UvcGtnLXV0aWxz
Lm1rDQo+ID4gaW5kZXggMDU5ZTg2YWUwYS4uMzk2OGNhYmViZCAxMDA2NDQNCj4gPiAtLS0gYS9w
YWNrYWdlL3BrZy11dGlscy5taw0KPiA+ICsrKyBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rDQo+ID4g
QEAgLTIxNiwxOSArMjE2LDkgQEAgaWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMp
LHkpDQo+ID4gICMgJDM6IGRlc3RpbmF0aW9uIGRpcmVjdG9yeQ0KPiA+ICAjICQ0OiBsaXRlcmFs
ICJjb3B5IiBvciAiaGFyZGxpbmsiIHRvIGNvcHkgb3IgaGFyZGxpbmsgZmlsZXMgZnJvbSBzcmMg
dG8gZGVzdA0KPiA+ICBkZWZpbmUgcGVyLXBhY2thZ2UtcnN5bmMNCj4gPiAtICAgbWtkaXIgLXAg
JCgzKQ0KPiA+IC0gICAkKGZvcmVhY2ggcGtnLCQoMSksXA0KPiA+IC0gICAgICAgICAgIHJzeW5j
IC1hIFwNCj4gPiAtICAgICAgICAgICAgICAgICAgIC0taGFyZC1saW5rcyBcDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAkKGlmICQoZmlsdGVyIGhhcmRsaW5rLCQoNCkpLCBcDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tbGluay0NCj4gZGVzdD0kKFBFUl9QQUNLQUdFX0RJUikv
JChwa2cpLyQoMikvLCBcDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICQoaWYgJChm
aWx0ZXIgY29weSwkKDQpKSwgXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICQoZW1wdHkpLCBcDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JChlcnJvciBwZXItcGFja2FnZS1yc3luYyBjYW4gb25seQ0KPiAiY29weSIgb3IgImhhcmRsaW5r
Iiwgbm90ICIkKDQpIikgXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICApIFwNCj4g
PiAtICAgICAgICAgICAgICAgICAgICkgXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgJChQRVJf
UEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLyBcDQo+ID4gLSAgICAgICAgICAgICAgICAgICAkKDMp
JChzZXApKQ0KPiA+ICsgICBQRVJfUEFDS0FHRV9ESVI9JChQRVJfUEFDS0FHRV9ESVIpIFwNCj4g
PiArICAgICAgICAgICAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3BwZC1tZXJnZS5zaCBcDQo+
ID4gKyAgICAgICAgICAgJCgyKSAkKDMpICQoNCkgJCgxKQ0KPiA+ICBlbmRlZg0KPiA+DQo+ID4g
ICMgcHJlcGFyZXMgdGhlIHBlci1wYWNrYWdlIEhPU1RfRElSIGFuZCBUQVJHRVRfRElSIG9mIHRo
ZSBjdXJyZW50DQo+ID4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9wcGQtbWVyZ2Uuc2gg
Yi9zdXBwb3J0L3NjcmlwdHMvcHBkLW1lcmdlLnNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA3NTUN
Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5lYjFjYWY5ZTUyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9wcGQtbWVyZ2Uuc2gNCj4gPiBAQCAtMCwwICsxLDE1NCBA
QA0KPiA+ICsjIS9iaW4vYmFzaA0KPiA+ICsjIE1lcmdlIGEgc2V0IG9mIEJ1aWxkcm9vdCBwZXIt
cGFja2FnZS1kaXJlY3RvcmllcyAoUFBEKSBpbnRvIGEgc2luZ2xlDQo+ID4gKyMgZGVzdGluYXRp
b24gZGlyZWN0b3J5Lg0KPiA+ICsjDQo+ID4gKyMgcHBkLW1lcmdlIHNjYW5zIHRocm91Z2ggYWxs
IHRoZSBQUEQgYW5kIGJ1aWxkcyBhIHRhYmxlIG9mIHdoaWNoIGZpbGVzDQo+IGZyb20NCj4gPiAr
IyBlYWNoIHNvdXJjZSBkaXJlY3Rvcnkgd2lsbCBiZSB3cml0dGVuIHRvIHRoZSBkZXN0aW5hdGlv
biBkaXJlY3RvcnkuIEl0IGZlZWRzDQo+ID4gKyMgdGhhdCB0YWJsZSBpbnRvIHJzeW5jIHRvIHRl
bGwgaXQgZXhhY3RseSB3aGljaCBmaWxlcyB0byBjb3B5Lg0KPiA+ICsjDQo+ID4gKyMgRXhhbXBs
ZToNCj4gPiArIyAgIHBwZC1tZXJnZSByZXBsYWNlcyB0aGUgb3JpZ2luYWwgbWV0aG9kIG9mIG1l
cmdpbmcgUFBEIHRoYXQgcmFuIG1hbnkNCj4gcnN5bmMNCj4gPiArIyAgIGNvbW1hbmRzIGxpa2Ug
YmVsb3cuDQo+ID4gKyMNCj4gPiArIyAgID4gcnN5bmMgLWEgLS1saW5rLWRlc3Q9JFBFUl9QQUNL
QUdFX0RJUi9wa2ctMS9ob3N0LyBcDQo+ID4gKyMgICA+ICAgICAkUEVSX1BBQ0tBR0VfRElSL3Br
Zy0xL2hvc3QvIGRlc3QvDQo+ID4gKyMgICA+IHJzeW5jIC1hIC0tbGluay1kZXN0PSRQRVJfUEFD
S0FHRV9ESVIvcGtnLTIvaG9zdC8gXA0KPiA+ICsjICAgPiAgICAgJFBFUl9QQUNLQUdFX0RJUi9w
a2ctMi9ob3N0LyBkZXN0Lw0KPiA+ICsjICAgLi4uDQo+ID4gKyMgICA+IHJzeW5jIC1hIC0tbGlu
ay1kZXN0PSRQRVJfUEFDS0FHRV9ESVIvcGtnLW4vaG9zdC8gXA0KPiA+ICsjICAgPiAgICAgJFBF
Ul9QQUNLQUdFX0RJUi9wa2ctbi9ob3N0LyBkZXN0Lw0KPiA+ICsjDQo+ID4gKyMgICBUaGUgZXF1
aXZhbGVudCBjb21tYW5kIHdpdGggcHBkLW1lcmdlIGlzDQo+ID4gKyMNCj4gPiArIyAgID4gUEVS
X1BBQ0tBR0VfRElSPSRQRVJfUEFDS0FHRV9ESVIgXA0KPiA+ICsjICAgPiAgICAgcHBkLW1lcmdl
LnNoIGhvc3QgZGVzdC8gaGFyZGxpbmsgXA0KPiA+ICsjICAgPiAgICAgcGtnLTEgcGtnLTIgLi4u
IHBrZy1uDQo+ID4gKw0KPiA+ICtzZXQgLWV1byBwaXBlZmFpbA0KPiA+ICsNCj4gPiArdXNhZ2Uo
KSB7DQo+ID4gKyAgICBjYXQgPDxFT0YgPiYyDQo+ID4gK1VzYWdlOg0KPiA+ICsgIHBwZC1tZXJn
ZS5zaCA8aG9zdHx0YXJnZXQ+IDxkZXN0aW5hdGlvbj4gPGhhcmRsaW5rfGNvcHk+IDxwa2ctDQo+
IG5hbWU+Li4uDQo+ID4gKw0KPiA+ICsgIFBFUl9QQUNLQUdFX0RJUiBtdXN0IGJlIGRlZmluZWQg
aW4gdGhlIGVudmlyb25tZW50Lg0KPiA+ICsNCj4gPiArICBNZXJnZXMgZWFjaCBkaXJlY3Rvcnkg
Zm9yIDxwa2ctbmFtZT4gYXQNCj4gPiArICAiXCRQRVJfUEFDS0FHRV9ESVIvPHBrZy1uYW1lPi88
aG9zdHx0YXJnZXQ+LyIgaW50byA8ZGVzdGluYXRpb24+Lg0KPiA+ICtFT0YNCj4gPiArICAgIGVj
aG8gIkVycm9yOiAkKiIgPiYyDQo+ID4gKyAgICBleGl0IDENCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c2VhcmNoX3N1YnRyZWVzKCkgew0KPiA+ICsgICAgIyBVc2UgYGZpbmRgIHRvIHdhbGsgYWxsIHN1
YnRyZWVzIGFuZCBwcmludCB0aGVpciBjb250ZW50cyBpbiBgcnN5bmNgDQo+ID4gKyAgICAjICct
LXJlbGF0aXZlJyBwYXRoIHN5bnRheC4gRmlsdGVyIHBhdGhzIHRocm91Z2ggYXdrIHNvIHdlIGRp
c2NhcmQgYW55DQo+ID4gKyAgICAjIGR1cGxpY2F0ZSBmaWxlcyBmb3VuZCB3aGlsZSB3YWxraW5n
IHN1YnRyZWVzLg0KPiA+ICsgICAgKGNkICIkUEVSX1BBQ0tBR0VfRElSIiAmJiBmaW5kICIke3N1
YnRyZWVzW0BdfSIgLW1pbmRlcHRoIDEgLXByaW50Zg0KPiAiJUgvLi8lUFwwIikgXA0KPiA+ICsg
ICAgICAgIHwgYXdrICcNCj4gPiArICAgICAgICBCRUdJTiB7DQo+ID4gKyAgICAgICAgICAgIFJT
PSJcMCI7DQo+ID4gKyAgICAgICAgICAgIE9SUz0iXDAiOw0KPiA+ICsgICAgICAgICAgICBGUz0i
L1xcLi8iOw0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAg
IGlmICghKCQyIGluIGZvdW5kKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgZm91bmRbJDJdPTE7
DQo+ID4gKyAgICAgICAgICAgICAgICBwcmludDsNCj4gPiArICAgICAgICAgICAgfQ0KPiA+ICsg
ICAgICAgIH0nDQo+ID4gK30NCj4gPiArDQo+ID4gK3JzeW5jX2hhcmRsaW5rKCkgew0KPiA+ICsg
ICAgIyByc3luYyBoYXJkbGlua2luZyB3aXRoIC0tbGluay1kZXN0IGhhcmQgY2FwcyBhdCAyMCBz
dWJ0cmVlcy4gQmF0Y2ggdXAgdGhlDQo+ID4gKyAgICAjIGlucHV0IGZpbGVzIGluICR0bXBkaXIg
dW50aWwgd2UgaGF2ZSAyMCBzdWJ0cmVlcywgdGhlbiBmbHVzaCB0aGVtIHdpdGgNCj4gYW4NCj4g
PiArICAgICMgcnN5bmMgY2FsbC4NCj4gPiArICAgIHRtcGRpcj0kKG1rdGVtcCAtZCkNCj4gPiAr
ICAgIGF3ayAtdiB0bXBkaXI9IiR0bXBkaXIiICcNCj4gPiArICAgICAgICBmdW5jdGlvbiBta2Zp
bGVzKCkgew0KPiA+ICsgICAgICAgICAgICBvdXRfZmlsZT10bXBkaXIgIi8iIGkgIi5maWxlcyI7
DQo+ID4gKyAgICAgICAgICAgIHN1YnRyZWVzX2ZpbGU9dG1wZGlyICIvIiBpICIuc3VidHJlZXMi
Ow0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBmdW5jdGlvbiBiYXRjaF9vdXQoKSB7DQo+
ID4gKyAgICAgICAgICAgIGNsb3NlKG91dF9maWxlKTsNCj4gPiArICAgICAgICAgICAgY2xvc2Uo
c3VidHJlZXNfZmlsZSk7DQo+ID4gKyAgICAgICAgICAgIGRlbGV0ZSBzdWJ0cmVlczsNCj4gPiAr
ICAgICAgICAgICAgcHJpbnQgaTsNCj4gPiArICAgICAgICAgICAgaSs9MTsNCj4gPiArICAgICAg
ICAgICAgbWtmaWxlcygpOw0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBCRUdJTiB7DQo+
ID4gKyAgICAgICAgICAgIFJTPSJcMCI7DQo+ID4gKyAgICAgICAgICAgIE9SUz0iXDAiOw0KPiA+
ICsgICAgICAgICAgICBGUz0iL1xcLi8iOw0KPiA+ICsgICAgICAgICAgICBpPTA7DQo+ID4gKyAg
ICAgICAgICAgIG1rZmlsZXMoKTsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgISgkMSBp
biBzdWJ0cmVlcykgJiYgKGxlbmd0aChzdWJ0cmVlcykgPj0gMjApIHsNCj4gPiArICAgICAgICAg
ICAgYmF0Y2hfb3V0KCk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAg
ICAgICAgICAgcHJpbnQgPiBvdXRfZmlsZTsNCj4gPiArICAgICAgICAgICAgaWYgKCEoJDEgaW4g
c3VidHJlZXMpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICBzdWJ0cmVlc1skMV09MTsNCj4gPiAr
ICAgICAgICAgICAgICAgIHByaW50ICQxID4gc3VidHJlZXNfZmlsZTsNCj4gPiArICAgICAgICAg
ICAgfQ0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBFTkQgew0KPiA+ICsgICAgICAgICAg
ICBpZiAobGVuZ3RoKHN1YnRyZWVzKSA+IDApIHsNCj4gPiArICAgICAgICAgICAgICAgIGJhdGNo
X291dCgpOw0KPiA+ICsgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgfScgfCB3aGlsZSBJRlM9
IHJlYWQgLXIgLWQgJCdcMCcgaTsgZG8NCj4gPiArICAgICAgICAgICAgcnN5bmNfY21kX2JhdGNo
PSggIiR7cnN5bmNfY21kW0BdfSIgKQ0KPiA+ICsgICAgICAgICAgICB3aGlsZSBJRlM9IHJlYWQg
LXIgLWQgJCdcMCcgc3VidHJlZTsgZG8NCj4gPiArICAgICAgICAgICAgICAgIHJzeW5jX2NtZF9i
YXRjaCs9KCAtLWxpbmstZGVzdD0iJFBFUl9QQUNLQUdFX0RJUi8kc3VidHJlZS8iDQo+ICkNCj4g
PiArICAgICAgICAgICAgZG9uZSA8IiR0bXBkaXIvJGkuc3VidHJlZXMiDQo+ID4gKyAgICAgICAg
ICAgICIke3JzeW5jX2NtZF9iYXRjaFtAXX0iICIkUEVSX1BBQ0tBR0VfRElSLyIgIiRkZXN0LyIN
Cj4gPCIkdG1wZGlyLyRpLmZpbGVzIg0KPiA+ICsgICAgICAgIGRvbmUNCj4gPiArICAgIHJtIC1y
ZiAiJHRtcGRpciINCj4gPiArfQ0KPiA+ICsNCj4gPiAraWYgWyAiJCMiIC1sdCAzIF07IHRoZW4N
Cj4gPiArICAgIHVzYWdlICJJbnZhbGlkIG51bWJlciBvZiBhcmd1bWVudHMiDQo+ID4gK2ZpDQo+
ID4gK3R5cGU9JDENCj4gPiArZGVzdD0kMg0KPiA+ICtsaW5rPSQzDQo+ID4gK3NoaWZ0IDMNCj4g
PiArDQo+ID4gK2Nhc2UgIiR0eXBlIiBpbg0KPiA+ICtob3N0fHRhcmdldCkNCj4gPiArICAgIDs7
DQo+ID4gKyopDQo+ID4gKyAgICB1c2FnZSAiVW5rbm93biB0eXBlICckdHlwZSciDQo+ID4gKyAg
ICA7Ow0KPiA+ICtlc2FjDQo+ID4gKw0KPiA+ICtzdWJ0cmVlcz0oKQ0KPiA+ICtmb3IgKChpID0g
JCM7IGkgPiAwOyBpLS0pKTsgZG8NCj4gPiArICAgIHN1YnRyZWVzKz0oICIkeyFpfS8kdHlwZSIg
KQ0KPiA+ICtkb25lDQo+ID4gKw0KPiA+ICtpZiBbIC16ICIke1BFUl9QQUNLQUdFX0RJUjotfSIg
XTsgdGhlbg0KPiA+ICsgICAgdXNhZ2UgIlBFUl9QQUNLQUdFX0RJUiBtdXN0IGJlIGRlZmluZWQi
DQo+ID4gK2ZpDQo+ID4gKw0KPiA+ICtyc3luY19jbWQ9KCByc3luYyAtYSAtLWhhcmQtbGlua3Mg
LS1maWxlcy1mcm9tPS0gLS1mcm9tMCApDQo+ID4gKw0KPiA+ICtta2RpciAtcCAiJGRlc3QiDQo+
ID4gKw0KPiA+ICtpZiBbICIkeyNzdWJ0cmVlc1tAXX0iIC1lcSAwIF07IHRoZW4NCj4gPiArICAg
IGV4aXQgMA0KPiA+ICtmaQ0KPiA+ICsNCj4gPiArY2FzZSAiJGxpbmsiIGluDQo+ID4gK2hhcmRs
aW5rKQ0KPiA+ICsgICAgc2VhcmNoX3N1YnRyZWVzIHwgcnN5bmNfaGFyZGxpbmsNCj4gPiArICAg
IDs7DQo+ID4gK2NvcHkpDQo+ID4gKyAgICBzZWFyY2hfc3VidHJlZXMgfCAiJHtyc3luY19jbWRb
QF19IiAiJFBFUl9QQUNLQUdFX0RJUi8iICIkZGVzdC8iDQo+ID4gKyAgICA7Ow0KPiA+ICsqKQ0K
PiA+ICsgICAgdXNhZ2UgIlVua25vd24gbGluayBjb21tYW5kICckbGluayciDQo+ID4gKyAgICA7
Ow0KPiA+ICtlc2FjDQo+ID4gLS0NCj4gPiAyLjQzLjANCj4gPg0KPg0KPiAtLQ0KPiAuLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLg0KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycNCj4gY29uc3BpcmFjeTogfA0KPiB8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfA0KPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfA0KPiB8IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8veW1vcmluLmlzLWEtDQo+IGdlZWsub3JnL19fOyEh
TXZXRSFFU09jVlNsM0hrUGpzNzR1cmRXeHhLQVZPOHdxRTIwN1JtTnA2V3FaaA0KPiBNYUtGOG55
ZFRTT1dKV2EwWEhtcG9mVFZzaEJJUng4U2NGLWVGYjdfV01qenFXbmJTM3ZaUSQgIHwNCj4gXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwNCj4gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScNCg0KVGhhbmtzLA0KQnJhbmRvbg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
