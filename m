Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1750C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 09:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9A760D50;
	Tue, 22 Apr 2025 09:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp3FHsMSA6xL; Tue, 22 Apr 2025 09:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27F360C2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27F360C2C;
	Tue, 22 Apr 2025 09:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF8E1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 902E760D5D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87nm9OMh8a-N for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 09:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::631;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D478607CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D478607CE
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D478607CE
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnhxEA2R2A+1mGdC1FBw2YC/ZXi3ho9YgfkH+pw3fXbTiUJOGhFUikCxfS4mUZq/BvEPc/6B4OgzCQD46uno4JwuDxUMnwlLzw5+ikRRoX3aJBdY1HkI28sVXUHmu+7lbnWKp9yqjRIidtrgk2YL0reJTN6V0RkizVl+EaUjKcDImhkQDQg+WKSCXPFsoOw5h+v5Ww8dkcZUh74IyMNLqO3U0nT8R52WoDjNd3HRowV2R1AJ3jATNayGEOXuNZrflwnYoOQ6PVvUcBYouIL4WBYkAarZAT7KbGGBoP9JNHcsnHBITRVbMv+NUQPCdE6Z20/wafOpkdLIz4zrS7/kCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dulSVduDg5RV70x96jJXEfvaQyNQmGIKZRYG1v2I998=;
 b=ADJHqmzeVwo6O4k1ae44VCRYchQzmWXxgNsV/qBuwRRUjGANc5wfmz8qyvmduBgngDY5mDg5k4x5zouPOjQ6rWxbBop9x6l94BhgN+LrjYoo+MmplYOCKwwNNGMCxCBS+SLikGjsrCFIcZdPEHVyTVVeV0vTyQSQxJoZ/KSPfq3KEN56jE81EKX4N9pifa/s/RWmu0kXs4GRtJ3FxXOWLmZIw7/M8n3jchHGMi2gYb9i57JZ4BQOJ8d7iENdOKeTKsZ4Zs19Onjpyuw27dWWIQDY9r4PwEV4bIafKEgb1u//75gCx60+/kZ8/9dJ3cFkGaNM4B8YA3O1InMdcFuYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9676.eurprd04.prod.outlook.com (2603:10a6:10:308::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 09:07:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:07:55 +0000
Message-ID: <f9469629-d34d-452a-a3ce-dc2a47096610@cherry.de>
Date: Tue, 22 Apr 2025 11:07:51 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-4-e2ca9d029aeb@cherry.de>
 <20250419222725.2135a8c8@windsurf>
Content-Language: en-US
In-Reply-To: <20250419222725.2135a8c8@windsurf>
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 1352294d-bf39-4de6-5766-08dd817d29bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGowdjhsT3dScUs5bXIwVGVvVWhWY0tUWko4OXpoeHF0UVU4cUhsSncydXZs?=
 =?utf-8?B?Q1JuWlBPcFV6SXdyeVFHZjR2S1FnMHRXdDVFUEVjZi9uUVk4V09HbWNEUDN3?=
 =?utf-8?B?dGtndEVCMEdmSFF3dmtUTVZZWXJrK09WcEZtT0dyMWtsZzUvRVF1akpmVjZO?=
 =?utf-8?B?MyswSEt2MC9GdEpQUFpMSkRPYjZEaWU4L1BXMkNtNjBqYnZDSTF1OC80Y25Y?=
 =?utf-8?B?NFpMRmJtM21EV1RERHRrWFR0b28rWUYyWC9xMVEwVnNxbWNRQkRhTWxZMWJG?=
 =?utf-8?B?MnVscFNvakY1YUlydVpyWXRWU2kycWErYThPN0U2MHV1VmprSzV0RlRIMXNv?=
 =?utf-8?B?OVlwdGtzQVBjNVpIYlpBVy9TdCt6bWxLZFRiMVkva0VraFZJbElOVkc5UW5i?=
 =?utf-8?B?eEVRQVhsMGNJbHdUMTR6V2FYMXRFdEE1ZkZtcWhjeEZqVDYwd2ZOZkU5YmFW?=
 =?utf-8?B?bXlhWWtXMGpQSklKbHdvWEpGczU4SkUxcEtKejl5bjkrckhXK3RoZWpDdlV2?=
 =?utf-8?B?eUdEaXhqbWJ2V0w0M05keU5LWFpEZW9BUWZlQmxydXo0aTdRLyt2K1pXVlM0?=
 =?utf-8?B?MjNNQ3dPNUZONU4vVE5qVXQwL2NFNmsrQ1RxaTF5RzFBNmVVRjhMTG9haFgy?=
 =?utf-8?B?T1N2UFNYSklod0xtTEpzMjN5ak92emtKaFJPTXdmQVBhN2tYcUpiUWs1djFm?=
 =?utf-8?B?TkxCK0wxemVRbzVoSm1KSDhXYnVyN3ZyWll6T21NK1lwZWRKZ0tzdFN6TFdM?=
 =?utf-8?B?RWlBRlJRanpGQzdBNFFweHpFbklRQXQ3V3BPb1FPVmMzSGRvbXRWRENDUXRi?=
 =?utf-8?B?bzQ4RUFORkJYeWJIN29nVlRiUXdhMHJXZ0l1aE1VOHdjMmJQWlYzdWY3bFJp?=
 =?utf-8?B?bnRzRVdYdjJkUU1DbEdGeFVpZWpza2xxNmswVUI2dlI0eVlHZFRMZ3czRnNT?=
 =?utf-8?B?ZmNmVzd3ci9qUkRGNi85bEovcG9WM0E5RUlVQVBrV0UrRUloVDlTbE80V2tN?=
 =?utf-8?B?clppL25UVms1Vzk1TGF2eDh2UFpnbUhmQWhBbllGQkRPZnFZei9qb3V5VCtw?=
 =?utf-8?B?ODlGalRDMU9aU09TSFlsOTNOYktkZHpndWVwRXNBUDlzMUg1NVMycG5rbU1x?=
 =?utf-8?B?OEJjcC9Qd1JRbmVkZDJCaUNhQ0dELzJiR05VMnVQYTkvRnRIUzJUUnJ4QnlD?=
 =?utf-8?B?cWZ1eDRQbUVNeFdMdHhEckV5QjFnRldadUpmL20wVzh4MG9UNDhkcWN6YkhP?=
 =?utf-8?B?SXlJNW1mcTRDNUkwL0xEQ3Zyc2dpZXl6blVRN1NWY3psdCtsRG1zcWxqb25X?=
 =?utf-8?B?Nk5EWWxaSGdVS0VFY2pzT1JMK3VaRmZOT3JxQVl2WEpEeGlmc1o1OUlINXVB?=
 =?utf-8?B?YVhBYnVYVkJtTDFZcGdERzlWait5cG9VZGFWaXJWVkU5cEtDcjg0em1tTE5B?=
 =?utf-8?B?bm5zZEIwaWFrUnU0OUlMTG1KZWJ5YlpBSk1TNE94aTEvRjlXK1diK2tPT1RK?=
 =?utf-8?B?SnJkaHAyV0ppRllLSlJvcnErZGo0T3g2ZklEWGlJOUx2a2VUUG1YcENZa1pW?=
 =?utf-8?B?d3RHaE54OTg0YUp1YVE0cVRoL1RVcFRSd29mTm1DUmFJamZUWHFtWmJ6cFd6?=
 =?utf-8?B?Qit0dWF6ZzVsZFNBM0RpMWF3bVJUSnpZRmRGNlBQU0JKekNCWWN6elc5QWVZ?=
 =?utf-8?B?cFNtb3J3T2pJSkdONittS1YwNUxQT2Vac2YxTDMveTNKY21ZZkc2QVhsUDlu?=
 =?utf-8?B?SkZJcUl2ZjVrN2x1VkkrRklnVmViaEczZzZGR0Y0M25iNzF2ZW84cGIvN3pz?=
 =?utf-8?B?OTRubVBXb2tVMVpPNjhaNXErbFcvUFIyNnY3a0hGUkdyVC9kOWxkbEJGbTJX?=
 =?utf-8?B?L1ovSWZaK0NsNnZxWUJ3cnpnRjVuS3BKT0xSMlRZTXZFaE1NdHBjTWhEakhj?=
 =?utf-8?Q?8ECcZBTUNSc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(41080700001); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdnWW9iT1dwNmZhNk5sTGpIUllJTnBqaHhvTStUanlXL0dZYmlhWnNoSG14?=
 =?utf-8?B?Mm5wb3NNYzFMKzRXMUFTckVZOCtkL09XQlpRUjMwZjBPUUhRMEI2WUtsRWhs?=
 =?utf-8?B?S0ZBVTB4NHFleWs1MTRQeHFHNkFIZ0VKejdHTlIvbDRwczFUNTFtK0RxRDd3?=
 =?utf-8?B?WVFpK3pjUnJ1RFJiUVBGcGsxaWc2WTd1cTRiNzVGRmtLTWtVeXhEOWlrcVJY?=
 =?utf-8?B?TlBFOGVLZFM5Vm8rTjNNVHJuOTQ5WHhPS0VidTRiWnU4aGhJaE1way9POEkw?=
 =?utf-8?B?OEV1dU9oajJ0amUyNC9RSWEzakE1dUdrVmhLYkY5MUN6dlQ0azY3SGJkeWcz?=
 =?utf-8?B?Z25WeW1heWxvWTVLRnh6VVRIOFpMbGZLcFhOaHd5TzJhbW5xdE1pVXozWk9q?=
 =?utf-8?B?RFE3VjlBeVZ3Z0l0UGJTak9yYW1mbW1pT09sT1F6NHlCY3hpMFUvTU5xbzlX?=
 =?utf-8?B?NVh0WURQQm9qUGVVRHgzWkhoUm9oYnF1d3dKdk5FMWw4VzRZSVd4MTI2ZFU2?=
 =?utf-8?B?UEJhZHB3ZjZ6WkNxTmRKUE56MHhKUzFTSWhNVUNqWGRLdGlsL0hSem5wQTA4?=
 =?utf-8?B?QURoRU9USmdISklob2IyQ1l0TzRzcjZhNjFFek16c0xQZ2xuK3MxRWdwSTYw?=
 =?utf-8?B?RndvaFBNcFdib0ZwSDRrTXlOVDFSS0puZGRBZFBPd3oyb29qMXhHdUt5UFNF?=
 =?utf-8?B?V3NiUml1THB1d216TVpka3dsZ3VqblJkZm9pVE9TZHFVM05zeHpJWU45TzRE?=
 =?utf-8?B?OTNWbTk2RDFEL0N1YlRaTEdPZG04dkUzdGQ5bHl2UktxR3R2UncwQ09oTThZ?=
 =?utf-8?B?cERUdGFJT1h5TjRrWTQ0VUlBQ0hqdElWZFF2UHJLUk9aV1VnT1V4Zk5lOWVN?=
 =?utf-8?B?VXUzOHJBMlhWVWhPZWlDUEFkb2dEZFMxNlk4d3BmRUs0RzVIdjg5R1hmNzAr?=
 =?utf-8?B?a1FaTlY2aHlSUWNFL0RXcUhwNFBFc0syenhaZ2kyWmxyR2hVVlRrZnBTdXV0?=
 =?utf-8?B?MVpoZmZKYTNiSVQ3bkxWTzdsSWtTT25CM3o3SmUzZTN5ZXhybkVsZUJHdDdC?=
 =?utf-8?B?MXVtZ01XcnpOcHV2RmRFbmlZc25RL2Z2Q2VtK05rb2ptOTJoSU14aExaMHFl?=
 =?utf-8?B?K01rcUw0Q05JQnhlVDJ6bXlLb29FY1NqT0wvTHdtak5ONTBxaklpYTVSMnF2?=
 =?utf-8?B?bXowWDA1QmU4end4NFRzRUlGL0VERXQxRHB3WlNwd2Z6dkZyY21WZng1STF2?=
 =?utf-8?B?TktTb1VXSWNrcUFHY2hqeFFRMlJWYko4WnIrUWF6c1RLclBlaFAyR3cydXpR?=
 =?utf-8?B?dWxFK1FXb29MWDltTVUxS256cWw4bC85VjNPeXYzU0tKS2xrQ0k3dDR3WUtj?=
 =?utf-8?B?dG11NDRSczM3OVBRanBZcFRJYUxCWmhxZklYY3F3VDJlWjFId3R3QnpSTVZz?=
 =?utf-8?B?UlNRVmtLK3E4TUhEZ3JTZ2RIcE5ocytvMjF1cDdhamw2M2Zya1lPd29va1Jt?=
 =?utf-8?B?ZTMvVGVYL091ZjJxdXNIYVBzZ0dnSmdhMkg3Nkp0RExadmhKNVhCQVo5QlMr?=
 =?utf-8?B?clorVk5VamJScU9KajJ4YlByUDJKOHl1VURvcnNaaWlRZUdsTzgyUFRHSkl1?=
 =?utf-8?B?eXpUbU1PcTlsY1g4WVBxdXN3RlprVEVWQWRoSlROVlFkbGQwMHNmMmFXM3hy?=
 =?utf-8?B?L2pUaXE3WXNBbzFaRjlMbVBFMGZyOXdDU3JGaFk5Zk9udEcra21TU0VrR3Vm?=
 =?utf-8?B?eWw5S1Y4NmdtNlVJMGdtUElwaFdXL0tvd3Rib0tSUEJuSTliQWFKOVRRM0dO?=
 =?utf-8?B?bUp3MjMwWmVHZlg0L2s4bXZoa3dJRmUzNERRVnZFeVJVcGc2QXZyVmQ4ME5j?=
 =?utf-8?B?bTYzdWh5NVFzTG90Yk9PRyt4MG1WVUwxWmNVRFFFOTN6Vm5Jd3k0VkExdUYy?=
 =?utf-8?B?Z1ZXVXh5OWpEa1pJSGJ1OTVPZFprMk9tNll4M3BVeFVycXZENnBYM21jSnlp?=
 =?utf-8?B?Nm9WaEp5ME9MR01WaDFkazlNOERlczVuUVliZjQwanY1Ny9MMDZCRjY1c1A5?=
 =?utf-8?B?MmtTQlhBWWlqWDduM2xQcEVBa1AvekdraWswQlp1NWpwOWlUalU3R056S0kv?=
 =?utf-8?B?b01HTXZMRm9yVGhNd3RtMjMzOFFkaVVrY2laNmV5TGpQNUs0MXQyTnY5Nkh3?=
 =?utf-8?B?RzZvZ2I1NmJ4M0lpSWNiV20zVFlkbGd3MFQzenVCYmdrSzBzTVBMM0paeDV0?=
 =?utf-8?B?RGVRYjFqc29mN2NCZkF5ZG83OWVRPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1352294d-bf39-4de6-5766-08dd817d29bb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:07:55.0601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBjzy9r+/ikbMVeTbVXgx3zmK2lxsJS3cOHJmUhpXOR68z3DlJb0RKqlYFOC69OfpALbkgdgG6e/PoqWNfxNNR377XC232gbrYbrnCPyDW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9676
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dulSVduDg5RV70x96jJXEfvaQyNQmGIKZRYG1v2I998=;
 b=NF5WTLhDsCLgRyHBph16xvxnh+xlNocDQa6MEn+NI8c3wMMaxtxC+fybtSgFSN50QHW8dekld51BbmIQ8sFLjCG6PqlGkZe8e0xQPLFVeTDq5abe3bFE5gmzfd6PDt1F/y2czRy44AWyzytT58i6HxljqDCEwBMU2IFG1xHdghc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=NF5WTLhD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 4/9] package/libcamera: improve future
 reproducibility by forcing auto features to disabled
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

On 4/19/25 10:27 PM, Thomas Petazzoni wrote:
> On Fri, 04 Apr 2025 18:47:35 +0200
> Quentin Schulz <foss+buildroot@0leil.net> wrote:
> 
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> meson allows to force all features set to "auto" to default to disabled
>> except if explicitly enabled via the auto_features argument, c.f.
>> https://mesonbuild.com/Build-options.html#features
> 
> Nice stuff! Should we use this for all meson-based packages? Should we
> even put it directly in the meson-package generic code?
> 

FWIW, Yocto is thinking about having auto_features=enabled by default, 
in the meson-package generic code (meson.bbclass). This would be fine 
for them because they have per-package sysroot so build order or 
mistakes in the package recipe wouldn't impact reproducibility.

Since Buildroot isn't necessarily building with per-package sysroot 
(support still experimental, and for sure just an option, as far as I 
remember), then we should probably disable by default. The issue is that 
you won't get new features enabled by default when upgrading packages. 
If the feature doesn't have dependencies, then it's a missed opportunity 
on enabling it without requiring additional changes in the package mk 
file. But, it would help with reproducibility so I think it would be a 
good idea in any case? I think the downsides outweighs the benefits in 
Buildroot?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
