Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F462C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 11:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31BA56086A;
	Wed, 13 Aug 2025 11:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RoWi82V4Jum; Wed, 13 Aug 2025 11:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424C660817
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424C660817;
	Wed, 13 Aug 2025 11:46:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D37F41C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B97F840269
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7F2hHDOGJd3 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 11:46:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::610;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D864400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D864400FF
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D864400FF
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc6Jb7HG8odVygS9rgVHmQbrMX2XZeO+0wqKZy6TEoR2NWB/tD7sm9QBmNyi4MxB02cX61cTNzoHNFKRTwCgREc01sx8E574TNP0uzjRJBugLOP4K88qgDomMJu60y8rChNicpK8Ah83A6noaRk5O9rVxXN2hy/UqdG6w0uJE0FJmw4yg/CmkKm0bWulAGDj63VJAixeimtcH95JmcXXq3c2hZSzbBaDR3Ryhy48i+vbZw7VQVuRByHxjsWzc686ynjSChFXqDrKjNPxrI4lBlOucJlNRPTflf4JfRDo10yg02Gm40IKZ0fkJO/0UHuH08riODxgQP1/bWM/n4MWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exjB7P0VU7Wm/MXdLlTeicpBHhkrfWpGsuZQ7c0nGf8=;
 b=XDmnFDhClVPhMldI9+3e/4Bn/p9cmFP2vkngBKo19BMtEB08xUlUlsDGlBG6YQQur/XdPN2VGemAtYp+pMBiacWS9sDpPPRHBydjMSdFy4pKoR941XiLoScN9hfecoudkZcUzombuxal3CQRgl0bFqvM2osvlFpiZ0CjBbkwhaq3zAH3AhhG7oRQ6dxgXwj6qp+cAJUFBRGcu6Dy3c6lvslFe/9bqLXpdrP/QmV3PSLYGKJv/D2VQEkgdOCmxWZ4yn+v2lYtcXGeXdhCoqQoqZ7M8UGoh6DkPvTkqI9kSWPQSbpVmLBYjQpRnwaNRpS4MXCPy4HFp0Ae1FoA/6EQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 11:46:24 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 11:46:24 +0000
To: "yann.morin@orange.com" <yann.morin@orange.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTsyAgAAB8ICAAAOasIAABXwAgAAF3OCAAA29gIAACYbQ
Date: Wed, 13 Aug 2025 11:46:24 +0000
Message-ID: <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
In-Reply-To: <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T11:44:40.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM4PR12MB6375:EE_
x-ms-office365-filtering-correlation-id: e1f00ea0-257e-432f-8647-08ddda5f07ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?ZWFOazJPSHhIRVQ2QU41azZ0N292bkpJbnBBNmxUNW1WRFVIQW4yd0VuWFd1?=
 =?utf-8?B?cUtnUWRwU1FWWCtSY1liSHZTWE1FcHNEZFBLRnc0bEN0UE1uRWtZYlFhcUxo?=
 =?utf-8?B?OThNRmwwQW4xeHBIektCZkZvS3haakhNOUJseTY3QVRxdm9TTDkwWmtKSDkx?=
 =?utf-8?B?LzlxZmZjazRicmR6ZHRJU0NHTDNDMXVpc3JOZDVKV0RCelN0WmdqZU9WVUdl?=
 =?utf-8?B?ZDFzK3hYWjRjOEU5YjZ0YXJOWGFFU1NtM3ZYRnBTNEdpcVNRN3RtZ0N4eWVG?=
 =?utf-8?B?UHBYMkRWTW1Da3dnZGVOZytGdjREOEQrMVRQK28yeVZtMGdkTzFjSVFLN2t3?=
 =?utf-8?B?RFRJSkRaNE0vaFNXZ0h2WlV1eGV2NGZmNEY1MTJRM05nd2lEZFlpZzZITVJv?=
 =?utf-8?B?TWdzY2RITVFXZDNTcmVBek54M2dnZ2w2Y1BiVjIwcjB2cEw1OUtzejhYOGYz?=
 =?utf-8?B?QkcyemE1V1pCWnpNeFZ5d3BQNm1zQnNlK05VSDc5bXh0ZEFtYjErS1lpeEdV?=
 =?utf-8?B?UXRPb3NzYVVFZjJoSUdrUUxXeVNGelIxcUN1QytDNE05MHh6YUxldXZxZzIz?=
 =?utf-8?B?NTUxaW04cHl6VXg3WVhCekZiTHhiQ2lEellhK1MxQS9jS1JwZEhMajczQmdi?=
 =?utf-8?B?SDZiS2hlck8yZlh4TXR5azdZVDZFNkpZdUVxNG1XcWc1M2h1amcwRm5jZHFi?=
 =?utf-8?B?Q3ZNRUl3MGQ5RlJBQzAwVTNHRWcwS3lYNjVZbFNiV2RXNWdWQmpaTHhwbXhB?=
 =?utf-8?B?a3VtT2NiMlJnQWdvSjRHbllPMy9XQUd0REFKdVBLc0Z1NW1MU2p4TEJGRkg1?=
 =?utf-8?B?VVl5b1o0b2NPYXlEOXRiU3JMUE5YYnhnb0pBbHMzTXhlQlJjakkzdFlITkNE?=
 =?utf-8?B?UUxTQWRzZ0JEcHJQaEErRFoxWEs1cGtvRDE1VUdJSURxTEhaNEtRdGdkTUhv?=
 =?utf-8?B?NDZWNlBlajJYTis5V29rNDJ5THVZbDR0UTdRQUZZZ3hVRWdKekZGR1YzYmtu?=
 =?utf-8?B?WUdPZVBYcGRiTEJSNFlnTEZOMEdEV2s2a0FGN3pTOWZWTE9vRzNaS1RHekwr?=
 =?utf-8?B?azk3T3NSK0taSk5LRGpEbWJHMjQ3N2ZHaTdvOGI0Q3NtVnZiYnRmSktJOGNm?=
 =?utf-8?B?NHNSYUYxLzY0MjVxWmxXaVBkYTcrSENWSVRvUExCQmMrbGxxbkNsdkdOZ2hX?=
 =?utf-8?B?bjdtbk1rRnVLcDJZbDFFVDlOWWFCK09VbVphOXZrR0xCbHVjaTFnbnFiQ2g2?=
 =?utf-8?B?aHdpUnVjbFVab0hsc0dUTFZmbkRRSTY0UDl3QjduVThZU1lPaW4wQXA4NUxK?=
 =?utf-8?B?VVRadzJ5UkJZTnpNRUFXMnNkc3lnUG92SUgwYVJjNFJzSWxqNXdtRXhxUitG?=
 =?utf-8?B?dFZ4QTlJUHREc3IzVU16QWRMM0JkcUdReDZCUWg0YTZLSFVLbDVXbUx3U2Jt?=
 =?utf-8?B?ZDRvTkRpN0l2RlFjOEdYOWxGcGFRTU4yMlN4Qm5MNWxRcFV2bHZaNEo0V3BX?=
 =?utf-8?B?OSt3TGZGQmhOVm10dEtXb3ppOFpRRG0rOEd3RkU4UXZydndyMExCOGQzeS9R?=
 =?utf-8?B?N0MyaVh0QlB5WkowdE5pdlJ0VUNyNWhmd2RENVR1K201SDJGNUJ5SVBmYzJC?=
 =?utf-8?B?K0N4QW50M0tmRGgzR0NDdVRCZUZ2UjFYRWZmQWRHM2FuMG9WOFVIYWRpaGtM?=
 =?utf-8?B?WEx5czZZSlo0WGR0WFo4UlhlUTRMb0ZSYU9IMm94cWxIcXdpWlpiU0VkZVA0?=
 =?utf-8?B?aHhJTm40VXlITDE2WkpCV2dXZjVXYWJHS1ZyRGNSNElFUVZ2RXM1S3JEWS9J?=
 =?utf-8?B?QjFNVTZxMVB6WG92cjdWdVJYSFBJdnAzdTIxTUx2RlVaNmRLdkNqeU9Wc0NJ?=
 =?utf-8?B?V2VSWHE4TjluSlVRMSt4OTArNUh3WXY4aVNEakI1a2VzZzNBaUhUZlhaMExY?=
 =?utf-8?B?eFpWR0RoMXlTUm1yZllUZUZzVjI2dk53UUx4UEJ3aTFUb21QMzlKbjdIZDFE?=
 =?utf-8?B?SURRcW03ekpsUGJSckxlOVZrTzNsQzRjOEhpZTBrRzVHdWtUR0RSMUZCOUJ0?=
 =?utf-8?Q?n2P5RS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0gyT2pLSk9vWlpqOERQdkdqcFRlMkRYdmQ0ZG9BNUgzRHpHcG1TdUd0L0RK?=
 =?utf-8?B?Q09ZNkpCMzBLczF0WlBCSHU4UWl3OXFTOExNK0JQNDNpVjVOckFNM0JOU0hn?=
 =?utf-8?B?ODlIM1hCaWxWdE0zWkZVakc3YmhnQnh3TWcxb3E4VG5yMGRjUzlvRVhNTzNB?=
 =?utf-8?B?ejRSSEgwSmsydGpOWkM4ek1TYkJjdjJjd3lQaGY2ODFmQ3AyckZweVpPMTZI?=
 =?utf-8?B?ZmRsOS9ZWFQ1Y0NLQzkwZnhkWDdsVWczTnk5TGpmNkZmT3NydjJCeU1QQUVr?=
 =?utf-8?B?ak1XWFNYTDJyaEcrNHhjVk0vOFIvN2pjcjhSUnVVNnV1QTBzNUh0aXBmSzVh?=
 =?utf-8?B?ZG5iWDNKYlB0eFgwZVYxcUlXNHcrNG55Y3p6dUh6MGd1NEdBU2FkT2E3d3lx?=
 =?utf-8?B?amtRYzlVNklPb2ozSHlZbFd1cGFIYWhkcnhvZVpVRnVTK1FpUUw5KzZnU242?=
 =?utf-8?B?R1lUZ0kySFMxWExzaExFYzFGUzdyOUtPREZzcGdSb2UxYjRlaFZyYjB3MFVh?=
 =?utf-8?B?aGVFVzZlODNOTm13b1hacHl2Y3pZUzdUSzBKalR0T3dkYkNIdEVuTnkxUjNJ?=
 =?utf-8?B?NzV1OGhCbVJZaEJQcHcwdU5INmszN3BDTmJaYmhFQlRRWTJvN1E3NXlEWkVz?=
 =?utf-8?B?YkFjVE9aMkQ1Nkd2WE82Z3lIUjM2YUltbnBaQWtPNWFJdDJWaCs5aWJHM01r?=
 =?utf-8?B?V3daTkpOMHdvcjVuQU5zTEQvT1lEKzFTUTFSYllYZ0ZmcjUwa202cEhOWDhw?=
 =?utf-8?B?YWNRS1ZuWHRuaVMvM21TZ0t5c0dGcVJ5UFhYdCtVckQzc0h4SDJXK0xhSXFV?=
 =?utf-8?B?TERYSHhXRUpPb2l4NWVxOGw4aWxzVkc0L3JnUEp4QjF2Ri9Fd2N5alRvNVll?=
 =?utf-8?B?SlJDNENYTGNjVFhNQnN3M1p6bU4rRUhRbjdXMzBBZ3g2SXVkTktkeDIzMU5Q?=
 =?utf-8?B?eHhWN1k0U3BQdU0xSG1IY2NhQU10WCtkcGRlS1d6RTN0cnpLV2FJeGFtOVJ2?=
 =?utf-8?B?SC9lTEVaMTNFN3dQeVZpclVJUmxxVUxqUUJvbmg3aWQrbkxLYmo5Zmp3RGNZ?=
 =?utf-8?B?ck40dnJqbkk2bExIVkVoWGo2UUQ4ejhPbmhWZzNJME9rOXpodjRmQjVjVDV2?=
 =?utf-8?B?UjdyRi9lRXU2ZEdFSzJia2N6VjJaVi9YdmZSaGh3S1NFMlNHazB2c0J5VGlK?=
 =?utf-8?B?MXhBeEtiYnNrdFBjZU5JUE9VeUFwMEVKZ3BCdVNRbWZ3L3FhdjFmOStLK3cz?=
 =?utf-8?B?V1ZDWUtjRWl0dHgzQTVNMHE3VU9XN0xLNGxvRXY5dUhuRUtqNHI0SXpjV0JU?=
 =?utf-8?B?M2h5WTZBK3kyczdLMmlnd05XOHp3aXhROENkeEgwUTNCajNvK3VpMjh2TGNE?=
 =?utf-8?B?cnhuTGxtbytITTdUOHg2NWxHYlY5cXdlTGlsY0JZbkVpTndYY0hwRk84QSs3?=
 =?utf-8?B?RGFPQXNMK20rd3l0MkFPTWN0RERXTE5UY1NVa0tyajR1TTArY2ZYZFdPWlps?=
 =?utf-8?B?Y1RHVk11WGpPSzRBaWcyV3R4eXJnblBlZysyaVhaOHV5dExlM0trQnF3Q3k2?=
 =?utf-8?B?bms1NjlwNjhhNFJuUS91UVlkcFhidjFKWGhuOWhZVUpxdWkvRU1oRmVCK3lz?=
 =?utf-8?B?WUtKOGlYM3BqcFloRG9iVXFhOUZ5RmZXdjhOZk10TWRybXJIZFVFakhnaTEw?=
 =?utf-8?B?cGFvclVkeDRTNHAwUUo4L1MrQlFiWHZ5RHlGUE5QMldVVzJTUVFCb2dpMEFV?=
 =?utf-8?B?ZTlJbVBFNWFiaERHejZCNWdzUERVQnVwU3lHQ3ViR2EzN2dsL2pMZ3V4ekxl?=
 =?utf-8?B?OU8wc2lBdGlaeXNjeW84SVI0ZE1WL3k3QnhqWVBxMkhLVnhlV0dLL3doR0Fj?=
 =?utf-8?B?Qm12Y0dnd1Vta1RlU3M4NnRKdGVZdSt6N05jV0VBVnI3K0E2b2dBYXd3OTJD?=
 =?utf-8?B?SXZUZGZ3c01KOHdHSWtucXhoOERPK29CWjI3Tkp1OGhRSzB2L2tnbjFYek1o?=
 =?utf-8?B?VmNSODZrcjdHRDVrd05nOEhLVEMvZUtUQUQ0K1JONlZnMWM3WlNDNlp5ck9q?=
 =?utf-8?B?REloWmpwaWRGVk0wTk5HQ1J0eUNDelJtUWRKQnNjeGJpMkplc3NGMXZsbHla?=
 =?utf-8?Q?Oxjc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f00ea0-257e-432f-8647-08ddda5f07ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 11:46:24.1717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlxXlwck57FZRtP/jf0JF+e86d4Rrl6xrXaPYWdWLNyO1E5bzfB4oHZyKcFZgpnU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exjB7P0VU7Wm/MXdLlTeicpBHhkrfWpGsuZQ7c0nGf8=;
 b=rlqz1T7AO8DshLEQxm6Gktg7OQ/gIygJq955nFlJcEAddtdDQSH4umwZAKhN4oZre78bIazwZtuB3UWAUAlpINI/pcpcYZR+y0fVGIMYqdUE8YjWx/StQCTqVrZVGGEYP2FS/nTzuXRrSMVQyEGOL3PGTLLPUIPi2H2atncYcbY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rlqz1T7A
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Yann,

[--SNIP--]
> > When the dependency is not tricvial, I think it is good to introduce an
> > intermediate symbol:
> >    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
[--SNIP--]
> I see your point, but don't you think adding another symbol is still
> a bit overkill?  The dependencies are still only 3 lines and are rather
> straight forward.

> This would not be unheard of, there already are a few packages with very
> few arch dependencies, but that still have a dedicated symbol, see for
> example (some are more interesting, as they do have comments for each
> dependency they carry):
>  - bayer2rgb-neon
>  - bitcoin
>  - bpftrace
>  - dpdk
>  - host-flutter-sdk-bin
>  - (host-)gdb
>  - gtkiostream
>  - ... and so on...

> Note that we usually do that for libraries, so that it is easier to
> inherit their dependencies in selecting packages, but of the above,
> only two are libraries.

> But maintainers will have to decide what they want. ;-)

In the end, I changed my mind on the issue since there are two places where
the arch dependency is used. The BR2_TARGET_XILINX_EMBEDDEDSW as well as the
comment about the dependency needs.

To avoid having the two be out of sync, it makes sense to create a
symbol BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS that keeps all the arch
dependencies in one place. This way, when I add BR2_cortex_a78 in the near
future, I will only have one place to add it instead of two.

Thanks for your help!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
