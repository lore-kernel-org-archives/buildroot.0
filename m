Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7B9C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 10:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE3980F60;
	Mon,  1 Jul 2024 10:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wBnMaV01UNi; Mon,  1 Jul 2024 10:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2B18100B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2B18100B;
	Mon,  1 Jul 2024 10:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8E7C1BF33A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 10:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1B5C401B1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 10:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiZGCq6GlGJZ for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 10:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::619;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70E3640158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70E3640158
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70E3640158
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 10:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQ/WSundMQKDHKwL9Bb8IqL4jMIHO8b992oD98h5eWgPIA0Cety4sHXLuHBgrgT3Cr7VepEBRyPgBAmnuD/lRc7jkfB6SjlowUrrfEmu33bcZqsnrSnebnFDA695hzeurSybNTEr19caz6yTU9F14ac5HRA2sC9MiX+Auyf/9xwCn38iFQPMvT4G9I+6e+EwxGt1B7xHWzEKmguaAFprIR2peZZQyg74fb3b90+u8oxRJf5X5BMaZgX+7eOML47RYkhchQHxlIQ5LeQoGKTSTeWncrB4T+T2YyGDRCJTqk4YuwV3PdYU3Zj98Bqa4PMnrDm6RDyoLhBNbUfgNxEcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GC6b4uIV1jbBwyZbE0m/poxspwD2oJV4S2ILklO/5vw=;
 b=ZN7c9kgeahRsZzC1SlAbF/UDVT3LDiiDxKI9BEm8R4eAZBztJDX+7vMfXcf2v/psonzC9boIgIhp6K8SOec0FHy9h0hXEKvHgWUqLhLAyXrzFxg9mwxDyeMuLTom8VzHvq6ArQhdngCF9XsdWL6laeR+k2lXr5RhqUlntaz0Dy9x+sa+SiVsIqCGbJ4YZDql0UNUyhbxHGWuPUCgL8Nxm70HfDSxFVrsivKBTREZKHP7Q1mjlRpgHK4lDfsIi+mp8JsGI7xcOKaJOM2IUCIPsuAB2sDmJlZilWYtdjoZNO5tKUQPVyVMah1qzXLaG2gVoH1IzC4+ObawltjUQYpNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH8PR12MB7230.namprd12.prod.outlook.com (2603:10b6:510:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 10:05:40 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 10:05:39 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v2] boot/xilinx-prebuilt: support custom boards using XSA
Thread-Index: AQHax9/qf+prW606jU2BVvzXg17Dc7Hhq/tQ
Date: Mon, 1 Jul 2024 10:05:39 +0000
Message-ID: <CH2PR12MB5004E73315D7C7AA4703A4B6F0D32@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240626-versal-xsa-support-prebuilt-v2-1-724b00c4596d@collins.com>
In-Reply-To: <20240626-versal-xsa-support-prebuilt-v2-1-724b00c4596d@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH8PR12MB7230:EE_
x-ms-office365-filtering-correlation-id: 7a658027-e72c-4ada-d51a-08dc99b55c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?d0cwWk9kdnlnVllDeitCQWYyM1ZVL0I1NjRqN2o2REN0bWlRaC9TWjlvb3BG?=
 =?utf-8?B?V2JhZTUyVWNwSFg2ZmpjcjlkYytZb05NdnFRM0xKeG1uVlBIZXdrSXlzc04y?=
 =?utf-8?B?VlBKV1h6ZzBmU044S2w5Um44OGJmaHVheklTNGdsYit4RUlJRmJkd3R1RXJF?=
 =?utf-8?B?bEx1STJzL2J2TkZaSjR2aU9ibUphNWMzREc3NTIxa2YvTnFMeWR0MFduZFZJ?=
 =?utf-8?B?ZWhmQzhSN1dzWTFqRG42b0VmOHhQdkZjUUo5VmJVSGlVV3h2eUc5RXFBRGhM?=
 =?utf-8?B?ZFk1Slo2WmxQZ09yUm0zM1E0VlBwczk5WG92Wjlkd1A2Ny9xTUc2ZHVobXJH?=
 =?utf-8?B?SXJKcklDb1phZ3ArekNtVTZ2aWJwNkdlSGRGZFYyK0s2czZQQWRvTkhsZC9N?=
 =?utf-8?B?SWE5TXJJNUtMZ1QvZlcwdlZTMzhtZVV5djkrQnlKVnJuWGFVZ3VFRkhvMnZM?=
 =?utf-8?B?Njl4Tm9sYVowRDIraFlzeWxyTjQ3dlBObmM0U3BhbHAwQWREWElhRHFRMFoz?=
 =?utf-8?B?SjE5TlVlVEs3RWFOM0hFUml6OUNVSEc4VGltWHBueXV2UzRPdWJ1TytVK1JV?=
 =?utf-8?B?TTBlT2FzTGpwZG9GM3FkSlVEekIzZ2h4WXlFcmZRVnk1ai9qMTZjTHpWQ21s?=
 =?utf-8?B?eE4zaGxOSmtEMHE4RzVXYWJYOFAxZW9VeFhoelVnRnpRTVl2R3lBbEJBWDZS?=
 =?utf-8?B?bjBIejZ2RHo3bzhGOHRaeU8xUnk0WWtIU3JTQVlCNXBtM2U5K1FUSVJCRWky?=
 =?utf-8?B?aVQ4cVNxeHNwczlERDQybnVQWUMxcFNSZkFZejJJNGJSS3gxSHEra1lGcjlq?=
 =?utf-8?B?ekxYSzhJN3VrZWhKQnAzRnhnRHkzYzBIa3g3SFB2aU9GSVMzRGE2YVJRU3Rp?=
 =?utf-8?B?Z0RQRDlBWUh0NEE2QkRvZFJxRVE1WVB6K3BhTUxvVmQwd3ZWeWhXRFFXd0RM?=
 =?utf-8?B?bFVyQ1lwc3hqTEE3SEgzaVdWK2dqMjFRdlRRbEwvcVNvS1ZCK0luN05pZU1L?=
 =?utf-8?B?WWhNa3ZwMFdKNDNiT1FJS2U4RUFSbFdQYzNMWFcrS1AxQkdyc00vVWpXWVcv?=
 =?utf-8?B?M0lyZkkvTE1MSGtKbEliSHBNalo0Q2hmWTZzUGdJZGhrSmZwVWYzV1kwQ0Nx?=
 =?utf-8?B?SmYzbkNjY01jUDdiVEU3Q1FzUVZVbEg3d1hHb2FOUCs5bUF2S3dFeWd6dk02?=
 =?utf-8?B?d3pNZ3JFb210S3VYRXo0YVFyZ1hZLytYWVBZdTVwVXRBekdjYzhwSVNFRUR1?=
 =?utf-8?B?ZXpKYnlIZS81aVV1dlFhWFZsQ1dJN0RLbFROcjRWdHdESG50VzF6T3U4eHlx?=
 =?utf-8?B?ejgrOHI5YVZBWTBDbWFWSU5JVkcxWGowRmhsSTBMbTNidDZ2S1lvOHFGNVhP?=
 =?utf-8?B?bjd3czhhRlpvOC9MNkJ3RlpwMklZZC9GTkF3WnBEc0l0RjU3dGIxWFZhM1cx?=
 =?utf-8?B?WGg4aXd3S09VUGlMNCsvaDJCWUEyZ1FYTEl6R2JiK210cGZFNzZvY25mNGll?=
 =?utf-8?B?S1pacmo5K3c1aUZpWlcrUHVSdHdCcjZ6b3lyRjNTS0pRb1MzSS9OM3hlR1ox?=
 =?utf-8?B?Z08vTENidWNsNjdPcTVoVlhGUWJXajl5U2NyOEFNTmtZK1FIdkJ4R0l1d05v?=
 =?utf-8?B?dzd1bHhsaHVMakVyelBBRlp1cURrS1hYUDZIek11ZmhKQk9VN0c1aUxVR3pZ?=
 =?utf-8?B?SENKQ1krRzZmMCtweVFobzRURXUzU3VWZ3lBc0hNUWo3My9YbUpIdnYxZm1D?=
 =?utf-8?B?U0JGbkNSZ0ZmODJBQ05mZnczMzhJQStmMnBoMEV6YkZrZFJjVFhVd1FFSGc3?=
 =?utf-8?B?L0hlNFB1VS9NNklrVEZKYm01amtOaitJc3VyMXE0YytqbXN2cElLQWtQN01Z?=
 =?utf-8?Q?0amub5NE/70ET?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V09jOTZxbFpndlIvSWlqbVdyVC8vQWg1VW5HNmg0RmpENlpOU0E5S0VNVGMx?=
 =?utf-8?B?dkpSNVZLWDhsVGl5YlBKOWt5b3o1RmFXSlUwdHcwSXkvekZnSDNzOFFpaUgv?=
 =?utf-8?B?TlBNV3FPR2hjbkJ3WmZZOFkyemhtSVRySGh2Nm9idzdxa2FxejBkVGxiWFc3?=
 =?utf-8?B?RUQ5dFE1MlNhRkNmMy9KOHM5UXJ0RGdlaWwwM1h4TFVGVkRINnBFSm1vUElo?=
 =?utf-8?B?cXNCdXJDd3g4UGIwRGMvUzV1Nll5RU1qR2dUcUIrZzlKQlRMRlNneEx2dGE5?=
 =?utf-8?B?STlhREtEdU8zNTBBc2JtMUo2MlRiY2htaFEzdzZkVG9YQkwzTWdhWktSQ1pU?=
 =?utf-8?B?MlAwWEQ0c01ESkVOS0J3WVl1cnhWQWR3ZkpsdDN1dHRLejN2cU92K252Q3hK?=
 =?utf-8?B?cng0ZVhXbkF4QlhxSWJhekxRQnY3UmZCYjdhVElkV3dPWFF6L0x3ZkZGYnJY?=
 =?utf-8?B?R0t5N3kvTFcvbWtPMHpGczRTdmJwSk80QWdmODRyYWM5M3Zsem1aUUlncjFw?=
 =?utf-8?B?UHZvNmZzOTRjZFBicmt5eUJ2elRzWS9hZ2kwSVhKeGgvMWVXUFExckpGSXBJ?=
 =?utf-8?B?eVJoTDgvMDlidWJEd3hHeTJwRjhEeDVRcjBxSnM1VGJ6L1ZiWHZRdUduOURz?=
 =?utf-8?B?VXJmOWVsNDNtTzdtK0xYbU9pYnJlakZyb3JJUWF5VWpibk51eW5KQkw4dk00?=
 =?utf-8?B?Uk16SEFTZldpOHRTSVRNdHVxRzhHMCs2WkVHMkZkbHN0NGJSSUMwbnMrNGtt?=
 =?utf-8?B?ajFLSW94MDFlL0RMZkZ0dnlwdDlrWVU4YWNzZmxhWWdRY1hwNkdBV1ZSd2tB?=
 =?utf-8?B?TXNjNHBxQml6emVYbDFWejBuTXdsTWtpWU94SXFZL0t2UEJhaFVld3lJcHVt?=
 =?utf-8?B?L3FMcjlCNUxaeFQvRFdKOVBVZ2o1U1ZPYjJVYlJUa2k0V2tBdTduRE9CS2Ns?=
 =?utf-8?B?UnFFT1Y2K3BQMzFtSnlvdDNUS3BrbTJ6UmxNclk3VklJaUVUTVFrMlhic3Bl?=
 =?utf-8?B?ZEdQWmcxNjdmQjR1Vnd1QVAwYS9IaTlHM25RWjBjWlN5MWlSNkxlUzI5cERV?=
 =?utf-8?B?THRvOUdPakhrYytidjhlOTlkRGZVVVo4WFlLODdPbEJMUkUvTXk1MG5HWVBO?=
 =?utf-8?B?MUVTYUpTNlNSYlBnWDlVdUk2QlZ5VStxNjJyQUlQWU8yN1QwVEM3THF4MlFq?=
 =?utf-8?B?QVlEanE2eDUxSytBOGRRQnNjSytwbkpZMlBQZ0lTQ3RMdGt6VzRTYkhDOHBs?=
 =?utf-8?B?SmdyelgycW1Ec3FHNHRFdDBLWUNJb09zTmlGcVJTcFdQMWZSOUVmL3VuMjNK?=
 =?utf-8?B?YXZWTG1kMlhEaTVheXFsRGJ2YU5lZmpIWG9WeXVxT0lkOTh4c2JsZ0hZYU8w?=
 =?utf-8?B?dEU0WVdKT2o2Tk9QbmpNTWNYMnIyNy9xS2FQNGZoWC9mS1NzRm9ZYXhUZU94?=
 =?utf-8?B?d0F4UXRDVkFWV3p3c3BLOTVIQ1psZGFEYi83akhjRUNWMzN2aWxYNFY2ZkZM?=
 =?utf-8?B?Y1RxcFdhS0ROZ2NGOVNyd282Q3dzSldOcHNBVlBsZ05aZHVUYXk0bnorbDlw?=
 =?utf-8?B?cjlyZHZYajE0UVJzaG01OXU4aGw5SU5Uem1abWFIcW9YbGxwMmNnTzVaMndZ?=
 =?utf-8?B?QXYyazNqNG04TEdxUmhPeGdWNUNYWVpLRjdXaFYvaVV5YWJYU0FIUFVGOHcy?=
 =?utf-8?B?NWhjU0xNamRHWlptWUl4M1E4cXJ1SWU1SGZ5bnZ3dkJldFc3TGdkdDhlTWkw?=
 =?utf-8?B?WUYwdzlFVE5YQTNiZ3hjZFpzWmxCa0k0UDdESm9yUCtZSzVYdFNCK0hiY1Zm?=
 =?utf-8?B?Ymt6L2YzNTdnUU5uTHBLdU5xUzJHdlgxcnZpR0k0dUhUWWI4V0pPdGcrZzZ2?=
 =?utf-8?B?M2pGNlY1cVc4YUV4NURiMDZGbEhZdW8wUHFvdm92TXZRblhiZzhtOFRXQk1o?=
 =?utf-8?B?ak1TSENkanVtODd1OEVnK21ZTUdkQi8yeUc5TzlSQmxKcEJna0R3dDdqV2FL?=
 =?utf-8?B?VkNBWUlyWjljb2VvanRBMTd3V3podnlkN0RIcTc5TnkyRGJTcVB3cnBRUmFV?=
 =?utf-8?B?SElyUlp0ejJPUndFYUdLV3RKY0VZY1hnbnBaTjBSZ1ZIZENDalNZYkRVS2R3?=
 =?utf-8?Q?F0sw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a658027-e72c-4ada-d51a-08dc99b55c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 10:05:39.5880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3moAZ63alkLjPbJ01e82bhIy/l7mgg99YVpZJTIhd1JAErvWhRThIDYsPsofrfaF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7230
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GC6b4uIV1jbBwyZbE0m/poxspwD2oJV4S2ILklO/5vw=;
 b=zwUqoEVciOgAH0Oz5cloeSZ1n1+Ov+izX9ByPMHG/MY4he5BaK9srGPfv+EGskMU5dJMaO9DGmSwrBrxesWqU92CP8ORskCOOf5E6SXAc4qobGmpoH9QeUpk43TZAy1sWiNi7Qhgf1jdwTSAaEA0mmCU6+O1dZeiQjJj+0SZCIg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zwUqoEVc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2] boot/xilinx-prebuilt: support custom
 boards using XSA
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> The xilinx-prebuilt package only supports development boards that Xilinx
> has published firmware for. Custom designs based on the Xilinx platform
> must generate their own firmware using the AMD Vivado Design Suite.

> Vivado produces an XSA file, which is a Zip file containing all the
> firmware needed by xilinx-prebuilt. We extend xilinx-prebuilt to
> download custom XSA files and extract their contents.

> Reviewed-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> Changes in v2:
> - Fix help text to say XSA is created by Vivado [Neal]
> - Link to v1: https://lore.kernel.org/r/20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com

[ SNIP ]

I apologize for this, but would you mind rebasing this patch?  The
xilinx-prebuilt.mk has changed since you submitted v2.

Thank you for adding this support!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
