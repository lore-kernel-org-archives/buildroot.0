Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCFAD44D53
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F59A80A83;
	Wed,  6 Nov 2024 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COBPvliu7aTb; Wed,  6 Nov 2024 11:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78D2F80A8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D2F80A8F;
	Wed,  6 Nov 2024 11:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE5D27D1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 11:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75F7A608C6
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 11:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0u6EfB5LUDL for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 11:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61e;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80339608C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80339608C8
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80339608C8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 11:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G16tuywenZ3MQph2l9OokpultbIVo7YgfTfAev9auotO7bqT/p+NctY/eKCVRi/hgmUjI31uV6oC/5dOZCMwNA+nHuPgZS9MQ8LJFvTal6yQrJuXs0DKOFQla66vFM8McoLdsPKRIPsTJcEYwlC4RWqPMalEG9zKy2l+4hz2Qd1MHD6Ds1iN1uXIGd5/gnTeykTglFz56pRUTQxJZjvIcWWRkpgl5IIPNt9nuu0T4ONqBMApPO2cgt2vRJY7JCb4mkF4i9jgl/SyCDLoCWEKXR56W8w4+EvPf1Li+3KC/kuaZsW9s1CFkK46rJT5whqzdzTtfD8M28Mn2jAnjasjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHa33KzM5mZvAlCNnCNGMTR7JGZA/9xeW3U6bX+Seu8=;
 b=o54LhNMf2LJjj0pGLkO9c//lpDKlw3sdTA2TOLZKBDYMIiXA/BhC9bg3Y/IwQPW7/wJG/60f4+oFaeZF5zqcau+I+Ju+2D8LjomjSTbPEs5z9py6EKzGcWZw5/D4dZa5gt767suxByT/4PzYqHDgK7i47wGuzH/m/h9xKd65g6oJdtDeyVnzF+0cOUhztJrqlGJfwTTaqDnnIJYrwWd0yBS57Yf/o6vvvFt09vwb43gpucqDZXP+jr6jffsozRxlW1h9MuJJPXfMdkp/Ix+vbKZIBpeA+C5pUOe+85BiBVgoqyOQAVrPQq31TZLIUy2lG4NZ5hhSjlCxhVJ+Lp594g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Wed, 6 Nov 2024 11:34:32 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%3]) with mapi id 15.20.8114.032; Wed, 6 Nov 2024
 11:34:32 +0000
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH 0/3] Fixup Update Gateware Feature
Thread-Index: AQHbJGw4c0nK8RTyLk2eugvQf5yxVLKqN50A
Date: Wed, 6 Nov 2024 11:34:32 +0000
Message-ID: <b942d8f6adfcd6de07b48bd2a1eb16177c7cf10d.camel@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
In-Reply-To: <20241022102426.220196-1-jamie.gibbons@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|PH0PR11MB7447:EE_
x-ms-office365-filtering-correlation-id: ac190e61-ff83-4917-5470-08dcfe56fba1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?elo4bUtpZEtpV01yMHpYMlVmRkt2RUd4TG03Ri9Ga3VWV0hoUldNdmd3Rk1n?=
 =?utf-8?B?R2xrR1RZcGl3OTFSUExWT0IxRUdqRnM4dDd2MUdCQUgxTTk1c3RZN2dlK1FP?=
 =?utf-8?B?ZzAwaG5XQ0Y2NVErT0U5UUhQelZDOEdBK21MVkVFRk90d25yV0RRQXAxcG4w?=
 =?utf-8?B?NHRtREt6b2hJb2lsUnVROGVuMEdGQ1NOTE9nY0d0by9hV2hQRjhzZlQ1SjU4?=
 =?utf-8?B?U3BYNXZjbEtqaldMNFVFTHdzZ245bnlIUGJzcGdnSmxBdUNsLzFUN0FtMXdj?=
 =?utf-8?B?SVR1Y1J4SitXK3pYUlFVR0dOMWRBdkJ0NTdPdHNNdjU3MXo1TFBnUHhob2xt?=
 =?utf-8?B?dnQxY0JwY3MvWHdacGdXd1NKa2F3STBUUlR0N1hIbS91S281Z25MZWRsZEF3?=
 =?utf-8?B?RkNZWnBDZ3FhdTVnOEFidjI3K1Ayc3lodXZVck41NFFnQXFLTEp2a1hmc2JX?=
 =?utf-8?B?RWV5UUtPb0RweklOYk40T2xJaTJFb3JhbmNwZGd3Y3cxNGFyODBVVHZsdnJR?=
 =?utf-8?B?TTN3YWtub0JUVEo1SitDYStOM1Z2UElZcG0yUlZybkJjRmdaMWN5aE9GVG55?=
 =?utf-8?B?SGRyZ0s1RDNEdk9MQW5sRTZHMEN4OHIvWFIyNjlIRlJlYnVzVnJXc080YUo2?=
 =?utf-8?B?SW5adnVVQUR1NDJ1cnZTQ2lxczZ6S0swaG92SWFhZmt2K2dRUmpiUWsxTVZ4?=
 =?utf-8?B?OXBpUVRydHhhcGhFdm1qazd0YkY3SWhZT0xObERIZmZXQ0dYUVMzR2l0aWJW?=
 =?utf-8?B?QlR1ZlB5VW1Ia1Vmc1dBVUowc3luNHJmalo1c29SbVFxUlprTnZTK2E5UGxQ?=
 =?utf-8?B?ajFaRVJadVRpbElxK0hsdWRWTjV6RlNUd05PREd1b2krcXZQZUZzNCt6OTRN?=
 =?utf-8?B?UzRPempja1NRVnFGUzVacXZQU0E3Um1PL1E3YmxHUm9EM2xOek1ueEp2MHFw?=
 =?utf-8?B?M1VuMmNJODZMSnVtK2h1N0VUMkxkWUNaTC9YSlpPa1B1clVlWnE0ZEpuYTZC?=
 =?utf-8?B?WVE1WC82dUw4SWV5UnlFMTgwMWlNRGwxdHQyQ0h3K3JpRW54bk1JZEtJWmZD?=
 =?utf-8?B?dnlWQmRTN3d3dkl3ampTYzFWR1BQNEtLSThYN3BXQzZOM1BUNHM5M0c0Qmd0?=
 =?utf-8?B?SFd1ZElTTGJQaXVBaVR1a3FhREJEWC92UWFlRldGNTRQZ2J1a0U5bHRiMmpO?=
 =?utf-8?B?TWtaVWozRkFSTFBFZkt1UVhtT3lobTVTTXk1UG04eHlWSzlnVHVVY1BmMkdy?=
 =?utf-8?B?YzNRSHNEYTZhTzhGekdOWCs5M2g3aFVsKzBGemxYQ2x1Sy9pVmtIMVdyck5G?=
 =?utf-8?B?enBndnhYenRWdTRYWE4zVzY3SzYrb3JIejhRUWwwbUV6R2ZMc1RCSmZNL0k1?=
 =?utf-8?B?d1gwcDByU1Vzb1N3TU45czBXZGxjbDlYWEhaL0ZNbi82Smg1cDI1anRCSlRQ?=
 =?utf-8?B?ZlR3eXU5VTh6U0ZLR0VmRHFtNWMzcTQ3RUNoUlk2SXlOU1Q0cTJSOVl3RTR4?=
 =?utf-8?B?enFUazRCVlk5RlJwSjYvcGxlUkZaWTFJRGdvaGUrcU85L290REdXZlROUkJF?=
 =?utf-8?B?YnN2MTUrK04xbUJ2QTMwaWZwUlhVRWZHOVFSeWFwRk5nYzg2Sk9qK2V5MUZx?=
 =?utf-8?B?MDVwU0d5VWQxblYreThXQUNLS040YjQ2N21kL3FwSjF4c1l1ZStPUDloVk00?=
 =?utf-8?B?bzA3OVBJSmcxL2xERTV1d0dkbS9EWDV5M2thL3JwbHlXOHlSaUdSTUpQQ2dw?=
 =?utf-8?B?QTFnVlNjSmtDcDlFakt0OTkvRGZ3UlBqK0hCWmVhdlRrT3pnZjRaOFdkRkg1?=
 =?utf-8?Q?OHRpstzIo8gu/aUxXYiMRdfTrUfF02whTI290=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUx6akk2aTZrZ2RWT2Nac2VJZ001YWl3bTR6RVJsNk5zOExKRVgxTEllN1Yr?=
 =?utf-8?B?MFhJK2huWml3MkpuU3JrWlg1bWtGeDdTOHRsTHM5WEJmNzFrMlZhNWtmNzZ5?=
 =?utf-8?B?NytRN1JNNjlmYkR1MjRDbWtjN2lkMEo0STl5RmZhRzBzdk5OSmg4djBJMjQv?=
 =?utf-8?B?NmJ0K0MvQmlneEFRYmk4OERlaTNQS0ZsVTFqZXRrQ1ZrbnJCa0FzOXd5bjJa?=
 =?utf-8?B?L0RyelRTSXFQb2NFaEtSejNuUmIrcWtlQVMwc3JMOGlkNEdzZXFrZVhBbkcr?=
 =?utf-8?B?bEtlcVFvbEVWZ3VLdkFBSmMyUzRjdllVZXc5eDAwSHZ3elRJeGV3eFV0UTMw?=
 =?utf-8?B?WWhnZVlmZzZoVmx2TkxZcHRLdlBPaE9lVUx6TEtCT2ZMQmVwMjVEWXdXSGZO?=
 =?utf-8?B?ZGxlWHg5ZmNtWnZpNHFObW1HSG1KOHJRRjk0YW41M0djZjBJc2FOWG0zSUJp?=
 =?utf-8?B?OE5XcEJ4TkU3QW5kc1FIMW5FZTBtRWcwQkFFVW5ERHBFS0gzVHFEaytzcnhL?=
 =?utf-8?B?QjJSVGRqb0ZYOG1iQ29tRWplTkRJbXpEaEpIL1ExNXpSeDNVdkJOK2xRWEI1?=
 =?utf-8?B?Rkgvbk1JbHcySnR6alhHRklZQ0JYWVdWcVJqdVFRTjU0b251eVJCZ1FGbE53?=
 =?utf-8?B?RmozNEczZU9KT25FRXhxdU5ZSStTb0swZVEwV0dDMW1FSUZLRVBKRkVLOHNp?=
 =?utf-8?B?QmEzZkV3d1ovRlN1VDdoY21TYm9hWVBWSGNqOVVtSXNaOWNkdlJmWHNzajNz?=
 =?utf-8?B?M1BCM1VkVmpmdGxSS0lEeWhCc3hsZjBFZllENDJkRlZLUWZtSEQ3NzkwN0Q3?=
 =?utf-8?B?bFQ0aGJjZ0dMVGd4M1VseTVhQTllZWV5TnRIWjJhaVM4RDBKYjIrYTFTKzZE?=
 =?utf-8?B?M0prK25HVXAzT1pyR1JoTUFRbk1XdnQ0SkxLeDQ2cmpMTmdWWGc5alJSTWpQ?=
 =?utf-8?B?ZG1WS1U2MWJRdGhDNVFKZ3REdjJKdURGTUNKbEl6WUdQM3JmMmVSWEtBT2Rz?=
 =?utf-8?B?YlE5MmpRRC9ldEVadzB6Q3lXWi9JM29LLzBaL3d4TURtbG1EN3YvTUJlc2p2?=
 =?utf-8?B?VW9KdEVlWUFEZ0JxTlRRc3BpYW4rd1FGb3ZoeXRTWUI4eGlaVW1aMWl2TDBK?=
 =?utf-8?B?V3B6bVhjOUFwalN3SGw1TXpXSTRxcGhFWjZOVS9WWG1oWWZGVlBndFYvTzJo?=
 =?utf-8?B?T0dkbThXS0JOVnVQOWNESnpzZks2ZEFiaTNZN08vVWdRaEpxTXZ6ZEQvZzZH?=
 =?utf-8?B?dHBDdjBtRk5hVlJNbXh5OWJ0VnVvdmZQSTVJaVVKUGM5K1I1UlJyenRnelVa?=
 =?utf-8?B?ZTJDUUZSRllTWjJ3aGxvc1JHTFZJTWtpUmRsMG1oZTFGa3NoeDMxS0YzL0xw?=
 =?utf-8?B?Mjg0SWVCZW9ZRlRZbVVzTERMaG9YZTJNOFByRUk2bVVBL3YwYjFRNHR3VlFY?=
 =?utf-8?B?eE9FZHZVSlZuRVZDMUZ0SUxqakRqVXk5bHYwSFdpd0RBbkowSklKWk43cEtD?=
 =?utf-8?B?alhYMVZDcDdqbkFCdm5CUHY2cTlGbEMwc3pFYU9FV0VVaUlDTU9iZEJtejJz?=
 =?utf-8?B?MU1penF0ZVI5NlBzM1FIMEJnN0hhZVI0QitZUFZBL0s2T3IvSXBKbDNsSlNM?=
 =?utf-8?B?OEdZOTZNKzJhQ0FIQlhjdXNZajdkeG1rSU9jdzlZQ3J3Q3RZa2RyU0VranVz?=
 =?utf-8?B?ZDdpVkdsbGtONmM5dmFIV2VwWGdtWkh4VG9pMkZCZlJpbFd3UXVVdHBHS1Zw?=
 =?utf-8?B?MEh1eWZkc3dLSW4waGVkL0ZnRHpXN1FoYU5udGJRemFOYzBNUG1CRmxwMFNZ?=
 =?utf-8?B?SS95SFRWMHcvNHl3WEJRVmkveWFnSXV1WW03NFoycGhveXJVaWVuWXQ1aEVK?=
 =?utf-8?B?Z0UvQTdXSkNHY1lCWE1QZnJ5Qzl4OEdwY3hWcmh3K0hyRnQyNHJBZldkUDdu?=
 =?utf-8?B?U3FUNGZuUGdkZ0FhTGFSUExUWUw5T1JDWWxyRDlzTXh6T3NFaVo4bGNVNXUw?=
 =?utf-8?B?cWFBODlWSktHV0tndUp2ekRvZC9TY216RlIrY092UU5jTG41U2UwMWFHSjBy?=
 =?utf-8?B?TmQ2dlZtbXVuaGlYbE55am1DYWZjL2VxeW52MzFXNmVpWTBDRE5pWDIzMCtk?=
 =?utf-8?B?a2w1UW5ScHRyaHk0SWRCNnE2UWN3K3dxWmtZUFF5ZWRaWWFBbndYSXloUWVx?=
 =?utf-8?B?bmc9PQ==?=
Content-ID: <102CCE9CA7FEB740A0FA03D3B49A9094@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac190e61-ff83-4917-5470-08dcfe56fba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 11:34:32.1754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/tYSGhvs5qh9Ov4jzyrX4fO/oMxl2Hrp8XLqYfaWJRqEPtIjnfdgB6j640FVtRETdFejtaXXTpoI5vKKiypOv8AmZf6P/cBCoWK7y1O8Sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHa33KzM5mZvAlCNnCNGMTR7JGZA/9xeW3U6bX+Seu8=;
 b=Ag2tEjXMMAaR8XMoZAjPd+dFkWfqPP4eWHnmfNrVfaWg6B9jENaGoBow/vp9a76bGMEW0u+jwKA8PHnFpuRZ2ISGPFZS0cpHbuS/EYRg+wZtzzwBgx03tjrhcpWWH35fXHWZOj4a+o1l6+XjXfIWfynobhGKPcfF511LR+EGbZNfyDyY6eit16Vcqr8quGqzwA0Ut9ivkskj9NeCz0oM0mzJxFET4gc1WMiCB9VOqwmy4VDFq33W2NQdcQ8E/4ryGlf2epcaTpyn55wm0CIBhZk3xEuKv5o8t4ibjT7loRkvqGahCtEAjLw8nHur73otuag0xKtKfejjrd+VqTFi1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=Ag2tEjXM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 0/3] Fixup Update Gateware Feature
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMDI0LTEwLTIyIGF0IDExOjI0ICswMTAwLCBKYW1pZSBHaWJib25zIHdyb3RlOg0K
PiBIaSBhbGwsDQo+IA0KPiBUaGUgZm9sbG93aW5nIHBhdGNoc2V0IGZpeGVzIHRoZSBnYXRld2Fy
ZSB1cGRhdGUgZmVhdHVyZSBmb2xsb3dpbmcNCj4gdGhlDQo+IGFkZGl0aW9uIG9mIHRoZSBmaXJt
d2FyZSB1cGxvYWQgQVBJIGluIGxpbnV4IHY2LjYuIFVzaW5nIGRlYnVnZnMgZm9yDQo+IGZpcm13
YXJlDQo+IHVwZGF0aW5nIGhhcyBub3cgYmVlbiByZW1vdmVkLiBUaGUgdXBkYXRlLWdhdGV3YXJl
IHNjcmlwdCBub3cgbWFrZXMNCj4gdXNlIG9mIHRoZQ0KPiBmaXJtd2FyZSB1cGxvYWQgQVBJIHdp
dGggc3lzZnMgYW5kIGVuYWJsZXMgYXBwbHlpbmcgb3ZlcmxheXMgZHVyaW5nDQo+IGJvb3QuDQo+
IFRoZSBSRUFETUUgc3RlcHMgZm9yIHVwZGF0aW5nIHRoZSBmaXJtd2FyZSBoYXZlIGFsc28gYmVl
biBvcHRpbWlzZWQsDQo+IG1ha2luZyBpdA0KPiBlYXNpZXIgZm9yIHRoZSB1c2VyLg0KPiBUaHJl
ZSBjb25maWdzIGhhdmUgYmVlbiBhZGRlZDoNCj4gCTEuIFdoZW4gYXBwbHlpbmcgb3ZlcmxheXMg
YXQgYm9vdCB0aW1lIGFsbCBkdGJzIG5lZWQgdG8gYmUNCj4gY29tcGlsZWQgd2l0aA0KPiAJdGhl
IGAtQGAgZmxhZy4NCj4gCTIuIFRoZSB1cGRhdGVkIHVwZGF0ZS1nYXRld2FyZSBzY3JpcHQgdXNl
cyBgc3RhdGAgb24gdGhlDQo+IHRhcmdldCB0byBnZXQgdGhlDQo+IAlzaXplIG9mIGZpcm13YXJl
IGZpbGVzIC0gYWRkIGNvcmV1dGlscyBhbmQgaXQncyBkZXBlbmRlbmN5DQo+IAkoYnVzeWJveF9z
aG93X290aGVycykgZm9yIHRoaXMuDQo+IA0KSGkgYWxsLA0KDQpBbnl0aGluZyBob2xkaW5nIHRo
aXMgc2VyaWVzIGJhY2sgZnJvbSBiZWluZyBhcHBsaWVkPw0KDQpBbHNvIGEgcmV2aWV3ZWQtYnkg
dGFnIHdhcyBzZW50IGJ5IG15IGNvbGxlYWd1ZSBob3dldmVyLCBtYXkgbm90IGhhdmUNCmJlZW4g
cGlja2VkIHVwIGFzIGhlIGlzIG5vdCBvbiB0aGUgbWFpbGluZyBsaXN0Lg0KDQpSZXZpZXdlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCg0KVGhhbmtzLA0K
SmFtaWUuDQoNCj4gDQo+IA0KPiBUaGFua3MsDQo+IEphbWllLg0KPiANCj4gSmFtaWUgR2liYm9u
cyAoMyk6DQo+IMKgIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZTogZml4IHVwZGF0ZSBn
YXRld2FyZSBmZWF0dXJlDQo+IMKgIGNvbmZpZ3MvYmVhZ2xldl9maXJlOiBhZGQgc3VwcG9ydCBm
b3Igb3ZlcmxheXMgYW5kIHVwZGF0ZSBzY3JpcHQNCj4gwqAgYm9hcmQvYmVhZ2xlYm9hcmQvYmVh
Z2xldl9maXJlOiBjbGVhbnVwIGdhdGV3YXRlIHVwZGF0ZQ0KPiANCj4gwqBib2FyZC9iZWFnbGVi
b2FyZC9iZWFnbGV2X2ZpcmUvUkVBRE1FLnR4dMKgwqDCoMKgIHwgMTMgKy0tLQ0KPiDCoGJvYXJk
L2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9ib290LmNtZMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+
IMKgLi4uL3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNowqDCoMKgIHwgNjUg
KysrKysrKysrKysrKy0tLS0NCj4gLS0NCj4gwqBjb25maWdzL2JlYWdsZXZfZmlyZV9kZWZjb25m
aWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKw0KPiDCoDQgZmlsZXMgY2hh
bmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pDQo+IMKgbW9kZSBjaGFuZ2Ug
MTAwNjQ0ID0+IDEwMDc1NSBib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0K
PiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+IA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
