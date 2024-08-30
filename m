Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D468DCA0FE7
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5419A4116A;
	Fri, 30 Aug 2024 12:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu9YieX9gXCq; Fri, 30 Aug 2024 12:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7327441171
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7327441171;
	Fri, 30 Aug 2024 12:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 901151BF98E
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8982940120
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDi94QBWFrKO for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:27:44 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Aug 2024 12:27:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FF1F4114A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF1F4114A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FF1F4114A
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:27:44 +0000 (UTC)
X-CSE-ConnectionGUID: QaZ5w1X7RjyOO4kbvrGs2g==
X-CSE-MsgGUID: cAeJYA1gSziVD1mKfRzykA==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="26371343"
Received: from mail-westusazlp17012039.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([40.93.1.39])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 20:20:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsoP8VNaigb243KKK59rDeTxdeejH1/9yijAg6SFuPdv1n3zVdjNGXdeTPIcTDwEe4BiBPGqojzVl+d0Nu6E/kEZ0lb8gdtPzNJOFR4g/e2TsYyfQu0EuOK78zeyZtIGMStx/cT+MFhtQYG7ranKaB+lZGEOjeCzm3t3J+F6xrxpH85Awebwui3V+Ff4+TcyUuNrzbV/GjEWJjXexkYqF1yWU9lXs+Z5JtfV+LJyJQe0a0FzDaoHbYqIXz6r9xDWe8S01R0LoQ6n+v5Kt7dT2DEGMNvSUS/yL99/E0mcrhdsEoAjUL+6LYRl6DTAV7VSYftfXtHToxsd33JEO6/7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEneEZvxZYAc7skiVXkme2pPyUu4ZSMIuTeyvBdcNuA=;
 b=RXDwcrxY3sZ8Ur5mi3ZqwrFrZpUcrEaKB9N39r+VP8dclopwtzhpMtYNhhO+O5CK1vck1EfVBLmE2rFWLAjjqkAEar4nR5pv4yXMW/x6SoyU03hvhdwtg+rsylH0Svl06fvUOVxQQbQXL/sDoiPx19Jr5InNRrX/xCopLOQuPlh8TQrxI82CCI59hCtHXK0+E1aCK8tKwhpJRRxd8l9Uz7V27w3qZj9OBjVnlJporJwGzhhs1CyVGF3+TNI0+wP1QU6syih/I8ROmLgoCGHjcU20vjGEJXRN3WzT6O6VyaoNOr+44aBQiA0/1PqQlaWpwfoB/yshq+ZGNVKNclcCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6293.namprd04.prod.outlook.com (2603:10b6:a03:1ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 12:20:35 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 12:20:35 +0000
To: =?utf-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@rtone.fr>
Thread-Topic: [Buildroot] [RFC PATCH 1/2] linux: install in-tree device-tree
 blob overlays
Thread-Index: AQHajOMxwgSa7UW42USKGYnTtaGB0bJAlEAA
Date: Fri, 30 Aug 2024 12:20:35 +0000
Message-ID: <ZtG5EnLkVJ1EMCTl@ryzen.lan>
References: <20240412140945.1626579-1-gael.portay@rtone.fr>
 <20240412140945.1626579-2-gael.portay@rtone.fr>
In-Reply-To: <20240412140945.1626579-2-gael.portay@rtone.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6293:EE_
x-ms-office365-filtering-correlation-id: 8d80a22f-ecb3-4146-d3c1-08dcc8ee267c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OW5MRHFYVmZXQzFZRFppVDAvRi9RRVNiTDc1eTYzVWx3bFFNekt0ZjlWRDU1?=
 =?utf-8?B?V1RlaFIvdS9YRUpKblJtRXlvd2VzZUJEVCtLMGkrYVZ1cXRZZGh5Z3JFa3FL?=
 =?utf-8?B?dkZTaHJYRU53SjVxc1hXWVR1UllobTlkZkV4aUs5eXRkdVpMait6YjkweGZ4?=
 =?utf-8?B?STVVSElLYk45MVFtU0RrTy9VdjREamFPWXlhQkpqZ0dOeVExTGU2QjdMNWdo?=
 =?utf-8?B?VjJnbHNVNnNrbW5Yd2U3YloydVVwOTB5Q2dJQlVqdmwrNk53VWN2Umh6cE1t?=
 =?utf-8?B?aXlxZ2lBVGRwMzMrR1BzZlpmTmlFbDFZSXVPWG83SkpiaEN6UFBZdXh4c0hQ?=
 =?utf-8?B?c25YK285M0N3dTlnUGorWk45cjNrTW91VGQxTTc5dDNsbktqQWd3Yzk4dkw3?=
 =?utf-8?B?TWtJdUh1K2p3NkJ0d3JiczJmallGMjRlL1dSMDdWenhOTzNZaEx3dHRtQWg5?=
 =?utf-8?B?SC9yRldyWm9YTEpKMW9RNC9qajRGU082YnNtd3drb1ZVNkE1YUNnd0xGQmtj?=
 =?utf-8?B?anBId0xySGl1QjVYSkp4NW8yZmxNcVFrR0ZrUXBMZk1KYmNZTU5FdXA4d2RT?=
 =?utf-8?B?empkM1phWkVWQXVCaTVveWE5QWpBdTVPTy9YSlRzeFJ2WW5Fb0Z1QzBMYWdQ?=
 =?utf-8?B?NEpqUW5LdWNveGZsbkF1ZTZOYit0aXRxaFFHbEVHYWNod0RSRlpSNTRWUFgw?=
 =?utf-8?B?YWdzdnpaZjExT2NNakxvRGVKcFE2TzAvWlkzdUN3SkE0Ymd4RHpIeVVtNXg1?=
 =?utf-8?B?d3ZZWWZ1Zmk2UUYyVVpHclNWaVdYRzBYOGtDVmFZdUcwaklZMzV6VXh2elN2?=
 =?utf-8?B?L3ZSNENLYWppQ0ZCQlBHVUUreXAvai9QZ054WFZoQURSTTVyd1dRN0hiTnpi?=
 =?utf-8?B?bnIzVXM3OFNUZG1QdFF2ZjV4RHlrQ1RCRnp2dzJrTEU3M3VTU3VzbUY0NzlG?=
 =?utf-8?B?TEhjckM3aDh4QU8wSUVhTDJramVxeTErTlpGTE1WeENjNmZlbERycXB1UmZj?=
 =?utf-8?B?d0hiMyt4cXZ1Mk1NMlBKMDVMbWJUa3B2RTJzNEFkSjJSa056WHVBR2MvMDVm?=
 =?utf-8?B?eGREd1RyLzBtQytublo1bnhzZE80YkFIY3BQMklLQnowWUxvL2Y4d0ErWkl2?=
 =?utf-8?B?MjhpeG9Gbm9IUEVNMW4yWi9tT3hjQm1oU3lDMXJ5RHNaK01Dc29mbDZCeDBV?=
 =?utf-8?B?RGJLeUNUaHUvbnFEa1I2WjNSVXI3RkdZc3ZSSGlmZVJSZE5FSTB6ZkFYQmk5?=
 =?utf-8?B?bExEK1BYNEJrVTR0ZUhHM2J5TnE0WE4zVkVpY3NGZlExd2RzRGlob2tVY2lP?=
 =?utf-8?B?TVRiNTRjWWp4KytiLzFZMytBWXNlOS9VUHI4dW9qK3VZMEVSTEhUTmJDaUd0?=
 =?utf-8?B?Z2dzT3BsUVQ4S0dYQTFTNzJVWHFyY0h4c0Uwcm92ek1lYUlLRnpoWWhDYXpp?=
 =?utf-8?B?L3JWWXR3aVpGNEtxS21vV09xbnNXYkdKRjhyRWpSdGRPcnl0RStQbDduaFNU?=
 =?utf-8?B?MUdYOVNOa2VVZ3ZQMWo0Yk01bTk4em1kS0tYMWNrUWp4Q0RZNEVKdjdhQW9m?=
 =?utf-8?B?L0xGL1FIZHA0bEJtbWwyc2R2ejZTS3ZjN1BneTJZT00vc21PVzBOdk96ODhx?=
 =?utf-8?B?UVBDZmFuTitScFpCY05QSXVQd1VBTnlGMysyVHNUSXZCRndHMkU1cnF6MmZa?=
 =?utf-8?B?eENDR3NMSi8rdmZjWkg5ZURjVXN3Y2s0a3B1V25EdFBlVlVwaHJydnhRMFVm?=
 =?utf-8?B?bW1Gbk9KVkxYUmVObWMwVldBb0lSRGF6QkcweTArZjgvbjhQM0x5aHFGeGVF?=
 =?utf-8?Q?rY37zfA2Y0qUMnFa+xmVQelCxGKhhcdsWxGvw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTJnYTFxV3V5R29OL2hzN3hNZGZHLzZQYkp1bkp3SnVaTmtKUXE5OWZ0WFpa?=
 =?utf-8?B?SURyYlc2TG91aGdxY1ZsRnFIeTNXYzNHcmtIZzhNTVBNc2N4MUZ0WWk3d3ZR?=
 =?utf-8?B?dDdvQ2lKOTFQaFF1dEZ5VDVyRE1IMmlVNTNNdi9WWW03SUdyQVVocVhDSzA1?=
 =?utf-8?B?cnQwVHdNVDZWbE05ZmN5dWJYNTkrNEhtWWFidHdIMUw4cmFmeFh4Vmk3aHpV?=
 =?utf-8?B?N3l6Z0tWY1VNU1hvby9zdTRZNWl4T0tjZXNwaTI3SWlIQUVibjQyLzNGSEls?=
 =?utf-8?B?ZjhzMDVQTUpDRDJCdFVJV2NaTEJHdFpXRWpCQlVQQ1dlY2ROT3FHcGN6RHQw?=
 =?utf-8?B?WEFRbEFCR1F2cmV4VHdPR1BkK0lzSzNNWXBZVFh6a1VXTU1HdllTMkRLN0pE?=
 =?utf-8?B?blFoaUQ3eUZtaUF3VjFnQlFCMlp6WWpjZTdaWTY1VXM0K21kcEkzaEg5Y0c2?=
 =?utf-8?B?UW5WL1dyKys0RXFiNVowd0UzVytyQlUwcGt2NTdyRElFYmhjQmg1SG1vbHpD?=
 =?utf-8?B?UlJZUUhmSG5UYlI1T2M3TjlZU2luM0VLSGhQUzd0Vkt4ekNScjVmNVRJS1dm?=
 =?utf-8?B?bWdZVDNzSC95eHR6ZXEyNi9rbFE1dUVQRGJuQmlpZ0xlK3FOTjJSUGNjV2JF?=
 =?utf-8?B?eXZaT0NsZzhoTllkdVJNQlUzblN5ZHB1NlAzVUtDd1V5cHg4Q3Ayc2VXRmlK?=
 =?utf-8?B?b0NjZjMyaVc5Y1g3MVNKS2RBQTh4SVhjSmIrZDJIemVIYkhKb1BPUm9BZWgz?=
 =?utf-8?B?eGJCNjRpemplQUdxdVhiaXg1SUdaU0FkeDZiOTRqUXhuUXgrQ1FBeTZnLy93?=
 =?utf-8?B?K09mNWM5VFAvNkxoaEJoUEpidDZKdXM1SmtqRjZYQlYrMXZLdGZxLytwV1Vj?=
 =?utf-8?B?d1dSZ0sxVXVHcUZBbmtia2JpaUhWRFU0RUU3L0VUWGhFUm1HdTlTU3lLSnFz?=
 =?utf-8?B?ZXA1Z3Q2eGtLM2pGcmRZcm45MFJjcVQyUlQ2YkpHaFA0S2dTUUE4Q2ZoTXFN?=
 =?utf-8?B?dUFFY200cEEzVnlWL1lJeTNsMjV6eklLdkV4UnZ4ejlTRXRJa1BZTHE5Zmto?=
 =?utf-8?B?YzdYQnEyTW43a0ZhVGlWZkhCSWhOZUUrS2gyM2w3TG11UlFkZmR5eVZRclpK?=
 =?utf-8?B?d1lNRWJqcWEyenFTdWlROHZtUUNoK1dHaUtJZXlnQTRMdmx3ZlhLeExLWE4v?=
 =?utf-8?B?Z280YkhEMlEwcHRkOVRGcnNyUTh6NU9CTkw3UXNwVGtsajNJWlExNDE3SktJ?=
 =?utf-8?B?MnhzV0w5VTdYZ0pTc2tCWnI2djVEOTRNcFJibXlzS2VqSnR6TmRtSGlpYVRJ?=
 =?utf-8?B?cU1oZEZsODdXaTBiY2NCYXBWSnRMbUgwMWhWZG1xSDltYWNZVGxzTVBYdUI5?=
 =?utf-8?B?OUx6cmxMV3RndS91d1pkelowK1ZBd2ZCbUNTNUpaRmNVQ29JYldWaktRZmpH?=
 =?utf-8?B?RFdpQll3M24zM09yME9CM0ljYnN0UE54ZHBXbExLWkZLVFBER2NhSVpYSmdx?=
 =?utf-8?B?Qld3ekhQWnJscDFjR3FuaG5pbE0xc1RMdWh3T1FBNVJrVlpKRkMwclBJQkV1?=
 =?utf-8?B?SVJIQzR6WXoxZDZETE1MLzlRV0lJL0FNUE52RHU0OExRV1BldlhBVjZVMGcr?=
 =?utf-8?B?Mm9OTFRVeXJXTXBPbGh6bG1SZTNaTDhNUGt6b09wbi9CbVVWeDFsZTgwR3hK?=
 =?utf-8?B?RmxmL3ZLOHg1d2VjNEFhdms1MEx0S0JkcnZVdENsTGJ0SGVObHZySzM3enpY?=
 =?utf-8?B?SXNXNkpMSWlJdXNHMDI2bDRaRkVOOHNBSTJtMnk5MklKOHUzVlF5aFdzWUpa?=
 =?utf-8?B?MjJIaGp4WWlsMi96ZUcyU0ZzYnpjNUhlUmJjUER2Um1JeG9XMUNsQmY0N3JT?=
 =?utf-8?B?OWRvT2FiWmhyS2h1dUNDTzJwRjV2ZlBKVjROTWJKczk4bnFvZE9KTFc4YUx4?=
 =?utf-8?B?NmdQRzVJaTZBWGVwWTZMMm5PNmlLckN1bWNScmUybE40ci9mQ2NNRTBLTXhB?=
 =?utf-8?B?WU1YbzFnd2lKTldtcVRmWmYxMk9FdzNsc1U3dCtSSkRNaDk2amdsdjZ1WFZk?=
 =?utf-8?B?VzJzNHJIa0hvNEF3QTUwWVVRNDhwcjhCa3BqZDEvN1ZCZWY4Z1RlMWlDeVo2?=
 =?utf-8?B?QldQZkt5UnhNT1ZnNTZlbVp2Um5Vd2tiUnFFRWd1WVI4MWxob1lQT3cxZHdC?=
 =?utf-8?B?WWc9PQ==?=
Content-ID: <3035DCB5A223AD4C8546835C82632D80@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /v8DuTqrLj4RLZ84YRMD92hfvY5MeqbswjORpb7n5JTKz+wFLZmXt/mQHwPuFdt/PO0CQ6MzHiGNm7VzcVx1gVH+r5l1U+c3G2bfj2jZfjyvIZeUZKTjJanfvaXW8FVz9Id1yR49yqh062UA1zuWPlpj7bURU7TU/nInpPHhwKRJWPCQ7HmQK93n/5RjdftKyCBtE6iUBBbk81/hCzrTms/ev2isDvbFcbmULMysrS2+g24cNnlxyY11MidTRq/Bz5VVD+01TX+DLT6iwS8+5xAibejwwf3t7bPG+TEqLaoscBZ9Fv5QlQl8nfcn7joNURB1qOYc2M5G3O4IKOr6/0TxCJN4i+GvHZG0lvaySY5WtE11Mnz679Vig63UPLHvuOHJUEBhEtvPLEdZv2yzhn1EJFkD5bHKJG7I7r4HdDbZ59JM7jztvtSUfu2klqwLY3iC1fcm6QRJNjHQKnrGU/bRzMmPwB+q6DHwdcvpKdJIvsrerEcz9lIQi0wxrX0IKuA3gAzC9+xleicv52kf9ctnACj/9z2tmu/N4Fvi6KAPCYb+AloeChDeZZQd6mfjGwvDyTGoDQteP5cSwXophIv0nxlqU6MJAGUow/vAl/Boi5dbTKU9vsSx2tPVsNis
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d80a22f-ecb3-4146-d3c1-08dcc8ee267c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 12:20:35.2790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Cfc6U3LsDF2A2dNLlB/XS++80V0zHqV3SWD4olA59LWbI5INsQqo6NtKbN2oshU/bjdpJbRcEl9L7SaPdQZrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6293
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725020864; x=1756556864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=vEneEZvxZYAc7skiVXkme2pPyUu4ZSMIuTeyvBdcNuA=;
 b=r6e9ovel1k2HthJo31faHDAt7PQuxPgIbbhwwMkj/0hRfmM1BhTFU/gl
 EcuvrR3G+zkZQMNd2wDNKnkc+I8c5vImut2krkRgo7v1/cWIM+yfmll9x
 bEfqGlp0Gp6POZEqQPzprJf0fXInhaqAI+1bkNtYIBYb1qmfXs3usNkNU
 WLRWLY4XG/weViiOGtPfavCcD/blQKPRkIu6Dto57nI46fMlhzYUFonC9
 y2rI9Cv3pe3CM+ugl6kSlhD8fGJkQ2w7ZNPY8Ui5+of5hGsVen2FAlqU+
 t/dMdFopKzynUHVCzUpLt7dj699p6W+HMLk9ujf3L1qipwwP8N/2FWZkq
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEneEZvxZYAc7skiVXkme2pPyUu4ZSMIuTeyvBdcNuA=;
 b=QCIglSyp9166UTSwQUArUbXa+7Tl5RLif5bD1iH+0vD9CksacCYBvzFllwuaO7bC+4DzdEr1Cq22CSqLwdPCUT1BGDw5mfEhaNQ2ANlt2LOq+l8JwE541sqnNcDbozEQddpXlF2cT87BfwCkiRptDQ2lzE+6ewzqHAUkqQpkyB8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=r6e9ovel; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=QCIglSyp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [RFC PATCH 1/2] linux: install in-tree device-tree
 blob overlays
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Michael Walle <michael@walle.cc>, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsDQoNCk9uIEZyaSwgQXByIDEyLCAyMDI0IGF0IDA0OjA5OjQ0UE0gKzAyMDAs
IEdhw6tsIFBPUlRBWSB3cm90ZToNCj4gVGhlIGRldmljZS10cmVlIGJsb2Igb3ZlcmxheXMgYXJl
IGF1dG9tYXRpY2FsbHkgYnVpbHQgZnJvbSB0aGUgY3VzdG9tDQo+IHJhc3BiZXJyeXBpIGxpbnV4
IHRyZWUgKGZvciBib3RoIGFyY2hpdGVjdHVyZXMgYXJtIGFuZCBhcm02NCkuDQo+IA0KPiBUaGUg
ZGV2aWNlLXRyZWUgb3ZlcmxheXMgaXMgbW9zdGx5IGEgZG93bnN0cmVhbSBmZWF0dXJlIGV2ZW4g
dGhvdWdoIHRoZQ0KPiB1cHN0cmVhbSBrZXJuZWwgZ2VuZXJhdGVzIHRoZSBzeW1ib2xzIG5vZGUg
aW50byB0aGUgZGV2aWNlLXRyZWUgYmxvYnMgaXQNCj4gY29tcGlsZXMgKHRoYW5rcyB0byB0aGUg
b3B0aW9uIC1AIGluIHRoZSBEVENfRkxBR1MpOyBhbmQgaXQgZG9lcyBub3QNCj4gaGF2ZSBpbnRy
ZWUgZGV2aWNlLXRyZWUgb3ZlcmxheXMuDQo+IA0KPiBOb3RlOiBUaGUgZGV2aWNlLXRyZWUgb3Zl
cmxheXMgcmVxdWlyZSB0aGUgbm9kZSBfX3N5bWJvbHNfXyB0byBiZSBwYXJ0DQo+IG9mIHRoZSBk
ZXZpY2UtdHJlZSBibG9iIHRvIGdldCBzdWNjZXNzZnVsbHkgbG9hZGVkIGF0IHJ1bnRpbWUgaWYg
dGhlDQo+IG92ZXJsYWllZCBub2RlcyBtYWtlIHJlZmVyZW5jZSB0byBzeW1ib2xzIGZyb20gdGhl
IG9yaWdpbmFsIGRldmljZXRyZWUNCj4gYmxvYi4NCj4gDQo+IFRoZSBrZXJuZWwgaW1hZ2UgYW5k
IHRoZSBkZXZpY2UtdHJlZSBibG9icyBmb3IgdGhlIHJhc3BiZXJyeXBpIGJvYXJkcw0KPiBhcmUg
YnVpbHQgZnJvbSB0aGUgZG93bnN0cmVhbSBsaW51eCBwYWNrYWdlLCBhbmQgdGhlIGRldmljZS10
cmVlIGJsb2INCj4gb3ZlcmxheXMgYXJlIHRha2VuIGZyb20gdGhlIHBhY2thZ2UgcnBpLWZpcm13
YXJlLiBCb3RoIHBhY2thZ2VzIGxpbnV4DQo+IGFuZCBycGktZmlybXdhcmUgaGF2ZSB0byBiZSBj
bG9zZWx5IHN5bmNlZC4NCj4gDQo+IFRoZSBidWlsZHJvb3QgdHJlZSBtYWludGFpbnMgdGhlIHBh
Y2thZ2VzIGFuZCB0aGUgYm9hcmQgY29uZmlndXJhdGlvbnMsDQo+IGFuZCBpdCBrZWVwcyB0aGlu
Z3Mgc3luY2VkLg0KPiANCj4gVGhlIGRvd25zdHJlYW0gY29uZmlndXJhdGlvbnMgaW4gYnIyLWV4
dGVybmFsIHRyZWVzIHJlcXVpcmUgdG8gcGF5DQo+IGF0dGVudGlvbiB0byB0aGF0IHN5bmNocm9u
aXphdGlvbiBhcyB3ZWxsLiBJZiB0aGUgZmlsZXMgYXJlIG91dC1vZi1zeW5jLA0KPiAoaS5lLiB0
aGUgZHRib3MgaW4gdGhlIHJwaS1maXJtd2FyZSBwYWNrYWdlIGZyb20gdGhlIGJ1aWxkcm9vdCB0
cmVlIGRvDQo+IG5vdCBtYXRjaCB0aGUgbGludXggY29tbWl0IGluIHRoZSBicjItZXh0ZXJuYWwg
dHJlZSksIHRoZW4gdGhlIGJvb3QgbWF5DQo+IGZhaWwuDQo+IA0KPiBTaW5jZSB0aGUgUmFzcGJl
cnJ5IFBpJ3Mgd2l0aCBCbHVldG9vdGggaGF2ZSBubyBkZWRpY2F0ZWQgZGVidWdnaW5nIFVBUlQs
DQo+IHRoZXkgcmVxdWlyZSB0byBtZXJnZSB0aGUgYnQtbWluaXVhcnQuZHRibyB0byByZXN0b3Jl
IHRoZSBVQVJUMCB0byB0aGUNCj4gYWNjZXNzaWJsZSBHUElPcyBvZiA0MC1waW4gR1BJTyBoZWFk
ZXIuDQo+IA0KPiBUaGUgaW52ZXN0aWdhdGlvbiBvZiB0aGUgYm9vdCBmYWlsdXJlIGlzIGNvbWxp
Y2F0ZWQgaWYgdGhlIHJvb3QgY2F1c2UgaXMNCj4gZHVlIHRvIHRoZSBvdXQtb2Ytc3luYyBtZXJn
ZSBvZiB0aGUgZGVidWdnaW5nIHVhcnQncyBkdGJvIHRvIHRoZSBkdGIgYW5kDQo+IGlmIGZpcm13
YXJlIGJvb3Rsb2FkZXIgZG9lcyBub3Qgb3V0cHV0IHRoZSBkZWJ1ZyB0cmFjZXMuDQo+IA0KPiAJ
TUVTUzowMDowMDowNS4zODk4ODU6MDogYnJmczogRmlsZSByZWFkOiAvbWZzL3NkL292ZXJsYXlz
L21pbml1YXJ0LWJ0LmR0Ym8NCj4gCU1FU1M6MDA6MDA6MDUuNDA4ODgxOjA6IGR0ZXJyb3I6IGNh
bid0IGZpbmQgc3ltYm9sICd1YXJ0MV9idF9waW5zJw0KPiAJTUVTUzowMDowMDowNS40MTE5NDI6
MDogRmFpbGVkIHRvIHJlc29sdmUgb3ZlcmxheSAnbWluaXVhcnQtYnQnDQo+IA0KPiBBbGwgdGhp
cyBsb25nIHN0b3J5IHRvIGludHJvZHVjZSB0aGUgdGhyZWUgbmV3IGR0Ym9zIGNvbmZpZ3MgdG8g
YnVpbGQNCj4gaW4tdHJlZSBvciBvdXQtb2YtdHJlZSBkdGJvcywgYW5kIHRvIGtlZXAgdGhlIGRp
cmVjdG9yeSBuYW1lIChhc3N1bWluZw0KPiB0aGUgZG93bnN0cmVhbSB0cmVlcyB1c2VzIHRoZSBk
aXJlY3RvcnkgbmFtZSBvdmVybGF5cykuDQo+IA0KPiBUaGUgdGhyZWUgY29uZmlncyBhcmUgdGhl
IGVxdWl2YWxlbnQgdG8gZXhpc3RpbmcgZHRzIGNvbmZpZ3M6DQo+ICAtIEJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19PVkVSTEFZX05BTUVTIGlzIGVxdWl2YWxlbnQgdG8NCj4gICAgQlIyX0xJ
TlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUUNCj4gIC0gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
RFRTX09WRVJMQVlfUEFUSCBpcyBlcXVpdmFsZW50IHRvDQo+ICAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX0RUU19QQVRIDQo+ICAtIEJSMl9MSU5VWF9LRVJORUxfRFRCT19LRUVQX0RJUk5BTUUg
aXMgZXF1aXZhbGVudCB0bw0KPiAgICBCUjJfTElOVVhfS0VSTkVMX0RUQl9LRUVQX0RJUk5BTUUN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+
DQo+IC0tLQ0KPiAgbGludXgvQ29uZmlnLmluIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIGxpbnV4L2xpbnV4Lm1rICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGludXgv
Q29uZmlnLmluIGIvbGludXgvQ29uZmlnLmluDQo+IGluZGV4IDI3NjdiNzA5ZDQuLmZkZDU3ZTZm
ZjkgMTAwNjQ0DQo+IC0tLSBhL2xpbnV4L0NvbmZpZy5pbg0KPiArKysgYi9saW51eC9Db25maWcu
aW4NCj4gQEAgLTQzNCw2ICs0MzQsMjkgQEAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfRFRCX09W
RVJMQVlfU1VQUE9SVA0KPiAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIHRvIHN1cHBvcnQgRGV2aWNl
IFRyZWUgb3ZlcmxheXMNCj4gIAkgIG9uIHRoZSB0YXJnZXQgc3lzdGVtLg0KPiANCj4gK2NvbmZp
ZyBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfT1ZFUkxBWV9OQU1FUw0KPiArCXN0cmluZyAi
SW4tdHJlZSBEZXZpY2UgVHJlZSBTb3VyY2UgT3ZlcmxheSBmaWxlIG5hbWVzIg0KPiArCWRlcGVu
ZHMgb24gQlIyX0xJTlVYX0tFUk5FTF9EVEJfT1ZFUkxBWV9TVVBQT1JUDQo+ICsJaGVscA0KPiAr
CSAgTmFtZSBvZiBpbi10cmVlIGRldmljZSB0cmVlIHNvdXJjZSBmaWxlLCB3aXRob3V0DQo+ICsJ
ICB0aGUgdHJhaWxpbmcgLW92ZXJsYXkuZHRzLiBZb3UgY2FuIHByb3ZpZGUgYSBsaXN0IG9mDQo+
ICsJICBkdHMgZmlsZXMgdG8gYnVpbGQsIHNlcGFyYXRlZCBieSBzcGFjZXMuDQoNCkkgZG8gbm90
IGxpa2UgdGhhdCB5b3UgYXNzdW1lIHRoYXQgdGhlIERUIG92ZXJsYXkgaGFzIGEgLW92ZXJsYXku
ZHRzIHN1ZmZpeCwNCnRoYXQgc2VlbXMgdG8gYmUgc29tZXRoaW5nIHNwZWNpZmljIGZvciB0aGUg
cmFzcGJlcnJ5IHBpIGRvd25zdHJlYW0ga2VybmVsLg0KDQpNb3N0IGRldmljZSB0cmVlIG92ZXJs
YXlzIGluIHRoZSB1cHN0cmVhbSBrZXJuZWwgc2ltcGx5IGhhdmUgYSAuZHRzbyBzdWZmaXg6DQpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9pZD00MDY1ODUzNDc1NmY4MzY5ZTkzYjg0ZmE3NWMyMGJkZTY1Mjhj
YjgyDQoNClNvIGl0IHdvdWxkIGJlIG5pY2UgaWYgeW91ciBwYXRjaCBzdXBwb3J0ZWQgdGhhdCBh
cyB3ZWxsLg0KDQoNCkFsc28gc2VlIHRoaXMgb3RoZXIgcHJvcG9zYWwgZnJvbSBNaWNoYWVsIFdh
bGxlOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjQwMjEzMTU0ODQ3Ljkx
NDA2OC0xLW1pY2hhZWxAd2FsbGUuY2MvDQoNCg0KS2luZCByZWdhcmRzLA0KTmlrbGFzDQoNCj4g
Kw0KPiArY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19PVkVSTEFZX1BBVEgNCj4g
KwlzdHJpbmcgIk91dC1vZi10cmVlIERldmljZSBUcmVlIFNvdXJjZSBPdmVybGF5IGZpbGUgcGF0
aHMiDQo+ICsJaGVscA0KPiArCSAgUGF0aHMgdG8gb3V0LW9mLXRyZWUgRGV2aWNlIFRyZWUgU291
cmNlIE92ZXJsYXkgKC1vdmVybGF5LmR0cykNCj4gKwkgIGFuZCBEZXZpY2UgVHJlZSBTb3VyY2Ug
SW5jbHVkZSAoLmR0c2kpIGZpbGVzLCBzZXBhcmF0ZWQgYnkNCj4gKwkgIHNwYWNlcy4gVGhlc2Ug
ZmlsZXMgd2lsbCBiZSBjb3BpZWQgdG8gdGhlIGtlcm5lbCBzb3VyY2VzIGFuZA0KPiArCSAgdGhl
IC5kdHMgZmlsZXMgd2lsbCBiZSBjb21waWxlZCBmcm9tIHRoZXJlLg0KPiArDQo+ICtjb25maWcg
QlIyX0xJTlVYX0tFUk5FTF9EVEJPX0tFRVBfRElSTkFNRQ0KPiArCWJvb2wgIktlZXAgdGhlIGRp
cmVjdG9yeSBuYW1lIG9mIHRoZSBEZXZpY2UgVHJlZSBPdmVybGF5Ig0KPiArCWhlbHANCj4gKwkg
IElmIGVuYWJsZWQsIHRoZSBkZXZpY2UgdHJlZSBibG9iIG92ZXJsYXlzIGtlZXAgdGhlaXINCj4g
KwkgIGRpcmVjdG9yeSBwcmVmaXhlcyB3aGVuIHRoZXkgZ2V0IGNvcGllZCB0byB0aGUNCj4gKwkg
IG91dHB1dCBpbWFnZSBkaXJlY3Rvcnkgb3IgdGhlIHRhcmdldCBkaXJlY3RvcnkuDQo+ICsNCj4g
IGVuZGlmDQo+IA0KPiAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQNCj4g
ZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsNCj4gaW5kZXggNGUx
MmIzNmMxZi4uOGIzNTYzMzk0ZCAxMDA2NDQNCj4gLS0tIGEvbGludXgvbGludXgubWsNCj4gKysr
IGIvbGludXgvbGludXgubWsNCj4gQEAgLTE5OSw2ICsxOTksMTQgQEAgTElOVVhfRFRTX05BTUUg
Kz0gJChiYXNlbmFtZSAkKGZpbHRlciAlLmR0cywkKG5vdGRpciAkKGNhbGwgcXN0cmlwLCQoQlIy
X0xJTlVYX0sNCj4gDQo+ICBMSU5VWF9EVEJTID0gJChhZGRzdWZmaXggLmR0YiwkKExJTlVYX0RU
U19OQU1FKSkNCj4gDQo+ICtpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfRFRCX09WRVJMQVlfU1VQ
UE9SVCkseSkNCj4gK0xJTlVYX0RUU19PVkVSTEFZX05BTUVTICs9ICQoY2FsbCBxc3RyaXAsJChC
UjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfT1ZFUkxBWV9OQU1FUykpDQo+ICsNCj4gK0xJTlVY
X0RUU19PVkVSTEFZX05BTUVTICs9ICQoYmFzZW5hbWUgJChmaWx0ZXIgJS1vdmVybGF5LmR0cywk
KG5vdGRpciAkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09WRVJM
QVlfUEFUSCkpKSkpDQo+ICsNCj4gK0xJTlVYX0RUQk9TID0gJChhZGRzdWZmaXggLmR0Ym8sJChM
SU5VWF9EVFNfT1ZFUkxBWV9OQU1FUykpDQo+ICtlbmRpZg0KPiArDQo+ICBpZmVxICgkKEJSMl9M
SU5VWF9LRVJORUxfSU1BR0VfVEFSR0VUX0NVU1RPTSkseSkNCj4gIExJTlVYX0lNQUdFX05BTUUg
PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9JTUFHRV9OQU1FKSkNCj4gIExJTlVY
X1RBUkdFVF9OQU1FID0gJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfSU1BR0VfVEFS
R0VUX05BTUUpKQ0KPiBAQCAtNDU5LDEwICs0NjcsMjMgQEAgZGVmaW5lIExJTlVYX0lOU1RBTExf
RFRCDQo+ICAJCQkkKDEpLyQoaWYgJChCUjJfTElOVVhfS0VSTkVMX0RUQl9LRUVQX0RJUk5BTUUp
LCQoZHRiKSwkKG5vdGRpciAkKGR0YikpKQ0KPiAgCSkNCj4gIGVuZGVmDQo+ICtkZWZpbmUgTElO
VVhfSU5TVEFMTF9EVEJPDQo+ICsJJChmb3JlYWNoIGR0Ym8sJChMSU5VWF9EVEJPUyksIFwNCj4g
KwkJaW5zdGFsbCAtRCBcDQo+ICsJCQkkKHdpbGRjYXJkICQoTElOVVhfQVJDSF9QQVRIKS9ib290
L2R0cy8kKGR0Ym8pKSBcDQo+ICsJCQkkKDEpLyQoaWYgJChCUjJfTElOVVhfS0VSTkVMX0RUQk9f
S0VFUF9ESVJOQU1FKSwkKGR0Ym8pLCQobm90ZGlyICQoZHRibykpKQ0KPiArCSkNCj4gK2VuZGVm
DQo+ICBlbmRpZiAjIEJSMl9MSU5VWF9LRVJORUxfQVBQRU5ERURfRFRCDQo+ICBlbmRpZiAjIEJS
Ml9MSU5VWF9LRVJORUxfRFRCX0lTX1NFTEZfQlVJTFQNCj4gIGVuZGlmICMgQlIyX0xJTlVYX0tF
Uk5FTF9EVFNfU1VQUE9SVA0KPiANCj4gK2lmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9EVFNfT1ZF
UkxBWV9TVVBQT1JUKSx5KQ0KPiArZGVmaW5lIExJTlVYX0JVSUxEX0RUQk8NCj4gKwkkKExJTlVY
X01BS0VfRU5WKSAkKEJSMl9NQUtFKSAkKExJTlVYX01BS0VfRkxBR1MpIC1DICQoQEQpICQoTElO
VVhfRFRCT1MpDQo+ICtlbmRlZg0KPiArZW5kaWYgIyBCUjJfTElOVVhfS0VSTkVMX0RUU19PVkVS
TEFZX1NVUFBPUlQNCj4gKw0KPiAgaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX0FQUEVOREVEX0RU
QikseSkNCj4gICMgZHRicyBtb3ZlZCBmcm9tIGFyY2gvJEFSQ0gvYm9vdCB0byBhcmNoLyRBUkNI
L2Jvb3QvZHRzIHNpbmNlIDMuOC1yYzENCj4gIGRlZmluZSBMSU5VWF9BUFBFTkRfRFRCDQo+IEBA
IC01MDksNiArNTMwLDcgQEAgZGVmaW5lIExJTlVYX0JVSUxEX0NNRFMNCj4gIAkkKExJTlVYX01B
S0VfRU5WKSAkKEJSMl9NQUtFKSAkKExJTlVYX01BS0VfRkxBR1MpIC1DICQoQEQpICQoTElOVVhf
VEFSR0VUX05BTUUpDQo+ICAJJChMSU5VWF9CVUlMRF9EVEIpDQo+ICAJJChMSU5VWF9BUFBFTkRf
RFRCKQ0KPiArCSQoTElOVVhfQlVJTERfRFRCTykNCj4gIGVuZGVmDQo+IA0KPiAgaWZlcSAoJChC
UjJfTElOVVhfS0VSTkVMX0FQUEVOREVEX0RUQikseSkNCj4gQEAgLTUzMCw2ICs1NTIsNyBAQCBp
ZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQpLHkpDQo+ICBkZWZpbmUgTElO
VVhfSU5TVEFMTF9LRVJORUxfSU1BR0VfVE9fVEFSR0VUDQo+ICAJJChjYWxsIExJTlVYX0lOU1RB
TExfSU1BR0UsJChUQVJHRVRfRElSKS9ib290KQ0KPiAgCSQoY2FsbCBMSU5VWF9JTlNUQUxMX0RU
QiwkKFRBUkdFVF9ESVIpL2Jvb3QpDQo+ICsJJChjYWxsIExJTlVYX0lOU1RBTExfRFRCTywkKFRB
UkdFVF9ESVIpL2Jvb3Qvb3ZlcmxheXMpDQo+ICBlbmRlZg0KPiAgZW5kaWYNCj4gDQo+IEBAIC01
NDQsNiArNTY3LDcgQEAgZW5kZWYNCj4gIGRlZmluZSBMSU5VWF9JTlNUQUxMX0lNQUdFU19DTURT
DQo+ICAJJChjYWxsIExJTlVYX0lOU1RBTExfSU1BR0UsJChCSU5BUklFU19ESVIpKQ0KPiAgCSQo
Y2FsbCBMSU5VWF9JTlNUQUxMX0RUQiwkKEJJTkFSSUVTX0RJUikpDQo+ICsJJChjYWxsIExJTlVY
X0lOU1RBTExfRFRCTywkKEJJTkFSSUVTX0RJUikpDQo+ICBlbmRlZg0KPiANCj4gIGlmZXEgKCQo
QlIyX1NUUklQX3N0cmlwKSx5KQ0KPiAtLQ0KPiAyLjQ0LjANCj4gDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QNCj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
