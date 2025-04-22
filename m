Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B269C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E482C608DD;
	Tue, 22 Apr 2025 10:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HniBb12khZ3; Tue, 22 Apr 2025 10:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 063D760BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063D760BD6;
	Tue, 22 Apr 2025 10:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E9A68
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE8560BD6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZItzh1bltHR for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::7;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AAF460AB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AAF460AB3
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AAF460AB3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Brs9H5GdVPxmI7SSTziRzF0pLZ8hNhDI52wFCOmeanJdf9DNzVIK4q38SpPzhaWxLedNBHzeH3AaBMEM+R021yADeZ4qeZUBhY3J5XvGBfU30wbnEct4nt7rHAwqD6f6g7C57lZ6JmXk67iomp+QrNBun9qhGhZTAheA+yy1383ZPkrHpKXgwm9qakSl4tyh/HJa32dMofFvhYe9vzY4MaN/NXKVfLCPxLnEIwSgSq15MONjM3X8Ag0pBxyhBVEZcA+zmB9+hqg/SvHwzP0qvLR3ISXsOwqI2NAry9mFjNCNIWOdNRJp6oZuYKS7m7ibUNs4lVmRkXztWvPVMs0RCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb5BskvBnN7haNyykMjpPlmin7+4HPqt1pPQMr2C1Wo=;
 b=hjN7qM8MkGv28WhhOQaxjJzN7bYWkibhZNqQj2mXbV5bYLtfwo9KmjKUEzc+D07vZSbyf6PaKgqLlGj8WzJ7E6XxLl4wv/EaNy6xTUPGXaU9USDxLOq8Rl84+3ECDoCvCzIZwE1L3y1FluLAU7HwgBJxkV9uswFAuxSPEY2UJ6XresSiC8jTYTZ5xD+PzpQ0j+mhLa2Vqt3f4Tg6ysEvO3x3aZPlKALcLUzsJCWP/LEmmYYtEniv2qC9NxPlJIIGFcbX6YmR2E5cPS9kYVk6lQ1LbfFOAVadSN2FCtTtSrE1oxKuejWc/gXTOv3EU8CtxJLAoHcqGqIxqIETPoMakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB11033.eurprd04.prod.outlook.com (2603:10a6:102:484::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 10:04:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 10:04:22 +0000
Message-ID: <6930e007-0839-49a1-bd8c-d0c4ec8ff8f3@cherry.de>
Date: Tue, 22 Apr 2025 12:04:20 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-8-e2ca9d029aeb@cherry.de>
 <20250419223201.20f794c1@windsurf>
Content-Language: en-US
In-Reply-To: <20250419223201.20f794c1@windsurf>
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB11033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f874761-a46d-46da-c1ea-08dd81850dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUtGcklYd3dQR1NsQ1dmUFE0T1ZTcldTQUpaSEpZUkgwS1N0Q09SdmhFQnBF?=
 =?utf-8?B?RUpaY1ZpRUdMUTVYY2tuR2ZlOUV5R1lyMXdMOW9UU1pXa2NRVUZHOG5FT3A2?=
 =?utf-8?B?K0JycE9YeE9sNng2eWJEQmtjUTZXVTVvWEZTSVhJczhxQUtCVVcvNHowMG1G?=
 =?utf-8?B?L0VYSElrelA5SHVsV1I3cnVtSEwrb3NKa1l0ck0za29rOHpQZDRYVEsxcVZJ?=
 =?utf-8?B?cGswSCtVYWJFMXd1dTRaVW9QK0c2WlFPVG9PbXBvNTFRNTdlQW5qUkJMZTBo?=
 =?utf-8?B?WlBWRnYreUdKYmoxN3ZZczYwV1dMM0lkMU9KMkZ4T1lqSitTWGhSNkhZUUFx?=
 =?utf-8?B?RmNTdHArMEtFUUpaaFJVQXdCbTRrRmlpWXF3L0ZLSlBrcWFDN2IwYzZ6cmlo?=
 =?utf-8?B?SUcxeGU2ZEdnRFNKTmFpQmZ4RlBQRW9OQ1dHUGhOMisyVWhaS3N6d3hkWDQw?=
 =?utf-8?B?bmd5Z1VZOFRRL2tkbUpZZWgzZC9SbElBYlRNOUY2TWpHSnBvS096aEdHSit4?=
 =?utf-8?B?Tzg5OEQ3RWd2dHR5Y0dDeTlqaG93SzZubVpvUXJnOEZpblNWRHczNWhGMGpt?=
 =?utf-8?B?ZEs3YjltcTdnODlpT25QTXZmMjRnK0lTZXd2TEtFczg5eFhLVHBRbSs1YS9t?=
 =?utf-8?B?YzExMHBrajNiMjUzMGZYTEhlb1VnQm9KdTEvTDBmNzI1MVVydHNjR2Z4dUEx?=
 =?utf-8?B?dkQ2YWRjQlZvd0NYNWFvdTQ4UDJyL2ZPNEpTTHRsWVJkTC83T0lrNUxvZVI5?=
 =?utf-8?B?aUhUSHlhV3YwOFRjWHUrQjh1L29uVzBBZWJHbGcxS3VTVUo1eXFxRHpyN3JS?=
 =?utf-8?B?aDlUZk1jRGU2aWdMMDF6bk1rRXFUUHk2QWtkbm5PcHVBRm1FVmZaS0lmSXZ6?=
 =?utf-8?B?N3daQ0s0OExDMjM4L1VCdUxFYmp2YlZnZldIS3RTNDM0bEMzRXk0TlVxZ1V1?=
 =?utf-8?B?eURCUGU5ZVRCemltdzR1RXcxNzhXcERSRFZoWWs2aDFVaFluNFdseXlWUkpE?=
 =?utf-8?B?cUFvc1Z4cDVPYjZVTXBNcDBBSWFOY3ZaOGpxempZTDRRaUJTM1VuMmpLTFBE?=
 =?utf-8?B?dWw0eGpzUXh6eVFYYkpxSXlNL0lIVnZubFdJQlF4VnJjN0F5V1R0QUJ2NHpP?=
 =?utf-8?B?d01DbzR2SUFmS0VtckVUNTJuQ3YwQlE3Ky81SGMwVmpiZTlWSzE1cEcyQkNn?=
 =?utf-8?B?NE5Ya3FYMFp2SmxMeDJjS2NVOFJLTkxXd1VCbTRsMG4zcDVUbExMMVEyalF3?=
 =?utf-8?B?VlZubG5ob1BSbldUa3ZLV0N5b0tZTkZOai9laVNKelVvNDRXYnNmZVBUWUph?=
 =?utf-8?B?M2MwOHNnT1o2UVArNDY5NjhZc3lFcDF5UkpIUlk4dlpIWUFLUFhNTGxXaVdQ?=
 =?utf-8?B?RENlYUlTN041NDkxdWFxYmoyOXVtT1ZrQVlTMVJGdyt2L2hXU1dFbGgwMUkx?=
 =?utf-8?B?WFI0Q09leXZtSGJvZEFoelk4a1NjQXYrT2xBQ2pGWFFIOVB4WUh2MmdrenZ2?=
 =?utf-8?B?aWpIaHpuWHQyQUN3RnQ1dU1aM3lpRXZKcWpwZStValQwZzBNU09hYWJXRVFu?=
 =?utf-8?B?Qi9aTHJOMDVUWGMvN0JwUTlSUllHL2dFZWxFWTQ0WkdVa1lERTBsQ1R3NTg3?=
 =?utf-8?B?NnZwem5QQkNKZzlGdnFUZVhxTDdWd2V1MEViRVNpT1FiU2U3YVNveU1ndVJS?=
 =?utf-8?B?TExXWEZpY2xYckxMVzNITDhYMzdqTlJKdThEVnBaNEhxaFF2Y1lVNnBiL1kx?=
 =?utf-8?B?R0VvSmxZT2RrZHM5ZlNYZDNRc01VUTJxSnRjcFdZdXU2T3JCNDVwL2lOU1hH?=
 =?utf-8?B?Vk5iMno2eVFUbE5rTFFJSnhPVmlYM2NnSTdSRkordHpJM3VUcjVWTUJjUmph?=
 =?utf-8?B?MkpzS29iVWpLQW84NkZwZWkyS3BuUU81ZTBUQisySGZZTnI5WDFkUmVGVkRR?=
 =?utf-8?Q?iyTx2rN/1nM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(41080700001); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGcwN3N1YnpEYUd3S1NrOFc3OW5hczhnZ1VkREgyRS9iRHN4Mm5yL09iOWlL?=
 =?utf-8?B?aUlUWi8veHp0NTVNTEV1T3dMN1ArYlVWOHJVR2YxdGcrRkp6QTE1alo3Mk14?=
 =?utf-8?B?K3hrVXlua0FXbUhvRTN3cFlYSkpRbEZIQThLUURsZFF6MGtQME1IRnB0Y3M2?=
 =?utf-8?B?aGIrL2ptQnN1L2pHZ1RIL2xVcGNjalZwT3M3ZUY1Z3F1MHJ5OEZGOFRUaVpC?=
 =?utf-8?B?TlNZMjRrc0l2cEN0dElHbVQ1M2lZVUg4NDRZMzMzRU1MakxKMmFrazlyR3Vr?=
 =?utf-8?B?Q2pxdFlMeVk0VzVsNW5rZDZ0RFJSWnJxekVML3JXZUk1dVJPS1AwNmxOYmd3?=
 =?utf-8?B?VEdkNmo0SUdsem1Bd3lTWDg5RGhrU2FxSVhWbGZDdndobGNSSVVQSVRIOVBB?=
 =?utf-8?B?ZlpFYlVPUEY2YmdQS2NZcmFycitEK1pkdi9CRWhxa3pJa1pBY3hkdEdlV1Jx?=
 =?utf-8?B?Wk9TUmZuZmxpcUZnNnBlYjNPbS85ZEd0TDNFTmRVM2xQMzVOR2dpWktmMWNX?=
 =?utf-8?B?b3RDUENJZzZhM0N3dk01VHdYczZ6MHNCbUNFR2tFQTNEYk9NSUsxUDF5bWUz?=
 =?utf-8?B?U21mWDJkRkk5WTBLMG9YckRpdjhnb1lCZkJqZzFGWlAzR0hXMHEzN2ZONGps?=
 =?utf-8?B?QTYrUHA1dUhFWGpNMHZBSGRZY0dKZzgrU1A3SCtidGNZRmx6NDJ0Q0NIRWFL?=
 =?utf-8?B?WEp0ZkJwYVg1cEdzbDhzNlRMZklablB0VDJvenY3UGR1R3psR0svNkZzR3Zt?=
 =?utf-8?B?cFJDamJvdWVEU3ZxcGJTNU9IakdZTXoybmF1WE9nWXhzR1BYalpmUDhFYkFS?=
 =?utf-8?B?RzQ5TE5LeHFPSTZLNVBVREhWWmtlVFlpb3dsV0l2ZWU4SkRpbEhFTXNuS2JT?=
 =?utf-8?B?T0dNWVlBdTJpNGJNQ0lyOHRLRFNnUHFUOGw3VndRemxxUzFFVDJpRUtLOElu?=
 =?utf-8?B?VG01WEQ1bVE2NVYvbWV0UURCSFBFZnNlVytrWjUrSUVGWkszVEY3bW9wN2pw?=
 =?utf-8?B?aU5tYzVKREl0Mi9aeXdTVWhncEptNG5YdldrS1hUQzVnMHJLNUtSNVV6Q1Vk?=
 =?utf-8?B?eG12WVBHUHpkTEVweVkzYnh3WCtyVndhdTNGa1N1WitWL0xJZVNtUy9EUWtt?=
 =?utf-8?B?enY4VEtueUQvY0JNRmE4SVBCTUttVDNiZkxzb3J2UmphUTBSSHpZVzdjejNp?=
 =?utf-8?B?SG9WQStKTVVFY3hHamhCYWtndFgvNjU5QjdMNFpadWtyazhNRWJVOEV0Y0ZJ?=
 =?utf-8?B?YUhIY2FnZTZ2MFh3VjdEQldOdFNaUFNCUDhwVEZLTGt6M2VBQS9DVEZnMUIy?=
 =?utf-8?B?QjFrcWplSG1Ceks0MExNK0xBYk03VVM3bHo1OSt5VW4vdVNrYnVBeVdrVkIz?=
 =?utf-8?B?bjVZRXNuV0t4TktCTlNncVNBK0YvcnlIZGpRSDV5akRqY3phZkE0RUNrdXd1?=
 =?utf-8?B?OC9yMWV4eXoxbGw0TUY2L3FKR20wTWtIOSthSEFzdFljclRJSnNOTVJrRFFV?=
 =?utf-8?B?OW5JYXU5U2p3NjdyaXZxMkdHaHZBcmxCeGFOSUtLZUlmV2YvZmt1dVNKUmRt?=
 =?utf-8?B?MXhORjNYMzJld3IwQUZIaG1FaEFxYXR1YkZTSlJ0RVRHdk9oVitHT3doNTQ5?=
 =?utf-8?B?b1BQck5KdGxFNVYwUXJPbHM5b01WcUcxZGo4RGJYMzQ3d3VacDRIMFNrMHRy?=
 =?utf-8?B?OHNqbUdDdkZXdXBjTVFSdm0zaGkzdUZlTVZmdWhIZ2wzZE11NVJMeFZtOGF6?=
 =?utf-8?B?R090RzVkNk9zQkJMWHZvaU8wUHBOU3R0TWp3eTREME5ZQ2s5UDVwWXRDQkxU?=
 =?utf-8?B?bSt4a0Q1b1FnV2NieVVpV3JFSjMrbWowY3hxRzNPZGVmaWFCV1JZcVRpY0Rw?=
 =?utf-8?B?cGdKdVJuNlNGUWZEaWRoY0VuUTFNTXZuLzd4UUw5TlRoWTY2bm13cEJMcGhq?=
 =?utf-8?B?c0pUN01HSG1xNEdtcFNlVHN3Zk85YUZyS29vc09qWnBDdndDTENKdkRyRG9t?=
 =?utf-8?B?cktkTzc4QWx5QnZTakpLSWJGUDRuVUoxU001eUJyOTdpL1ZLdzBQWTI3djRw?=
 =?utf-8?B?cUw4ZFkySUhaVmdCNDA5WVNuMldNcy9rSitZcHFxaGtBakNDSnhlbEkxRHFP?=
 =?utf-8?B?VXp2REM2eEVNWEJIbTlzZlh6aFc0M0dTQTRyZDZ6Y0NLc0J5Wm9WTm1Hdmh0?=
 =?utf-8?B?THpYUjlPQXlGM0ZSdTZmNlZRTU4zRUdJRGVLUG85aFhLc05obFM5UzRYemI5?=
 =?utf-8?B?L2E3VUdmWTkzUVRVSXJmaTI1TkRRPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f874761-a46d-46da-c1ea-08dd81850dfa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:04:22.3020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmhVPxsyAFKyh5fpTKnJXdOAcHbLwVhXV2gr09ExmRyGGjBBqIgxHXPBBSspUcKPZZeuhbhzoD12ITHIeWO5bLiLG5nKCztSmbfPvbW+61k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11033
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kb5BskvBnN7haNyykMjpPlmin7+4HPqt1pPQMr2C1Wo=;
 b=l9QGWXb0Ex4oalo/rcmH1fjarJitBxSkDXfd4jR9/j2JSljZjijcgpyCbdeT8EAEWw/LSDXkULhvPEV+I/tX45FlXBEHjgzmWSbP0RE+pXENQbtQCrPPPHrEYaRULm+kJCpRiQGonmG5lnGfDGBUrrJ+1RWPZmmXnjXpxR1ufp0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=l9QGWXb0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 8/9] package/libpisp: add new package
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 4/19/25 10:32 PM, Thomas Petazzoni wrote:
> Hello Quentin,
> 
> Thanks for this new package! I have a number of comments/requests.
> 
> First, very minor, the commit title should be "package/libpisp: new
> package", not "add new package".
> 
> On Fri, 04 Apr 2025 18:47:39 +0200
> Quentin Schulz <foss+buildroot@0leil.net> wrote:
> 
>>   package/Config.in            |  1 +
>>   package/libpisp/Config.in    | 22 ++++++++++++++++++++++
>>   package/libpisp/libpisp.hash | 11 +++++++++++
>>   package/libpisp/libpisp.mk   | 33 +++++++++++++++++++++++++++++++++
>>   4 files changed, 67 insertions(+)
> 
> Could you add an entry in the DEVELOPERS file for this new package?
> 

I am not planning on maintaining this package as I do not own an RPi 5 
and am not planning on getting one :) I just saw there was a new 
pipeline in libcamera and wanted to add support for it, as part of the 
upgrade.

I understand this could be a blocker for getting this merged, if that is 
the case, then anyone feel free to take over this patch and send a v2 
with yourself in DEVELOPERS :)

> 
>> diff --git a/package/libpisp/Config.in b/package/libpisp/Config.in
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8586c31f42914a219538e04fe93b62de38e0daab
>> --- /dev/null
>> +++ b/package/libpisp/Config.in
>> @@ -0,0 +1,22 @@
>> +config BR2_PACKAGE_LIBPISP
>> +	bool "libpisp"
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_PACKAGE_JSON_FOR_MODERN_CPP
> 
> This one should be a "select", not a depends on.
> 

Thanks, this is documented in 
https://buildroot.org/downloads/manual/manual.html#_config_files 18.2.3. 
Choosing depends on or select. and I missed it :)

>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 # V4L2_BUF_TYPE_META_OUTPUT
>> +	help
>> +	  A helper library to generate run-time configuration for the
>> +	  Raspberry Pi ISP (PiSP), consisting of the Frontend and
>> +	  Backend hardware components.
>> +
>> +	  https://github.com/raspberrypi/libpisp
>> +
>> +if BR2_PACKAGE_LIBPISP
>> +
>> +config BR2_PACKAGE_LIBPISP_LOGGING
>> +	bool "enable logging"
>> +	depends on BR2_PACKAGE_BOOST_LOG
> 
> This should be a select BR2_PACKAGE_BOOST + select
> BR2_PACKAGE_BOOST_LOG + propagate the dependencies of boost.
> 
>> +	help
>> +	  Enable logging
>> +endif
> 
> Here we need a Config.in comment like:
> 
> comment "libpisp needs a toolchain w/ C++, gcc >= 8, threads, headers >= 5.0"
> 	depends on !BR2_INSTALL_LIBSTDCPP ||
> 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 ||
> 		!BR2_TOOLCHAIN_HAS_THREADS ||
> 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> 
> 

Documented in the same place as the select vs depends on choice, which I 
had missed too.

>> new file mode 100644
>> index 0000000000000000000000000000000000000000..66a44c0d14c52bf64cecd8eea77b7c3237a815a4
>> --- /dev/null
>> +++ b/package/libpisp/libpisp.mk
>> @@ -0,0 +1,33 @@
>> +################################################################################
>> +#
>> +# libpisp
>> +#
>> +################################################################################
>> +
>> +LIBPISP_VERSION = 1.2.0
>> +# The manually generated tarball has version.gen in it which is required for
>> +# version detection outside of git repos
>> +LIBPISP_SITE = https://github.com/raspberrypi/libpisp/releases/download/v$(LIBPISP_VERSION)
>> +LIBPISP_SOURCE = libpisp-$(LIBPISP_VERSION).tar.xz
>> +LIBPISP_LICENSE = BSD-2-Clause
> 
> BSD-2-Clause, but there's the text of many other licenses? Could you
> clarify the license terms? How can it be BSD-2c if it contains GPLv2,
> GPLv2+ code?
> 

libisp README states BSD-2-Clause, c.f. 
https://github.com/raspberrypi/libpisp/blob/main/README.md#license

The LICENSE file at the root of the directory is a symlink to the 
BSD-2-Clause in LICENSES/.

https://github.com/raspberrypi/libpisp/commit/fe25ab2957f030ccfc0340dc79c388fbb4420034 
seems to be giving a hint on which files are under which license(s).

Header files in src/libpisp/{backend,frontend} are GPL-2.0-only WITH 
Linux-syscall-note. Based on the filenames (and license) these are 
headers coming from the Linux kernel. IANAL, but that should be fine?

utils/checkstyle.py is GPL-2.0-or-later but it's only run as part of a 
GitHub action, so I assume Buildroot doesn't care about that one either.

meson files, and libpisp.wrap as well as utils/version.py are all under 
CC0-1.0. libpisp.wrap doesn't seem to be used in the project, but just 
as an example on how to build libpisp from the target project using it, 
e.g. libcamera (c.f. subprojects/libpisp.wrap in the latter).

>> +LIBPISP_LICENSE_FILES = \
>> +	LICENSE \
>> +	LICENSES/BSD-2-Clause.txt \
>> +	LICENSES/CC0-1.0.txt \
>> +	LICENSES/GPL-2.0-only.txt \
>> +	LICENSES/GPL-2.0-or-later.txt \
>> +	LICENSES/Linux-syscall-note.txt \
>> +	LICENSES/MIT.txt
>> +LIBPISP_CONF_OPTS = \
>> +	-Dauto_features=disabled
>> +LIBPISP_INSTALL_STAGING = YES
>> +LIBPISP_DEPENDENCIES = \
>> +	host-pkgconf \
>> +	json-for-modern-cpp
>> +
>> +ifeq ($(BR2_PACKAGE_LIBPISP_LOGGING),y)
>> +LIBPISP_CONF_OPTS += -Dlogging=enabled
>> +LIBPISP_DEPENDENCIES += boost
>> +endif
> 
> Otherwise, looks good! Could you spin a v2? Thanks a lot!

Considering I will not be maintaining this package, do you still want a 
v2 for it? Or would you rather wait for someone to take over this patch?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
