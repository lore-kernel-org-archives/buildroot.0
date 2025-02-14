Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C95C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 08:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D40B832B0;
	Fri, 14 Feb 2025 08:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEFSXbfmwRlA; Fri, 14 Feb 2025 08:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B65FF83148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65FF83148;
	Fri, 14 Feb 2025 08:25:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7FA11C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1D2D6F6B1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZnW4jgOGb5x for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 08:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62b;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1D5E6F7F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D5E6F7F8
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1D5E6F7F8
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9k1S5BxthRF3d4HXy2O6JA6VGnISgFk+KW10qF1fhFVEAKVvuEXME3XJ1WP0gTHgRTkjfHdBNk5RD2d9Bp+fESIE0iN2K/bh7Vd8n91YdGHQw8YC5PJY32pi4LH1SS34KSBLR8yTdu0KgWUJuMlyosUCJuk82xUBy7gILmF4Nqr8rTuzUVjfw9CxkPS49XFoJVtcwitcJAaXVTr596/fge6pS745u22ULyvi4vm2mHapq4ORGhZxLQISYe2zRKDvHkd4s6bc+eN90KgOhGmRJaYwZkkPCtsMQokOaO2lAFL+7FFMqdkL2zDI4O8Q1kfX8D52dpOTR3KxeEftQueOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vMixjhbEBo7OvrDyntLMDquNbHNkaghBFVQUGFcjBc=;
 b=b0ZdoR6NdP48PSLYk50cN8SCHPvYRNdNurx9uHf2wH6LGPbSsGb8GBeJamE2h7Op2/2kOdA9tsZYEce1dwgdmQFhdL6JQfFVUZkgLd5zS8728RzEktGnzVnnhegzZWu9+Pkoo0b2FGoeSmVJ4vPLiehGAA0ZxsojjlueDAtj0XD83Uq9tQ3qQwEbrcz1dQ70GV6dQrOvPtZiyHpAPtHjzyFrsN5Tedl98N/Xhl0MCVPPm8LCdiaADr71QnGEVQybzkd3LbIgp6Ql7QKZxugJeBEfsCnC9pKCT3zjloli97k2Zd6U89tmWtjkpsZU4noTfiKvKXiasxdIFrMhFBFwuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 08:25:27 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 08:25:27 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: Example of running a host-autotools-package several times with
 different configs
Thread-Index: Adt+tqXxjQdaN+RgSxS5d4rmTSozLwAAkGEAAAAk6mA=
Date: Fri, 14 Feb 2025 08:25:26 +0000
Message-ID: <SA1PR12MB5615EF0BB95C7BE3F02229E5F0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <SA1PR12MB561545FCE581A3061A9C6BFBF0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <c102f1f0-9737-415e-9f51-8e98888a37dd@mind.be>
In-Reply-To: <c102f1f0-9737-415e-9f51-8e98888a37dd@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS7PR12MB6286:EE_
x-ms-office365-filtering-correlation-id: 05bfc6f2-0fd4-4095-4b26-08dd4cd122a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U2ZBM0lGT3pkS1plcHlnSG5JRFU5bEc2c01KYjROTWEwa1ZFSFlZQzFnME5Y?=
 =?utf-8?B?K3Vob0x4b1RPK05jUEorUFRMNmZLNDhTV0xNcUMzY1NtQm9KekMyOWd4ek9W?=
 =?utf-8?B?dDNQRWRqVS93akdMWXptYXIyK0dINWpRMzVJSkh5ZmtEWGtjdUlrMGplTWpQ?=
 =?utf-8?B?NmU3bGlYUHpVMWZDQ3Fxd3Q0b2RpN0pXNGJxRmljRE1zRGF6N2tCbk05SWRY?=
 =?utf-8?B?Y2phTVd6cStmOEc0NVRnUUxFc0VEWmx6WW0rc0Z6eTB4S3R3cHIwR0FSS1BU?=
 =?utf-8?B?ZmdEZnN3aE8zNGJ1Q0ltWmUzZlZyTHUwL295b3FrL2wzR2NUMmFOQ0w1YTZm?=
 =?utf-8?B?Vk1lbEs2OTF3VjBzRk1udmxOcE8zZFhXb092QmQ0SjVmM0NJcmhYeDVmdTVF?=
 =?utf-8?B?c2ppVHBPaFpUS3hESjk3bkhFQmI3eDhjZEdCejc2VlZvMTROSUJWOGE4Y29a?=
 =?utf-8?B?cGJFVUFyTGxaaVFCejZWck5TcGsvays1ZE1ja1NSVzZpVG1hSW1LcXhlNjFx?=
 =?utf-8?B?NUtDaDc4bEcrOE1mUkhJR0pPS3MwVUU3QnZQeVlxR1VXM2QwT05UYWVXSXJp?=
 =?utf-8?B?TG9DaVEwTWliTHdFU0hieHYxZlpURXlDK29BWmNPeEcrNmM5UGVOSEo1cDdy?=
 =?utf-8?B?MENoOG1HYmd6Nm1WNk1yZVduVks5WnBubmRXeWxvWUhJaVVib0h6S3FRc2d6?=
 =?utf-8?B?SlJsR0JPTGlrelJhZHMyUnM1MkxTQzRhUVR3b0M5eXhFWnZ4Ykc5aHdKVmVH?=
 =?utf-8?B?SWI1UThoQnRlL2w5OE9qeDNHdG5JRTNNQWxaU216Zm9Ua2lRbHpaVjMveGQx?=
 =?utf-8?B?dFlVdTk5WmNkc1p0V1BsVnl4T0YzL3V2OXU3VU5YR05nVWZ5Q1BwQjVaaE1P?=
 =?utf-8?B?QVZGOUJpMkNIRnNsV2NNTXIwSTdEOVVTWDRtOWp5RGhZVUFiLzViVS9kYktj?=
 =?utf-8?B?RmhXdGxtdlRXbEVXVVcxUGh3RnJkOUtORmd1UTUvN29yci95ZVlRc3ptbURh?=
 =?utf-8?B?VmJ2azA2bnYzbXRQVnoyQkJKdVpUL3JTT3BIaFEzMSt6b3VLdEFuVnNBcTJo?=
 =?utf-8?B?RUhLeFI1VTVjQndpb2dpcjdGc2hJKzVpUWRyYVdQa0RtRTRvK2NmVWN1NU1v?=
 =?utf-8?B?VEl6Q0FhYjlYNUxDa1BtdW42MFVQZzBZanFlendiSE0zWHlGRHg1a3U1a0JT?=
 =?utf-8?B?V0lLM2NBWnh2NnBDeUVLeGlCT0ZpSzR4MkpxZmxqcHNsWFFlRVdIWklTQm5Y?=
 =?utf-8?B?R2Rva2JmOG9JNlRIVUhwc2lzRjRDekJmZ0xndUVFN2lvcGxndGdjczNmbkdE?=
 =?utf-8?B?c3VRMHdUUjNyckw4MkVLd0dPMFd2OHRYajIvbmlEQVl5dWZpMHU1Z0YyRGVU?=
 =?utf-8?B?YzdpQlFoZVRZb2F6bm5HUHlTU0V2UTV4cWV4d001WTd0dDN6bkx1K3ZVMm40?=
 =?utf-8?B?SVF5bmdxQnFZY1dyRVhmb3RGTjNUQ1JZVnpwVXJCR3d2WTFuNnZRdWVONGpZ?=
 =?utf-8?B?Q0RwYWc3ZDg3eUZmdHpkR2wyaW9sOGlQamVMa3BjbXpFeUhHcmFuU0c1cm9U?=
 =?utf-8?B?Z3BtU1FuQUdILzN6VEg3QXI4UmYxU3g0SkxObS9xMmNCWlRhVTYvbklOdmFD?=
 =?utf-8?B?QVVWS1pOcVRiSGZoa0dZZ2owM09KTXBZTEVNSU9RN2ZVdEV6NlFnYTRDWjRh?=
 =?utf-8?B?TXlhK3hzcVJZd1AzM2d0N0I3UHVadmtmRG9aMGJ4V0dIdTVNcW1xendhY1Rs?=
 =?utf-8?B?QWN0ZVJpbmJnVXNReTJRdUU3aDhvcnVjdjM3QncxY1EwWkRRSmM1ay9rL3BO?=
 =?utf-8?B?V3F6RERiWitRWTVVUU8yMEwvQWNMdjczeVQwN0RsN21YaUlnaXMreFJROXFP?=
 =?utf-8?B?VVpoMEY0MmpTTi80ZFYvdlV3VGZMRnZyUmZIdEg4VUF1SXR4cGdVL1dmS0hq?=
 =?utf-8?Q?+RrTAy46ZVvMgWWwKG/iJxcWssHdQr2U?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azFWWmYzdUZpMUV1OEx3VnE4L2NhRXAvZXRCQ0FvdnVJNzFFelp1bXN2TmNh?=
 =?utf-8?B?ZExqaHZIcFlGOFJ2eDhUUXAxdzZDWCtFQTBXOWFNKzltQXJnelFERFRpcDAw?=
 =?utf-8?B?dWFTc0FoaTNramxtN3RCNThrSUx5QWUyWVZEejJDYnFjMnQrNUx0emQwdUp0?=
 =?utf-8?B?ZWdhdjdad2lNdDA3ci9ud21CVFNhcW84UERhUnBPSlZkbENiUHF5YTJOY2NS?=
 =?utf-8?B?SExPcEpvUU5UaW5FMStKYUNIS3F6cXZHQVpkaU5GTjYzNXhtWDVMYVdwcEpv?=
 =?utf-8?B?d0tSRVIrQ1M4VUJta2dFQTRHVjV6bWNFdjVMNm5zUUh2QUFnUkJXblpBdlZD?=
 =?utf-8?B?aUhaZTVTSXFKbUxjZG1kTkM2R2RSa1pnNlZrdlczbUo2NE5ldG1RaStINC81?=
 =?utf-8?B?TGFEaG1iQ2VPQlQrK0hpdm9hWUErbFRxOTVOeHh5bnpCellHMW4rNStLR0x4?=
 =?utf-8?B?YXNOYWhQMFpobkFFdGp2VmY2WnV6ZThzT0xsR0c0WFl6bUZ4bmI0UEN2K0k4?=
 =?utf-8?B?cXJDNWtOdHd3cWltRzlKVXJDT0pQdXEveHpUR0s0bUNoMWFuRVRyalpRWWRn?=
 =?utf-8?B?ZHQrWkozRno4Q0hnYVVBbkV1OHQyZUp4eEtaMERQZE93eTVCMHh0TDJKd3Vh?=
 =?utf-8?B?c0xGQzBid3NoMS9DY3NNeG5OV01DaHczNno5L2FqNUs1QXBZeExjcC9GY3Zp?=
 =?utf-8?B?c0VuYkxoWC91eitJeC9GTDJ3MUxFL0RYMzgzN2VzU1lLZVpHa2NoQmVaOTNv?=
 =?utf-8?B?SHZ1ZjVZeVVzdG51K3VpU2J3YWQ2QUNkSjJxaXNxQnZNdlN4QjNNWDVLWWpN?=
 =?utf-8?B?UngxRU8rdmpSV0RVdnMxRE5tYVUzT28xRHFQVGtCNFlCRkhhRytackNkNG5I?=
 =?utf-8?B?cW5zUFF2WnB1WnJ2cWM1bkpUbFVta1FpYTBDRFV2U0JKRGpYY1I0TjdpeW8r?=
 =?utf-8?B?NFJqdlRIOW93SGRSbGZIRmNUZWxwMnZnN3VrOCtzZ3pZSCt2Umd0OHdncXpi?=
 =?utf-8?B?UkZQckl2eEJmZTM5OWU5cW9ZZkIxYThlTVEwSW9NbUFMdDd2R0Z2SUlmTlh5?=
 =?utf-8?B?b3pOb05pcXFyRGIzVTBGSEUrcnhZditMNlgzTVh2aVBWbXMxU0pYRkdvaVJQ?=
 =?utf-8?B?NTh0bkVDTjh0b0ZKa1M1RWY0NzdkaDN3dThoQmVNaEVFN21lYURSb1c1QUZp?=
 =?utf-8?B?b0hLRGVoZFZLT2ZVK0hzUHkxQlNndzkxK2UyTHUxQ1pVR3dldXpmQ1RsUzF5?=
 =?utf-8?B?U25sOUxvUE1XNUlFbitXb2Z1cDdKTXVZT1BxMXYzVmpwMlFOL0xURkplcmRk?=
 =?utf-8?B?RDBRYUkyTmtZVUlGTDdsdkQ3NHZrSFA4MnAzck1tOXlicGhCZkxmancwVGtk?=
 =?utf-8?B?c3FBMmdnZUdsVmFyMGRDMzh3Vlh0cDZsZEg5RmMxMm11RUJhMlZ6VjMzVktL?=
 =?utf-8?B?T1VnWHpSdHBDOTk4aDlwZ3ZWM1h2bGN3cUtRa25xRzhzcUR6bW9ZK1hRRkFk?=
 =?utf-8?B?b29kQklDOUZ6MTlmUUhpZ2pVNVUzQmwrdzMrMEFvTkxOd1NsOUJTR0dBRkdF?=
 =?utf-8?B?anZSVjBDdHo0ZWx1UnVmY3ZVQ3NIa3U2aFR1QWUrRXdreG1zcmh3WDYrSHM4?=
 =?utf-8?B?Zzg0U0JLRE5adUdXUVVyYzJrdEVBaUtJUTMwOWM1TW1DN1dQNWhBeDZHUGhM?=
 =?utf-8?B?T0ZtU09aZk9VKy9QV2RiZVZab2xqdmxUOXZiQ2E4MXhOOVViSWtiOGpReDZw?=
 =?utf-8?B?Z0pBSVpxRWE2NzR0N0hCZWNCT0F0MmZhYzNYR0o3ZzVwcUt2aXpNaHZTeWtJ?=
 =?utf-8?B?cjFWNitpQVBHbDlHUDllRHBtakh4TzRjNVZVeVNqam5DTk02bVBBTTJvK0Fy?=
 =?utf-8?B?ZWIwN2g1K3RiRHJpUFV0K3dGbDdxU2tzVSs2eDdJMGZYdDZ5Y2NmV3ZvWUJk?=
 =?utf-8?B?L0tuVGxPU2Q1ZmpZbFBxRTBLemhuWGFISk43bFdUT3RCUkcxaXdaVE53Z0pa?=
 =?utf-8?B?TURmV3FyZWpaUlBQOUpLRVdGQnM3eUNIUkRBb21RTmtPbU5TNnh6M3pDVTdm?=
 =?utf-8?B?U2VoRGVDemltUlZlc2VPSGdqaVZHVkp5UHdXMTNtbXVRdS9SWGhEa3J1R2wy?=
 =?utf-8?Q?46F0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bfc6f2-0fd4-4095-4b26-08dd4cd122a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 08:25:26.9310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PpNID2ksTVUchT91cO6uVNkgLo8eTrOqqXBaiXe8oN64Po9FzKN+KMnlJBWJKWMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vMixjhbEBo7OvrDyntLMDquNbHNkaghBFVQUGFcjBc=;
 b=b6kbErZTXP0ddVjvR3jtp5Cct8hSpBgQliGfequ8k4FoBDYSR4wv82Hvyuye1ZIqCQaOSNQt3cFPRB19Pue8NTGF6ttQ1+/AZLiqRcly408O1Qn9Cp05PRUHlBdRlfCkkYAFLERVrJzPUtI0tw6lo6Iagv+mRWwMIlabqGVhREw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b6kbErZT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] Example of running a host-autotools-package several
 times with different configs
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

Hi Arnout,

> Hello everyone,
> 
> I am looking into expanding the toolchain-bare-metal-buildroot package to
> define multiple bare-metal architectures in a list and build several
> bare-metal toolchains with the single set of packages.
> 
> Since binutils and gcc are host-autotools packages, I am wondering if
> we have any examples for a single host-autotools package being used
> several times with different configure options.  Is there already another
> package which does this?

>  No, there isn't, and the Buildroot infra is actively hostile against such a 
> concept due to the splitting of configure, build and install steps.

>  You would have to define custom commands for each step and then run them in a 
> loop with a different output directory. I.e. something like

>	mkdir ${$(PKG)_BUILD_DIR)/build-$(arch)
>         cd ${$(PKG)_BUILD_DIR)/build-$(arch)
>	$($(PKG)_SRC_DIR)/configure --etc

Thank you for the rapid feedback!

Regarding the custom commands, I see how I could do this with using
host-generic packages because I can define my own configure, build and
install commands.  Is it possible to re-define binutils-bare-metal and
gcc-bare-metal as host-generic packages instead of host-autotools?

With host-autotools, it is not clear to me how I can implement my own
commands since the commands come from the infrastructure itself.

>  Regards,
>  Arnout

> 
> Thanks for any help!
> 

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
