Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE8EC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 12:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55ED08403D;
	Fri, 11 Aug 2023 12:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55ED08403D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXa0lY_0W7-f; Fri, 11 Aug 2023 12:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53AF184032;
	Fri, 11 Aug 2023 12:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53AF184032
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2683A1BF2C6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 12:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F374184039
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 12:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F374184039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoDYPq7V3Ch9 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 12:56:55 +0000 (UTC)
X-Greylist: delayed 1598 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Aug 2023 12:56:55 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F4C28402E
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F4C28402E
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 12:56:55 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AMl585005158; Fri, 11 Aug 2023 12:30:14 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3sd905uqjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Aug 2023 12:30:14 +0000
Received: from xusxph009rp010.corp.ray.com ([128.13.125.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 37BCUB5c024172
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Aug 2023 12:30:11 GMT
Received: from UUSALE29.utcmail.com ([10.220.63.19])
 by xusxph009rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 37BCTo46001677
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Aug 2023 12:30:08 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 11 Aug
 2023 08:30:04 -0400
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 11 Aug
 2023 08:30:04 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by UUSALE29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Fri, 11 Aug 2023 08:30:04 -0400
Received: from BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17e::12)
 by BN2P110MB1384.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31; Fri, 11 Aug
 2023 12:30:02 +0000
Received: from BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM
 ([fe80::248:24:67a7:4047]) by BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM
 ([fe80::248:24:67a7:4047%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 12:30:02 +0000
To: Arnout Vandecappelle <arnout@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Daniel Lang <dalang@gmx.at>
Thread-Topic: [External] Re: [Buildroot] [PATCH] support/scripts/cve.py:
 switch to NVD JSON version 2.0
Thread-Index: AQHZywB/jreDgtAgoUiGGZDVrriD/K/icqSAgACUgwCAABV0gIAAZ8EAgAAGtICAABUagIAAV9cAgAAQwQCAAKHYAIAAXDZO
Date: Fri, 11 Aug 2023 12:30:02 +0000
Message-ID: <BN2P110MB1640086BB851C1C2AEC67A81F210A@BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
 <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
 <20230810154241.3faee0fc@windsurf>
 <2dce28a5-8e0d-f240-9b11-d3ff08604e88@mind.be>
 <88f0eecd-cde8-4069-a750-ee2cbab679fb@gmx.at>
 <20230810231234.74e65cc9@windsurf>
 <b73735ba-c570-1a92-ae40-e6e0107c5a71@mind.be>
In-Reply-To: <b73735ba-c570-1a92-ae40-e6e0107c5a71@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1640:EE_|BN2P110MB1384:EE_
x-ms-office365-filtering-correlation-id: 7b92cbc0-7465-4578-3e33-08db9a66afbb
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4N6ax1/cdZyHpj/r0FmgZ//UpTk9tuFkI5TYb3GvOAyp6N39WqsZZ0E25RuPIm81Mh6cdsE+wfcrmeAlPx1sqeRzuGsarzVFt79BwbRbYP2bJqj7EVmuZlrHYEfCNHfRoaYlSyGtZgqChcohNUn5v5rnZye/UgPQ9ve7/tSRqsQggJZVyjkXSAp6+MG5gpBWual0psq84lsz4Sv/DWp5cI9PI8avFzqHgxuOb0VuixUM3qYE6l1k6Ik3O0XdCF5OhrPc5/SNq8sCJKnuPZ5/4UVAZdPRUWhRsNQNy8oWIlbSt4KFzJPWh41dqhVeOtFayhLvnJm/MIvMAlX1HcTMEVdWhaufkLwZzqguIV7VxrpY/hx+Wt1zblvNizR1Z8UylOks+TRZDcuc0V4sFaRWirWys5SPXtgzlOh3iTnJCKGs9zE4SLvnuQuFVUCPbu0rQ1i0zpzaSoCk6r1xjkz0B9NuPzhqUB7eNq36Lt8ux3/+TnQOilyHgcVZHyLYQzI9TrU4/P8Hx4IfrOfadEpu3R+gQrqEiTQR2qyvTssv8E8BhCKHbHks2xzhYtD9QrOfNQqIWM2zHwWnQUxWJ5ur/viyMCRkwR3stOAyiRQzzgxevrsMC5q2DLN1W+Z4Q9YX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(186006)(1800799006)(451199021)(38070700005)(76116006)(55016003)(86362001)(4326008)(66946007)(66476007)(8936002)(8676002)(66446008)(64756008)(66556008)(498600001)(54906003)(110136005)(2906002)(38100700002)(122000001)(5660300002)(52536014)(33656002)(82960400001)(83380400001)(9686003)(71200400001)(7696005)(26005)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ll6J2oSf5GvhpjH9Y+kCO91dOSbXMa/R5ID2JczTWymOry/15cVkS7uATj?=
 =?iso-8859-1?Q?JxDU2Q3uoyRZ3kXbrv080ZOJtxWGBqhoMzxisC2R+izxYJhBcgF469Q7MW?=
 =?iso-8859-1?Q?lbSYF5JnwZXUjrE2KoiZWB04qdO9aGiMseIx2sOwgyZdHsYesXVASDjShz?=
 =?iso-8859-1?Q?kDo+C3f2uBp4q1TQDL9Em4IwOuNRMxo3EWwkxsLqLlblcrPJgEkHmes6hC?=
 =?iso-8859-1?Q?H2yrntDJn19kjLMGMZJxHZUEIoHeRO4GMPqoMGh7UYIiNohxkXMJlJo4sy?=
 =?iso-8859-1?Q?qqIjMCaxaxaYX3DFUi0RxCIp7rE0+oo+akfOKYbzogjLtHiwCOK3B4cvaD?=
 =?iso-8859-1?Q?ZEOtQHLrzZ6g0d4G+mFi/3SjMKXfNUsaZtlnFKeOfdIUYrLpcOKR7s0ag/?=
 =?iso-8859-1?Q?HPZHh3XeHx2MMxHv81EY/sDxQad3/UrXzzCOdFL9yUzotRBqDHy9QUZun1?=
 =?iso-8859-1?Q?4vvE7XW6wkqGloMGOk8HRwmx1XiB4X0DAIccCKsuvRmjDyly9QRmlVUzGh?=
 =?iso-8859-1?Q?gH/ELjV2FBSQY+u0uj6hMVENMxdrffbQSwD2l/Oen7fRRtAMpmjONb/3vl?=
 =?iso-8859-1?Q?/B03/rcJ8MDWZ9UbkH+7rBCjcho7pUJu7spPs4Wus3EAQ8gco92TL7UBXi?=
 =?iso-8859-1?Q?FbP0EOeHHn8OTqNCxS9Z45ORxQcMQoRhuMug892gJJC2T0o1eUyc1nsuZb?=
 =?iso-8859-1?Q?WjCFGQaRSLWhxRHzYi8jtvwTDrF0RtQDNAItF2OFk7zuEtCnWP3Ipo3hez?=
 =?iso-8859-1?Q?8La1dppKccq+Btmn7ZXk7xMY98ZSbLiPHggJj9lm2EkSEkukHvdpTBm8VY?=
 =?iso-8859-1?Q?Cw8uqwS6wGRApXHKLZepOMH8Dx46z1Una+kMD6GnJ4ABfKKMa8+Esb4BS9?=
 =?iso-8859-1?Q?2WSAkb0k24ybp4VuwI3UWeLMeFGLlLb3w4D+g2urIPmt2KgIevrKXRKo4R?=
 =?iso-8859-1?Q?zntrjH5Sxoghh3Rn/6I9jhJ04XI2gfXCzxgSt0aWAoI9mKpoE+vyeDcRxK?=
 =?iso-8859-1?Q?18rdBPFPjUAX8bhtmT/S8VSQ4HK6yjznLzennwuej7fPutIyt5yJozGO0E?=
 =?iso-8859-1?Q?SIYFL9NC/0JPOy2cJPf85WPh9AHnmmkVIaHxYGatk+MwvjbGJ+Ntqwzw1z?=
 =?iso-8859-1?Q?j8GKJ+frsGcgnDPF9Bg/JRlBrIQdTyuXWRoo/V3okTubfljiEypWVp30Qt?=
 =?iso-8859-1?Q?Mg/RX5W4GSV/VvZ7kCUMfgFmAz44vK0hibr1MYUZWj4qQaFSrI9hBD+/VX?=
 =?iso-8859-1?Q?bYmQtBz0bE5yXnl1o5kcJJkr6vA9GA3wW8oH6rdJ6jleWfW21xPtrQ+v7W?=
 =?iso-8859-1?Q?ZUF0TOKyckCyizRYC0NeEaa9Fj7VtU7+JKML7ugExF+Ns2HZiCWszgoepl?=
 =?iso-8859-1?Q?EyMWj64UwTDUtsXZuD6mccKZOuwZVP/abaMWGHHcJ9UGn4q4ZcpOqc5x9E?=
 =?iso-8859-1?Q?m6e+zDhEJ4hEdMMd+uBUW6tCsCOh/T+yQkZVcynjPDXULSxd5a5aEAjW9g?=
 =?iso-8859-1?Q?hS+UgSbmiRe5DztzJkU5OGdKy7mrLKueVVefsOE+3K2MFSilny1PQYC0/U?=
 =?iso-8859-1?Q?Jgikg8nf+LKh2fSCmmWL1TCowPJq?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Sx9YLTIS1pS8CrKkyFOWepMAtHqluh4N8JwMl7yiHgvk8DgMLvQsz0BCl9dyIjyVW++iin8dJRO4UY5HBjnxvl09mWQsjV6CTdoI/7+xV9J2UZ7t73krBRsym5kbQGAK1ZoT3ZTfcfOBrjqGgnVCMNu+NTlopQq5hQJLJ8fX3SJmTn1R7Eg8kGaND7Yyq0DDWnuCqzcZQenEEbOqSR2gEwXk5S/bKxb6X37ORJ7DkWiIioqC3Z4M02y1xDTTae9CsZqJHdRZnFVnOptDun+OTHCiU7Z8kmdCQKsiDnLN531nvCPRlihARQ6Vws84xYIfenmekihCXP1JFio0fS8Nlg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhNgXWINcwOTwTRA2LALgGi82scOqYLQmQ7oWCBV/UQ=;
 b=zTGOqJ2vLkupv4tEjqOI3wIlyf9KS8g+z2vbigt+kdvzttG7OD9qyFOfUmF+hubbMAOj5bpTxVf9E6C+T9mzwG3o4xMon7PcbL/9vPdV9imKIEt62ut4BVa9yYRTgcXycswdyyW/+YqTbBHmJJJ41UY50aMtUibmgLaTheyjXePrQ+yPRy9T86OzIauE5f3shgKz83D5fHAT0C4qaOx8w9X34U5oS3sYDdppgQ36vdY4/4x0O/r9eqksEVnqFUGRuKjNnas7RTJ7QYkdq5Hc7BHTGKyNSCw4hq3wPCvd2JJdCy6sSrHLyXeiryf1FlfJJ8G8qSZdpVQHoFfmNwvAtg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: YYmvas+pda6uI+2SYOavGNaMnKsBBqNv/nISmKANVTmbC0fufWkw+7jhYr4OD4SflsMO698/F7w33jngB2whWY7Jnq3f7QAUJvL8zmiEd8KoeBsj60g5vxjBjZ0ZLD6nvBvpwteRqJLixBn2iXO1VHCxohOmecbvcKHSnporv5fa0qk3G5XuAZj/onHhcOQYbJJDJmbD0rBy7o+GzM3sLRe9sBS+m0yIhzTGUkIOEWMS8Z7JsTjbia6ihNSWmQe1YoNF2lgsdH3zm44Zf3BYRbQZigbbc9BubRtOdukT115pFDtlYyzFDzgDnBqCFvTF1bGfR1zJOBAE+wx/tNlixprIunfoENDwjHlwE3AcdQvhual4x1pAqWYV9Clv6+ApU7W1WjaTaugIPj/xlt93lAwEjgXwP8Ot9e8hMwZtsJeSTZTYhzY5e6Dkxn2/Lmke0LlUMcRFaaauQZuha2EsVz5NIuAQpXJGhcHauhV20yCO55pjfPIZ697tEFxiuH9wbb+IkLaDVYDhxcdccY/5hjg1BaaaAIoNs3DT78S1ZDNpDgM0vHu/Rql+onV5HBZB6WyiRcNcogHKLN7S+VE2hHDD3ZnUzd6qcrDO5St4Rcf2PCaymFWtu0N4gYkHwk4/IKZxAMeRc4CfsKCsQbjE623I/iTYW8CYUvkRfYxvr1Gg/gbTkIAl9sU7p8+LvY6GDEzFM0ltb9ofYGcEnGP+HBBDaePt9hyVWB407J34RGs3F5tDTyolsjpl69GTiFtFX3KacU5VJSLU7rz2V9x1b8844f76nIN9SrFc9tDCYDwNCJ2Hcoz3iOabeGhJcTzQugYmclNX6wLhiN45Gqw14Q==
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 7b92cbc0-7465-4578-3e33-08db9a66afbb
x-ms-exchange-crosstenant-originalarrivaltime: 11 Aug 2023 12:30:02.8550 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1384
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_03,2023-08-10_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_03,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110114
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110113
X-Proofpoint-GUID: s5aczX4CJkZvdkJLIIpNjoWd6zM3TRlR
X-Proofpoint-ORIG-GUID: s5aczX4CJkZvdkJLIIpNjoWd6zM3TRlR
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=y1N+AdTk/m/buEH2DjY+YNSA471pHe/dUAKPjEIDCqs=;
 b=SKCy9+Fc+YT9qrzz74pxAFdt/GM7PcGRd61ZMFiX2zWHK9USZ9YKUckkUGHp0jT+IV/N
 +lRE83TV14awRJF/T/ZuyXAuQIMxCXUPn5sNQC5V/nkXQCa4+kSPRjUI35wQrdgCf8Yz
 M1N27mdc/8ZBC+qSrRRsMkULFc0mqDFXoatCjnVYSct/SjVRlc5sIgJwpFugNxNihtJC
 SZZh1Ze0560Ga8bpxLRMDz88prkDeL+BdWrrfS4/9GytpKOotyvplN7tZOGbvqUsHxkX
 2EJG7riqPOjCgk2m2DAG+ZyPvNT5bby8t+xQaYNrHQabkVk/GYEaBXGswqPt+SdyXdjR 2A== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhNgXWINcwOTwTRA2LALgGi82scOqYLQmQ7oWCBV/UQ=;
 b=rs+LMk9WTYMVsfFD4euOBzhDyHFo1x5ImM7MzL6J7SpvPP9rN3ZOj9Lstjn6a93qTqR/gBehO1nUaR/GZhydQu+oEJfcfWBCzSrVO8Y4EAb4Scm7ghQqAgQ11L9shybHbn9SkjQbZa5x+fDxHtBTFr/fZLeWESf5iLgJjwNc7Ws=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=SKCy9+Fc; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=rs+LMk9W
Subject: Re: [Buildroot] [External] Re: [PATCH] support/scripts/cve.py:
 switch to NVD JSON version 2.0
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
From: "Weber, Matthew L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "clement.ramirez@bootlin.com" <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Friday, August 11, 2023 1:51 AM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Daniel Lang <dalang@gmx.at>
> Cc: clement.ramirez@bootlin.com <clement.ramirez@bootlin.com>; buildroot@buildroot.org <buildroot@buildroot.org>; Weber, Matthew L > Collins <Matthew.Weber@collins.com>
> Subject: [External] Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON version 2.0
>
> On my side, I've never used it. In order to have all the entries in the
> CPE database kept up-to-date with the zillions of version bumps getting
> into Buildroot every day/week, there would be a massive work, I doubt
> anyone is ever going to do this. So to me, gen-missing-cpe can probably
> go away.
>
>  Just to be sure, I'm putting Matt in Cc who originally contributed this, but I
> know that he is no longer working with Buildroot at all so I doubt he cares.
>
>  When it is removed, its support in Makefile needs to be removed as well (cfr.
> commits fd7312940aeffe015592396a9b24e014839e0eb3 and
> 1f187371d002fb321a175233afddb50b2b6c3607).

Makes sense to drop it.  There never got to be enough momentum in the overall
software community to make CVE or even the new identifier really accurate.
Thanks for CC'n me Arnout.

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
