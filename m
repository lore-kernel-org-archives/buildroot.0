Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF0AC87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 10:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE26381B69;
	Wed, 13 Aug 2025 10:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzBHILQNoB6m; Wed, 13 Aug 2025 10:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92BC281951
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92BC281951;
	Wed, 13 Aug 2025 10:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C889938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DEF4606DA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqr_on6HieDS for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 10:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::604;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A0AB6063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0AB6063A
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::604])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A0AB6063A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:28:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYwcm01fnbVXcH/33AVNhuyf57jHSH/MG+aN4o+Z1RtMww/3xqCweRcfPutxpTXY91GDGpo8JjoMiA3+DY2ul7k5jLmHm8xU7Wnu3eK49y87dUHVMqSdDsgnMgMOxBd6RMV6/A6Gyxj4VPdQ7HeXipgNZpohXMt+E/btqycuGgEx8cXh2ihhwagYFmHLdEzM32eaGppswbDyg5Pok2htHTs73DeLnRYW+EdpRMaBye63LIDzQ7l+L4uDUQYtpdbw2zL5/IVN2eTM8G5ENzez+F/RFJGD4YT8TtAESlOLrqmVrKSAl3Z0IfWv7QJsQS5BHgMoJR4yDMNnAAfJ3tLzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHZoYXymGu0RjIeHwVb1Ix429oR8RIOok0jg5MIDjKE=;
 b=y7qIeDz76jTpSfWmljbH1Lv/1rh+JAkaDwcO+yqGdbFGQc2XOCbNviE2jVQmLSlqMWDteivLth8783ImCCSSk5Z4LbNL6luAJoJOy3q32WZsoz5PbpHxvDc2yaa6TN7ItZ0VbpZeKvv0he7BDLUXnWHyKtPsVQyStmjIMkbNXpSj9NDNYjKkxeN1ko8FVu0tUFGXKc9kV6Bb3fXOUcRZKAiIdesZSrG30ZlaLUwGpGGzbgKLdJ+6VvN9VCYrSI2xjj6pMDdYSrlcZdPaRkmvaNxN66PgQlRPu/PW6TDq976n2I2B/bWssN74iA2Pf7gjW3/MpZHvhyEdt4nlj9RV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Wed, 13 Aug
 2025 10:28:20 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 10:28:20 +0000
To: "yann.morin@orange.com" <yann.morin@orange.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTsyAgAAB8ICAAAOasIAABXwAgAAF3OA=
Date: Wed, 13 Aug 2025 10:28:20 +0000
Message-ID: <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
In-Reply-To: <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T10:21:24.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH7PR12MB6860:EE_
x-ms-office365-filtering-correlation-id: c06ba920-f0a6-499d-91b2-08ddda54202c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?cWZqNkY5V1JkRUVwM3hzVGZMYzYxQnRjYmVxWms3Z3RvUkwwb3UyNHFGOW42?=
 =?utf-8?B?QjE3TmpvQ0xLVjhnN2JqVDY5eWQrdWMrN2VuNzNKY0VOelFneGtCWTlYYk52?=
 =?utf-8?B?ZEE0S3BFK0doZXdJOFR0NDVBdE54SjYrdUxPNHJneG5MblE5TFYxZTlqa3hx?=
 =?utf-8?B?R3I0N1gxSXZYc1AyWHJoYlhtejF3YzB0bnlQVnBCYVBJOE5lbXV1M1d4WlJq?=
 =?utf-8?B?ZFkwTGNvdllFYTZ2ZkQxeFg1RVN2YXZydlpIZk9iZDhnc0thTTA0UDFUYVE5?=
 =?utf-8?B?VktKanZ3ZVB3SkFVTTVOUWhEWWQvaXUzNkZKcEVzZlhwVGpBc1l3RmFna2ky?=
 =?utf-8?B?Q3pYZWVtUHIxYTZnZWZWVDBPWkY0R01HMWxjYmMwd3kveUl1UHo5YVFxdk5t?=
 =?utf-8?B?blVGRVZXNjBLRXFxY0lZUG5XdnlHTTg4cTZNK2tBNzIrdEFzVmx0SEVVRWR5?=
 =?utf-8?B?ZnhwTklOZzArVkJnZmdBUTN5N2pGYjNjOGdPdzlWdVRodmJTWXhLc0RhY01F?=
 =?utf-8?B?Zk1UYlhFZFpwYkNrTE1TUkpNbkxXTndramVnVmdia2dmUit2QjMvcjVZVloz?=
 =?utf-8?B?dnlmQjdBTkNxSkpzZWxTbTg1dW9IK2MzenBjamN3MTFRU3FCY1lpN2d2cHNs?=
 =?utf-8?B?TlBaTHZNSE9MUlEyUXNnZWc3RE5HbmhEVVRyYk9HOUtrc2N5K08vWlBpc0dh?=
 =?utf-8?B?RHhxcGtUUUVrd3c0TW1STGxia2Z3VGVVd1NGRUZ4dE9RME8zamRiLzRuRFRr?=
 =?utf-8?B?L1ZkR1cwZWtOTVNGaFBuOUMxa01EK0ZYTUxkZnJXQk1JRDIySTZqQU0xMlVo?=
 =?utf-8?B?ekRaYmZ3alVtUFY1YnpHZXh0QThqWGw0ZFl5UTAwNllOQ2FVVEx2bUcvUFZw?=
 =?utf-8?B?a1o0TFltVnJPMmdEQnByM09IcmVzTkluam56bEp2VThsR3hJeHh2SjRLbTlN?=
 =?utf-8?B?MmxXQWZ6VitGbkpCbXZFeklxcTBsbW9KN05Od1VDNWw4bDRzZC9wZEZ3SjlK?=
 =?utf-8?B?RDZZN0xDL3ZjeVh3REVmSFFFMWlLbmw0TVFXUUNDUG8vL1ROekFuRU16Wml0?=
 =?utf-8?B?YmoxZXMrNnZ1RXJIenVPQzJRNnFlWU5uTGJYK0xDeG1lZjFUT3gyWW9DcTBB?=
 =?utf-8?B?Y3kxOExIT0tYS1B0cmh6T2dhdlJMUVNHRk14Wms1YVN1bDl2YzBhTmR3MlVB?=
 =?utf-8?B?Y3VrdnlBbHpmM0pubXNtbmpLRG1IaDU4TlVqSHVwSlFBT2s2RU5Jdy80VGYy?=
 =?utf-8?B?Z2F4d1JaV0t5WWNPUmpUcUR4dktsTGIwUjZyUG14ejFsckJIQnRIZzJNVmM0?=
 =?utf-8?B?SzcrWisrV3g5UmJ1SkljZXJSdjI1TFNYODFhWElkeXJ3bUhHb2x0amJnYWxK?=
 =?utf-8?B?ekV0ZkgrUEo4K3piaXduWnJkdDdxeCs5Z21nMU9nYUlzODZZOGRwR0IzYXB4?=
 =?utf-8?B?bUVTTi9tcDhSUkNyREkwYjJaME53SlRDWTFQaHp6cEdwdzExd1Q4UndsbjRB?=
 =?utf-8?B?dHZyTVNBbFNHRVlVWWFQWmVrYURSaHNjMWJETTZoZENpSDNHQnFIWmFmaHls?=
 =?utf-8?B?NGZiMXY1T1IzYXZUT1JKYlVuNUFNbUJpTDl6Y3cwaUNjR2V2bzByVGxER2FU?=
 =?utf-8?B?bU0xVFVFYitiQ1orYjlCbWQxeHYrVG5YcVNKQ2JiMmxpSExGWWd0MzZJTHFh?=
 =?utf-8?B?S1hnRE9zaVdxanpFWjJ5VFdJdXYwQ1RtT2s0UUQzRzNUYzlXbjI0NDduVmhG?=
 =?utf-8?B?Q093V2tQSGd0ZTBhOEhwaXlCMEpjRnd5RXk4Z2t3R1FtWUNneEJMeDZxVGtQ?=
 =?utf-8?B?Zy9NSWZEUEtKUSt0cGlsWU5kSU1KaklRS2tRZkFsVFdMbk9IcUVZY0kxMmUx?=
 =?utf-8?B?TEhXZjRscTNoKzZ1UE93d2tFOTRmUHFiVjVkalhHTTJkUDhNT2lxbzArM2VD?=
 =?utf-8?B?V21FRjNYZ2RiSE8wa3NqbjRhVlhEcHZTbmV3Q3RXRGtHY293UDZJR2tadSt1?=
 =?utf-8?B?ZStLR2xPZUphSndNOGF6WTZ0K0tiV2VEM0pobVNId1FoY2hIWHdmMUhWbURH?=
 =?utf-8?Q?Yx27Gp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym1GbkllaE1PMVp0amFWNmNST2NKNkxsYmYxdVF5aW5Yc05jbU51ZkNvcU9S?=
 =?utf-8?B?cktjS0xpb2k3YWdZZlZDS0J2WFAyWUcvaVd0WHZUNjMxdURSbVZLUjhjdmty?=
 =?utf-8?B?OTV5QmVoZHlRYWZNbFN5ZnB2S2ptWTV3RlZBQTFsUk95MlkyejA4NXQrMWNR?=
 =?utf-8?B?L1JsVDdoT2tyRHlKT2JyOFBrVlZGRTUzNEtjYmFmWjVOeFB5WjhlSUlocVkz?=
 =?utf-8?B?Q1MweDF5bm16OTMyZVMwNXZLZkJlRTFRY2t4N0hXcC9BUmIvZmVRUFpCamlz?=
 =?utf-8?B?dVJJWDArV2FYbi9iMmxEb3A5YnA1MkVCeFRRQXNwTVVFU2l1WVRwWlhtaEcz?=
 =?utf-8?B?YUg3TWhDNklkcExTeWVyRFhTQXZtWFU4eC9hWTQxeW5GL2ZCUCtaSGIvSklk?=
 =?utf-8?B?T2E4Q0wxVXh5VW1tWFpzakZQZWxHR3IvNXp1dGdkZ2tqYjI4TjJ3YlByTmVh?=
 =?utf-8?B?cTZRR0RWK25FMWt4OEo2cU4vMGhKdHgydERjcU9uL2xPVmpyYStMR3ZZQjF1?=
 =?utf-8?B?aWZ5Q05hODdhbWc3Q2h3ck5wbi9nVW9YS05uK3BmUlp0aC8ycVhuQWRLcWdu?=
 =?utf-8?B?OVJ3bXNVSC95M3pTVnFZM3VleDMyaUExNktZVHhvL0tRMjViRkFobVdUdS83?=
 =?utf-8?B?T2VKMmZuQ0J4UEVlbTRlYTBycGs2K1JsQnUwTVlkOWlvMlZrN00zTUd2bFhR?=
 =?utf-8?B?MGQ0QTlvYmlRVGM5QU0zeXdhT0xRUFd3L0xRZ3JCaW04cnFyQ203Z0pMdXpK?=
 =?utf-8?B?NU1zdXE1UDUyRTNya3MrRnVueDh6VUdZa2lTT2xqVkpvSmFFVEhiUHFSZ3FL?=
 =?utf-8?B?VzU5dzNlbmpBaTd6dS90d3BGb2gzZ0daRENQcnNVZkdNSHMyRktRb29pYndT?=
 =?utf-8?B?cndZSzc5NzVKMkRWdzNhcVhhNncxcmtSSzEyL1VxZm9kUkZKSUk3SWJVQ3VL?=
 =?utf-8?B?a1RRYTl2MnhWbTdCRlVqdzRHM0pDQ09LWlIwU3pteit5cVp3WDBoY05vZ2Nz?=
 =?utf-8?B?S3hKbFlXTWswVHBtaXpMWTB5VXk1TGRSSjJhWEZyZlZkemltL2pPSTVtcGxI?=
 =?utf-8?B?cDhOQXJHbTJVSlA1T0xMOXFuNWtjd3dXTitYQkFoQ3dVOWJ2Mnk2ajdWL3dP?=
 =?utf-8?B?QlQ3cWJNZVpiWnVwdXRjMXJ2Q2JlaWFJcXV1V2habWN1d053bXh4bWx5RHV1?=
 =?utf-8?B?SWh6Nks2ZUZ3eUxYR1JjUlBpd2U1TjZKRmNmTFRycDhSeWlUMkZQZzNWanhm?=
 =?utf-8?B?aEdYdVlhcVZtTC9WVENETmJkUENsbGpmZTYrZS9MMnFGZ0I1Y0IvTDZubjRi?=
 =?utf-8?B?bWY3UUZPZ1pUOUlOSHpVVDExbEJRUnN6QnZCb1VhRUVKU0ErbWg1UWJwcndk?=
 =?utf-8?B?dVVCYVlWN3dtMGpNNVg0QVNpRmdQRmVJeUV5YkpVMDlDVHVaQUhLcU45Nklp?=
 =?utf-8?B?S3VTcitNbENWV3QyNkEwN21aUzdHbWdCRThQTmJETUJxQXVGUkxMK2UxOGFB?=
 =?utf-8?B?T3dHQ3dubU1WR1BoTkYvTnV1b1Q1Nk10Y0s0SmFUazVCeWpnSHlNQnZhMThI?=
 =?utf-8?B?VmN3dngwK2RvemQ3cnIva0NJbWVmYzN0MVpUYnd5T0I4TFgzOFRHM21CTjlH?=
 =?utf-8?B?QU1SQ2RON3l6MmhnVTJXWmhIQzlEaGtqZVAvMUVzaE95cko0V1kwWmdNZVRF?=
 =?utf-8?B?aU11ckN6UE9PT0JIVUcvWU1CRk1KVk9JOGRXODJXdWx0Zi9KOVJXeTZBc0lw?=
 =?utf-8?B?OHFROWZSSDBpTHRXT0dMUkZaY1Rydkc4RmJsM0ZsRXBRNzVjNmhxN01LdW1W?=
 =?utf-8?B?QnQ3NGRnRnZvY0tTVkpHTlJIcjYrcnVFN3RubUJ2WUZsekpKYzE2aVdvSUNS?=
 =?utf-8?B?bnhZdFZHRjA2NjdqY21JNVgvSStrZUxOTVNOMTlzN25xeDVtdkx6NmRBOUpS?=
 =?utf-8?B?b25ZMVBSUHVma0I4R2xTakt0bW5QTG5kck5MSmc1QU9FNUpqaEw4dFZ1ZTky?=
 =?utf-8?B?V20vY3RhQ0JDUGp6TVZibEdnRmlyUnZJTFE3bG9FVG5VTUdmOXluNmRvSW45?=
 =?utf-8?B?S3hLSHVydDRpZ3N1U0JPQWFqQjA0TE1hZzFjV0lGSWRzRTd2b3BWa3cxRldr?=
 =?utf-8?Q?rRvk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06ba920-f0a6-499d-91b2-08ddda54202c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 10:28:20.8200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxwQJ6fJUmJcxaLrpiBVjsb0tJiYp3iO7ZVjHvHGSuAPQzOhqe+z5UPtEqjCN89C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHZoYXymGu0RjIeHwVb1Ix429oR8RIOok0jg5MIDjKE=;
 b=FFoEhS4v+QBPosQEKCMPbYBxKPrpGkkkknK7mwsOFBOVEoqCD5S+WJwdVtxSR0xnhI++hf0vOhlhrR46krlw8+Imb8MeBh0e7Sge2sSTCsLxuxZ99FPiaTXXqKIEWHnlo/NyTDs/PS7LHsWCPnlb/Aa2jj40O8Jcvi4Ps6LJ/Vc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FFoEhS4v
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Yann,

> [--SNIP--]
> > > -   depends on BR2_aarch64
> > > +   depends on BR2_cortex_a53 || BR2_cortex_a72
> > Note that (BR2_cortex_a53 || BR2_cortex_a72) is not a subset of
> > BR2_aarch64; they can each be select when the target is BR2_arm,
> > BR2_armeb or BR2_aarch64_be.
[--SNIP--]
> I will thus change the dependency to the following:
> depends on BR2_aarch64
> depends on BR2_cortex_a53 || BR2_cortex_a72
> I think it looks easier to understand as two lines.

> When the dependency is not tricvial, I think it is good to introduce an
> intermediate symbol:

>    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
>        bool
>        default y
>        # All Xilinx SoCs using this package are aarch64 only
>        depends on BR2_aarch64
>        # only CPUs with corresponding firmwares:
>        depends on BR2_cortex_a53 || BR2_cortex_a72  # only CPUs with

> ... and then use that in the main symbol:

>    config BR2_TARGET_XILINX_EMBEDDEDSW
>        bool "xilinx-embeddedsw"
>        depends on BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS

I see your point, but don't you think adding another symbol is still
a bit overkill?  The dependencies are still only 3 lines and are rather
straight forward.

menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
        bool "xilinx-embeddedsw"
        depends on BR2_aarch64
        depends on BR2_cortex_a53 || BR2_cortex_a72
        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

I could add some comments, if you want, but I am not sure if we should create
another symbol just yet.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
