Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C086CC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 706DC400F5;
	Mon,  1 Jul 2024 21:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvCMu9cIgBBu; Mon,  1 Jul 2024 21:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D0DB4012E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D0DB4012E;
	Mon,  1 Jul 2024 21:13:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F69A1BF329
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0658F40953
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 21:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYW1cRU-mFwR for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 21:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=andy.a.kennedy@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC31A40043
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC31A40043
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC31A40043
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 21:13:02 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 461Kf6Wo010179; Mon, 1 Jul 2024 21:13:02 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 403xc7kwkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Jul 2024 21:13:01 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 461LD0SO025725
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2024 21:13:00 GMT
Received: from UUSALE2C.utcmail.com (uusale2c.utcmail.com [10.220.63.38])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 461LCxvC019502
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2024 21:13:00 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2C.utcmail.com
 (10.220.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 17:12:59 -0400
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 17:12:59 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by UUSALE29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 1 Jul 2024 17:12:59 -0400
Received: from SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:170::5)
 by SA1P110MB1294.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:194::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 21:12:57 +0000
Received: from SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM
 ([fe80::599:d4ef:2872:4990]) by SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM
 ([fe80::599:d4ef:2872:4990%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 21:12:57 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [External] Re:  host gcc?
Thread-Index: AQHay/qhY74806dKF0CWjlcHy8JLBrHiXeig
Date: Mon, 1 Jul 2024 21:12:57 +0000
Message-ID: <SA1P110MB1069473230CAA5795CA22850C8D3A@SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM>
References: <BN2P110MB1060371DE485BB6BB29E11DAC8D6A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
 <708a7766-b35c-4b94-ab28-21e53020f1f6@mind.be>
 <SA1P110MB1069DE425FCD67C56045A0EEC8D3A@SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM>
 <ZoMabkU62M2XlPZv@landeda>
In-Reply-To: <ZoMabkU62M2XlPZv@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1069:EE_|SA1P110MB1294:EE_
x-ms-office365-filtering-correlation-id: 104d074d-0047-4890-9efa-08dc9a1294e0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?WHdCWEorbTRETHZYdU5YbklLT3BVNUgxNHlBRUQrZnpqbXNVQ0taOFZOWTh0?=
 =?utf-8?B?ekF2enZ0UUZoYWFmcm82bFRyL0tCOTNPT3kwTnk3bFBPK0VCNmFtR2VoaTI3?=
 =?utf-8?B?Wk53WFI2U1N1UmlSOThLOCt3OGJ5S0N4MDZ2T3RPcEd6U2QvbnFDV3VxZm9Y?=
 =?utf-8?B?dmpYRm5zbW5OM3lZUmZja2liZm9oRk8vZy9kY0Y2dlk5cjFlRS85eFR2dG1q?=
 =?utf-8?B?WDQxcy8zQTZLVWVtN0M3OGkxek84T1Z3czBQbVdpbHcyWXZOR2U0L0dhK1A4?=
 =?utf-8?B?b0lSRTA5NzZmcXRTdHByNWR0VXNlRWg1TkVIT0tQajJ0ZTQyN0NJY3NLcWE3?=
 =?utf-8?B?TnJjMTJ6Ui9oRzhtUDdBMEJjeHoza2dnQk9aR2pTZXdwZnFhWmpBK3hnTEdk?=
 =?utf-8?B?NTZsUTByWWh4d3VjSWs1bmtRMHg3VU50T21hMDdoRDdIc1VsbG9lQVlKMUox?=
 =?utf-8?B?cmRaMTBIL1dCZWNSQXkyVk5JWUMzeE5wTGs5MTB0QXV3OWthTjRLTjcvY1oz?=
 =?utf-8?B?M1htYXVoVndQZ0tHNXV5N3hYZFpKK0lmaUxPSnVkQUszVHBQdWNWbm50S0ps?=
 =?utf-8?B?MURzUkg3WE1adHFMR1dKNjdwQWhUelFSVzl0ZFlPbHU1T3F0bmI0bWdydjRN?=
 =?utf-8?B?VGRLMFV3NXYxbzRLS2V5dzZmazlPbGZPMmtIdE1lYS9nNGlDcDVKODFRUFVk?=
 =?utf-8?B?YnBvcFRKNlUrRXRDZy9oRk16UFVtdzhJYXhqNHBXWVJZOG5EVDZLcFp3dW1Y?=
 =?utf-8?B?b0R3bTQvLzRYclU0c1ZOd0Q4R1Z0L1hGYzFKQ1hIZWRNV2xFS0VpMzl6Um5y?=
 =?utf-8?B?eHJHVHRKOEF2VEV0Mm9DNVkzUmlFQTFtRFVtUHdZYTV5VGxHRGI1alFkaTVl?=
 =?utf-8?B?eHhLSmk5R21mcWt2S21NV3RQekczUFU2ck1kaEtzVFNST0RUNHNrWW5pYWlw?=
 =?utf-8?B?NXVSUXlnY1l6cytwaGw5d1pkQkFabm1NVkM5Q3M1YTNodjUzMlN4bHlHTDd1?=
 =?utf-8?B?NWdRdDIyaFFmclhCcStkandNa3F1cDY2N3c5dndkRmZEMEpoMTZ2ZHoyWlJz?=
 =?utf-8?B?SjRWVW5ZVDZqaXZYb0ZlNHRzdjJQcHVNZlFTUFNoS05PbVo4Z2Q0RVVtVS91?=
 =?utf-8?B?UTJ3cW9IZ2M2TytFM0NYN2MyUzRwQXZVTWxoWER5MFZkakVWZmh1S0h5VmRj?=
 =?utf-8?B?M250TTRRdXRULzExVm5Ea1h2YXVwK0pDZ2c0bDhMU3h3MGQxMkpOcjZURDU1?=
 =?utf-8?B?UXVCSVlkNU5yeTllS1FhY096Tk5acEVPYkxqVFlUSVhLYStrZXVMWmFmaWN6?=
 =?utf-8?B?MUdDOXRibFltM2tOdU41b3NITVZoRVkzQW1vMkxKRHdNWUkrVGZDbVl2cWpx?=
 =?utf-8?B?RER4Nm90T1pZcUp1Qk03OHp3VEdmNm5VTlg1SmEwNkNpeUpYbUJDcmxzZjd1?=
 =?utf-8?B?NFd0OEpSMEZCcUxtRjlhbkFYRGJ6L0VLcnEyTnErY0x0REY0ZnN6U01JQ1BI?=
 =?utf-8?B?T0FRMG9JSFVXeEduRkJJSk1CdG82aXVBblpXMFpRci9aejJyQ2drT0lLL0N3?=
 =?utf-8?B?N2pvK0VsbXJUZ1Z2UXovbEVGclRXeHpLd2lZQkFsUzlCZzJFUzdOUjF2dzIy?=
 =?utf-8?B?ZUNrQ0duWmhZNUxsOUladm1kaGRWNlZGOTQydkVjK05KNFp2V1JyL0JqK3kx?=
 =?utf-8?B?VDRlQ2RBbzlHNWtOVDR1TG9SOEJ4Rndjd2ZpZzVDQXBTc3lVTlVoL0Y4U3ZY?=
 =?utf-8?B?c1hzUUdwbkhQeGFpdmdJVysrQ0FGRDAxbzZSM2VGbnFFVHIrMlJYY3pIdFNC?=
 =?utf-8?B?d2FPWE5qSzFjK3VjZlRYczAreUFzK1JZdkp3ZDh5cE1NbnpDNjFuVHQwcTBQ?=
 =?utf-8?B?N2QyVDdSSXBMRGU5Z1MxWEM3SW84eW9LazEyZTkwMFNBdXFySXFKNFpwK24r?=
 =?utf-8?Q?F6BsS5Vu7rBd0rnD0YD1X3f68T10Q7XF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1JDV0VYcDdUZ0NVVHUvWDVBblJDVzh0SFhweEozSjRES0MydDNJRGJOSGly?=
 =?utf-8?B?eWtBdE5iK3FOOUtuR1ZBMlY5T1ZYSkxRdFpVNGE2MXNadTd1NFBBV2lCY05y?=
 =?utf-8?B?b1oyYk5zeWpUa2I0U1kzcTV6aUhZcVJ1bXNxODN0d2NkNXpjVDU0N2c2b0NW?=
 =?utf-8?B?NTRhWCtnL3RwL2VDN2dxWkppbWwxVW1vVkhLbWJ0YXJuak02S1cxY21qUzYw?=
 =?utf-8?B?UEw2OFJsYjZCZzdkamJHMkwvZGhkdXN4bnpiMWlKVEZrdUpSOFh4YWVRd3RZ?=
 =?utf-8?B?V2NTamJJeDhaaDFza25IZnhHd084SEVkUzRTZ21FcmZXc04wNUVmeGk0VkhG?=
 =?utf-8?B?UHh1ZUVmS2ZhaGNUZlRDN094OXlpUUtQeVZTb3JFbmxhbnJjWDlvd0l4cEMy?=
 =?utf-8?B?NVNITmdPdkl5QW13NDd1MzhleXVuYStBWDgvaXNYK1hqS2N2SWVXNkxod1hx?=
 =?utf-8?B?dE5kS2tLaFVxejE5dkxvUXpjWmpjQ1RLOEVveTNDZ0gySytaOTN0OXM4cHpB?=
 =?utf-8?B?djNVOXFuQklXWkcrRGNzekZpTjA3ektPN0MvZ3JmbzhnS1BFbTE0T1Q0LzN3?=
 =?utf-8?B?dDdDeHhYTEJKbHhJbEZVV3pUeElxN0FOcDN1TXNSbEkwVzlEM3RXWUVFcFlr?=
 =?utf-8?B?QzRVYllSOC9ZNnVLekd4NE1ReGpHYktyS3U3b0RXMk5BYVk1WE91bkQ3TVRC?=
 =?utf-8?B?VWxub2dLNWNlcVV6OERySUFLK3AvZVZaekd5ZGV0N2hPQnBDTHF0VDR6YXph?=
 =?utf-8?B?RjhNQ2xZbG84MHdpSWZjM1NtVGlPQi9wSWNoa29SRTN0RFJkUzVwd3grUzlh?=
 =?utf-8?B?OUEyTlZCNXNVRzlwT0VSOVFidHU1c09LQW5wd0dBdWkrQU83M3dHN1ZQV2pE?=
 =?utf-8?B?dk9kMkJVNmUyV0V3bVJlTDE1WFFGdXhHMm5oQ3ZhemgwN0VRQzdsWmxVWnJS?=
 =?utf-8?B?ZjJFeVZZdFk4SS9ER1ppcHlocnlyVzhvQ2hoaTNrTXJ0eTJXUE1NK1lNU0xp?=
 =?utf-8?B?R1p5WkFlVC9IeVhub1dubXRHSTExcUoxalgzR0RHUFluRmh4NStYeDl2eUNR?=
 =?utf-8?B?aWNkNlA4U2FnWk85V2pHM0RnNVV3YWlYb1EyZzlYMGQ4blhMVmRyRXhUdGU2?=
 =?utf-8?B?bUVTYXFjV3BtSlU4VGFGdmRGWWFnN2dvVyttT3lWY29VS2VnR2pISCtDeTB3?=
 =?utf-8?B?eGd5SDVqNFdndHpDYXFiOEpNaW4wVEs5TG5Kd2RZZkpqSVRyRTJNNWJOYTJ6?=
 =?utf-8?B?ZXI1dmRmOXQxVDNNRm44MU8razJiUHF2c1phcUlaOFpKTGpBc1FqdS94RExv?=
 =?utf-8?B?S0ZtYURrTHhLZklBUGF2eUs5YlBneGNyYnlFeURLQVFCOW5zc01sWE1yU2py?=
 =?utf-8?B?RWdlSmwwbmlWSjhyRGhBb0Yva0dubVlQalBVa3hjdkVPbmlSVWllYTV6T3Fs?=
 =?utf-8?B?OTRQK3REaWlORit0cWlubU51NDQwSCtLVkFQV2lOcW81WFQ2SUVENUVLMjNk?=
 =?utf-8?B?aE5Ec1ZERkpBZ3libmZ2WmEyN2lUVy9Qc2tORmRpVGlVV2ZVUmtWWnp4cE1Z?=
 =?utf-8?B?b0Y5dTV3RitrcC94TFVpMitHV3hYYUwwRVpraGZoOXF6Qzc0Q2hMRU91anFl?=
 =?utf-8?B?bDBUd0pBZlZ5bDRJQ29EY1RNbnBRSGNKUUMrRVU2RFIzYld4Z3BveVo2U281?=
 =?utf-8?B?MFRETDNIUElKakdxTWVoUE1SRmVUaG5Tdis1WmptRUUwWEgrcElCQy92RVFM?=
 =?utf-8?B?WWEzc1ZnRTNtZHUzdGQ2aVJqUzYxSVd5aFEySjlGR3k4MHZXYVBnMjdxNG5X?=
 =?utf-8?B?eGUybTBvZ3JyMUQycHppTlh1a2N1SGhwVm1vRE53ajZBZ2lRbGtTaS9Uc0R5?=
 =?utf-8?B?Wk5Gb2JSanVKZ3BHVXpMdnNVK2tqTFZTcUNWc2hpQ01IcVZSS1VRdGJvRUpy?=
 =?utf-8?B?VTkya2F2Tnh1RDVHZTZScnczZStiVWNSY1BuY0IyTnVvQ2VHT1hGbU9ZNHEr?=
 =?utf-8?Q?gvzJfoM6bQYTygMx23AkgCD/fe2CBk=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=nHh38ScZ5xF5+5s2px8LM+i9/jt2oWIot7EpqK+0PsS1Qs741FaJ5c06ZFX4odbhrXvQeEycrjvlAPdjBt+4fM8sSR+SGk0tF3RvYnUBH8ADKQN4kWNqsDjGmTHTeVlm8BjgV+c5XqDOsG0hWxBeqVN4kUM9v1ZN8uEESOD5m0dPBzT47AzBKkKgoyEECOKD+hSBPhjdvjkr3IzYVPGlRDlIBt1248vRcGDw3c9levfXb1wBrTf/6xjfmDkJSWciDUw6I5+bRSWNRyCLSUXlvyi9Z1I4hbVx9U0RFBpc+2qoYZnIxaD2730KnclojqYXtS086Yawdbf5M7EXhMT5Rg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJDjfBmNqZDpZsE52TgsmBGjK2tHm4AoXybML3DX2Fk=;
 b=V7ZQ7CdI/2CZ3MezbWxSW+j2gOg0+ShtZOYsNXxemknCzHmAevDFwC9J7oG1vJJIFrM1EsRe6E6RWAWopArwjEeGaO/41babBbgF6A9XyBdPoJ8dAnghwd+ZNfePPJCPQ/GBdpUUZqcLfBkBFsUYVNDkMltXlZIIP80k6rMQ46uPReVFcpDgIpoqYRw47AT13lvq6aRJmdfNC7f0gheF66TeiG9h9ltjCjrz9sSzPb+HRhUn/upJ2yKllwsehfEpCfr673oB+SL/vS6y787Q8Y6gyIqSDgSeugtpy/3JbAZBfkNH6Sx/RF0PDTWSg61UXkmX7CjI1+qamR434q59ww==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: zv0kxUALCu/KM8g1v2zr9EbJQqU/lQd6a5C3p16C+SO3hsSzrhXU/LCbSsqRPB7Yuo5TFw/Ih82tA+Xmsdygas4IyPf//ITz2vay5eKrQuLGRL2QGWHtbYas6iW1pEEg485IKUuF2Al9gk2su+VXvdjC7o7bEJKNGt2OJtF5GFGVgsvHOZRsYCI46ru2ObVapi75T7B/izzrz/Jlr4dkrtpn25Ey0vd7OzWBKi+Usw9PrSmTHf2QE0t1/w9xnD0cPbnjh/Yo36A6dw/miwfPZSmfjLh2hLvaS/LG4KbqoCnLZD/FF9Zvg+hDEO7mCec0/Bpv9giz8369i0izVli1z0SsXImnMtinb2idL3S2jIWU60KCzCfqLu5sbiiXtEd2azpZieQNJdat2rllhUWwOIN/JgFUvMuLjaLX2LpuZ9J6vcB+iIYIfwoCRfacQQoFuXD2xMvENIUtPNfJ2DUV/et3PM5k53/5xx9k85UKWnSr2AhtYeNb1bYq1TNCVmLMDMKM33ju01y7RG53mdydsfmm+qAM2yS/kkg4na36i4eua/z5zva5c91ll5myTBggCYs+88tkKaFfFWaX4nQudgQoFfb3+khCkaJs0GPH6z4=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 104d074d-0047-4890-9efa-08dc9a1294e0
x-ms-exchange-crosstenant-originalarrivaltime: 01 Jul 2024 21:12:57.7327 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: SA1P110MB1294
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=732 malwarescore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010158
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=792
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407010158
X-Proofpoint-GUID: ywTz5Mr6uGwb6lm88KoEsyQ8p5TnGXpZ
X-Proofpoint-ORIG-GUID: ywTz5Mr6uGwb6lm88KoEsyQ8p5TnGXpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011
 mlxlogscore=803 lowpriorityscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010158
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=qfNpXaYiukXO61jXLlTrj5o5RPPkoCF5bLEgQxp5gV4=;
 b=uY16QBG5m8qLFhpwRCz6Erk2l6h6qgymC7qi3jynbxlFsIllGUlhOVkghGJvgF+2j3zS
 2gaaaUKqG9WfY5ZGWoso43xD5OLmXePklD7lhQTkLpBQnBcBsEvQLptPC2O4wb1DDNfS
 IFEvzSxusYb2Img6D2FQgY5L5x7yINV+0j/RLWG3RLi2tCtmfy4I8sDD9QMQoI1Tpj4X
 aJeoxBF7vnbgXWjpoGpNaa7AkX8XwIwkoRb9DBU8EV+w1avJ/hxk+zpzYhpgeunW477K
 q1y6hnyOq2mmLbcT6iDTTu6s3Tg8ukEWcW52uwRBXjrbZPQMfGY8X0v1zNgt/shCouaI eA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJDjfBmNqZDpZsE52TgsmBGjK2tHm4AoXybML3DX2Fk=;
 b=c9Xf4ZvBPzN7Y/JlnhM4Hxxt5X3LUt37oWMAejDSZu3Fw174CcBSG7tZ/UrP4NU4e8BdOwgy5bZRcD0jrAmKo0jL3ws3K/DAjES9zoffvgKGFxdFU99ZcFLp3MVosb5yzS0deD3+QTp7SG40JC58uHwdIonJErmz4VtxArxFkMY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=uY16QBG5; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=c9Xf4ZvB
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/07/2024 16:07, Yann Morin via buildroot wrote:
> Andy, All,
>
> On 2024-07-01 20:07 +0000, Kennedy, Andy A Collins via buildroot spake
> thusly:
> > On 30/06/2024 09:25, Vandercappelle, Arnout via buildroot wrote:
> [--SNIP--]
> > >   The relatively easy path is to build GCC 9 outside of buildroot, and specify
> > > it by passing HOSTCC and HOSTCXX in the environment. Or making sure
> that
> > > GCC 9's
> > > installation dir is earlier in PATH.
> > I have to do this inside BuildRoot as I'm not root.
>
> You don't need to be root; just install it anywhere you have access to,
> line ${HOME}/gcc-9/  and export that in the PATH.
>
> Alternatively, build in a container runing a distribution with a more
> recent compiler suite.

I don't know the machine.  I don't know the user.  It has to be BR.

I could do a script to build a local gcc...  that's worse.

Andy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
