Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E9C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 03:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCED781F29;
	Fri,  9 Aug 2024 03:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTJzZPCB-X8e; Fri,  9 Aug 2024 03:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50EAE81EAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EAE81EAC;
	Fri,  9 Aug 2024 03:52:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BD261BF2BE
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 03:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A6960ECE
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 03:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo4Y2YdOixPm for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 03:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::616;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6256F605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6256F605E1
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6256F605E1
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 03:52:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG98gAo37MjH9MDGIX0lXN2vS621cdaSWl1tVQ8d28CwD8fwov09NlKq5L0q2D/j1uBSUIrMLmLI7/2LRoHALAG3f1X+/3x/nA/CIEwEHjuk544BhVp2hjTmgV6e1Bv8UFWCkc4fld59VHePbWBvirYaCeopd0gkYXwUyYfXe8eu38DX2rP/Fg9DXxyLkxe7gTjuMZASniNnRC+e22qsVbzqUdNjuT6EK0EWYvjpD3ItigtkSMFTSJ3Nu6SpagbX92SNGGziY+9Dt8a4Bik5CSMWkBBipf9t4asQIqr3ltPGRt/z/BiA8+BF3P8IecBEwfzdTat0LhFnO6nWggB8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kgp5bLao/8wAorEGH+zyw0nUifQL0Ui6EOD5art9Hpk=;
 b=XCWa0fGxC0/vDEk545poc3qHw6O9Usfmqj19/BMtzG3qAovSP+94/fzBvVN9NvrNhS9q1EZU+PEzGB932B+NSWYrSle18sEIoS1N77gIeJUAzvSTQlPzv5QndJL1doLrT8zyqAZ6fY/HHFD5rwUn2gOZfHYAwlRqDqe0UrPhGjzHo4awEy6pGCTyw5xusfI7zBTH6+sZUl9w8VcgPaEgVk9VX13SwYklPEB8mSKfvVHEIJmuSB37bPRHqy6aIf6LCjLMCDo/3Bh4mf2cMEPlZN6ghRIKhZV4Fuko+2Uge/hSAVZKF08A+KD3u7xaP0g8P3dk7eUGAXNbpKg7urMIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 03:52:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 03:52:30 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
Thread-Index: AQHa6ZYqUwxIqu7NiUuHr4S385pXN7Idw5SAgACEs6A=
Date: Fri, 9 Aug 2024 03:52:30 +0000
Message-ID: <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
In-Reply-To: <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|LV8PR12MB9450:EE_
x-ms-office365-filtering-correlation-id: a02d1dfd-a5e0-46ba-2e33-08dcb826b142
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?d1gwbmtSQWw2cHY0UmhWNEprazJiOUkrMElyOXdGalNwRWZmOGNWV1lRdGZY?=
 =?utf-8?B?TnhsaVV5RW1PZE1jQ1RLcHNlQUswZm92b0hZWUlhVlkrdWMyd0c4cTNMWlZM?=
 =?utf-8?B?UEx1a2FhTUFadnNlSzJKOThmVnB6NXd4RXoyWXJjNW1kOGpCWUJOTzlmR0dC?=
 =?utf-8?B?bzBPcHZzaEZVYjNwQ05HSEllOHdWMTgrc0NmVG44Nm90T0E1WTJNM1ArcTFw?=
 =?utf-8?B?WlhQZFZYMXNnRnpQRjdNMFJTT1FTc01TcU1McWp4aUhrK3RORG1KbHpKa0kz?=
 =?utf-8?B?VDQveEpLVXhzdEZCSjdQMmdvNWtVN00rKzMyMEtURTZGNmh4UlZ4TTN0eHFr?=
 =?utf-8?B?RTBxTEJySEVxTDFTZHRmQ2ZHekFtZUk3TER0YWRTV01hNDZhMWdRbHMxMzdi?=
 =?utf-8?B?WFZlN25KRU80cHBCbWk1UmVtSHVOWC80YVc3Rmt4UGw1enVaSkJmN0tvdG90?=
 =?utf-8?B?WEtkY1pvTEhmMDNQaFIzVzc3QVlWOE1lSUw1MmZBRzU2bk1BMzV3V3hsczZK?=
 =?utf-8?B?a3lyOFZodXhveUg2WXI0ZUN3SGU1and0SGkzMUU2bFZyY0RTaTgvYUs1SmRu?=
 =?utf-8?B?eXltMDRwcEw2QnZuS211N0lOZ1ZORnF2cXpCZUdQK3FPT3ZiNzlRRHdwZTRa?=
 =?utf-8?B?ZG1vQ1Rtc3R4YUdTaVllOVNkdlNVOWhRUHNud1I4M0U5YUxCcjVrdkxRSVlu?=
 =?utf-8?B?bkFRZUk1M2E1VTZUVjBTaVg5ZXlIbERjUndrMmpFamJkdElvd0NRVFkra2c2?=
 =?utf-8?B?aTdma3RaYzk2aGlrN0xOaVkwbmJlRVJSWklYV0trQzZqcjJicjVuS2dVc3JG?=
 =?utf-8?B?ZGVuUi9BaEFlaEZsQXVVdUliRWlYNWN3bXNzVmFhK210WXU3L0FhdE5mQUVE?=
 =?utf-8?B?TWxQUnJXNmhBZEMyRyt3NDRFcU9HUCtmRGFQUG9FWm1NcnpBTVVmdGVjUXhK?=
 =?utf-8?B?Q0tPd3g4TjNabDNib3BRQm1vei8vVjZkTHFJeXBMaUZaZkJvODZNQ1dEQnNl?=
 =?utf-8?B?anRiN0dZMllTazFDdmJiZ3g2T2R0dVdlNEpCeWhGNzNDT2UzU1VkaVRNanJt?=
 =?utf-8?B?U2JGNWZkbFdWOS9EZktwZFlHVDlucGtsYUVLNVFiWk1wcDh5c2VRcFFkQloy?=
 =?utf-8?B?ZU1OZk9XdVpaMVJrcENwc0dZTEFmV1RvandybXo0ZkNaTkZSRmpWZlNJSXpJ?=
 =?utf-8?B?M054Q3dnSGtFdFZmVUorRmpFSUM3Wm1CUDBFRldmN0RBamxvT09hZlRWZFRx?=
 =?utf-8?B?WWQ2dWtPRHhWcUVZb1g5czNIVVJDbVpITVE0TENpZTYyZWdPQ1VYeG14NXJy?=
 =?utf-8?B?TE1iYnJiY0FXTCtrQ1BseWhoSjk0czJ6dkJuZ29STGR4TTYwWG9jK1oySElZ?=
 =?utf-8?B?bE1yMm41eWRtY1lTRS82V2NhU1JqNGtPV2V0TnlYSHA5eDFTSXBUbEFndjJR?=
 =?utf-8?B?d29HZGUzUW92bjBKVElLbXI2cDZVaTROQmR0d2tpNGp0UllCODdPeXpyUit3?=
 =?utf-8?B?QlpLUDFuWmlFSjNyNTdmN0lNcFBENXNCV2dlakFDbGt6cDlkMUY1bmlVaVA2?=
 =?utf-8?B?NzdvK3V0Wk1QeG5HWWNGZ1VxRVhrUnY4K2lUc2pnSDhiUFIxMFBYOU8rZmw0?=
 =?utf-8?B?a2d3THlTajJEN013Y1FjaGVzQzBJOHBCTUFoN2d4TXRrbEorQnJkS1Fpd3hq?=
 =?utf-8?B?RHlubEp3WEExK2xGVkFDTzQ5TTNPRVFWbFY5eFlZc0RnbXRCMlhMZWNYYVZY?=
 =?utf-8?B?czB2Sk5ZOElJQmNjb1NmbGZodGovV2ZmaGJCVWRoWXNtdWw5dTAzS1QvMXNl?=
 =?utf-8?B?RG1tKzRxTWVHQkJhRXh3RHlZRHB6RnQzM0FuWFpSWkdjZit0ZTRtbGY3SS82?=
 =?utf-8?B?MjBGVDZ0clJSS3lUQmM1WEZ2c01aR3BWeEtJYmEyN2thUEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0RGUDROMXRyMWZzZ0U4eVVENVIzNXJWdk5ZbkwrUFBYMzIrOTZRRUVRTzY5?=
 =?utf-8?B?Qk1VVGRFRE15d3JPdzhPNmpaMXFORDE2NzlpbG43UllJMzlxbUw3UDhPYmhj?=
 =?utf-8?B?VW1CUXVodmRrdnFvTCtlSFQ3Sy9Bb0lxUC9rN1ZhZmdpSHl4eDQzaWtwZjJO?=
 =?utf-8?B?eHVyRU5lS3JWSnlaM1BCWXdJZFJRTlQraDBMNGFvK0FLVVVsQ3BiZHp3OTN3?=
 =?utf-8?B?cmYySm1wMG9qdHlUaUlVbzFVcjRTRzAyeGE4bnMyVndsL2FWTGJQQkJVTmdv?=
 =?utf-8?B?R3NLVU80NGo2UnJUYlMraFpSS2pLY3o4YytnYzdwbWw1dU0zTGRGZjJHMGtD?=
 =?utf-8?B?Ly9ZOVFaUGp0eUcwaUt0RDVVSHBiM1BYeERDMTQxOW4yOW82bjJnUHgyM1Ir?=
 =?utf-8?B?ZW5MZEx4aE94NjhFN0VEMUk1ZndFTFA3M1lCMGUyLzFKTm5aa1BhelR0OEN2?=
 =?utf-8?B?L2FWTjNIRGFwVmtPdzltTzhPVUh4aWJSTDBxMmZqeWVXOGx0bC9HaDdQQTEz?=
 =?utf-8?B?eUZDUmUwVXVqcDRWTmxSdEtRTWp4akNvd1MwTmViZG1BZ3cyRGdNZjByNStJ?=
 =?utf-8?B?eHZtbm1BWm04TVlTeUNNWFg0bVBBVm1OMXp6Y3V6S1NPZjAySWtGejBRWmhq?=
 =?utf-8?B?YWRmSkRwTk05blMwUHh1a3A2RHo3cUJwS0dSSmI0QmRVaDd0NE0wZ2UvOG5w?=
 =?utf-8?B?QVdneEFRbGRONVNXM0NlYVhIZGlYVitrdzF3R094blVnNmRCMDd5SStQcW5r?=
 =?utf-8?B?YUFWU3JDTERjTDhyVzVNMmRYV2swR2dpUXFveWNHMUs3OEE5UFFxOFc0SXFk?=
 =?utf-8?B?OVYxTDZ0NHdvb1NwNDJzMHBLS2dWVGFkTGV0Q1FRSVpRK0V3eEkvR25YYUgz?=
 =?utf-8?B?OFBhdkNEV25SLzdrSHlrcng1cERTNS9VcXVTWFhmNzA2VWduZiticXhXMENK?=
 =?utf-8?B?U2pUazR1YlBabEQ1TGkrSkl6SXZad0hSM3NxbnErQTFZY25uOEN1MjVieTIz?=
 =?utf-8?B?c3dWQysxOW1lVlJOZTl2U2hidS9IVnFSU3MwL2lmcVYzaHNHLzlXMGRhWk1R?=
 =?utf-8?B?c2ZjbXFKR2l6ZHI2Vmg4dndadEdqV3hLNDFlcVZyTDhoaVhBQXNEaVZhcC83?=
 =?utf-8?B?UTVpYVV5TlBwQXFWQ3JTTHd2R01RZFNVVWlCMzk3VTJWdVNJam84UVFVVElp?=
 =?utf-8?B?SVduazZFVFBQaXFab29HUWVtYm5nWWFxT3MyYzhpQnlJQWtWOXBXbXpPRkky?=
 =?utf-8?B?SWt4VDBoVU4vRzhPb3J3WldlRS83eW9hdW9TcGFrckNMZjFHbnB1QXQ1ODZU?=
 =?utf-8?B?bVhCZitUc2RKQUZvdDZRc0RTVDhSMDRpVm43UE1xZzhaOGxUdmxXc05wNUN0?=
 =?utf-8?B?QUx6eTA2Ti8yR0JRdGVXOHNxYURQSE1weHQvbEZweHpNVk9BSURoSWZIOUVB?=
 =?utf-8?B?Y1I4dlc4aGFTL096QURoTWNqa0JCcitTOWZRQUlWZXVmbzdvRXhQTVRFSWp0?=
 =?utf-8?B?ZVZVbGtJTkh2emsvVnJoNHFDdzhwQU1lSUNSbklNN2ppQmhoUGx2em1XeWQ2?=
 =?utf-8?B?c01oMGIxS2N3bmVTM3Fxc2hxd0d3Ujl1QkRST1Y4WHZ3cHRxN0pCMEFYdml6?=
 =?utf-8?B?VFFWa2FONUp2TzVHbnlONWhzaHIwRG5wQk9jVDVyTU1RaG45WUJpaFQ0WURP?=
 =?utf-8?B?aFp5K1lOazRxY05mWExiNlM5ZG1EbUgzaEtiOE03Mmd1aFZrNW1QODlScXkx?=
 =?utf-8?B?d1pySmlXOWEzbndwbTllTEZJYXRGbjFvbTNabEkrUjc2aDl0QjYvbFRYcE5S?=
 =?utf-8?B?dXd1NW55MWF1K0huTTE5Y0pSN1d1bnJ4Z3VCb3B2YWx1UXRXcDZmanBDYXhx?=
 =?utf-8?B?Vnl3cUxBQlBPbXFHTzFPOTlxRGVIMThGeU1keStMRWZTK2R6QUhla2JzTFZs?=
 =?utf-8?B?aHNpdFdDMW85Qks5M1RsaVhvQ3lvY2M1TUFycDJ2SUpJMlNCb0wrNmRRQUV2?=
 =?utf-8?B?aEtHL0tReUx4SjNSR2JjSksyKy9YbkdqSkN0SnVrTGpGdXZSdFVUN2ovMWVI?=
 =?utf-8?B?QkpoRXRUeU5ReDZVMnc0SDAvOUVZT284VXFvcnY3VVpmRVBEZXd6UTIwZW9v?=
 =?utf-8?Q?OHWE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02d1dfd-a5e0-46ba-2e33-08dcb826b142
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 03:52:30.1628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oF4ET2zoSXIQJh75vhgX7696XPrjv7gvjuJllwyEvF0ena4VUnos5olvrQy4M/rw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kgp5bLao/8wAorEGH+zyw0nUifQL0Ui6EOD5art9Hpk=;
 b=At3IST9+f5JWTVFEMh2Hgf71gXv6gYKgmw2BqHax5iwtX2Kj92e+DgoTHBMKxUCQWWeuJUiRvuiVu/ikpGkGbTW8+FNiXzIJxx4e+za8fDhawAIthSm67v+NkDd/6Nrs9cYIMiRZ9MNBxG6k1EHuK1BVatQAuT4f+xTNoCR9XwQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=At3IST9+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
>
> Xilinx Evaluation Boards:
> configs/versal_vck190_defconfig
> configs/versal_vpk180_defconfig
> configs/zynq_microzed_defconfig
> configs/zynq_zc702_defconfig
> configs/zynq_zc706_defconfig
> configs/zynq_zed_defconfig
> configs/zynqmp_kria_kd240_defconfig
> configs/zynqmp_kria_kr260_defconfig
> configs/zynqmp_kria_kv260_defconfig
> configs/zynqmp_zcu102_defconfig
> configs/zynqmp_zcu104_defconfig
> configs/zynqmp_zcu106_defconfig

> I attempted to boot this patch on a zcu106, but I get no output over the
> uart port from anything, U-Boot SPL, ATF, etc. So this board may be
> broken on master.

> Can you verify if it works on your end?

I can help you with this problem.  It is because there are two different
versions of the zcu106 having different DDR memories.  This is because the
DDR that came on the revA version of the board became obsolete.

I left the revA device tree in buildroot as I know this is the version of the
zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
the newer version of the zcu106.

To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
correct spl psu_init routine will run.

Please implement the following in your zcu106 defconfig:

- BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
+ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0

This will build in the correct psu_init_gpl.c from the two choices below:
https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA

You can read about this issue for the zcu102 and zcu106 here:
https://support.xilinx.com/s/article/71961?language=en_US

Do you have any opinions for how this can be better handled in buildroot to
support both versions of the zcu102 and zcu106?

At the moment, the older version of the zcu106 is supported and the newer
version of the zcu102 is supported in buildroot natively.

In any case, this issue is not related to this patch you have reviewed.

Best regards,
Neal Frager
AMD

>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Squashed bump of all Xilinx board defconfigs to single patch
> - Removed linux patch which is no longer necessary
> ---
>  board/xilinx/patches/linux/linux.hash | 1 +
>  configs/versal_vck190_defconfig       | 2 +-
>  configs/versal_vpk180_defconfig       | 2 +-
>  configs/zynq_microzed_defconfig       | 2 +-
>  configs/zynq_zc702_defconfig          | 2 +-
>  configs/zynq_zc706_defconfig          | 2 +-
>  configs/zynq_zed_defconfig            | 2 +-
>  configs/zynqmp_kria_kd240_defconfig   | 2 +-
>  configs/zynqmp_kria_kr260_defconfig   | 2 +-
>  configs/zynqmp_kria_kv260_defconfig   | 2 +-
>  configs/zynqmp_zcu102_defconfig       | 2 +-
>  configs/zynqmp_zcu104_defconfig       | 2 +-
>  configs/zynqmp_zcu106_defconfig       | 2 +-
>  13 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> index d85f773478..11f4dca651 100644
> --- a/board/xilinx/patches/linux/linux.hash
> +++ b/board/xilinx/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
> +sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 21dfe2577a..58479c9f2d 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> index 253a6d2cff..4d3afc0e98 100644
> --- a/configs/versal_vpk180_defconfig
> +++ b/configs/versal_vpk180_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index f955a0c4ad..71a5d880b3 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> index 75ebc2a3ba..f3fc32145b 100644
> --- a/configs/zynq_zc702_defconfig
> +++ b/configs/zynq_zc702_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index ce539eefaf..f1c9bd6622 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index 925faeac8e..cada3bbd47 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
> index dff49b9837..262e80a145 100644
> --- a/configs/zynqmp_kria_kd240_defconfig
> +++ b/configs/zynqmp_kria_kd240_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
> diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> index 24fdea9c30..65bba693a0 100644
> --- a/configs/zynqmp_kria_kr260_defconfig
> +++ b/configs/zynqmp_kria_kr260_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index a16da66e38..22df2a4112 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> index 3f1726a13f..c2feb393de 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> index b6d943333f..c26210b49c 100644
> --- a/configs/zynqmp_zcu104_defconfig
> +++ b/configs/zynqmp_zcu104_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index c10ec70ed8..737a8454bb 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
