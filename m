Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6911DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 20:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1000570965;
	Fri, 28 Feb 2025 20:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugf7Wyy2JKgY; Fri, 28 Feb 2025 20:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3C071CF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3C071CF5;
	Fri, 28 Feb 2025 20:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4239368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E224C8576F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8qEFQbTEjeh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 20:30:39 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Feb 2025 20:09:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE56B811E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE56B811E1
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::60e;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on060e.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::60e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE56B811E1
 for <buildroot@busybox.net>; Fri, 28 Feb 2025 20:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=EL0c/PUGyFBBDWiv0z/qVh9G62oj0XqZaob012+SZfOFj2gCipoB/mUsMX/KW6uxwCwL7kQuCiZQLwUU+axsHajS8CbkNTHuRP1GS5QvoNo9CLGxJ9+Q/43cuvXv76Lte0sxlf/IgONFn5YBmzSWxJboApecdLBUjd0fBKp2n5d26Bb9kpY243vQ9nsO7/ViPUh0xq5rHF+y2DwdjT4WGWWAMwYNuuRbdFv3183/LBmXKW+9awedq53XG2yBMUVbFd7j5oh+Si5HVrRD6TxcxOpAwEEf931DW4ynLWzqCHbcNNsmeTI3uOujIxP6pCYvTsqILPwpvSYJBZz4fGK/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phjv+WYfqWQnVckTCrl/wvdIlhRzM7i13Kznvoy01uQ=;
 b=mk9EtoBnAxP37gcDHrxfDwv60JbNEtfFZAP47bayuFpX0GFsHwASIwPiGr33ZBdlW6ypqaJdljn1RXPX4M48LcGwkZC6JIudUCIlGA1AGzLcz2Tbe2BR0OLpBZE4EODIt6dZHn0RsuL40dsT2quHB3jkRmccKYIlGKCKTuzRnth6rJasoHbwpg26xS19dATtm6ltt6rpnHWzrVeIdn1YmVD8fVjcyVxtiU/niKrliFmPcdbOxwZ4rKdmqlwO5Utr12zBoRGR6RDs5z1sSvCOONiYudzEFUH/g5VJaVLge8U7lbiLFv+KEN/uCQCu8GR41cQ6u3WrrrfflX1WDy6l5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1115.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.22; Fri, 28 Feb
 2025 19:54:01 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8445.022; Fri, 28 Feb 2025
 19:54:01 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Oscar Gomez Fuente <oscargomezf@gmail.com>, "buildroot@busybox.net"
 <buildroot@busybox.net>
Thread-Topic: [External] - [Buildroot] Add dtoverlay and dtparam commands for
 raspberry pi testing
Thread-Index: AQHbigXdK7H/OkaJT0yEoSDEtk//W7NdII1A
Date: Fri, 28 Feb 2025 19:54:01 +0000
Message-ID: <PH1P110MB16033A6C677A38662EDFD1F09FCCA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <CALtfCQavKpSmec4tGcHedzQ+Uw7JBs5n-+_1EB0b3CjOJPKa3w@mail.gmail.com>
In-Reply-To: <CALtfCQavKpSmec4tGcHedzQ+Uw7JBs5n-+_1EB0b3CjOJPKa3w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1115:EE_
x-ms-office365-filtering-correlation-id: a992965f-e7a9-4d64-fdf4-08dd5831a5d9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|41320700013|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MGUzZWRMaloxOHg4eGZxeTVpR2cyekVLNTQrUUZaY3BZS3R1YmNPc2Z6cDA3?=
 =?utf-8?B?Z05qN2o4c0t4R2hTd1huTEQzenZRVnV4R3E5eXJ6cHFoOVExaEk4RGZmNUpt?=
 =?utf-8?B?RnFDeWpZc2N5N3hBMU5WVmxQaU1hQXFBa0kwSjFseXBLRWxnVGovbWdUZ2ds?=
 =?utf-8?B?VU5tUzI3bTN3UmtCWjN5S1JuaWdOME1VampaZDNSd0hIS2VVSHF5Sm8velBK?=
 =?utf-8?B?QWVIN0Fka1hXak1La0tLQ3JMaGlzdzBlSGZBRGpzclRNemVDUzhpUkc0VEdB?=
 =?utf-8?B?SjI0czFta0RDb0JCNUZQYlVGbHJFZk1wTkFVRWhSWlU3KzAva2lJWWRyMjNr?=
 =?utf-8?B?bVExWjhPNndBMXFVZjgyaVZ4dlIzelZuaUJpYmdXMTZiRUgrRzh5SUVKRXRR?=
 =?utf-8?B?NE1HNDlza25aakxVeDNRMlJFNlNBRWFJdkd5ZkM2aERhN0ErWE1oRlNHRDRT?=
 =?utf-8?B?dkljaWRBZjVySGdiV25xOGlRYkc4bmhiczBBTjNoWlk3SFJqMTlHbzlmcVJI?=
 =?utf-8?B?OHUrOFpLWUc4L2tJUTkrMVl3U1Bja0dIaFZnWCtQSW5UelJpcEJGRWd1Smxs?=
 =?utf-8?B?TWZTZVhDcXN0eHREOUtya1UvUUt2T3BsYktHT3E2UDVLdVIrMllXTGJhR24z?=
 =?utf-8?B?TlBVUVNsZ0FvdEVIeW5pb200bDVjUHJiS09lSElHckhFZWxxcFZjczdLUXNH?=
 =?utf-8?B?WXNBbVpTRGtQQVgveGIxYjBQTkxVYzdxZTc4TUlxWG5XYmpuTXZzbk9mSG9Q?=
 =?utf-8?B?SzZnOStmYTR3N2JsbjBuSm9JSVJnOVNSYW5tZlVZRVBvYlMzWi9paUhhZGR4?=
 =?utf-8?B?ZG0wN2JOSk1kYTJVMFl5NHF2U3d0MTVKWlloY1VYMFovVGNYMTFaaXlKTlZX?=
 =?utf-8?B?UjA4SjJCbXJld1AxM1E5TWkwc2RjeEMydHVYV2k3WnZPT0RpS2FrM0R5V2xG?=
 =?utf-8?B?SElCZzEyZjdXOWNjaGdaMUZONFp5V2w1STZBYWFTTm00QWYzdDlwbUdtNWhh?=
 =?utf-8?B?WngrdTg2c25uZkFVQU45eWFNb0wxc1hjK0RnUnNQejNrZmtWRWYyaC9RcXVQ?=
 =?utf-8?B?UU9NRmR2S00zNGx1b0krdC9OblNoQ2hHb3RGTTZPWHI4Z1VhZG4xUm1mRE02?=
 =?utf-8?B?bHlaQWgyQTJEWHQ5dUMwc1kycURGYXNMVHkvM3Z2bnpxNHdXKzNuVTluNnlR?=
 =?utf-8?B?R3BOaVFmOWZRYU1oNkhOTkF6ZUszVEZEVVkralU0dThJT2t4c0JJRVlueFlQ?=
 =?utf-8?B?TFBlSG4xR1BJeWE0Rmh1MmRJbnN4dDBGeHB6UG5Ddkk1eTVNaTNzRnlscFY3?=
 =?utf-8?B?QW9XenVsTEhBaklZeGpVNVNYOCtGTjFEck0xV3ozMGlJQTd4OHZjZUtXbHA3?=
 =?utf-8?B?NUpXWFRCNWpnOFRva09aUUYyTHI5REV4R0FYcjZ6TDNtQllrS2tIRXdrcHcy?=
 =?utf-8?B?ZmJPQjNSUDZPWmNWU2g2YThyeVZRSUp5K1FxZ0x3ZkVnaks3UGNHbGQxMDZC?=
 =?utf-8?B?ZGJ5NzRsWXFadFBLQWhWNVFSZjU2OGtGQ3haTk9qLytqa0JzdXJYTnRTejFk?=
 =?utf-8?B?YytpQzI5aTBuNStIa1hLMVQ1UVpJK2Y2U1hrVU1EcW5kNzJJeDdlRmVscDBH?=
 =?utf-8?B?bzVmd3hqWWlDRlhhVEw1akg3dlVFVEtLWHJzNVlQTEIxK3BidHRlSVhyYnpB?=
 =?utf-8?B?TkpIUHhmNVJWN0dpK0pjcTVJclVwMWRoZENHRE5iN0ViOVFxTWp4YXgyMDVD?=
 =?utf-8?B?M1lUWVFzV1MwWVErSTZESlpIOE1YRzd6cW9qN1gzQktSR3ZSMHhNOGFnMzRB?=
 =?utf-8?B?OUFIVy9zai9YSVRmYmVjOXFLTjFJaDJuM21VaGwxT0hWd2ZEdFEyckFmMnRv?=
 =?utf-8?Q?VYeklmdQyCHoX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUJaNDNnZmZERVR6UFhJdThnb2dBQkdCQWI0K2Ywa3FsWUV3QUVGZzFjd25x?=
 =?utf-8?B?YmFGOUoyb01BNjYwNUJBaU4xaXBYQzJ2UVJQTkVHMEhocXVhM1lwdUVONWZk?=
 =?utf-8?B?TTlxMGpjL0RBWnUyQjdrUGdhYm5xVlpKWGl2RHRESzFlRitpdm9FWWR2K0cr?=
 =?utf-8?B?Z0UrbUkxUWJqaERFcVc3RkdnTnVMZFRNK2hjc0hmZW5LMFIyMThiakZoM3dq?=
 =?utf-8?B?ZVZXNXUwU3BNdy9JdDhDSS9qMWRxekFIcllGK2pJd2o2ZGFEOGtoU3hOTHVW?=
 =?utf-8?B?TWZRNEoxbjZNSnhCaUovUzN0WmN4ZzlwMjVhTG52UW00SkE3UVNKdjBzblln?=
 =?utf-8?B?SXJ1TG56c3hzTzRFN05maWY4Z1BKYWkxeW1ldHMwOTFDRGhoNmdoWHVROEVC?=
 =?utf-8?B?RHVnWGpxYzgxRW9oeEhwQzE0WFM3Sm5KQjJTSkJDZW5iUHFzdiswVnJKMUZP?=
 =?utf-8?B?NFdWR3ZKQTJ2VlAzdjhidmFRRk1sT2xCSzltWkpkWENHekxaWGJ6MU9uWjRN?=
 =?utf-8?B?Q0JzeEhlQ2lvMnRFdWdXZ2EzTS9WK3Y5dVltZlN2YjJUQjFjdnVVZDZWTEpY?=
 =?utf-8?B?OThTVzNXRzJuUzZDTVJ0YVRleXNJRDBDVTVrQmlKRy95OGJvSkRaLzBzNGFZ?=
 =?utf-8?B?S1FVKys5MnpyaUowT3lCL3BXakQzUkJXSURHVnJabUFjNnVrVi9qQUlsTlVF?=
 =?utf-8?B?OVhRV01leU5TVkJ6ZkR6WlJxU1RkaU56YjR6MHpEYmQxSE1lK0pUbE8wUWZI?=
 =?utf-8?B?SzBoa1VDSlNjaHk5OHN6OUxJSEttV0dJalAzZGppNWNWQzRvMGdiVkJ6NXk1?=
 =?utf-8?B?Z1ZyVlA3SU9tak9tS3JjWlJLTTdYbjJZVmFrSTExUWY0b1Q1Ukl5R2ExVnFO?=
 =?utf-8?B?NWFmQTNoMWtyNzZzbWRvclVNajNQMCtmRWhLYm9TTHNtWnVMYldDOWlyTWFN?=
 =?utf-8?B?U2YxRmlFSjlnd2s1a2FIUFl5bXBxd3p3VXhzTXZFWVduMVo1T2JySUVoUmlR?=
 =?utf-8?B?VXRnMFp3dUx5WWRONm9DeENjenRraElDZENYNWU5NUg5WW92cXo0VXA2bGdO?=
 =?utf-8?B?VElRNWFxMStvWllpeGFVV0lWVW9RWnIyQnB3ZnR0ckg1S3FMUVJpYTBGZnh2?=
 =?utf-8?B?UHVIbVUreHZFUFpMYXpUKzlOVVpOZWZ4eE5rRDgvT3phTkZUU1ZiMzVXRStq?=
 =?utf-8?B?SmliNXQwSjdzSXpGeE04YUd6aU9rYlU5bGlBaTJFanAwNWhKbHdENG5FOFRp?=
 =?utf-8?B?TFhSRk5xaEt0WDJxU2lXejZOcDl0RmFEbGxsOCtuZFFJVjBTellkcXZjOVAx?=
 =?utf-8?B?ZWtvYUJqai9mS1pxZFA3dG54b1RZbVZxZWh2Q2piSGUwWFRZakovaUptM3N0?=
 =?utf-8?B?ZmpHN3A0MHRkQ2RDTm5WcXZsV1llc05qQkdhZEFaVmZtQVp1ajVjMDYyV29s?=
 =?utf-8?B?MWRzbUU0VC80R2kydVlpWmdxcHhaQmd2SkUyT3l1L3g0Y3FwOElIRjgrK29H?=
 =?utf-8?B?OWlxMkc5NVA0QWk0SGxwdmtPUnFmNU95azEvSEYyYXREZkdnTjVQYTBUOW1W?=
 =?utf-8?B?akFJb2MvNnNLdWtGdm90MUhJMlFOZ0xta1ZWWndSSVIzRjdtZ0Jqam8wSFQ4?=
 =?utf-8?B?YVI3RE83T0x4STVRK3lvQjIxQVI0MmhBb0kvMWhXMnd5S25kSlBMVEFQWmdG?=
 =?utf-8?B?MlNUeGYvdDJUQXd1SzRxcFVEb3lFSWJVMHYvTzIrWEpBSkVndW5PTDQzWGlW?=
 =?utf-8?B?TjB3UzBmNFB1Nm8wd1pyVURiWUNKN3FPSlgxMFIza3pMcG9LR2drUExxV3Iy?=
 =?utf-8?B?dXkzVEwyQTMyT0x4SzZJMTBlSVhYMWc2VWlwQ25VOUxUTlVhVkNMWkQzVXMv?=
 =?utf-8?B?MjhCb1NISlB0NlZQZmdrSSsrNmh2L1J4YXdDQlVucDZNWGNRQ0dYR3VsUE94?=
 =?utf-8?B?bUNnQU4ySzFPaEJtQUZ6NENoWlFaNW8xM2pydDhpc0FFcFl3Z3FnVDlKeUhi?=
 =?utf-8?Q?S7c/B+BVD6bVgoadPo6I8KAFZl6RUM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a992965f-e7a9-4d64-fdf4-08dd5831a5d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 19:54:01.5095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phjv+WYfqWQnVckTCrl/wvdIlhRzM7i13Kznvoy01uQ=;
 b=s7e8SAHr+efdTOeHsWE0Ba1kmjVpQlFvF1nXfqTACJciDxqDhqGFxBJvjsJep2GfNLvnSFvQWVxrDRCiGWFSPD4uEhEjuPNGPeQQ4ZxR1Qa/Ce5Qm+zQaKVhbL6HR5BwsxL8hSBCXCBC8lFfzMRsHctHSSbh0TScDHEPl6Tp2nJzUBw6m4GYSOi5XnJLwYVer1FLvTYC8E4013dGWhnY+JfFcmFbR2LdEAwwB9r1Lm+qlGvWsWJ9F/AqDx3yzcAtUjBSzq8CQXBFKvkTRiekXjo1nCVp56Da5O6jhj1pkmZYkLO2eEBtz5oyaYk/OZCyBXbg2fhFMal+v9oh7Pb45g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=s7e8SAHr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Add dtoverlay and dtparam commands for
 raspberry pi testing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T3NjYXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYnVpbGRyb290
IDxidWlsZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBPbiBCZWhhbGYgT2YgT3NjYXINCj4g
R29tZXogRnVlbnRlDQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjgsIDIwMjUgMTA6NTkgQU0N
Cj4gVG86IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldA0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW0J1
aWxkcm9vdF0gQWRkIGR0b3ZlcmxheSBhbmQgZHRwYXJhbSBjb21tYW5kcyBmb3INCj4gcmFzcGJl
cnJ5IHBpIHRlc3RpbmcNCj4gDQo+IEhpIGV2ZXJ5b25lLA0KPiANCj4gSXMgdGhlcmUgYW55d2F5
IHRvIGFkZCB0aGUgZHRvdmVybGF5IGFuZCBkdHBhcmFtIGNvbW1hbmRzIGZvciByYXNwYmVycnkg
cGkNCj4gdGVzdGluZz8NCg0KSUlSQywgSSBiZWxpZXZlIHRoZXNlIGFyZSBwcm92aWRlZCBieSBy
cGktdXNlcmxhbmQsIHRob3VnaCBJIHRoaW5rIHRoZXJlIGlzIGEgcmVjZW50IHBhdGNoIG9uIHRo
ZSBsaXN0IHRvIG1vdmUgdG8gcnBpLXV0aWxzIHdoaWNoIGlzIHRoZWlyIG5ldyBob21lDQoNCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gw5NzY2FyIEfDs21leiBGdWVudGUuDQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QNCj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290DQo+IENBVVRJT046IFRoaXMgZW1haWwg
b3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNr
DQo+IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNl
bmRlciBhbmQga25vdyB0aGUNCj4gY29udGVudCBpcyBzYWZlLg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
