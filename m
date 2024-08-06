Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08788C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257766083F;
	Tue,  6 Aug 2024 15:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtJp3NFjbNdP; Tue,  6 Aug 2024 15:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8AD605BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C8AD605BE;
	Tue,  6 Aug 2024 15:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F43C1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79AEA605BE
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAP89UN5YXZ1 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E39CA605BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E39CA605BA
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E39CA605BA
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg0lnzGbf0s9433MVF8JBESCfPUZPLBmANo6kJ5cIC7Qa2EXLOZePylbxSmlcgCAtLi3XF9vpkCb53CfX3m3F3ikfAuvdLexcun+IbrcBJRhq8pTYj8qIWkvZ9TyM84vjMco/co09TxJu3kFpxyMjXDKXiO4MaugO3ERJjosAf+xXqmTppqx7KGyULBxe/lXHH5P96ovVIpltIiPE4YGa5mZi/LEHcHzRwqjkFY0CtJ3uSckLeAMVzroAyME+0DhYwzExNfaiAADaGVZKCjVA36oLSWgfELSZ09rbcs6lw+FJ4FhAMAkQaJWWAbytUMyYLGz39epHhddeEU79Eyx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfznQDtcFDjLkA/2IB2XWG/sM4Mq65Y8Ph4Xv9tFD8E=;
 b=IVW8eesznhMVoZk71DV9rYCdHMutDYpIQnvwl/Axb0rD7um2RMVRtT8dEGXxYM9/nBT7l1npA2fPcVzHNBWKCFBWhRuT0ElBdWyRNjtlp2x9fsWgzosvXpIK1OqfWF0wG5R+f78Zb1aKfgh1b+O+CdC7mQFwNEhQ9H/QbyD9bjm/CW9otjQ4nl5TQvtt6s068Uwle0KddmC1usq2WXeSseZXbCuZnvNeqH0fmi06rAuCDpOZwtsYKlNbScX46k6iCMB1DiNGGy50VmEVABkafdxZyEVZSGivvVoe3CUlrh+mySomc/9znuqCElI27CZj+NlVslNzVCunDd0w/lX8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 6 Aug
 2024 15:01:17 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.008; Tue, 6 Aug 2024
 15:01:17 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] configs/versal_vek280_defconfig: new
 defconfig
Thread-Index: AQHa4l3Avv+0df/NdE2DKg1OZWSVoLIaQp0AgAAWNYCAAAUC0A==
Date: Tue, 6 Aug 2024 15:01:17 +0000
Message-ID: <CH2PR12MB50041FA7D2330F1C720E0EEAF0BF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240730085153.3496255-1-neal.frager@amd.com>
 <D38UZT2SUU4G.3M5NHMNLDJ2HS@collins.com>
 <CH2PR12MB5004046E7E2FD1B4FC175A5CF0BF2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004046E7E2FD1B4FC175A5CF0BF2@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB8996:EE_
x-ms-office365-filtering-correlation-id: 6990e112-ffb2-4cc6-112a-08dcb6289fab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?bEx4Mlo5K29uTWNKZyswQWNtLzdESlVkVlBWOWlLUGJYSnFSbUJONVMwbkpm?=
 =?utf-8?B?WnEybi9yYkxxc3dLZGVUcjY1a0ttblppSHVlai8vcDBvbmFUek5qMHRNZlhI?=
 =?utf-8?B?THQ4dnB3ODZ0bU4waG4wN3lBbTlWMlNleisxU0dMWlhXcDArRkV5NjdtV0ZZ?=
 =?utf-8?B?eUpDNFhpbngwL0djTHFHSXFGSnFuczhBZWpla294cTc0anlDUmtpRmJZRGRy?=
 =?utf-8?B?QmhUd0MwNXkwcW1pbU4rZGkyVGFuT2JjSDhaWXhVMzRiZTNiZmFzODI5QmhJ?=
 =?utf-8?B?SnpVOXFreVRNRld4OCsyR1BteWpNTnJOMGZ4UEN2TWRXYitrVVprQXRkN2tE?=
 =?utf-8?B?cHE1aHAxZU43VUtCb2dhQ1FKZk9SdmpweFlleHhzSnZHL0w3elpvamdwU1Ux?=
 =?utf-8?B?RzJUYXNwc2hKSzhpLzBmc0pUWjUvNEJlV3Z1QWhLaHo0QmpPYWV2b09QZ1Zj?=
 =?utf-8?B?dDZPU2lqcDdUZTdla29QdTBya0hJTkl3TTEwWlY2WldKSTJzY25KTVYyWTVJ?=
 =?utf-8?B?Y3A4djFWZkhYZFNjMGpESHZ2K0pPOVZFWXdXY2F1aVFxeUUybjhDWXJ3V3Yw?=
 =?utf-8?B?SU9LckVXc1J0WU9LYXlQbGxxMzNJVStKU0lpc2U0Rnp0VVBNTVp3ZExnWkdJ?=
 =?utf-8?B?Rnl0RnR3bVZqaE02U1lyU0dHcmMwVGNSMVAzWkdPSkljcSt1OEdURjlCN2h6?=
 =?utf-8?B?MDhBOWlZN3RsWnJ4THF5NTlmZk9EYlRUaS8vQ3RJS1llcDMxNktBWVpFUmdV?=
 =?utf-8?B?UFBYRDh4Tm53VGZXalYzQmJSWWxnUER3TU1vb3ZKUk9tMXRPb2JNc3RYTk1G?=
 =?utf-8?B?VDhFb3ZEK2VpZHFJNG5IYWcwbHh4MTN1VThTdHBwaHpJM2xqRmVRaEdOVlRr?=
 =?utf-8?B?SGRFNUh1NnVYTlBMRFhaZVYwcm1qNDhjK2JTTHQvUmhZUzdrRllYNk00NzVw?=
 =?utf-8?B?VER1V1pucmZvRThpVDh3ZW85MXY1VFhOelN3ZWhhTk5YMFU1cjgxSUhSTTRQ?=
 =?utf-8?B?ZEpEUHdGZ0h3VmtESTI5Y3J2em0xN0tVWXJxN2RiMEtDOUVqTVlRU3pLQUVq?=
 =?utf-8?B?RlZLakFNL2t6Q3d0VHBzYnpvTGM2alNCb3ZhS1pPbm05WkxCZFo4bEF1R2xS?=
 =?utf-8?B?R3lkbmtPRWdScVd4SVlxV0w0emkrOG1nSUhsT3ZuZlhJUmUzSHhyKzI3WnRT?=
 =?utf-8?B?UiswTEZvK0FuZXJTbCtIb0duSUhUODdTdWFWNkgyT1BiZEc0dGlPSW8rNHdD?=
 =?utf-8?B?OFh0cnI0WEFIQndRRi9yWkZNQlJ6cUQ4Y3RLM3BxdUYwK2lTdC9qWGVJV1RX?=
 =?utf-8?B?ZnZkdnBmNDdKYkIydDgrdnFDRUUrcG5HMmUvbWRoNTJNNkdsVktTZUVqWEJ3?=
 =?utf-8?B?RCsyNGhWZ2JxbzJSTWRtdmJkbEdHSTIxT1hiWGN3MVZlUCt3cEdNSFpWbHBs?=
 =?utf-8?B?VGRqb0VNc0JtWGloYjYwSnI2K25PSm9MajBzWkgrUFgxQ0t5VkJGV3B2cmlJ?=
 =?utf-8?B?KytNaWpsS1JJVmxxUE9kWmdwMDMzNk82cUtLSTNCUVRjemRtZk10TnUvVFh5?=
 =?utf-8?B?TnA2ZUNHK3JDajFqTHUwRzRtMXE0aUlWOGlodDhXdjExOVVia3hJVzhsUlNh?=
 =?utf-8?B?L1lEZ3pGdlIzbE1JbnJhcWxZNnRaQmI5Q25CVGZnY0Z3MzloYmszOWhIelFT?=
 =?utf-8?B?Sm5kZHRreG95MUVUZkEyYmR6QnJrYkdSUzExamdwSVp0VWlQVDVHSGJURmlD?=
 =?utf-8?B?eU5hZWZqNFl1Y2lKcHRLMUw4RzBvemV3czMrTG1EWUFTWnlFZnRUemh1eWw2?=
 =?utf-8?B?YmZZZm16bXBzeVFwSzVnMlBDQ3pIUjNneHpOalZEVWE1bFMyT0FxUWsvUUV0?=
 =?utf-8?B?OGZuOERHamZ1UGRPMDdXd2pMT1ErdEJtVkg3NkgrRzhweGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?allXaE0xVkt1MWo1SUZmOHQreWpOS2pmVVNWYUFNQWkzWExyOHhJTVlPZXUv?=
 =?utf-8?B?YnFjczVIRzhnOTFvcUIzQ0VORU1PaWJEY2NPVjVQbXFHUW9NUVdsV0V5eHFh?=
 =?utf-8?B?bzk2dDVJNWxOeHBRV0JiYml4amxMTC9BZXEyS1Jja0FXbE5xS2c4cUJCRGRL?=
 =?utf-8?B?REMxa0pQdmczVzAxWGxMdGsxWE5SRHNCNDhocC84Z25PRkxySTBtSWN3QXdy?=
 =?utf-8?B?ZXlMUWtQcWJpRVRYYnYrK281UHYzZTY4NmNoUnpRYUpQQk8yU1UrK3VGQkRD?=
 =?utf-8?B?SUxmQ3lTTGZGSlk1R1Jmc1NXOTBScEJJTWM4YlF3aVF1ZEVwWDE5cUhBek5P?=
 =?utf-8?B?bU1EUEJDVUtsamdGekUzUXFMODNUMnZtVlUweGhvLzJRL2x6TXkycWZsWmE2?=
 =?utf-8?B?bDBiSWRpdjc2d204aW5ydUFwS0hXZjRSK1dJK05hVG54ZXB6OW13OE9ZZGYw?=
 =?utf-8?B?NWp3QVpjYVJMdFBTK3VtRTU0TGhsNFM0d05iWEZtNU9oRVlkQ1BLM09wK1gr?=
 =?utf-8?B?OEM0bS9rQXovcWZFWXhaMks1Z2JJMW14c0lOMUlNeDJBZlM0aE9XZUtqY3NQ?=
 =?utf-8?B?M1FrNHkyOVJtbUZYR3NEbElSYmN3cWMyTkNTYnZ3TnhnNWRlSkd3NHVpUHJm?=
 =?utf-8?B?TTZzZGpmdm4vMTl2aHBzaGVWbDdHV21LNEZ6SFo3QmQzNFFGQ1p1RmthdDNp?=
 =?utf-8?B?TEszRjQ2d0ZLU0ovekNIMzdHN3dXN3NER0hWTnRaYWYzajBXbmZkMDZLYTEr?=
 =?utf-8?B?anNHNzdISFc4Vm1VZTByaHFhem1QOG8rSEt6V3dmSEhHYlU0MDVzYTJiVTN5?=
 =?utf-8?B?b3hFT0lLMzRqZHFGREU4SHo4Tk4rWkZkQTZmY2cwcE8zZ2hPd2RNLzZNS0VT?=
 =?utf-8?B?VnJXVkY0NkhNZlpVWU9nWkJ1V1c3K0xvVkZBdkdmam5BcWNvN1FHcGtsZGZ4?=
 =?utf-8?B?UkZVWklFQm1LZlpicnpqTDV3S2RhbEJYcFBMM29OeFZWdDhTRDBYSWVIUXhv?=
 =?utf-8?B?YlZETG9qbkdTVENuSnVNTmc3TWp0MzU2K3dGb3FnNzBteUZGZXk1cktvbjl6?=
 =?utf-8?B?aG9LZmMwNWhUMjlKOWFLNzEvQ0lETU5ESDh4QnlMQ1BEY2RWbUZsNER1YTJx?=
 =?utf-8?B?U0IxZzBsTTMxRThHTXVHOXM3Z3ZINkRyVlZGTGNabExBNlVJbGwxbHhmNTFT?=
 =?utf-8?B?L0ViVlBYM3BDSVNvc2NyTHRwU3BadlJZUHV5d3VNNzFpWkpKeUV4L3Mzd0dN?=
 =?utf-8?B?VVNvTGhCeGtZSXpyMGIyZjY0TnFIRmJXWjdpQWl0bEZRMWJBNTRRczA5QXdp?=
 =?utf-8?B?ZmdkOThwR0dXQjFYK3ZkYlFwSG8rOGpPeUZST0E1Z0lwWndBcytTS0tFVUJ6?=
 =?utf-8?B?SWp5Ui9mY1VqUkNZNVhLNWpibFRuVWdBQUc1ZEd0dzI0SGlzT3Z0djhCZEhI?=
 =?utf-8?B?TWtGU05wSUt2R0VRMEpwS2YvV0lqZGliemo1eE5DajJ6eUl0YzQ5QTNmZmVo?=
 =?utf-8?B?TnNXZnhvbDBTTmIrRTFWNk9sTmFhcUJ0dCs4bEVNODlOL3BPR0lRNy92cVh0?=
 =?utf-8?B?VXNLRnEwL2gxcGpZMjFVV2I1VGYzTUs3L2ZxeW53cHRVOU03eGlFYUIrVnBG?=
 =?utf-8?B?dythaC94azREd2VRTXRLcjZ6Vk05dURlRHB0Rjk4SmRxdEhodkkxWVZUUU5y?=
 =?utf-8?B?RTBzREIwL1k5a1hRSlQ3ZlNESm9aVlAzbkhBV0I3bEZ0UTNubWdQN0JuVU40?=
 =?utf-8?B?SjBvM2hxbWlYbmdZWnEwTEZyKzB1bUluTlVQZHA5Uk9OS0EvVUNuNVFsd0JP?=
 =?utf-8?B?SXJqWk5rakZIZncwL0IwOVY2SmxWR2hjaW1jTDBNN2N3a1Y0TENUR0s4MDR6?=
 =?utf-8?B?L0xkTnRiMkJXVkNmNmJXenZURFdTcWg3eFFRUy9kdXlBOEtoT0U4ajJsM0tJ?=
 =?utf-8?B?RURRRWx5SXZMaHNMSU9xVFdTblVpSGJUaUlnQnBOOXZvVm1KK05CVUwwYW83?=
 =?utf-8?B?TkVXTHBpanBiU3lSTSs0Q2dxbHJYN0xIVEQzSEpwclo5b3p2RlcwNFA3SHZE?=
 =?utf-8?B?ZGZvQ1Z5MTVWTlNlenVNRHI1ZUFSTHl1SlQ1ZFhjNmJKa05HdzV2NEhrdFNK?=
 =?utf-8?Q?i6BE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6990e112-ffb2-4cc6-112a-08dcb6289fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 15:01:17.3065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXxWM9MS5myxj5trIYi41MbY/0VQUfGw7pm3DSaN8RJC6eSBkGEm4Eatx5ROabM7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfznQDtcFDjLkA/2IB2XWG/sM4Mq65Y8Ph4Xv9tFD8E=;
 b=mBd/K+HlXu0eec5ANEUmzaX4oUL3T9M/or4oRdTKdIDtcSm3rDn3EdLMX+gaZcc55x0OGsXAMQOSXz9lZT8H11+v9E6sG+XTgz2yEBBBzikxhmSwjYKCRM8FIMhDyVRzsrCWwG/W/7lf1zCexNmbarzqjTyB+4mO9i1Iyrcy2ss=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mBd/K+Hl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/versal_vek280_defconfig: new
 defconfig
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
Cc: "andy.a.kennedy@collins.com" <andy.a.kennedy@collins.com>, "Erkiaga
 Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> This patch adds support for Xilinx Versal VEK280 Evaluation Kit.
>
> VEK280 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vek280.html
>
> The VEK280 requires a patch for the memory node in the dts file because it is
> not currently correct.  This patch has been applied to the linux-xlnx repo and
> will be included in the 2024.2 release.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Fixed memory range in dts files for vek280 evaluation board.
> ---
>  DEVELOPERS                                    |  1 +
>  board/versal/readme.txt                       |  4 ++
>  ...rsal-Fix-vek280-memory-configuration.patch | 45 +++++++++++++++++++
>  configs/versal_vek280_defconfig               | 44 ++++++++++++++++++
>  4 files changed, 94 insertions(+)
>  create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
>  create mode 100644 configs/versal_vek280_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 78ea65205d..1fac1da208 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2400,6 +2400,7 @@ F:	board/zynq/
>  F:	board/zynqmp/
>  F:	boot/xilinx-prebuilt/
>  F:	configs/versal_vck190_defconfig
> +F:	configs/versal_vek280_defconfig
>  F:	configs/versal_vpk180_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/board/versal/readme.txt b/board/versal/readme.txt
> index 9cf499b35b..4d8406fb1f 100644
> --- a/board/versal/readme.txt
> +++ b/board/versal/readme.txt
> @@ -4,6 +4,7 @@ Xilinx Versal boards:
>  ******************************************
>  Supported Versal Boards:
>  Xilinx VCK190 board
> +Xilinx VEK280 board
>  Xilinx VPK180 board
>  ******************************************
>
> @@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
>  VCK190:
>  https://www.xilinx.com/products/boards-and-kits/vck190.html
>
> +VEK280:
> +https://www.xilinx.com/products/boards-and-kits/vek280.html
> +
>  VPK180:
>  https://www.xilinx.com/products/boards-and-kits/vpk180.html
>
> diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> new file mode 100644
> index 0000000000..2eff388f50
> --- /dev/null
> +++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> @@ -0,0 +1,45 @@
> +From: Michal Simek <michal.simek@amd.com>
> +Date: Mon, 15 Jul 2024 08:24:57 +0200
> +Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
> +
> +Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
> +configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
> +(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
> +tab but not available as option in wizard. That's why only describe 8GB by
> +default.
> +
> +Signed-off-by: Michal Simek <michal.simek@amd.com>

> Buildroot patch files should include an "Upstream: https://..." line
> here that points at the upstream commit in github. Followed by your own
> "Signed-off-by".

> See https://buildroot.org/downloads/manual/manual.html#_additional_patch_documentation

> Thank you for the review.  

> I will make sure to add myself as the second "Signed-off-by:" on the patch.

> However, the upstream link is a bit more complicated.  The only github link
> for this patch is on the AMD internal gitenterprise.

> @Michal, do you know when our next push to the external github will be that
> will include your vek280 patch from July 15th?

Never mind:
https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea

v3 coming...

> +---
> + arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
> + arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> +index 1641dc0b5141..ad5d590318e6 100644
> +--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> ++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> +@@ -19,7 +19,7 @@ / {
> +
> + 	memory: memory@0 {
> + 		device_type = "memory";
> +-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
> ++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
> + 	};
> +
> + 	chosen {
> +diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> +index fda47cd87b3a..80aae8fa4b11 100644
> +--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> ++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> +@@ -19,7 +19,7 @@ / {
> +
> + 	memory: memory@0 {
> + 		device_type = "memory";
> +-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
> ++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
> + 	};
> +
> + 	chosen {
> +--
> +2.43.0
> +
> diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
> new file mode 100644
> index 0000000000..37e479d692
> --- /dev/null
> +++ b/configs/versal_vek280_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_DTB=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
> +BR2_TARGET_XILINX_PREBUILT_VERSAL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_BOOTGEN=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
