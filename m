Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA81EC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCB560902;
	Tue, 21 May 2024 17:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aA5654NXd1hS; Tue, 21 May 2024 17:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D6C60909
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D6C60909;
	Tue, 21 May 2024 17:15:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFA7C1BF283
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99657402EF
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 17:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMCqhSdRLGLz for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 17:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40924402EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40924402EA
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40924402EA
 for <buildroot@buildroot.org>; Tue, 21 May 2024 17:15:14 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44LF1NL2020494; Tue, 21 May 2024 17:15:14 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y8cp8tpk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2024 17:15:13 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph004rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44LHFCJh007323
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 May 2024 17:15:13 GMT
Received: from UUSALE2E.utcmail.com (uusale2e.utcmail.com [10.220.63.40])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44LHFB2Z031080
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 May 2024 17:15:12 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE2E.utcmail.com
 (10.220.63.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 13:15:12 -0400
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 13:15:11 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.184)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 21 May 2024 13:15:11 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB2098.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 17:15:10 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 17:15:10 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [External] [Buildroot] [PATCH 1/2] support/download: introduce
 curl backend for FTP transfers
Thread-Index: AQHaqWGHzrWsC5u5j0ONBOG38CB2kbGh4J+wgAAPWgCAAACsQA==
Date: Tue, 21 May 2024 17:15:10 +0000
Message-ID: <BN0P110MB16731B9A7000C323172E0B57EBEAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1716063903.git.yann.morin.1998@free.fr>
 <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
 <BN0P110MB1673D23A6CFB29DDA9C61DA5EBEAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <ZkzU1M_pN0C-zcUr@landeda>
In-Reply-To: <ZkzU1M_pN0C-zcUr@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB2098:EE_
x-ms-office365-filtering-correlation-id: 5cf47b34-1bcf-48bc-18f2-08dc79b991f3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|38070700009|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?utf-8?B?ZkFhckVIMDJjVTNzbjNwdVhFOW4vSTBXYkhTUmk4NUZmdVFYcldMSTNKQUhC?=
 =?utf-8?B?d3lMNUwvMUpRSDlWOUJlclJtbUdSTldEemxZYXd6T1crR1pZSjllVzR5bExv?=
 =?utf-8?B?anRVbjUzR2NqdUtiMmJPRnh2Unk2TkNiSG1XTlhvY2loVDdZSmxaRHpDb21l?=
 =?utf-8?B?NU1kNUpwdzhNZG1DNzBjQUQ0L2oxRmNRd2s4NEpOUlN1ai90Vmx4WGpZOTM2?=
 =?utf-8?B?bHR4cVFlVmpyZGVMcmVRdGxyMWhMWDVWTHliTFZFUG5BaHdSRmxZYk50Qkds?=
 =?utf-8?B?TE9Zcm92M3U1TkRsWHdVcHVDU21VaHFUOVFEcVNoM2s5aDVpVkdiMkI0cnda?=
 =?utf-8?B?b003dFJ2RG1KQjd4ZXdUOEg5TDBuUnVhNDVaa0x3SmNiU0M3dnVGdFVFQXpM?=
 =?utf-8?B?ZEZ5ZlhFTm5rSVhJaFllbCtPQUNTczV1MnRVTlFNRDllSVVQMHA4Uk9NVU1V?=
 =?utf-8?B?OXhBZWtSK2ZyZ2tBNklrWmJWL1lRMDNkMnpFT2FKNFpuZzhDYVNZUFRiWXM0?=
 =?utf-8?B?dHkvdDRRNm1LQ0VlZ0c4OWpZajJtMzFXZnQvSHluekVsR3hjS2hzNnJ2U0Yz?=
 =?utf-8?B?cUdMYWpDSjl6T2NlM3hSN0Ftd3ZQb3paa3AwTTBOMFJCVHZPRkNBbXhHZnIy?=
 =?utf-8?B?ZHY5MlVROElJbjVpUEh3QzRWMCtYa1hzRjJUTkwwUE52eTNId3o1U1BxSUxW?=
 =?utf-8?B?Tkl0NWlpaTN0Y3E0MjhXN0xYL3FYUkdkY3hpUzIyNlRJQ1o5eEYxbWxLYUR6?=
 =?utf-8?B?a1pkWWFmMmMwdmhmb3E4UkZqS2RUQzlERklHeWZtQks1MFBJYjJmMEpjRzRW?=
 =?utf-8?B?ei80NmY3MldwZ0ZkZ0pDYS9xdnNvZzN5V2NoakQ1MWVyS0c5YlZEWWVkWmRK?=
 =?utf-8?B?SzZJSVl0ekV0KzFoZUxBRVVkT0lSWUVIRkNOaUNJNy9rSStucHBQeHh3TFZR?=
 =?utf-8?B?aktiZ0FWNjR3L0hGVUkva2J4M3lLQ2Z4eDgrZTJDYzhqbDI2OTVpQmlkUkxX?=
 =?utf-8?B?TVEzVzVBdzhpNnlsQ1QxdXVQSnBESWpVbFNhTUdvWDAxQU1OektOdjFQMkxT?=
 =?utf-8?B?TUtrd1B2UGlmYlA0THE5KzAzY2FUTU81c1VKNnlwWitTR1BnMFJJNVVNeHdr?=
 =?utf-8?B?eGtuaTlEdVFvaVZQUkcwb09WUnl0aG1LZDJHRUhMbEpZdVZuNmpYaklpcGRT?=
 =?utf-8?B?OHU4Q2ZGRkpzbitCUkxsNGs0eEVLbXQwUDBweCt5dWtYN0V2eEpGeWJBRXVk?=
 =?utf-8?B?MDNmVHdGb1Z1eEsxSWFpQUJTNTJhcU1PN0pxTE1TTFI5czJKRG9USGE4Rkpl?=
 =?utf-8?B?L3FXRlBrK0dCR1Q5WFAxbjJib3A4bC9tT3pHK1dtWFd1RmYzU2lYRGhnTm1s?=
 =?utf-8?B?OGNCWjFxWDlRMUw0aGVNYS92ZUpOVkNWZUJwbS9aL1JOWVhTUDl5SFMzVGt6?=
 =?utf-8?B?TlZ2dTBwaGVSNmhtZnRRTXdGU0NVV0swNnhLTWQybEJ2VUhxZnYyRVczVE5x?=
 =?utf-8?B?UnR1djRhUFN0TXJ2NHdkMW1MekJKK1hnRk1OOHcwT1dVb1dhRzdBU3Bwclp5?=
 =?utf-8?B?R3Z1aFdBODNSaWF5UC9tc21yZTR3WWp0TUFHa0tCdkxidy9VQThsbWFQNDR2?=
 =?utf-8?B?RllSblVUZkhvZlVOcnhYZ0l4NVNhRWhHN09Jc1lVMElYcWFVTXc2VVZtcFR6?=
 =?utf-8?B?b3NiVW45NkErdFdzT0R5cXRLMllBMlZKdllkVFM2QzJLT3lzYi9vcnJSR2pk?=
 =?utf-8?B?b2p0RFR5S0hoenFNSFNkOTFMQnNrRDMwc3BjNnFNODlSWGE2WC9zQ0o5QXlG?=
 =?utf-8?B?bE1ZejhTWGwzeHlWb3BtTlB1Z1I4ZzVGL0JnOTBwa0pUREIrUDJ6alJ2NG9I?=
 =?utf-8?B?WUtqOU9HeVkxT3F1SjI4ZXNZTHN1QzVNdjRMRnprN004VEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czd1TkFqQnlwZEdXOGxJeDRXRjFRY1VnSlJtczRFYmtIVmRCN0YrMng1K1Z0?=
 =?utf-8?B?STNOendzOWh3U1h0OE42ZDJVV1RlSTlPYngzKzdOOEJQbkNXUVUzcmFPU01s?=
 =?utf-8?B?NFNrT1FtNUIxNVUzWmwvN3ZTbHNhRzVFbk52T2NOZUhTZlVnRTdwNVFNM3NT?=
 =?utf-8?B?ZERPbUxwaXEwUjNVdTV3eHhvMGtjbm02YVVZeFZIOVF4VTR6K3IwUkhaVVVs?=
 =?utf-8?B?a0sxemdyb1N1YVlqdHVqSHRkSkV6aVVLR1hPRGc1MWRNZmRmRWN2UVlwdEwx?=
 =?utf-8?B?OVV6WHA3OTFlTkdLSVZCcDBpQnBTRzBxaENJWmxYK2NHTTF1eExWSkx3WG8r?=
 =?utf-8?B?bXNxaFpYVnVTaDNBUGJ1Qkx0WWgvVzR1aC95SEp4YXJPelNwd2ZLYkptSHhO?=
 =?utf-8?B?M0FTWWtPbXpHU3BSZDA5dUpCQ1F6VGtyb0NjTC9YZG14dXJOUG5jTHIwb0pV?=
 =?utf-8?B?bXhkbUw5dUh0NG9mYTBUalh4ekNETjNRaUs1MVFSNTVyQmVXL3U4cGR6bkVT?=
 =?utf-8?B?OVFPaGxwUzlWbWJZS3VNaE43bldQQy81RjdMTitRMUU0cEdVQjdhUzVteU80?=
 =?utf-8?B?dHZKRk9hajhQeFZlcVhhbkJRKzBVeUc3dVoxdEhzRnJqMWN2NzVkZjdmaXdW?=
 =?utf-8?B?ZlQ1REpCSU5ZS2kvS1U0djJTRi9WczUwK3JkY0hiVXpEVDB4c3A3ZXRLeHZZ?=
 =?utf-8?B?WXBMQkdtRS9DTDZFL3poZExPc2xpcCs1eEwwdGhibU82WkowUmtjd2ErZVIv?=
 =?utf-8?B?dHpDNkFoaGNpMWo3SnB2d3U3OFo1WmdPUTlTSjViamxqV0t5SnlJM3BwMnJC?=
 =?utf-8?B?eml2N3JHU1lWY3Z4eUx3ZmRDcmR3U3pRMjRQTVVoRDFoQVV0dFBXRFNVdUNI?=
 =?utf-8?B?OCtCOENsTUo4Vmxydmk0S1craDFSUUFjU09Ca3FCbnh2a2xQR3pzazd0dSti?=
 =?utf-8?B?YkNpWnU5SGZhVmJCci9DU2lSLzh2TDRpc3B1S2xrWUUrQmtBRnRoMXZZS0R3?=
 =?utf-8?B?MEFQWGh2eWRaWEd2bzRUS0dtaVcrSjhQaTUyYml1NUZKc3NCQnVEU0ZvUEVT?=
 =?utf-8?B?WVJPYnN3R08vSTVYVnEwSHhtaFlISjRvQmpEb1N3TG9EY1l4OWtQVkZnM2Ri?=
 =?utf-8?B?N0tQMlZiREJVSjBMY3Z3dndhYjhKWjNqdVZodEhFVHZXZHowSVhqejRYTXVh?=
 =?utf-8?B?ZEdZSzZwdEpFaUIxSGZkV1VDdEpqNGRkN0JkRUovSWVDRjJHbzdSeFZMK3Vk?=
 =?utf-8?B?QUgxSjYxY0FKZ2J5aUhiSlJNalBQUTFXeWpWNXhydmVDQUZMTXEzMWEvSVV4?=
 =?utf-8?B?bWducGNJL3QxM3drQlhmSXFRWEVhNnF1VTVQeU9mZmRMdW9qRmUvdml4Yktw?=
 =?utf-8?B?S3daOTIxQmZuaElIK2d2blVES2JsQmpDWXY4VGlrQU5tZnRzc21oZGk1SUt0?=
 =?utf-8?B?YmNmVWZFRG0zVGpvdnllRGRJQU5DbHRwblQ2bFRia0ZERmtXMkF5RlFWb1BE?=
 =?utf-8?B?WnFxbm5PZDJ2MFJvanRXSkw4bDhSQ1hCdGllL2R2bDBoY1Z0VUk4S1FqQmJS?=
 =?utf-8?B?YlZGclZLUmt1MjdBWCtMU2hNWk1MbXpsWlhuNHp0V3RRNWVUdWJ2RzZtayta?=
 =?utf-8?B?dTNIMVc3QS9DdEE5aDJxQnpCcm5EOTBsQXRFQjc1QjJldDFZL1NoZWN6c0ZH?=
 =?utf-8?B?bGRZeXZSZXhNK2dKK0pLQ29iSVpORmdNSkh3TitiRkNUaDN1NUxEOXlTTEZz?=
 =?utf-8?B?MjJKcUJkR3hIT1crU01jTi8rMnRxdW1Ec0dZVHNDZ2ZYR20wbXYzbmZQbnlB?=
 =?utf-8?B?RXFiZ0xEQlNYcTUySnlyOUdheE1tcjNuaXBuMzhuRGpYRFZSY0p0dkY2VVZD?=
 =?utf-8?B?SU44OFlrdnZNMlM4UDZaL0h6T0N0U3E4aEgwa2hXbVNRN2xoNmJodjdnYmpo?=
 =?utf-8?B?UmtWcEYrWEwzMlVsZGlxMksrdWpBd2NoWmI2cHdTc2VIVFplcCt4dlpUNnJk?=
 =?utf-8?Q?yQcYPEWR9ixYlA8ZioCsDWO7QN/S6M=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mstCoWqiNPAXAu0u/QqWrrZkQQprynzP/jphB3OEicyaCi0cViKjuWqJnAKBqMS/mjyo/SySeJ+utfNtzvz+L76/lXX6ifmcM+M3aflYMzez18sBBI10+Ilhkmv7X4vnWrxiFoKtzzEoUX5KIbAePyAwdrvxKYWMj7xWTEVy5VEGsevffjvMlGK0CuY/CXJnUcZPEengNyPsdJqTASmTyzVrwyXVqqWzag/B+kx8WjHqbL3DayynKIcOj7yImRniGOrAlgLBx2/pVZLEpZ6a6CMZQeNNSb9rPlXhxrEBjO5KsPkH53ICuBlVoE9JhXDm5MQ0/dYx6ah5jAC8stXydw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5Hs5LkFWOE/MRGCgA8RoE04ouasnS9bzXAQxHubEuQ=;
 b=ZuEN8zqeZT+Jawy8Owi4ngqN9J8RG6n1xJH6kxhoXmUFjQwQ4hfdq1RwnDiUPWiMSsPzx8v3+uD4h7YE6tzilHHHbQ09wJUUSuYCQ3ATPo7UiEUvGS1wfB7WGgALcldnIuFL/8Xr/TXPWZlNGiuTqOB3NULoQhnzAG/Y2GtbiAp6T9T0wHe2ftInErdk86wpcBpWXeWHF9DCUNEpWLRoNjbRIR0xIUYXFyi/OfAtwG8QlKY+jhAOBQMyZfjXoah/oDMm4sqbvjA+9KTwTGXBQXsarEywiXRn2kDcqAYIXq8TbOO1kkgY6MwuWAJD3168SANMMl2n2I6G9cEG3xZWAQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: I6r8sbzlehplkkY+FjWDAETihwCiIb/7Kx0gS3dRYi21JajFA2SJJKmp+8Q1XAdN848k0dRDKhjO4pRs4eFiTUXPnYvqomsURE9cBBT5hfyR1ZUvFkaYckw3pq7yN4+37DgGavq3IunqltDLaXWTtqIhK6zCln8JryVI28H2ke3s+rDT66zx7QLnCCLKVUfsc+k3pehIVL4n9VLGNbcpUeTZOmMfPaaPMiGHK5Thquu0bzDQo7KdQ5t8iuIXJKThPFK2UtNXG73No614zJ4u64y0nWXEa5Dk5gXqrM1QroVnjogGNPOiX+xJzbkiz5K6fyqT4ay5C+vYkR0r+KaPPdtG/kB2HELNhogMJD9ZJ1mnz1sYrHmw8VjfYiTYXJlSyDeERmUDTSTSVn2jpdj8gDGmm3ZZZcOHUI5XtJ3lC+BETmggiHAqHLbNLnIPUu6PK0AydIQQOdq4J7+j653KU7/PR4clK5fcUT+D9FbwLY6PRS4w5JZajVimrp8iaaRhSE8oLpA8nBO8FnEFjuc+EGxpA9yvoKHPPxmYvr4vZTme512tNIlsCHIPoJNuU3PFQ2ljIy8u49vOMOXgbbTDdb2yMbnG98ezXGZ/K0/M4Dp/Dg0EY2mhdmLeZmDH/6bQ
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 5cf47b34-1bcf-48bc-18f2-08dc79b991f3
x-ms-exchange-crosstenant-originalarrivaltime: 21 May 2024 17:15:10.4114 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB2098
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405210130
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405210130
X-Proofpoint-GUID: s-SQ8-C4Nx4kkvHJwIOz9i2FOHeT4fsN
X-Proofpoint-ORIG-GUID: s-SQ8-C4Nx4kkvHJwIOz9i2FOHeT4fsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405210130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=gtU1+CNH8r7EEfr86LXu9jxdizOOBxKlGspBD/ZKGqw=;
 b=Ka01a46zYdxLsj9lQVNN2BCu+KI7NRlVwse+gENAcGhOcr8UEXiN/Hyui3eataeZ+T9O
 U1mWIEEdSpGZRbbHkietVOq3EfNMyByU5HiOLK69EFQFSqgj2o50chF6jnvJ0GUSp38E
 vA/ch/1I5ESvjMYtWXmv+PNk+q385Hxx7nwVHQrUBvjpjpYBgsMZg+wXy/IPSa7LwjDV
 Ac6umIo8b+8O6biL/piO9e6tKl5Idl3a6mhDv7F7BthjfRLNRqZ8rDnkKnZrQwg6bL/b
 Hjb1wk9JvTglf5Fsu5gFvxXIADpX4KIgEoIjLH4T2JbE2zC2a5+OPfNc81xepw1QKmLo tA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5Hs5LkFWOE/MRGCgA8RoE04ouasnS9bzXAQxHubEuQ=;
 b=2pLOLINtLdKkKIaMX1ll0/uPf74IuKp0TNFKRsbfRWv2GXIKVvkGaz4m+etbaqYfHCNj4dMc6ZW2PMIGYIDgMfOBAh5YD3GlZ4blwT7zRZEfxD3cS1fwjmQ9WGCUNpKjOkl7d4Gzy1OoJ0imDIeNTTsjMf9WME9PBv/hBwVDe2I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=Ka01a46z; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=2pLOLINt
Subject: Re: [Buildroot] [External] [PATCH 1/2] support/download: introduce
 curl backend for FTP transfers
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4NCj4gU2VudDogVHVlc2RheSwgTWF5IDIxLCAy
MDI0IDEyOjA4IFBNDQo+IFRvOiBNYWllciwgQnJhbmRvbiBMIENvbGxpbnMgPEJyYW5kb24uTWFp
ZXJAY29sbGlucy5jb20+DQo+IENjOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBTdWJqZWN0
OiBSZTogW0V4dGVybmFsXSBbQnVpbGRyb290XSBbUEFUQ0ggMS8yXSBzdXBwb3J0L2Rvd25sb2Fk
OiBpbnRyb2R1Y2UNCj4gY3VybCBiYWNrZW5kIGZvciBGVFAgdHJhbnNmZXJzDQo+DQo+IEJyYW5k
b24sIEFsbCwNCj4NCj4gT24gMjAyNC0wNS0yMSAxNjoxOSArMDAwMCwgTWFpZXIsIEJyYW5kb24g
TCAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb2xsaW5zIHNwYWtlDQo+IHRodXNseToNCj4g
PiA+IEZyb206IGJ1aWxkcm9vdCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gT24g
QmVoYWxmIE9mIFlhbm4gRS4NCj4gPiA+IE1PUklODQo+IFstLVNOSVAtLV0NCj4gPiA+ICtjb25m
aWcgQlIyX0NVUkwNCj4gPiA+ICsgICAgIHN0cmluZyAiQ3VybCBjb21tYW5kIg0KPiA+ID4gKyAg
ICAgZGVmYXVsdCAiY3VybCAtcSAtLWZ0cC1wYXN2IC0tcmV0cnkgMyINCj4gPg0KPiA+IEluIG15
IHRlc3RpbmcgSSBmb3VuZCB3ZSBuZWVkIGAtTGAvYC0tbG9jYXRpb25gIHdoaWNoIGFsbG93cyBj
dXJsIHRvDQo+ID4gZm9sbG93IHJlZGlyZWN0cy4gT3RoZXJ3aXNlLCBzb21lIFVSTHMgbGlrZSBn
aXRodWIgdGFyYmFsbHMgd2lsbCBzaWxlbnRseQ0KPiA+IGZhaWwgdG8gZG93bmxvYWQuDQo+ID4N
Cj4gPiBBbHNvIEknZCBzdWdnZXN0IGAtZmAvYC0tZmFpbGAgd2hpY2ggYWxsb3dzIGN1cmwgdG8g
ZGV0ZWN0IHNvbWUgSFRUUCA0WFgNCj4gPiBlcnJvcnMgYW5kIHByaW50IHRoZW0gdG8gc3RkZXJy
Lg0KPg0KPiBUaGUgY3VybCBiYWNrZW5kIGlzIG9ubHkgc3VwcG9zZWQgdG8gaGFuZGxlIGZ0cCBh
bmQgZnRwcyBVUklzLCBub3QgaHR0cA0KPiBvciBodHRwcy4gU2VlIHRoYXQgcGFydCBpbiB0aGUg
ZG93bmxvYWQgd3JhcHBlcjoNCj4NCj4gICAgOTIgICAgICAgICBjYXNlICIke2JhY2tlbmR9IiBp
bg0KPiAgICA5MyAgICAgICAgICAgICBnaXR8c3ZufGN2c3xienJ8ZmlsZXxzY3B8aGd8c2Z0cCkg
OzsNCj4gICAgOTQgICAgICAgICAgICAgZnRwfGZ0cHMpIGJhY2tlbmQ9ImN1cmwiIDs7DQo+ICAg
IDk1ICAgICAgICAgICAgICopIGJhY2tlbmQ9IndnZXQiIDs7DQo+ICAgIDk2ICAgICAgICAgZXNh
Yw0KPg0KPiBTbywgdW5sZXNzIEkgYm9ya2VkIHNvbWV0aGluZywgY3VybCBzaG91bGQgbm90IGJl
IHVzZWQgZm9yIGh0dHAgb3INCj4gaHR0cHMuDQo+DQo+IElmIHlvdSBoYXZlIGEgcmVwcm9kdWNl
ciwgSSdtIGFsbCBleWVzIHRvIHRlc3QgaGVyZSBhbmQgZml4IHRoZQ0KPiBicmVha2FnZS4NCj4N
Cj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIG11Y2ggYXBwcmVjaWF0ZWQhIPCfkY0NCg0KT29w
cywgeW91IGFyZSBjb3JyZWN0IEkgbWlzc2VkIHRoZSAiRlRQIiBpbiB5b3VyIHN1YmplY3QgbGlu
ZS4gTXkgY29tbWVudHMNCmRvIG5vdCBhcHBseSBoZXJlLiBJIGhhdmUgYSBkaWZmZXJlbnQgaXNz
dWUgd2hlcmUgd2dldDIgaXNuJ3Qgd29ya2luZyB3aXRoDQpvdXIgY29ycG9yYXRlIHByb3h5IGFu
ZCBhc3N1bWVkIHRoaXMgd2FzIHJlbGF0ZWQuIDopDQoNClRoYW5rcywNCkJyYW5kb24gTWFpZXIN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
