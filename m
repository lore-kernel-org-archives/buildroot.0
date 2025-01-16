Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C991AE77188
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 07:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74BAF416B6;
	Thu, 16 Jan 2025 07:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hMHpxauL7aM; Thu, 16 Jan 2025 07:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC69416C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC69416C6;
	Thu, 16 Jan 2025 07:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B99DDB89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 07:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99D1360A63
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 07:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcVdcHLT45lx for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 07:25:12 +0000 (UTC)
X-Greylist: delayed 437 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 16 Jan 2025 07:25:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0488608D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0488608D6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0488608D6
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 07:25:09 +0000 (UTC)
X-CSE-ConnectionGUID: HKh7wheSR86so9ZeSNnF5Q==
X-CSE-MsgGUID: R2qnI1FwS7m2Wjktmo+mlg==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 16 Jan 2025 08:17:50 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 3F395B5A89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:17:50 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 88FA0B5A86
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:17:47 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 08:17:47 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 Jan 2025 08:17:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxJ91Y4Hyix6hZ6yRkhBKYUWGvBxx2IhbDeBhDmr92FzbXyAKBLAebem5iPobjXQUvTvGpwiTDPDJxdqPMVEaLFPeTWoe1n5uXq0eCE/U12DWPLkykddDwyYp4jtAR7S7ioOtkEbCmtmITzprXqNsAb1RYEqGnwlvusE2b6MGmWxlSsTstkHxW5ave6C9EFOOlVa7PAuKsfdNWdtlhxuqqDDgUgKtyaWt/AFXHdDCTMBuampqSkTZ7hG094VDsnJ/dW1z7F+MhDOs+EyuJZt/DtGMZ6hKsxb5jmjQPwuuup43dvVyvnbDcexi/1iULvULUMB53rvHldcqV7UGt1erA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwPxRmJoZrOo4q37LIL0TI4wSthQS27iuMfIQuXxi3g=;
 b=GPOw6xEKnyfawErJHk5UD15ORAQWSbzD1Q5HSDh2HSrLEFsTVmARVa79QTgOmlyrjqiGhOhp7sFapahQxMgXvQOSE3Wz5ELWBzvK3tytvhMRBXQ5Z3Ue4wmpyN1AA9btiVZdPoEcNPVDeB967mzdZl2FK/60oFL3RtfcYpzT3maJ9F3yfMNUDpjCMBzVzxMmDUw7I1Igk0fgKsneb1+P4TQCxRBm7FrVHdhir7lGD/4KsOW6mI5iDAOAkFlb1IF8+vEj+X4vZ3efE6xkpVO/7Z5/9upyBNHVBYP21/8U/3/60mykeONJFAmlpGaVIbU81ItZLQZnlm5l+N7bPNvPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0368.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:17:40 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:17:40 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/2] package/libzenoh-c: bump to version 1.1.0
Thread-Index: Adtn5m+ftu2VSU+UQiuKcVrEQUWCzQ==
Date: Thu, 16 Jan 2025 07:17:39 +0000
Message-ID: <AS1P250MB06087379AC560B82EAB3B466A91A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0368:EE_
x-ms-office365-filtering-correlation-id: 06f659a3-c0e8-438c-053c-08dd35fddc95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ccXS3Gr0rX9AKPGpLQFOt2e4KN9r/cu8o/tw7d7e78qjNp44tU9OgkVcE+4B?=
 =?us-ascii?Q?oeqqcel9pbjB7cZi3fJ8A+x+cDtk5tzE7wn9nU+/B1LMnU5ydkVAbmLrcHaA?=
 =?us-ascii?Q?wRga2n55Q8qQXJhsyB1EX8Och83xFHi31LdI5+vL3pqoHRC0q8OMrTfxQvj+?=
 =?us-ascii?Q?LHgnKbFDfRDQgDDuCPVk18nZV3yn5A943FkZkhPteGvpttifw2IN4sQIhWpp?=
 =?us-ascii?Q?R+RJjJCAecfi0GCVZq+fQH2UWeqPxVlmaeomTwTT3jL143z+BcqopwGPAx9R?=
 =?us-ascii?Q?DexsphMT0AIubdzayEjNOAe67N0404XOo/AKHXxf0elHDPKdJsxxEA5Ey7FE?=
 =?us-ascii?Q?O3ahNjL/s4dVZLk3bPyG74EoHHFpf40pASqozTx9GcR0LMYHuU6MMmsz8hbr?=
 =?us-ascii?Q?5YRENxg5Co0AWqUJGDCFoRXnuU5ogzwzBoSTmm5fwVV563WXiiP0I6FkPcVQ?=
 =?us-ascii?Q?7v/i5gqkZDQHupzhJ2dYKw2O1frQKVoipYTT0lEYDIC6sYzYDrp36P82YdH2?=
 =?us-ascii?Q?nn2eurOhkhHK3hd7vhEJ/DIgZPTBVEGTDBek2dd1FIuZtHOfyIV5LHyxslJi?=
 =?us-ascii?Q?TUvxDziw5+ZJuD7x/rZqzTWTbcynCIwieWGF0PVskJeqEDJSRFnZbOdvfF1m?=
 =?us-ascii?Q?2jR7vhYhk4NhgqKCiEbmPoO6ewNAUHIllY+44GqN3yLXRp/I2Z3VgeraArGF?=
 =?us-ascii?Q?7R8wIVfJESIfNQXe/e6bXGx9Q4PNqiqAG+WCwKbF7r4/3shCVbMUL3kaARrz?=
 =?us-ascii?Q?nam0zVAcQxb/ZUZQfxGsQFGIN48YtBajHD+eUPVv9vwiBJlHmOAVMOPHT0X9?=
 =?us-ascii?Q?rmIGkBPrfd5HmWB/fK5zH2xikmf33LoM7LD0wEhOKr7lYm2f9V3Z69mn/UuQ?=
 =?us-ascii?Q?NzXzLeJvbrkOzNeRbfglUQlajWEHZaQB/0de+chqk/b0I67o/2oNK/UF5K7L?=
 =?us-ascii?Q?yY7aqxvxTOSCuJuT5GuCz8MUXjDr4nY50NN4iqbiYmCvEzd3SMqRxbWdwtYr?=
 =?us-ascii?Q?65vIVsUT01Q7k4HcKUt/RHetl2dnK7t2rS6KwhGRSMIf0V0tANhmXhTSlN1u?=
 =?us-ascii?Q?dV0KqqFQdU/+zKrx47jZdr9HaMY5rBJIsTNmGBQrZbt5TXqJX5Rwv/4REZeL?=
 =?us-ascii?Q?a5UByrfXXRxyqvaGmlXUBXAH2k3j1JWekBlngyME27Syf4yDU538SbGtv6lT?=
 =?us-ascii?Q?NivpngUjNvPeeJtR8EassIIGGm4xVoOTyuM1AVAhS9PZxpMZ79xahb9tnsaq?=
 =?us-ascii?Q?bZgMEtOlVYIpOnIuwMzhsQ0LkfIckAu8xe66steHRfhDg4C0dRPI8oOqBwJR?=
 =?us-ascii?Q?gXn7vPu3yEAqbuq+VfVgFXilfkV3no1xrXI+Xv4V0vl4F9jsqLc8St4Esa0H?=
 =?us-ascii?Q?2Zbckf6tWXvjYaqKtsbDa20HWrXjlXR1CR54mR7rMeIQB8fBhw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yr9VWpsIBIQbA61TZ6pOiD8pgH/6I8sPm6Kb8H20VqPYL5P37kCmexnhPvlL?=
 =?us-ascii?Q?mk138ge/dMWWYNTX7AyW+cxBYYcze9Xx43JAaoQ03aZlmlEk9f3pjsYTBX3F?=
 =?us-ascii?Q?g92gmuQXye4H7QIvcHlzsyNs3qmn9br9esRbsgNjr0Ls2Wi65RrTp1I4DHgM?=
 =?us-ascii?Q?H6w1EWUcy86EvAiD4o0d6HtXxWTdUWiz+5eeUYZJS5cGJPBvGeZsT0gN3g30?=
 =?us-ascii?Q?AdoTHzSX3543CyASnETiMZT4mqvrF0PpBKUc20jxHA4sB83ySbTMJAmYRIJo?=
 =?us-ascii?Q?oxEi2ZWboAjzLNlaaCtfgOpoeL1AByvM9d28QASGqszj2nAPX7OI0lf5EuFg?=
 =?us-ascii?Q?81DCPOwSrbiK/cxCwK+5xnjrQjlRRp8ceZ3hW8ID/pjlGgvwdLlVuRt96u+/?=
 =?us-ascii?Q?RKaOCjO7VLEa1xVJdxYfKiA059BtMYKcaObd26gVOgLuP38bndfkamZqA9g1?=
 =?us-ascii?Q?jyMz5T0+qsduE5oYswZOzXv80jOycPmqpOapMNGFc8e2ybG0dzhUCaTgowQ5?=
 =?us-ascii?Q?CkaNdFxNY51RZkqmBNFRt8VZ3Fm482SYDCIBdp1x0q/UohH4ofBCkZa7vgcY?=
 =?us-ascii?Q?BgAXkKle+UzTI+OQ6dY1HiIHZDIe6hWmIEAdJKhQ6MWhJYBQsyalQh1WzGHr?=
 =?us-ascii?Q?lTsCcQbv2s/EuvpN4dXqxdiExnh8qTjvWi2dP6iPyPPdavdF0nQTN1o2hdqv?=
 =?us-ascii?Q?xE6Pr0N+Z/7GDDE3JnIfKi3TBE5QrjcbvC3XIYKTKqLQbcH0Ez9uz0IsahCx?=
 =?us-ascii?Q?7f53xj2o9wGBAUUcfW6TpRBTDZXOQl4v6O62NrU0gwGFxVwJkmRTWe7dEb/m?=
 =?us-ascii?Q?jrLi7V5En8TBsJtoDWwYk2geICw4ZD1X+B9w3iSWl1VFdeJ3O9k9uzFvr1ky?=
 =?us-ascii?Q?sJ0/X0mKV/6Pf+HUZRzA1WDX1yio+LR87jAHRq2hjN4oQHK6vQQFqa7VddAd?=
 =?us-ascii?Q?4Oe1lVjvnQT0ifA0x17mBocUuJCLqezlEYvYHprWA1wvcF88CbSIPu6jVZsS?=
 =?us-ascii?Q?QHuzMlWV5UcK3L4XqUwiaEu6nFhIx4D3/SSdIkLBgpWzNGEr47h79cnCw1Xk?=
 =?us-ascii?Q?G8PRhdxEzBxc3hJzIPDIhqmrTDWpYk+UsLI7LHkSITRrYjEh797nfhO/r+Dc?=
 =?us-ascii?Q?q/HAnyY+a9lXmzJd6tt2c1nDPZYoxZrM7xn9h4uwIGMNBMgi9HXtR8hwDfow?=
 =?us-ascii?Q?93gOlGvqQYM0sHCDOJYLbIwxKAquKhP8PZfMezxNBeiqXZ5EkRlFIYd+8v79?=
 =?us-ascii?Q?R52Oc2iNydoO50wSIulPcqLCD1X81gpZfltIts+eQL5fuSg5VqyuCfLZCS5H?=
 =?us-ascii?Q?uD9QAqG88tutZbk95yB3T3I6E5oQ5U6Sj105oDGYpSCnoOd4lce0bF+qFHr7?=
 =?us-ascii?Q?NxPZw1qZ8aHoV2am2oEmI1BSBvyurG1IRSAuq0F+LjCHywUmCu9hXLUzJnyz?=
 =?us-ascii?Q?Cvx9i52JtPvGAK7KSV+5wjEi9UP04ip62NWrV36FimD//Hv+VlCsCNB0Qxwd?=
 =?us-ascii?Q?8EeNCkYQCKqw2D4KikMdHwlh8W+54z19K5G2N8P/1/ptl0703kw7xZEGAadD?=
 =?us-ascii?Q?RQ+Jcj6PC5Ovg/qrxjFD+iTW6a4MqZO9edObgKh+hfZDp72wHBTVh2N2pPbx?=
 =?us-ascii?Q?Ig=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Gq9QqZ2OeOHLwr9FyvuU3Zlp4CEEJyeyeqaaCpFL+CsO1KYLJdhOcjiFx9ohyUSKTo5szJ74GvbdmxEzZANQwqRM0WBy3BDKaH8nRHV3wq/m+XlODAENZE4rvc9Y/hhYWuyPuFVZN2n03yWwiPYDYF6D2mDgbDsalHErj4RJiPOp2ZUatreuV+EkJvjj0ntKK10eSIL2t44Y+cR9dLRyMDo9NV03waTZDjO5B0IE1csYOe0xgbnsDq26sL0usCFqyw+NTkaAieoK59S1WA+JdmikfqkFkb8uivxsyIttLspxzzno0qhdtqfLYS189DyDOeMAr47FfO0LzEAc58yhNabwh6uHNZ+xOeHYnDxLYOuR22W1J2xrtHsyeJB13JzIks7YQbmpOg+zpjqMxXdjO4taMJKy2nSy8GnCQz/10zS6VxrBlFPbtlWhm6sdjpy8aA8qoEqlTeioXTvNONok1mzscBROoKLh9MBYlq7ESy2CRbUhvuA9j4ZdUfy/zyTZTMb7nkm5lrBlUN801+ME6z0W1iRBZpxz5RBK6nkrLVZqcs6xe72F5vLsF7mDpuOZOKq0OgJSGznEEKIwzH0zYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f659a3-c0e8-438c-053c-08dd35fddc95
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 07:17:39.9688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLSHe0Ih0ksl75Iga9d/O/D4MK0d/gYZrqUcmoenqExyVvPc7gb6xeR7MdgAhumcwtspA2tSwIoYqtwrGiLGusmBN14A6BvnXMDHskaqYXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0368
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwPxRmJoZrOo4q37LIL0TI4wSthQS27iuMfIQuXxi3g=;
 b=Uz+UcfJfV7u6S0dFX1ld1nRkYtStWnNn2SYl7cC5y7dvhltj3WNHgfcDjMIgWIq5CxwIZiPV7uF/yiPubtqqX/b4fKiHajnfvhrfPsN4db62pLlMk3kwd19EaIsiutS3+Ej0K6XRGbPRaQVy3gm+b8cnIfFOFzMamRBODqpqBZc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=Uz+UcfJf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version 1.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.1.0

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 058909eaec..f83e23eed4 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12401035b4652eaa95d5835db85f6597358f3245c2646abb3986291104be566c  libzenoh-c-1.0.4-cargo2.tar.gz
+sha256  9e7a2bf47edaa5c73bb6dd44558eb2b1367a9e0a0bbbddead463df45c400cb54  libzenoh-c-1.1.0-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index 6112eda842..9258db56bd 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 1.0.4
+LIBZENOH_C_VERSION = 1.1.0
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
