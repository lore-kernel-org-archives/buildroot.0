Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3FAD1CA39
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 06:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 245054038A;
	Tue,  5 Nov 2024 06:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zi1aFNNAUodt; Tue,  5 Nov 2024 06:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A9E40363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A9E40363;
	Tue,  5 Nov 2024 06:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43F87723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 06:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C67400CF
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 06:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz1exf3sDS3o for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 06:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::627;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D34DC40606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34DC40606
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34DC40606
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 06:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SV4ukmuvY4d4kG/praM/HtHlG1j6/b/nFcP64VaHML3P6i0T2oPzizdIAlMql4tfMS3lhje3oNe61zbuJQQqiWHCTjRAnEG9V82fwdjacnd3RTD7Qn/eLGpyysvpBwqIRP8pFB6Vf4r13kvsb7+S/PkBGK87fKpKVoQSA3v6LlqRBNQNYp3X/s9Efzg5M4XOQIfNn3aU+iYPpxgLhi7ASnv/PQ2+D3AApKiXVQ6W4TGrYhTPvGpiJgAZ+C98U19lNCc8RhyMHbcTfLvCFE1Kb3MudvNgQ6HrwH4n1znivVCedEF/WiwHD6hsB5rlQfvqHoCYJGW0jy6KUTRlnldlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QrVByE35FaevVB5phMTkiNR5DwMfuRRqVSUkUktKVo=;
 b=fdk4Hx31efOu4oYlSvvTYdBYobZhnh+930LYAGEnuljGn4nDEn+1ecYcO3aQMYqgTpLIGU03g9czrIH7au2KCaMeyxhfsrpptW6V8KE5D5DYPmTxEJ+17OtwEhTJ+FDjvjHaGxeCqZwtoUU75hNL1NvK65SYkIIhEUfyAB2V8qM3u7AaizX4yuIIWuUV2JIqLGhDarTqHw1q+RIoRiRXu1Vq8Kl5Nov3Xbr8iHfjBXajlr/nCSXI78eXYrs06CWNi1MpVShqo1JFav2FVapwbdZV31RKdUD3VLSVSgz78K4OJia1CbpoR0PQkeYJqB+4B+8nsj77cVmQN28quJQrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 06:35:36 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 06:35:36 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/2] configs/versal: re-adding
 xilinx-prebuilt version
Thread-Index: AQHbLpGpcMTuXb1RSkWZnKAOnRiyIrKnbsaAgADJoFA=
Date: Tue, 5 Nov 2024 06:35:35 +0000
Message-ID: <CH2PR12MB50042F62C6991C73B5C210B7F0522@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241104081453.430619-1-neal.frager@amd.com>
 <D5DLNL4HEWDF.2UFA0CCJBT02F@collins.com>
In-Reply-To: <D5DLNL4HEWDF.2UFA0CCJBT02F@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA3PR12MB7784:EE_
x-ms-office365-filtering-correlation-id: ace1005e-164d-44dc-7240-08dcfd640e63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?dHN4ZytCcTBVcEF0a0MrSUhZQ2R1Y1ROR0lXUG1XaCtVVmwxYXprbXI1VDVJ?=
 =?utf-8?B?TXYxYjd5bE1scjNvQWJTcU42WE1NMnhNWEs2YjFBU2ZQTWl2ZzRFYitkRTht?=
 =?utf-8?B?WkdvRllYRHg0amNHampNVG5Ea0dGSzluWC9rZWV0L3V4MnVjZ000Y0lWb2dN?=
 =?utf-8?B?WHdDb1JFQVd6OE5VL1BiTDViZTQ1WnFUUk94UzJ0UlZVUzZRUEpENHRjV0ZZ?=
 =?utf-8?B?RHYyMHlqRmduZktsbW9JTEkyTjVVZHo4Sm5CVmJKcGx0b0N5RUsyMUlNUjNw?=
 =?utf-8?B?RnU3ZnZ5bTN6OHdhTE5QUG1VaGNra3FDblViOW53cUdaZXV3UDh3VmdCL2hl?=
 =?utf-8?B?WkZPK3ZiSVZmLzhzYUh4N2p4enlFR3FlZldPY3Z3L25mSEFFWUcyQWhkck1a?=
 =?utf-8?B?SExuT0dENDZDSXBsTDBSOU1PcW1zazcrZ0p3Q1RRejdzZTZWazl1Rk1aWkMz?=
 =?utf-8?B?Q0pNcE12b0pMUTlUbkpBOGxGVUM1Y1crTkZ1bHdWSXJMQWJ2bVVDRVFtZmRU?=
 =?utf-8?B?aERTOGpyVjh4bFQxUTk2Mzk5VTE0dm9QakthZDNsSGhXL3VyVlkvSjFXZ29x?=
 =?utf-8?B?L1NiR2hjeWhtUjBXbTRoOE93VmVXWFNNcWJaWXB2N21NYmN5MWRJdHdzMyty?=
 =?utf-8?B?TUNmdjN2SG85b1drajhxc3RnbkZJTCtrbkV5T3BrVmJUdDZVNHdKOS96eitX?=
 =?utf-8?B?Rnp6V29sZVJsT2lmeDVjd0JYOXFtMmJLMkZIbUFGTGRSTUphUGRCbnhuTWdn?=
 =?utf-8?B?Q3ZWbDhIUDJSSnFKRDdES2wwdGp5eUdhdFFvczhGMW1QdVlvZEcxMTQ1T0JX?=
 =?utf-8?B?NjVsK253Unc2L1lGcEI5YlZhVkVnVStmZkFwanNlU253YnNKcmEyekxySFJZ?=
 =?utf-8?B?OElHMjR1MG5SOHJrcVdvNENzaXFOSzRaOVFEaWNSamFlV2trMWdISzZCTVlK?=
 =?utf-8?B?RTVHelhBclkreFpmL3dLejdyd1VZVG5HM2JjRm1EdzN0R3JjUkxrSHFmQ1pG?=
 =?utf-8?B?VEE0Y0lqWFArNzZBUW45M2kxTGR3V2tRWDhpS3hNN1F2NW9BbnRuRHcraXhr?=
 =?utf-8?B?cXF4WUtNMkxlY2dVWW42NnhaMHk4TmxrKy9TUzBrN0RTamQrYkhNNmxiZ01a?=
 =?utf-8?B?S2FXTHBaeXM3R1lOTWliU1VaYUh5TXN0K0h6K05ENkxPbnVYVTBDVktRYlJK?=
 =?utf-8?B?V2tvUEdVZ0xHWnRxK0wwSi93NFgvQ2ZKQ01IZld4NE15VGZpN1FHOUJuK2tl?=
 =?utf-8?B?a1NGRE5TVFJjenhxMTl3bVQ3MkpwTzY0c1c2emRyTHdScmY5OUVUeDlHNmxq?=
 =?utf-8?B?R2g5YVVFRU1YR0ZPWTdUUGQ3V1dDRnU5bHc4TzEyMjBtQ1ZwbWpHM3B0OUF2?=
 =?utf-8?B?bUh4eU5QTnpMVDY3UFNONGNld3Jialk3Qlk2SXUxQ0lxV09ocUQ1eVd6SE9U?=
 =?utf-8?B?ZkF4d3lYd2M4bHVGN1pseTFXQng2Q0tXRi9Hay9nUEFWNnV4aVU2MTl4SVQy?=
 =?utf-8?B?MWlpMDVVdG5yN1J4eFRSTnlsSllodE1IbTkzcldKRHordm5SZFJYWmlVek9o?=
 =?utf-8?B?V2Z2eThBLzMyRnI5YlNrY2Nrb045dUVjZW4vdnZuUGx0ZDU4eUV3c05Dc2xL?=
 =?utf-8?B?elhaNDFuc1ZYNFd5UlgwMTZ0L1hHRDJBckplNTVpOWwyaGM5Sk03OW02VGZS?=
 =?utf-8?B?S3ZQYjk3SS9FZVVWNEdndWYvZWE2K0dreE5RYS9RZGpuUzRwMDNLL2FGM1Nr?=
 =?utf-8?B?Mlo2NTlaZVZicW1tZThRZGIwYkgyZm0xTDltUGdqS1JBZUdYQ1p5Mk9TeVBO?=
 =?utf-8?Q?RZCDPYF+YXNOefWNNfOgnYK5fdrIiwFr9a34Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHd5c1NlV0NaUDNUd0cxTm9oS241VUxTZzZWL0FoaDV6ZVR2MXlKdlExanQx?=
 =?utf-8?B?dmY1S1lkT2ZDTGVOUEpsamJxTXJuM0NBVmZTZGRDa0JXMWYxK1F4NWJuYTMv?=
 =?utf-8?B?VVZYWGRHWVFqS090RHdWcmhpSHQvcmlJd1g5MlZmSnVtY1hOM1hUUjE5UVNS?=
 =?utf-8?B?SGN1TDFIc2xodkVlTlFFTzcxcmdJeGM4ZHE3VDM2aGxTSXY1MkVnUWZEWkZ1?=
 =?utf-8?B?WU1VMkZYWTdmRG4yQkhqMy81UHFUbGw4NHZ5bUhJNjkxRWFBb21UZVlTRE1H?=
 =?utf-8?B?KzhvcEJqeGRYL3Jqem9HOC93dlI3VWtPVE5jdU12azljeHkvN3FpYk5NcWo0?=
 =?utf-8?B?S0tiRGRjd3FadjJHYVpyUW90OU4vSzQyWTR4djNxRlJadzhkVkpZQmRMVmxi?=
 =?utf-8?B?M1gzbGk3bG1yWXpGVWVsV1pvSHpXYVhtRllqYWh4eG85dmRwVC81MnJUdkl0?=
 =?utf-8?B?YkltNUFhTXhxaUZyTFo5cTFNa1VFbHdQbHhJUUNvdXBqYzU1eDNveHFkVFNq?=
 =?utf-8?B?OEltZmNidUE1citNMmpaemQ4MFJDa1Z1M3dGVWE3N09qYWE5dndLUTBqV0Z0?=
 =?utf-8?B?eXlRdFB3QXZUaG8zTFA5bjR0ckxWSk16RGxsUk5TQk0waHRhK0NwWjMrZXYr?=
 =?utf-8?B?ZURhRS8vbEZaWjBjSDUrclRhdDBMM3lwRDJmMG1KUGcrS1ZZbWwybWUzQmRT?=
 =?utf-8?B?eVZQSEM1NG1HL0tMZC9GSXRlMDdwOVc3SlhEcFhhUlN6TmEvNWJNR3AvaTR2?=
 =?utf-8?B?MVpYbGJleHUvdHNob09IV25UWGkwOGREdTN4SlA5a1MrZ3AwckFGdVhBTUlu?=
 =?utf-8?B?ZnlmdzNpeWFKa3FCSWNQeWRqQmwvLzUyQ0liUkxXeDh6MGdpbzFOcnNOMXNR?=
 =?utf-8?B?SVR0SENuYnJuMGIybXRTajVXRXhraDR3UWFkZ2RxR1VqRnNocklQOHBTMHVa?=
 =?utf-8?B?cGI3alBPTVNJOHFwWWlMc3FhTHk3bmtDckpYTm5JbUd2UXhZY3NLUHM3R0dz?=
 =?utf-8?B?aVo0WHRyQUdmQU9FYWYrbmg0bmU5YXNJQWQ5azQ4T0JuNW9HcXNMR2ZnK2NN?=
 =?utf-8?B?YnhLUW01Q0NmdS82eDRyN0FyTy9tV3VnSzZleVVBTm91VmFXVE1IM25yNXJB?=
 =?utf-8?B?ODAyejV4ZGwxZTZhb056NUxJSVN0RGZtaFVqcnFJRDdPdm9wSncxWmZ3azhl?=
 =?utf-8?B?bkppUjJWOXFsaVdzRUV1Nm1YSDFQUUMyTzN3N05HTmpCUmxsKzFwVkZETDBR?=
 =?utf-8?B?VUlIYkNFM21uRU1DREp0MFZsUkRDYmlzR3gwb1pPYmRyeUt6Z2hMMTFrY0dK?=
 =?utf-8?B?aVpLYU1Odk9pUSs1SlF6U2ZYbVY5dHUwalJCNWdIN3VsQ25sRnI4M1JWVTUr?=
 =?utf-8?B?RTc2dXlpcDg5NGJsZ05PejJBRCs3eE9tcFYyalZhaWhzY3NhbXNuWWJSQlhr?=
 =?utf-8?B?VFBzN2h2ckU2cklRQkN3K1I3VHNHejU2ZjJUUzhMdzVaWkFiS2sySjFzUVJs?=
 =?utf-8?B?MzJxR1dsZG9RUVBWbnRlWFN1YlU0ZUNzTE1EdEF2MldFbW5xbktVUGg2aFFn?=
 =?utf-8?B?YlhtZlZPZWNPaG1pZlhFVDhKZWZLYUFOcjM0dVY5SE9IRlpFYmwzV2I1ejZh?=
 =?utf-8?B?QUZaZy9RM1dGRFNQcWpHa3VZV0JHY1dPQ1RhaU95cS9MYTJIR0x5d1hHc0Nm?=
 =?utf-8?B?TGprYTlGZEw1Zm0zMlpHZEJFNldicFhVOFRFK2JyRlExcTRKclg0TjBuMlZ0?=
 =?utf-8?B?L1hyZExpRnk0amgzNTBua1FnTmVKTDBhQ0sybkdOZDBZS2czNHdzN0lWWEVX?=
 =?utf-8?B?eTR4dGRHT2VtMVJtVUxxZGxZSnRSREIrM0x3WHdYTzlLWkNiclorMXZ1c2pO?=
 =?utf-8?B?dHpBZ3FyOWJoc256WEk2SzdkNC96YlI4RWV3MytxMGVrbC9iR3B3ZkFPVm9M?=
 =?utf-8?B?dmFoOWFJMTFmZ09WNHpaNk1ubzBWbmJlMW1BeE1CTUlpOUs0NVJQYnpZRnd3?=
 =?utf-8?B?VG1ZV3ZjY2cyeFJLWmZhek5UdDN6ZE51K3BPZFJwZ045K0ZaSFlrb0p0aGw2?=
 =?utf-8?B?QkFwaVp4WWF5ck5VTDZ1Njh5cjVsSUJQdmwweHU1RHlCc3dPNmdqdVRRWW16?=
 =?utf-8?Q?MekU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace1005e-164d-44dc-7240-08dcfd640e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 06:35:35.9533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjfEUNgJCvWZYtgfgYT33B3eO3v3bDyw6IGVmyIeE3m63e9drZtw0+4ItSVbGOKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QrVByE35FaevVB5phMTkiNR5DwMfuRRqVSUkUktKVo=;
 b=aFJubK2v3NHPbwYGbhk/yasHxAGy/n0uBP75ZxRpxT6HZXmwi6Ptt5mMZrVlDXwTDUWCdKSFyzEd9qGDUKQ1LYdRac2KomO3SgYxFdowu8u5DDhZtLrTCiVF8J0CM//0fW2u//26KZOzG+8PdzFzVKpuVh1vIVnFiJ8MOEFUKqw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aFJubK2v
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/versal: re-adding
 xilinx-prebuilt version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon, all,

> The regenerate all defconfigs commit removed the xilinx-prebuilt version from
> the versal defconfigs.  If the version is not defined in the defconfig, then
> it is not possible to change the xilinx-prebuilt default version number
> independently of the board configs.  For this reason, this patch re-adds
> the xilinx-prebuilt version to the versal defconfigs.
>
> Also, the vck190 board name has been added to the versal_vck190_defconfig in
> case the default versal board name ever changes.
>
> https://github.com/buildroot/buildroot/commit/edc0a6b1a43689fb832bc024b5997312e0770e99

> This commit refers to the new "Rules for defconfigs"[1]. Those say that
> defconfigs should now be formatted by `make savedefconfig`. So setting
> these options manually wouldn't be consistent.

Thanks for clarifying.  I had overlooked that.

> Yann had a similar problem for the Linux package which they fixed by
> setting the default version to the oldest supported[2]. So we could set
> the xilinx-prebuilt default to "xilinx_v2023.1" and then set it
> in each config to 2024.1.

I am not sure I like this approach for xilinx-prebuilt for two reasons.

1. The kd240 and vek280 boards were not released yet with the xilinx_v2023.1
version, so going back in time with the default could cause build issues.

2. We would need a hash for the default version, and I would prefer not to
promote the use of older software versions.

> I don't know of a solution for the board name, but the default shouldn't
> be changing normally.

Agreed.  The defconfigs can use the default board names when applicable.

> [1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> [2] https://github.com/buildroot/buildroot/commit/b2fdc16c47

Now that I think of it, this patch set is not necessary.

In a few weeks, when xilinx_v2024.2 is released, I will bump all the
defconfigs to the new version including the version number in each defconfig.

Only after all the defconfigs have been bumped to xilinx_v2024.2, I will
then bump the default version of the xilinx-prebuilt to xilinx_v2024.2 and
we can then remove the versions from the defconfigs again.

I can then repeat this process every 6 months when a new version is released.

Does anyone have thoughts regarding this solution?

Best regards,
Neal Frager
AMD


>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/versal_vck190_defconfig | 2 ++
>  configs/versal_vpk180_defconfig | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 697b6c5169..448195d6ac 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -35,7 +35,9 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
>  BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vck190"
>  BR2_PACKAGE_HOST_BOOTGEN=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> index 9fc694a898..a4a6ed98ff 100644
> --- a/configs/versal_vpk180_defconfig
> +++ b/configs/versal_vpk180_defconfig
> @@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
>  BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
>  BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
>  BR2_PACKAGE_HOST_BOOTGEN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
