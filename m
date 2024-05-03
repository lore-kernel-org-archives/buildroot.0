Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3051C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 02:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EEC541E5F;
	Fri,  3 May 2024 02:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0j-VkUGASsP; Fri,  3 May 2024 02:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF2CC41E62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF2CC41E62;
	Fri,  3 May 2024 02:01:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC1D1BF39E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7660883381
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2f5XLoq7WMg for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 02:01:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E3B083380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E3B083380
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E3B083380
 for <buildroot@buildroot.org>; Fri,  3 May 2024 02:01:50 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 442HW6DE019876; Fri, 3 May 2024 02:01:48 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xv1cvjuny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2024 02:01:47 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph009rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44321kkQ020116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2024 02:01:46 GMT
Received: from UUSALE2C.utcmail.com (uusale2c.utcmail.com [10.220.63.38])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44321i2T002892
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2024 02:01:45 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2C.utcmail.com
 (10.220.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 2 May 2024
 22:01:45 -0400
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 2 May 2024
 22:01:44 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.176)
 by UUSALE2B.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 2 May 2024 22:01:44 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1209.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:180::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.42; Fri, 3 May
 2024 02:01:43 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::93a5:a91f:8d3e:a43e]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::93a5:a91f:8d3e:a43e%7]) with mapi id 15.20.7519.041; Fri, 3 May 2024
 02:01:43 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH v2 2/4] package/bats-support:
 add bats support library
Thread-Index: AQHal0r8ptR3MduXCUesXHb6FChXAbGC6lEAgAGwyYA=
Date: Fri, 3 May 2024 02:01:43 +0000
Message-ID: <BN0P110MB1673CFF561334234D4FCFD7CEB1FA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240412210850.17265-1-brandon.maier@collins.com>
 <20240425195816.2758964-2-brandon.maier@collins.com>
 <20240501231346.442f0182@windsurf>
In-Reply-To: <20240501231346.442f0182@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1209:EE_
x-ms-office365-filtering-correlation-id: a8d92f0b-fd16-42f0-a89f-08dc6b14fb12
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?uM8QqPBxmMHmehqhua+gBaUXrv2lhpxp7+GlHW/jOKokk3hUCnB7mkhtzLpm?=
 =?us-ascii?Q?mtVAdZ0PKPz+mi1UksyuEezRRJZjMNEj/WiEEq5GPr3uLEY0OdGzz+GqvMwl?=
 =?us-ascii?Q?1rDMgINDjYyd/dvkb7DBpEIoagvk1cinZj2YugtNqaV3NupWhsrchP6jSDOS?=
 =?us-ascii?Q?4Y0MhFyt0IhptyAdDuNtXDMBtW9lEAaRQY7Ugd603CI/keU6R5p0lq6CjFNe?=
 =?us-ascii?Q?lhnqcWgsH7bpspu1p5c8hLjWPTgHyHgjHlc+GAHoV//00YlieXpWTW2R95kf?=
 =?us-ascii?Q?k+5pJhUPeLMWNpGxjO2O9pcXU8FlcNomQknt79J6tY7KNYK7WSoYMfKOhnl8?=
 =?us-ascii?Q?omHx2I8RojjBAfKMeDLX2cEVEFH+M5GlTQxHC+YCggo6BGL462mqvSdUsQky?=
 =?us-ascii?Q?WSuWG5kl2JXzFfDRUDOhwf5+HwWw7/O48ZBlFdx04WeDr15GTaZiE5E4J2NS?=
 =?us-ascii?Q?2vD2NWAHXnoC+lqtWLJ5CBva+JbZyO8+VN06N5F9JC2ZKpdnORiidsG4unr/?=
 =?us-ascii?Q?tVJQI5lE11uXpNM0f5qgELQGW6Aq94WEajOA2HglIFevXcYN7fO3AOa86eNh?=
 =?us-ascii?Q?y/dM9Xi0GZ1L9P+OT6RmFHkRhU5r9mIUAPlmryZ5pPvrVPaEBsCbM3JHQfQX?=
 =?us-ascii?Q?WvDBmrP6b1YtIbY9T3kO/cgXKKOKVeudfe3Kj6a7+7/PtIUNyQf3aIjEJAcJ?=
 =?us-ascii?Q?my4uv7u1Y9oe7PUdqUN+vfYVMWSl6VPg07ng/fY8spI1l5fzyExkOQ9RePdW?=
 =?us-ascii?Q?NQrC/B98uuk0KMrKz3790p+VbHBayTP7/Db23EyBttnHb64zyf+AEF0rugOT?=
 =?us-ascii?Q?3LyQpU7MfLGrITtmFeZafJPMH8837HiejFNMHuOzukwNuZNskTJHO2Ve/QQv?=
 =?us-ascii?Q?qZP7eK0BVDX818VU/65rz/Rq/RUbjl+YyNcuyp/I6putY4DASSx0hU4224YW?=
 =?us-ascii?Q?a7VQ3uI8LdX0lJbm/zUi+rXvvo0+55JL3TbIG8M0QHjSClxQcU+31bAD55MH?=
 =?us-ascii?Q?1qUIJ+clgezzE/NNSpphRmT294XGnyUI8gRs9eprfY6aSZPTwROMOQ4iHipR?=
 =?us-ascii?Q?FgVaxMWhXDREXd4D0hm2m8p1dtzH0zgAVZ6gTfdKlt2aypsMyVfCvhfKZLyf?=
 =?us-ascii?Q?A/tWPxDUdde7ZaKrkJdAk/f2MRVQH6rN42SpppDpYtdiZobVoIvJor8dQy1l?=
 =?us-ascii?Q?ywMn0Ty1ALgQKkrmkx4y0dAFv+z7D7kl7IVU/y3YHv/dtSXtQNryAfWYt5IS?=
 =?us-ascii?Q?CeJldFwP+5gIHKRhngLbXpr4miBs3jdHziIngU0hoybAVKS4vMbLNjmj9TL5?=
 =?us-ascii?Q?njZYyyUsQxkJSvx2r79GAelBDf6HBHsM9XKU6pwd9DwEXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hujoOqTM6wdQ2Nl2AnlN5t16jm8P4LjvLirUnz/H63gnkJZ+gRQ8XG1y8ma9?=
 =?us-ascii?Q?LHQKs5cWtmOamTzI0hN7LCy4jhro1HLOjcz29sNWuHJYFWB+PPvgYlxfpo6J?=
 =?us-ascii?Q?QCXAIIFP0dP2vLfgUZwMbLm+d3x+6rEvILIwHx3MdOXNmkMrjG6BHWG5NyuZ?=
 =?us-ascii?Q?6Doi7Vq9qgxhhroHx+10unArcKrhu4FqckmP8HrqtJ/V/xqYlTWsMbZz1p5i?=
 =?us-ascii?Q?6Fv9QOZUMkLH3YlBnotkuD0S6E7Ph4ojZJ1SDfhWrmteC48+93S9COVK8NCs?=
 =?us-ascii?Q?we9t6g89UyfnFSbLlhdVUs0T110He7GUTRdqRWN9b6ud3zLjEFDOyfZOUniT?=
 =?us-ascii?Q?MTZvArjH23FAdHSkn+fX+p9NJVgHRVJKosIaYPW8iLF5Yot7kvpRaF/fevBz?=
 =?us-ascii?Q?HOJK00AP348NT1uoHFsMbbUHdLTm4SfFTD0FBz3yANpLujyj0jnsZM30g+R1?=
 =?us-ascii?Q?Fb4HGLZi3hZszi9dnT80y85Ql3nL16dlArWHRtiwwMHNAHrvIg1ZjklhBfhP?=
 =?us-ascii?Q?ViiXPLC4rqCL7qA48p2hpA/cYSTqvW9tZ1p1RZgp40ZG9Xl6PXJkrNbAdUs4?=
 =?us-ascii?Q?K49k30P/Vrbw/mM9kuH7nUKd5Xn+A5SnEWHPAQ7kABbx51rhf2wGahKaWbzC?=
 =?us-ascii?Q?H2ygkZAKRkqt1z8P6wsJQjod+UsozcSPNAz2rKZhIEqVjgmTD2ZWaWXlGOv/?=
 =?us-ascii?Q?NCxZ2cLdkKaU23ZYBYzB8PE5mBGpwN1mknYsxYZW+/iiHYQdigBvRZuIe8lV?=
 =?us-ascii?Q?QZXzDQyYf++xHTE55MXwzsrmbEmwMUDsoRhnb67VRikgKqZqBD0niGyopPk4?=
 =?us-ascii?Q?zB4O769Ta/upJzjssPdUfd8BJNpQ3DJvEpjHpnRM1rzp60NWsMFmtr2xxbkS?=
 =?us-ascii?Q?EBT4qz62i1j6UNfy0J2Np/qnXPkH1+8bbs5/Gb4b8fyGEDMz0/Zq8W+086u3?=
 =?us-ascii?Q?5rhAtq6Jxd34jwgMYOO64aNrXkMUCOU0xpfXqJzSlkk8vu9qDmBvVJd91x7l?=
 =?us-ascii?Q?Z63P4RYtlxMZkBhKJk2q9JFaj3rZn/DQF1H5RPoxCObLpNLwJPwIEstQP9hh?=
 =?us-ascii?Q?NFYD8z4TgOoPJ18wg9awj/K8bLHHcbLbF87mP0TzM10R1EzFHV5j0ONCP20B?=
 =?us-ascii?Q?iZKnZvR4FqsnSKRRKQ60FRaPK5/tJ/B7Y7AlDby36LQ6YUwv1JD1v9b57SD2?=
 =?us-ascii?Q?CyjvDXNY0ofcojvFjfmc8I8Ee8gLSy/0MROw/nhjS6OtAbe/cbDGrhnsA/7F?=
 =?us-ascii?Q?tViv04SsjVwOAmVZ9p0kKCK4za4KiZew7zLgN19Jll+JGRX/fihXKbCpE4x7?=
 =?us-ascii?Q?iFFhRh2xssJJewLz5YXPpyFn150Xd20K6z3oABuE4HyvynsL2/C1QPHucHhh?=
 =?us-ascii?Q?oxxVetWK6I++/NJN0KjakzuEjAsLUg2NbLO2zwwINTtEc/Qg5inav/CCH1Xw?=
 =?us-ascii?Q?u5i4uV11vaF5gu9u+BAKL/hYJcfC/oqx1938Z4R26RhE9oKDbyOubkU1PA54?=
 =?us-ascii?Q?v2bXHVVYRdUZthDXY0YRmImFu9R45nkv4YxV?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=xsgctZ2X+m+Ql16LgIgPWY7Np8Z2UmuYzJv6/OAvV0SgdLRnMa1bPeF8r64NjxutIlIfoQV0++dOgzKQ3FEbPgckpsXR4vjIHhYyg37MOLhX+Hkoc+jdYTChtY+r/Y/eIhn5WFO7F60WFnY1OnRm4bDNaGGPFI7cTmwgo8fASEgHOVIR0aKEEyMmp77huXdHusJyMjrHQJCYXhzYn37O/FbBoWYSXMUWSjb80bAA0gf7oc2BebPIWATa0LYBDk4FIjLMKxKJ0CigXmM677AKWmjZ9/+raKaEJkM5v6AX1xaLPMXDxKS37G10U/qmV5E1XX3YFK0h7Z1kZpmFgNKOUw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZWpO/iOGJXb29LiH/vTFtVx9tDW7HvpvzqMrbwYv60=;
 b=cX8hNlSGc+Ge1ML3cDIXxqvYDf7TJF1g8Ahoo4yyLR5BuJBzNiCHs8K1uhyPGjb33drT3+GCV/n2ea5a/YKJYWt9PC8QHEWB7dqv0c+SeDgSxGaAiE0Tzdg8d1NsogSdHNTXpFh6DQslZf2tFv7dYmeCMWbIqjrrXvTjn1sOWlY9FecgAmhJHOY5vhNzh+gDzRH/VJfiChKPVH+oEUcU3e2v1owgChrUP2j9M2Z41XRZDkxzgLiRbkO5WbpdnH5m233w7OLUu0pFZ1cnLhkcEAd6U7fob+tZSpViWVLS5jyX4nOhXIIw037LejpMAav6O/zmsP4dLfPVkFfcVVx36w==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: OY0PRKrKyfME/zt/NCin6ABfRxQA4Jrx4am3Puja/E7VnmOCvFtSUB6PnQPORpuK0MO29TZX6YTwsIZJo4na5M4W60WNUMAppVMq3qJZYNt6QTpbFyKegZW/MCWGsW2U2OarsvQAeQvQmqnIFF1WalEW8xCx6Dc46SUUETfTvgNM9N5J6KWidguybEyIZQcWbk3IlCshllkPmGB3sxe1yZ6kL7Ux4YX7jraB/23BRnvhSbDFhAHSNdLcgQb3+SsSUHyZNBldMENQcgy9Cd4WPgAHjO+YfXuLkdncGfmset3TX1lNYxTKrxlvhQ0GO2iMLgEyPRCrFELv/mPxEOhihps38pAhWz58vi1kZHfeRs1aYEKfu3RNqBJnvldjA7iPz7heyL2EBsQY+xRruNsqi1PiMXxl0G8RHFyB7Av17b6WEes/Uh6SA0UAmds97hE+G7MxcbW5ULlFOPkPVWSWyjhMCSVJ/5gefzY8ERPSyna/mTHMmOCNnc+IT2+mtyE4086gy0hVaqckQwq0pM4au1a8WA5vnnCH0EIycytkRtpzCOz4v5b2ScVxKwuyTfvEihqMGFqRxQRGIiGUjKXv1gI7+s0TBi0aqV9s9MXKuWA=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: a8d92f0b-fd16-42f0-a89f-08dc6b14fb12
x-ms-exchange-crosstenant-originalarrivaltime: 03 May 2024 02:01:43.5077 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1209
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_01,2024-05-02_03,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_01,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405030012
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405030012
X-Proofpoint-ORIG-GUID: Q85tITf9vE29WzmFRZ62SWF5Vm2bdQm0
X-Proofpoint-GUID: Q85tITf9vE29WzmFRZ62SWF5Vm2bdQm0
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=bgH5IahJzsqFiomoHBRvek9X+gplIjJ59VLbaMxoc5I=;
 b=iVId4m77M45HbIrOUiLr3T7aMEnrnEVYoDLjuzzV0wsc2GQCP6X2IwWFCWSiZWzOoJoJ
 cvHdfOUqUJ+gQUsDSZo0h/sJwVLx0aT/Xgm0xPmgEFdj5HC9vaUQMRAUVJpi1kUyk82O
 gg+0dGpoVWad/449w0xkugF9/FlcmF0GEmk4ITePYrb+YV2nmxoHPfnPRXhaoRdeldRU
 1h2jqQicFgWROsg+L9O/xrZpRYnKH/7C/bAm2Xdz+kewryLamhvCG+9ML+qBkhOALpZ2
 u1AwQcov/fOlym7mFbkGFczo8uw7mAQA9N5aWa1AlHkBuGxoo+fHDgxAw5Y1kw1xE3hZ Og== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZWpO/iOGJXb29LiH/vTFtVx9tDW7HvpvzqMrbwYv60=;
 b=eQx96LlPGwZaNSqIVwg6kImo7b81rPsCEVH7Lxj0jX0TqYcPQpV+7Pmrjj6Gi9dkego+J4+FsjpPE2XA0ApDIwsOWQuk/bdxYHJtk5HQonWbQIa3JF2GSld6Ri4FJot9qvZs30Ku0fmMwWaCRMQV4bzsymZlULMD115Q5mLpeyA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=iVId4m77; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=eQx96LlP
Subject: Re: [Buildroot] [External] Re: [PATCH v2 2/4] package/bats-support:
 add bats support library
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

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, May 1, 2024 4:14 PM
> To: Brandon Maier via buildroot <buildroot@buildroot.org>
> Cc: Maier, Brandon L Collins <Brandon.Maier@collins.com>
> Subject: [External] Re: [Buildroot] [PATCH v2 2/4] package/bats-support: add bats
> support library
> > Changes v1 -> v2:
> > - fix older versions of `install` that don't support -D
>
> Hu? We use the -D option of install everywhere in Buildroot. How can
> your build work if you have a version of install that doesn't support
> -D ?

Sorry I didn't look at this close enough. It's an issue that older versions of `install` didn't support using both `-D` and `-t <dir>` at the same time.

> > +define BATS_SUPPORT_INSTALL_TARGET_CMDS
> > +   install -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-support/src
> > +   install -m 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-
> support"
> > +   install -m 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-
> support/src"
>
> Use $(INSTALL) instead of install.
>
> You can skip the double quotes around the file paths. We don't double
> quotes the paths in any other Buildroot .mk file.
>
> Also, -m 0644 is not consistent with how the files from bats-core are
> installed:
>
> $ ls -l output/target/usr/lib/bats-core/
> total 68
> -rwxr-xr-x. 1 thomas thomas  7988  1 mai   23:03 common.bash
> -rwxr-xr-x. 1 thomas thomas  6058  1 mai   23:03 formatter.bash
> -rwxr-xr-x. 1 thomas thomas   838  1 mai   23:03 preprocessing.bash
> -rwxr-xr-x. 1 thomas thomas  3722  1 mai   23:03 semaphore.bash
> -rwxr-xr-x. 1 thomas thomas 16483  1 mai   23:03 test_functions.bash
> -rwxr-xr-x. 1 thomas thomas 14979  1 mai   23:03 tracing.bash
> -rwxr-xr-x. 1 thomas thomas  1019  1 mai   23:03 validator.bash
> -rwxr-xr-x. 1 thomas thomas  1900  1 mai   23:03 warnings.bash
>
> They are installed 0755. Should we try to be consistent with this? Or
> it doesn't make sense for a specific reason?

I will change to make it consistent. Both 0755 or 0644 would work as the files must be sourced, which only needs read permission.

>
> Also, while not mandatory at all, it would be nice to have small
> runtime tests for these bats-* packages. Nothing fancy, just something
> stupid/simple that exercises a bit those packages.
>
> These comments apply in a completely identical way to the other 2
> patches in this series.
>
> Thanks!
>
> Thomas

Thanks for the review! I agree with the other comments as well. I sent a v3 with changes.

Brandon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
