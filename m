Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EBEC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ECB240C5F;
	Thu, 15 Aug 2024 17:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDVmywbDK5xM; Thu, 15 Aug 2024 17:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E7840C63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E7840C63;
	Thu, 15 Aug 2024 17:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5BB1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A66840C63
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJdsLYDmvzyO for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::616;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 537B040C5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537B040C5F
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 537B040C5F
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xx3dUr2JaAEPQqY34DZOObFZ1H4GC/V0cqdpo+xfBGC+6k49JrcR90GXNHAZ1gAqrrYROU2nsaICeFWt51Eh9W1DELKJddY9tcBgic5KyOjYMwmHRQv7aM1+vPNiDjmN27IR6BqydlpMKuvYKrKIRQEiYNXCMf3cWzo5jAT+HzMQGGZ1jM+K+z/ymcKc00UQKFRG98Bmcuw7iI1T0mtoslDzbNXRJ6PLzdO3Lk3cYOIRERIDvwYxqGxWi9hPZOxMSh0qrv9Vj4SWbtCR8c2sWwNCwX0tDDtVxXDBEN20zLnUYnWC3rke0GTWidcfwbmtsravGVoeUD9Cfl58sj2udQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfyUlM0QVgkBWz/PqvcVWMHaOVY90pQYaCHN6OvwGek=;
 b=p8l6wBnfixSNehlD25K6ddrH4CzWfbf0YQZx6a7YIvfh0Yj2NRFaXYAd+8dFGApBIzHP2O48XlqpkBLpo/1XkbKw1dM6FN26dyIKu1ycSTu8EI/F8ZtkLRQyNQ1P+n/3+hzFkO/1XINql/Vss69OZvTVaUCTNT/h4dTPA3cWDB1KJ1i0IQZBldS01BJ33wWBfvk4wSWDRW38Cwoh/wbIQuC8kaiKF8fUYHFjuJmkH/3bZfr0irQb2Mqvwj88U0Lc3cJZ0qW7I9WlHHfZ9xbRXiW1HA5IH+3YI5Rtqz11nBF8B3D4aoyj2r4ArTBZZ5JDeoKIYNxlhGgQvnFxP7e8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Thu, 15 Aug
 2024 17:43:38 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 17:43:37 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/2] boot/uboot: use $(TARGET_OBJCOPY) for ZynqMP
 pmufw.elf
Thread-Index: AQHa7x6We+NPy9g0OUWd8Qbp5Cj/UbIolkrw
Date: Thu, 15 Aug 2024 17:43:37 +0000
Message-ID: <CH2PR12MB5004B8554FC363065B63C24DF0802@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
 <20240815-boot-uboot-clean-for-pmufw-v1-2-3f0d9909c0b4@collins.com>
In-Reply-To: <20240815-boot-uboot-clean-for-pmufw-v1-2-3f0d9909c0b4@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CYYPR12MB8921:EE_
x-ms-office365-filtering-correlation-id: 38896e7f-592b-4037-1d76-08dcbd51caf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?THlKb3Q5NlFKV093bS8wR0tkSGNsbmFpWDBPSlp1NXYwQ0hQYXF5eERraDJm?=
 =?utf-8?B?WDVQV1RqSVRpSER2TWI3UWFobnFFejQ2Mm1SbUxvcVNZRmRJK0hmdnIyRDY3?=
 =?utf-8?B?UHdNSWJSSUZRV0lmRG9vWThYWkdYSkgvb0JhQ284Y3pveWoyZ0NPNEI2aGpU?=
 =?utf-8?B?aDZBaENpeWFuRkdvRkYvbzY2YS9Ud2xOZTJkanRDd0w3U0p6YUx2bEdqNzNy?=
 =?utf-8?B?UTIvdS9TelY4MW96eVM0cHBLQ21hNG5XL0hTVlpLa0o1YkhHRjAydm02Nisx?=
 =?utf-8?B?bHIzM3RqeEkyRk5PRnh0THNkOGJISlhMc0RLN01BUE0ra3Z3N1RTb1RXeW96?=
 =?utf-8?B?Sk9GRkFyMnhnMTNEQ25LVVh1eFZzd1JzbUh2ZE1RaGhhdzhXV2FPWEw1ZE00?=
 =?utf-8?B?dm9FNjM3Skx1TVNLK2JXNVh5cWRDc0RFMFJMbTFJTEFpNmcvak9qeVNvQWRv?=
 =?utf-8?B?RmtPTGxJYjJUdU45cVBDcVJWVzRYa2dFRnJoUzI2cHZXRzU5cWdBTUR2ZFp5?=
 =?utf-8?B?V3RzTCtYVUFWRVRKbkpCS285L0FCdmQ5Y3Y1d0FydkJWdGdIbjQwcGVDUkpT?=
 =?utf-8?B?SktJd1l2U0xINGpLSDFDMmJ5d3p1ZGJGcnFPdmUwcm13SXpKcXNOWlc4L1pY?=
 =?utf-8?B?TjJMbS9ERHU3UzZ0cndoWThNWCtsNjlZZU8vV2owMDh3aWZ0KzBFKzQ3Myto?=
 =?utf-8?B?ek1BdXhvOG0ycCttckxiNEJkRDAwVUMwL2wwd2xaMzMwNnFiSjVRWWQ5MXdr?=
 =?utf-8?B?V2NHTGVlSzBMSkVWOHJOODBBR3E3MXBSd1JEcDlXcVFEbnYxQzI0YmgzUUNE?=
 =?utf-8?B?bFpJeUpCb1pXWWpabk9SUENoaXdOdWIzMmtGVVUrVDdOUjhxeDZ1RTR5YTZI?=
 =?utf-8?B?T3VaYk9ueEt2MlUvM0paajZIRUpEOWQvcHJhRExKMVVTYmlzRktLU2VVbWpy?=
 =?utf-8?B?eFVsSlpjbmJGK2RBenBlb3dRQnQ2ZStIekV5QVNmRUpLNjAvb3RHU2V2MSs1?=
 =?utf-8?B?cDRBUXpLYmNUSXZIdTYyWjdRVGdOWGd1TE9pL2hZb3ljZlFQVHBtN0duQzJS?=
 =?utf-8?B?TUNCWkJrU2xyV0pmbUorZjN4VXdOQVZHVnB2U2JHMWNwVGMzU2VmN1QxTXNX?=
 =?utf-8?B?WWdyNkpDWE01T0VOV3g3SnVybytqUnhOdkZVSk9vWEp4eExkNG1HakNWNlhn?=
 =?utf-8?B?L2hLaWdVbDRqNnZzS0tHWmtnQmNLYzZuOW95SXBUNE0zbFZ3YUdlZnJjMEtX?=
 =?utf-8?B?ZWhmUy9SRUFKT2RwUnBHdlpadkpYckkzVjNTVzRpTFNqSTZCMmVNc0xzNTFs?=
 =?utf-8?B?N2dJb2RwbU9qRW1iYnNDcU80SUltU0ZmTjlwVUQ4UzlsS0pDUDVpSWRPSlpM?=
 =?utf-8?B?WThITDlEVy9GaklNQTlvZSt4cGl1YVNwVGt6dGVRNUhyZjFmTERDR09YRlpV?=
 =?utf-8?B?NEx3OERYZ0hqWVVITVJGUnM5YS85Q3ozaGFGbW8wekk1V1NHKzl2THdmbnU0?=
 =?utf-8?B?ZlhLSWVURkxpTW1sQzlXcDdiaDZ6NWh6ZitjV1ExTnYrNysvQy9sUWM1TGF6?=
 =?utf-8?B?SkRGMVI5cmtPdDZuQmU5bjRSNEFiMXZUcHZuNUZpQWovQW50ZCtlZm95NmdQ?=
 =?utf-8?B?VGlBZS9jN1FKUW5lemxydWRwTm15MGp0a1ZveHFKTExLemlFaElCMXQ3ajJp?=
 =?utf-8?B?akM2dENDTHhPSDBIdlpqc0dkMnFLL0p3TUZVeGIvdW9nT1pXaFltTS9lNUky?=
 =?utf-8?B?OGdRZkdiNVNTeDVqSTdvTis4dFJ1cmVXRG5yanRRdm0xbGRhQXUveVFSb0dn?=
 =?utf-8?B?bTNTWHZmY21CL1RhV2VuWVQxN2dEQXVNSURJMnIvblRIV2dDRjF1K21kTFFO?=
 =?utf-8?B?a1lRb2IyYjFuMEI4L1YzRVIreWlXTHJvS1VIUG9ldUpRU2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STA2dEJ4cUFtSk5ZVEJqa1luYktXVElTZWQvcldDTE01Q3M4K2FjR1ppei85?=
 =?utf-8?B?Tmp1Njk5MVE3bjFRUm5Yb0c2THIva1hWNEY4dllHc0Faa1IweUk0djVjQ3Z0?=
 =?utf-8?B?ako3R2h0bjdBVE1ZQjBiTHVhMExiTXRSSjFZZ2xSMVRxaHd1RXlrc2xvcXlj?=
 =?utf-8?B?L3BpQ3gyaUhlTjFLMzhMTFlwK1l1bkRmdHVnNWdMMzhqZVVyQm5MMG1Namw2?=
 =?utf-8?B?RlBFdEduQ0JDZWwxYUZmMTkvbWR1U1hhc094TysybnN3OTBKNG9LM25BYUow?=
 =?utf-8?B?SUtVOXhYSXFPeHYzaC9SYkxYUkxMMG5CNzNoNW1XMmFvd2hLVVZERHEvQTJZ?=
 =?utf-8?B?RklYNTBLYk1lYUl4RVk1aHZMZCsvcWtrTnBIZERaYnptblJRekhMREpRSVlp?=
 =?utf-8?B?TTAxVjlXUjIwcUs3K2ZVLzNXZko1T1lCYi9tbE1vb1grdno4WGZJdnpFSDcz?=
 =?utf-8?B?dFpVZXlxTXREamtwTnF2cURMSnlXZzVSQzl3d0pyeldYOXNoK0dUNkI5TDdJ?=
 =?utf-8?B?ZGw2ZUNYVzRwV2VuZFBpc2R5UjFqWXQyZmM3VGMrdHlzNnQxWFVWdjZVY3Jm?=
 =?utf-8?B?NnpIeEw0T3ZEajk2amx2NFhiN3JIWTErRVl5akJEY2JuUTgzSUhTbWVXS2hS?=
 =?utf-8?B?d04zUjJzZnBMZHBDY0hwY0RjTmtyT0hISXB5OEJCejFpc3p3djZDQ1FWZFBy?=
 =?utf-8?B?NXhSU21qelRFT3ZOK0s5MTRZU1R3eWVjemtXYUIrcHVKZWZpQ2k3ekkvTjR6?=
 =?utf-8?B?R0d4c3Znb0p3VmlJdHowOVFmaTdTM3RLNTNiWWxyYkhSdGdPMlZLY3hOT0J0?=
 =?utf-8?B?WmVVRzVpMVFqQVQzTDZEaGxwZTRUd0ZzMVZicm9sUnhJMnJ1dElqTS9UMEdY?=
 =?utf-8?B?VE9ZTTcvck1TcUJ4Ymx1VDRvQVVMeTVJU01adG8raFJNYUpseklCeGVrRGVu?=
 =?utf-8?B?OGpyNW44UEtZaVlvZGsrNUlaTkdPcE9OVnNlK2FxVTAzdmVPVnVackpoUW9j?=
 =?utf-8?B?NkNuNjF4Mk45c1JUdVl6dlNEUFR0MEQ3WXB0Rnp3T3VMdW9xeGdTdGdsbzVJ?=
 =?utf-8?B?K1BIcklMNnFPeStPVHQrek5ubTZpYVdaLy9FbEI2eDBlVlFGTGloSCtGTkJ4?=
 =?utf-8?B?bjl1NGcyanVTb1pyT04wUUN5VmFMMVFnN0ZGRGpDaEJnZXJzc0YvWXlBUTly?=
 =?utf-8?B?YkpMWjFoWEpaM2x1K1NLVVJPVWEwb1FvNng5UWwxVlNBZ3lZV0hlTDFBUS9w?=
 =?utf-8?B?N0FyZVBTUFRpOU5GbEJvbVNpUWQwbURVSkw2bDFKZnRka2c4dXR2ZlVlZGlW?=
 =?utf-8?B?SitiTlVzWWRFNTNMbE1zY3kvVTZlM0NYT0JEYWo1YlNxK0gwSHdwWE1YZzVD?=
 =?utf-8?B?eGpXSkVlNjJGOVgxYmVIbFcyUVA2Y3BkNmUya3l5TE1tdWJkVFdic3oxeUZT?=
 =?utf-8?B?bnpzRzFGY3NQT1R3RWZoc2lrNlZCaUF1di9zM2xZcGdSaXFjNXdhdjFHNkxO?=
 =?utf-8?B?L2pjVU41VTlKdXlKdXM2ZG1qazFJOW4zci9heCtNMnlhY1FldkxoY01wVkdW?=
 =?utf-8?B?dkFoQTVpbElocWZ6WWJ2YXdDckc1TWhQbG1vbjZTYityNHhMbTVIdnVyOGhq?=
 =?utf-8?B?aW1DSVN0cWpPU0xyK2MxcEZMV3NON0hVNDlPakc4NXhQN0tsRVYybkFwVHRO?=
 =?utf-8?B?M3dYMHlkeXhXemIwN1RYaDArSkpwL1VNSXAyL1VjRlJYdDZnWkRFZGptMnVZ?=
 =?utf-8?B?UmZYRWJpcE45Y0pBVXk2ZE0yS0o5MkhndUpLTWRzNkgwb1FRcVdkM1hVQS8v?=
 =?utf-8?B?SDBTUm5UMVBjV0o0ajl6OFNnd0M5UEdLaWhnZTRFMUIxNlp4NFJTUm44cjVI?=
 =?utf-8?B?MHpDMkQ5NHEwaVNvSFZ0NS9aYXg0VjU2Y3d6emxhZ2poK1F4TUdoazVZVUJz?=
 =?utf-8?B?bDlNVDNPWG5iODErb2MwZUdWZ1hKTlNqRTM3Sjdwem9veDRJNU9SWFh4eXZq?=
 =?utf-8?B?NDYvNDRFenhNMmRYS08xT252LzQ4UFlqdWVmeFZNV0Y5N1BBeEZ3SnlOV1My?=
 =?utf-8?B?ZHBCZzIyRGJyRTViR05CMUloOENXejE1dEc2RU1rN2UxOEFsbmlib0tBcVVt?=
 =?utf-8?Q?9Iu4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38896e7f-592b-4037-1d76-08dcbd51caf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 17:43:37.4422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcvMK8qmjSph1TEdWLBCesA4T46WSr8CaLIrig/CbcYaS5yO0KGjo03L2eBFy5VC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfyUlM0QVgkBWz/PqvcVWMHaOVY90pQYaCHN6OvwGek=;
 b=EesADls/zEkMJaOsx77jmr17dIDwnQzRTedFlgvufs0xjUeyD3YwJptKXC8P6DLy2q/nl8vjjqXpoTcx+vgOdsJAwUskKOHAp9Ja6P4eFs0Lu20Klidx4mzmM+8sKdOObstsUjzn73NF9+FbYAXOLZA6/wJpZqsfA/MwNiYw4HY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EesADls/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 2/2] boot/uboot: use $(TARGET_OBJCOPY) for
 ZynqMP pmufw.elf
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> Converting the pmufw.elf to a binary works with any objcopy, regardless
> if it's from the host or cross-compiler. Prefer to use the
> $(TARGET_OBJCOPY) as it's always available and reproducible.

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

I confirm that objcopy is arch agnostic, so it does not matter whether it is
an x86 objcopy or arm objcopy when converting a microblaze .elf to .bin.

You have convinced me that this is worth changing because of your
reproducibility argument.

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
