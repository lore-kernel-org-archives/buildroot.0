Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBFBC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 08:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814CD819D5;
	Fri,  9 Aug 2024 08:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RycazJeujqT; Fri,  9 Aug 2024 08:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D43381A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D43381A47;
	Fri,  9 Aug 2024 08:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 136F91BF281
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D53A60D65
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDxkgMXjubcZ for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 08:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::622;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1ACE60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1ACE60650
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::622])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1ACE60650
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 08:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gtq9MeSD2op6tJt3PcDPESF0PT+iYk1b4b62hl311R8prmUl7bLC5Lv5Bnu2OSLfSBb80/7tVuMD4/7Scy5FmAxdqdhrtSj4L2DVMI/UPoZeyhAxhOAUOyfSDephbtRkeXpKj0Rqw/DONRTrYAbSP2/pM+sjDBiSdGwe8+lVzjpaLx3P5nXmA6IKZZSPvCTSU1C24xruRhLvYa5TbWkZb/Pk7kJfl3WW1grweokbsUMrNioLRR8HpOAnblEv+CTAM9nprxTFodD3NPZZqgJvAq3Upcym4+U1bPrdw/trrg3l1I8w3pZXT+GLcVsNnJXCgkgojWPcx4BsLjSkjj5LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0HG8rbpGkepGsbk8KzE8PkpzpQT8JnVEZ50zhFCw8g=;
 b=xVSHcLH9EH3uSHuw4PAT0cx4uGr4Q/PxPXIqfQKJItaQYpq9c/C0QYRqenKBfaJmasMm3G/3mJ6GebMToXYXctLT4C4ahlmCF3u5YI4ZBOVz8TFnymhPmuwb2A+1oUXlo0eSJiDqdtmYNQz9rS7ItgIBYCfgC3mFPir6zmMxO7aiui8i5WAHf30QURo8WHPgkdpCItxrh/3e4YJYc20/VJoPURyMKY3sbYdEhUhfRCrglMvRJUDykJcLBSvBve7uKTgYPdT5l4Gu6imPwEjOkbDgIX5d8zQEf/+RXBuccWMF1Jtergsrp+JyztefGQWrvn/K1za/MuFTWyhmIWiitw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 08:22:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 08:22:35 +0000
To: "Simek, Michal" <michal.simek@amd.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Brandon Maier <brandon.maier@collins.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
Thread-Index: AQHa6ZYqUwxIqu7NiUuHr4S385pXN7Idw5SAgACEs6CAAC+6gIAAAQ7QgAAMVgCAAAuy4A==
Date: Fri, 9 Aug 2024 08:22:35 +0000
Message-ID: <CH2PR12MB5004F3E94754D396B78DD3D8F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
 <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240809083013.05d0d0fc@windsurf>
 <CH2PR12MB50040DFC5143682676ED6B91F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <3036afae-2027-4993-bb1f-acd3b312759e@amd.com>
In-Reply-To: <3036afae-2027-4993-bb1f-acd3b312759e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB6934:EE_
x-ms-office365-filtering-correlation-id: 766f15a7-1bbe-47d4-a9fc-08dcb84c6c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?WFVCSDNBcWxrMzRnckpWaDRsSWZISWJYaXk4SDdKYWdpaE1iazdCcEFidHQr?=
 =?utf-8?B?aXpiOVpOR0dJUFFhMU5mYmhEbnJpTHNxZC95V0J5Qk5xdnhqRFNCZCtGSVhK?=
 =?utf-8?B?elRlK3kwUmtYdWxSWU5nM200bWxpbWg2VGwrTXI0YkxTZURQenJHclEvL1Zr?=
 =?utf-8?B?Unc1N1YrcVNDMndHZ2krQldnZ0ZkT21jRnErSmcwU0JBengwajdEcDZsekUz?=
 =?utf-8?B?bjZLcHZYL0xtSzk1a0hoL3NSSkdaWThIQzZlMTE2QlMxYXhybGlHa0dybFMx?=
 =?utf-8?B?bGljY3laNnptQXROZC9RbEtGR2xFVFlnYTVBOGxWNDh6Y0hCU3h5K25jQmFu?=
 =?utf-8?B?dklucmhYbFJjRWF5QmVvZW1ybnR5QURQQzYzTi96RVRKbU1MSlpwTW1Meko4?=
 =?utf-8?B?NFNoNVlvek04d2MxVkNNOHc5WDBwcEtxY0tWTmJQUU5EbXNKeWFqL1lKc3h2?=
 =?utf-8?B?dk42dzVQNjVMVWFUTC8zYmZ5RTE5SHlzQ1pBeVBDSm1qdWo3ZTlYL2VIOWg5?=
 =?utf-8?B?eEpWeldib2w3SW5rY29QNVJOaHB3VnByYXU0dEF5em5KSnorZXozc3drQ1FD?=
 =?utf-8?B?VkF4bE9rUit1NGo4dGRHVXJyM1RXTEFTcUl4aUFKN3o0ZUtXTWd5ci9vSmc3?=
 =?utf-8?B?TmFUUTUwK3ZBRjY5ZDc1SUNzM01IcjBNVWYxWC9LZUhxU2xHK3c2SUlCWHZ4?=
 =?utf-8?B?VXowTEJJZzhMOXBrbElualk1ZHFwRnVjbFJ6TjNlbnpNbHhqQ3pBQzE2c3dF?=
 =?utf-8?B?cUovWUdFNWNsTlloMVdXeVZhRkMrZ1haajZIWkEzcTc3VGI5dTlVZHhuVVpX?=
 =?utf-8?B?OWJ6S1kzMmJ2VXozZXRIK1F1RmpyMTlva3J1NnhrUEdwQnpnWnhxTUNBOTIr?=
 =?utf-8?B?ODBoOE8vY2taOS9seSt4VXBqTkhMRjRkTnR2QkYwSTd2c1E2RmdzU0F5aG8r?=
 =?utf-8?B?alBTQTRxa3VNYWFtZXZmS2xBS25wYk9ubVZLeCtyeVpodHJvcHJhcDFjZ3VS?=
 =?utf-8?B?Y29LTGpKanJSWEpPUnVRUGU5ZS9KekplVTZ2RVQ2a3JWL0ovTzVpRy9XMkVl?=
 =?utf-8?B?d3kzaHk5R1hHV2FYa3lidkU5SnRmb0plVjJrNWVXTXd2V1lldmg2TGMxSkJK?=
 =?utf-8?B?WStpU21aUWJuTFFIb0g2ZHJhRHZUaG1OU1NtMzZUNDVWSDJtL0wrQnp6Zk1Z?=
 =?utf-8?B?emsrTmhjSkJDeE0yUzFXU2JLV1hLU09YSU1yVitTQWJGMnVSd0xqWHppdE9Y?=
 =?utf-8?B?akJ3YUMrQmFJbUhycG94aTBoaWxoWk9KbmNjNUlaOGNNd3BaWEl2VVlDcjV0?=
 =?utf-8?B?Sld5L25meGFNSzIwWThZc0d6bWt2MEhiVjVLWEhzcjZTU01OK3BYQ0ZvUWpP?=
 =?utf-8?B?QTNrWGJNa2xRek9nWVF0VkdmbnJQcVZIN3lLNUd0b00vS1lCNit5Zjc1aEhn?=
 =?utf-8?B?dUZnZlpiU2RjdzhnT2I4SW9SY2h6TDRlTG1HSDNLejlrQjNmaXJWUjIwUHhO?=
 =?utf-8?B?WkhXKytTMnhndzQwTlE1bXBPU1djekxBSDZ3S3JCM1RuVmhOV2cwK2Y3TTkw?=
 =?utf-8?B?SUFlSUhZVW5vWGlTTHhnSFNMak9YcXpHTEIvbmRybnhMNnJsYy9IMTVsNkRp?=
 =?utf-8?B?Q0NtdFhuNzB2d2l5U1JxYjdteTNQWlBWazZDbkZJSXQ5OER5MkY4WXZiMmE2?=
 =?utf-8?B?dWxVanE2QS9mRzIrVms0UFRGR3ZHY0k0Zjl0QTdTMHFneEp4OENJVFZYY1gw?=
 =?utf-8?B?bG1hNCtaUExSMGV0bjROeDFPZUZaL3dNZ3ZxdXNaRTd1QThDUXQxUkxTZjN6?=
 =?utf-8?B?ODVDZkVIc3BNR01vM1dKRlZKVElMSVB0ZjZmQ1hXbC8rUklSeXQ5YUtYTzNG?=
 =?utf-8?B?U3RyN0thTUJzdVYxVWlqSmhCbGxEQzc1OGloYUNDd1RWMXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnJWaGdIcmFKWW1XT3lHTm9JQzRBbk0ybis0bzVyYzU1RG9YaWR6NCt6M0FP?=
 =?utf-8?B?bnd4QXIrSlMyQWJsK3MzRFV0dmd4aUR6Ym1iYmNmTzlCeUo0aGRSREZYM3Y1?=
 =?utf-8?B?cG1TMWNSVWI3RzgxMXJmeDRRWUlGRnlod0RkMHJRb1RDNzlnZVBCUXlyck5W?=
 =?utf-8?B?Y2hvMWlJWTF6Rk1WUGhBVk50T0wrTWZ3Znl1VWMxL1Z2d3ZsQjVDbklncFFS?=
 =?utf-8?B?eFpzK3lwUndVTlg5UmVIcTRSWW85UkdscFpXYlF6TDlUWXkrTlYyNHdkT3pT?=
 =?utf-8?B?ckhCVjd6SFcyQlV1a0pxMUNMMzBjZWllTE5KWnJZVWRtOHZON3RNcVF1elZp?=
 =?utf-8?B?YkpseTd3bkh1RzM2UER3cmRqenlxT2xDWkFzbmhHRVhJdVdVczduSkhKVTQv?=
 =?utf-8?B?dW1IRHUrRWRsMlRhTC9ua3ZweUNENU1tME9NU01NZzJlZ1lIQkhEVHdQdHlS?=
 =?utf-8?B?b1dqbXhBNGZxVEFKV2RkYSszdFdMWUZrM01majIwVmQvQ0EvMUpQeHNoKzJ4?=
 =?utf-8?B?SnJpays1OWkzb0VNSGZuVkprNlpMSkdLd1ovSklNT0duRW85VTNHZUx1NGEv?=
 =?utf-8?B?QTV0SFhRT01idFFVNFYyK2wrTFhaQ05hV1V2NEkvNjNxUXdKcFh0OVFWV2tv?=
 =?utf-8?B?ZnRodkFnRWVxWGVKckZOTHdXNTJpZ2llOXc4dU12SFZNNGxYMDdoU3A1blZH?=
 =?utf-8?B?ckpEUkNHdS9QNWE2cXJpbDBIYzZWNzFielhScnBySDlkazUzQTVOaTJyN1Jz?=
 =?utf-8?B?RTFXNm9nQzV0U2dWREx4bG1QanFuUWNBYTVCYWlIMVhla2VmODREUlRqZ3p3?=
 =?utf-8?B?ZGNyd0lXcXlNL2o2Tm5MVC93cExHTnJrVG44QXBScHRmL0NtcGVXYXpCWVoz?=
 =?utf-8?B?c1lnS01IL09vaEtMUTVQbEZFbjdIY2xEbmhmeHhKLzNPVGpQR2JzQ01ZaUhi?=
 =?utf-8?B?ekRlRk41M0dld2hSYTU0dmM4ekNwQUZMcExnRnBrVCsvQ0hBSHp2ZXZMb1A3?=
 =?utf-8?B?VG5sVVZQWEF0ZXhoK2lwS0V2UkdHUEorYmUwR3FuTlpVWkY4SnFZd2NRMHFu?=
 =?utf-8?B?eDFkcnpBbmhPZEJZbjdiZzJnY0R4TWhLcG5hUXNhNENqMDVpZmtNZnZFZ1pB?=
 =?utf-8?B?dkpkd29DU2NpYkVFb2FjcVRrcGFRTklFVnd1eEdVbU13QTZjc0FBSmpKckRT?=
 =?utf-8?B?SmJiSEVPWGNEWk5ReG91QVBjYnZIV2lhOW1oaTZIN0xzOEQwVjJUdmY0VURk?=
 =?utf-8?B?cDcwUHQ5QWtBNWNGOERGSmJ2Qm5ZdHZTVFRhSXdSWFpGMGRnUWVXZldqSEV1?=
 =?utf-8?B?N3hBT2k0Q0NYK0tTY0YreWdHWFZIZTBnYzhNVmFQNmxnbklkU2R5VjJFbDk2?=
 =?utf-8?B?NkFhNXdGV3BlOFYxQUMxMkwzUWJia1BYd1pqcitxcGR5aTBrU0lPS29SYkNU?=
 =?utf-8?B?TXBVRXBvajhNUUhuWGdLdEp2Zy9xRitXbmJRZkwwaXM3dmFhNmdFeTJsMXRL?=
 =?utf-8?B?ekNjbXUzOUN3dWU3aDZjWEp3SmNaZ0dIdEhuelMvUDdZbGpJNVNYdDQrMCti?=
 =?utf-8?B?MlVoVU1kWEM4TlZMWHRPSUh2UEVUSjBHdnVtRGZQbFBjK2hPY1NHY2pKL0hN?=
 =?utf-8?B?eUg4TlNWZytaZjVodEZlZHVndWVUSERtNmRwQkY5Vnl4K1J2bldDR1VsRnV0?=
 =?utf-8?B?VEJSem9QNitBSElCSmpkbTdXZDRyZzRHZVN0bVltWXhZM1VLWkQ5Q2NrVVg5?=
 =?utf-8?B?RnRhd1RkR2tDWmpXZ25wWjFET1VnckR1Zlgwd3gvWFpaZTZ2Y3JsK3NpNGpp?=
 =?utf-8?B?RFZNcC9VL2V6YVpEbTg2c2l3Y0pTdW1hLzAwQ2lwQ1llbmhkdlNIT2FyWEhK?=
 =?utf-8?B?bXBFSXVMNWczQXZaWU9vVkg3T1JLWUpHM3dvZk8vcFErZVNGVWN1QWNCZW52?=
 =?utf-8?B?Sk9VSGtXelRVNXF1dVFZSTJJSFFrdmZiYWxqWXdtNCtLdXJQR2hmVTloYUp1?=
 =?utf-8?B?cUZwc00vQ0pHUUROUUxxU054eDBsSEJsRTJBNnNRWlN5UGhESGJuc1ZvNlEw?=
 =?utf-8?B?cWlGZFlBbkhGb3ovbVdlMUxscy85OUgxQmVtYWZSUnMxWUdVVmFBZEVUK2tw?=
 =?utf-8?Q?gNaU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766f15a7-1bbe-47d4-a9fc-08dcb84c6c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 08:22:35.8081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/8tjQ5WfYdDSAcPEw0X9EycRnlZnCsrOWBBQwj7B4hcxpSmddjnIlWLsExZs2Mp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0HG8rbpGkepGsbk8KzE8PkpzpQT8JnVEZ50zhFCw8g=;
 b=umYL7qpZaSfjpV5zndvD8M5rkIjVu17jjRDp8kggbnrLq2kLaKsoTv9HoNFf9mIPm6GWBiinJCrVrcZyhZviIBK0aIjPmFPP2IJsYErDubDSPN0CkG4rvWrHwD/01nEwYoLIgGpx8Y4NNP4xi6UDUbcUMoz78tEwxQHzXEca3vo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=umYL7qpZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
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
Cc: "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

> Hi Michal,
> 
>> I can help you with this problem.  It is because there are two different
>> versions of the zcu106 having different DDR memories.  This is because the
>> DDR that came on the revA version of the board became obsolete.
>>
>> I left the revA device tree in buildroot as I know this is the version of the
>> zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
>> the newer version of the zcu106.
>>
>> To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
>> correct spl psu_init routine will run.
>>
>> Please implement the following in your zcu106 defconfig:
>>
>> - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
>> + BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0
>>
>> This will build in the correct psu_init_gpl.c from the two choices below:
>> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
>> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA
>>
>> You can read about this issue for the zcu102 and zcu106 here:
>> https://support.xilinx.com/s/article/71961?language=en_US
>>
>> Do you have any opinions for how this can be better handled in buildroot to
>> support both versions of the zcu102 and zcu106?
> 
>> The only nice option from a Buildroot perspective would be to runtime
>> detect the board revision in U-Boot and apply the correct DDR
>> configuration accordingly. This way a single image would work on both
>> revisions. Having two full defconfigs to address those two board
>> revisions would be a bit annoying.
> 
> I believe I already know your answer to this, but I will ask it anyway.  Would
> you be ok with adding a small routine to the SPL that reads the I2C EEPROM on
> the ZCU102 and ZCU106 boards to detect the version before configuring the DDR
> like we do with the FSBL?  We could make it such that the routine is only
> enabled if the device tree is set to one of the ZCU102 or ZCU106 device tree
> revisions.
> 
> Would you be open to this?

> I replied origin email already.
> And in connection to SPL hacks, psu_init hacks. DDR config is normally coming 
> from vivado via psu_init.

> The issue with DIMM modules was that used modules were EOL.

> Dynamic DDR configuration would be nice but then you need to mark which are 
> using DIMM modules and which configuration you want because chips can run in 
> different configurations (for example speeds).
> Then people can start to exchange DIMM modules and I don't think anybody wants 
> to get to this area. It is a lot of work but pretty much for nothing.
> And you will be also fighting with missing space in OCM for it.
> Because of that you would have to start to change SPL layout to move this code 
> to area which is going to rewritten by TF-A later which ends up in another hack.

> If anybody wants to spend time on this that's fine. I am happy to review it and 
> help with it but I don't think it is worth of effort.

> What we have done for generic SD card for ZynqMP boards that we have small 
> application which reads board eeprom and based on data it setup multiboot 
> register and do soft reset to boot another boot.bin directly for the detected 
> board. This is working for zynqmp evaluation boards which have onboard eeprom at 
> the same location. This could be extended to support different board revisions 
> or detection based on SPD. But not sure if this is useful in buildroot content 
> because boot.bin can be placed to QSPI for example.

> The easiest solution is to have different defconfigs for different board 
> revisions if this is acceptable.

> Thanks,
> Michal

I agree with you that implementing and testing a solution for the spl would
be a lot of effort.  I would be open to eventually doing it, but I have other
things that I think are more important at the moment.

In the meantime, I propose the following solution for the zcu106:
http://patchwork.ozlabs.org/project/buildroot/patch/20240809060336.3326177-1-neal.frager@amd.com/

For the zcu102, I do not have access to a board with the older DDR memory, so
I have not been able to test if the spl actually works with the older DDR on
the zcu102.  For now, the buildroot zynqmp_zcu102_defconfig only supports the
new DDR memory which matches the board I have.  Unlike the zcu106, where I
have been able to verify both versions of DDR, I do not know what to do for
the zcu102.  Any new boards purchased today will work with the buildroot
defconfig, so the issue is really only for any really old zcu102 boards that
may be out there.

@Michal, have you been able to confirm which zcu102 revision name in u-boot
corresponds to the zcu102 with the EOL DDR memory?  I would be ok with adding
a comment for the zcu102 as well, but only if someone has actually verified it.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
