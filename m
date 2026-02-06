Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8A7EB28D9
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 07:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04D683D16;
	Fri,  6 Feb 2026 07:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfagCvXGsyTK; Fri,  6 Feb 2026 07:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1C284008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770363839;
	bh=4aYXqlUWa20eVpU+x66b23aVeI+ZAci5cTa5GPofbpg=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eaUNBtU7K0auPABk6SnqFRhc3kdvLK4MhI27m2JWNBFR8nKqfMvuAKLg4cHbdjALR
	 ZHH5guYQnJ+ZqCTXEJtHCbsb7VezGVJQc1oPabVrGzFwZeGUhRxr2+5tqbaqijeLgx
	 9QNX1oHW7pJNFT+VmeyhOobQqG+y5pdk8FgTbQtRwnkgsfwg6uECRLbNNuQQcM1p9K
	 GakZC6EayPMOWf55NRv3MkycUA/cQzyv/TLEP/QeRBJUlksMRZQUCpSJ/pu8X3wckb
	 3DVSxcjiATQtXOeBX5YFG+ZPRREP6mtlw6P/L/p4aKxbwwNXLBK6wM2csnWT/MeOHz
	 laF11Arsf42bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1C284008;
	Fri,  6 Feb 2026 07:43:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8234E219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 07:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C3F184008
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 07:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZE86oSP5wHx for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 07:43:57 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::625;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A2E683D16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2E683D16
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0625.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::625])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A2E683D16
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 07:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=nMmF8T7mZxol7LG+7QbYWCk7StjiTcNtks9qJ7NvepcbZt/ar6P4VtP/JY638kxxOmUCj3z7W4IJ4IGCUgfDOOUbsPdk2/BoEsCmVo2bDSIT1wI93GxZGQ32OLhmaNqniZ9cm54DvFbMKeTf1EXlLhTDkY/zUxZc4YrQEfh6EuGqXr/Tn2b4npuZAab1in4w+IClIN4w/fJ8Qy/Kr5gj2eGTlbtBy83vV0xxVt6MQoh4Ch0HxMmXA5njcnyyunr+StmWDpXXPvfUHwmoiXxow4vZJ5nc+poS4B33U2vpdDF+2D5xVIccHpTmlPgO0srqFdlQ/bDb1S9Ide6JB3Y9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHBTxqgJikksauZxGtaKWklSk07VSnP29od70h+nOjg=;
 b=Yqs1fjAbjIMFehQXsV5sP4O6OH+zS1j3RC051+IAplkw4krrWwm55SfqR1mBRYHSjxkBLFRX6VR0taKJ4geMY2RZokRL1jwgdh1MpTlXbGY+KPTGkQV1mAnFxB0EKESatt7ZFe9QTKhD59BLu8d6M36CqZTxJmiADglizRWvGmmzYFwF/wNOnIenphCCGDPMQ6NYygqtDXbvOP0Tx45kOM1fX6/YiggYcFTPdN7GQYLWH1l5JU48dv1aUnoAYmRjVKa3oGOnOrLBntmR9X1n621nWEGZ57C21rP6vkBmXBtRBFY1cR887BMH+fncxrxelikjq37Ombnk7Sc+23e2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1286.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 6 Feb
 2026 07:43:49 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.017; Fri, 6 Feb 2026
 07:43:48 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/python3: bump to version
 3.14.3
Thread-Index: AQHclzxUheitv4Xm2UG4nHICfVhOow==
Date: Fri, 6 Feb 2026 07:43:48 +0000
Message-ID: <PH1P110MB1603D4EA90CE5CDA2802E9329F66A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260205103500.169542-1-vfazio@xes-inc.com>
 <7dfd0d95-485d-46ac-9b7b-65d88670866d@bubu1.eu>
In-Reply-To: <7dfd0d95-485d-46ac-9b7b-65d88670866d@bubu1.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1286:EE_
x-ms-office365-filtering-correlation-id: 0bd52a8d-aeac-4823-8977-08de6553770a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bWIxNStNbmRCRkhvbitjb2dOTkFWdEc5cGhBbHh1OHdhM0N4bGM5b1pXNkRE?=
 =?utf-8?B?NlJ4UUtKZEhtZ1JTZC9NTngvU2VkbzhPZCtRejFUc0ZXdkgvVktTMFloZUxR?=
 =?utf-8?B?aGZNYVRRZFA4RnJocHZTbTV4VVJDTnBKTEFZQWdac0FPWU5Vai9nRVlOZWVN?=
 =?utf-8?B?akkrdTcwdTQrcVBkY2g2a1VoWVV1T2NKQ0JOUHJQWnlhSUFRNWQ0Yitjd2l3?=
 =?utf-8?B?M1BwU1Vpb0pXN3Z4bHF6cG5YaXh1VlVVbUV5OU00ckxMMGk4RXJBak5hdGlv?=
 =?utf-8?B?bFJaQ21DZDhISkdkZmxuS3l5T2Q5NEEvRThlc1JsNWtaRVRaa3h4Nm04ODRP?=
 =?utf-8?B?RTlFUWJUVDhTQm1OcnYzemVSOFBuK1ZEU214MmhBTGQ1Ly8vVUFlMjFvRXVT?=
 =?utf-8?B?RkRsazNPZm43dlZPem5STjArUG9uT3VBMmVhRjJTRjhqOFJPN3l3c05iNFNR?=
 =?utf-8?B?b21MdC9lOUFKN0gxV0g0YUxsK1RRek9CK0Q1V0d2M1pqbjVaWnNyb0tUT2NI?=
 =?utf-8?B?eFZFM1FKdGwyd0oxRTRteVZlQ2hJYzJud2JQQmU5V2RXdnFzL3RxOFpXOGZ0?=
 =?utf-8?B?VUx3aGc4TkRzUHRvOGt6WWhweUoyc2JoVDEvdTBaY1orVnEvREdDTmJaNHVB?=
 =?utf-8?B?aW13ZjE1R09yOEFLU09YcVJ0SFZsMzBNNmRaQk1pS0VEaHhITDI0a05Rb0Fp?=
 =?utf-8?B?VnRqNnZmTTh1UWVGK3VCWGtlU1lGMFdRZ2I3TEpybGYrcXlMYlI1aTlTbDB0?=
 =?utf-8?B?ck9IUVVhR0grcnBLU1hranMrOUF2ZlE3WjlQdmtFbElKV1VmcmpubFdOSWFI?=
 =?utf-8?B?Q0JROW9WU2xwaXFTWkVpQ2p4N0hqcktkeWtoWnFDVGRlNWsrNWw5VENoc1RR?=
 =?utf-8?B?Um5EcWpMMlcxdEdxWi9LcVZvTkJ1OTRjWkNPSUZ5ckRXNmJ6ampVdmljOXh2?=
 =?utf-8?B?aW9waXZHYzAydEwxNzNtWktyYTRQTWM5VU10WmNjSmhpa0lKM25kL2Raam5l?=
 =?utf-8?B?L2FLWHNaYzJkSUs0OUpDeW1jUlBwUWNEWCtzUHNURExtbzNRYUxHZzhzaE4y?=
 =?utf-8?B?RERPdFRBc0RpVzNvVS9HWElCWlVraktkZ1NVZHZZVGxLNUFEL0Y5T3ZVQ0Vt?=
 =?utf-8?B?Qm9qV3hRZ09WOGo4TStIaTZ5VEF3RUZPS2dRTmFZbFFYcFRsa3RKWmxubFI1?=
 =?utf-8?B?T0tIWFhlSmhKblNvSDNIc0I5ZkFBNFZYYmVDZ0xFSUJKM3hmcEZQUjJndy9C?=
 =?utf-8?B?eFc4emhuVk9rYm0yRXg1dlhJQVVNS2xCZVR2WmxOaXFTRTFRSkQ1OEtGVFhp?=
 =?utf-8?B?QWlvTkgycXdtM0JKcUFDUUVuQ3Z5bHJrVys1eGlVNXRiajZDL05yOFNlVDNj?=
 =?utf-8?B?Wm9ZaElqeEFET0M4MkFFNVNhUWhOU2FER0oreGw3R2dhZnpjTnF2eXBuY2tp?=
 =?utf-8?B?Q1YzdllxQTBPYmQ4OU9DeWhNR3ErV1JrSXZCVHNiQ3dOQ1R3RjVzaWV1aFlE?=
 =?utf-8?B?OEJNNnRhRk9ZbitxMW0wMW9kWXhpR1dDOFZrc2dWcnNMZEY4ZlRMVEQwS0Ur?=
 =?utf-8?B?SlhBQVNYWjIvWXcxZllRZmp0Tk5LMnBWeFljK2V4Q212UTJnaFBUNm9WM3la?=
 =?utf-8?B?ZGNiZ04vNTViNlUyQS9ZY3FUTU5aMFh0NzFhak5DWndXSW1lSFZEQVNrMlNt?=
 =?utf-8?B?UGtyVCtJY2JvTG5IaE44aEtSbnpzMElmajZXYi8rQTZSdVFSMkRsZG5XVEha?=
 =?utf-8?B?dGp6T0d1cEZYcFlNQ1o3U1NxSnd6SWlML0pVUFNZM2paeFJ0OGNPZ21IMTRq?=
 =?utf-8?B?WDRrZllWcjRSeWFObWdQcENFVkxjWXNDaEREQis5ZXBubTNPMXM5dWxlTDJa?=
 =?utf-8?B?N01ob2E5dHcvelY4ck5hR1hlblQxdXJ5VklBOTFZRzlUYnRURnVoRG5ERVFJ?=
 =?utf-8?B?Ym4xQlZOa0ZHdGJxRENDd25oTEtYVG5lZWcrRVVNTjhPRGxBL05JVllOZHJZ?=
 =?utf-8?B?UU9iYkFRVnJkMmwxNUY1Zm5SUkVydWFSVDNjcEFucW8weWh1dnBrN0ZaQzlt?=
 =?utf-8?B?TWFPM2loT2FJWnROTUE1bEd2UlNaS3FYK0dFMm0xQVpQMXhkRkE4d1lTTW5J?=
 =?utf-8?B?TmVTazhHZG52eFI5Slh0WlhoL2E5a1Z0bWhxNWFUSEV5SlJwMnZHc1QvdkNW?=
 =?utf-8?Q?Wlx1GqPf3FO2i028BmJ7THs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TytLWk9RVDlkZVlOOVpocnJlcFJVNjZtUnZuOWhQOVV1TU1MVUhoSTJUQ2pZ?=
 =?utf-8?B?NjJXK2k2N3IwcEZ0YWRKbHEvUGpFYXJ4ZWlNMzBvUFcwUkdDUFZFcjQrUHI4?=
 =?utf-8?B?WFIxQlVJNXNOL2svUVlvNk5odU1RbWpOMHhLVTBrakN3bmRsUmZ2UzBWYllm?=
 =?utf-8?B?Nmx2YWhuaTFvVXFkQytZT0VjYldpUHJ2QVZFOU92SzYxK3ZXRmh3QkxMK21U?=
 =?utf-8?B?YkRkcnBXODBKZmJseHlnWXZNbFAxemNXbUhiTFErTlRwN3MvdXNjMHpuNHRs?=
 =?utf-8?B?WDVpamxROHl4N0RnQVhyNFBWcmRmaEhqbUdHZ0UrV1BJZjJ3cmZ3dkhNY3Vt?=
 =?utf-8?B?SXlDdllscythMXFWWnk5ZVJsZ1M3azVzTHNWc2s0aVZkTVZmWWNWZG9OY1FT?=
 =?utf-8?B?YW5aYy9IdEh0SjE4Uy9Sc1VnRFVXSitFMXJ2L0hES2N5SzdabUt1cmRsdW9H?=
 =?utf-8?B?MGorMkMwWTBWVEpIMksvSlB3d2xSMmRkbC9mR29sNjZRSzRDcFQ4WGk5RGNl?=
 =?utf-8?B?Wjg3RXA5NnZQMGI5blVXWWV6ZnBxeDVSb1liNGVDZlFaUWhjeVlvdVdKaTVI?=
 =?utf-8?B?SEZJVHFCYXJxc3AyYkVJZ2RrMzRralBUcmZlRlNLQmtXeHpsSksrbEhDeThV?=
 =?utf-8?B?eWtEWlhkV213aHdJTVdxWDhxd2F2UmNHRXBXZGM4dXhGTEJleTdycEhsQmdX?=
 =?utf-8?B?S1BmbTVvdXVYcjFLRzd1UWVIOWJNNTIySUtrOVFiK2VsNTFySW4zL2xYVjJF?=
 =?utf-8?B?NVF2TVJFekxhZjhLUVJ5ZHM5a0NHdDljN3BsamxGRG4wSVAyQmlWT2FFVmpa?=
 =?utf-8?B?eVNFZE1UM0lQLzlZa3JIZnJMWllIUGJJR1JUV2tkUW9ZSnIvL3lzdll4SGpI?=
 =?utf-8?B?Wll0MUdER1R4d0FmMUlMSjZUbHhCZEMrWmxJUDBpdkQ4U0M5ZmY5MU9iY1U0?=
 =?utf-8?B?bG5IZzhYZnNKNDd6YlhCbkRZWlRtRVhjNmpkSlQyOVYxc1lBZXI3ZGRKdDVD?=
 =?utf-8?B?UTVnRjZiWDVwV2FnVlloNCsvN29TYktJanNWZWc0ZFJLSmNjWFQ1RmJmVmdr?=
 =?utf-8?B?RjZLTnpnQUJnek14Z0VKcUk0WUtUNEs0bHlpcmJiYUlhd1pIc3lWQndsU1lr?=
 =?utf-8?B?K0ZnNitvWHd3NHUzM01OVk4xKzh1dzdLTnJzTmpUNlROU2drKzRvYkhMd0kw?=
 =?utf-8?B?ZGQ0bTNuREIrd2RUM3FPUm54WjFJZUdQY3JTRGpESk9xaDlBSU5aTDF4OEVa?=
 =?utf-8?B?cjE5dEtMNFBsdVdFZ210a1dESjFRWWtkMFV3ejdiZGNXbit5QjkvOXRWdFpS?=
 =?utf-8?B?Yi9yUm9WUDdTRW1jZkNIczBGZkRmM2FnbTZSNGptaVMyNUdHdzlnU09XcTB4?=
 =?utf-8?B?K3Q1WWRNZjBTQVR2a2ZsRUU0aHZPbm1mSWl6MXNsbUU2aGNQREFIRzRjK3h5?=
 =?utf-8?B?cmlvOFRyRVE3U0dDV3p4WjloV08xeWdVR0cvZ3Y4ZnBmSm9QZTlTVTI4YlVN?=
 =?utf-8?B?YU9Ra2JmcFZHdWE5T1EzYVF2Z3Q5VlkxeHROdUxMcEdIMWtyWHRhc2ZQSXFZ?=
 =?utf-8?B?dmltdk9QMmlDVmc3WFF2WFpwMnR0dlFLQWRpb2pwVmNDTEtXMUVtUEdkY3Vp?=
 =?utf-8?B?UGk5TDM1S0VQTnhDU0dOL1lBUXpTNDZ1cjZ0L3hSL1VQVFc1UzlxSVJZT3Q2?=
 =?utf-8?B?VCswdGp4azBYUTJmdDgzVjNHTUtQaCtXMVd3VlJJR0Q4SFBTYmxOTmU1bTJM?=
 =?utf-8?B?ZE5GaTkvdFJSWEpDR2NUcWVIaDBXL09ncVlabXlib0N6Q3RaWFYyN2xiQlhy?=
 =?utf-8?B?Z1E4RHN5U0QxdkZmb0JYU0NXNmg5QjFaaGlsdmIwckY2M3hCQUZ3eDAwa2hL?=
 =?utf-8?B?WG5hREtxcWFXcGg1aWZ3bUg4R0VaWXczb09CTVFYalVKTXlSOElQZ3lYeGlr?=
 =?utf-8?B?bG9mVkJSUlZGRDZJZW1sV2I1UEJ2RzJOaXhTNkcvdmhUMFRsR3FPUHRXdU9v?=
 =?utf-8?Q?mS7N/+1minSRZ7EAvEzxpKZFPLb/so=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd52a8d-aeac-4823-8977-08de6553770a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 07:43:48.6620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1286
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHBTxqgJikksauZxGtaKWklSk07VSnP29od70h+nOjg=;
 b=7Se7AnypvPFDEK5i3YoPWpt977mbrOA1FTClX8/G3xMMKjuaYeptGrHry56DfGGk5beuR52s1uZAlC7dgUYZybBbc4yUnfNFe6q+vAGAwFijT/dfGvkkVWa3Xf2A6JMxDbSenQIsD0+J1kR05tpbANgqUAabl8OLxthG/5CkeaVAL65afnwuvk1AHQtTPjqYIJeo6PQKHd0Q/raX48uD+z6dzNTbJu9npxlVYFw7rPt16UIPoPVskw8MM2j0gT7pV95TkerDuRsSm1zvYpj9wQvi0VWxtxQ7knpN592lIpIBU+AFxvC5pE3jr0QO6MwWShsufELcdV08vB9Npr6OBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=7Se7Anyp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python3: bump to version
 3.14.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


> -----Original Message-----
> From: Marcus Hoffmann <buildroot@bubu1.eu>
> Sent: Thursday, February 5, 2026 3:12 PM
> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Peter Korsgaard <peter@korsgaard.com>;
> Thomas Perale <thomas.perale@mind.be>; Titouan Christophe
> <titouan.christophe@mind.be>
> Subject: [External] - Re: [Buildroot] [PATCH v3 1/1] package/python3: bump
> to version 3.14.3
> 
> Hi Vincent,

Marcus,

> 
> On 2/5/26 11:35, Vincent Fazio wrote:
> > https://www.python.org/downloads/release/python-3143/
> > https://docs.python.org/release/3.14.3/whatsnew/changelog.html
> 
> Just wanting to note, that this is a security update, from the above link:
> 

Yes, sorry, it is a minor version bump with security and bug fixes.

I will be sure to call out the security fixes in future bumps.

-Vincent

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
