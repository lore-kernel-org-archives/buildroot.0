Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6BECFD36C
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 05:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E50080B8F;
	Tue, 25 Nov 2025 05:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0aULiptjQx1; Tue, 25 Nov 2025 05:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8463A80B67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8463A80B67;
	Tue, 25 Nov 2025 05:19:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2584A359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 05:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ECFB80B00
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 05:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hRbLRGA4xr5 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 05:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08A8B80ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A8B80ACC
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08A8B80ACC
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 05:19:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QljIPr2lJvFef+LU9Y6PnzWZW5IsoYOdFr8MAGznoYCZjz7EjpIyDuWH9093mlnvj7SvfDDcPDcwqw7chIj2WYSEZG1rgV+S5R0ITzmDLdD34KQL1O7P594ebzIIXLcIp8ZALG8m75Z/qX2S47VyYgA8Bq4JxmHoydn+mvZ6U8c/nLJcRG9ImuYEaMwFMG95jyY+k7M2tqwFVhLaW5sxqbLaiiQhtQzpTNPeoV/6iQIgqpGzL8lTSq8XkuZi961poXEqHu/cdtToy02x/ERIwI658lnhH0mEsKmUZQmbCrOSo73rhKrl3GCbi7cLFDpcWtcKB1WKHqx8qQorpdJwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2q4HxhrqwgD+w6GH3/J27z0e4kO/84hBzOtU9N+RKk=;
 b=ySVbhjafHprvoz6/YIJuXfsXw759yjNtGeqo3agG71Z0xVYlTA342KsvMD7gOFjm8xVuT8A23gg38C39VZkgnm+iR5lS7l6CcoX977bQAqPd3sq0r58Ee8DEb9Xdg7WKOp2xYv9UuFx0ED1VY7gCMeXqNX5ALuswas27Wwipe2Kc10CwXPvnbiztB9ZzDMbVoOh9yhNRM9T6FushSfAXu+NWhVHzqty1S6pN+hKd+zZ0vyv7m2RZKV9u78bI5g6R0zYR2cKOgo/+3fs8eT0msSyE4aJGUNZgloOmQ5bYj6ygSZAa8GLnSDW+26dfhWL72qsi7aQDBtGQBtYPhviWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 05:19:26 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.9343.011; Tue, 25 Nov 2025
 05:19:26 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] boot/xilinx-prebuilt: add support for kria-common
Thread-Index: AQHcU7/gYOcDN50DW0CmFE35M1DS1bTvPvwAgADcRFCAEtLksA==
Date: Tue, 25 Nov 2025 05:19:26 +0000
Message-ID: <SA1PR12MB56159C3EDCE748D0A2DDBB2BF0D1A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20251112103353.2021040-1-neal.frager@amd.com>
 <DE6V6QTL9BNK.1MWWL0RKSB8BU@bootlin.com>
 <SA1PR12MB56156FD41429B65E64D6E1A7F0CDA@SA1PR12MB5615.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB56156FD41429B65E64D6E1A7F0CDA@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-13T05:50:11.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB7925:EE_
x-ms-office365-filtering-correlation-id: ffe20ca7-5e73-4c5a-f058-08de2be233b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?UklBNWV1Wmx0amovcENMZlo3elZ4aURhZzBmSVZ6WWRsRzJPZHUwREY2cE1a?=
 =?utf-8?B?RlNkdjd5Nlc0aEYrS2J0TWRJOUx2cU5lR2dRZTdHeE9iTjExaWFON0NmbHVK?=
 =?utf-8?B?NjhLQ3dCTUk1YUV4bWJodkRVYzREVDhkNzZxUlBZbkhiSFQzWGhNb1VObUhm?=
 =?utf-8?B?a2lXTkhGUHI3RURFRFp5MXNhMjE5akRZajc0L1RQU1pRQndyZ1YvWkF2Rkov?=
 =?utf-8?B?UGM4anBGdkJneWZNTHJHQ2R0Qlc2LzBoZk1NY1B2L0N2WE1HZ1ovWlkyK2ZV?=
 =?utf-8?B?aXhIWk83eGZsQjkrVDlDazJEWklJWGd6SVZOZ1QvRU15eWY4QjB3bGlSYkxv?=
 =?utf-8?B?S3Z2U3JaNGlGQTg3TWQzUm1qRksyWlpxU05PT1BPdWd1VDNESG93V1NyVFZa?=
 =?utf-8?B?WmxsZ1IrZ1JyUUIrc0JrYVd0blF0cjdKb2d3d3crWVhJa1BNSHo1aHJuTWJx?=
 =?utf-8?B?ZVlKeG1DZnZuZVlrTzBzWHJMZ0sxaFNEVW9XQTlDWGphK2Nhc24xMy9MSnZQ?=
 =?utf-8?B?N2Q0TW81bWcyVzl1ZlNyYmhsbkkwMFJOMkxNRWNGZDAxRzN5R3pTaTk0RDY5?=
 =?utf-8?B?MW9EeHR2TTNvdldMOGZVR1hSSXN3TzVxTWlLSThDU3BuU3drWjdqZ3ljdE8x?=
 =?utf-8?B?ZzBmNllkWHh5OFI0UmEvdFZWRWNqYlJ2dXV3Q1ZjeFpRYnZWYjBoZkkyTHE0?=
 =?utf-8?B?Wi9FODVzeWFBUEtjNjZjdWdFa2JpNnMyK2trSmxGMUNmbis1WG9NUlpOTThJ?=
 =?utf-8?B?MTlrMDJFcDJOWmg2Mm5HaEIyL1VoSWpWV0dpZW80VDY2UmZ2enFQMEhibnI3?=
 =?utf-8?B?ak5HcjR0cTRETnRaUVNLS2UxYkhqTFpuSEJtOUNjcGx4MGFKb1BFTW9oZnZD?=
 =?utf-8?B?dnBnT2dnSTlCTy9KT0RHQ28rMC9XRWRRdkRRV3QyS2JQZ1gwTDltVExzczZ4?=
 =?utf-8?B?OVVFVUdOTkh6MXdYZUZvdStTNzZFTlZSNTNyL04xcjE5cWZERlU2RGIrZUNU?=
 =?utf-8?B?UHZ5UmZmN2ZXaEdqcWFMc0pHQ3Yxa0xMb0tGWTEwQmkyblZYbEpFUk8rWW5R?=
 =?utf-8?B?Z3VrVS81dlZLN2xNaTBjZWRRNkVHbTZkWWlWbjFmakgrNHd2UFJkQzBWNzRj?=
 =?utf-8?B?UVcwcnNQWUd2ZjdmVlFiS1NYWStNS2hPbk1qV2JjUU1qNDFtbTNSV1BZcC95?=
 =?utf-8?B?eUZlb1pwUGdXSWt5blNaaGZtTjQrZDFzUnVySjBUM291blFqMTlLWmZFYVAw?=
 =?utf-8?B?azlHazAxemdubXhaUTBLdzlMWlNvTEVxTmZ0YXk1K1NKejRIRHFSdDcwR2F6?=
 =?utf-8?B?bWF1M21vUTFLelMreFJMOGdqcXF5UWRxM1VDR2dNYzlzRy9UUEpKMTdYWm93?=
 =?utf-8?B?WVh3TmNqazJ0Vmw4d0h4SklKRG9KRHcrZGxkQWZ2RTFtSy9SaHFad0FOZmUy?=
 =?utf-8?B?Q0oxSi90Q01NRTN1QVllaDhtTi9OTmFzOUY5UmJ0bm1DY0JnTCsrU1VYSWFV?=
 =?utf-8?B?U0JGRkdZUi80bXNVQUZ5Wk1OMkRKVldYZUZxa0w1OFNqb25SZVl2ZDV0OHEw?=
 =?utf-8?B?NDFuV2hBMjdwZXJKOU96aHNEdW14NE9iRnhhZzRXdDhHb3ZNRExDYit4ZFNs?=
 =?utf-8?B?ZU14cGFhd0RucEl1a1Vld1lEdk55UU5xTU9ybEFEZ0FOS3Z0M0hkNzl4d3F4?=
 =?utf-8?B?NlNqcGI2WXZoSkJPQ2xkMlE1NjNMbG5NL0luMS84TlFhVk5VL3RlMDhhTnFk?=
 =?utf-8?B?L2NBL1VOOGRmK3hYMDRhZ251aWlYczVwSTBaY0dEQnRmSXFPZmlkNnFyMjl0?=
 =?utf-8?B?MTdKSnNVNFd1d2x2aXorYThMM0NFWmJ5NjlqUk10MCtCNitpNzJZWEw3R3FB?=
 =?utf-8?B?bmJ5NlNhYXFIWDQzNWJZSXRseFpzTXd5b3ZwQzE0QVVSVExsNExra0dWdVFn?=
 =?utf-8?B?TCt3Rm9vOGFYSkwvcDBNZkxJSFlhdnFKR3RsMmVTd0FUSFFsR1BwdVEvaXlp?=
 =?utf-8?B?bnFYRSt1UkRNbmM2VUd3Qi94L09STHd2RjFqWFI1RXorWmJDNlFzNzVSSmhh?=
 =?utf-8?B?ekQ2dXhyempXUlNMUis3UllCUTFkZWt0RjFlOS9tUjYreUF4MDY0bWlvSkx4?=
 =?utf-8?Q?4wHk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUl1d2xBK3ZLRmJrcFQvdkFqZTRISFQ5YjhOSFhpejFvd2RsckFBWHprR1Bx?=
 =?utf-8?B?aVRDVHRncjl4eXl1dFpYRFNNb2ppaFFBRW40SHhrVXZnd3lwSmY4ZC93bjNa?=
 =?utf-8?B?aGpucFZyNnFnSUJHTm5BQ0R4bU9Hak1BMXpWejliUzBuWHk5MzBsbHdyVGdX?=
 =?utf-8?B?dUhwT1N2S1ZueTJhUCtIU0dxS3FPeCtJVjV4VmEra2RadmdtT0pOOUM3eUhj?=
 =?utf-8?B?ZDB0eVVQcjRBVUV0S2lCa1BTTGJVbnpNSnFsN3lkUk1IZHgwUVdrUlI4Nk13?=
 =?utf-8?B?ZEk1T2tHVUhCOUpRVHJHNm9XWW5uVHpSVTZhcEI1elpTQjB2bi9mc09iZDA5?=
 =?utf-8?B?SFlZd3hnbEgyRFJtbXF1QUVWTzFHL1hnV2F2OHFyQlZkbUMvempXemNISGsx?=
 =?utf-8?B?RzdJcy9RTUtoVjcrQXJ0OU5RdHluS1A4NG41V1hhY1hnay83N1ROM0sxYUlt?=
 =?utf-8?B?NC9VUEJuZlNWWkw1MllkZjRsckpDWStmVFl2QkZBUjBBazhNYWNUd0d0VzhB?=
 =?utf-8?B?N3cvaWhLKyt3UjF2M1ZEV1NlUHZBYVBrTW1sQ2E2VHlWd1lMZm14VDlDZXFQ?=
 =?utf-8?B?WHdTQ2dNQmRvSEFFTmJuZUVpQmhwa3B0K08zVTdOL0dCOFlpTnpMV2RKbjNs?=
 =?utf-8?B?MXdHenlFNGV4eUE0RnE4M1phZjdSSnNxSExOWUV6QXZ4UER0a0taaUdESEEv?=
 =?utf-8?B?QnpIVm80bmVKcTYzdjJBTWphaTh6eGpMVjR0ZTBOL0p2NmZNZ2tXVnEwdG1E?=
 =?utf-8?B?QndDZWpzeXpxT1NoZDRNMUlTQTkxY0g4U3lnaWdXUDA0QTdGY0RWbmdmTFhR?=
 =?utf-8?B?WXFuSVBPeURnNDdsc2phUGhyQzhBaXlPdHN2WE5jbzMwL0Voc1hqV1kvekI0?=
 =?utf-8?B?MWpKNnRTT1FKcEVkbEFVWU5sWk0wVkEzU1dJdmxTMWpDcmF4dXRzamprWDZP?=
 =?utf-8?B?VDFqYlZ6M29VSmxvbHlqSEFFV3FNci9BQkRWVHJIQTJtV0l5bTRXWWVXTVlH?=
 =?utf-8?B?T3MxcFIvMGJBWDBWMEIySFQzMlVBZ2libk94b2tsdWF1L2wzTDVhOUpwT05s?=
 =?utf-8?B?R0dCcjI3a283Zkkrd1lCUWVOUGdxNytxdTZ0Wkk2bmtIc3lGVWtXR2VwSEVh?=
 =?utf-8?B?RVZNRk9MeTJZYldsU3pjdThIcFJYKzRWZGFQRndCazJjejB4aS8xKzZWcDJv?=
 =?utf-8?B?RDJlbUpIblVqMjZnVTVjNnUraWYyUmhiMDZVc2FSUFJhVnEydFBaVE9FRTl6?=
 =?utf-8?B?dXE4SHdqLzY4WlpXMCs3aCtWczI1ZHhHYU0wOHI2ZUZHQ0NuMFFOcEFLdWlS?=
 =?utf-8?B?dVlXdGdnQjhpeFk4dDQ0Vys5ZWhpM2FCUndKOTRUdlBKYXEzSnpmaVBvUDVR?=
 =?utf-8?B?cjVtWGhvaUdnVUUzZlBZVlJnL0s1Y3VtKzlMSEhDaEs1UmtpcmRHd2lRdWht?=
 =?utf-8?B?R0kxaVMxV2xEZVRtOEdFWk1HVmxXT2VaemFpK3lWVmVVL21CQmFXcGlVM1dz?=
 =?utf-8?B?LzR2MzBvTFAwZU5vME5tR09KQ2JEUTRtelc0UEdhM2p3VmlyVEUzdEp1ZldM?=
 =?utf-8?B?b0NSZ1drbmV5a1BHMFdSOVBSV3czMFVsam5sYUlVVnpzbHl6WUxpVzFOdjRE?=
 =?utf-8?B?N1FXR3pxSklqNURLSktGQ2UyUHRHWTV2aStzRG1mZVJKMVR3OWFtSGtNQkhu?=
 =?utf-8?B?WHJ4NHJvM3NtUmdEdjlQMXJVNm1aeWlTY1prZXdncTZzeElPRlI3UmpaVk42?=
 =?utf-8?B?TjZZSzV3SnBoZktzTFI3d0pkQXJKcnNjbERkL0I3K0tXTHVWendwbWpqanlW?=
 =?utf-8?B?NURSdDZHRVdhOGhIU2pGbm01MGkveWpBdnVYNEdUaCtxTEUvSXVIdTFERWZF?=
 =?utf-8?B?THVaTGJQTG41cmQvbjJxb1JLbjVEQllKNTNUN1F6QmJJKzNqZFlndkxaUk9Q?=
 =?utf-8?B?TDFYejVaMGRqdVFicE1KN2pyK1B3dVdxVHJZR0p3S1hFMUpkUEtmQ0RkLzVj?=
 =?utf-8?B?RmdDbFZMdGVlOHlRd1Z6L244M0s2YW1XTUp0aHVNRGpJTTgzT1lKdVhCU21z?=
 =?utf-8?B?d3ZNdlpQYWErWkJjU21FandzTXErZHh4eC9mNnRua0F5ME1pTDFmMkRsZzdw?=
 =?utf-8?Q?Gn14=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe20ca7-5e73-4c5a-f058-08de2be233b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 05:19:26.3194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yq1WugWurGnyKali8Ge1mN/wyIprzWFArtjJLBSX4p2j5q8SfXkOgJ+G5nvXxE+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2q4HxhrqwgD+w6GH3/J27z0e4kO/84hBzOtU9N+RKk=;
 b=OQTb3yP1Pj28IL5/wnODXY/SEwM4MQhAd0vvAZGOWzxmx6khBCvoIKJIKBKfxbTNzUYyAzolsnwennTykeHeYLpiCXV683Ea6zKYeIN0hpItbZoeLzhjjkbhl35r7MEG0x85j/cJSb1FQfXgQGMqxV3ltYtq4dFCfcLp57IHsT0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OQTb3yP1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add support
 for kria-common
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "Sreeram,
 Manikanta" <manikanta.sreeram@amd.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

Please ignore this patch.  It will no longer be necessary.

> With the next release tag of xilinx-prebuilt version xilinx_v2025.2, the kria
> pmufw.elf images will be merged into a single directory called 'kria-common'.
>
> To keep backwards compatibility, this update checks to see if the old
> <board-name>-kria path exists, and will copy the pmufw.elf from either the old
> path or the new path accordingly.  This way, users can still use any version
> of xilinx-prebuilt, and the package will still install the correct pmufw.elf.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Is it just me, or conventions in these files are changing frequently? :-(
You are not the only one who thinks that...

> This is also not the last patch coming for this package. I already have a
> solution for adding versal2 and the vek385, but I am waiting for the
> xilinx_v2025.2 release tag before submitting, so that you and others will be
> able to test and verify.

> Anyway, the patch looks good:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> Thanks for the review as always!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
