Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CAFC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 14:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61F5C409A2;
	Mon, 12 Aug 2024 14:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUHxWorCld-3; Mon, 12 Aug 2024 14:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F944093B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F944093B;
	Mon, 12 Aug 2024 14:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEEE1BF20D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 14:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CF4681275
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 14:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0sVRBttXtai for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 14:43:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60f;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87AD981271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87AD981271
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87AD981271
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 14:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUGZ/6Pf7/20bJ+0kyv98VlsVnAAQkUYSFFQtIgkHYxGa5Mq1FAXEaadv9/LBMMLvhjZslAwLrmK9vraJrUrTS/ZS6l85umOJpLoDwqKvEV0BmSNOBjCoeDK8omkn0SM8KUO+hLbShXTq5ShKD+FfbtXFpzaG1KSXPODQICz6SECBdX3hZuGDFKjju3ul/1Ch94GOCwHi0VfPe51RkkjAbWd+5xCrgm4McPHTtS5e91Hot11RsSNeVyVuSH7XpAFRrTHvQTFruDhuHQk9pbNYq1qwtoJrq+CqeOyoiXSgmidsaYz0eVlE6GYZx5WbKwcWD2XUtftNOEoNhdCmowQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBbhqWx+ObNqf/uqKwn1sLEWhEFK67wAf0h3ttCadHY=;
 b=GiAeMGnbK36m2RIBtTEBtUCgCwx9h+gNK+Z2yUey2Acdf6p41PaLHtyd1rZ4u5OtIRTyftWEmVdNtfU0gu0hn+urTjObGFRP4v7eaezKAu3UqnUV+Et99pigMFzEjMatFMHfkgo4lU256H7qf8rmgXF7JsBflSpwJMHVFrsA5Cre/Fyp0aLxHVINSj3TkkLx49BTssRAypa3UCo6FBY59A7wAUB3QffdeFE48sC58PG6rQMITEsU59KW+5IpOGsE/i0A+q59IMlck69mozbFjrTJX3AA9WhdzTbOwmFnAXyNITyidNijkNfRPLcmFAnhqOQN6Zm+xS7Ozz1BrzQUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 14:42:59 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 14:42:59 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] boot/uboot: fix dependency on xilinx-prebuilt
Thread-Index: AQHa6nl1/a0gc6z2W0e0vz3LmRz2QLIgECCggAOKTwCAABqwsA==
Date: Mon, 12 Aug 2024 14:42:59 +0000
Message-ID: <CH2PR12MB50040B19EF3BBE446C6C7FBBF0852@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
 <CH2PR12MB5004250FF91D0CADB98CF309F0BB2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <D3DYARJL5VND.19ERKZ05BBC98@collins.com>
In-Reply-To: <D3DYARJL5VND.19ERKZ05BBC98@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6983:EE_
x-ms-office365-filtering-correlation-id: 6e6821e9-d5b2-4d7e-58de-08dcbadd0f9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Sm93dytjUEhSdGtLSGNmT0N2SkVZVWpWOWpCRTg2bWJ0WEc5azFvR1dsY00z?=
 =?utf-8?B?U2hSb3REY1RZbm1RSzU3VkRGVXd5R2NaZmhrSU10Y0w1M3I5WWhoVXFDejRh?=
 =?utf-8?B?ZzhlTzRxbzl6Y08yWmlGSzlTd1RmQXl0RDhOcHpJTmU0dStkTUdqemxSajY5?=
 =?utf-8?B?WGRBUXNKMmFxNW9UOERSVnJ1VUpSZGo2VklUb2YraCszc2cxdTMwSDhJVDJR?=
 =?utf-8?B?ZjFoUkZwOWluaDV5Z3FnOFVhaHJJRXU0UnRxSnVpby9MQ3hkQnhIUDM5eTlI?=
 =?utf-8?B?OWQveExiTVFBS2V4eUI0WWM0aTRTNTBHVTF4K2VIcENjdkZ6K1BWTUE2Z0h3?=
 =?utf-8?B?QnQxWkdLRlo5SkFBSDRWUFF0VS93Q1JMUkowQmJ1UC9EdmovaEtvL1RTYVJq?=
 =?utf-8?B?cTdLay90UzV1aDJDZGwwVm05MDFJbnJWVGdQWjNKZlFNcTNKMWhFWE5nKy9S?=
 =?utf-8?B?a2M2MXNSUWJ0N2NuYXQ3NnFFM3N6RnQrUUtJb1lRcG4waWlaekJoSkR4VGww?=
 =?utf-8?B?U3VEdEVXVUllb0piUHVQOUxjQjVuQnJTMXNHaS9JQ3hSUStyTVhlK0t3OEd3?=
 =?utf-8?B?Wm5PdzdPc2RTYTdjSVd0aXRMcnAxTS9xRHE3L2ZYaklDcHJ3THZsTXdyL0Nx?=
 =?utf-8?B?VzBuVDBTUHpDMWtxMDlqVitGRFEwd0lTTDE2NkxqTDJrMVRNODhkQmxpZHhT?=
 =?utf-8?B?bEVseDhmMXVzb0RuNEdUUUVrdzBDMUU4TXBLME5uVE1FcmlhSzhlNE02UTY5?=
 =?utf-8?B?MmRiTThRcGxQcWdvdjdkdFNMSVFVSmxYQStrMTE1Ylc0bTVYUGFBaDB2Tkh2?=
 =?utf-8?B?OWx1ZE1MajZLNENQTGk4ZzFRaDdKU0J5VExodXBoVGZOcVJ3ekdNZmQwMXZm?=
 =?utf-8?B?R3BmV0xENzVJaEtxdnovRkk3N2VvZktoOVFIeWo4b0daQlhWZmNSaEEvUHUr?=
 =?utf-8?B?MEUweEFMaHVPak5BNVpCUU4rZmJBUGQ1enpuajhQalIzV0w2Z1FEdkh3YXZV?=
 =?utf-8?B?UXA0RVgzczZ4TmlSNk5rRjVtc05iMlBPTnVIelllc3lXUk9DQ2E5OFR6R1FK?=
 =?utf-8?B?T2g0UHZlSUZaa3Q4eWYrRzNBZ3gxOTRYMHV1eC9aR2diWWFLY242QUJYNENC?=
 =?utf-8?B?Ym5BWnl3VyszTFFzRDFkdUZFbkNrY1VkUXNzRDBISmdDcjV3akhuSFUzdWtS?=
 =?utf-8?B?SitHV1F5THJxUGlrL0xlL2VmR2w2UEJ2aG0rcm5FVWZ2Q0hKbmFOWHZTT2ZE?=
 =?utf-8?B?V0h0N2pZcXQ5MlplemRqdVMwZElaQ2NoOFlUcW1tMVdaVThINzZRdVFPeTJt?=
 =?utf-8?B?T1Vod05KZnF2bi9aN05remt3NHBhL29nRFllSUhlaWlIRzg5T0RXNHJhU0Vr?=
 =?utf-8?B?Yi9SV1ViR2Q2WTZKZGFQMll5YmwrRGxjZGNoejVFZGxlUXZQZG1EMG1UdWlJ?=
 =?utf-8?B?dWxzSWNlam5hcy90QlY0L0t0OUdkU3JvNU9TUGhFdjRzZ3FDdjdVcG93cFJr?=
 =?utf-8?B?OU94VVJKMVZheWtIVGpIMVhkNjQwSU85cWV1OUhIVDNuY1U4VUdwUTd2aE5C?=
 =?utf-8?B?Y0JUS1k1L2ZkcldnNlN5ZURrQU96ODl4M2F1VlkwU1VyVzN1THhsTFRJVDMr?=
 =?utf-8?B?aGlXSXZQWmN4QTZtR25DOUdGOFlyamVyQjQyazFMajFWeVVjcjJpZ3h1Q0U3?=
 =?utf-8?B?U0w5QUkxNktkN2hRdExWVU40TElzU2x3VHk4ZDNJbWxxeTJyTVV4TXZZN3pC?=
 =?utf-8?B?UFZKZjhGc1BCSThNQ1pUTWRhU3hjM3llSHU5SVpZNlJBdGNrUXhvNU4ycUhY?=
 =?utf-8?B?aEZkTTZIcTR2MGlERkYwUDlDWVVJODNPck1IYmRCb0p4dWdhcSt0ZEJVZzVD?=
 =?utf-8?B?UVVCM1lweCtZKzJudlZFdXZwUldPbEM0bmJVWnVSUVNESUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXJGdzZhNEhPbzI5ZTkzdWE2OG9CbzRicUVlUFhuQWs5THcxZCtDcUFjVmJU?=
 =?utf-8?B?ekZSMXZCdlBoWkZWb01xZXJIb1pWdEVoVGxQYmFHRG1BOEFHMTBwUW1CWGIy?=
 =?utf-8?B?ZkRTcDlJM3AybWlVQ0EzMFZ2SHM0TXVyMWZDajhEK2lHVDkzTzA2VWd5dURv?=
 =?utf-8?B?RWQrQStEekhyNFlCWWdCWTRPdjBOZ2xmbDZxVDF1MDdnNksvZmdySmJKbEZB?=
 =?utf-8?B?d0JXSDFMYnp5cEorVDJUWUNCeVAyYkpNRkhkd09XSWJWK29SMWFzcDMrY3Bk?=
 =?utf-8?B?dHQzTlVQMS9BQjNQVGNIRnQ1NnFKSGxiOXIzS2lXM1lmZGw2YXQ4ZXF6eWxu?=
 =?utf-8?B?RmlhWWp0aUwwUEUyc3VpejhIVmhoYldSU2ZnRmxscmo1S2tsUDd5cFBMYTBw?=
 =?utf-8?B?M0x0ZXBxQ00wTTRhVnYvU21PYm83YTdZVFVkMW1aYW55UEJFYU5rVmxJOTIy?=
 =?utf-8?B?bU43SnphdDZvTDRzeThadFk5ZFVMVkx0RkhTRWhRNklwTjIrck1OMWw0K05B?=
 =?utf-8?B?d29iQVhDUUR6T1dMckRqTGNmRWF1NU9DSjYzaFVrcms3ZWdsV3RsaXh1SSto?=
 =?utf-8?B?dHplUkhycUNvRm5pZzh4M3NVRlB6Rlo4VTM1aUh3TnFnSWQrWkpBSUoxb01Z?=
 =?utf-8?B?aCtCdTI3SjhHWVRrZkNONmpHUkk0NmFaQTgwNXlCV2poWXpnLzYxSE5iSHlD?=
 =?utf-8?B?RnFMaFpIRloyWjFPTmpqS3dPOGdQWWNEd1dNNGFhL1FEZjdqNGtTN1pOL1Nt?=
 =?utf-8?B?Mm1JaEh1N0hDNU5wUGtZam15ZDR3ekFLckEvR0R0WU9aSnNwVmV5UlFTcnBJ?=
 =?utf-8?B?d0FkajlVazJaekZUcTczTVBtVEdaa0creVZ0TnQwUzRtVjNKRXpscVFoVXYx?=
 =?utf-8?B?NmlMbTBnMVVhRW05Y0IwNkxpcE9WOXA2U2JSWm1sUnVsekhrV3JkQ3ZaY1B0?=
 =?utf-8?B?QXpiUFFXTXFxMXkwWVR2RURrSVFSV1F6empEYzF2TXM0ZC9hUERKYWFlalk1?=
 =?utf-8?B?V2lseTZNNzJId2lWek0wSlROQndaVjR3RTcvMXBEa0MxanFZRzg0cTNlRmxx?=
 =?utf-8?B?b0c2eS9iNVdDSFdRRUpPOFMvc29haHFFSDNKeERZeENESXppd1FGbDJYTk1v?=
 =?utf-8?B?T3dPbmdCRXZCR3Z1R1U3Q0ZTQVNuYU00akZJL3llU3MyL0ROZFhSWVErOUxH?=
 =?utf-8?B?bTE3NGZ3eDRTNlJ6V2ZFVDBKdjBWcnFRL1g2eTY2R3M0eUhSNTd0bmhrY2h2?=
 =?utf-8?B?Vm5lZ1hyRE5FNGV6cVR1S05CZSt1WE1DcElJa0wrYlZHd3pXVDFlZEVtSEhI?=
 =?utf-8?B?U2MxdzZDd0FRcGtCaTljVXl4b29TVUNiOVFCZ0krK1loTlJYNW84cExPQ1NN?=
 =?utf-8?B?TXU2SmFlckNiQk5iN216NGlzNlBZREFncUFPTSsyeUpVRWJ0cDN4QU5FYmpR?=
 =?utf-8?B?Ly8wd1g3alRVdzdsZEorV3o1ZDNDZDBoa201bmZwaWhxd1pFcm1FOHgrY2pS?=
 =?utf-8?B?RzNjem1oek5PblZ5dnljRGVsRGtZU2ZLaU5oNCt4SWgvQ0xPeGRGTy9mOGQ1?=
 =?utf-8?B?UytrSTFreGlsTUVFMVpjMGVVUkY5NjVJZjFVV0tLYWJCTUJCa2dLM2ppUW5z?=
 =?utf-8?B?eHk1RTVVT2Vvb1ZRT3pLaDVMM1owb3Mrd3ByeFQzQURDVks1MlMyZjVPSUdM?=
 =?utf-8?B?VlR6THJTRCtRNmdLMmJNeWtGdE1WUUVuYlRMTTZ5UDJ4VWJHd015Uk1Sek1z?=
 =?utf-8?B?WitnckdLT3daMXFHOXZHMytSY1ZVRHhBYnRJT3YzaWlwbnNPZmVMdDFPWHVS?=
 =?utf-8?B?SC9PVjhmbG84VWVFSEx0ZVNVbGJ6QUhoUldDdjhDQUd2Vm5UeFdlU253MEVy?=
 =?utf-8?B?VGl0ZUM3dWNva1YvMFVVZjlDWkdONkZqblN2UVh3QUJybXVoU1MzMlh5akwy?=
 =?utf-8?B?bE9RN2ZuMDdCYVRNSWw4Yk9kQmJQM3FoRlBOdnpSbHJSbm5IVExETDVhZ0l6?=
 =?utf-8?B?QWpNM0RvM0d4OXF6QURPMlRUZlRraEFPOTdDdDNWcjMwNnJSemljeksyc2Rk?=
 =?utf-8?B?V0pKZ05meENtVTUzbXAwelBhQS9wbk5OSnFvL2UrWWZraVlYZnNCa3hJRkpn?=
 =?utf-8?Q?x+TU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6821e9-d5b2-4d7e-58de-08dcbadd0f9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 14:42:59.2391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1Esjo1rSXOAUxNVLlGlVCOrYTjYKsI650vgeSxGqrmbHjiZMIEY86Iulwyao89Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBbhqWx+ObNqf/uqKwn1sLEWhEFK67wAf0h3ttCadHY=;
 b=YZwhRbEZTqm8s9nlZGdTuJMG+4GVFW3bKjATOl+uJvYeUHo7tuqMZH+rBAO/5APOweh6n4yYP11crtxF6RxFmGC+Dah0IhlLXmpFZ2FrcIGfALgToSjFef3jNFIcrYN/qBFXnETGnVhAyl44WNYUr+qkWAQTPWHXEMH8Mvg4MEQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YZwhRbEZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> Hi Brandon,
>
> > When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> > condition occurs between xilinx-prebuilt and u-boot, resulting in the
> > following error.
>
> >  objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
> >  objcopy: '.../images/pmufw.elf': No such file
>
> > U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> > xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> > DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> > fixup.
>
> > Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> > after xilinx-prebuilt has finished.
>
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>
> Thank you for looking into this.  I am adding Luca on copy as he developed
> the uboot.mk code you are modifying.
>
> Shouldn't line 448 of u-boot.mk prevent this issue?
> UBOOT_DEPENDENCIES += xilinx-prebuilt

> It doesn't, the dependency graph looks something like this

>  UBOOT_KCONFIG_DEPENDENCIES -> uboot-kconfig
>  uboot-kconfig -> uboot-configure
>  UBOOT_DEPENDENCIES -> uboot-configure

> The `objcopy` call is happening during `uboot-kconfig`, so
> UBOOT_DEPENDENCIES is not a prerequisite.

Thanks for clarifying this.  The issue is clear now.

> There is a UBOOT_KCONFIG_DEPENDENCIES, but it seemed more appropriate
> that the `objcopy` should be a build step.

Yes, I see.  objcopy is now a pre-build step.

>
> Do you have the following config when you see this error?
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

> Yes, this happened when I was building configs/zynqmp_zcu106_defconfig
> but with PER_PACKAGE_DIRECTORIES enabled, to speed up build with.

Thanks for catching this issue!  I was completely unaware.

I boot tested a zcu102 and kv260 and all looks good, thanks!

Tested-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
