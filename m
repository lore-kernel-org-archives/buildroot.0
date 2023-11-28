Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1996DC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 17:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FC974174C;
	Tue, 28 Nov 2023 17:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC974174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4NZE4Bd-SHF; Tue, 28 Nov 2023 17:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B9C41723;
	Tue, 28 Nov 2023 17:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B9C41723
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A821BF419
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0D6340399
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 17:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D6340399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lngmXcFvgzo for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 17:21:33 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 664E240131
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 17:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 664E240131
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASFvvIp002894; Tue, 28 Nov 2023 17:21:30 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3un0ba29mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 17:21:30 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph008rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3ASHLTZY013849
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 17:21:29 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3ASHLKW7032214
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Nov 2023 17:21:29 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 28 Nov
 2023 12:21:27 -0500
Received: from UUSALE29.utcmail.com (10.220.63.19) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 28 Nov
 2023 12:21:27 -0500
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.184)
 by UUSALE29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Tue, 28 Nov 2023 12:21:26 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1143.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.36; Tue, 28 Nov
 2023 17:21:25 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9321:c5a1:ca0e:86c0]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9321:c5a1:ca0e:86c0%3]) with mapi id 15.20.7002.035; Tue, 28 Nov 2023
 17:21:25 +0000
To: Herve Codina <herve.codina@bootlin.com>
Thread-Topic: [External] Re: [PATCH 1/1] ppd-merge: speed up per-package-rsync
Thread-Index: AQHaIYLsV8AJIpANYk65UyS8zIN2bbCP4eAAgAAYU2A=
Date: Tue, 28 Nov 2023 17:21:25 +0000
Message-ID: <BN0P110MB1673DA4D93BA42393EF18D4BEBBCA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20231127224139.35969-1-brandon.maier@collins.com>
 <20231128164920.75ac695e@bootlin.com>
In-Reply-To: <20231128164920.75ac695e@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1143:EE_
x-ms-office365-filtering-correlation-id: ae714f69-e2f7-4552-756f-08dbf036734a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1vfzvSxXKoV4qn/WMu3qsDJdJOBOnuyhOZ8yhwIsZu2IJTDxTnlFYZPeZVk3Mv8E435mgye7dJ4j3O3htOToclxube8qiD0Ut38oglFm9kkDuw1GoXU8j2i1LNXCSAXMm5Nh7httrRQytfOMOREy3cLZLACv+2DnA1lxGRN1mUABAMJ3hYneVQkC39i/k+3RwYAwjaDnU88lrZhZFnQ/tZRkUY+m31CIofJY0VgLu/vZa5UoLAya4kg7eVmFtpOEk/nKjpGjxoLGjJCugKdZoZc7jvm9PKrjj2YPio8CATVsqT2J3spGidZTbEuBDOKYLjf2CJagl8WsA1rFPVnbyzFoRLO5vwoHkAGd9z5h3DCIBREs1RcuzvEKSWiScPS4OjtINDQRBMdq0dTiDTWlgPuymgvS67r6OOGHxhjVR3CP35tS+VySNQ0rMeJuh6Q9MulNkBP7usSg1v3PNkq1mbQXN+4Ul30xlOcU02sJ1y+Jm6m6mxwMeW0uuDCaEy8noYNogj4dsKgoNlXJkLdUCkswbYUC05hDit2JOvQV3k2g7DvkDZH4UdFsSGF/MxdDHFOLAaXPWfMxZAwyRiIr/f7KaByz9oYESjjXqbUVgltjlVMxZf5iHsdriDOgdx7QFMQqHpXvoT7mvicjAvqqMDRNtqnF5hIIclw8Zc1crZvd6chjwRl/KZ2cBJrEsCXj5VkdfYH+Wqhf3FwgLKnYsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(451199024)(38070700009)(55016003)(71200400001)(33656002)(122000001)(5660300002)(9686003)(53546011)(82960400001)(86362001)(83380400001)(2906002)(6506007)(38100700002)(7696005)(26005)(64756008)(498600001)(54906003)(76116006)(6916009)(66556008)(66446008)(66946007)(4326008)(8676002)(8936002)(52536014)(66476007)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmRMY2FaZU9lNm9WM0x6RjFwSXdvNXRSeTdMZTVndytKeFZnT2I0NDFtb0Vh?=
 =?utf-8?B?VWlmVUszMk9yZTdPak54UkFwcnA0TVpnZHZhT0c1QkM4Ry9qajZ2UUxTYTgy?=
 =?utf-8?B?NHRzR1ZOVzNSUFJEWnZEcm5IOVkrVkNweGJzZFBUalA5d1p2c0pjd3lOVFRM?=
 =?utf-8?B?VGY3c1ErR0Y0OTRkeW9ienkzaGdJSUhXTHNRUmpnL3B6NXYzTitGVHRlN3By?=
 =?utf-8?B?YVNwdWpkbzcwTWtjVk84M1IzSzRCRVo0WlJmbHBiTGoxWGZiK0ZsR2FIa2hx?=
 =?utf-8?B?QmJiVVRFRVg2UVJQRTV6bEVzQ3NpeVdyL2djN0NvUW5uYnpPN241M29OR094?=
 =?utf-8?B?NU5sNmkxeDB5Q2lST1p5c3JCbjYzY1N2ak80VE9PT3VmZlRSTjAwNlp6THJF?=
 =?utf-8?B?aWZOR3IvenNNZXAzWVpYWXRLaEpMNUpnMm5LK0RiZ0VBV1BNcExNb1pEOFI2?=
 =?utf-8?B?Zk42VXluQkQxU3ZEQW16M1ppT0NuQ2g3UTFkV1FYQXNRTHhFZ2xvWm5sQVAz?=
 =?utf-8?B?enlCRG9sbElOS1VvaEk2QTRNaUtwaUF2R1FsVmx1ZTEvVUt1ZGIrTG1vZG9I?=
 =?utf-8?B?dnBVSzJnc0dLYzJienFENXdnT21aWllaNEkzcGlycHZqb1RvVHlKUnhZcEgz?=
 =?utf-8?B?R25VRlVXOGV4UE1oeU04b25RZnpmV2RHM2p6Y04yWERScWpIV0wrbjc3OGRz?=
 =?utf-8?B?ZFg0NFFvU25QazdDblJFR0RYQTk0TVk1TWFTc3IyY0ZpQWpsSWl5WGEwY0g3?=
 =?utf-8?B?c3RicjU1L002YmRuNGNqUzBkUVg2ZUVRUTlmUGkvWjNiYTNQYjEzcU5YZ29S?=
 =?utf-8?B?QWtIQSt4b1piNTZyYmVxUU9VU3NUYU5JREduUXlrQXY5Z3lORDJWWnBCdkxS?=
 =?utf-8?B?UjNSRmp6T1F2TEovZFpBNEhzYTgwYWkrTjhIZ0NzbWdqQmd0bnBRUFI4dHNS?=
 =?utf-8?B?UVllQzdGMHJ3STFMeHdobEc3Y1VnRVFUanlVejJwc0owc0VZdGZ0WHBsdExN?=
 =?utf-8?B?anI3ejlmNVZNYkUwRTVwY0VibHNzM1RBSDVvdTRVQ1pha0tlRlZhVWFZTzdP?=
 =?utf-8?B?WTFsSjBsOEwvZUdNKzZkTm1YUEo1ZzZtYWhGN1Q1N010cXRJZUgvKzBYVElM?=
 =?utf-8?B?cTM1aEk3SC85MkZBMjcyUmR3NFZJb0tTTHpYVEdYeDh3bVBIV2pvS1I5ZU5C?=
 =?utf-8?B?UlMwcWJOYlNWNkRjQWVDb213NHk3VC9NZmVWQm03YUYxem5uZitiSnQrZkZl?=
 =?utf-8?B?cWJuUUZjRmg2T1JyaTZCWWtaR0c1R2dETFEvSEd3djVtQVgrTHB1R1JFUHF4?=
 =?utf-8?B?cnZBeXV4N1hZTG90Z0tPUWNGa2VTUldZSDNuREVBQW9uM1luK084RmY0V3VO?=
 =?utf-8?B?U0htdkNqMUtGYTBBZUJ6dUtSZmpyeGxIQXE1ZmpkSHNFSmpPbWxzdWN1QXlh?=
 =?utf-8?B?eTNoaTJhemdXSk1uS0JHZ2RsM3prTU9lcXdKUElQUmQwVUdYWnNjLzBlcGY0?=
 =?utf-8?B?NVZ1MjgrOHpJMzg5Tm5oanRPTGpKT0ppMFQzdXdUbVBVZnhEbjg2NlJlRWhl?=
 =?utf-8?B?aWIxZGgzb3pUcVpNQkdOcFlTeUhkYWpFcjFyQThuKzZrd2t0Ynp3NW8vOWFi?=
 =?utf-8?B?SzhGbi9UaEM1cTA4VklESjRaQkZOYkhJcVh2OEZrZzRxNk1MeHdkYlhpRUox?=
 =?utf-8?B?dkpWTSt4Z05BQkd4KzA3Tm5YUSs3TzNSTHQxcFNZbWd3Ykx6ZW1NMk5XTHRy?=
 =?utf-8?B?b0MzUVliZ2JHMjk2MkR2NC9nZGgzZ1U2OEFPZG5qUVEwQklrVWRqWk8wWHFi?=
 =?utf-8?B?Z2FlQjRPQzRNWDRpVnRjc0duYUtnWW1oQWJ0ZTVGNkFRWUxOVDk0MEk4TVRz?=
 =?utf-8?B?SkVmSjFka1hDVmdOQmtyVnp3ZVVGUlFGUHhkQ0VveUczK2dGUm4xbmNvRUhh?=
 =?utf-8?B?b0RyQVZhcjRDUFNuTk9XVS92M2IxRmNOYUpwWml2SlgyNEw3bVU2YzVZZnp6?=
 =?utf-8?B?TGNQbjNEcWYxL3JYZ0xaOVlKZU1rUkRGRXZuNDRXcFZoMDFhT2o3L2xReTBT?=
 =?utf-8?Q?6hy7FV?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=uZnSHY9K8xC3sKLmkYo87NAg/Ph1cFq88SDtkBQhHRzXYVR7TzC4A9C8Y+MlALKqlJvB2i1G1mNJS5yC1yNO/rPB1x/Gg7IXShGSvAozaPpL0R4uCBcvg/e19XhFi3QfpTw0R4+jjEMf05ohG+rNfjblJo8xeM9Sg7aphmvhV1WjIEeXrLf+W1WLkpnrlT6wZY7U3N9yyW/QbxPXDQ4+8G0a+TDeols5Z7v/OdTSXj2Irq0ldwUrO5la9Ey+Go/O5VW/EhamhkLIsusA85aRPg8WIM9/C9MK9X6GrEFk2SxbmhSp8P7yd4JHYzh2j1znY5Flb/RnmGyFSScD+nx1xQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWzaBvFY9jfNNZsEx8AHZqsDsdp7Yq593O+WBnrfpwg=;
 b=ZBVF5kypAp2q5mgmgRdJVIZAZpQI043vVvqLrNN1eib4cBEacjZZtYHHje4AAtQi8cTw7y/kT6KthnORqqMqkBYBxmWZNz9op9iEK+svXF66Nich1EoJsqfpMs1lOzD1zi0rHbinKNzTzUZGBHXkqq4VOydnzofmBqAdO1qFC/ydZxTbZCPqVQay1J0LwRLERpeSZMpZvnbcbKNl0yurvi28M4ClZTxfjUI/S2a7OndBPEU/YbONvVWs7YhoBhlHYTFs44w3cpwTAtsuTlkz1MZLN0Mg5HX/r571EVdFPYURhHVsK5UpkGgf+IMn9xwn3MB5OWd8nia9+5BMrIyV9w==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: Zym1nYnfMXt7IAMEynwiJXpDFzjuTjGoqcRs4LSWjnQaJgiVoz7dGxpw3bW+BXbfFD5jLrwiofKA71zSOxyUo0TI9gcVsMpj+JrlNOBw09/+t7CR9875lit5SVYCJCYwde0ppZLZr0izujNHtDGcd39hD0HJS+hh6XXW7+YisBIjBOZiav+j9//BpxJNbv4L46vuSntjnuSWfwM//CunFeQiw2xb6mpM+CqFe9FRQS/L8eoiGu+08ySXA/asv1oDSYgemd19VXzxGdIM5g6ebxvpn2/YAk87hcV6LMBbzkusQjm4QnDpQtLysXLZkovSTNefPxxm630YjMhp6gSZKO5cATXfTR87Oi0XHq7tWtH9noTXIoqmuSgX4NOWX0hmlGXmiX0qYYJPFCeGJCOaA7uHI3ZA5M6mqYe+fCDf/mjgoWNoFnyYCt5o4LkKerCquBU5/jhKmYpiBRN1MgCnKO+vn2B83K7c3EaVcN6npdcRcAgD3m3/a/NHW5fopko29LpO+1EmMV+OCLtrU6GI2R6cRkqSaxMgBuh97CyjEYnpLUQh9MM3MqWAjTGXnVaNQ+0huEEn3M8ecSTchGBkF3TKZGwzaLCY3ydHxDYPaLXmwBJ0+QDZrW7aFPTIB7NFytmfD3p9DQwpCpMTuISKm7AckDsNLcmdo4Q5Su09vxMfTBO8Tm7pdWTruAjgHdy4gxzfbmQkkUU6JXsHW5F0icXitsB0+hdxqonwSUzZKBw6Wjg1o4mj89sdC6pOyz+HkCv2VvyHx7rRZ0QO3Kf6A8H6J5ZNlUs3SLis4GWrg5eU80rpHB/tfLv9FFmR2lvE
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: ae714f69-e2f7-4552-756f-08dbf036734a
x-ms-exchange-crosstenant-originalarrivaltime: 28 Nov 2023 17:21:25.5829 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1143
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_19,2023-11-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_19,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280138
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280139
X-Proofpoint-ORIG-GUID: OSBpVHbjr61z0WLKPg9CkX5onPHKPr2a
X-Proofpoint-GUID: OSBpVHbjr61z0WLKPg9CkX5onPHKPr2a
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=NR0JPzAkwwi+ff4KswhQk6T4QmHaSkN/zm1A9BQaKFY=;
 b=sPGTXg5NduQ1+7o+5m0n7zBlVnQq/A2q/07BejXsEU4Px11DJsNSxB/U6HLnQ1LZbZ2U
 smdtEay8Vk+wxjGLABpMVGa5Bs6/2cJLDadLMXvWgoPIELkyp8Q8MTVXhe7fAkwPqBSt
 P2HMwEkRMiz8u+lT8HWSt5cosyfHsQEoPnXpnwdIm4i6FVU7rdIwbZ83lrU9xPbGl3Kx
 WafdKsOiz9BlBuZNnR/NPYDerhxaLg4stVbGTzUUWqdmALJfH1LmHFQLjdWU7GFq1WNa
 Fs6tISH5cxv81nkTbjz4bV8MvskMd1Mfw3KChmUezLZhyRtaVIZ8hxcxHEldGkXRFDOV vA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWzaBvFY9jfNNZsEx8AHZqsDsdp7Yq593O+WBnrfpwg=;
 b=Sw4/bvBlyjPn1vrNRtTdEY1LD7R8ik7j97T67G/JY4JntiUiMqYVkRBxdYPi6OcJl/7AJ/QYmM49EQDdc9vKdFmnXHDix03FPOiPSyr3Dzaq636SiF0DtY1vmlyQ0ZmED0vGXSpKI/ms9gsaJpYGBnsIkyONo5q6RV9uqxTpRdU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=sPGTXg5N; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=Sw4/bvBl
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSGVydmUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVydmUg
Q29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVt
YmVyIDI4LCAyMDIzIDk6NDkgQU0NCj4gVG86IE1haWVyLCBCcmFuZG9uIEwgQ29sbGlucyA8QnJh
bmRvbi5NYWllckBjb2xsaW5zLmNvbT4NCj4gQ2M6IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOyBZ
YW5uIEUgLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+DQo+IFN1YmplY3Q6IFtFeHRl
cm5hbF0gUmU6IFtQQVRDSCAxLzFdIHBwZC1tZXJnZTogc3BlZWQgdXAgcGVyLXBhY2thZ2UtcnN5
bmMNCj4NCj4gSGkgQnJhbmRvbiwNCj4NCj4gT24gTW9uLCAyNyBOb3YgMjAyMyAyMjo0MTozOSAr
MDAwMA0KPiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGNvbGxpbnMuY29tPiB3cm90ZToN
Cj4NCj4gWy4uLl0NCj4NCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctdXRpbHMubWsgYi9w
YWNrYWdlL3BrZy11dGlscy5taw0KPiA+IGluZGV4IDA1OWU4NmFlMGEuLjM5NjhjYWJlYmQgMTAw
NjQ0DQo+ID4gLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsNCj4gPiArKysgYi9wYWNrYWdlL3Br
Zy11dGlscy5taw0KPiA+IEBAIC0yMTYsMTkgKzIxNiw5IEBAIGlmZXEgKCQoQlIyX1BFUl9QQUNL
QUdFX0RJUkVDVE9SSUVTKSx5KQ0KPiA+ICAjICQzOiBkZXN0aW5hdGlvbiBkaXJlY3RvcnkNCj4g
PiAgIyAkNDogbGl0ZXJhbCAiY29weSIgb3IgImhhcmRsaW5rIiB0byBjb3B5IG9yIGhhcmRsaW5r
IGZpbGVzIGZyb20gc3JjIHRvIGRlc3QNCj4gPiAgZGVmaW5lIHBlci1wYWNrYWdlLXJzeW5jDQo+
ID4gLSAgIG1rZGlyIC1wICQoMykNCj4NCj4gU2hvdWxkbid0IHRoZSBta2RpciBiZSBrZXB0IGhl
cmUgPw0KDQpJIG1vdmVkIGl0IGludG8gcHBkLW1lcmdlLnNoIHNvIHRoYXQgdGhlIHNjcmlwdCB3
b3VsZCBiZSBoYW5kbGluZyBhbGwgdGhlIGRldGFpbHMgb2YgcGVyLXBhY2thZ2UtcnN5bmMuDQoN
Cj4NCj4gPiAtICAgJChmb3JlYWNoIHBrZywkKDEpLFwNCj4gPiAtICAgICAgICAgICByc3luYyAt
YSBcDQo+ID4gLSAgICAgICAgICAgICAgICAgICAtLWhhcmQtbGlua3MgXA0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgJChpZiAkKGZpbHRlciBoYXJkbGluaywkKDQpKSwgXA0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLWxpbmstDQo+IGRlc3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQo
cGtnKS8kKDIpLywgXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAkKGlmICQoZmls
dGVyIGNvcHksJCg0KSksIFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAkKGVtcHR5KSwgXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICQo
ZXJyb3IgcGVyLXBhY2thZ2UtcnN5bmMgY2FuIG9ubHkNCj4gImNvcHkiIG9yICJoYXJkbGluayIs
IG5vdCAiJCg0KSIpIFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgKSBcDQo+ID4g
LSAgICAgICAgICAgICAgICAgICApIFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICQoUEVSX1BB
Q0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgJCgzKSQo
c2VwKSkNCj4gPiArICAgUEVSX1BBQ0tBR0VfRElSPSQoUEVSX1BBQ0tBR0VfRElSKSBcDQo+ID4g
KyAgICAgICAgICAgJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9wcGQtbWVyZ2Uuc2ggXA0KPiA+
ICsgICAgICAgICAgICQoMikgJCgzKSAkKDQpICQoMSkNCj4NCj4gV2hhdCBkbyB5b3UgdGhpbmsg
YWJvdXQgcGFzc2luZyB0aGUgUEVSX1BBQ0tBR0VfRElSIGJ5IHBhcmFtZXRlcg0KPiBpbnN0ZWFk
IG9mDQo+IG1peGluZyBlbnZpcm9ubWVudCB2YWx1ZXMgYW5kIHBhcmFtZXRlcnMgPw0KDQpJIHdh
cyB0cnlpbmcgdG8gY29weSB0aGUgc3R5bGUgb2Ygc3VwcG9ydC9zY3JpcHRzL2ZpeC1ycGF0aCwg
d2hpY2ggdGFrZXMgUEVSX1BBQ0tBR0VfRElSIGZyb20gdGhlIGVudmlyb25tZW50LiBGb3IgZXhh
bXBsZSwgc2VlIC4vTWFrZWZpbGUgInByZXBhcmUtc2RrOiIgdGFyZ2V0Lg0KDQo+DQo+ID4gIGVu
ZGVmDQo+ID4NCj4gPiAgIyBwcmVwYXJlcyB0aGUgcGVyLXBhY2thZ2UgSE9TVF9ESVIgYW5kIFRB
UkdFVF9ESVIgb2YgdGhlIGN1cnJlbnQNCj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRz
L3BwZC1tZXJnZS5zaCBiL3N1cHBvcnQvc2NyaXB0cy9wcGQtbWVyZ2Uuc2gNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDc1NQ0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmViMWNhZjllNTINCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvc3VwcG9ydC9zY3JpcHRzL3BwZC1tZXJnZS5zaA0KPiBbLi4u
XQ0KPg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEhlcnbDqQ0KDQpUaGFua3MhDQpCcmFuZG9uIE1h
aWVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
