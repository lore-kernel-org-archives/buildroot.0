Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5255FE77188
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 07:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11D24416D7;
	Thu, 16 Jan 2025 07:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgEBlRDTqgR3; Thu, 16 Jan 2025 07:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA81941728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA81941728;
	Thu, 16 Jan 2025 07:25:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C921B8B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 07:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18DD4608D6
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 07:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU58bd7bNj94 for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 07:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1098F606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1098F606F6
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1098F606F6
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 07:25:12 +0000 (UTC)
X-CSE-ConnectionGUID: 9DTIHTJQTgabsyR9jizdcQ==
X-CSE-MsgGUID: bvTTQf9GT0i07h1XKwZHUw==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 16 Jan 2025 08:17:50 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 43277B5A8A
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:17:50 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id B5C1AB5A87
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:17:47 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 08:17:47 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 Jan 2025 08:17:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayO1MoHtxIMo7lP/vmX2lRPLmIdQxSVVNXtN+hEy+3Ea5bpdFygj1NL+pAR2dK+GG3DzaMQDVQyKTa8Hmn/v+nIlpp9EKJNgTaKASG6cjwgM8Oh+s33PA+OI2ess9Gm6/XWRQvJZti1Jxej9Z5zbQynX3i7SmBZVXF/ZmiwIPO2XsJ6p6LbdyfMRMjJC1sOPcggj06ib/25lqKMCjfaDxWU3w4fIZJh1/bXc/daNIuo2/ACG2ClvH9DJNjudnPbfWhMrN7mubgC8W0ytrBrAMcw0VZB4jhWf6FEGOmH95SjjpCTHEv8o1lcVzkdhIABpwv4YSRU3LMikNqOMx9DsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCmpKxppTAuIdbooxeX3YYnjAeXc0XFs3aHwitMHrzE=;
 b=p5LZAmMPIec8GzgG7NFMCi9xeaI30/rRIS89SVioxjoZ2nH/6tROR6OXgNoLuTV+O0OmY983h/mEPD2+Nz4uYLkuCa0yQ8VfnGt2JxbYzx7YEXkt8CqSm8YJrSXOM0S+5lH4bOfyhdh+s4faoKcslgU8BU9SFvwPFKAh27Oh1xHhVh6nwT2Wp5I+3CQ20uWZWwL7QDznoA0aAUMXmLY2ZQqOogQV8NjKPNFabPBCTTL28MyODz8SS3TOjITWgK5N+TC7+hzyziPj0FvBR7RBM/9SgG/nX8EETfu9ByN7VFgeMjHRBGjBeBlWp2jgK5RWl25WMeJAfTMHo8wOyth66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0368.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:17:42 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:17:42 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 2/2] package/libzenoh-pico: bump to version 1.1.0
Thread-Index: Adtn5oXKF1MYg5YWTZ+lqHDdqrh4qQ==
Date: Thu, 16 Jan 2025 07:17:42 +0000
Message-ID: <AS1P250MB060890093CBB03093F29F955A91A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0368:EE_
x-ms-office365-filtering-correlation-id: 2a52f84f-7764-432c-c3ad-08dd35fdde4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?uFiOJuYInNcxbotFU4u2qTJLMjjZZ1zROw0wlDR+FG6d+mPu20cV4QmUjZ5D?=
 =?us-ascii?Q?ofidu7nOLsFdovqQqDNKT8XbrAncrcb1+wRy+9DZCW4XFfE6aYR+748Zscyb?=
 =?us-ascii?Q?1nvOAm+tyktJTUcyWM7STPCGdaGhO+dJCkvmenQZk9uUjEQDXNns65PkbQV2?=
 =?us-ascii?Q?E6yOFc8ifAeVj1o2o5bE406eEtlzJtd0Tjy4Dwm3EVYgoL4qc4P6v44l5PKu?=
 =?us-ascii?Q?ayNODqVST58GbBsJ+hbwl2Ju9CPBGCDqPNhrheAd7Wqfe6NVNTBi71gxKVG1?=
 =?us-ascii?Q?h0DsLjGsGLdBG0aGIui8lHN30cyZAeUZfySXKEP4wtTTstn+RWCjTBqYSxRb?=
 =?us-ascii?Q?0lEcszxO0ZHIUBNmwJ6eoHjwgIcKVyYGa3TP3prNlnxwkZU6EV+Png235Oe3?=
 =?us-ascii?Q?uLybzJ0yMRfVXSxbrIFuVaO2KssvZi7uvhDDFbGGpVLEyx3zZcpIVFaOaHfM?=
 =?us-ascii?Q?hYqzaS45yUbXOHTe8QN1Zm7vtjEGI4Ta4YRM4RoqWGaKKxCq6bjUPVK5wkqi?=
 =?us-ascii?Q?gjkLNM1EEmuc4tAPp9r6GkqLcqntjI+jqaLX5P7OkyxiPV1CXLUw8R+7lAGK?=
 =?us-ascii?Q?VWoT+K95ewwMGimGA9VwmeoWrnhqaTxw2W87K7XJ8gdXi8F+v15Mq9yQg4q4?=
 =?us-ascii?Q?LEae1FpC/R8/ULDWacmFq8vjR/C/ojFESwwZotjmb0CtCvjirvAOUiCLMf2R?=
 =?us-ascii?Q?I8Jha6ZUP/Gpk99Hwctt2PD3nhZNN87C3W38uLepofxTyd9txV42gxPvpK/1?=
 =?us-ascii?Q?50/vPII3BKwLKJnl7eFhu4kYjpddQ0VlBX24evojJm2fo0CgJqvK8kckIPBm?=
 =?us-ascii?Q?Wgj53W3rD1LaCrotu+opHfRAgpPk8WGTTaJwVbie/F5Bw+E/JOWzLVArziAI?=
 =?us-ascii?Q?NrLm7g2Fr3awzaZIqW46bABXwGsK+l1NADaSRx9PNp7WRewDxEwrJfzqU+p8?=
 =?us-ascii?Q?U0i5LzfyMXtxxWGu+EcPasKI4kwODZuk/EAm27mFSNkaLPFd+9XXWXHkqM4A?=
 =?us-ascii?Q?1nxApzKET/PIVdlJ7w5/N4xra0/oaURnCbGjrcWH3PxWWh/dKQO9/hJOAItS?=
 =?us-ascii?Q?m/rWQX5yzJ3HWFLIbya1NISh3gUdWr/nzPB8xvg5KL+MWf1CcSAaEXDShipV?=
 =?us-ascii?Q?3Taxk0DHt7TILW5yl4dicbKCNoUi4X9CtpeHFbQtV2qe6F0CvmvJj46tC0jo?=
 =?us-ascii?Q?1XHou+U5EZHi7SaKH4N82fdU+/LmM11TxukhhZ9byYP0SNXPT5c8kjDyfqhp?=
 =?us-ascii?Q?1o0RofBXQdlZyB9MELJoEE6GqOj6s2/rwndkl/iTIN+mdXVlqprrh3sG0gbQ?=
 =?us-ascii?Q?yZ3w9M1Pw5qGSFNBlrVAIj9YVymZ23wZ32vuoBHo/JLeXLOqgRir87aaHSjp?=
 =?us-ascii?Q?9bZacp9lOiYTEG55UvxpJus4+Vm0Qp4dwbdtetDw+2soO0Yf4g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TjQ1jsTNtH78+2R/Jw2jcID88Li+r4DPDDCqP0+2FJ+wYTukQYxtPPcazdAV?=
 =?us-ascii?Q?l2qCBj+TmrAScYc21pyr80LRcMti/S7eQLyYV8gaPaellAsRciJKFZUtjV+i?=
 =?us-ascii?Q?U2Zj3tVm8zENPquaZRyiz7xmMuj9Pt9HrycBotbhWzkskZQVe03AxA/geTZZ?=
 =?us-ascii?Q?maIOcs0B2jEYZQjIkbQvnvwvMyJby8TkT54gMPD/pmpuvWxyyFAsNkb+4ua9?=
 =?us-ascii?Q?605jllqFpdr3yslaSn6ANHJL5h2bS++HlhZtKmoTjbO/QOrHHKNuRzMX0U7x?=
 =?us-ascii?Q?349GbjI1ydpc/PtuSZsUxcwNib/MYbfjNdMPX+kewgnZe3U+QlmGOkCaEIYh?=
 =?us-ascii?Q?Lfn2IAXK2B6qFKqZh1HQeegVPgIDVX+ypnIfjyrmkXzML7RQfHEwpORxnAi0?=
 =?us-ascii?Q?CBvlsGPsQUODfXv11AglEM45SuaBTRGJml+WL5vRM/El4nnUgdMqt092cxBl?=
 =?us-ascii?Q?Rzd1OsXHKTLuBxhnUI1wUvboGlX1FeepoHUNeRukdlDDfm7D/59xVT6RptsC?=
 =?us-ascii?Q?4cGUl+cNmhO1sKFf6pZ5CB8XcUMQOgHxDZMUo6ftWeU/uYdrQUI74dMeae3V?=
 =?us-ascii?Q?QxFXzwNTzhXxyW2oUgW3uRtAFOMevIjBVj4jiy/zfpjSqxslD1G3m0sEtsma?=
 =?us-ascii?Q?Y96cN8beJZZk/JQdZLFI+bROKQZestrelCaIXES27L9W9cWbcwcstIuxr/m8?=
 =?us-ascii?Q?DQ8lpx8Dvh1ivNtyERKE1Sp3p0/oK8OVSIe/A7kCphaPtUu0gZ+jflwu7xu4?=
 =?us-ascii?Q?DJLLTWbj3l7EsMpNhdVCgsV4SRlTJwFjRM/4rN9yHgjbpqYUSUIQkF7NlGcf?=
 =?us-ascii?Q?eKQyGLx2FpiIaJCU2YsyyzQK38yzLVAtnc0WeV/uEUR2aeV0RuG7XiKYYVXT?=
 =?us-ascii?Q?a04qkiPlG8iOUPT5m4zcmVGq/64pHLKPm8eLt1243LRS0DBD1ODOOa5ZnTlw?=
 =?us-ascii?Q?TJkCp95fUiRwRIMiRsZjscFOHR1h9izyLUe98saANLm71wJb/wlsFf+L8tjS?=
 =?us-ascii?Q?lCHG0ABaUX/Gk2yZQDLZ5iLEFgOdC82wI4IIx7la45DKLIWiNo4Ustt4STtE?=
 =?us-ascii?Q?7MoFT/IeHe7lPdOmvK1PdssRDpQij8teHVGqXwfSvkANz1kBX8EDc3gw/WsK?=
 =?us-ascii?Q?xP2J7qLbTbk4czQGjW2Lmz/9nNJmrsx4X/Afsd4JppqmWd8xHtjSaQUVVYnG?=
 =?us-ascii?Q?vauixlbvpsyxSz5RUDMWAaoIRpxxUe2UJclxPpKkcY9L8LgUPUuCpu05QV5Z?=
 =?us-ascii?Q?wODwEMFb9L499bIXVSU99iPEalW7M4zqk8SGGN5hj5Lk77e/UJIQjPcKZlEu?=
 =?us-ascii?Q?9my2CWG17vffKEsaKYNwKlqAr8puyeaDOBlgvwg20HIuhk6UvWgpzuisCjuU?=
 =?us-ascii?Q?P5TuoH68nCSGQdKL6kYi9jWG1mzsXfKAddERl73KJZ0G6YGU0rphG5IJNPcr?=
 =?us-ascii?Q?r+zpJGGtC9LtaJNvIhsKyajG6OrFdvVMZot3ZT0qNEBBhCQCrzzNk+XPCPM8?=
 =?us-ascii?Q?glSUM0PXVN02DuZ50V21oHv7songlpeZIZB8t2cd15EvjL7UiGUSjzoX02UG?=
 =?us-ascii?Q?xP0QUJ+rLpNr+WAPDtBvKChafbenFLhYkTLJbukN/PpsgSDv+XIGA0dS1AI4?=
 =?us-ascii?Q?MA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sY+1zOha0YxFPr/TFuEnuU5zxLn3rjeQAwKs0c2EgWI+6wyYtZRDKLBYpqZ+dyizczm3Th3TH0tPdw0a1dmBb0azg6iNFh548YU/C7A/93cGJTJYiPqOeMIM4nT981jOm/3ykBS4m5LBlC9xiIrXqZEmf6wRNO8+Zum+iSeVchL2RALRNusPzSuXXbbJfntcPPg/4HNFhoPwdankDmFxvxjFTc3XvmacR4y1ROGXb+SeoVsZkSreWG5USrLVKonoDX+EvHxQvk9ffinN1bxricJmCVkF6Mg/LDcy6r0oAqnFKFBFioVEVOcbUg69+4KaLa2Zl6Cb5BJBGWHIGcg8tyDzSZnXnhCkSHdj+PGpqkOHp4hWo1KBBvOAogSw619Rx14AnlDUPwy6fTzEZflexr2WbM/WTUcB5mIfqaZyBaRFaTHTynASfnpaSOm4iC8F/+pajssViHtXdyeM1C6ccgoy6gQAl2zeqZjc1ux3DAmM2pTmjiSFaCBE4DEdxkKoY7WGkXrTQ0aUYwngybtZJekwJjytH2zN3fv3/6fiAEd7zC5k4tAVXj51OXJnxAc9EotvQbRwzVFPYbEJIZypLQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a52f84f-7764-432c-c3ad-08dd35fdde4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 07:17:42.8404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRgZXFW5KvNfzCPpxcE4QtidOfE6kqyOTD0FSQ+rfE48hl3gzfFNEwsu7n6f8ttViZt6OcR4hem2cjmt2UVaf9SKj/nBjNtVJahi+5mxm5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0368
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCmpKxppTAuIdbooxeX3YYnjAeXc0XFs3aHwitMHrzE=;
 b=P6hITzXL0zKdAf48uStXhlT1ENtvktTnYS7B+OGg0VKONPrp+iLTLND7PbFF9a1Abx2KyLrJBiNGtieM2y/QP3vcz+vl4F3l4GyzcdvXg2VLsvb7WT3a7dmURG0Y5YuUEJmZq0XvDtxnnT0FRJ9fjSZiWblwdgqh3lY61Uxej4s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=P6hITzXL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump to version 1.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed CMakeLists.txt patch

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.1.0

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 ...xt-don-t-override-the-optimization-level.patch | 15 +++++++++------
 package/libzenoh-pico/libzenoh-pico.hash          |  2 +-
 package/libzenoh-pico/libzenoh-pico.mk            |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
index 9f911a750b..e9a3520407 100644
--- a/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
+++ b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
@@ -30,10 +30,10 @@ Upstream: https://github.com/eclipse-zenoh/zenoh-pico/pull/847
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7a9fb6d1..97fba56a 100644
+index 25b62fb5..623d13f8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -85,13 +85,13 @@ string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
+@@ -86,15 +86,15 @@ string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
  # Compile options
  if(CMAKE_BUILD_TYPE MATCHES "RELEASE" OR "Release")
    if(UNIX)
@@ -44,13 +44,16 @@ index 7a9fb6d1..97fba56a 100644
 +    add_compile_options(-pipe)
    endif()
  else()
-   if(UNIX)
+   if(CMAKE_SYSTEM_NAME MATCHES "PICO")
+-    add_compile_options(-c -Wall -Wextra -Wno-unused -Wno-strict-prototypes -pipe -g -O0)
++    add_compile_options(-c -Wall -Wextra -Wno-unused -Wno-strict-prototypes -pipe -g)
+   elseif(UNIX)
 -    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g -O0)
 +    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g)
      # C99 pedantic doesn't like struct anonymous in unix header
      if (NOT CMAKE_C_STANDARD STREQUAL "99")
        add_compile_options(-Wpedantic)
-@@ -100,7 +100,7 @@ else()
+@@ -103,7 +103,7 @@ else()
    elseif(MSVC)
      add_compile_options(/W4 /WX /Od /wd4127)
    elseif(CMAKE_SYSTEM_NAME MATCHES "Generic")
@@ -58,7 +61,7 @@ index 7a9fb6d1..97fba56a 100644
 +    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wmissing-prototypes -pipe -g)
    endif()
  endif()
- 
--- 
+
+--
 2.47.1
 
diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 4f95f2215e..5bf924987a 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c9002b4e348337c6fa522a2c80e175f512fa94d1837a9332fe095cf254e77242  libzenoh-pico-1.0.4.tar.gz
+sha256  4033d3867a8e94e587355639de2ad9045c0a1ed0409c7901a93dbd2cf2d9308b  libzenoh-pico-1.1.0.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index bd1dd763d6..e243ec64fe 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 1.0.4
+LIBZENOH_PICO_VERSION = 1.1.0
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
