Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9CC87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 06:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A7D40DAD;
	Wed, 13 Aug 2025 06:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCdfTYXnsoe0; Wed, 13 Aug 2025 06:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650F240EBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650F240EBD;
	Wed, 13 Aug 2025 06:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 296981C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 06:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AC3140EBD
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 06:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVq7tL2u8-zC for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 06:15:40 +0000 (UTC)
X-Greylist: delayed 437 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Aug 2025 06:15:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E95C940DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95C940DA1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E95C940DA1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 06:15:37 +0000 (UTC)
X-CSE-ConnectionGUID: cxirp4rsQQK9otSyzTtAnA==
X-CSE-MsgGUID: +l3rjGCcScqxIcKhTLuB2w==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 13 Aug 2025 08:08:17 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 5EC56B5A87
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:08:17 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id AD150B5A86
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:08:15 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 13 Aug
 2025 08:08:15 +0200
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (40.107.247.91)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 08:08:15 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOk+7oJVW7h8hqIi0vqcMEW8Svk/OrrxnsNTdLW40BQlJkS/rZQ3A0StNGgRpN5O1kFQvLEIkNgtogDxV7sBocww7Q0eUgh1Cp/5F2Gl+GSe+tx343gz4zFAD8o0tk8FFtNZ2hlatKBTSgT4i1it9NI81fCQHU64uSEBbWFGjOmvp5vgRiP6IEjv6aSL5PtXyC/fXQgfm0n37Zw7Cpdsi/yc/yH6QjkM6OM1BKWV5S8cg9Zqlenxj4bwJ8Rfre1lDRXFGVv6QSnGzqR1sMR30FAGW/DHJihAteKqCt4JYR4m+SqU129RES5w1oI7ttIJXUan991mAwVw6p9zvuOhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceGu5AipupJzz0im6IlN+s1W93UlT5SHrUgNjZtPAWg=;
 b=wQ/97Zu08xI16p61SIynNl2qSfVPdaw+G9EyPg9jGm7sx9dylLj/vL2SHkn3jYEcKfWYv1uGtFl9sT0Zg7MgfLSb3Orn1dcfK9pXZ/cNgzL8z1VX98XUENOVgETbTe576WYfivjCdXfZTp2Yz0LTFD6qr3xG1mHhOjxI0AFKKPz3ILcg3Y0PKTvgY4i9x2bLoCzF+WWY2YL7gRSj3ZNz/TkY90fZGmE6wE2tLhea04M3fGpXDecjWbhNctFKqsRX5byB3O03aMHaCuBpTdHgoqLAcqN9y8UJq31kdo+Xi+Gd4Al89i3n2ieqgkGiy2AI6WMP/JMFVoGnP9dOgjuZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2PPF963F01236.EURP250.PROD.OUTLOOK.COM (2603:10a6:18:3::b21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 06:08:13 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 06:08:13 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/1] package/libzenoh-c: install to staging
Thread-Index: AQHcDBhc9O6Ayb8nGEahe/iB8pmsGA==
Date: Wed, 13 Aug 2025 06:08:13 +0000
Message-ID: <AS1P250MB0608B288A957E1A3B17204B1A92AA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2PPF963F01236:EE_
x-ms-office365-filtering-correlation-id: 568d0a68-a434-4c26-c039-08ddda2fc965
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?utf-8?B?cEgrdHBtYVpnYUZuaUF6RmtHSExtbVNMam9OUy9TM3FiTUsrOFBxa2JYdmtU?=
 =?utf-8?B?SWhCMFZDaUw2dGxhQkY1TEtDbHpRUmZ4WlM3U0VtZy93cXpPQ282cjlsWHg4?=
 =?utf-8?B?VWdSSUZCTHhYcW8rRkpnb1lPMlBiMzdLaGU3QktOOHpzU1Q5MUE0UitzbHVv?=
 =?utf-8?B?M2VkaFV4SENDQURNeHlXTnJGMG9LcHRqTDF6QmhtUi84ODdmK2VZWFJ2MnF3?=
 =?utf-8?B?ejMvU1FoWUlJMkkzNVM4azdZZVhnZHRnbmgrTzFtQ2swOHFWSmtHSkJsdW43?=
 =?utf-8?B?dU5NNC9nTEdoOXN6QnFzVE9IYUNqSUh4ZWlHYVZlbE5yK2dxd1NQaUlqTThE?=
 =?utf-8?B?eHdWa0lJZzVsYk5zZ3UvOXUzVWMrS0t2RGd3VUNoTkRHbWlYUitpMUJzZkdo?=
 =?utf-8?B?YkhSNGN5VGE1UGo4cFRPS1NNRUVuK25xK3drWFNiMSt6T3lZZ0xsQU1JSUc0?=
 =?utf-8?B?N3J3aUJZTWQyOE1ZNGN4YTdSZzREV2hIT1IrM01IYkRNUXFJSEdrZkFkTG15?=
 =?utf-8?B?ZWZUTWtaOGpxVi9DaWRiNUhIRXRPVk9NTkpnWjErUXBZMmpwOE5DNzJGQVI0?=
 =?utf-8?B?cE44U3RUd1g4V3Y3d1ZhN0ozV2lWMnp2T1Y4RlAvWHBwYXVMYUxlOUprZ2o2?=
 =?utf-8?B?L1loSG9ISU1Dd20zOE9mRDFBOVJkbHV3d1FNRXJpQUJVdVlSQTh2Y2tKWFp1?=
 =?utf-8?B?b293ZWs2alRLR2pla3Z0MDJIcE5kRVRjWTNrcGNXSmVQT3V3Ulo2M3IydWlP?=
 =?utf-8?B?OEhmQWN1NmcvanRESERXdFZEWXFiMThsZHAwcEkzUCtYOFJOMDFCRVROODhu?=
 =?utf-8?B?Z1FYUDN4aHFyK2c3VHM3TGNtMGxWdlBaNnd5YlRKRHdPUGNORmxLTW16QlhV?=
 =?utf-8?B?VzM5VldOcmZlaVdBUTFpMENzTi9hckZZdzN0RWRrZ0Q2TUhGYWZ0em5SM01p?=
 =?utf-8?B?c25NaTVyTFczR1dnbEh2SitOanZTN09uNEhCdzlzVU5qYWlQUG1SMTZzalY2?=
 =?utf-8?B?Vm1tYkJQZXR5eWY1TkRRNHhQZUErZlgxUEozdmhsSVpZSE9QSlIyWmZLZFY1?=
 =?utf-8?B?U2lsWnFhc1gxd05Mb0VUSGpzdVNJbEp1Q0lkeGYxODhvWEg5V3hvaVRONnRa?=
 =?utf-8?B?ckFWMFgwNXVSK3MvSlhDTEZkeFFWMU1xeUZwRWFuYlJwRTF1c2JCZXFZdHRQ?=
 =?utf-8?B?NkY4STkzUU52S0JCdnhsSmpKUzJCbDM1Wk5CZ1pWZ0diNncrNURZRXBJNzla?=
 =?utf-8?B?WUlVdW1RZWZ1amZOTzErMndOVlJ0aHNEVnhOQS8vZWgyVW1qS21ZeUpvdkxZ?=
 =?utf-8?B?YXV5aC81ZEFvVC8ya1JsSkx5YTFvVmVuU0N0Y0RGRmg3RU1nYkFPb1NxcVJi?=
 =?utf-8?B?aEdOTmVPcGsvWmU4OC9zdmhNVHM0QUhKd0wzRXJlNE1NN01RUVI0SzJnV25P?=
 =?utf-8?B?ZEN0cHczTTk3b09GY2lVb3FQdUE1bEQ4WUdPY0lGY0hVaGpOdnlkeU5POFpH?=
 =?utf-8?B?RU1yRjVnL1pacmdQRmxnVEU5T2paSHN4ZzAxNjJBenFRVHVURVN6MVJaY2Fz?=
 =?utf-8?B?VGZqclJyUWRNbElGTWM0NnIzZTRWV2NBTmRoRGRmRTg3RHZMRTZyczkxR21C?=
 =?utf-8?B?VEtvd2tFTzBJR1IrY3lpM2NiNDZaazR1dkRCYU9aOWlrMW9oeUNRQkp3bFV1?=
 =?utf-8?B?Qkd0YmcrY0FuS3I4TllYNFZTcWVMMFhzaFFLVllpUnNSY2VQeXlWOFZVV3Rm?=
 =?utf-8?B?eHJwR2o5YWRLSm1VYS9uUzVueU94TWE3U3JGcjB4N1c1OExrWmhKY3k3ZEVi?=
 =?utf-8?B?UzBhL1NIQ0JnUGFuV1JmNGJ4V3hmamlEejZzV01IckhiNkJsTEtpSkhlbXdl?=
 =?utf-8?B?R1hJQTVJdm9nNkd1MnhJYkhmQWVEMS9sTytOWTF6U3pYRmNIczJLa2R0Y0xo?=
 =?utf-8?Q?YMBpSMly/qk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(8096899003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGhiSnBwczBJMytPYVhzZHYxSWUraHpGZlI3ekluK3JYclN0SzNzTGVVNTMx?=
 =?utf-8?B?bFdtY0d2Z3pHc21sQW5BM2QzVnl4MXVCVzNhaE90MlFWcUNFS3QyQ0pSdmw2?=
 =?utf-8?B?R20vZWdjcHA0L0huMTdRS1N6dDJtUnZKc2NtL1RhZ29IUnlCTi9ydlJBOGk1?=
 =?utf-8?B?bFMwbDc2OVFxSGJxclZwcmlNMUFDZTRURnNvQ2NvK0ZCYXpYT2lZT2t0YTZi?=
 =?utf-8?B?KzJjZFpBU0RvRDBmQllBSTBSVXBRTGVzd2dIN3hLL01ZWC90eGhvb3JSdHgy?=
 =?utf-8?B?WDZ4ZnhFWFFIZkoyOCsxeUdjN2NjYTdWQ0R6RnVKejVOMGlsSlN3SS9pMU0y?=
 =?utf-8?B?a2ErTGZwUG5maktCRzZMTTBsREZLNmJFTDN0eGxlY3hiSlh2V0FPN3pOMm9k?=
 =?utf-8?B?TUpURzFWRXlyT0c3ZGRDWUJpMEF2a3ZCV0U1SG10RXRGOFBuaTV3SytxTWVr?=
 =?utf-8?B?dnE1YzQrdW9hWDJFYUpwZlE3Y1hMZ1VMQWsrWnhzWFo1bTArNVlSWkxDYVNa?=
 =?utf-8?B?eUI4Y0xlTWhUN2dHZy9SNC9ZRjdCZSs5dXYrS21NWWhiSjdhS0ZoNnhEU21K?=
 =?utf-8?B?MDlZYW9RMXdpUEJGQ3NuQ3ZZM29CRVVKQzN0bGxBVHI5MUtLUGxmYnJQcUhX?=
 =?utf-8?B?eTN4MlkwQ1lKQnY4VEt5WGtLNFIwdjh3dWJ1TTdwTHlkOEhncXo4N3FFMG9Y?=
 =?utf-8?B?SmdhY0FPT2pSU0pza09NTUhvV2xMSkRDM080N2hUcVA5b1BLVDQyckxvNWZ3?=
 =?utf-8?B?cnNHZUhrMG5mS1M4bDVUZHdKOWhUT1QyMUdnS2lHWXd6UVM0ZGdyUFA1VjIx?=
 =?utf-8?B?SWZoazYvb2Q0c05MWmhCWkZYSlExYk01OXdpVmU2UUhjODBOSUdMbWo1Y28w?=
 =?utf-8?B?REFzazlMajV4OUdWbW5IRmc5M0lGbTRaZTduKytaMzRvNmVvd3lQRE1icklw?=
 =?utf-8?B?WXpuTEkyZmgyL3lVZ3lkUUxsclE2eFoveVgyZjZrb0tiaUhuSm9QcjRtVG01?=
 =?utf-8?B?YlBoNDBiUWlMRlc2dDk3bVljZDVuMTlYeTc3VFFucm84R0wvU2IzZHhlK3Bn?=
 =?utf-8?B?ZHN2a0NydHdjenRmSDZEZlIyY0dESEprUEVDWFlsSmNjcWJ4OHc2ZCs2WTcw?=
 =?utf-8?B?MlJsc0x0S2FiMkhkb1NjbmY3ZFNlakxsdGdKMlNKdDRCRGRuNWNpRmV2Rm1x?=
 =?utf-8?B?Sm9UeDZZZ1pPNGsvZUxzbVJJQWdpd0R3ZWlDTzcwSFYxZ2ZDR2pnUFVHUGpj?=
 =?utf-8?B?Vy9CanNVYU1pWDBWSEFDNVAwQ2xmS1VDVEV5ZitWWk5qVkVrSjRyeVJwZThl?=
 =?utf-8?B?OStFZ0FJMEZLdGtQazRraUd1WVRyYnJWTWdYRGtpSHVDU0VqSHFEeXp1UVlN?=
 =?utf-8?B?cFFOZE45R2ppUlBzRWN2OHlxZ1FHbytwb2FqRlR5aFhKUGFMN2lKRUtoUEtD?=
 =?utf-8?B?eDRnYk1VYUdGQmxqV1dNR0hmSnhHdDBQY3pUMUZpbWdKOU1EeDErQ24rb2tu?=
 =?utf-8?B?OTlENWxYSUM5VjB6MDlBYXhUK003dXlVNGFnNlZMOFIxVTkzTVJsZXU3dlpv?=
 =?utf-8?B?MENWdkJJTFRqRkNtc3JyRlI1QXBmcmU2Yzc4SDNKamt2VnBLeWNXdmxNZWlC?=
 =?utf-8?B?Ri9lcDBpdEtsRHdhMWVsdHFycy9iL2U3STFOVFdGcGEzMnNUMCt0TWtFb013?=
 =?utf-8?B?bEh2bWdJM3NxUVk3a25nUkRYWGtCdkFnMjZTVDRaQ0xHcUlxdFNUWGdlZmhi?=
 =?utf-8?B?cHVsZGdpaDhvVzJVN0JwNHpiUGF2RU9YM1RVb01PR2VrZ3pPY0hReWtHS2ZX?=
 =?utf-8?B?WCs3czcrSHRsVzdEdFl3aEM5ZExIN2UwY2NvM1NFQVdnQWwyaHo1Q3B0Z3R3?=
 =?utf-8?B?T01DNDZqWllGYUZqeTBzNndleis0QVlKSTRjSnNmL0pybDludWZCd2pNVkpq?=
 =?utf-8?B?eFI4Y1VZRVZVNVFFYzRJYlVEYUdBL2dLOTllbVhtNFBUa1FzdXE1c0hiSnM0?=
 =?utf-8?B?M3pwUHN5WHhXVTB0eUYzQlZyVXBCaXlIcFUyUGkwbGR1Q2k4bUNHcjJlMytO?=
 =?utf-8?B?VTBuNk5zaVpMMVpjc05QbXhwdTR5VmkyTmxiZWFSTkNBWjJFdlZmWEJ1Q1FI?=
 =?utf-8?B?czFncllaZDJqOXJFMVMxd0xGWXZqdHdsZ2Y0cE5aUDRsNkRoUFlCYy90YWlL?=
 =?utf-8?B?V0E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: or4RWrkM/tOTiBdUa+cpUtTCF/Ukf8sHvl0BAQefyYb6KwlslpDMxGs+Rqf/Fm1EO2PAiaNJWF36BhfgSEG+C+a8uq2HDtU+ag4ABSFfuilgzr42DDrvgSEXQBQ8SEo5nG5/zvRSpF5GcaGnJW0C1XhDZUHJ521NK+gPC7XB54M+OSqy5yDeNXnlPx91fYWtgjYv71HK2QjYuQK9c/24YDJjoHfzBFS+sj4oHDJ/SDd9e3oPobqZVBvOhp9dX6khs1+aUJGkWClU7KgSm3H9hB+jbn3r1OGTdiQVllI4bIqZczZyeSXcefs0CsGv/XPerZzt+CFHH8W17FWvPV07cSyZExd8YBPDim5ynPnsBlb+ScZvY28wQQcyHM2SuZl19lhZpSKHaE58g/jr08yYvYwmN679+k98enZokFyvLMiN9Sofuj4e1MLjIRmsCecMr8PQzWoKhBy1ZsTYfj9aUA4mLqu7XyR5pi51L0Yq3WM8tLcr2oF9wu1bEfWKPjzu/su3kSdSuoAWQdqFpi5Jz+3qklNB+8oWch0Vm8JW2+yQzsd1svYPLCRPu0MIgCQVgi6r5PxXpKy5fdV7FsfW8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 568d0a68-a434-4c26-c039-08ddda2fc965
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 06:08:13.3074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4hwSxVagdj7B22bQYt9ICQTtMytQFDOdc0Ha50JImHHm0KiF1NM+DC1fdhRTAYk/64uQKD9txPbcB6HLELKtc6KpHgLSpO5qNLwhqBeNAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF963F01236
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/1] package/libzenoh-c: install to staging
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
Content-Type: multipart/mixed; boundary="===============4525756542122601269=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4525756542122601269==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AS1P250MB0608B288A957E1A3B17204B1A92AAAS1P250MB0608EURP_"

--_000_AS1P250MB0608B288A957E1A3B17204B1A92AAAS1P250MB0608EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW5zdGFsbCBsaWJ6ZW5vaGMucGMgdG8gc3RhZ2luZy4gUGFja2FnZXMsIHdoaWNoIHVzZQ0KbGli
emVub2gtYyBhcyBkZXBlbmRlbmN5LCBhcmUgbm90IGFibGUgdG8gZmluZCBpdC4NCg0KU2lnbmVk
LW9mZi1ieTogQWxleCBNaWNoZWwgPGFsZXgubWljaGVsQHdpZWRlbWFubi1ncm91cC5jb20+DQot
LS0NCiBwYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tayB8IDkgKysrKysrKysrDQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ6
ZW5vaC1jL2xpYnplbm9oLWMubWsgYi9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5taw0K
aW5kZXggYmZlZThmMzNlMC4uNDFiMDRkOThmOCAxMDA2NDQNCi0tLSBhL3BhY2thZ2UvbGliemVu
b2gtYy9saWJ6ZW5vaC1jLm1rDQorKysgYi9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5t
aw0KQEAgLTM1LDYgKzM1LDE1IEBAIGRlZmluZSBMSUJaRU5PSF9DX0lOU1RBTExfU1RBR0lOR19D
TURTDQog4oCC4oCC4oCC4oCC4oCCJChjYWxsIExJQlpFTk9IX0NfSU5TVEFMTF9GSUxFUywkKFNU
QUdJTkdfRElSKSkNCiDigILigILigILigILigIJta2RpciAtcCAkKFNUQUdJTkdfRElSKS91c3Iv
aW5jbHVkZS8NCiDigILigILigILigILigIJjcCAtZHBmciAkKEBEKS9pbmNsdWRlLyogJChTVEFH
SU5HX0RJUikvdXNyL2luY2x1ZGUvDQor4oCC4oCC4oCC4oCC4oCCY2F0ICQoQEQpL2luc3RhbGwv
emVub2hjLnBjLmluIFwNCivigILigILigILigILigILigILigILigILigILigILigIJ8IHNlZCAi
c3xAQ01BS0VfSU5TVEFMTF9QUkVGSVhAfC91c3J8ZyIgXA0KK+KAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAgnwgc2VkICJzfEBQUk9KRUNUX05BTUVAfGxpYnplbm9oY3xnIiBcDQor4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCfCBzZWQgInN8QENNQUtFX1BST0pFQ1RfREVT
Q1JJUFRJT05AfFRoZSBDIGJpbmRpbmdzIGZvciBaZW5vaHxnIiBcDQor4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCCfCBzZWQgInN8QENNQUtFX1BST0pFQ1RfSE9NRVBBR0VfVVJMQHxo
dHRwczovL2dpdGh1Yi5jb20vZWNsaXBzZS16ZW5vaC96ZW5vaC1jfGciIFwNCivigILigILigILi
gILigILigILigILigILigILigILigIJ8IHNlZCAic3xAUFJPSkVDVF9WRVJTSU9OQHwkKExJQlpF
Tk9IX0NfVkVSU0lPTil8ZyIgXA0KK+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgnwg
c2VkICJzfEBDTUFLRV9JTlNUQUxMX0lOQ0xVREVESVJAfGluY2x1ZGV8ZyIgXA0KK+KAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAgnwgc2VkICJzfEBDTUFLRV9JTlNUQUxMX0xJQkRJUkB8
bGlifGciIFwNCivigILigILigILigILigILigILigILigILigILigILigIJ8IHNlZCAic3xATElC
TkFNRUB8emVub2hjfGciID4gJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvbGliemVu
b2hjLnBjDQogZW5kZWYNCg0KICQoZXZhbCAkKGNhcmdvLXBhY2thZ2UpKQ0KLS0NCjIuNDMuMA0K
DQoNCg==

--_000_AS1P250MB0608B288A957E1A3B17204B1A92AAAS1P250MB0608EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBC
YXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiIGNsYXNzPSJlbGVt
ZW50VG9Qcm9vZiI+DQpJbnN0YWxsIGxpYnplbm9oYy5wYyB0byBzdGFnaW5nLiBQYWNrYWdlcywg
d2hpY2ggdXNlPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNp
emU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5saWJ6ZW5vaC1jIGFzIGRlcGVuZGVuY3ks
IGFyZSBub3QgYWJsZSB0byBmaW5kIGl0LjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+PGJyPg0KPC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij5TaWduZWQtb2ZmLWJ5OiBBbGV4IE1pY2hlbCAmbHQ7YWxleC5t
aWNoZWxAd2llZGVtYW5uLWdyb3VwLmNvbSZndDs8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPi0tLTwv
ZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyI+Jm5ic3A7cGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMu
bWsgfCA5ICsrKysrKysrKzwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsg
Zm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Jm5ic3A7MSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKTwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxv
dzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+PGJyPg0KPC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij5kaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMu
bWsgYi9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tazwvZGl2Pg0KPGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+aW5kZXggYmZlZThmMzNlMC4uNDFiMDRkOThmOCAxMDA2NDQ8L2Rpdj4NCjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPi0tLSBhL3BhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rPC9kaXY+DQo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4rKysgYi9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tazwvZGl2Pg0KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdi
KDAsIDAsIDApOyI+QEAgLTM1LDYgKzM1LDE1IEBAIGRlZmluZSBMSUJaRU5PSF9DX0lOU1RBTExf
U1RBR0lOR19DTURTPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250
LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4mbmJzcDvigILigILigILigILigIIk
KGNhbGwgTElCWkVOT0hfQ19JTlNUQUxMX0ZJTEVTLCQoU1RBR0lOR19ESVIpKTwvZGl2Pg0KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdi
KDAsIDAsIDApOyI+Jm5ic3A74oCC4oCC4oCC4oCC4oCCbWtkaXIgLXAgJChTVEFHSU5HX0RJUikv
dXNyL2luY2x1ZGUvPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250
LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4mbmJzcDvigILigILigILigILigIJj
cCAtZHBmciAkKEBEKS9pbmNsdWRlLyogJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvPC9kaXY+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KK+KAguKAguKAguKAguKA
gmNhdCAkKEBEKS9pbnN0YWxsL3plbm9oYy5wYy5pbiBcPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4r
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCfCBzZWQgJnF1b3Q7c3xAQ01BS0VfSU5T
VEFMTF9QUkVGSVhAfC91c3J8ZyZxdW90OyBcPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWls
eTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4r4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCfCBzZWQgJnF1b3Q7c3xAUFJPSkVDVF9OQU1FQHxs
aWJ6ZW5vaGN8ZyZxdW90OyBcPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93
OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4r4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCCfCBzZWQgJnF1b3Q7c3xAQ01BS0VfUFJPSkVDVF9ERVNDUklQVElP
TkB8VGhlIEMgYmluZGluZ3MgZm9yIFplbm9ofGcmcXVvdDsgXDwvZGl2Pg0KPGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+K+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgnwgc2VkICZxdW90O3N8QENNQUtF
X1BST0pFQ1RfSE9NRVBBR0VfVVJMQHxodHRwczovL2dpdGh1Yi5jb20vZWNsaXBzZS16ZW5vaC96
ZW5vaC1jfGcmcXVvdDsgXDwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsg
Zm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+K+KAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAgnwgc2VkICZxdW90O3N8QFBST0pFQ1RfVkVSU0lPTkB8JChMSUJaRU5P
SF9DX1ZFUlNJT04pfGcmcXVvdDsgXDwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJh
cmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+K+KAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAgnwgc2VkICZxdW90O3N8QENNQUtFX0lOU1RBTExfSU5DTFVE
RURJUkB8aW5jbHVkZXxnJnF1b3Q7IFw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBC
YXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPivigILigILigILi
gILigILigILigILigILigILigILigIJ8IHNlZCAmcXVvdDtzfEBDTUFLRV9JTlNUQUxMX0xJQkRJ
UkB8bGlifGcmcXVvdDsgXDwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEJhcmxvdzsg
Zm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+K+KAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAgnwgc2VkICZxdW90O3N8QExJQk5BTUVAfHplbm9oY3xnJnF1b3Q7ICZn
dDsgJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvbGliemVub2hjLnBjPC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4mbmJzcDtlbmRlZjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IEJhcmxvdzsgZm9udC1zaXplOiAxMHB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Jm5ic3A7PC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4mbmJzcDskKGV2YWwgJChjYXJnby1wYWNrYWdlKSk8L2Rpdj4N
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29sb3I6
IHJnYigwLCAwLCAwKTsiPi0tJm5ic3A7PC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
QmFybG93OyBmb250LXNpemU6IDEwcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4yLjQzLjA8L2Rp
dj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBCYXJsb3c7IGZvbnQtc2l6ZTogMTBwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyI+PGJy
Pg0KPC9zcGFuPjxicj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_AS1P250MB0608B288A957E1A3B17204B1A92AAAS1P250MB0608EURP_--

--===============4525756542122601269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4525756542122601269==--
