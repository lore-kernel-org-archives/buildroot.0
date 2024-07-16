Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B6AC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 14:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB7D60A8F;
	Tue, 16 Jul 2024 14:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Apd5ZhPJFjpW; Tue, 16 Jul 2024 14:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907B260A55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907B260A55;
	Tue, 16 Jul 2024 14:41:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7F71BF37F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A36160A55
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W08FeTPFZPAv for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 14:41:24 +0000 (UTC)
X-Greylist: delayed 1641 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Jul 2024 14:41:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5DC260A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DC260A3B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.147.86;
 helo=mx0a-002e3701.pphosted.com; envelope-from=david.rush2@hpe.com;
 receiver=<UNKNOWN> 
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5DC260A3B
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 14:41:23 +0000 (UTC)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GD2ixf017533;
 Tue, 16 Jul 2024 14:14:01 GMT
Received: from p1lg14878.it.hpe.com ([16.230.97.204])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 40dqqnshjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 14:14:00 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 4AA1414791;
 Tue, 16 Jul 2024 14:13:59 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 16 Jul 2024 02:14:40 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 16 Jul 2024 02:13:43 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Tue, 16 Jul 2024 02:13:43 -1200
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 16 Jul 2024 02:13:54 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUghLHKNwqghYu79RzrcVy8D5489SKm8WDA4B8Jeh2KfqjyX6zh3souCdOUyQ/mV6Os4CVd2OOYd+IWbrhPjSOBsDQ0CzaDoY7b1n0Cpy4NQGiy7Y+6WvD7N0fO2b0k3coPr12kMMBzYginSOPUXupSHghN8lhykyCidhWqkcbDqS+jOoeqZEZa/386/GWq2//XAWz6ccgApIlYapgMTqH1/COyCY48ug6/3U4UHlwvx/lK46CTSJT6zorUAiG8Ca0RfC7liEnTKVZX6N/hNT6A9ScpesVP99QSQO8CtygqzNZOLP35NwvUe//Qk+uAZoEX674vRZ8KnryaOABXpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By6PuK73WO1FRw75kL6BuknUbVybRiJLLOx9WREYUhA=;
 b=Ponjp+fRzo201THtHuzRG59/fwnHI2KQpp6QO0NTzbda9C1v1yEeePuF0sHOkzgj6wdjoyl3Jf7OWgoWiWnOUBpiiu25ixQIK0lTmKpLfh5y9VqNVk0T5cRzajcXLNTzFLRcBZEcezlblyAaGFxqId58KNyTDhHZLhUystMyT8scOW/hVmfRCctHliCSNaIspU9cb5uoP1b4ZZN9FSBy6h8Pw04/z3EBhVdKL5PXB83KcucfpWOMWd4ukcZcoAqM8x3iWlG7lS1PVSLbCj9yLfQFplSRGX/vSm8137jJpBw3mKip2520yO6VLcXVBBjwGqlsASk8K5cmW+C3wnX3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::17) by
 SJ0PR84MB1700.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:433::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 14:13:50 +0000
Received: from DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::e6e7:50ad:337b:a788]) by DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::e6e7:50ad:337b:a788%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 14:13:50 +0000
From: "Rush, David" <david.rush2@hpe.com>
To: Arnout Vandecappelle <arnout@mind.be>, Romain Naour
 <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] bare metal toolchain tuning options
Thread-Index: AQHa0Vg7XhcTpE8akEqM07Z9npV88LHzgzsAgAAD/oCABeXsoA==
Date: Tue, 16 Jul 2024 14:13:50 +0000
Message-ID: <DM4PR84MB1664C75FF1FD9995EEE4E3A8B6A22@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
References: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
 <5d78c650-f662-4733-ba33-dff3aa71727a@mind.be>
In-Reply-To: <5d78c650-f662-4733-ba33-dff3aa71727a@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1664:EE_|SJ0PR84MB1700:EE_
x-ms-office365-filtering-correlation-id: 6d5e6052-7030-4449-c525-08dca5a18435
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Sjd3RHQzb1JnNEhYM014NjlBQU5YUko3dDFtNTFXbmtoWFNORDhwVnRkV2NV?=
 =?utf-8?B?bnV0UWhBaTk5R2NmdUQvb2JvZUlJTld1d25tVFRxVkhuTjA0YU1ncm04Wk96?=
 =?utf-8?B?aVpEZ3hkNW1UT0gvbVlWZ2FqQ0RvcGd2MytkM2JiSkZIMzFpVkprS1BScDk2?=
 =?utf-8?B?UGFUdElqWHg1cTMvcjJsRWt3N1FCRTc3eFFORXBicU4wYytOTjZQSTd3b1Jk?=
 =?utf-8?B?blNUZ1FxZGNFQW55T0plcTgzck5WcWhQbVEwNUhpUFFRK1VUeTZxei9Idjg5?=
 =?utf-8?B?Z1dXL3hFQWg4RDd3Mkhya2MyWGtKVWNWNEFWT01wN3ZWWFdqVlc5NG4rN3BM?=
 =?utf-8?B?eFA3V08vN0ROTlRxRTVJZHdhWU5oRWNsWmpDRXRETzR1WHhOZ0IxeGw4VkNQ?=
 =?utf-8?B?UVZpRlpjSVE5ZFJpejhTWlNtRUQ5bjhDSW5NVUlDOUFubmUwYkthdGJyNXRD?=
 =?utf-8?B?bExIRVFzOFdYY0hKTGNqTkFGS2xrTWxZWXNpRUoxTlFJelByZnVnM29RUGhW?=
 =?utf-8?B?ejdZQUhnbW9FMlZuOHRSTElpUE5vdTRBRUcwZTE2M1FqUW4yQnVjMVZxTUhC?=
 =?utf-8?B?cWRHa0ZmWkMrWFZ5S2wwS0hBcWR5TzNiRDdHRFhTOVJVcGpZcWpKS2YvWjZy?=
 =?utf-8?B?eXJtOUVoRCthSHVRVlM4K1FPZ3lvdEdaWnM1MFJoSFJOQTRJS3NXNldOTWh0?=
 =?utf-8?B?YjRSQXFPZTMwWTVDSHRTQXpUM2xwNHR5Sy84Q1J2ajZ6SkZGbCtQVkplTjdp?=
 =?utf-8?B?MytmcE8rQndTdTA1YldFYW5CTFZ5ZURaVVJhVi9HRkxESDN4Vmt6N1hwYVhH?=
 =?utf-8?B?aXhRNW1FNUNTM0FVdEpHZU4xOTI3eGZpYXJKWW9NNHF1TTkzOUg2V0xWeDFF?=
 =?utf-8?B?bC83QXdIYVdwM1ZKYzk5alB5WVR3enlxdW54OEhZQ2NaU2s2a3lObkYwT3BT?=
 =?utf-8?B?VnFiK1FxUytjbDF0ZkRtMW0wRWROOUE0RjVDWmlKcDE2NndueHJ0dlBpQVFk?=
 =?utf-8?B?MU51M3BiOHdZczVIeTRDQUhXREpRZXhyNWRpeVl2YTBKVmtMekVYTlg5UWpP?=
 =?utf-8?B?RFFMQjVaZ0RYWklxRnkyK1FpMi9EM1hMay95b3pSRjNDVlFqYlk0VEJoS2M0?=
 =?utf-8?B?Z0xGTytJZXRrK3RuWFR4cFVmZ3BJbHJIWFFidEQrenpwVDRZYnRYcU9yc3U4?=
 =?utf-8?B?SWdVL2VjMXlsVXhTRmJwQThUdjJxVmlsMjFPdmJUM1A1ejJMUTIvZFlKVER5?=
 =?utf-8?B?SWRjemVwWnBZWmc5N2tCd2w0N0tKeEpEdnFpeTh6MHV6eTVxems0WWpHVzVE?=
 =?utf-8?B?SHlpcVV5blgzSTlyeEY3MHpuTFhPbEQ0NDgzWm5LR096dm84MHhyM3UzSG55?=
 =?utf-8?B?QzdUWVRZN3puZUN0RllUM0dneWkwcHFzQitYREtSam5qK3V6NHBBemVSVWVj?=
 =?utf-8?B?RG51L1g1R0J6c3A5RE1sU003blRHOWE0b21NWXZqMldPMXNuNWJWQTVrZStT?=
 =?utf-8?B?YnA2TG54ckFZMzhxSkNSNmtJb3gvWmtDaE9RWlFsb2xLUG5qUnVFN3FJVHJS?=
 =?utf-8?B?cVlVQ3M3ZG5laGZxaWFxTnVCc0NNaW1rRTNmK3ZzQ3FVZDlidlV6VCttRFo0?=
 =?utf-8?B?elpOUnBwamg5dDY5QW5Hc2krQWZqZUpCRURhQ25UMkpZYmx4VWplQ244YmxB?=
 =?utf-8?B?ZjhKakRtYkhHUXhUY2RvRnZNek1Vd3lOd1NUbDNSS1B0MmJSSEE1c0MyUDRO?=
 =?utf-8?B?REkyeDZXd3QxUlBud3NNeXZOQWFRRlkrS01wdWtmK1NGT0FLNTNhcWgwQXhs?=
 =?utf-8?Q?2mvCxqgtoGnBT33lzqJa2+6Ccw0oqjSwpP6fc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alZJY2NaVEdWZDRkWDVyb0M4cWJhNnAvengremdvKzdpelA2eituWnN1SHVa?=
 =?utf-8?B?SjRyRW9XU3UrOUFFNktES3JWODUrWVVISkFNengxRVptZnpINkMvN0M1Q0R3?=
 =?utf-8?B?b1luU2tIejZzZEpvaEsxM3FhR21Lakc0YlhrN2dZNzRCK203NERXU2FqOXJ2?=
 =?utf-8?B?NzJITXN4U1c3bDFZaHUveklXSGdWNWE3dDlRY1ZYcTZuVyszZXFtS3ZPS0Rx?=
 =?utf-8?B?cUhTMTFlbGpOcmZDb2dHeGZzaW9tOVFQdHJVdjV0UTZiMFRoeHk5MnlOeEJF?=
 =?utf-8?B?cnVmbkZoMTZvK2RCZFJDcHNKQ3cxMkFzaHVvT0o4c1FVWE84SURwTFlXMmha?=
 =?utf-8?B?VlZXRnZ5dU92MzdLZEQ0dndaTWRLUVc5RDJCSmRQNi9QSk1nL0x0MFU5aHIz?=
 =?utf-8?B?SGNyUjYxRURpcWtsRHpZOG5lLzJZdFZYMC9QeFhjRG40UHoxaVZ1ME9KeEJ0?=
 =?utf-8?B?eitsR2ZRd2hhdnErZk44bGE5N1FnR1FEa2k2ek9PVTFoRkYwdVozejd6TmZM?=
 =?utf-8?B?U2VZNXY1R1M5Vkt0Ym1aSVBDMXhaRFdlRHNFbXl1R2NkUXVXS3JJbGt5TTRr?=
 =?utf-8?B?Wnl2bEx4NTUrSHhZOEluNDNTN2dEcVdrUklkc0pPR3lrVzEya3JyWFd2YXZh?=
 =?utf-8?B?UEh1clRONit2ZWtKMVVGcWpyZ21uZHpETGpYcHhGYnNjMFVJQVpSc1BhQXNL?=
 =?utf-8?B?SkpuYVJLc01Oa1dTTStqVnUwbSs5QldqcytKNkw4eDJUWk94NERRZGZDMGJz?=
 =?utf-8?B?ODBJZjlyOEFYemxLblRGamZqZy9wOHNWWTBmZzVLR3RXQy81TjE2ZzIwNEJM?=
 =?utf-8?B?S2hRVWpENDJHWC9Xcmt0TUkzSi8xY3NBOWpYQUZpQnhPLzV4eHlnZ3JQZHRL?=
 =?utf-8?B?ZExSRUtjS243SjRlRHB2NXc2cnArL3VsUndZQUFjWHpXdjFWTjVkeXN3WnVX?=
 =?utf-8?B?alpmNmpsSUFWTEdpQ2VPR1NIVzNWSGhjRjkydFl0RjhzWFkrMHZUL2pkcFQv?=
 =?utf-8?B?T2lzOC9XVVBubDlHdWFybGtEME5pNXNEamhwSEt3THdic253bEc1aVlla3pP?=
 =?utf-8?B?ZlZjWG5pOUJyU0xiRDFzcVNhSDdDQ3E0ZkZXU0ZBUFArZHlnNWVOSkhEQ2FN?=
 =?utf-8?B?S3l0TWMza2JMMDZwQld0VTJpYTdhODBUOGthSWIyMDFjVmVTMjBSb0RJQSt6?=
 =?utf-8?B?akpNblpGSzJOcnJ1ejJ2UWFtYWxlU1BPVlpvODlnYzdOTTJsR244MysrR0lB?=
 =?utf-8?B?SnhwTzdFS3hlTERjRVNBaWorVndoakdPTk0vUGs1KzlUMFJPR3FtR2dweStj?=
 =?utf-8?B?aytBc2lweExmQUNhYkRMQmhwdmVRaEVrSVk0L2RhdWRnL3FKNGtjTmRxbitP?=
 =?utf-8?B?b2F4UjQ3eUpZUE5ueUJ2VkZMcjhudEdxVmR4WjcyQVViMTYxdXhCNm5PSGlt?=
 =?utf-8?B?YmVlbE9udnBGMGlYSmJHdEMwblAxeWNZQ1RwdkxWQkt3dll0RlF3Zmh3Z1R5?=
 =?utf-8?B?TkZ6RmM5Vm5uS1l1bEVwOTlHY2dMZThKU1pkN2lGNnMyOTZFUTlvbjhXZDBD?=
 =?utf-8?B?U1NHOGVtd0VWbFFiV0x6WEI1dFJBWTB2bTlMdkJxTDNtdTUxd1RIRE11QnNI?=
 =?utf-8?B?dmVMTzQwZUdjQUI3TTIwTEZabVB6M3B0VjZlWmhaNlNNcExHY2tJZDdIOGJH?=
 =?utf-8?B?alhRZGw0UlhXcERCK2VBWGljRENZdzVSMHhIdmllZzJTUEp1ZXBYZEI1RkpV?=
 =?utf-8?B?ZkVZOE9aZnE4SGlEcHVpUUU0NzJCci9QUmFZY0s0bWZOQ1JjdHFiM0JKUFpX?=
 =?utf-8?B?Z0d1K3BGalBSRUltSnhZYy8reUVSdzMxQTVRalE2MDhwckF0WnRUOU5rejkr?=
 =?utf-8?B?WHhNZnpqUFdpaTdrTHRreWU4T1JmaFYwd2Y1S3BDM3VrYXZDL25NVGtST3pt?=
 =?utf-8?B?SEpabTA3UTlyZHdiMXBaaTlRdUZNa2grM1JaRHl4dG1Tbk9WdEVrRGMxSW9a?=
 =?utf-8?B?ekpCNmRORmlPdkVCZDhlUmJXdzU1WndHUzVSbEdsRUV1SWhSQ0FUc0Y4UVJ6?=
 =?utf-8?B?Q0tUbFZrUGJrMFU0M0ZhV3JQcnNMRHQycTBlRi9yZHhLUEVCZ0M1NUlxdWVz?=
 =?utf-8?Q?qtx4=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5e6052-7030-4449-c525-08dca5a18435
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 14:13:50.6061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dF2j7y772uPvkrl27BrDEVLo+iueJ6PGbQWE3Pd/fxPfOTlMmKPexrmukkLQMbh5m5/luanZI1rs7yZeSRIh6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1700
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: okhTqCgG4_JRV2MF-Z-SnYcxIzCNlDsy
X-Proofpoint-ORIG-GUID: okhTqCgG4_JRV2MF-Z-SnYcxIzCNlDsy
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160105
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hpe.com; h=from
 :to:subject:date:message-id:references:in-reply-to:content-type
 :content-transfer-encoding:mime-version; s=pps0720; bh=By6PuK73W
 O1FRw75kL6BuknUbVybRiJLLOx9WREYUhA=; b=ZnVNsfqq5jaawaJD8vxpWona6
 4vSEyGg6JVJYgviD3ZlJ7+nLVxyOz7ViOIfT7y9LuERF8qbb7wpqH91IJkuVgZge
 kfe/2ZVl01I4A1/ZnsSVeBhhVgIaOCbacFLemUFnDkdAnlw5Aea2Kopj4ka7NDG/
 PgUPjuWL3yXZyFacLvA7C740Pl+6f6VvndPb3zhBwl6akbXOyNJuwSGy6t6YK+jJ
 OqUVLfpyvlxPlKAx8/3C16yA38vm6xZlkpMdgkyj0biI3GmKCq5Kcch1Hoca9Vl9
 ojZDZO5rUTVJLd+TQNrotjJi7pJsGPSUltG7+rdRKJjagXgOiGlfxiOQLDsUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=hpe.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=ZnVNsfqq
Subject: Re: [Buildroot] bare metal toolchain tuning options
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBcm5vdXQgVmFuZGVjYXBwZWxs
ZSA8YXJub3V0QG1pbmQuYmU+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxMiwgMjAyNCAyOjUyIFBN
DQo+IFRvOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj47IFJ1c2gsIERhdmlk
DQo+IDxkYXZpZC5ydXNoMkBocGUuY29tPjsgYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtCdWlsZHJvb3RdIGJhcmUgbWV0YWwgdG9vbGNoYWluIHR1bmluZyBvcHRpb25z
DQo+IA0KPiANCj4gDQo+IE9uIDEyLzA3LzIwMjQgMjE6MzcsIFJvbWFpbiBOYW91ciB2aWEgYnVp
bGRyb290IHdyb3RlOg0KPiA+IEhlbGxvIERhdmlkLCBBbGwsDQo+ID4NCj4gPiBMZSAwOC8wNy8y
MDI0IMOgIDE5OjU4LCBSdXNoLCBEYXZpZCBhIMOpY3JpdMKgOg0KPiA+PiBIaSwNCj4gPj4NCj4g
Pj4gSGF2aW5nIHRoZSBvcHRpb24gdG8gYnVpbGQgYSBiYXJlIG1ldGFsIHRvb2xjaGFpbiBhbG9u
Z3NpZGUgdGhlIExpbnV4IGJpdHMNCj4gaXMgZmFudGFzdGljLiBBcyB0aGluZ3MgYXJlIG5vdyBv
bmx5IHRoZSBhcmNoIHR1cGxlIGlzIGNvbmZpZ3VyYWJsZSB0aG91Z2ggdGhlDQo+IGRlZmNvbmZp
Zywgd2hpY2ggbWF5IG5vdCBhbHdheXMgZ2V0IHRvIHRoZSBkZXNpcmVkIHJlc3VsdC4gSGFzIGFu
eW9uZSBsb29rZWQNCj4gYXQgYWRkaW5nIGNvbmZpZ3VyZSBvcHRpb25zIGZvciB0dW5pbmcgdGhl
IGJhcmUgbWV0YWwgdG9vbGNoYWluIHBhY2thZ2U/IEZvcg0KPiBleGFtcGxlLCB3aGVuIGV4cGVy
aW1lbnRpbmcgd2l0aCBhbiBhcm0gY29ydGV4IG00IG1pY3JvY29udHJvbGxlciB3aXRoIGENCj4g
J25hbm8nIG5ld2xpYiBjb25maWd1cmF0aW9uLCB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gZ2Nj
IGFuZCBuZXdsaWIncw0KPiBjb25maWd1cmUgY29tbWFuZCBnb3QgbWUgYSB3b3JraW5nIHRvb2xj
aGFpbjoNCj4gPg0KPiA+IFRoZSBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UIG9w
dGlvbiBpcyBzb21ldGhpbmcgbmV3DQo+IGluDQo+ID4gQnVpbGRyb290IChhZGRlZCBpbiBKYW51
YXJ5IDIwMjQpIGFuZCBpbml0aWFsbHkgaW50ZW5kZWQgdG8gYnVpbGQNCj4gPiB6eW5xbXAtZmly
bXdhcmUgKHhpbGlueCkgcmVxdWlyZWQgdG8gYm9vdCB0aGUgYm9hcmQuDQo+ID4NCj4gPiBJIGRv
bid0IHRoaW5rIGl0J3MgbWVhbnQgZm9yIGFub3RoZXIgcHVycG9zZS4gRm9yIGV4YW1wbGUsIGJ1
aWxkaW5nIGENCj4gPiByZW1vdGVjb3JlDQo+ID4gbTQgYmFzZWQgZmlybXdhcmUgZXRjLi4uDQo+
IA0KPiAgIEFjdHVhbGx5LCBJIHRoaW5rIGl0IHdhcyBpbnRyb2R1Y2VkIGluIHRoaXMgZ2VuZXJp
YyB3YXkgcHJlY2lzZWx5IHRvIGJlIGFibGUgdG8NCj4gdXNlIGl0IGZvciBvdGhlciBwdXJwb3Nl
cywgbGlrZSByZW1vdGVjb3JlIGZpcm13YXJlLi4uDQo+IA0KPiAgIEFuZCBJIHdhc24ndCBhIGJp
ZyBmYW4gZm9yIG1lcmdpbmcgdGhpcyBiZWNhdXNlIEkgZmVhcmVkIHRoZXJlIHdvdWxkIGJlIG5v
DQo+IGVuZCBvZiB0dW5hYmxlcyBhbmQgYWRkaXRpb25hbCBjb25maWcgb3B0aW9ucyBuZWVkZWQg
dG8gcmVhbGx5IG1ha2UgaXQgd29yaywNCj4gYW5kIElNSE8gdGhhdCBmYWxscyBvdXRzaWRlIHRo
ZSBzY29wZSBvZiBCdWlsZHJvb3QgKGJ1aWxkaW5nIGEgTGludXggcm9vdGZzKS4NCg0KSWYgdGhl
IGdjYyBhbmQgbmV3bGliIGJhcmVtZXRhbCBwYWNrYWdlcyBlYWNoIGhhZCBhbiBleHRyYSBjb25m
aWcgc2V0dGluZyBmb3INCmFwcGVuZGluZyBhIGN1c3RvbWl6ZWQgbGlzdCBvZiBjb25maWd1cmUg
c2NyaXB0IGFyZ3VtZW50cywgb3IgdXNlIGEgZGVmYXVsdA0KbGlzdCBpZiB1bnNwZWNpZmllZCwg
d291bGQgZ28gYSBsb25nIHdheSBpbiBtYWtpbmcgdGhpcyBmZWF0dXJlIG1vcmUgZ2VuZXJhbGx5
DQp1c2VmdWwuIEFuZCwgaXQgd291bGRuJ3QgcmVxdWlyZSBhIGJ1bmNoIG9mIGV4dHJhIG1hY2hp
bmVyeS4NCg0KV291bGQgYSBtaW5pbWFsIGFwcHJvYWNoIGxpa2UgdGhpcyBiZSBvaz8NCg0KPiAN
Cj4gICBCdXQgaGVyZSB3ZSBhcmUsIGFuZCBhcHBhcmVudGx5IHRoZXJlIGlzIGEgZGVtYW5kIGZv
ciB1c2luZyBCdWlsZHJvb3QgYXMgdGhlDQo+IHRvcC1sZXZlbCBkcml2ZXIgdG8gYnVpbGQgdGhl
IGVudGlyZSBzeXN0ZW0sIGluY2x1ZGluZyBub24tTGludXggY29yZXMuIFNvIEkNCj4gZXhwZWN0
IHRoZXJlIHdpbGwgYmUgcGF0Y2hlcyB0aGF0IGFkZCBtb3JlIG9wdGlvbnMgYW5kIHR1bmluZyB0
byB0aGUgYmFyZQ0KPiBtZXRhbCB0b29sY2hhaW4gYW5kIHRoYXQgYWRkIHBvc3NpYmlsaXRpZXMg
dG8gYnVpbGQgbm9uLUxpbnV4IGZpcm13YXJlLg0KPiANCj4gICBSZWdhcmRzLA0KPiAgIEFybm91
dA0KPiANCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBSb21haW4NCj4gPg0KPiA+DQo+ID4+
DQo+ID4+IC0tLSBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsNCj4g
Pj4gKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5taw0KPiA+PiBA
QCAtNTcsNiArNTcsMTAgQEAgSE9TVF9HQ0NfQkFSRV9NRVRBTF9DT05GX09QVFMgPSBcDQo+ID4+
ICAgICAgICAgIC0td2l0aC1tcGZyPSQoSE9TVF9ESVIpIFwNCj4gPj4gICAgICAgICAgLS13aXRo
LWlzbD0kKEhPU1RfRElSKSBcDQo+ID4+ICAgICAgICAgIC0td2l0aC1zeXNyb290PSQoVE9PTENI
QUlOX0JBUkVfTUVUQUxfQlVJTERST09UX1NZU1JPT1QpIFwNCj4gPj4gKyAgICAgICAtLXdpdGgt
Y3B1PWNvcnRleC1tNCBcDQo+ID4+ICsgICAgICAgLS13aXRoLWZwdT1mcHY0LXNwLWQxNiBcDQo+
ID4+ICsgICAgICAgLS13aXRoLW1vZGU9dGh1bWIgXA0KPiA+PiArICAgICAgIC0td2l0aC1mbG9h
dD1oYXJkIFwNCj4gPj4NCj4gQVJfRk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChUT09MQ0hB
SU5fQkFSRV9NRVRBTF9CVUlMRFJPT1QNCj4gX0FSQ0hfVFVQTEUpLWFyIFwNCj4gPj4NCj4gPj4N
Cj4gUkFOTElCX0ZPUl9UQVJHRVQ9JChIT1NUX0RJUikvYmluLyQoVE9PTENIQUlOX0JBUkVfTUVU
QUxfQlVJTERSDQo+IE9PVF9BUg0KPiA+PiBDSF9UVVBMRSktcmFubGliDQo+ID4+DQo+ID4+DQo+
ID4+IC0tLSBhL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsN
Cj4gPj4gKysrIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5t
aw0KPiA+PiBAQCAtMjgsMTEgKzI4LDE5IEBAIGRlZmluZSBORVdMSUJfQkFSRV9NRVRBTF9DT05G
SUdVUkVfQ01EUw0KPiA+PiAgICAgICAgICAgICAgICAgIC4vY29uZmlndXJlIFwNCj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tDQo+IHRhcmdldD0kKFRPT0xDSEFJTl9CQVJFX01FVEFM
X0JVSUxEUk9PVF9BUkNIX1RVUExFKSBcDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAt
LXByZWZpeD0vdXNyIFwNCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFibGUtbmV3
bGliLWlvLWM5OS1mb3JtYXRzIFwNCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFi
bGUtbmV3bGliLWlvLWxvbmctbG9uZyBcDQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIC0t
ZW5hYmxlLW5ld2xpYi1pby1mbG9hdCBcDQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIC0t
ZW5hYmxlLW5ld2xpYi1pby1sb25nLWRvdWJsZSBcDQo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLWRpc2FibGUtbXVsdGlsaWIgXA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAt
LWRpc2FibGUtbmV3bGliLWZzZWVrLW9wdGltaXphdGlvbiBcDQo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIC0tZGlzYWJsZS1uZXdsaWItZnZ3cml0ZS1pbi1zdHJlYW1pbyBcDQo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1uZXdsaWItc3VwcGxpZWQtc3lzY2FsbHMg
XA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWRpc2FibGUtbmV3bGliLXVuYnVmLXN0
cmVhbS1vcHQgXA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWRpc2FibGUtbmV3bGli
LXdpZGUtb3JpZW50IFwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFibGUtbGl0
ZS1leGl0IFwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFibGUtbmV3bGliLWds
b2JhbC1hdGV4aXQgXA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1uZXds
aWItbmFuby1mb3JtYXR0ZWQtaW8gXA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWVu
YWJsZS1uZXdsaWItbmFuby1tYWxsb2MgXA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAt
LWVuYWJsZS1uZXdsaWItcmVlbnQtY2hlY2stdmVyaWZ5IFwNCj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgLS1lbmFibGUtbmV3bGliLXJlZW50LXNtYWxsIFwNCj4gPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgLS1lbmFibGUtbmV3bGliLXJldGFyZ2V0YWJsZS1sb2NraW5nIFwNCj4gPj4g
ICAgICAgICAgKQ0KPiA+PiAgIGVuZGVmDQo+ID4+DQo+ID4+DQo+ID4+IEknbSBub3QgbG9va2lu
ZyBmb3IgYW55b25lIHRvIGRvIHRoaXMgZm9yIG1lLCBqdXN0IHdvbmRlcmluZyBpZiBhbnlvbmUg
aXMNCj4gYWN0aXZlbHkgd29ya2luZyBpbiB0aGlzIGFyZWEuIElmIG5vdCwgYXJlIHRoZXJlIGFu
eSBzdWdnZXN0aW9ucyBvciBhIHByZWZlcnJlZA0KPiBzdHJhdGVneSBmb3IgZGVhbGluZyB3aXRo
IGEgcG90ZW50aWFsbHkgbGFyZ2UgbnVtYmVyIG9mIGNvbmZpZ3VyZSBvcHRpb25zIGxpa2UNCj4g
dGhpcz8NCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdA0KPiA+PiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZw0KPiA+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGkNCj4gPj4gbmZvL2J1aWxkcm9vdF9fOyEhTnB4UiFnNXM2
S2V6eXNGNDc5Uy0NCj4gUzdQcU93OWVMeUdwZlJCS2xjNkx3TTZlcnZVeVNKbg0KPiA+PiBxVnly
UDVwZklRWDJ6cUVpQzNxS25HaFVScTMxLTN3YmMkDQo+ID4NCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QNCj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW4NCj4gPiBm
by9idWlsZHJvb3RfXzshIU5weFIhZzVzNktlenlzRjQ3OVMtDQo+IFM3UHFPdzllTHlHcGZSQkts
YzZMd002ZXJ2VXlTSm5xVg0KPiA+IHlyUDVwZklRWDJ6cUVpQzNxS25HaFVScTMxLTN3YmMkDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
