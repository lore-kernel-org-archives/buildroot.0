Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB1C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 12:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC2C8175F;
	Mon,  3 Jun 2024 12:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y8MdeKG4OV3; Mon,  3 Jun 2024 12:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D54816E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D54816E3;
	Mon,  3 Jun 2024 12:56:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3102B1BF3DD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AA6F6076B
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJaqzEm0vdXR for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 12:56:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBFE7600C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBFE7600C7
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBFE7600C7
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 12:56:27 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 453CNM4q004500; Mon, 3 Jun 2024 12:56:22 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yhc4ysa3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jun 2024 12:56:21 +0000
Received: from xusxph004rp010.corp.ray.com ([128.13.120.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 453CuKPp012916
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2024 12:56:21 GMT
Received: from UUSALE2H.utcmail.com (uusale2h.utcmail.com [10.220.63.43])
 by xusxph004rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 453CuKv5004394
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2024 12:56:20 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE2H.utcmail.com
 (10.220.63.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Jun 2024
 08:56:20 -0400
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Jun 2024
 08:56:20 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.143)
 by UUSALE2B.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 3 Jun 2024 08:56:19 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1962.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 12:56:18 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 12:56:18 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, 'Peter Korsgaard' <peter@korsgaard.com>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMFowE2uXfIQUOGHsknX9Ab6bGk+wUAgAAKYJCAANQMgIAPtD6AgABOxgCAADGlgA==
Date: Mon, 3 Jun 2024 12:56:18 +0000
Message-ID: <BN0P110MB16731A3ED7073D2EC9481937EBFFA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F4FB992790C240CB26DCF0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004E338086FC3DF5D1A8EC8F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004E338086FC3DF5D1A8EC8F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1962:EE_
x-ms-office365-filtering-correlation-id: 02f89b45-7ec5-4476-a73d-08dc83cc8fd5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?rwIyyC73LPLN8vA2RaU+cgT+jLHf0n2BOWlQ3zlDVNdtFFJ1WZljsimcgint?=
 =?us-ascii?Q?NRj5KMO6U9kzpnlLRHtq1abbmAnds6AXNBGEjyIG3n0JGECbPZQtwYigSEfx?=
 =?us-ascii?Q?5UCDrCpUcvX0vAReJosb668wBsTj6UXkA7Xhqj9CD/bLeWYY1n6fxKWEAz+8?=
 =?us-ascii?Q?YKbs/XF51zVLLxX/i1C6GyO36Gj/mvhQekPqTSOxuRWyldjaOnkLu+vzuzio?=
 =?us-ascii?Q?eSGwPaeytPLoj+SQln2lUNgJU7dZqiDZAVoOxtZR9sPshyY7d41Ybbj+UxqG?=
 =?us-ascii?Q?2kBzczMDsTMg2kkpfnpE8xzS8YQ7hL+MVryLluMwdwvYRVpzj1h2wDNJ7F3u?=
 =?us-ascii?Q?Mfjpku7KPf8r2Tyxtw/8xiDDgBJIr8rJBQ3PVkyyf4bBsrW/fX8bCXHRXyzS?=
 =?us-ascii?Q?xIQf2kBG6OosD41Vj4nQ83OVn5DOoPgVXE3AU9GaFfvuD8dD8CQSQEM5SGqv?=
 =?us-ascii?Q?smlZOLitZBgJI38EwnWk1IwEtBlUWJ5me4RQJSP58mmUHZvattxaNoVK5mCI?=
 =?us-ascii?Q?MxQWVNx7t8Wf2TFY3Em6aO9W6Nlbi6dsUgBCmam3xXR838Az2jk4FfcUy1Yw?=
 =?us-ascii?Q?+MfoU7Hn2Mw2EuW5YZF/oU3sGZfo+AoMS51zbDbz56cUB5xFgQLnDVXFrDqs?=
 =?us-ascii?Q?8oVjG3BqjICAkJjcURTrPbViK1KnQMQj0IVN0znHc5Nm8/ASwIMRrLvWK6Tu?=
 =?us-ascii?Q?TJpWidPnelRaLaosivehPc7NIdJxH4BgHRHp64tAg8npcILWzq8ekTdffJwk?=
 =?us-ascii?Q?jaTKsITY51rSX2+u+Lhknt13BEtSYycXDTknyv5uFh2pL28D92UNWojZB2+6?=
 =?us-ascii?Q?t491Niz45CJuTXoSFJWK+Q+MkEpaGyDUvc7yUbTap9tmUvOYwOz3G4uLlZ8+?=
 =?us-ascii?Q?A7u38SvuE7z9dIw+LrB53QRrwI3veqZJ7y4BYbo39QMhUZUYd5OoItNIRBn3?=
 =?us-ascii?Q?LDesKIcZLbGxZFJMHFHm3bIATLhhch8fbLgBN8W/NMcpoRcV1pNpSnrYpCPf?=
 =?us-ascii?Q?5w6KYi3/amRv/5yIUtlnSRV2+6cxF4cwQHz9tWAVWrC2o60obUzJHi1FeLQJ?=
 =?us-ascii?Q?B5AITcrWYcMXjQz0XO/SUMMvm9PbZ+9383dF2O77y0LtcCiP0CW6O2LS9IRu?=
 =?us-ascii?Q?HoXZ2AL/spvE4CUXX0KQ5lP+VFFI1BYFJk31hSD61w3aQ9R2JR25rYAToOc0?=
 =?us-ascii?Q?9HiESTJsvnYZQATHU5SNVxd+We3i3R+RctUwRV5jVAyz1moUzKnY8j3fsd2c?=
 =?us-ascii?Q?8PLKpP4XLUPFfsIBtrf+x7hzvfuUVPkl1PcOxTKAwdIDEtTQgwH7+AQUt3tm?=
 =?us-ascii?Q?fjPG5E2roMYPmDGV7flL4LWdC001LVNobANnnoklZiy0BQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rsbSubxNmZ6tXl+ZljtfdZGyE3joas+ziHJ204QNCBepvOHUBR0cToEhBgZE?=
 =?us-ascii?Q?6DJ1xQkwEiV54ehEZD0BIbx+dd7yUHrlMQd6NjfhqzIpInUqQbli/dYqyDgD?=
 =?us-ascii?Q?poJTe2h6V7yA6dqFMpK+cu56R9QOjm8J62zMg04eMqSI5NHvehuk0Bu5WQUc?=
 =?us-ascii?Q?C4BgHj/IE1bNW7ys5TX4sdiq8JqrpRS9aA956ftNWYfk0dJtQK0fpu08TWIW?=
 =?us-ascii?Q?rzS6+3LWLsLjwidYEoV2jpGZVPm+AikWgDOvNORN/+fjOJiFOxOz9U3loAB2?=
 =?us-ascii?Q?4LcAGJ3RjLn9ogCQSB7rXCyDJWkKsE8vfbsWehTlgt8+Ar/EAMnuLRdFyb6e?=
 =?us-ascii?Q?ggIvWlPVzoALoegJpEnS1DR47C7j91C06zvczIAFxqXwS9CB6u+hQgVlOOGa?=
 =?us-ascii?Q?xUFsK4lKkcnhOrUWF0yp317X3Hn7Ip40jSBMVeFBETVjefyfwGGITArQ4tyJ?=
 =?us-ascii?Q?GHLRsOTbZwo+7RyKDZ4EKGHTNJuxFURm5zR+1oQYKXu1XqTJm7j4GRUzfsX0?=
 =?us-ascii?Q?wcT9xaUT7d4ifQ9oE56iwdyGzdPT6d0AwWPzhJwxSPqUw2MrTgbpXiLyj/Vh?=
 =?us-ascii?Q?DH/Y3xg7GOEuk3omgqwhGu9lxbxRK63/jGEC6dZnzV+OkJ0uVnyUURJunOAC?=
 =?us-ascii?Q?wSdLAgJkCCRkMsqqfq+ibZKJHKmFQ4ItZqZAxW7Me/59FYQA/gZxqoTmAb9a?=
 =?us-ascii?Q?YBZOWiL8LPLyEd1CsFXHPPh9HD31TbamJiNezSXWjhNb1A/gsnjEEB43TZ8U?=
 =?us-ascii?Q?yRGSVz/Hd1ZASHShCR+O0xUuJN0EaZXDPoGRpi7DHMRAoDlpBpLz3Exg0UU7?=
 =?us-ascii?Q?blcy0Jwo5i3JSzZQod8EE6n/R4D/YVIXxAtY/6N8UlZp3ofaN1viTnTFXy+d?=
 =?us-ascii?Q?0n/Utoo9vSzIHUS08ec4a8WefIP0epVTw3sBRE3QFZddlo3N5r3+6fn1JVfp?=
 =?us-ascii?Q?yYuxO96SVC9kDhoW+elHKtbGqonfaVucfHP7aUfGjGnncFNfw5CVBCW8q9QE?=
 =?us-ascii?Q?GHHRG5yES0CTT4EQyGOFOhx8Vxjp8co0WPIc6jjlW0aPUBlUJeKy0gUz2jdR?=
 =?us-ascii?Q?JmFskOz919JsReUjWuoZQbmm98B+21fr8LXBC2Vy7Ai1LaIF7vPKqIxDjJHk?=
 =?us-ascii?Q?EwB3Dxp5Y8pzCHdmC2n/kGkxxMq+NLC5Nu71FQ29ZNI4lqMzFKRVkskUmW4S?=
 =?us-ascii?Q?19pArLRSFN08LapqaEclof/I0Q9CgrHBU64hPDGObRSLWYbznxjtxQTt097A?=
 =?us-ascii?Q?pH6kXI4M8jpQODuL8VXV+xILLpx4HhgRX5DZTGUp4ehWfeR62dYjencNAJzg?=
 =?us-ascii?Q?9/Wi7a5PUibbZVNPwyGDYlVUCn4bWbwDMqtEr4mItGjMzCvffwq8o0b+jGmy?=
 =?us-ascii?Q?7b7Kf1lolfa/sKXR82OKV4nN2gcO+M+IBR9UN9rRc73wUtb8Gcvdoi63EZG+?=
 =?us-ascii?Q?w0d57wapnpJ+Je2cTndJPmD7IVH1IwKEVizaQzLhPrAvyKgkOlP2PHF1jFlf?=
 =?us-ascii?Q?CiJ7PrK8hPYvUEM=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=WOq0YbTy3Itj7sfjmJSPJwlntmRFnlWPsGf4NYRJmgFLlwEeeHJ4qCHhRsmDg50tof4Yx1n+1ZClJ7yV49TrHUb7aoruu6csFy0ixyn3g/dzEdTwycqnMxTz6Bs4VpQOPIjhMNIIOFEXiiB31cDvZ6G0uOOGUA8tj3jyFKee5X708fyi5hYyMbfHeG6QeHyVDtzA9zXbMUy22yvICVCOR9Bn6d+Hv7V11VDjrKSIYI8TjJMkKMrnVbt8fZgdUDnr/UOoirq/XoMZ6HRzaLDGLvPPkb/YKz6FwzWDypMjOGQ81MGD0ZZRUx4oLm75WWCNmz6KOz+bBOJvOKUHyUix4g==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqpsFCzflfOCjf7ITzf061e9PXuB/wqe8oLXv7U8Fgw=;
 b=NjID4RhAQ5+Si/WtVxCP+haAQ3saIy/T0BKFR4/4vy9S25xV5c8REkY+1X1ADE8q3eFDE4uuBW2E/bwEQVkfr6nQs8IXZAp+mPi8fIkHcVsYjcITaBuZ1alx27tuneiCN20pHKQpAiQkiHTHZQrsn/wgZIHDYGiEmZtyJMUBP9XKGuRcRY2Yjsr1MhW+s+/uFGujEQ3rx6CdnOCTKRLulCunpnpxjpoSdbebJZ1Mndm3Wm7vjqae8RD0NZagz51kJM0hxCLacR9/qyaCJGuK8rS7EAqaJi3ujFqcc64misc97hd45DhYkYzOnChqTWknlbq1sjkMAPNZ5hdbIP5aQw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: my7UhbOS/v1X2yMabR8wElRNdZEmpkaW2YI/zoTOcARu5MDvDxRblDLyqdjgVPpMDfa35EoSfNkjD+7IK1F4cdPX7m9VCEoV+Tp7CLlfymDQoySWW8gK3RddxnWcZcW5ehNHg67saKp/5aJjOlhXtw3AAzl4aczeuArWXs9GCDuRzN0IPdXXGQ0x8YS9bjOSpbMlAkahOgDMpY8xQFnD1AB1S2OxdAcRpUyvDTfxdo93lSqLiouR/Z2z4JTuwE50Do38ZBVVGDLZdQ2ZOVfBx6QmDKaHwc94Y7kTPbQtQmj+JKVDcZMsRJ6rvPh39g1AxyAUtXsq1f/pc7MVtUiZzfXNWscos6WBaFpufG7Vkibb57u6Ih8vUs3EmhTKMb11qWWL5nY85NRk0nwppvqL7WivSkJEw/9r1qTrbT8owkw0TJ1VarlVrsbrW9EfHOsnMTpS325CPfW5wIeaUZmRspe4ty1gT8umGNNVbpvL7nZWRSQzWc8ooYLqWZu9/bS2el/5Oiny6VUFLTt1DV3MqWjCUDQf2D+1gvoz/5VS4DfBr+d1w/tl7UyuO52oVGmOD6Vbe4wwe/WwA/wJTj455nXO2rMWE9kukl5+iJ028aJRKiGLDOXBfqADfWi5gFei
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 02f89b45-7ec5-4476-a73d-08dc83cc8fd5
x-ms-exchange-crosstenant-originalarrivaltime: 03 Jun 2024 12:56:18.9428 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1962
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 mlxlogscore=552 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406030108
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=613
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406030107
X-Proofpoint-ORIG-GUID: lp3eieYwA8luaU9QeQf7JVkS64W8en_D
X-Proofpoint-GUID: lp3eieYwA8luaU9QeQf7JVkS64W8en_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=624 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406030107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=cL2ys191FZEQtIf8Jcm01HgE1Jb+BYrGyd/imqciyr4=;
 b=dE4q9KaLPf1gTBilp5X3BNJMfhLxs6D+6BQyCoezmUXjnMU6hDakXC7GDlRzo3zobg6s
 zjQ/NIp52RsJBtwnW0sb6ktjFytUy04fhAqaX2JZ9W5AmOS1wlJ62PXsPlLZcl6I4cZX
 Q5vZyWFNnadvwuZHrSwUmBnPfiO7kcFwEapBvpzlvXHNslbEHfFlLN65q8JjxaBA0V0T
 kuRMy3gt+jJaVSWLJ/gPa6vctAQDIkxqGt/q9pt9eY+TbUGt3X200tnyb3nyugih+rZx
 jWTlOKQuASv0wi+lhefuNN+MjVg9HXRWipQNsuBbCnwOEgQ9mgfs8xut70JvNBQZ8Unj wQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqpsFCzflfOCjf7ITzf061e9PXuB/wqe8oLXv7U8Fgw=;
 b=j4WXQRHZ6yq627bFpeCaG30vyKxlEnbeOyim7Plp6V23H8v51ElekK/1aV/8ihooXHjpflYhdlk1drwm32PpS1wrBXdmu5kBypISUA1qBjaQZc2PFQTUbhnPKPm16YAGUz2zXGCpMW8milzn7GhB1XbIfaHba9+qT9SmF4uSLn8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=dE4q9KaL; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=j4WXQRHZ
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

Hi Neal

> I have another thought on the subject of the hashes.  All of the Xilinx hashes
> will be the same regardless of whether it is a zynq, zynqmp or versal board.
>
> However, sometimes, we may have actual patches that only apply to a single
> family, like the ATF v2.8 patches currently in the tree.
>
> In order to avoid duplicating the same .hash files 3 times, what do you think
> about creating a board/xilinx/patches directory for the hash files?  This way
> all the hashes can be common for zynq, zynqmp and versal and they can each
> still have their own board/<family>/patches directory for family specific
> patches.

I was using the ./utils/add-custom-hashes script to generate the hash files. That
script truncates and writes each hash to the last patch directory in
BR2_GLOBAL_PATCH_DIR. So, this would work if the board/Xilinx/patches
directory is last in the list, and all the boards share the same versions.

>
> Assuming you are ok with this, would you like to already submit a patch to
> migrate the zynq board hashes to the board/xilinx/patches directory?

Looks like you did :)

>
> Best regards,
> Neal Frager
> AMD

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
