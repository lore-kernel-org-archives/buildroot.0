Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF12CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 06:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8240840600;
	Wed, 27 Aug 2025 06:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pts5eog3Cvtn; Wed, 27 Aug 2025 06:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22304060F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A22304060F;
	Wed, 27 Aug 2025 06:17:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3243114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 06:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A45F2403B7
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 06:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOO3xmhg4Wwe for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 06:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F707401B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F707401B6
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F707401B6
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 06:17:07 +0000 (UTC)
X-CSE-ConnectionGUID: i83PPWBZTqughOQWD6rNCw==
X-CSE-MsgGUID: mR0gPBFHQhS9m3SrCoCAMg==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 27 Aug 2025 08:17:04 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id EA95FB5A87
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 08:17:03 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 2E906B5A86
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 08:17:02 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 27 Aug
 2025 08:17:02 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (40.107.22.111)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57 via Frontend Transport; Wed, 27 Aug 2025 08:17:01 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVR6wAs5T5ZhZH6jEeYqvgyTzVnlCBuh/5fPSL4OLVmvqD+4Oz76LDLuRoDry2M6Nr6r9pYfpVjk7ryESFdXyHiQFmBodM8LS78nE6VaDr9cS9zOOscab1LyWkCnI+iZsSk/z5lcDGAs48Ms9LxJPVPs1qp9a0LYCDjpGNUe+sH/tRPqun1ZkaOy/NXT2Buy0m1VKOSYFisq1vxnTLheUV7abQBVlKZB2na/M6tqeqPftOI+4Ef1mnIzRlX7zD03i3V7HEbI8TTXw/PNGJae6Y7O6fsltA+XsRM/6HZ+dH4cG4kwB8RZBn0FmveGnF8pcnRf3Spcm2TJBrPr/5M8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Gp4kXXJccgiPVB/wb17ducRVXnBBV9H65MAU6XCy+M=;
 b=YVpx/tsrfH9HA4HSM/jr2W07CnQfc2k5SDT2G+KQ0+5OSgbFGvWmEq13OKbYLP4dWeY94tpRk9xKEPS/13B88olYaAnRqYDSS3Qps9glWQBCY/3OvjSGpdSWccHtmM80EBITM2/BD3OSmHe855Czw06rMlcmXq6nnln9YZbiPjmKE09KcyIROodmBrAN0Yci+uzPVLKPUReOFi0dnmQhGGkJrC2EBrHkeDz+yIfyvNPlEH3CdP/bA2P3Kuw2ff8Hmlynl1ckgv/U4i7lCrc87V1jpnvcCSFe3Godn6hqirZrr8Ov/TsUvukpb+9XqCDjiN7waa61shJxwFczo82CQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0321.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 06:17:00 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 06:17:00 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH v2] package/libzenoh-c: install zenohc.pc pkg config file
 to staging
Thread-Index: AQHcFxnAG/7xgRGGq06hsg9Xur4pBA==
Date: Wed, 27 Aug 2025 06:17:00 +0000
Message-ID: <AS1P250MB06083B276F1C7F6BD6257698A938A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0321:EE_
x-ms-office365-filtering-correlation-id: 8a0fdf46-4bbd-4587-1c81-08dde5315528
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K1Z6VEpvVHhkOW5qYUxmaERKcW80Y2tQMHpNUVVoUmlNZlV6RXdQOUdZMHVB?=
 =?utf-8?B?SGwycVF1d09QdkNaZmlTeFR6ajljU3p6RG9sOTAzTGx2aGg1TW9UOW52OVFs?=
 =?utf-8?B?UHJSVkFMdWI0MXBSWVYwSithYndCR1lWM0s4WmZqRVQyUCtpYXR2cVNYYUxx?=
 =?utf-8?B?NnFSUFppS25RKyttNXd0ZlJZMzUwNVgzdFBrZnF6aGdvRU5ZMW9tYmhTT2ZN?=
 =?utf-8?B?VFFhc0dZMHh4ckY2THhFRXloNG5vRnM0dTBDaDk1TzFVdVFjWkdlNG9iV2lm?=
 =?utf-8?B?OXU3OXJsbmYyMFcwNmVPZGRhcU5rb3k1OVEwK1BaQlRNY2JxQnJ6TUxaRzRj?=
 =?utf-8?B?djRoaFQwWS9wUjEzSG5kcFBJWXZCV1JFb3hRUFNYZEw5N0p1b3NDWDVOT2Vw?=
 =?utf-8?B?emZHaE9ITC8rWFBsZC9QWGU5TStzWmFCMXZvSlg5R2ppK0hFOEFrT3NoL09k?=
 =?utf-8?B?QXJ3eCs0azdwUkluMFZzTkNrS0hya2dWaGxtT1hjMFVBamFkQSt5OVM2M2E5?=
 =?utf-8?B?V3NDOUJXRmJHampadVROazdHWitBWjRRMlpFQ05oL0xuR1c0ek5JVmUyMUxt?=
 =?utf-8?B?SkNmNC9qWGRJdEFXYWd4dTlaTnMvby91bEQ3UVpZWldIZGErTGk0ZGJROFdB?=
 =?utf-8?B?c3E3UElObDQyajRVWXNTb1NzRVA3dkE2eS84bTRjMGtEcFRxQnZMLzZ6NGtz?=
 =?utf-8?B?cTlRTEtmWkxNaS83QXZOdkxaMWVpZ29wNDl0d0tRa2RBVmdkNXpBeG10YitF?=
 =?utf-8?B?c3E0dmNUbk5qN090N3ZST3hyZWhSWWM4SENpWFVDRXo5NXZjaHlJSUVWeFQw?=
 =?utf-8?B?T2RQM0FKM2ZGak5jUTVlZ2pkUFZXMy9pKzV2cHZuTUV4a0dOSGJpV2FXZW9K?=
 =?utf-8?B?Z1hjVmJxWStXcTJDMlpNUCtBZ2hXRHpjT2phc3lwVnJkdGtkTkp6ejFrWGFD?=
 =?utf-8?B?MVFCekJzZEdWV3dZb3RpTThOK1BXaHdQSkpkZXJkeUlxU1JYRjVNOHhNMyts?=
 =?utf-8?B?dzFqcVRQcS9KV00wOWpMdURkNXM4SjlwWnNlYkFKWUpjd0VWYTc3NEZQMGpZ?=
 =?utf-8?B?SmthdGtpRDVKYm9nckNwTkZqcVk4VG1UTXNaaFBwWG8yZlRiN0NmS0VaL2JF?=
 =?utf-8?B?Q2lWYlozWDFmYVZ1VkFBd1pMOThHWUJzM1pFVFpqTmpXMHBqSHJ4eFhXQU5o?=
 =?utf-8?B?ZzBRVnBtSFZDMUNjU0YrMm0vRk9uc0Z0RXdzTGNYeHBkeHpuRkpjS1I1a0sw?=
 =?utf-8?B?bk9GVURXTkZNMXh3bG4rcWJLYkhhVHhIaGdYUmVGandVcEZRSlNwUk95cjk0?=
 =?utf-8?B?ajNmc3owbkRBNHpxVVBKZzg1M1N6M0NlSkFIVnlKUTJVRUM1VE9uTFlzK3pO?=
 =?utf-8?B?d2hpUHo2ZlRhQ1VsYW9ZVUgzeVBhRmxnc0pBVm5qU1FnZ1pQRG1ZQzBOM1Fn?=
 =?utf-8?B?S3FodldmZUhTRU9sSDR0MkNOd0RxVkZjRDVjeWlkYTlDTG9oN3dUMTRjL0s4?=
 =?utf-8?B?L0UwZlhmVjl3eExGYS9YRzNBU2tnYmZzRFRSR0NCOGw4SU15UXMyTWNMYVJh?=
 =?utf-8?B?Z2FHWVVuYi9QRVVTVXpjUkVGcnY5NDhYNzNtSmF2YlZGRGtreDl1a01kUHdM?=
 =?utf-8?B?aVZXUmhoM0lFTWdNbVpZZTBqQ05oZittNCtHTEM4ZlpCUkpXS0VBNFk0TGV5?=
 =?utf-8?B?OXZnbG5ONXBCMEtqU0s2V3h1cWsxQU5OemlHRmJLdkRjVG1ZOW43bEJ2ZFM4?=
 =?utf-8?B?T0U4UHlFa09BemlyK0JLR0NYK3pndWN3dXQwZ3gydnJ1aGk3dDM4dlZ1Q0pP?=
 =?utf-8?B?UEZkTGRqOTgwbUgzNjZ5akhqUFJRRW1DdjlQYnhoL2duamxSQTlVdEdRWXFS?=
 =?utf-8?B?WkU1L0RSNnIraGErZ2JJQjhlaXRuYjVHdFV4djQrWmx0dmp4MzhqNkQvUFdO?=
 =?utf-8?B?THNVTnJ2ZmxxMElHWnpndDlTMmZuSkZ2SFR1WjJxQ1krSU5ZVjYxNk9weHlQ?=
 =?utf-8?Q?0pVpJhcgUJmKFvFshC28+KxYqQRmbU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWx3a3JpaFExTW5XVjZkLzlWTURna29NcnpaZHlhcGhzT2ZCOVdDYWZDWFZJ?=
 =?utf-8?B?WStDMURkekY3OUwwTHBOWE5uQUhKR3BLVkRrc2t3WkdnRG5yWmZWSjVkOXRp?=
 =?utf-8?B?MUJQSUI1bVBPWERJT2N4SXJrQnVvb3BlOGxOODAzYngwNFFBbGE4ZzVleUNE?=
 =?utf-8?B?Q0ZjRkdWVGluWExOYnFOc0lEemw5MTFVaDhBN3l0aWowcStWTGpudERwTVBj?=
 =?utf-8?B?Q0JZQTNaYzZSMXc4eFpCTG0zZmlqVEo5b1NkOEFDLzJWWVNsMHdDR1R4RkpF?=
 =?utf-8?B?dmlsUDkzNmxCWGRBSUlMTzJtOGVLdVNLcFZWVzFReGVKVUcrUVAxbkxTYVBB?=
 =?utf-8?B?ZThXQlF1WU9jOEhvaHNFSFREeVRvM21vbS94WStyaVoxWjAzZFpRMTgxYXgv?=
 =?utf-8?B?TUdzbVZCbm1aWk1PWkNoVVp5a0d4eXY0RlRIY2FEY3daZ2lLTExkKzB3eVZN?=
 =?utf-8?B?eDljdjZGVlZnRzVFNmJxU3FlOUZHRjVjYWFMTlFQOGVQcUw1NU9nTEpPTGJz?=
 =?utf-8?B?WFRsQ282Z0RJVWtwKzBleWRxMXB6WjNJSjJYeUMxVTZIaHhNUGJNOW92bUFV?=
 =?utf-8?B?U3FkZk1MYks4MHluOUtIdUJTZHRZSEhNMVFYc0REQjR3NjlROTBTUW1UN1dk?=
 =?utf-8?B?K2ttWHMwRFo3NlRxb3UxbWJDcmZ6bTJjOVd3WktFK3RyMU5mM1JYYlRIOEVr?=
 =?utf-8?B?ME9uQXdvSVpVZ3FLRzVMQ29UM0RaSkNlS2xFa1doMGFBcERWZG01TStrNUxE?=
 =?utf-8?B?c2JrNFpwbVVndHBKb1ZaRno4dmNyU2ppMmw3TXloSmZXMVRrSk9pZnQzZ0lF?=
 =?utf-8?B?bmNSMllFeTBPcG92T1dzT0gxT3ZmdWZWY0VyazRya3RWZWpOZWtJbDI3dlht?=
 =?utf-8?B?VHJtaEhSVUF6c055bnpBbEdXbnoyZnFuUGFjZWNBTU9OUHhKVG10UWpkMXZa?=
 =?utf-8?B?eHZiT2RydGtwNVFyckJDUFRsaHhvQzlJMWFIUUltNm1ndWNaUFNUS0k2UC9M?=
 =?utf-8?B?NWFhaHpSM2p2ZG85VEtoSENoT0RRVHpWRVVqTXU2ZzBaZW13SEFVcEh4VGxq?=
 =?utf-8?B?R0k0Mzh1OCtPWGJwRmVmcC81KzhRVzN3OGJTY3dBMVlYZWwwRmFXaTdrOUhT?=
 =?utf-8?B?YjY5Y2JlZHgwRTNMcFZ1aUZVajJmTjVocTcySyt0QnlQQUV1NnJlSWIzelU3?=
 =?utf-8?B?KzZ2QXlQRytsVnRLMG9PQmR6NHFoSzJYVnlwajRtTnBjd0hXNklhanZjMUNM?=
 =?utf-8?B?V0grSktuZHpHaS9VV1A1R1lVZjQydzhGdUtKankvUi9ZVjlXQlk1TmVLMFBS?=
 =?utf-8?B?dGtDVExwVDZlRlF5M0UyUGt1VHNoRnBHeFNsd2YralpZZWNCY1JUV0Z6UUhx?=
 =?utf-8?B?bUhHU3FPVllZUGNNUWhIT0xra3QySS95dHIvR2IyUzhPV1VXS2hhSllVVlBx?=
 =?utf-8?B?NTNDYXBxSGhMakxVdXFHanl0VXltRkNwNWkrV0FDZmoranZJYm1wVUlXc2xx?=
 =?utf-8?B?WW1yZ3hvZ0VyRG1xTW9hYWJoSjNXZDNRZ25telhKOHFZdjdKelJFTzZVYVE2?=
 =?utf-8?B?cTdEOFFCa2lqL0FnYXdMaWQzcTJoenZuYUIxTGpTNy9QNkV6dGVhRTZac2Fm?=
 =?utf-8?B?Vmp6cVc3R2svTHBCUjYxNGZuc2hBN0lna2ZvdjcxYmcyaXJXL0o4UTVuNVVV?=
 =?utf-8?B?ZkxKTXVIaE9qRWxvVFVMQ0hQNnIwdm14SGZRd1hYVzZEMzhqM1FnaURJRjNh?=
 =?utf-8?B?YTg0dEFLOXd4OG9DWUtKanhPaGdnT0NGbXI3aStXeE1Ud0t0MzZjclEzalQv?=
 =?utf-8?B?NHg2aEcrYjJmRUJMU0c2NDREaUdhaVRxZ1RyeE8rWGQ5eCtjUEZ4ekVySExT?=
 =?utf-8?B?dkZFWTlEOVM1bFVXSndCUDY4SlRRY1RBbS9VN3hTb3VWYmI2Z09hWHl0aVRp?=
 =?utf-8?B?WTJaazUrWklEOGtzYk5BUVRmZUhhVWJGV3dBcWJWYTJIdUFNdTZXWDg5Ukxk?=
 =?utf-8?B?TTQ3VWd5RFRWclVweWxVR3BBLzlHa0FibGtJS2w1aUVZQXd5OXBWNU8wOEY2?=
 =?utf-8?B?dk5WOEJLdmdnUk5pQUZtNUlmSTVMeGJMMUZDcit0N3VFYnp2dGZ3SXZ4K1NS?=
 =?utf-8?B?Z2lvd2phc0sxZXcwUUJmelBXWGtqVG5yV1V3eVJ2djR4RWY2disvbXZyUWNS?=
 =?utf-8?B?aFE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TBzR98/xc1vhxaNrtfkmbB1XopoeTyueNSpsTtS8fTfrhcrbgGri9WPIsgiFm64W0ToapzjB4KAQXYcP8GWHHsosTIy5DLlY5DqLJDyyfU34qeGfkKkYnFTxtbUT20BwZlznWDFlVukKG16av2Zd99n/SqH2In15xgKsMxZ9+ArcWQch/ksdetPduL4I5uv2XQQ6fgTaNObSsfV/vqSPZldaFiS8HuRh90eGyJV+GNWduPT8OD2YJwr/bhaambeNlxmoS/upZs3R/Whu4vJRkKbeepe+c4WkD+gE+CMLS3egHnqK2mTXtW2UczlGtSKH39tMJvl/z5ujc7nwa83Xv1W0Vo5NX7rnZ1UZZK8TsX4ZI/7xWPCtScdOB61EKMuIPMCLrnn4CQATe2iZMjTwrs8osUyhkzZqRCa6rk4a+2FlwXKSdfJ8P8Hdhztx61F7H/3XvQp9HPfymtQZ32xS6C2I/QLNNN3vSNNkIYtX5jz2lV2qLvletrCIBqFeggY39v7Vrn7bWS7du23wHCaW/SZbpXEgdtQ2SFgkpTLYmiKFZwMSdVHy4h4qp5PEvD08rRiQcauQeEFOKX4j1rdBnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0fdf46-4bbd-4587-1c81-08dde5315528
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 06:17:00.0851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgvSLdqGQfh9Ek6U0+hzRDmYIX30WNaCQiVjaSOX+ghN/K5wpkW2+sLYMoSbFdK8V8tjx8K2PrKQXZrk7K9yFa5E/cxIugAkJZR2ef9YTME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0321
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH v2] package/libzenoh-c: install zenohc.pc pkg
 config file to staging
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
Content-Type: multipart/mixed; boundary="===============5857612370379543951=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5857612370379543951==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AS1P250MB06083B276F1C7F6BD6257698A938AAS1P250MB0608EURP_"

--_000_AS1P250MB06083B276F1C7F6BD6257698A938AAS1P250MB0608EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGFja2FnZXMsIHdoaWNoIHVzZSBsaWJ6ZW5vaC1jIGFzIGRlcGVuZGVuY3ksIGFyZSBub3QgYWJs
ZSB0byBmaW5kDQppdCwgYmVjYXVzZSB0aGlzIHBhY2thZ2UgaXMgYnVpbHQgdXNpbmcgIGNhcmdv
IGludGVyZmFjZSBhbmQgaXQgZG9lcw0Kbm90IGV4ZWN1dGUgdGhlIGNvbmZpZ3VyZSBzdGVwIGZv
ciB6ZW5vaGMucGMuaW4uDQoNCldpdGggdGhpcyBwYXRjaCwgd2UgY29uZmlndXJlIHRoZSB6ZW5v
aGMucGMuaW4gZnJvbSBpbnN0YWxsLyBmb2xkZXINCmFuZCBpbnN0YWxsIGl0IHRvIHN0YWdpbmcs
IHNvIHRoYXQgdGhlIHBrZ19jaGVja19tb2R1bGVzKDxhcHA+IHplbm9oYykNCmNhbiBiZSB1c2Vk
IGluIGNlcnRhaW4gQ01ha2VMaXN0cy50eHQsIHNvIHRoYXQgaW5jbHVkZSBhbmQgbGluayBwYXRo
J3MNCmFyZSBzZXQgYXV0b21hdGljYWxseS4NCg0KLS0tDQpDaGFuZ2VzIHYxIC0+IHYyOg0KICAt
IG9ubHkgb25lIHNlZCBjb21tYW5kLCBubyBjYXQgfCBzZWQNCiAgLSB1c2UgIyBhcyBzZXBhcmF0
b3IgZm9yIHNlZCBjb21tYW5kDQoNClNpZ25lZC1vZmYtYnk6IEFsZXggTWljaGVsIDxhbGV4Lm1p
Y2hlbEB3aWVkZW1hbm4tZ3JvdXAuY29tPg0KLS0tDQogcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnpl
bm9oLWMubWsgfCAxMSArKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspDQoNCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tayBiL3Bh
Y2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rDQppbmRleCBiZmVlOGYzM2UwLi5iMDU3NzNk
MzY3IDEwMDY0NA0KLS0tIGEvcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMubWsNCisrKyBi
L3BhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rDQpAQCAtMzUsNiArMzUsMTcgQEAgZGVm
aW5lIExJQlpFTk9IX0NfSU5TVEFMTF9TVEFHSU5HX0NNRFMNCiDigILigILigILigILigIIkKGNh
bGwgTElCWkVOT0hfQ19JTlNUQUxMX0ZJTEVTLCQoU1RBR0lOR19ESVIpKQ0KIOKAguKAguKAguKA
guKAgm1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlLw0KIOKAguKAguKAguKAguKA
gmNwIC1kcGZyICQoQEQpL2luY2x1ZGUvKiAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS8NCivi
gILigILigILigILigIJzZWQgXA0KK+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgi1l
ICdzI0BDTUFLRV9JTlNUQUxMX1BSRUZJWEAjL3VzciMnIFwNCivigILigILigILigILigILigILi
gILigILigILigILigIItZSAncyNAUFJPSkVDVF9OQU1FQCN6ZW5vaGMjJyBcDQor4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLWUgJ3MjQENNQUtFX1BST0pFQ1RfREVTQ1JJUFRJT05A
I1RoZSBDIGJpbmRpbmdzIGZvciBaZW5vaCMnIFwNCivigILigILigILigILigILigILigILigILi
gILigILigIItZSAncyNAQ01BS0VfUFJPSkVDVF9IT01FUEFHRV9VUkxAI2h0dHBzOi8vZ2l0aHVi
LmNvbS9lY2xpcHNlLXplbm9oL3plbm9oLWMjJyBcDQor4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCCLWUgJ3MjQFBST0pFQ1RfVkVSU0lPTkAjJChMSUJaRU5PSF9DX1ZFUlNJT04pIycg
XA0KK+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgi1lICdzI0BDTUFLRV9JTlNUQUxM
X0lOQ0xVREVESVJAI2luY2x1ZGUjJyBcDQor4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCCLWUgJ3MjQENNQUtFX0lOU1RBTExfTElCRElSQCNsaWIjJyBcDQor4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCCLWUgJ3MjQExJQk5BTUVAI3plbm9oYyMnIFwNCivigILigILigILi
gILigILigILigILigILigILigILigIIkKEBEKS9pbnN0YWxsL3plbm9oYy5wYy5pbiBcDQor4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCPiAkKFNUQUdJTkdfRElSKS91c3IvbGliL3Br
Z2NvbmZpZy96ZW5vaGMucGMNCiBlbmRlZg0KDQogJChldmFsICQoY2FyZ28tcGFja2FnZSkpDQot
LQ0KMi40My4wDQoNCg0K

--_000_AS1P250MB06083B276F1C7F6BD6257698A938AAS1P250MB0608EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBC
YXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPlBhY2thZ2VzLCB3
aGljaCB1c2UgbGliemVub2gtYyBhcyBkZXBlbmRlbmN5LCBhcmUgbm90IGFibGUgdG8gZmluZDwv
ZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyI+aXQsIGJlY2F1c2UgdGhpcyBwYWNrYWdlIGlzIGJ1aWx0IHVz
aW5nICZuYnNwO2NhcmdvIGludGVyZmFjZSBhbmQgaXQgZG9lczwvZGl2Pg0KPGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+bm90IGV4ZWN1dGUgdGhlIGNvbmZpZ3VyZSBzdGVwIGZvciB6ZW5vaGMucGMuaW4uPC9kaXY+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij48YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBC
YXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPldpdGggdGhpcyBw
YXRjaCwgd2UgY29uZmlndXJlIHRoZSB6ZW5vaGMucGMuaW4gZnJvbSBpbnN0YWxsLyBmb2xkZXI8
L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+DQphbmQgaW5zdGFs
bCBpdCB0byBzdGFnaW5nLCBzbyB0aGF0IHRoZSBwa2dfY2hlY2tfbW9kdWxlcygmbHQ7YXBwJmd0
OyB6ZW5vaGMpPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNp
emU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5jYW4gYmUgdXNlZCBpbiBjZXJ0YWluIENN
YWtlTGlzdHMudHh0LCBzbyB0aGF0IGluY2x1ZGUgYW5kIGxpbmsgcGF0aCdzPC9kaXY+DQo8ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij5hcmUgc2V0IGF1dG9tYXRpY2FsbHkuPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij48
YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTog
MTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPi0tLTwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Q2hh
bmdlcyB2MSAtJmd0OyB2Mjo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7
IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPiZuYnNwOyAtIG9ubHkgb25l
IHNlZCBjb21tYW5kLCBubyBjYXQgfCBzZWQ8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPiZuYnNwOyAt
IHVzZSAjIGFzIHNlcGFyYXRvciBmb3Igc2VkIGNvbW1hbmQ8L2Rpdj4NCjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXpl
OiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+U2lnbmVkLW9mZi1ieTogQWxleCBNaWNoZWwg
Jmx0O2FsZXgubWljaGVsQHdpZWRlbWFubi1ncm91cC5jb20mZ3Q7PC9kaXY+DQo8ZGl2IHN0eWxl
PSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4tLS08L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6
ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPiZuYnNwO3BhY2thZ2UvbGliemVub2gtYy9s
aWJ6ZW5vaC1jLm1rIHwgMTEgKysrKysrKysrKys8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPiZuYnNw
OzEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij48
YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTog
MTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnplbm9o
LWMvbGliemVub2gtYy5tayBiL3BhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rPC9kaXY+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij5pbmRleCBiZmVlOGYzM2UwLi5iMDU3NzNkMzY3IDEwMDY0NDwvZGl2
Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyI+LS0tIGEvcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMubWs8
L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPisrKyBiL3BhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1j
Lm1rPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEw
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5AQCAtMzUsNiArMzUsMTcgQEAgZGVmaW5lIExJQlpF
Tk9IX0NfSU5TVEFMTF9TVEFHSU5HX0NNRFM8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPiZuYnNwO+KA
guKAguKAguKAguKAgiQoY2FsbCBMSUJaRU5PSF9DX0lOU1RBTExfRklMRVMsJChTVEFHSU5HX0RJ
UikpPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEw
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4mbmJzcDvigILigILigILigILigIJta2RpciAtcCAk
KFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS88L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPiZuYnNwO+KA
guKAguKAguKAguKAgmNwIC1kcGZyICQoQEQpL2luY2x1ZGUvKiAkKFNUQUdJTkdfRElSKS91c3Iv
aW5jbHVkZS88L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6
ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPivigILigILigILigILigIJzZWQgXDwvZGl2
Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyI+K+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgi1lICdz
I0BDTUFLRV9JTlNUQUxMX1BSRUZJWEAjL3VzciMnIFw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPivi
gILigILigILigILigILigILigILigILigILigILigIItZSAncyNAUFJPSkVDVF9OQU1FQCN6ZW5v
aGMjJyBcPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6
IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4r4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCCLWUgJ3MjQENNQUtFX1BST0pFQ1RfREVTQ1JJUFRJT05AI1RoZSBDIGJpbmRpbmdzIGZv
ciBaZW5vaCMnIFw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQt
c2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPivigILigILigILigILigILigILigILi
gILigILigILigIItZSAncyNAQ01BS0VfUFJPSkVDVF9IT01FUEFHRV9VUkxAI2h0dHBzOi8vZ2l0
aHViLmNvbS9lY2xpcHNlLXplbm9oL3plbm9oLWMjJyBcPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4r
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLWUgJ3MjQFBST0pFQ1RfVkVSU0lPTkAj
JChMSUJaRU5PSF9DX1ZFUlNJT04pIycgXDwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+K+KAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAgi1lICdzI0BDTUFLRV9JTlNUQUxMX0lOQ0xVREVESVJA
I2luY2x1ZGUjJyBcPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250
LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4r4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCCLWUgJ3MjQENNQUtFX0lOU1RBTExfTElCRElSQCNsaWIjJyBcPC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4r4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLWUgJ3MjQExJ
Qk5BTUVAI3plbm9oYyMnIFw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7
IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPivigILigILigILigILigILi
gILigILigILigILigILigIIkKEBEKS9pbnN0YWxsL3plbm9oYy5wYy5pbiBcPC9kaXY+DQo8ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4r4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCJmd0OyAkKFNUQUdJ
TkdfRElSKS91c3IvbGliL3BrZ2NvbmZpZy96ZW5vaGMucGM8L2Rpdj4NCjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
PiZuYnNwO2VuZGVmPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250
LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4mbmJzcDs8L2Rpdj4NCjxkaXYgc3R5
bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPiZuYnNwOyQoZXZhbCAkKGNhcmdvLXBhY2thZ2UpKTwvZGl2Pg0KPGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+LS0mbmJzcDs8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQt
c2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPjIuNDMuMDwvZGl2Pg0KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj4NCjxicj4NCjxicj4NCjwvZGl2Pg0KPC9ib2R5
Pg0KPC9odG1sPg0K

--_000_AS1P250MB06083B276F1C7F6BD6257698A938AAS1P250MB0608EURP_--

--===============5857612370379543951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5857612370379543951==--
