Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6182C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B8B81D19;
	Tue,  4 Oct 2022 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B8B81D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3ndJktezDHf; Tue,  4 Oct 2022 21:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE92481B53;
	Tue,  4 Oct 2022 21:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE92481B53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7825A1BF388
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 21:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CFD360AAE
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 21:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CFD360AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAU0nCnD9uhP for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 21:37:21 +0000 (UTC)
X-Greylist: delayed 00:44:48 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 490CD60AAA
Received: from mx0a-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 490CD60AAA
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 21:37:21 +0000 (UTC)
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 294Kpjx8015346
 for <buildroot@buildroot.org>; Tue, 4 Oct 2022 20:52:32 GMT
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0b-00105401.pphosted.com with ESMTP id 3jxy7dttsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 20:52:32 +0000
Received: from qusnwafd.utcapp.com (qusnwafd.utcapp.com [10.161.48.100])
 by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 294KqVeq094299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 4 Oct 2022 20:52:31 GMT
Received: from UUSTOE29.utcmail.com (uustoe29.utcmail.com [10.221.63.43])
 by qusnwafd.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 294KqUDa006703
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 4 Oct 2022 20:52:31 GMT
Received: from UUSTOE21.utcmail.com (10.221.63.21) by UUSTOE29.utcmail.com
 (10.221.63.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Oct 2022
 16:52:30 -0400
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE21.utcmail.com
 (10.221.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.7; Tue, 4 Oct 2022
 16:52:30 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by uustoe1z.utcmail.com (10.221.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.28 via Frontend Transport; Tue, 4 Oct 2022 15:52:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=sFrHhtopwhNRi2jN8kGJokDlmW1h1YCXYVgx2DFKIhC15lfgFIQRf+aarjWwsPr7LjmWzPUrd7y+NQ5jl107Mx+LCk+Kxx3Fdr3Ha6YAyk2bPjuhZZCgZWECqh62F4AV47aQPJZsDA7VoCY2TnT/dhZiNm5xF1+4qmaYpf4uICQfYC5SoC9E1u0prEiRpW1mjiBZno3f3fLrxP0XQeso0p1JbwjgWPa9Dy3t72v+KYPQZm/PV4942loyjZaazAn7FGhP6IwdgPNj5s1PGkEnI3Yq/rxvcIqtP20N4gHKDBtK82uVGVd7pdUUViSBMfBRqhHPMce9TSYx/M38nFuS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f09ExFFYxMewNudbHzjv+J63vY4efIxeED1n40tgn/c=;
 b=sS3yyupo4qg57elIETG7d9pGRhA16CU8Lvn+sg6q20iCttbXesjds1Wvs0ViPh75ItJGLAbVz/s7VURnUssuxu9T/l3cwX8jjIroM+thGH9/JGOdLPa1juKCHgu0bGznI4Gn5JI3qhSkvm2ra9nFkqukSDD1seGarTkQbzBGEtFM/ZBAvaAVR3jBDlt9xqY1wK8q+/oj4bi0TqWUHzTOtFafowZ7hnY6MMtODMdVjZWfc7wm3ff0/WuaI1SNYycYM18rxvu+Lh+sTtOuiKtM2UmXoDIdwcci1MCSkWz/rL9YvXkJhdS/CXbqGoscQC+hFBxp969OzGSKEL5DzkVyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
Received: from PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::6)
 by PH1P110MB1773.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Tue, 4 Oct
 2022 20:52:28 +0000
Received: from PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d44:f768:7d87:f252]) by PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d44:f768:7d87:f252%6]) with mapi id 15.20.5676.020; Tue, 4 Oct 2022
 20:52:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/redis-plus-plus: new package
Thread-Index: AdjYHziVisQrde5JSMCOmwvsseeIGw==
Date: Tue, 4 Oct 2022 20:52:28 +0000
Message-ID: <PH1P110MB1067CABC2A1E8C76A1B17121EE5A9@PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1067:EE_|PH1P110MB1773:EE_
x-ms-office365-filtering-correlation-id: 3ea36eb5-9704-4339-2fb2-08daa64a59b6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SpXcRr+YQjAzM/L2RGOlj3ViiZ+hlOkhA0tJ8xYxMThx6jt3itIHwSEv1X4YhsLJhCdu598CfX3DYfzF9Etz3eGPjn49UjTP77+chp6BreLxaZMvSUIUXYIUP69SgWg4Hdgx+kfLzUqovWd1yHtskMlL+Gx8Vwpv5eUav0xuTPI6LkP83t5dD0Sjjo1xKMr2QRxetrjy5LmsfwDS0QjQTRiEPiKmlpNOp45Qqpe4Rd06MF7QmxzyQ/zJRDWP0ERuk9s0iZ6nYvoo8L8dTwX0ymwsJr4EJ2LlvjtKW4fseHQe0PGsAIO3pwwJGP5Rqf7IbbyGjQVKpScvzao2wnBo9G5+zLxCUKtzToaE4jpIFiJ6KrfCLRsbo4/9wEKqfEEmTNEacV3Su6hJ3CcqIVuGqX5rJDhLWhwuCJH0MfUUpovm/f3EvVh31TAxC/zuChqo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(451199015)(498600001)(66556008)(76116006)(8676002)(66946007)(2906002)(64756008)(4326008)(66446008)(71200400001)(86362001)(122000001)(38100700002)(99936003)(26005)(82960400001)(4270600006)(6506007)(55016003)(38070700005)(7696005)(73894004)(9686003)(107886003)(621065003)(6916009)(186003)(66476007)(52536014)(33656002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yWosuBFjd0s8tM7GZHtMR98WtsRf1Rpe1cRDzniCwed2e5pEplzvDuwyLxAP?=
 =?us-ascii?Q?lH/3cAAK9RzEK+skMsqMfMEDh3BgB2nSJwOHbhoGFFrJSFbyxrfF3ABe2CB8?=
 =?us-ascii?Q?Qhu/SN9pmQcbqX0wWPMy8ZVnJ1UH4fmKc8vLodxOj20eyKxK0nohFybt8m+Y?=
 =?us-ascii?Q?5BM8rGwuUvTqsBl2bAHSX4zy1XVe4EGjsScyOcEqYaHAvpkd95J+yKeoLS4A?=
 =?us-ascii?Q?RRIeoyP9CQBQAzQ+LsH+3Z9sLa+K2103COK0lbksWgoltQDxPncmW1ZOIgIG?=
 =?us-ascii?Q?vRZHl+hHme8paUR2YfMc2dfcepSQnIXrb/hzEZyqI5uyMTdw/K0Y+iHgrACu?=
 =?us-ascii?Q?BwWoeS+Svf/gKmpWtiSc5LnIM6GvNc4lklyXOwG900ZPImGC/caSm92QcE6w?=
 =?us-ascii?Q?YJUsw4Lb838sZVmvVnN8I5ugNpDlEX6cv578aSuOxQfOzKp87c8cYr2vBrOA?=
 =?us-ascii?Q?eX6XTUR4sS1IOagJ8ll7MMhofVEX62Kfuvv2TgC15owbY8nOoIpsYYlfwhk0?=
 =?us-ascii?Q?1B1y1tlyePrfWNpcphjnYPyMPTfX+4rnlD8zKV+wXKs/TSLGQrE70qD/uKdd?=
 =?us-ascii?Q?1Ez/Cm5zMtFupoJofoa1TCOj0ww4NbnyMQC5p/ctpj1Bd/jpXnJLWBhpWSOs?=
 =?us-ascii?Q?33pxihvS9sV0c+NLv1h95m54xf7sDaGWhahwLXi1SIz9wK/ax+QRbx16zRYH?=
 =?us-ascii?Q?bSKXfxY/ZCEq2YaUFHN785QzWQTwUGccQEiQU51nV/jbhcIkAZvEWJhPPDeY?=
 =?us-ascii?Q?Sob1T8eGtJFN3yvdpwR7lznFLzGw6RuAj2K9F3TNEnJtfNnkS3KwmQTNzuzo?=
 =?us-ascii?Q?wZlQ/kg/Z5yVC6mcTCAvZphVMSq/ATmbIpGj9HZWU+k6dACReO7lays8pjQ9?=
 =?us-ascii?Q?VW+1YhP0FBNizjMTGNlXmZwmYTgjizy315gHtlYsbrFetArZf9eAPsSzzSm4?=
 =?us-ascii?Q?Xl9rjrQLWTqlGlk6k+U2QZoSd4OUrpMosAyWxZ3q6NamADDeL9Y+A+yN/XPu?=
 =?us-ascii?Q?yvueHYWvWujApxhZYJrGig3jjAF+M7e6VpGJjyJgztP0QyppwemCZr3hnFZL?=
 =?us-ascii?Q?W7rEAlybdZuk5gMjAD+8oWaZkDTTbLAAtvijux+7r18m9GIDHn7QvsNqhmja?=
 =?us-ascii?Q?rp1v7vHG71nmmPsIya5DIxpoH5x11OPvXSM4kpQiIdWhTUKZCiDfLWXPKoQP?=
 =?us-ascii?Q?07jGujpDlp+M/5tbYZDui1hV1dBX7QQnvX0khEj7IqAXs2wXvEaQc8bYW6t/?=
 =?us-ascii?Q?jZodRg6F7asi1SL17kEUMMneBjpfjtGKf/Da8tGFTNigIUUWSbFoKx/M39ew?=
 =?us-ascii?Q?S5MZiRIofcZDTwB3khmnlReEoIXgLs7fzF2GFCZlSqWY9stYLmtMCpsPZZDQ?=
 =?us-ascii?Q?aOE5EgUZjmqBsKvNYyT6i1QHzDDIV20VeAtAmzTu7+vYL6bpfZsIFTmjUo93?=
 =?us-ascii?Q?4Vl7KF6B0oGb7TDcboe//+0uUaEFMA/HWJfuI8pVP82D8krHAiQ+ZfxnuWUS?=
 =?us-ascii?Q?ny9OFCqjC8ByxI0=3D?=
Content-Type: multipart/mixed;
 boundary="_002_PH1P110MB1067CABC2A1E8C76A1B17121EE5A9PH1P110MB1067NAMP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea36eb5-9704-4339-2fb2-08daa64a59b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 20:52:28.9093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1773
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: zjGn5gg9fEt9Uy7QPoOVKrQpbj_dZqBN
X-Proofpoint-ORIG-GUID: zjGn5gg9fEt9Uy7QPoOVKrQpbj_dZqBN
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=656 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=POD051818;
 bh=f09ExFFYxMewNudbHzjv+J63vY4efIxeED1n40tgn/c=;
 b=Ml3gvPwNtBHk3xWgoEnIKHQE02q5VS2x3VFGRoKPGl07akEPvUh8CaIaeKJWW3F2Xlpz
 dLI0BZslw3GV+P/NgUFf0MaAe71EIcHKwWe5T3EIUBj0w4clw7eMMxW2LBB8AxHOhH9g
 Zf7GSM3PKni4Lads+UVbEcdCKQBHQi5yyCfe4Y3fQCWu5UpLt1oRRHuWQdoAydBqhFy1
 Z1U96DcAqWK3W/Zh1RoRDUpzImlOlpeT6zpQ00HTaaEFeCyvT/mYJYOtGdkkASu6a0za
 bXkA8A29JQJFpGZ1W2UT2NdM1W7Tq5xHGVlshwHTa4TaVMfBuR5ufSmhLZQRFyr3qFfh 4Q== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f09ExFFYxMewNudbHzjv+J63vY4efIxeED1n40tgn/c=;
 b=WouGAJVBCftgAvtfaKxjXpSmqLaPWVHoIGIeh33DQQ4Z8Ew3mVMMV9+h2F+mrjR0SPAm6rcP42+P6pneJeYUFqV/kbgTWVsLJkdnHBw9XC6NzJRGrj8wf4ME9hvPGCV5ZPwB2OTBF/yYM8YZuzR7INE99RrWaNZM41vvMB6U1NQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=Ml3gvPwN; 
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=WouGAJVB
Subject: [Buildroot] [PATCH v1 1/1] package/redis-plus-plus: new package
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
From: "Sannachi, Prabhu Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Sannachi, Prabhu Collins" <prabhu.sannachi@collins.com>
Cc: "Sannachi,
 Prabhu                            Collins" <prabhu.sannachi@collins.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_002_PH1P110MB1067CABC2A1E8C76A1B17121EE5A9PH1P110MB1067NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



--_002_PH1P110MB1067CABC2A1E8C76A1B17121EE5A9PH1P110MB1067NAMP_
Content-Type: application/octet-stream;
	name="v1-0001-package-redis-plus-plus-new-package.patch"
Content-Description: v1-0001-package-redis-plus-plus-new-package.patch
Content-Disposition: attachment;
	filename="v1-0001-package-redis-plus-plus-new-package.patch"; size=3947;
	creation-date="Tue, 04 Oct 2022 18:23:26 GMT";
	modification-date="Tue, 04 Oct 2022 20:52:28 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlN2VmMTlmMzZhOTkyOTU0YzY2ZTQ0ZGEyZjMwZWQ3Y2QwNjY5YTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBwcmFiaHVzYW5uYWNoaSA8cHJhYmh1LnNhbm5hY2hpQGNvbGxp
bnMuY29tPgpEYXRlOiBUdWUsIDQgT2N0IDIwMjIgMTI6MTc6NTEgLTA1MDAKU3ViamVjdDogW1BB
VENIIHYxIDEvMV0gcGFja2FnZS9yZWRpcy1wbHVzLXBsdXM6IG5ldyBwYWNrYWdlCgpSZWRpcyBj
bGllbnQgd3JpdHRlbiBpbiBDKysKClRoaXMgaXMgYSBDKysgY2xpZW50IGxpYnJhcnkgZm9yIFJl
ZGlzLgpJdCdzIGJhc2VkIG9uIGhpcmVkaXMsIGFuZCBpcyBjb21wYXRpYmxlCndpdGggQysrIDE3
LCBDKysgMTQsIGFuZCBDKysgMTEuCgpodHRwczovL2dpdGh1Yi5jb20vc2V3ZW5ldy9yZWRpcy1w
bHVzLXBsdXMKClNpZ25lZC1vZmYtYnk6IFByYWJodSBTYW5uYWNoaSA8cHJhYmh1LnNhbm5hY2hp
QGNvbGxpbnMuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvcmVkaXMtcGx1cy1wbHVzL0NvbmZpZy5pbiAgICAgICAgICAg
IHwgMTEgKysrKysrKysrKysKIHBhY2thZ2UvcmVkaXMtcGx1cy1wbHVzL3JlZGlzLXBsdXMtcGx1
cy5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3JlZGlzLXBsdXMtcGx1cy9yZWRpcy1wbHVzLXBsdXMu
bWsgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9yZWRpcy1wbHVzLXBs
dXMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9yZWRpcy1wbHVzLXBsdXMv
cmVkaXMtcGx1cy1wbHVzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JlZGlzLXBs
dXMtcGx1cy9yZWRpcy1wbHVzLXBsdXMubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVW
RUxPUEVSUwppbmRleCA1OTEyMWM2Li4yZjI0ZmNhIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisr
KyBiL0RFVkVMT1BFUlMKQEAgLTI0MzUsNiArMjQzNSw5IEBAIEY6CXBhY2thZ2UvbGliZHZicHNp
LwogRjoJcGFja2FnZS9tcmFhLwogRjoJcGFja2FnZS9zeW5lcmd5LwogCitOOiAgICAgIFByYWJo
dSBTYW5uYWNoaSA8cHJhYmh1LnNhbm5hY2hpQGNvbGxpbnMuY29tPgorRjogICAgICBwYWNrYWdl
L3JlZGlzLXBsdXMtcGx1cy8KKwogTjoJUmFmYWwgU3VzeiA8cmFmYWwuc3VzekBnbWFpbC5jb20+
CiBGOglib2FyZC9hdm5ldC9zNmx4OV9taWNyb2JvYXJkLwogRjoJY29uZmlncy9zNmx4OV9taWNy
b2JvYXJkX2RlZmNvbmZpZwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdl
L0NvbmZpZy5pbgppbmRleCBlM2EzNGQ2Li44MjM1ODY0IDEwMDY0NAotLS0gYS9wYWNrYWdlL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTQ5MSw2ICsxNDkxLDcgQEAgaWYg
QlIyX1BBQ0tBR0VfUE9TVEdSRVNRTAogCXNvdXJjZSAicGFja2FnZS9wb3N0Z2lzL0NvbmZpZy5p
biIKIGVuZGlmCiAJc291cmNlICJwYWNrYWdlL3JlZGlzL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBh
Y2thZ2UvcmVkaXMtcGx1cy1wbHVzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvcm9ja3Nk
Yi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3NxbGNpcGhlci9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL3NxbGl0ZS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JlZGlz
LXBsdXMtcGx1cy9Db25maWcuaW4gYi9wYWNrYWdlL3JlZGlzLXBsdXMtcGx1cy9Db25maWcuaW4K
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uM2MyM2RjNQotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvcmVkaXMtcGx1cy1wbHVzL0NvbmZpZy5pbgpAQCAtMCwwICsxLDExIEBA
Citjb25maWcgQlIyX1BBQ0tBR0VfUkVESVNfUExVU19QTFVTCisJYm9vbCAicmVkaXMtcGx1cy1w
bHVzIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9ISVJFRElTCisJaGVscAorCSAgUmVkaXMgY2xpZW50
IHdyaXR0ZW4gaW4gQysrCisKKwkgIFRoaXMgaXMgYSBDKysgY2xpZW50IGxpYnJhcnkgZm9yIFJl
ZGlzLgorCSAgSXQncyBiYXNlZCBvbiBoaXJlZGlzLCBhbmQgaXMgY29tcGF0aWJsZQorCSAgd2l0
aCBDKysgMTcsIEMrKyAxNCwgYW5kIEMrKyAxMS4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL3Nl
d2VuZXcvcmVkaXMtcGx1cy1wbHVzCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JlZGlzLXBsdXMtcGx1
cy9yZWRpcy1wbHVzLXBsdXMuaGFzaCBiL3BhY2thZ2UvcmVkaXMtcGx1cy1wbHVzL3JlZGlzLXBs
dXMtcGx1cy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjkzZTU4ZTIK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3JlZGlzLXBsdXMtcGx1cy9yZWRpcy1wbHVzLXBs
dXMuaGFzaApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkOgorc2hhMjU2ICBh
NDlhNzJmZWYyNmVkMzlkMzZhMjc4ZmNjNGU0ZDkyODIyZTExMTY5N2I1OTkyZDhmMjZmNzBkMTZl
ZGM2YzFmICByZWRpcy1wbHVzLXBsdXMtMS4zLjUudGFyLmd6CitzaGEyNTYgIGM3MWQyMzlkZjkx
NzI2ZmM1MTljNmViNzJkMzE4ZWM2NTgyMDYyNzIzMmIyZjc5NjIxOWU4N2RjZjM1ZDBhYjQgIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVkaXMtcGx1cy1wbHVzL3JlZGlzLXBsdXMtcGx1
cy5tayBiL3BhY2thZ2UvcmVkaXMtcGx1cy1wbHVzL3JlZGlzLXBsdXMtcGx1cy5tawpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4xNDVmY2JlCi0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9yZWRpcy1wbHVzLXBsdXMvcmVkaXMtcGx1cy1wbHVzLm1rCkBAIC0wLDAgKzEsMjcg
QEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHJlZGlzLXBsdXMtcGx1cworIworIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUkVESVNfUExVU19QTFVTX1ZFUlNJT04gPSAgMS4zLjUK
K1JFRElTX1BMVVNfUExVU19TSVRFID0gJChjYWxsIGdpdGh1YixzZXdlbmV3LHJlZGlzLXBsdXMt
cGx1cywkKFJFRElTX1BMVVNfUExVU19WRVJTSU9OKSkKK1JFRElTX1BMVVNfUExVU19MSUNFTlNF
ID0gIEFwYWNoZS0yLjAgbGljZW5zZQorUkVESVNfUExVU19QTFVTX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFCitSRURJU19QTFVTX1BMVVNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCitSRURJU19QTFVT
X1BMVVNfREVQRU5ERU5DSUVTICs9IGhpcmVkaXMKKworIyBzaW5jZSB2ZXJzaW9uIDEuMy4wLCBi
eSBkZWZhdWx0LCByZWRpcy1wbHVzLXBsdXMgaXMgYnVpbHQgd2l0aCB0aGUgLXN0ZD1jKysxNyBz
dGFuZGFyZAoraWZuZXEgKCQoQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOCkseSkKKyAgaWZl
cSAoJChCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF81KSx5KQorICAgIFJFRElTX1BMVVNfUExV
U19DT05GX09QVFMgKz0gLURSRURJU19QTFVTX1BMVVNfQ1hYX1NUQU5EQVJEPTE0CisgIGVsc2UK
KyAgICBSRURJU19QTFVTX1BMVVNfQ09ORl9PUFRTICs9IC1EUkVESVNfUExVU19QTFVTX0NYWF9T
VEFOREFSRD0xMQorICBlbmRpZgorZW5kaWYKKworaWZuZXEgKCQoQlIyX1RPT0xDSEFJTl9HQ0Nf
QVRfTEVBU1RfNF85KSx5KQorICBSRURJU19QTFVTX1BMVVNfQ09ORl9PUFRTICs9IC1EUkVESVNf
UExVU19QTFVTX0JVSUxEX1RFU1Q9T0ZGCitlbmRpZgorCiskKGV2YWwgJChjbWFrZS1wYWNrYWdl
KSkKLS0gCjIuNy40Cgo=

--_002_PH1P110MB1067CABC2A1E8C76A1B17121EE5A9PH1P110MB1067NAMP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_PH1P110MB1067CABC2A1E8C76A1B17121EE5A9PH1P110MB1067NAMP_--
