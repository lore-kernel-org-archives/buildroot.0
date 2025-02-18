Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EE3C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 06:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCFB8207B;
	Tue, 18 Feb 2025 06:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c43cIS3WH7U2; Tue, 18 Feb 2025 06:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C72F382083
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72F382083;
	Tue, 18 Feb 2025 06:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E51BB968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C805960F88
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIMLOZcsMLKY for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 06:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::625;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCAAA60F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCAAA60F8B
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::625])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCAAA60F8B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqxQ8JDji+wKabma30lNXnBOna+d/KldVNbR77J/WEcno4RH80D+c/Nd8tFqpLPn+gibhabniyCBeGLGpvUSEEZnyxeRQFFyEP6Shgf0ulFyCrUKOW5nY8n9bLrqYxk5QT+eFX+NbReplMdj9v5m8LTTK986j9U00qM7CVpxbJ+l872MkK+A0D2UNDmf8kwri8ShdFO2qaH617hDbaU7matdd4OOk92beF5GIKtLiP+gFjw5WzuSn/bRVBFBfK4YV/sBqbjZmMhvBkBS116Dv1sVBVWwaXZcxNzsq6mapkwmi1azNhxek+5TSUibwooIiMpyhJM9SzvH1qGwGqx2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsEnqFzwnBYcu33HngTTK0hLDlrpr00DZg33GDL8Nds=;
 b=lU0Ejjkq8mZqHCPAj4xYIkgxSPxMjOgmfVTq8VhY/FvTkG/ne8uI97nMvUk6++Q1zMe0vZSajnF+WxT2eSTdHiKVuu0cmFEJ9wnHBfserW5l/3OjI9f+Z0vJTbmCbnpaEHSo0EtovNXyeprJF6jJJzSHKO+6kNxyP+6cTH5hLr8jkCEQvjuBxZZjtQtb1kXf9Zfeb0W6lGForIjNbsPTYLDJzRvZcdZdCIvBq4/2QElkIpAGv5uGbi0vNvn1vWRRK/eyq6NqEnneSz0aLgO5nejFxb4Bn/DkNi7uPAvX9w3tuT1kp3X2cJ+6kMohEAXz1UxcH5O4itnvbcHzlkl7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 06:01:23 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 06:01:22 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 2/5] package/gcc-bare-metal: add multiple tuple support
Thread-Index: AQHbgTprUSUKAyxd/kCZCQEJ81xpWLNMEVWAgACAC4A=
Date: Tue, 18 Feb 2025 06:01:22 +0000
Message-ID: <SA1PR12MB5615F39B2E1A83FE7687F9B7F0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-2-neal.frager@amd.com>
 <d97755e1-0db7-49b0-94f1-f50fa930c5e4@mind.be>
In-Reply-To: <d97755e1-0db7-49b0-94f1-f50fa930c5e4@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH3PR12MB8849:EE_
x-ms-office365-filtering-correlation-id: c36a3372-7be5-4dfc-3d47-08dd4fe1abdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?dGtJbEZDd2NpSU55RFgyUmEwQ05PY3RJM3gwNjRNbnBNVW02TDM1UHlqeDU3?=
 =?utf-8?B?Qmg4YWlkKzFPcUlWUXRGeFhVK2tUTDFRbTlTa2dtWmVFOWcyOEYrdG5heTNE?=
 =?utf-8?B?OUNLQVlZU1FHTjRLTGoydU84Rk9XNjI3UXlvM2QzcmN2M2dsaEFsQWJ4NGEw?=
 =?utf-8?B?YnBvKy9CTHZVcWRRRmF5ZWdlZGZDVXVUdkdLcUNEQVljQ2FwVGVWT3k3cVRM?=
 =?utf-8?B?UUozcmVLQmVMS1BUbzVsVFFsRU82S0wwVEd1MS9hekcvUm4zOEZWS3RlVStO?=
 =?utf-8?B?UXllNVhjNXljeldWQ3ptOUtZYmhQQ0d1ZEt2ZVM4VkZHSTlUZ0ZXUDNnRUJY?=
 =?utf-8?B?QkZwdDVLWnNSRWVxMEp2MmFWZ3RTNE9iU0ovcVJacVA2Zml3UXNkd3h5eEEw?=
 =?utf-8?B?eldER3lpQWpYRk9NNHJuVklkcjBnK3dpRERCOUprV2JWd2tKL1BiK2g0WjBS?=
 =?utf-8?B?dGpxMUc2QTZCcUFPNWVJQm5oVCs4VVlhNzN3ejZUVG1VMUJiQ3gzWW5nck5r?=
 =?utf-8?B?N0dpcnloWml6UkljaGNmazl6MXB3UDdLWnQrMnJ1S2x1V3BDUEZmcGplVHhO?=
 =?utf-8?B?b3ZwMG1nNHp3NXhJRS9hMVpBUHdkVTZrWWloRHQ5SlM4bFFEWWpCMFZ6cHdD?=
 =?utf-8?B?a3VqMWlVYUh3bExSSHZjUkl2UkdUeVZ0S0ZlNmEzRWozdWdMMXMxNkJjNnVB?=
 =?utf-8?B?TTR5T010V2ZnNkhuT2pkdk92Q1ppdTQ1aVEyaXIwL1k5bTYyVG9mQXRsNEpR?=
 =?utf-8?B?VmxEMzUvdTNwL2czTjh2b0dCSEh0azZCMVE1NEd5dE8zTkFtY0d6a1VPSi9p?=
 =?utf-8?B?MlhyQnhZeXR2Qk0yYXpralA2bTlaVFg2VTZjTVRZUEVNYVZ3dGFoNzBXdmxh?=
 =?utf-8?B?dTYvRWsrbWhPcndyVm9wWERrWE9HRnZqRElBdjg2cVNpWURpN0RJOTBQQUVj?=
 =?utf-8?B?K0Z3N1VkcmJoc0pPMURVallBWStuc2FCZE1Rb1U3S0Q3d0FFUUd0My9VZ2lo?=
 =?utf-8?B?b1k5b1ZKMm0rY3FSRHlyNmZCaVZMTWR4Zy9KV0JMTnh3dmpUWU1hRVRTdnVk?=
 =?utf-8?B?aE4rbVJLbC84ZVZseWU4anhMdDJIejFSdkhIZytXN1lvYVZxYWYzdUVqQjQv?=
 =?utf-8?B?bjA4NC9KTkU4MWJJQnNtaU90K3EyeHFLaHRRVmxKSGJNUWhWL0diWncwT3Q5?=
 =?utf-8?B?dEJsOEZ2Yld0MkFNZUMweC83WW5pUDJsNEZPdVpBRXZGaUR6QWtWZWJRODhp?=
 =?utf-8?B?a2E1dHRJaXltOEh2djI2N3RqTXFOZkN2NXE2UEYxczRjK2JVaHZhaHIzN3Rx?=
 =?utf-8?B?Y3dxTEJ0WGlMOFprSTEwRm9GaFF4YmtVNEJKR2I1d3VQbjl5SkNQd2NuN0pG?=
 =?utf-8?B?MENnWnk4aUlBV2xPMi9FRVkvK0xaWU0wUlpPTVFnVHppUCtMQ1JKdWUyblBv?=
 =?utf-8?B?amx6Vytobm9DRXk2SlU4cVNjZ002RjVqT3NmQmJYczkvVk9vcHlXYkUwQW92?=
 =?utf-8?B?QzFjcEF5blFabFVJM1JsWXM1eWtHTWxUeFQzRkF1RmlobFNJZlNZUlVIMHl5?=
 =?utf-8?B?MEwwdEpkM05LcmdpWmdQaVVhWVVHYWZpdXI3MjlqUU16TDhXcjVXK012M2Fs?=
 =?utf-8?B?VW9IQVdvb1dCMmZrcnhKcXh0MDFsVFJETW8yQWx1SjFhcFNTMDBHSG5tM3pk?=
 =?utf-8?B?N01oUXB6OFJQTDAyWDFEZTk3TlVkbGIwWDc3WXhYUTZJbmlJRXN2RlVCR0ow?=
 =?utf-8?B?M09XcWFkT2JxTmRDOHpBUlFhSXlkRXVlSlN3cFhqcUpHWUk2d1h6UEZEYW5u?=
 =?utf-8?B?a0RpZ1BHRkp2YnhrRkgxUjZjYmlMeUhxNUlUZlhjQ2tmSzhQOWtCamcvNkdC?=
 =?utf-8?B?L0NkRDhhZm1DYTF2RDhLb1Y2ZVdaUVN4aUh5RGxLY0xaaTNNb3pPT2F4aDVO?=
 =?utf-8?B?bFU2aHQ4eldzTU5odmRnNFF1RUhYUDNDWG9sVzlrUVJTajluN0hZdWRvNmph?=
 =?utf-8?B?Vk1QYzNjb0xRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm14VHM3d2t5ZTUyekMxekZGbURjV0JJSEpETzRJRXVNL2hObWVZbjlIUU1Q?=
 =?utf-8?B?T2pwQ0ViUkdtMmkweEhsSUhVQXVWOTlBdVZldDRCWDJEdFhrdGJvR1J0NnVl?=
 =?utf-8?B?eENnWm5BZStsZHFDK0dsNXVjbGdGMlhHd05DWGJqV0NkRUR4LzdibFhCQ1Qr?=
 =?utf-8?B?blFDL05vd3BmV2lWbEtKSFJJdEw0MmVGWUR3a0RGYTdja3ZQcmFNSC9uRXE0?=
 =?utf-8?B?K3FyVXJ0SDRLZjBzRmNqZ0h2ZktVZzMxdlpyYldIKy9kdWZvKzcwNDdHakV0?=
 =?utf-8?B?bDdHL3R4dWZFY2NqVlZCOFc1bkRuNlRldndDWVRiQWJMMHByKzFxZk04cmlW?=
 =?utf-8?B?cUtSU1hUNUhpdDhJOEtHSzMvbnlrVmJ2a1J4T1U3N1dBQnZzQkxKYlpoR1gw?=
 =?utf-8?B?M3Y5aGlIcnhMd0hJQ2ZPeTJkNlJtOHlRcG1ZQzFOUlV0MndKeUU5Q0FxaHE4?=
 =?utf-8?B?NUVVazMzY0ppa2ozbTJVNmRUS3hCL0FYWHd5QmlOSmtrVWVoNm5Rc1Y3MUNR?=
 =?utf-8?B?Ui9iMWRYVEdoTzlFaTEvYlgzRlRIUmhiUDlEZXY1aXU2Q2pRVzMzSk56bWxB?=
 =?utf-8?B?ay82eHFlZ2Y1a3FVL3NFaUNDWkVFU2lLZGE1L0REUEdEWit4cnJaOE1IYTZ5?=
 =?utf-8?B?c1UzYndlUlBtTmVhT3Fwa05pTURBUzdIb1RuUG5DNFFsL3pJUUplRlhwZm5P?=
 =?utf-8?B?cnJNanFMNE9hbG9OWEZIaE10bUJCblBRSTR6SGNaWm5yZnhhTXZvUXJEZHlw?=
 =?utf-8?B?OFE3ZHpVUTdnazZkSGgvcVQyTjNLYURBemJKUHl3WkkzM1dVSUdrMUZVTVV0?=
 =?utf-8?B?L3NMU3JHQTdCcnVtM2s2di9WRXZrdE54elRwdmNMczFiVUxmRnA4dURIVHd3?=
 =?utf-8?B?eXR0WElueXRmQlIrTDA0VFgxTzJHbTlwQjlwZHY1a3lRczB3Wm5rR005MUx3?=
 =?utf-8?B?WHF1TkUvMDZiSDI5V0FhMWpDNE03Q1hmS0RoRTloZ0xJMzEzbnZJQ3E5eFQ4?=
 =?utf-8?B?UDBEYkgyQ2VUWkFselIrVzNGL1BEMHg2Zyt0YzlsZUhnNzkyeTd2ZHlwcVlm?=
 =?utf-8?B?YjJmRzJQRk5xaDB4ZnRQa1pUZEpnam1DZVZWUStxbS9sN040YXkzMTVnOUQ2?=
 =?utf-8?B?VTJyQkg5S0RzeFVOYXVRVEkvdWg0Yi9RN3loWC9FRTVRSkxvQzl6Y08va3FR?=
 =?utf-8?B?TnlEY0h4amR4ckxrZGFMb3JVOTExTnE5M1VnUVgranNjcFJjOHpISHlaNTZG?=
 =?utf-8?B?QTUzcGhRSytXenZGbnBMSmNNRHE4ZWVLWTBpMm1IaDR4VHllc3pWQ0EvTDFE?=
 =?utf-8?B?QUxBUTNRQ2c5akxQdkwrRmxvbEZ2YnY0Ym5tdm5sOXp3WEd5SWVvT2hnaENv?=
 =?utf-8?B?N3Q1N3lSMzZPWGNSU0ZrVTBLVFRzZC94ek93ZE9HQUtmSkhnSjkzQkc2bzZv?=
 =?utf-8?B?ZHdWU20xSmVwVWZxRnBESGFZZHJjdTc4aEFLUTFPZDRJWk1iWFYzaE5oSlFD?=
 =?utf-8?B?VjhYeVEwbE9yckVLWFF2Qi8zOThZVThVNnk0cHY5WS84NUNzV1U2b21rN0pk?=
 =?utf-8?B?aHlGZGQvZ3ovd3A5Q2lxdUl6b3pVYlFORjhEZnp2ZEp3Wk5UMHRaN0pUdmRS?=
 =?utf-8?B?MlUvL0VCaDAyU3VRMTd2bjIyK0VBZDJOWDZXQnRnVjJlVy9OQ3hCL1E4aVV2?=
 =?utf-8?B?aVVVbmdFbHJWVDVQTXY1YjU3SFdkTm1iOHZjd001cmxPbmFIeTlZTkZFR3JI?=
 =?utf-8?B?K0xpeWQvbjgrZThkTlhMSkpqMEVhWWZIaGw2RkRQTmtPUmMwUlZkTWZSazl5?=
 =?utf-8?B?bGl2REFGa0lxUGJ6Z1REZWZmMVpGZXZaSHJWa0JaS0FUdTN1eGp4N1l5Syta?=
 =?utf-8?B?RlZYY1BxaVdqM0xRWTZsZmErY0MvRGxNNXZUbVkzdThhUTdkRER1UkZ3Z3I3?=
 =?utf-8?B?RmcrcHNxNUo0M1RvdUxxMSs1ellZbnRBVmRkMEVsd3ZwYUZjd1l5OW1RU0lr?=
 =?utf-8?B?VHFXa0VTdjlXeW84MzFoaXF4Zit2N3dVVjZMUlBXS2UyQWxWQ3kxa2lVNVAz?=
 =?utf-8?B?UWFtV3RKTjk2ODJCZnpUdlFqei9QYmJxT21NeVowam1HMkdHOGFUOXJSc2Z0?=
 =?utf-8?Q?9J0I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36a3372-7be5-4dfc-3d47-08dd4fe1abdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 06:01:22.5922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dr+KneHyIuHYoKMbxfp4KZip6IVpQBhZ76BL4MUHetcTBICI62yegu1MiwunPOlN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsEnqFzwnBYcu33HngTTK0hLDlrpr00DZg33GDL8Nds=;
 b=GVX4fCv1jbQ2ns6sPfEgUBAf45N8j5BBvN/KbOWAdr99qIMniTQ1KsbPqoi3tfiWrz499MYajAIRmKmtwuzayG0vn9x7FB+C0ppBMBNRZfqVAjCZeA0xb8LWnBdxSfhZaQC+6M5RhNUMNYKPZy4+nz1nCWWGfM7QxbjzKcU6Lbw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GVX4fCv1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 2/5] package/gcc-bare-metal: add multiple
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

> Add support to gcc-bare-metal to support multiple architecture tuples
> with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.
> 
> To do this, custom configure, build and install commands are needed, so that
> each step goes through a loop of the architecture tuples in the list.
> 
> To keep consistency with autotools, all the relevant host configurations have
> been copied into the HOST_GCC_BARE_METAL_CONF_OPTS while removing any
> configurations that do not apply to gcc and removing redundant configs.
> 
> autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
> 	CFLAGS="$$(HOST_CFLAGS)"
> 	LDFLAGS="$$(HOST_LDFLAGS)"
> 
> autotools configs not applicable to gcc:
> 	--disable-gtk-doc
> 	--disable-gtk-doc-html
> 	--disable-doc
> 	--disable-docs
> 	--disable-documentation
> 	--disable-debug
> 	--with-xmlto=no
> 	--with-fop=no
> 	--disable-nls
> 
> Some of the configurations already in the gcc-bare-metal package also
> needed to be changed because they were incorrect.
> 
> Configs Incorrect:
> --disable-initfini_array -> --disable-initfini-array

>  This is in fact "harmless" because configure converts all - to _ in the 
> options anyway.

Ok.  That is good to know.  I am glad you changed it anyway for consistency.

> --disable-libstdcxx-pch -> --disable-libstdcxx

>  The --disable-libstdcxx-pch option does in fact exist. pch are the 
> pre-compiled headers, while --disable-libstdcxx would disable C++ entirely... I 
> can imagine that there's code for the auxiliary processors that is written in 
> C++ so I don't think it's a good idea to disable it. And it's a static library 
> anyway so just costs a bit of build time.

>  Well, we actually pass --languages=c so it doesn't matter either way...

>  Anyway, I've kept the --disable-libstdcxx-pch option. No need to change things 
> that don't need to be changed :-)

That's true.  If this bare-metal toolchain starts getting used more, I could
imagine adding C++ will be useful.  Until then, the Xilinx boot firmware
applications are written in C, so I think it is best to wait for C++ to be
needed / used by someone before adding it.

Best regards,
Neal Frager
AMD

--- snip ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
