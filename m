Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEE9C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 06:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1272C60F7B;
	Tue, 18 Feb 2025 06:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ReRagMOOzyu; Tue, 18 Feb 2025 06:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0806E60F8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0806E60F8F;
	Tue, 18 Feb 2025 06:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D9772
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5003560F90
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys7mL8GJ6qoU for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 06:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::605;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59D6D60F7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D6D60F7B
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::605])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59D6D60F7B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgO7Ir9Lhy9uHqPffM5a5D5pcZgzpeibow9BBxpgWwFI240EHP9hZJKWCj6F4o9yduwIdhazQSwvYLgQlD4wL+AAaa5tlTQrUKKdLFg/Kvl7EtnqxioVsA0f7eB6NRfzh6QbT1xN8f+MwM1ES5mzKfJr2GCeP2QsOfydNNz3AqRdHSKTEushwtqiSSYZLjCoakhwaalt5U6eGfw4r41f5bRIboHJgkCfa1giJLi0rHHNfGIVpKZBCvHoovGa3d1HJp2GWtDKkP96oqXzvREZC4ffo9VtgtaYlThxKrZrreOO3uk7wEejKmAZNk3B+JCIde8Gz2h/PuOBJ8uublOEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkttxQmkf8Pi7DofZyROomi1CthSTZzIexy3ZRlcdgU=;
 b=hYLasONuI3qkODULPVkgLxA3gWemEbKSXN3wXZ93rKXkpZGm9BPz/hc4RPG6e4NUjkKzWjtMwtd/oCreORE1igHL4VNtnYiSLfNUrKnCQWsIi3NGC2QzkkrX1mIWp2ErUH4DVoPRcTdEisgOd9xDRB9VaT8rxo8g7vQHQu03OKAh3UbY11oAmRSloXaWRjkFklwYMPrJASPWgnprQOWuGoYiuu2nT7R8Z7d4UJyLFqJFaOMhmMC3nqyRw3Xxoif0LNlzY7qHs/YQpv4TgbByTub3hnRvh2pfUxs5K5XIOQgv2U+G897Z+22Z8Hw+HZE0Roa9EkWZFFRfq1LZUOSjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 06:11:08 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 06:11:08 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 4/5] toolchain/toolchain-bare-metal-buildroot: update
 help text for multiple tuple support
Thread-Index: AQHbgTp11Y1IxdF6B0+vR9k9do66KrNMEuWAgAB/1eA=
Date: Tue, 18 Feb 2025 06:11:08 +0000
Message-ID: <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
 <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
In-Reply-To: <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH3PR12MB8849:EE_
x-ms-office365-filtering-correlation-id: 35899a19-bf7f-42f1-3d52-08dd4fe30935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?blp0blJxdW5iaXZ6ZTBkbndyMVBMa0NINCtJVmhRcm1jaGhBekJhRHgyNW5J?=
 =?utf-8?B?VTZtUnRFWERGa3BEKzVNWDVFWllvcHppYk9BS0w3bGxBcFpIV3c3dDJsOWRW?=
 =?utf-8?B?bUdnOURMYVBtNlNjTzdNenZrcFBpL0NvbzAzNTE3eGRTb0lna21Qb2FweVc1?=
 =?utf-8?B?R2xrcXJNWStqNDRyV3FodEQxeDIxNVAxbVYwMmxxVkZYOVBXSVpwajNYY1lX?=
 =?utf-8?B?R3VMN1c2MXFDNENIeFdGckMwTU16UnJmeTM3LzdkZEQzdTgybUkvQnN1aTl1?=
 =?utf-8?B?RGRuek5LQlkrRDZsN3FlaCtQMEY0ZmNxTWJ0U0taczg0S0MybVBiNzF3VzQ4?=
 =?utf-8?B?R25GbDA4endFSkFTR0ZSUTdWbzRGcjI2dk41TWJlNmxkalFVZE1WQ1JoQ2FX?=
 =?utf-8?B?eU1PMjlGOFlXZ1MzNDF2b1JNOEh0Wlowa3FhR2dFUTM4YjdGR3gxcGQ2cy9K?=
 =?utf-8?B?VlRpVmxwSExTNWJjd2VGY2VIemxQVE8xMzdwdnFDblZJNHl2dkxiaXRuUlJ2?=
 =?utf-8?B?OW56UlJIUmRwTUk0eTVrWklDdFU2RFE2MTZOVnZzQjNnNGxxdjNWWGhoejlR?=
 =?utf-8?B?LzRkQUFYa2tlRURwWlg3RlpHSUJFRDErU2NQVEFyNS9MR2ZyV3lLSWdUWUdE?=
 =?utf-8?B?eWhpaXdXQzIwenFNV3BKSGl5QVBtZi8zemJ1a2J6SFZZKzhwY2ZyMWI4Vkg1?=
 =?utf-8?B?OXJGS29JTW43cDA3Z1M3b281d2NQS1N4dnU2d1l2Qk5FQ3lJMUVxN244Q0xP?=
 =?utf-8?B?bHlJWkZVTHZiRnNya241ejFXV3NUb29keE93blNweG5RblRJeUxjVWJzSnp3?=
 =?utf-8?B?Um9IVlo3RFdvMlZBUkNuQjlRa1ByRE5GdUk1QW8vZy9lNTBjU1Q0d2ozMHdE?=
 =?utf-8?B?Smw3aVlJR282N1BLQVpCUEl5bzFLSjNpUWRTeENKMDM5cUliNHRSVmp1elJU?=
 =?utf-8?B?WVBBUmpscjUvTzBhdVZEQyttOWs1N2sxdHVMSXBvTWRReGNFNy9FRFlGeEJ4?=
 =?utf-8?B?N1N5dFc5czBhY0FRSGovRDkvODkzOUNYMW91TmV1SGN2KzlpWkdzQUtJWW5l?=
 =?utf-8?B?K0o2bFFVVW1hTWRUWVRETndsVDFTdHkwL2NTRm1SUU1XbnNKOGRZZ2lyR0JX?=
 =?utf-8?B?NWgvN3NhQkRGdmxzbkpTOTBqMUFZTkZNQ0s1QU5leXdFUjVHOE8vN1NWQ0pk?=
 =?utf-8?B?YTBPb2lGOFVvQzUwVE5nTzYvd0dmcG5RS0RxZnV1V25HVzE4QktNUGJ6V1ZE?=
 =?utf-8?B?WndHeEFzMHRmQXc4QzUrbW5Tc3IzNGRrN1hLd0RWNlVtUjNKVWxQZTNURSts?=
 =?utf-8?B?NC9VdVFCZGtoUDhmMWRUQUpZenpCc1pYNFEzNHNhTlFmMkdEQS93bjRmejJp?=
 =?utf-8?B?VFNFcWlyNkM2Rk1FSmR5R2dHL0ZoQVZSZ1NLNVlzdjV1Y2Y2TlkzMjVtQzFG?=
 =?utf-8?B?bmZiT2FnOWIyKy85NmFsRW9MU1pFckNaaHRxSnpwc0Nha2d3MlVQd202aG9X?=
 =?utf-8?B?aStkRU5MeXJuZEJrUksrb0ZyNXJTdk1iRWJWem8xT1o4Tlk2Uy9vVHZ4N3BW?=
 =?utf-8?B?dXUyMi9adDQxcmMzRDdDQk1nWDVGL0NSVTV6elVCVTdrNDVIZ2QxRlhVcUFj?=
 =?utf-8?B?NDVxeVAzNDF5ZFFQditrMi90akk0U1c4MXlqL1NvS3gyWUd4Z0Z2bEpabGlK?=
 =?utf-8?B?cldNc2JoYmNsNjRROUQ0ZHU5ZFg1eTQ2L3ZwYWN0MFgrangvQkMrTEFmZlFp?=
 =?utf-8?B?K1ZwczNUK0ZaMC9vZVh3REtDU01INzhZeUh0bmxFT2JvazhyYnhDZzBEWjFl?=
 =?utf-8?B?L2xsZDd3R2IwSFRVdklMSjJySjZ1QlRtQVQ3SkNsMDlOZEM3cktmTlVrcUt4?=
 =?utf-8?B?Um1BckJmYXg3aFlmcDVIZDJIZFJLU2YyZ1JKOThxcHBWTnpUdzRoYzFESU5N?=
 =?utf-8?B?cXZYay8xUHRZRTF1N0VqVFA5NVk3eDBGU3hnV2plZGZ0VUw3cEZjZkVVSGhD?=
 =?utf-8?B?OERFMGxFazNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZklYbzk3M1VMZTAwakhTQVdEa0hXbWQwcnhNbktoeHk2U0tmcVMydEhKVzhU?=
 =?utf-8?B?Ym80bWg5OEoxUTBnNW9jWFJ1SzNDSVZyRk1xYUdaV3VqY2ZDN0FBRXJJTmxW?=
 =?utf-8?B?NndZQzRuckFtTm96bUFoL0dKRk05QWQ2QWxwM25uU04rd0F1Ny9vanBXaVFD?=
 =?utf-8?B?TEhxNUhrS1ZNWjFaZDB3c2ZqdVQ2dU9xNmZ3TitkdDByU3JSVlc1cjdxNGpp?=
 =?utf-8?B?YUFwSlBFREtKdE81Vk5iN0o2TWJ4bFJ0U1pCc25vOFk5dDJDcFlpUGlyRmhZ?=
 =?utf-8?B?Y3A4RFJDbGJqSjFmYjViV2s4WC9WajdkVUxKVnhvUXNnTys0TUlrQng5b0xN?=
 =?utf-8?B?QVFBWHlOeXdDTlA3a1VPOWM0c0c2V00wbVN3SXNtaGxwRDNLaHUvRTNydURJ?=
 =?utf-8?B?ajFDOHBvaTgrNUVLb0FOZnRHNWg4V3Y5YTg3Y2hZMVp3TnJEMm5PSWJIWFFO?=
 =?utf-8?B?cWlhRmwvelFVVlM2dDRWZHBCM1ppYmxGMG1rM1NMZGJVOVRONDY2RzNHMkpk?=
 =?utf-8?B?VjZkNXVvVnBFbCs0REVLNU1McytKdFIxdm55aDdZZlJyckFacTJwby91UVAw?=
 =?utf-8?B?NXI3MXRHaGd0RExyb2xzZ1RES1pPTTl6UW5nQnJmbkNBcnJjVWhsbndDSnpX?=
 =?utf-8?B?eXRUZmxnSjJUTjB6a2RhK1JoS01KUCttM3AzelNkQ1oxbENVdHE2S3lnYkVn?=
 =?utf-8?B?cEJQNjJWK3hTVnZsVUhyeXNyT0FmUFpFYUhrTFVDT3RzNWtFKzl6RWVwSlVH?=
 =?utf-8?B?RTRNMEE2eGNNNVNDM1NSQVBqdm45eTVaZ3hDNWpWTzlNbnowMktwRlFQa1FU?=
 =?utf-8?B?WGpmQXFzd3psNkROVERLM2hDbjZmajRMODF1enNwaTdtZFNXbzM4dWt3S1ZE?=
 =?utf-8?B?eEVkUllnQkQyczJBNjI4TUsxd3NFek1Jc3FJaTVXbEVoMHIxMVdvUGpucFRy?=
 =?utf-8?B?QWRZZU1jcFpqZm5ralFoMjV3L3lueERnWFNEWGZwRzRwd1FzVEs4MmRqcmJi?=
 =?utf-8?B?b3FKaFJzTzd6MWpadGtheFhTNjJZU3cvMzJwaVdPM1gxMVoyN0tYOWtIYStT?=
 =?utf-8?B?UnhDRzhJNWRlWFRoN1p6VGRmRHBsdFU4OEJhK2lrTm5RcE1PejVJeDM0TDF3?=
 =?utf-8?B?cWlHNE53ZUZsd2NWa00zdzltM3dZdk9CL0hNRWlHUTZwbEJUK3BQSlJlMjJI?=
 =?utf-8?B?RDBaaW9oTWYySHJjQ3JlRllkMEEzRzBSSjNncGpHWC96eUJWRTZ4S0xvVTBP?=
 =?utf-8?B?SUdOYjZ3MUdXR3B6S3p5YmtXenhvTjdRd3diR0psdStDaDRkUGVrVXdOcHJu?=
 =?utf-8?B?WFg3bTM1YUUvS3ZjU3Z0MlZFMlpLbVRHdXVwNzhFY0lzZWhMMzJMeXU1SnE2?=
 =?utf-8?B?ZlpRbDlYaHJYZHNuejZ1Ukh0TUJVdFBBU1hSaTQ1elVoTkxFK3QxMCtnTFhK?=
 =?utf-8?B?L0kxS1JZcGhqdWFHSTVxbVRGZ3hqWWQ3YnBZV09jYVNnWWNacW1XeDk3ZXNZ?=
 =?utf-8?B?L3FqWThYSmNUR3dZQkp3cUVMM3BqeXNaZ2F3eUkvRXlJWnJYOFhiSG9kYTdk?=
 =?utf-8?B?S3M3Wk14VUdkcnlmWHc4NXNkQURKdVdoYzFtMnpkaFNveWNyVWF0cTNlTER0?=
 =?utf-8?B?eCt5ek5hUzJJNVBnV0tQSzFRNG1nSW1kaGxPL3RzVXVxQXdNcFVCSmVWV2FN?=
 =?utf-8?B?L2dEeU1mNTFucSszK3dsQW04Q0tEU3FmWVJBcWNuTDBINkJLS1J1UFF2bXRp?=
 =?utf-8?B?NU9hdm1jMGhxNmZaSHZweU50TnV6Y0dZSVpRVzJjSmFReE5HV3hMQVl2SHcw?=
 =?utf-8?B?MFFGVkk1UDB2N240S3VLV0tPOEl4TzJrQnZ1VkI5Um8wcmlDNmgyS0hlZldo?=
 =?utf-8?B?UWszcDNBM2RuWEY5R3FMaEhBSEJsWEdBTko1dlYxaXJLRmZPQ1FucFFia2FE?=
 =?utf-8?B?eEdKR0YweldPNkF6SnJmS1BlODJUNWNjWXE4RDZZaklnUW54eDlnSnV4SFVh?=
 =?utf-8?B?YVFJdTI1eTQyeHV3TlZaM3d3NlJOdndrSUdKOUZneEJEVUg0VFBJWDRJL290?=
 =?utf-8?B?U0ZlbDI4b1ByVXdGRlRnMmltWTlMOHVMeUorVk5SRVAyWDlEZHczR3ovbnZq?=
 =?utf-8?Q?A4No=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35899a19-bf7f-42f1-3d52-08dd4fe30935
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 06:11:08.6647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7giZuShHuJvN7I9WpFDO3gIw/tTNJih8r/3yQhIoIdBhr5+PCWtxtura1uW/zKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkttxQmkf8Pi7DofZyROomi1CthSTZzIexy3ZRlcdgU=;
 b=4o4ivOvuP39OhzDkt5lEL2mxFVFb+FWt5Xhq6JuenvgisYegKbqTZQAq5tZw1vWz/EezaayurmhxGYrsImIbUoYpJDy3QWgvFFM5aNmcdnU2WMh4TI0L25xLjDlMJI0septhLkE/Luzhv+Fr27ZcX2BO1ABuV+++JjKM8QYyXT8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4o4ivOvu
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 4/5]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
> have been upgraded to support a list of architecture tuples, this patch
> updates the toolchain-bare-metal-buildroot help text to describe the new
> capability.
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
> its prior definition as defining a single tuple with this new definition
> works exactly the same as before.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - no changes
> V2->V3:
> - improved help text
> V3->V5:
> - no changes
> ---
>   toolchain/Config.in                                  |  2 +-
>   toolchain/toolchain-bare-metal-buildroot/Config.in   | 12 +++++++++---
>   .../toolchain-bare-metal-buildroot.mk                |  1 -
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index d6ed25ff96..94723da141 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -941,7 +941,7 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>   comment "Bare metal toolchain"
>   
>   config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
> -	bool "Build a bare metal toolchain"
> +	bool "Build bare metal toolchains"
>   	select BR2_PACKAGE_NEWLIB_BARE_METAL
>   	help
>   	  Select if you need a bare-metal toolchain for building
> diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> index 6fe969357f..19c97410c6 100644
> --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
> +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> @@ -1,10 +1,16 @@
>   if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>   
>   config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
> -	string "architecture tuple"
> +	string "list of architecture tuples"
>   	help
> -	  This option allows to define the architecture tuple for the
> -	  bare-metal toolchain.
> +	  This option allows to define the list of architecture
> +	  tuples for which bare-metal toolchains will be created.
> +	  One toolchain will be built for each of the architecture
> +	  tuples specified in this option.
> +
> +	  For example, to build both a Microblaze and a RISC-V bare
> +	  metal toolchain, use the following definition:
> +	  "microblazeel-buildroot-elf riscv32-buildroot-elf"

>  Since the microblaze toolchain is only ever going to be used for xilinx 
> platforms, and they apparently expect the exact tuply microblazeel-xilinx-elf, I 
> kept that one as an example.

While this is true, I have been thinking more about this the last few days
since working on expanding the bare-metal toolchain from one to many
toolchains.

Even though Microblaze only ever exists on Xilinx silicon, if someone
wanted to run Linux on a Microblaze core, they would get a toolchain
named microblazeel-buildroot-linux-gnu and not microblazeel-xilinx-linux-gnu.

Since we are using Buildroot as the build system, and since the vendor name
does not change functionality, it is probably better if we re-name the
bare-metal toolchain to microblazeel-buildroot-elf instead of
microblazeel-xilinx-elf as it is named today.

The toolchain package is called toolchain-bare-metal-buildroot and not
toolchain-bare-metal-xilinx after all...

Assuming you agree with this, I will submit a patch that changes the name.

Best regards,
Neal Frager
AMD

--- snip ---

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
