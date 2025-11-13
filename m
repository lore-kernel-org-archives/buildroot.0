Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA25CD4F28
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 05:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECEBE40730;
	Thu, 13 Nov 2025 05:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOiqi9A6lvha; Thu, 13 Nov 2025 05:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3442E40C85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3442E40C85;
	Thu, 13 Nov 2025 05:54:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61084230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 05:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E342606F1
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 05:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpSDDleOhsr3 for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 05:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63553606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63553606F0
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63553606F0
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 05:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCRMXbKiUAjnJspfZXQYRmA/XsYaYRnBHhlprG7U+jI5IyKgMFmtIFhmH/iziNXVlJUakxz4c0tTEvqHdVWzEh4+ZTKqpoOXqwPSKz8WL6CWMwmGijayu2+mHJnUnydTVqHXlcpGcXTlodtMqSd23bqzmw6gS8tj3VjQ0WHKOneCo/m6GwWB8qJEuAdI2DH9s/h5BrvZc06Rr38J2Tk8scQ5BWQ8cMp9TagS4uLl3X3UxAGkVvyV75uMCd+DftqtMITwDlJOO7Ff3XkcS++MKqmxfOqf6ac7Ri1LEAy9149vTca2yJy9/n/v9rvX1DwOcuaYHgsZJM3hOAxgbsYnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yHg0zkiaY25RW1NLe6NWLe9r18Z6uiorhiyCbFUg3E=;
 b=p3ABhJXe1/ApFcr4ZdjkylfV5eg2h500PQClKEuz9QClQ5fB4ino8Mdg6PfyYbFrWTWwyni7NbG2fiZIU06PLFKrwiO2H24OQJT45zB5jC8waOQkbYGu64gAbzBxfsNcstAjP7D8IQQDxEYtXKtDrHM97ebmbivwJxxuP2T8KNcUMX7GxkOPF+gpQi1WfHIyYOv0qFZR9tacrfO7I47p19EOUbxwbYh2/cD/8WLd6xb9j3gKUOp+6ZGJADrS6HZ4Iy24WS1qy/AuHVFD4EuDmZzNzuvUpjPdYXvbuMImBuD/tBBtbrd211FS8/ZYVZxdUyGd7yXWYKZ+pAGGhx4omA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:54:30 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:54:30 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] boot/xilinx-prebuilt: add support for kria-common
Thread-Index: AQHcU7/gYOcDN50DW0CmFE35M1DS1bTvPvwAgADcRFA=
Date: Thu, 13 Nov 2025 05:54:30 +0000
Message-ID: <SA1PR12MB56156FD41429B65E64D6E1A7F0CDA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20251112103353.2021040-1-neal.frager@amd.com>
 <DE6V6QTL9BNK.1MWWL0RKSB8BU@bootlin.com>
In-Reply-To: <DE6V6QTL9BNK.1MWWL0RKSB8BU@bootlin.com>
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
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH2PR12MB4086:EE_
x-ms-office365-filtering-correlation-id: 8a9caf8b-24e3-47bf-5b7d-08de22791d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?NUJqMytEa1MzNEI0R2laZjR0b1BMQ0djV0ttYlZ3S3V0SVkycVpReGZ2OUEx?=
 =?utf-8?B?Z2V2NFRURU1sNk1Ob3JzSWxlQkJ5dUF1cXVyclNwT1Y3TDRYRzIwa3dRSTJy?=
 =?utf-8?B?VUxxY3hMU01LeEYxTTY3NkhvbmNBU1hKdHR3NTRBa1lzaysrOCtBM0hEVU5s?=
 =?utf-8?B?Z2crem5nNklXZ0lmS2JMMThXWUVnYmpSbGd4VWtYQXBGcGhYY1dON1k5SEVV?=
 =?utf-8?B?VmgxaVljanUxRCtMU01ZYWRCU2NYTkhWUmdvM1QvRlY1OGZTU2NKZXFPeXhH?=
 =?utf-8?B?TVVPVDRNaHE4aDIxR2QyKzlBNWl6ajRheGZkM1EvNU5qdUZMd001bXN1M2J5?=
 =?utf-8?B?aHVFNURnMmJpNHlHSzNNbGVQbllRNC91bExmQmN4aUVEUzVtOWdvVEFqaHlx?=
 =?utf-8?B?M2l3YVhHYnoram13ZzdtSC9FQ05yNk5zb3JYZVRPUENKblBGWDlZN0hZc3lh?=
 =?utf-8?B?L05kOHRmeHpjSjEzNmo1U01WS1ZQR05Vd1E2ZnhEWi9wK25TZ29zRm90ZGxv?=
 =?utf-8?B?Y3B3Y0p1bytiZVhWaFA1TVZNU2ZmemU2ak5NcElIdWRQeUkzSUFpOVJEd2JC?=
 =?utf-8?B?aHlFYVZjS1BzR0VLbnkzMitVcW5saHpNVmdkcVJVMEtDL09XOE5HRnZkRUxL?=
 =?utf-8?B?U3lDTGdsUkZRUVhRL2NlVGVUbU56Qm5QZDBSeW1XdHkrL1V3NXorVjBRS1lH?=
 =?utf-8?B?QzBFWXRBUXJ4dDAyTWF2VjUvMFNieWFha2VhWHQ0WTV1WmFweGpyeWx4bnRM?=
 =?utf-8?B?SjcwVEJIMmIydzEySHVZUEpBNzNxemdqTVdGYXJBbnA3SzlDaUdUMUlnSzIz?=
 =?utf-8?B?K2lMcmVZcU1HWmdPSVkzSUxDeHQraWwyOHZXakR1dFZab2wwUUcrWDVMN1hr?=
 =?utf-8?B?NGhjVVRnRDJzaWQySGJ3U25oaW9JWWZmTWFXcTM1WUZDOExSOW9UajFTRnAv?=
 =?utf-8?B?d1J0K2d6VnYwcXNxRkVCc1NVRUl5UHVEdnRpcytEZkRwNFB4NjdldmFiRUxP?=
 =?utf-8?B?eEtNTmNGVjh6KzAzYkJBM0VJaGZSd3hrSTZVV05SYXgxVkhBYXBrK2hQR0E0?=
 =?utf-8?B?VEl3RjFkN3NrR3dGUE9nQy9Mc21ZaGgzNVJXa1YxWnBDK1NWd0NmSkp4NmtQ?=
 =?utf-8?B?eVArL1hpQ1drNEovNEIydEtkd2NTOGtKa1lmL1FON05IM3czd2FBSFRhellp?=
 =?utf-8?B?VmxjQTROWFVjRXF2b0Rzc0ZLYlV5ODZ0TktGUmduUGhmV0l0WHI1c2JUWXpY?=
 =?utf-8?B?aXhYNDEyNFBObG1TNVB2UG5zcGZHYk5Sdy9MblJ2cVV5ZFQvZW90N3Izb3M4?=
 =?utf-8?B?MEpjYTRINTYzUjZxYkFKcGx1eVFza0ZDWFRTSlkrdXJRak9QVmtlSUJnS29p?=
 =?utf-8?B?MUVXK05Eb0tBdnNaSVcxNytRN0d6bVA2MW1SQjh2d3ZqTHgxckpTODYrRksv?=
 =?utf-8?B?aUpGT0pjdGYvZjBvRUNROWpaeVJxdHkvT25KN2UzcFZ2STRSaWF4aldXWXlN?=
 =?utf-8?B?WGQyRTNXb2o3MzgwV0lITitpS1ExbTJDU0tTR2lmbVRLVXd5VE5VeHNlTkVM?=
 =?utf-8?B?WmtBcGJZYUduc0tIbUNKcUZoZVhnTWFXckZMb3gzajJLcGI2eDNrMjZRcm5q?=
 =?utf-8?B?LytsRXd4TnA3RlpNcFNsMXlZTHNlTm5Qb3RUN0R2T2FIbStpMGI2R25rS0ls?=
 =?utf-8?B?a3dQbW1SRWZsSC9tMjVRWkdHd04yWUtUNGxyTXRNSmwyUk1EUkl3TjJIbi90?=
 =?utf-8?B?SFJPV3dmU05BT2VVMFM0MG5zc0NGS1pSN1N2cXRhZGpQamhnS1cxOWFLVjlP?=
 =?utf-8?B?OFFXcmlWTzJIdnVOV1U0ZE9hbWxiUXpsQnZ1SXIrSGdWcWQzYUQzcGMrUmhU?=
 =?utf-8?B?Ty90MVlYS3IxNTlZYXR0TW00SmxQM3NmWUxYRm5JdCt5eWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzBNQlVvam9lL2ZuL1dZUHRrTzRKSUloNTRQSnh5eG1vZkU1TjlDSENVZ3VP?=
 =?utf-8?B?M29USHMxUGhzV3lCREI2VGxPU01ySnpvVVdWeUp3d0pzTVlqNTdqMVZIek4w?=
 =?utf-8?B?NTVTb0w3djhTOGZDTmF5VS9xSWx1ckN4R2dWR0l6SGZHWHIvMURhT3NMaVhW?=
 =?utf-8?B?NW04Q0RlSTBQRXFDR3lTdUhlVnBkQ0M2LzZzcVdZMWVWT0Y4Y0hIR2NacEI0?=
 =?utf-8?B?a3RoazM4SlFrVVlNNUMwU1kwL09XYVg1TUlqeDBJYm94RDBRelcwMElUMnN3?=
 =?utf-8?B?eVdCRmVudXk4QlR2VHJnaUFML0dkNlcxM2pLWDZhaEdtUy83OEJuNFlacDN4?=
 =?utf-8?B?OXZkK0J1amgxZmRKTmQzdjBPRm9NVUlaZXdFM3BlMGVOWHBOd0R6OS9lOU9C?=
 =?utf-8?B?RWN2QjJTbGdlL0NlZnNhdUVTWlJZSXQrSnZpYkFLSzhQbDdwbmtLR3N2THRF?=
 =?utf-8?B?S3R0YzRvQUNYaHd3SzVsWmg4dXp5R1VJMSthMklMT243WlE1UzZmSnZZeFFY?=
 =?utf-8?B?eUZEdHdKWXJoV2pzOFpQZDY4b1puNnZFaVZ5c2dSZk1ua2E5Q3ZDRmt3UHBt?=
 =?utf-8?B?ZDJlNTRQK2NBVDFhZHhjVHRFanNnR0cva1ltcndVam5uMWZIYWJoeGxBSXNR?=
 =?utf-8?B?ZXROc3JhRU5wdGczS3BmUlJWVnFraUtqM2tZaTRFbVArQ1NId0ZsTDQ3VXNE?=
 =?utf-8?B?ajZpNjkwVm1xdVZ5M0FNdGVkdktBUUxBSUNJUUlMVEZCTWhqcnEzSmdxRzNx?=
 =?utf-8?B?aTgwMG0zeTRaL0JyeDY0RTYweGRrQnpoTHpQNTg4dHNKblVreGxkWUl5bXRC?=
 =?utf-8?B?K25admVZMkhiQkpzSE9Ld2plV292L3dsSC9GeHQvMmgxMWI5N3c5TUFqaEk4?=
 =?utf-8?B?eFpIUUwwak83ZCtaU0VIOFdPM3hXM2pCYTFYL3JpQ24ySm5hOXFrSFhsYlZx?=
 =?utf-8?B?Z1VoaGNZeFRLdWNEeGZCL1NXYmJlL1hORmM2M1gwc2JxR3Jwd0sySmVUN29J?=
 =?utf-8?B?UEhRNFBWL1BVdnB4T2dJV0UreEU4WGNTSHhrQVZYUTB4T3FEZWlIM1Evekxp?=
 =?utf-8?B?QmNhMHBLbG1namtBV2puNkN6QnVWRTJxMUtYNGNvVmV1U3ZQazdvTEx3Yjho?=
 =?utf-8?B?aXFmMzA3cDRhTURQc2tjRlFqVjlkWng0U0N0U0RUdkFiVXVTb3lkQUZ3ZElH?=
 =?utf-8?B?Zy92b0tncnZ1WXBJTWpKVG95QkRDQmxFSGhUeE1ZUWg5RkJhRTk2MjhiMWtK?=
 =?utf-8?B?TUR6REZJdjJnVlZrbGFvSjVDVnMxMXRxMmcvM0x3Z3M3T1F4Q1dzdkhoNnVR?=
 =?utf-8?B?TW5kY3YxRjdndGI3SlU4QlAyc1ZjbnI4cGRFYmYvUWFoM0FFOWdiOGhsWFBx?=
 =?utf-8?B?TnNJVzBFOVlQd2RWeDdwNGUrejJlTUs3NmlPOGZQc0FtNFl3a2VNYUQ1ZUlX?=
 =?utf-8?B?RER0cUJaR2tZN3NycUl6TWI5ZXArZ2JTSXh3cmp2UXIrN0h5SW1tN3R0MGVS?=
 =?utf-8?B?SmJ6TkFiSDJGcVFWRHgzQUNVZ0tFSis5TnVGVDhJMWwwV3JGa1RXMk9iU01j?=
 =?utf-8?B?aS8vM1h1QUMrTXJ0dDJkaE5nNWwyZVBHSmlMN255OGxLZnJiMmpkRW94VUs1?=
 =?utf-8?B?dUhrU2JiTGpoUlVpK1dxaXNRR1dxM3FhUTBVbWtHRFdGTVRpVk5YUVNWbW1t?=
 =?utf-8?B?V3F2bmlXaTh1YU52QzNtN0N0U2FueXBJZFlFTUNCQ01uUFczalZrV3J5Ykth?=
 =?utf-8?B?SEc3OWtPektOMUNtdmxWdnpsdzFKcjNQUmtxaXpoZUxoS2dldE5jWVZTV2JX?=
 =?utf-8?B?R3Nsa2krN2xqWHlrbDVwWHBIS3Fra3BjTVg1Z281T1RtcXlvTnJlaWtvOUdF?=
 =?utf-8?B?UnNjbDMwRCtyK051RXN1Rmk0K3ZRVStxY0VHNXlhQjhacW9GQldDdGFMK0F0?=
 =?utf-8?B?eWk5M3piZ1ViSEhVRkJrTmh1L01YV0piVlE3eCtEWmllRys3dnMvWDc5b21H?=
 =?utf-8?B?RUt6VzdVUDhsZ29vb001UFN2N2hBdE1CTmlieFZ3MU15S0NaMkd5NmdGZUdN?=
 =?utf-8?B?UENBb3BnQ25uNlNiV2ZjcTkwdHpPampzMXdkeVRZMDYycVV3bkk0Y1ZPQmlU?=
 =?utf-8?Q?qVHw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9caf8b-24e3-47bf-5b7d-08de22791d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 05:54:30.8472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSR3yWGAVF0aO7GYZXiiSOXYkz2YuxymKcuPXr2SAQacUG3j5ptHLsI7sPlc2f6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yHg0zkiaY25RW1NLe6NWLe9r18Z6uiorhiyCbFUg3E=;
 b=I6SyY+/tAbk0LIKIqIRYV2mxx86p9IfGdHymQVqli5tQhLy3ATJTKS+dFxWkHCopG30PS4ivsLyrsUD6fOR5i+0TW5+ljfvxx2rmJCFXW2ayEFK/G7+q8M6km50p/2bhgPi2mey3VQZ4lYgySj46Z7otPM69W26JsWw2ArT6l7E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I6SyY+/t
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

Hello Luca,

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

This is also not the last patch coming for this package. I already have a
solution for adding versal2 and the vek385, but I am waiting for the
xilinx_v2025.2 release tag before submitting, so that you and others will be
able to test and verify.

> Anyway, the patch looks good:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for the review as always!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
