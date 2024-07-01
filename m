Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069A8C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD0640024;
	Mon,  1 Jul 2024 20:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0imzkniS_5iF; Mon,  1 Jul 2024 20:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDAA400F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDAA400F5;
	Mon,  1 Jul 2024 20:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5AD1BF361
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED08E400F5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQaMTdEny76c for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:55:54 +0000 (UTC)
X-Greylist: delayed 2910 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Jul 2024 20:55:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86AE940024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86AE940024
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=andy.a.kennedy@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86AE940024
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:55:53 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 461Jt3CY029020; Mon, 1 Jul 2024 20:07:22 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40431n849d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Jul 2024 20:07:22 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 461K7Lkt021836
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2024 20:07:21 GMT
Received: from UUSALE2G.utcmail.com (uusale2g.utcmail.com [10.220.63.42])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 461K7JT7012788
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2024 20:07:21 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2G.utcmail.com
 (10.220.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 16:07:19 -0400
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 16:07:19 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.147)
 by UUSALE2B.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 1 Jul 2024 16:07:19 -0400
Received: from SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:170::5)
 by SA1P110MB1167.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:197::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 20:07:18 +0000
Received: from SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM
 ([fe80::599:d4ef:2872:4990]) by SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM
 ([fe80::599:d4ef:2872:4990%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 20:07:18 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] host gcc?
Thread-Index: AdrICvkgnzJ5ZsaDQeq98i+PW5CVnAC7k82AAD35kHA=
Date: Mon, 1 Jul 2024 20:07:18 +0000
Message-ID: <SA1P110MB1069DE425FCD67C56045A0EEC8D3A@SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM>
References: <BN2P110MB1060371DE485BB6BB29E11DAC8D6A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
 <708a7766-b35c-4b94-ab28-21e53020f1f6@mind.be>
In-Reply-To: <708a7766-b35c-4b94-ab28-21e53020f1f6@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1069:EE_|SA1P110MB1167:EE_
x-ms-office365-filtering-correlation-id: 7f957174-f663-45f0-4b29-08dc9a0968de
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eENrNWRSeDY3SEppNlZSeDMzWUtJYVkvbG4xZ1RrejlFZDloWUpOQWJuTjNx?=
 =?utf-8?B?UWg2a1NEbWdjYjI4MkprcTRzWkx3Q21YRzB6aVNKVzdwLzRHdGR6U3JqbVhT?=
 =?utf-8?B?L3lhQjh6NlhobWZvTWpJeUw5eW9EUW5xb2tIOUpyYmQ0RVpLbERWNkpnbVNz?=
 =?utf-8?B?b1hQUFRrRHltbnFwWUdpVzZuaEtwQ1l5U0VwRDQvclFFSUdzUlFETEpkemF1?=
 =?utf-8?B?YW1tcHJSY01hK1RjNTB3T3VvZit1WG5Ta1lrNjZ5VDJpcEIrWDIreU9iTUc2?=
 =?utf-8?B?VWtkRGJWaVlDU2RxMDVZUTdhcGxwSzNpUU1ncHVtd0tlTVhjZXJDckhIQTFu?=
 =?utf-8?B?N09ETjhpSGdYRnkzQk5PZHZsb3F3SVJXb3IwOUFpNjU1SVRqTkJDaTUrRnFn?=
 =?utf-8?B?N2k0dnV6Syt0M1JkSXk1ZmdNaitWZEhMc3NuZVhHemRydWQvRlhrZWNzTlV6?=
 =?utf-8?B?MnA5SDEzejhYMnBTSzRYMzV2c3dHYzRzWjhpcERtczBOc3NCaHk3TU1WUUFV?=
 =?utf-8?B?U3FueEhHSXlubmFkbkhpWTJMMkM5ckgyVHBBVDdUSDduUTlRaGVhYTRkSFh5?=
 =?utf-8?B?dThuQ1krMEI5bTRiYkczeC9IOW1DZ2tYcmdSNUV6V0NuTFBNY3B4ZnQvZm1F?=
 =?utf-8?B?eFNrNkx5L1VyT3ZKeFRoSXRaQmRYckJFMG51YzBadjYvaXV6YkNPNklHSkhR?=
 =?utf-8?B?V0E3OGh5TktOdEZ1MmF1bmtITFJuckVyVHVlOG9oYmxUSjQzOXlMc3VIalBo?=
 =?utf-8?B?b1ExMU1XYzFETlEvaXhTMkg1L0craFFsNnNLRE5vVzMrWWRtME5YQnAwNkRO?=
 =?utf-8?B?Q1ZHSUhBZWcyOW1nVERaUlpDQ0pZR3p4T2l2ZjZhUFJyNTJDVWRrTFpDTjZt?=
 =?utf-8?B?YndXRDZJKy9ZekpBdFJPVmtPaUsrZk1SblJPQUtoa09uNkp2QjU3TVdvV2xt?=
 =?utf-8?B?VElWcUYzUXZUdFUxR2hGM05wSng4OGI2WndFalY4c0tZTk10K0JSTkdPMGdO?=
 =?utf-8?B?clVOdk03azdSWjJTcXJ2Z0dYSnI5ZGthc1RyRkxERjhEeGlnSkF6TWp5d25z?=
 =?utf-8?B?Ny85dTh3MkdvaWxlRkZGaUtuU25Hb2xmTmlLTDJ4Y2swMlVzTjB6WXpnU25W?=
 =?utf-8?B?WWV4cVRWcTE4bU02ME9CSjA4cnk5WGEwQ0RmLzMrSVU4MkJXT2tHVmVuTE5K?=
 =?utf-8?B?NnkzcnVRZzBFVElIMlRrVVVXV3FJWk5Ob3ZWU3J5SHYxUDJXUjd4aWtWQ2dX?=
 =?utf-8?B?WVJRZFdVYnJQSUtWaThkdlBIdVJYUWxqNlYzdmdnUzhwMkpvdmhDUGw3cUM3?=
 =?utf-8?B?LzF5N1Y1QzVhclk1VmZOT3VwazdicXd1RzBHSlcxWmlBRkVadVBpOTNzZWxI?=
 =?utf-8?B?SXE3Unh1Zm1ZcGQwM0pKT0h0d1Z1dzFOQVJhcUVwaWdqQ3JmSTZPZUUyMHhP?=
 =?utf-8?B?endqSG9OL2prdlJlUGNTTFA3Y01ublUrOUp2Y010bk9uTTI1Z2kxVXpRZVJD?=
 =?utf-8?B?cmZvd2RGL1d2c3hSSGhuT1loYVBpajhHN2JycTNZeGN6Y0ZKcTkvcDU5eEg0?=
 =?utf-8?B?L2ZabVRpamQwWTIyK3kzM1hxVHptcklUd1BEYmF1QzZkTGlXL3p6bmdHRXVu?=
 =?utf-8?B?Wm5xVnV1RjhNK3pHL2hLNW1JV2VJenhHTHplalpYUE44VGFTcXlYU3pUM0F1?=
 =?utf-8?B?Z3NFdnZFRVZOMnBWdVU1VFYxZ2I2SkxqL2hBcVE2S25Gem9qN09tTWZLb0tm?=
 =?utf-8?B?T3B1UEpGV1cvVHc0NHp4elF6MHlvcndVak42WWVGbldTVVE2Q1pjQThPOEhl?=
 =?utf-8?B?MGlBNDdIRUN3c3lwL1NQcVVkZU5VazlrMGsxV2RwSU5XS01MWWpWVkZzcnNP?=
 =?utf-8?B?azl4MkszV3lYMWIwdnJWdnE3b1ZBd01qMG9nay83N1p1SkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SldIdjBlcE82ZXlMcWJ3WVZyNWtoTUI0RUtPOWtLanNuVDRHQXRBbG5oYzhv?=
 =?utf-8?B?S2U0MUZKZ0NaVnlYc09lczk3bUdrOFFpQVlXblU1dCtMN3lPTmFaODQxdXhD?=
 =?utf-8?B?d21EeTdNdWhQR3JpM0ZFUlRncWd1RGE2QVZ1MzVveUNidThPbWZ3dE91Q04v?=
 =?utf-8?B?b2FQd0lPOEluTXd3NGsxdHJZWXZRbUZsUDV2OEZMWlZHRXpKZFQrWUlUajNk?=
 =?utf-8?B?V3BMUVBDY2tqcGltcU9vZUpuVDhZYWF6L1cxc3Avbk5zQUcrWmN4eWF4NE03?=
 =?utf-8?B?SjVjaThKSjNFbXpUdHFSQXVVcS9vRGV1YndwT2xjSGt1Um1nME1sZkVYZFBn?=
 =?utf-8?B?NHVnYTRCTzd3RkFWWlp1RzMvSG1CdXM3ZFdZVVZxMk1iR0V2SGoyd05wRnZ0?=
 =?utf-8?B?blFIZkMxZ2FwazZJakR1SFRpWStub05sRjV1WGp6YUNEbm0xZEF4c0R3THRU?=
 =?utf-8?B?NFBtOTVqTGN0cEJ3UlB1ekZna04rNlFrcGxCdDBFZlU4aGU1RlVraFlUemxn?=
 =?utf-8?B?QXVzWGZUYVV4SDQrRHVJTWg5VFhITmduSkRxZ3Q4dkJLclFVSi9VUzRQMk1k?=
 =?utf-8?B?RkhrQVN4eVlKbW55cHFlU3JvWGlRRm1hUzM2VG1nME5JbXhmNEk5OVZxaldp?=
 =?utf-8?B?NjdkWTB5dHZrMWtzdThSK2hycnpBL2d0OTZwQ3ZVWGpOZGdsUHI3d2dCWGEz?=
 =?utf-8?B?ZTVLMXpkanh3YlRFZVdISFVvQ2pmblAyaXk3ajJHZHBHQy9JK0p1UUQ5Q3g4?=
 =?utf-8?B?VGZsaFlHa0lacUlVb3h5VDFzUm9aQnJkQ1ZZcUNDaVpNRTRram41V3BLNExZ?=
 =?utf-8?B?Y3UyUWZjUnUwRFdDZ3RhajlOcXYyc01lQ2Q0WUtZOXpDc1hFM0xxeDBUa1Bt?=
 =?utf-8?B?Ti93U21HYkpaYklxUTR2dEVYNTljeThwTnNIbHo2RTJDdjdMR09OejBsVGZj?=
 =?utf-8?B?NThoeXI4Qk14NmlkYlVPc05Rdy9MYVgyZWFlK1U5WG15YUthYnpGWlFENmlH?=
 =?utf-8?B?clE5Z1RUdkl5d0c0UnZqaXlacTZOTWRDaXh2OU9yR2NPSlFLeHl1Y3A3MWU3?=
 =?utf-8?B?bXhqODlvaktYZkFNWjRDV2ZMZWRrakU5SS8zbzhoSTJKU05zSlpUVVdhbVM3?=
 =?utf-8?B?R1FEL2xvd0s3MGNEMTV5cG92ZXlyWmQxcVgyOVdlbjNkTjNXeUswNitoZlNr?=
 =?utf-8?B?VW92M3paWEdPM0MwdzNZTkJiM1dPNUVaVkxqM2l3ZzJFbGFnNzU2RVFzVTJj?=
 =?utf-8?B?czdmZ1AxNWJ0L0VLbDNQYWZvaGoyN3dXRjNWUlk1QyszZnZoa1pVWmpFRUhy?=
 =?utf-8?B?dXYzbHBIZ1FKMU03L1NCcFBkMkhlL01zcU9PRHZDSGFBdWxBUVo1a0dyeDB5?=
 =?utf-8?B?MmorUzJGVUI4MStZaENoSWZzVExjN0lLSjV2dUEzTnhDQ3owQTZjNndLTGFF?=
 =?utf-8?B?R3MvMzEwNlorcmx3eGVwREdPMkZuM1liNWJtbzE5MTZDdFJyNDh5Mi9HSnZ1?=
 =?utf-8?B?SVQ2VWkrTDIyR2FONWVNQlpYWW9qRC9SclVxMThiYmxLUVFrZ2dDN0dEWFND?=
 =?utf-8?B?a0hoS1JDTGU2ay9NcDlGSjNpTWR2WDdTTVk1d0Y0dTZRa0dhQVlyaSsxNzRZ?=
 =?utf-8?B?SGJBbHBrMW9odVZBL0J1SFBLN1NmVmwyM25LSk8yWHBSWEhROEFrNGg4YXBv?=
 =?utf-8?B?QmVsR2FzcTFZUnVpUnFwL216b1VRYXBMeEZTSm5aZW1TSDF1blJ6T3dxQkEw?=
 =?utf-8?B?aTZIUE5HSFg5N1JNcDNIRVhCY05DczFxMUFIM0tuY0FnMmp2Z0pmdncxRExi?=
 =?utf-8?B?MTJ5QnplUmV4OVpOYkE4a3NaYnkzaXBvTzd1aTZlZldKaXl0eTRzdngrd1ZW?=
 =?utf-8?B?QzBybU5vVlZ6Tmp2N2YyZnBuL3hEanBueEpkUzBxUVdqQU9kRk44eGlqOWh2?=
 =?utf-8?B?RjVNRGlNaXA5ejdpLy82M1R4bS92aHhaS1JtaFB3LzVDcitCb0VLTEtWaWJm?=
 =?utf-8?Q?lxi3JsUPIO9GCBYy+L8hyS/XWWqXjA=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=wR32uiAs5YQNrUnaYlFCYxFJWYHUvg0jtbVeTIfopIyMmuNI7GtJbuWCPCtMQLNG1E0MlzkeCps2bItoiGy6UQd81MYAO7kQbefrye6M+jXol/48hsmHbc1ZgeVoMk4jp8e2OLI/Pt1vVG+7M1o00QMKlNIfAf9sGcjIdF/7Cu9dtdXSS1RMLGIWtCopzBucJ6ISPg6fSUuq+etOxGGfZVeullW/9tyhdsYVt/7zHKwR5vkgAKT9Z4IRbOnKsrnihfwYcNT4O+rgYWwS7277rer5KTqE9fMwaDliDoPNoJCJovnufXD8OvfhLUNFapBRfodLqdcCQcEvwpye56nyrA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03rWunFHh/3BlxxQHgYzUJxZz7eNb3Q1vOpINLPG2hA=;
 b=YxJiFIdDZ7tKcItfpg/d09AeL/5d6MmswmPz2yL23axdAdxmo46e0+pvnkIut34Gf2K3wxOmvJ1MsWSblqczEhS5vRktr2pj/fN6zBTrfmbJGbNKt/vEM5R0UCoBbgfzG37NMYixXI2MS5Ukfy6E8iu9jfPiPwjp1lyX2tH6GtRZHLp0l8Ofj9TUJptlHkD2BHZNkVfb+257F43AeIM1Kr5dd7Z1CLuFMiOVk8OdD1REeCCklz+7K5rjbHHUCzTTBr7JYkT5MgqB9K4o82qxeTdIM46Z3+ZmlEeGESWhrp9E2jRZCJnrlUqvxZWgbAAOOEN7aQw2kDN0/iCqaKs+xw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: dU1+HSrHCrsFVGgsZicsKeuDnvGtxRWxOXy7Wwdlr3sVGhc3VsSpbsk4ok6zQO38u10+kTc5l6cW6OaMUDQD+SFFaY2KOYJu1cACi427wF7+0J+Z6kenKtGsmGNgRIlrErl/M+6v0PjchgsbYwawXbLwkbx5htXoDFozfRH7HTGoWevg1SSlvgOuNksPGoKtqSJlsSeOzBkGnwdnNe8MeuiLUYPnXrzqKEi4lmBrsICtBFaLlNZOB3TJjup3l5yf/SA2ndiiphrn7C+veM3C4GyfIYTDwOhofEab1aon1OjQ/LEP7aOBiKfDK/9bE3fGXUKHAruSpcWkQ7gUWPzvJcBGjDGNMvuuSYaXRKdeZRBHvM5lSe222V8W+FYA4UZnlmXobPXqp8KnyowZgwhDU5kLNxgfqH8evuEEB61GqYaQpSNyLv7ekK1EGye7SjGyBGR+ysPsLR1YW9dflGWj/gwjFPDWeaWoTjFqmmOXeHaI7tm7nWP90cM72UqeHIEYcasNyDEo57S+1HWa/G3P0M6J1e25C/56f6NUvxU4Ufy22vYpr94f2EM4EFLbY2s4QUy8oXAcqVt7IOQ0fDB4EO2QbJPRQDeVtx7OXtenqlk=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 7f957174-f663-45f0-4b29-08dc9a0968de
x-ms-exchange-crosstenant-originalarrivaltime: 01 Jul 2024 20:07:18.4338 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: SA1P110MB1167
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_20,2024-07-01_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_20,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010150
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407010150
X-Proofpoint-ORIG-GUID: ymPK6PtL2G_euo_Ngj2bdq0n4k761A1o
X-Proofpoint-GUID: ymPK6PtL2G_euo_Ngj2bdq0n4k761A1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_20,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407010150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=v9x+alMuUgUl9WZ1PAAfCA1L3lcIH8JxE24rZaya34o=;
 b=lhlN4UewFlCDRU/ED6CdCAyGfku88ebT00w/Ya9FE0H7avbQCk7Hzf42FfNBYXcoJ+NL
 1Ke1kmuSwP2YxYnUeqRDGQPKafXC38ByJq4jV/Vhzls+92c2ul088PZy8ytYmzJv5n8O
 a8w1LdHfMaxyHcdgU0JRRV8cdssFkwT61Nwbv+It4o8F8e0r1gqSlpv0pmB5AB4knun+
 WbLTstros7Z6wrd9/N6yn0ckRd62PyD9s1WYyKRTErvLEg8aKWqEaCMaJ1qysj/jhi4R
 i5hKJiZ4cwfttcyhtOn7mwF8z1NgQ2vmcYrKJjaKZG6IdPY1L0DiD7MSpT9VUr2y9f7z mg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03rWunFHh/3BlxxQHgYzUJxZz7eNb3Q1vOpINLPG2hA=;
 b=SP+C+lN+k38oKo1eKT/dOMYIAlMGsLUW7n2Pb8UiW5yMpF/IDfIuOK4tGCkGfKiwTU647C9g9RP/lbjTs3t6uE9NOQ/LZ3zTidFsGVSYKlriZLRic4f0zd8skElYPFHv5EMRiWaH9t6cwjYTm2RiQLhU3P64DdGwShi2aspadqE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=lhlN4Uew; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=SP+C+lN+
Subject: Re: [Buildroot] [External] Re:  host gcc?
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
From: "Kennedy, Andy A Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Kennedy, Andy A Collins" <Andy.A.Kennedy@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/06/2024 09:25, Vandercappelle, Arnout via buildroot wrote:
>   Hi Andy,
>
> On 26/06/2024 23:02, Kennedy, Andy A Collins via buildroot wrote:
> > Many years ago, I recall (perhaps erroneously) that the toolchain build
> > also required building an intermediate gcc to get to the latest version
> > of the selected toolchain.
>
>   We still have that: package/gcc/gcc-initial.
>
>   It's not a host gcc though, it's for the target. We need to build it to be
> able to build the standard library, and we then need to build the final gcc
> using that standard library.

Per the below comment, it makes me think I didn't articulate correctly:
I need gcc >9 for scipy on the HOST.  The package builds for the HOST
and for TARGET (for which I'm using gcc12+, so I'm good there), but I
also need to match the HOST gcc>9 requirement --- which, it is not.
Hmmm, so I may be able to make the intermediate stuff work easily if I
were to change the requirement of BuildRoot to be a higher version...
You may have given me the easier path.  THANK YOU!!!

>
> >  I now require selecting options that need a
> > toolchain that is older than the version of gcc I'm stuck using (for
> > reasons I won't address here).  Specifically, I'm attempting to select
> > BR2_PACKAGE_PYTHON_SCIPY which has a dependency of
> > BR2_HOST_GCC_AT_LEAST_9 and BR2_TOOLCHAIN_HAS_FORTRAN, the
> > latter of
> > which is easy to overcome by configuration.  The former, however, is
> > what stumps me.  I need to provide a gcc that is greater than the much
> > older version than gcc-9.
> >
> > Do I have an easy path to this goal?
>
>   The relatively easy path is to build GCC 9 outside of buildroot, and specify
> it by passing HOSTCC and HOSTCXX in the environment. Or making sure that
> GCC 9's
> installation dir is earlier in PATH.

I have to do this inside BuildRoot as I'm not root.

>
> >  Assuming the answer is no, would
> > there be support in providing a way to select the current toolchain
> > gcc build as a host to host compiler at the same time?
>
>   Sounds like a valid idea, but it's not so simple to implement, because it
> means that HOSTCC has to change somewhere in the middle of the build...
>
>   Also, it's probably better to stick to a single GCC version, and make sure it
> can be used regardless of whether an internal or external toolchain is used.
>
>   Regards,
>   Arnout
>
Thanks for the reply, I think this gets me there!

Andy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
