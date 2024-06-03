Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B09C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC98A8176E;
	Mon,  3 Jun 2024 13:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8m2wHVXREgZ; Mon,  3 Jun 2024 13:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FD9821C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FD9821C6;
	Mon,  3 Jun 2024 13:13:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29BB01BF3DE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE79C605D8
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY7L7k5q8BXI for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B195605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B195605BD
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B195605BD
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:13:31 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 453CNP5f030904; Mon, 3 Jun 2024 13:13:28 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yfv1fd3yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jun 2024 13:13:27 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph004rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 453DDQ9n013195
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2024 13:13:26 GMT
Received: from UUSALE2G.utcmail.com (uusale2g.utcmail.com [10.220.63.42])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 453DDQoG012259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2024 13:13:26 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE2G.utcmail.com
 (10.220.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Jun 2024
 09:13:26 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Jun 2024
 09:13:25 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.143)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 3 Jun 2024 09:13:25 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1418.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:181::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.15; Mon, 3 Jun
 2024 13:13:24 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 13:13:24 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, 'Peter Korsgaard' <peter@korsgaard.com>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMFowE2uXfIQUOGHsknX9Ab6bGk+wUAgAAKYJCAANQMgIAPtD6AgABOxgCAADGlgIAABU2AgAACEoA=
Date: Mon, 3 Jun 2024 13:13:24 +0000
Message-ID: <BN0P110MB1673F110D39C8B0B371C6FC0EBFFA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F4FB992790C240CB26DCF0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004E338086FC3DF5D1A8EC8F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16731A3ED7073D2EC9481937EBFFA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50041FD2B93B66E8998BF268F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50041FD2B93B66E8998BF268F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1418:EE_
x-ms-office365-filtering-correlation-id: fe076af1-cb6f-4955-6a9a-08dc83cef34c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?lIGObvf1W2UaRhzGmiTc1pXm8gex8OTGW4hggaQxQzWU8kGYW74WJ/cJpNvc?=
 =?us-ascii?Q?WZruf77JcnGRru3MXIK29F1BTowhpBhlQ4nUdueBP0ToSUKXigAntaWpLGXg?=
 =?us-ascii?Q?S3kydY+tW0b5PIIrdVwceL6STrJ2Ro7/7rZyKYJK8kw3RQICbIm82HBgvTwA?=
 =?us-ascii?Q?Bq/a9RdPWuOM6OHEQdwiHw/PvHohklFm/nHeAGWmgxe3lgx3+zjLNJp4CZOf?=
 =?us-ascii?Q?UxGdsHLtATOXgKeidH/VODNxnJ0X1hens7mP7UtvC/ky3cmgDl/z5bp9HYrX?=
 =?us-ascii?Q?Nll0RlsQZib/fVbo/lrpn9oSWGe4Dagxnm5XnLj+hbrcMfO510LJ5W3MZbpm?=
 =?us-ascii?Q?6lXY0x6SRLKWsjnXXKMAZKb2Sv03KmIVpJFhvyBI+HKK8Lke708Qeb/t1PzS?=
 =?us-ascii?Q?IHFiOkevQvjXM5K34GbQYxgFSHtAYQuIrEYc/qJpTiSXyeADt0Df+xnllmTI?=
 =?us-ascii?Q?nvPooqWHg4vgs0r1LpmPNQRIfMyV8LXaAp/McktsGYZ0szVnRtnTiyHCLBy0?=
 =?us-ascii?Q?NAP4Xcl6mX+VlVh303cRLS4U0YgcTfFrmtDhwURL/Hui3XwmtNG0mOZY0L2h?=
 =?us-ascii?Q?oLb2SjuBCbeWsPWHeKf6Lyn5dS4E5nwyCPvvy5IN6uvhvpjsFxZ2Q96RzxfH?=
 =?us-ascii?Q?hUbgu16Xvegz8/yrqFLLMa9kPMGFeViR+HrTYwTKP8SC/64mJMULer0gBw1t?=
 =?us-ascii?Q?1Sm4y2ImboKJFx3QpZGK+pLIGV8FAJyi+UNULfk1j3jYlChLKOKNna18SjwQ?=
 =?us-ascii?Q?8fISXc81n9LkB+1v4y9kSgLnrxpEvSK9qxoTivlQl3HGhnnB7W2G3f96k3qj?=
 =?us-ascii?Q?vdSBBxWndZLyhU2J3OEqZnYdZtclRu/GHUYzTCr0+uyzLH8POFjNiSFE8eSd?=
 =?us-ascii?Q?+B1KTKQ6hFrETNUs1NI693A8Jj40Y5L58KEPx+47fym3M1YfCCSVlIDsTMti?=
 =?us-ascii?Q?LV1Y7Fq7ewWBOe1oU8Ae5hprSX6yrevSdfD92Hj3uHDaMorF3ysZcMlXERGi?=
 =?us-ascii?Q?Zop6Ak6QD/U3+v1ZJUcyZDqeLA+tgTvTvLTJZrBg4O5ZOl8mYSOpfTfj6Qt3?=
 =?us-ascii?Q?rcxJYiblaG4A1q+ZCb+2xDvMY8kOg7Cuf72K3bfs2jGkObXwt0PG4MPq4VR+?=
 =?us-ascii?Q?VArB73+zpXCAcZPuI4HxfacgdXPB3Ugb//Xtsb1QF6icjhmh9hu6hpEkupaB?=
 =?us-ascii?Q?8JAJ8rmwcKIDP/RUF1RSfP5jmiUfbjaGoAbQInPkh+Filt8BTwT5NdhEj3Ni?=
 =?us-ascii?Q?wY8/sgewnUyDGWQje4Ca503JxCpXK8xG5NPvYr3E3DkcKNDBDipcmvokLhU2?=
 =?us-ascii?Q?lgZ2D+yeJIS7smAgC2lmvOlE1X3VFzaLUnMgs0EMULf2nA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ch2zmymRY10Tn9Q0hcce2oxxdZmr4Qqig32WM93rHYlAeuuk9bH5pUOPtgCF?=
 =?us-ascii?Q?320tB27uAQpn/n/PKheWhUv897Z6Uetm8QCTRVYVNA5Nw8qohofeH7Zrtjkf?=
 =?us-ascii?Q?i/hbtXmnFR2mRYnfTgcT2yHcsHAKuMUiSXe/odJQihtjDA5R2mk3QovagHg7?=
 =?us-ascii?Q?J7igT12YwNmK/MBDIJzhhN2gpnK4ByLn9Sca0EPB+0VgI1jQN1AVtODQ1BQH?=
 =?us-ascii?Q?kZZCcg7hLLOPpBGjXtTHVQwkuXMQOM9bEcEPIhjiiCkuIEjAzNiF4mLvbXhk?=
 =?us-ascii?Q?HzyF43WaFRzUtNKwS1F4ySiShf18g7kgw08EOitqmHaKZibzPsPSsdxwpSk3?=
 =?us-ascii?Q?vZmHRjlXeVONW3XzSsSBJduiioCAJjbuAtyEAGvfRIKQbK3YDW29fB8XLiPs?=
 =?us-ascii?Q?a7U2xZopLkLCA5fsTeQ4PKALY2IIGgU/MgxY5zNNnSxzy/CG2QN8PukS32EU?=
 =?us-ascii?Q?dkRMjX6D990EXfklRSzQEx002i/oq1ncNVY7KzzCObqwStRjKrGsSf9ZBqNe?=
 =?us-ascii?Q?nczDbeRvM2Mf//MQaHRmycn2y1qNxphnh8reBMFNrTCVzuBJ/9kB1gaVdKEN?=
 =?us-ascii?Q?uugdtGECSpLOOMIiQJV41eKBdy5/aKTbqtaDs1JZy7Kq1TEm8XxKXftGZY97?=
 =?us-ascii?Q?+ZpallaYzzu/4cLoNYjFcKpIpE5zYfUYiB2+5qHDhFjMgXmX8VWggKCw9KYn?=
 =?us-ascii?Q?n9M4I1qAKJIoJa3uZCFyZB3KMaKUt1AwM1q07unk2LKWuigmv4n+CDnqxL4O?=
 =?us-ascii?Q?sBJS9Cc3db2ciEXnOkY6SVTHMCKO2GHuTF5MAErWF3mnR8xzIPy9Pa2Xu+CX?=
 =?us-ascii?Q?vJyNLxx54uBtKzjAvN1w24CusrJruOETJAg5qlGxhO94dbihW6xd8O10TVRl?=
 =?us-ascii?Q?6qLUsMS0gujpa3ppB35b9VC1WnCx/Rs4WCiGOGE3GHiJEfWkED/KLhxEDEa0?=
 =?us-ascii?Q?onjB4aNV/55ls7Ui555H3pxQiygi8/TA87BNaskH6gHjh5oy6ZfcFVRInHZW?=
 =?us-ascii?Q?HxOMh42QhQ4S/RF0b0IhAfSlZZfQtZWRaj8LUyCY1yzEKAws1ueXE5IURolW?=
 =?us-ascii?Q?BvBksHaZcHCjKRocJJZ7hEFnVbr6VzjdO/wzIuL4Fdo6oCw15K89N22W52Rs?=
 =?us-ascii?Q?jHvt+K2m5HNnlUtNlZSKyNbgDTh85VCjRpGftnVNb9C0Xm05hJv7lS76oEab?=
 =?us-ascii?Q?hxuwi/Xx7B7EpqoWAmXB2g49eVyPvqcpKMH1ZRdeyK+BZtBxZQ2OQX5pn2cJ?=
 =?us-ascii?Q?m/FrpBZ3dCm1RUr0lW2TP0ohdP+ObuBHGWzR9gbEVGu3O4FfGCShyMkNuUep?=
 =?us-ascii?Q?DzStahqXHR5rmPboI4bKHe4/5gJOkvJ0ksQ0u5RFCR4GyMUNOZ1i+iTHqmvS?=
 =?us-ascii?Q?K/5jHW8nxwg3A1pp4N09EWIeB5mIfFwieyPVheVcBtguS9VX4wMitK0JVU63?=
 =?us-ascii?Q?lzZq/rCrlf0bUEeEvTnF6kCqDJWjhm4rO9dc0dppcbRVc5Xx3fhc0WZjVkxr?=
 =?us-ascii?Q?EZH5PTwRyy7Rbw0=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=NEiwXnjnjQfGcJSleAEpB5XfJBezoPCa4MzMOTZFNktE13Cjv5cGEQm6IOLJ3fkymA2aZ7RiO7u4lxP1gkpSiuaQYwz8cOp9KgCudm7xlj9+kIVLyGq2QFtI0APPYXjC91pNd5kqn8+AFXu01/jpcxLdct2JP1ohMh6EoCxBvET9+Pl3cFTyK0AbXkeabuq3omS99/VxilZ0S6faMmJ0sCGXkNsgtBviuhTFYEKeeuUbf/lp2IMPR+fboWPPMqEZUtVk1lXtfiUsNQq4AFS50eqirRwGuR3/9qEmdpY7q0i7MZFORk9CnSlVh4drk0hT1uohmvNdHdRwMU+Qpt3JPw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOZexcov92jb02WB5emaC23dJl4hLOPPYBbqXvHeK3U=;
 b=SS7CLJ5kt8R6WrbjGpXxSYI8KdKzh3xs7Yla0eQ7yobBuibkWyRKNfLdBnMXz+uqL/swVL0f7Cj0qVABObBS4v+ZZi8PBwJbKvnDn5ukHsGpGaJiQZu6FKozbrS6Hq8vny7uXofqRSabi7UYvV9JxDydexvXUSrSa9/e6W1HBF/CEunNFalk2oT4QUIKkWuqFWYR/LGlQWLhhS9z+RUwrw83aqYo9HYVVB2yJjkSjyL600MYaBMTBMMz76xXrxg3ii+ahDf2qiEKaz7sandDTuzG3B16QdSByUZI/04dvOyArixJuKlK/5GT91FYowCBinc3HUW4ayuHK8L3XeyTyg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: TOkrTFn8lC3LsVcwVj9qwuoinkb50ur2GPJk7402xq+EuTQTbFkmtgXSxg9hN/EKANCL5cAMXlpx68Ns1VG1MCa69LbLeiVNm4OJ52261UxDPiSorN37OKQlwGmZOuIDXR8jirYWJFe+SyxrlVAPOVrsi0lwiRcp44D8HgerTt16zjXXEyX5zPFOnkBKw7TvPPgikiG+AouzZSuiqktEsELGjvDeypxj0hc+oWqDl3OhzFKdkANpfOp+A3521LskqrI39ZqFwNKcOdksfrAYjJzl5zV/d0h2G0N4wBNv01W8bYh/ewVOtGrZu4hTfbRZ4lriuDAcBkv2zm70viuZTSugKsiUKstejs953H7PpUSg07TJElqnO/xsaBoFwnGApK6gM9sNpQwTpL4J+vFRwSr3i5QQNewMTC4QyvuwGEtYW6wfeGIyjpmB/xm3IkhIjs5kCywfKAnMdYdSclx12iBge8W52pjsoUD7uIFy5kYg7mlScJUS2gsIxn+yCobLvMiLHaS33cDscQfg9Yhkl1JUwIQXrKtTnfevOThlHXk/amgpANWMm3IBZdKQ8t8RQ0gV+eRwqBCa1OxHDta46KONLDOfbGGzw9TheHpAPsg=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: fe076af1-cb6f-4955-6a9a-08dc83cef34c
x-ms-exchange-crosstenant-originalarrivaltime: 03 Jun 2024 13:13:24.7759 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1418
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=431 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406030110
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=493
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406030110
X-Proofpoint-GUID: cw7daOnQnne5ZAuyJQttnIz1JE7mcVzY
X-Proofpoint-ORIG-GUID: cw7daOnQnne5ZAuyJQttnIz1JE7mcVzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=504 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406030110
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=LUR0giF6XSn1LRl03lM+jr2Wt2EjUCtUiywmYEYIrJQ=;
 b=H+p6fKeeOFHlwp8FeFlGeB7ePi4mQxaFhpcvFHt/kPOFrchqD6GpMiywC7JWOU7E9OKg
 ea5C4UdvF2GXurVpntztGkbhk12f6D2AlTkRjRHgRVdz35a8WM/rdfB13dFr5llz1qSN
 rPpnXFNv5HEzQ1pBIJ4BbiuuQksMfJXFV6yXqaZ+RuHYDEtwKUZ9cnPLLZ5IaLIt7JuQ
 4Pp8s9qBaeA6XiGTKMD7IPZiG4r0vdHtv8eIrK+S/cyTPCRnZaq4IRJZEpWAdaB2Fkdh
 DW8qo1Jv3KhU6g8oEKF3Znse0QDA/xgoX9vvuDAtA2zq+IdpxppCmqdrlR/mNgfv5J18 rg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOZexcov92jb02WB5emaC23dJl4hLOPPYBbqXvHeK3U=;
 b=OxvmXwd/ujxq3ArFp2uPVuExKw1+/uT2ZK2sAZG8urb5dQq3X63GI5f2KRyafX5P+EaGTF8WxN9B858aNZUzyEIXsRyVOAZM0G7Ps2Y6yFOV0PGnoDI7EUcMPlJstcORragAtmDQLmwibTUuEL61LM1Iq7yw75pkvGo+JloMFdw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=H+p6fKee; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=OxvmXwd/
Subject: Re: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Frager, Neal <neal.frager@amd.com>
> Sent: Monday, June 3, 2024 8:01 AM
> To: Maier, Brandon L Collins <Brandon.Maier@collins.com>;
> buildroot@buildroot.org; 'Peter Korsgaard' <peter@korsgaard.com>
> Cc: luca.ceresoli@bootlin.com
> Subject: [External] RE: [PATCH] configs/versal_vck190_defconfig: add hashes
>
> Hi Brandon,
>
> > I have another thought on the subject of the hashes.  All of the Xilinx hashes
> > will be the same regardless of whether it is a zynq, zynqmp or versal board.
> >
> > However, sometimes, we may have actual patches that only apply to a single
> > family, like the ATF v2.8 patches currently in the tree.
> >
> > In order to avoid duplicating the same .hash files 3 times, what do you think
> > about creating a board/xilinx/patches directory for the hash files?  This way
> > all the hashes can be common for zynq, zynqmp and versal and they can
> each
> > still have their own board/<family>/patches directory for family specific
> > patches.
>
> > I was using the ./utils/add-custom-hashes script to generate the hash files.
> That
> > script truncates and writes each hash to the last patch directory in
> > BR2_GLOBAL_PATCH_DIR. So, this would work if the board/Xilinx/patches
> > directory is last in the list, and all the boards share the same versions.
>
> I do not believe the ./board/xilinx/patches directory ever existed before, so
> the ./utils/add-custom-hashes script would not find that directory.

That is correct. I'm just stating if we add a board/xilinx/patches, it should go
last in the BR2_GLOBAL_PATCH_DIR. That does not matter for the Zynq boards,
as they are dropping board/zynq/patches/. But will for zynqmp which will have
board/zynqmp/patches and board/Xilinx/patches.

>
> Are you ok with my idea of creating this directory and putting the hashes for
> all the Xilinx boards in the same place?

I like this idea. However, I'm not a maintainer so the final decision is not up to me ;)

>
> Best regards,
> Neal Frager
> AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
