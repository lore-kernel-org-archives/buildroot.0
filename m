Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F22C5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 13:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D1683E8D;
	Thu,  5 Jun 2025 13:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf6xcmsB6w9r; Thu,  5 Jun 2025 13:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68CA983E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CA983E83;
	Thu,  5 Jun 2025 13:42:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6F941A6;
 Thu,  5 Jun 2025 13:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC08860A70;
 Thu,  5 Jun 2025 13:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9TgjNdmNlE5; Thu,  5 Jun 2025 13:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::605;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DD646076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DD646076C
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::605])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DD646076C;
 Thu,  5 Jun 2025 13:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2011DZNcwRQ5LuoarYg1HGivPy5taOfpSXWHx0s6+Nhgp59J43ahkTCA+88Bar3jJuzsKjHQVSs+Jt5cbXUpK+NjGeycRpQ0OC4aTWvjshdZ8hyrAX9Q+lJnTAUCwPCTEcUI7eR+X4K6BBy3HQ1ry+TYDAzjGP7IQLaakWN9EsV7G8U9hVn3F6HlqFczfaxjR9O/b1f+AuCILe/Frb6nkVuDByfpXi8UFF9ubTiqjaJBorxrgADCk36adS1hJ8gtbmRf2ejiPOgfEQjLN3bMEnOf10ILJ53F0nPmLmALe0gSYgkP1vSbi+fVkN8ZVZlLqDtQXwvUCyidd8AK8MYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6SuAYwIpdMoZKTGtjdos/KMgcdjioUgiwUmZ5foh2w=;
 b=maVFWwJLwxtWK6OmIPJucBggdJiqlfSh7ujZShJEGvxmqlE1llFtID74TvO3qHhNSsIcW72YC28biO+ar64MUNUkQ5qSViYtys2rtFPrySWme1AUvXcBl2kzLIxwBlCutN/RJIJ7/RCMQ3nFfmXf6OGIPyCwKhJ61UOa6ZURljzqZ+vuvqDOo8B9jX5ozL6ylUmy7pQ80bOypkrzrB636bj22hgkJ19wfMwf7+0yTfOmeXwj+Aimul4TQD9AZOfA9nrHrYRSNqsKFJEiXvhRHb5Ic3elLqMzpoSmedCLxDgWFjP/mbukReBxqwDGOfp0emJJBIbKVcgknw61HnMDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by BL1PR12MB5995.namprd12.prod.outlook.com (2603:10b6:208:39b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 13:42:20 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 13:42:20 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>, buildroot
 <buildroot-bounces@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.1
 support
Thread-Index: AQHb08VmpBFlaPra7ES4RLWKmPgdgLP0jHUAgAAKIpA=
Date: Thu, 5 Jun 2025 13:42:20 +0000
Message-ID: <SA1PR12MB56152530BE18C1C0B74AE338F06FA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
 <DAEMB4X6YG5B.1PCG33D01DPSS@collins.com>
In-Reply-To: <DAEMB4X6YG5B.1PCG33D01DPSS@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=662afc7b-c7c2-43be-916e-e0e54a4cafac;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-05T13:38:05Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|BL1PR12MB5995:EE_
x-ms-office365-filtering-correlation-id: f1b4c6fa-79c4-4377-b8ae-08dda436cb95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?dGRlMlU4bDBxa0JxMTJiOCtEbEYyNzM4dGFOY3dhUkhEb040WVB3UVBIbGVZ?=
 =?utf-8?B?VUh6TEZDSzFaaGUxR0tKWmdjMWFSRVp0YmYzZy9qWDIrQ0J3aGFlVHMvUU0w?=
 =?utf-8?B?SlMrZ1gycGpaTER0Mk5kZkZhNkNRTHlsYXUwK3lVdEswN3k3S0lKTnVwNFk0?=
 =?utf-8?B?SUVDOGRqc2dpeUtSeGhBS3Y2dVhQQVJqcUkrTmpoVDI5cmllV2xQeGZhYzUz?=
 =?utf-8?B?UVVsaTQ3SGV0RkNiWnIwME5XVkNjVkQxSStpWlpHeEtPa1o2ek5sUnFwcVJm?=
 =?utf-8?B?ZHd5eS9FdUExeERDcDhqbFJSNnpiMU9PNVU0UXBBUGpkY3Y5Qm8yT2drZGpj?=
 =?utf-8?B?cFBYeXRvQ045bmYwQlNXY3NtejVvcTBDN0Nvd09sZUptOVpCZ0o2YXk0WE9R?=
 =?utf-8?B?UVF0L0hEQ3RuSU5hSzBvNkF1UjZOYVBDVFJZMFVkbStOWFphd3VON0xpSmp0?=
 =?utf-8?B?UDR2NGR2WXhJbjJTbURCclhDNEJIZjlwSlE1ejhybTN2SDl4aEdhc3FGZGZM?=
 =?utf-8?B?ODJ2WlNaaktvem5tVWlmTC9ST3lyNVJ5dEZNbTljNHJRbHVaOG1peVNTZGd1?=
 =?utf-8?B?Y3daT1ZoaW9CeFlxbFhvRm0wS1RoemFZN25BQjJYZUdWWDhwbk5QeXRYWFdG?=
 =?utf-8?B?UjJjdXNwc0YxK0dCQy83RVRmZllRRVhUVzVCdjU4ZlhGQjJRbXRaTjFDM1dQ?=
 =?utf-8?B?S1dTOXlCckRZaFBDSlZxb3Z6dXE1N3ZicmptN3hHNFpabVZPWVZ2NWx1V3hx?=
 =?utf-8?B?dTVUdktHay9tL2lzL0d1OUE2VENFbUExUldqOVU1QmJaRW8xZGl3V2tER2Yr?=
 =?utf-8?B?YVR4T0UzT2YvOVllc2FIMEZtRitIUE1Kdk9nVWFjeVh1bThTdlBBLzBaSU9k?=
 =?utf-8?B?Y3BocExNWVpxcS9iU2wyQjlzbEJqakt2TDBKTHNYcFhWV2dMWU91b2lFUVZP?=
 =?utf-8?B?ZGhEdVRVWXpnSHlxZUMwLzRBMXllMFhtYlppZWl6bTNNdTJEcG50RGxqVGlU?=
 =?utf-8?B?YjJDeGthelB0ajhoRjh6S0E2a0hCV0pWcjh2SzkzK3N2ekViL2MrR0YvdEls?=
 =?utf-8?B?YW5RQlhrL2hLMFYvakw4RXpOdnFLL1NVS0wvdFBnRXZDR3Q5VXM5ZkFtSGtJ?=
 =?utf-8?B?Q3MvN3pVM0trc3dqVnlCZERTazFkWXN2NitKdytVbUJ1UWN4b1ZuVW1KVmxo?=
 =?utf-8?B?alJ3eC9hT2krYkdHSWpPU21BdlA5UkM4d1RHQmpRUWxVSHVSQWM4VUFDUXk1?=
 =?utf-8?B?ZExnYVFkZS9oMlpaSDNvUXRpalgvVTFqNklSajVueU95MW5pbDh6SEM2RWhi?=
 =?utf-8?B?M1NpYktKdVZkcENrS2svM3dwWDBNQUMzR3I3d3BNWkxNc2JyR3MycWdIQ3E2?=
 =?utf-8?B?dVArTjlFYVI1ODZzeHpUMEJJeG5mYnN2ejJpaUpQUjhvMysxRGJHY1c1cnBS?=
 =?utf-8?B?NGJJcGxDdlI3U3YrcFJwbERUcXdveW1HVVJDOFh1SkhNTitERjhsR3hWeVZK?=
 =?utf-8?B?QitYbXZ5NUdnME5mRzFrR0cwZGorUDQ5eXNrU2I4Y2VrRFJFUmg5ZTkyaTh2?=
 =?utf-8?B?MzdDTFBvQzJtWVdQNGJya05Jays5UWJkU0RZRTBFUVZyRXFzRlRiQXkwWTl6?=
 =?utf-8?B?MVNvT084YXdmTDhuYlY1U2M1Sm5rSzMxeGpDeW1DRXBzSm9vYjArdlg4b0xS?=
 =?utf-8?B?RXkyQUJSVXprR2tIbFgydE4yUkg3VUtTeDJPc3hiNVhFT0xycWJXTGRwd3BP?=
 =?utf-8?B?TmNvSjF3V3BhUzZ1QUVuWUs5RnM0OFczSGNPTzNQZFRGN3Bzby9CYi96QzFE?=
 =?utf-8?B?cjBHT1lMSkh5cHhiRWlLZnc5bTVjNWxIRDNWMUc2dWwwNmJDUE5jbjY5NmZp?=
 =?utf-8?B?ZDVJQkxzN1VmZ09CbHRZcEhvN0krUkdjZjZRUE5zN2ROMjl5QUt2RlNMR2w1?=
 =?utf-8?B?UU0vZDhjd3dLbGFvYnZoVXNYMjh1SE83L2lhcm9nWlpBTmx0T2dLMkl1Ylpp?=
 =?utf-8?B?Y2dPUlYySGt3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tk9hTzFtcWlteG1hNEIrc3piUVUySEE0ZVJoQmQvM212U3VuN1dETnRabFVT?=
 =?utf-8?B?OFo0SnFOM2RuNGFrSzZkajVhNW0vTmhtVFUyT1VDN2psbFdZOEN1ZFp6bkM5?=
 =?utf-8?B?aEQ2blJkd1UvY0lRWnQ1RHNNQjhJZnB0YllmdjJJTk9BVUlKYW03RlpKd09k?=
 =?utf-8?B?a3lKZVdpSGh3REJYVVNLZlpRWTBlMWNKVThhdmtGMDhVSjVUV1N3TmJ1ajZU?=
 =?utf-8?B?Y2NWcmkwN1FxSUJPMjl2TGxIRmIyOUdKU2FXNlBIWkhYb3g1OFF0aWtaMmxP?=
 =?utf-8?B?Z1hoVmg3blhjUkdwZkNINTd0a0RMZVFBd3UvTEZDYU1ycWJ2cHo3blM3ZTZQ?=
 =?utf-8?B?UUdVY0hwK0t5Z0pRNndFdy84M0hjcVJDRFZhQkswWXJGbm90bzg0R3I2enJR?=
 =?utf-8?B?citrRFlJL25HSjB6RmtRVVR3WGFPMGJuWVI4M09LKzZNeDZkTnY0dFNkckZs?=
 =?utf-8?B?aE54UlhkbTFnSnBYNWJMa0gzckVUR1ZxZTBCWTBVMExpMlRua3A3c2dYTUdp?=
 =?utf-8?B?Ui9YQ3dlMjJ5SXM1REZudVI1ZEpGTldMZWhuTGNxN0lDUjdmVW5sMkg0UFpI?=
 =?utf-8?B?TTBOVFV1OHc0dXRBQUhZRlFMSlMrb0tqL01DNGNmZjZUcFZKcmdoRGtBTXFw?=
 =?utf-8?B?RE9yQlVTdFM2V1VHbWtVZEExZ3BWQmFzSzZnRlN4UjZVWnZDRk43SUNoMFl4?=
 =?utf-8?B?VkRqSEFQekIydm1mV0dWMU9wbGVtQnFsTXBWU1ZWdXZSVXc4RUxDSW01Vm04?=
 =?utf-8?B?RjQrRVlaTDJOQUhVT2dtbTRFN2dXTTFiVVJHRDdLay9pL3lUTG4zc1R1VFAy?=
 =?utf-8?B?Ny9jTGd5OGRmaG5paTZoVEVUbmJ0UlRXUit1THNkbE5lZTJhY1lZb2tid0FI?=
 =?utf-8?B?OGY2alNsUHQwTm5ZRkVaZVlGNFoyZzdMVmppNVZFKzRySnEwQWhwZis3amRY?=
 =?utf-8?B?NWNPLzNla0hDanB5dUJBZnRZUWU0aTArbVZUQnhNbGFWY2cyVHR2NHFRWnZD?=
 =?utf-8?B?TFIyTlVYZXJQT0hwU3NzM3prWVdNeDY0cjB1V2NCZFJqRkVPRzFHSDJPQUNT?=
 =?utf-8?B?OUc4alhNTkZ6TXJmMDJWREdFeGJnVWQvRnErUkFzOG1GZUdPay9keVBIUVRa?=
 =?utf-8?B?eWxKdjRYK0UyYlZhbXRFeG1qNDlLS1N0SEovUjJKenVvRVozTW9CdS92dUJo?=
 =?utf-8?B?UlNPYjBLYVMxTUc3OXhqSi92NUY4WU0zQ1I0cGxVZ3MyeW04UWlIZDdxWXJ0?=
 =?utf-8?B?Y0pDTlBMTWFyd0xIc1QvVjI2MjNVOTV6cXkyeWtScmlOOTZ0SVB6UTFXT0VD?=
 =?utf-8?B?S1BVb0c0aVVEOC9HTGptemptbjIrb0M2dkZUTVk0bTFtNVdqcnNSQTg4cUtr?=
 =?utf-8?B?TjZUaFVUdVRGRlY2QXh6Sk1Jc0RMZjV0Y0cyUzl3bEdZUCsyaGZJTzBqZFNv?=
 =?utf-8?B?TUVaM21jNVpRS1lKdnozcHlKWTFXRzA1ZFNiZjFGV1NLSmZuRWRBWWV0bEhu?=
 =?utf-8?B?VGkrYWZCRUhvYUhyUzhuS1U4S0pNOTFGYjEyRWpocVR5bDR1YnYvS2NkTEVn?=
 =?utf-8?B?NzN3bUdOQlIrMzJaSWREbDRNSWRIZDBLRW0rT1dKbE8vUXJmTzF2WFMrSjBp?=
 =?utf-8?B?MFFuNENtbFhScEE5YWR3QkJqRnpGWnRCdWdkeHIvYUtMVHBPSjdSb3FnclJs?=
 =?utf-8?B?ZVdQQ1UyellFdXIvbjYzZUdrSUg0WUJkUml5OVY3ZlJHVDBDcThENGh3Szh4?=
 =?utf-8?B?Q2U5R29TYmtuODZlY1I4QU94SnNIU3FieXp4Zzlaa0lEclpRcEVNbmxNeFpO?=
 =?utf-8?B?NWFCL1FMY3lZTU51Z0dSNHBYTUdsUTlmTGdrRGZKRWxmYStGQ1dFdlVvN1Rl?=
 =?utf-8?B?dFY1b29PMDZOUFdtY1FDdDJOcEgwYXh3QXlrR2R4T3duMTFrUHU0TUN0RlRx?=
 =?utf-8?B?VDVPT0FVeGRjK1ZRdUt4dGErZmNCVFBvZ2xGaTVRK1JyQ3Q4Y2loSWlwNDRj?=
 =?utf-8?B?WnBMUldVVkxHYWJjNk1FazEwS2doSnNPRkFNYktHc3FndmVPcTJxazF1aVVL?=
 =?utf-8?B?TWdJN1NpZWdSbDJET1B0Zk1EbS9Bb3hCN2wzZmkxemdLQUhIeXVzU2ZuT1FE?=
 =?utf-8?Q?RhBY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b4c6fa-79c4-4377-b8ae-08dda436cb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 13:42:20.6969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AZOlNWXPm3w2JVj/5CKkejZSmQh0CUXpKu/gtdCbtjXrkUBgnqWXvEHj2OINOcG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5995
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6SuAYwIpdMoZKTGtjdos/KMgcdjioUgiwUmZ5foh2w=;
 b=Bcwm8TR/32lZr6uQ2zm8qzhh9MhpY1oUFFD0BNVcaLVGrqmPxWIYnJvt37bkPIoya9RBVwGsDPc6ERefC9/G+zhUt8NzaJRvLTnheLCA1l746ZPW6uT/eCIqBBxI7ML4V5raP07Di6UF32AD8/gvS1matQ6sUcAq4BOtj+yoFGM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Bcwm8TR/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.1
 support
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

> Add hashes for xilinx_v2025.1 release.
>
> xilinx_v2025.1 release includes:
>  - atf 2.12
>  - linux 6.12.10
>  - uboot 2025.01
>
> In addition, the xilinx_v2025.1 linux kernel release tag has a Kconfig leak
> of the CONFIG_XILINX_AIE option.  This patch adds a patch that is specific to
> the Xilinx Linux 6.12.10 release which fixes the problem by moving the changes
> implemented by the CONFIG_XILINX_AIE option from the exposed uapi header file
> to the Linux internal header file.
>
> The patch has been added to the board/xilinx/linux_6.12/patches directory, so
> that it will only be applied when a user specifies they wish to build the
> xilinx_v2025.1 release or they use a defconfig that has migrated to this
> release.
>
> Since the header file that causes the issue is not yet mainline, this patch
> has been "upstreamed" to the Xilinx linux-xlnx repo via the AMD internal jira
> process.
>
> Upstream: internal AMD jira process
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I built the zcu106 using the AIE patch to verify it fixes the linux
> headers issue. Thank you Neal!

> Tested-by: Brandon Maier <brandon.maier@collins.com>

Hi Brandon,

Thank you for reviewing this patch set!

My patch was committed to our internal repo with the commit link below:
https://gitenterprise.xilinx.com/Linux/linux-xlnx/commit/9691533f6e6fd0a596ac7688e82eeea53f22c434

For now, you will need to trust me that this is the case since it is not yet
published on our public GitHub.

In any case, when I bump the defconfigs to Linux 6.12.30 or Linux 6.12.40, I
will be able to remove the patch from Buildroot since it is already applied
"upstream".

Best regards,
Neal Frager
AMD

> ---
>  ...ux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch | 126 ++++++++++++++++++
>  .../arm-trusted-firmware.hash                 |   1 +
>  board/xilinx/patches/linux/linux.hash         |   1 +
>  board/xilinx/patches/uboot/uboot.hash         |   1 +
>  4 files changed, 129 insertions(+)
>  create mode 100644 board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
>
> diff --git a/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch b/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
> new file mode 100644
> index 0000000000..59974410bc
> --- /dev/null
> +++ b/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
> @@ -0,0 +1,126 @@
> +From 333678d7b9edc29e8148411d48f70950b1b614c1 Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Mon, 2 Jun 2025 11:07:03 +0100
> +Subject: [PATCH 1/1] include/uapi/linux/xlnx-ai-engine.h: fix
> + CONFIG_XILINX_AIE leak
> +
> +Linux Kconfig options should not be exposed to user space.  This patch fixes
> +a Linux kernel leak of the CONFIG_XILINX_AIE option by moving the changes
> +implemented by the CONFIG_XILINX_AIE from the uapi header file to the local
> +Linux kernel header file.
> +
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +---
> + include/linux/xlnx-ai-engine.h      | 37 +++++++++++++++++++++++++
> + include/uapi/linux/xlnx-ai-engine.h | 42 -----------------------------
> + 2 files changed, 37 insertions(+), 42 deletions(-)
> +
> +diff --git a/include/linux/xlnx-ai-engine.h b/include/linux/xlnx-ai-engine.h
> +index 44a1e40ef9b8..10905dc84ae9 100644
> +--- a/include/linux/xlnx-ai-engine.h
> ++++ b/include/linux/xlnx-ai-engine.h
> +@@ -171,6 +171,13 @@ static inline u32 aie_get_error_category(struct aie_error *err)
> +     return err->category;
> + }
> +
> ++int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
> ++int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
> ++bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
> ++int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
> ++int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
> ++int aie_load_cert(struct device *dev, unsigned char *elf_addr);
> ++
> + #else
> + static inline bool aie_partition_is_available(struct aie_partition_req *req)
> + {
> +@@ -271,5 +278,35 @@ static inline int aie_part_rscmgr_set_static_range(struct device *dev,
> +     return -EINVAL;
> + }
> +
> ++int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
> ++{
> ++    return -EINVAL;
> ++}
> ++
> ++int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
> ++{
> ++    return -EINVAL;
> ++}
> ++
> ++bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
> ++{
> ++    return false;
> ++}
> ++
> ++int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
> ++{
> ++    return 0;
> ++}
> ++
> ++int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
> ++{
> ++    return -EINVAL;
> ++}
> ++
> ++int aie_load_cert(struct device *dev, unsigned char *elf_addr)
> ++{
> ++    return -EINVAL;
> ++}
> ++
> + #endif /* CONFIG_XILINX_AIE */
> + #endif
> +diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
> +index 424c5f4c4097..1680aed8ad85 100644
> +--- a/include/uapi/linux/xlnx-ai-engine.h
> ++++ b/include/uapi/linux/xlnx-ai-engine.h
> +@@ -781,47 +781,5 @@ struct aie_rsc_user_stat_array {
> +  */
> + #define AIE_UPDATE_SHIMDMA_DMABUF_BD_ADDR_IOCTL     _IOW(AIE_IOCTL_BASE, 0x1e, \
> +                                             struct aie_dmabuf_bd_args)
> +-#if IS_ENABLED(CONFIG_XILINX_AIE)
> +-
> +-int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
> +-int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
> +-bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
> +-int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
> +-int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
> +-int aie_load_cert(struct device *dev, unsigned char *elf_addr);
> +-
> +-#else /* IS_ENABLED(CONFIG_XILINX_AIE) */
> +-
> +-int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
> +-{
> +-    return -EINVAL;
> +-}
> +-
> +-int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
> +-{
> +-    return -EINVAL;
> +-}
> +-
> +-bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
> +-{
> +-    return false;
> +-}
> +-
> +-int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
> +-{
> +-    return 0;
> +-}
> +-
> +-int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
> +-{
> +-    return -EINVAL;
> +-}
> +-
> +-int aie_load_cert(struct device *dev, unsigned char *elf_addr)
> +-{
> +-    return -EINVAL;
> +-}
> +-
> +-#endif /* IS_ENABLED(CONFIG_XILINX_AIE) */
> +
> + #endif
> +--
> +2.25.1
> +
> diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> index 15cceebb80..2ef3825bb9 100644
> --- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
> +sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
> diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> index a970a878c2..0022390aa6 100644
> --- a/board/xilinx/patches/linux/linux.hash
> +++ b/board/xilinx/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
> +sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
> diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
> index de0e6adad1..56ee166378 100644
> --- a/board/xilinx/patches/uboot/uboot.hash
> +++ b/board/xilinx/patches/uboot/uboot.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
> +sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
