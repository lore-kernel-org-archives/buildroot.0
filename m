Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D931E77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 12:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB354033C;
	Mon,  9 Dec 2024 12:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRjaNXz0BPs7; Mon,  9 Dec 2024 12:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0258404E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0258404E4;
	Mon,  9 Dec 2024 12:24:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C5BBED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B4366084E
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 12:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyxzsH1iy73y for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 12:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4504260845
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4504260845
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4504260845
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 12:24:20 +0000 (UTC)
X-CSE-ConnectionGUID: pz09bVcGTsKY+fpbJKg9zA==
X-CSE-MsgGUID: 69d0kbFGS0qpZM3d5W99Qg==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 09 Dec 2024 13:24:16 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id A0EC0B5A8A
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 13:24:16 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 89B79B5A86
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 13:24:13 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 13:24:13 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.176)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 13:24:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvbnfhB/Vt8Z8pcYDR+jBtsgLN/xXrBfzNfRSKiJZhVLH2d5MTFNg4pz2eLAhqq3wh4dO6CnFOxgZV9F1brgRQGLB27Alx/UWfAxvQYywUZJYohbZUkyBnw0pYG7J3SpyH+icGzZmdekzuYkuJ0WJYqXq30GbLDe9D4wxorHfkqe2zKOr9H3/10hoaGDvSo1PIOHIx7gy4bNuufypO2xrdvAfw3v1aofD3IrRN6Qs9jxExeqm+PvExU8wca9rD5XdUyGpbGlIuZI/ozChDzUtLK8Mj5JufF0R+DcDsfJFIzFmf8QXWiDWn1hKKynMWfQD5lfQGJLEgT4HZAmzDbzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjd3GWYWeJMqbvmzgBoUPqKpFmqYHmTTfOadsDskkw8=;
 b=T8qD1J1NZ8ofE3ioRa9dqdfGunZo7Jc2p27SvI2VpYCzTNn8ZCHZRlsKOt1OWalQQ52XuY0RkvUKYZGLgaEwbXT7IwbEYZA+snugwHNQ9f1qXk2tKtzWv/gF+1MPHlVckXmepiqEsWZ0tWEFXczbvmKLXP0dN2+VS5YCe1VuHD5RVXbYjbkkwRlNM7vF2Hq6famr7s4XOLApRVvkbhYdu2izt2TvVCmFqRnFuWI0zVTpNjilKpWE8ryoKVk0JhJbt7FNPJYGJ3PNSqWoU9SWOSaoBG/BDKutMoK3pyq2NZj6YDOpFteTeIRWgFr3NohOt0PwO1qJ/OA7CwOVaHK1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0962.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 9 Dec
 2024 12:24:05 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 12:24:05 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/2] package/libzenoh-c: bump to version 1.0.4
Thread-Index: AdtKNQTTDxPHjQKxSHiEk/but+0TVQ==
Date: Mon, 9 Dec 2024 12:24:05 +0000
Message-ID: <AS1P250MB0608DDF2C7AAE3742461CCE8A93C2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0962:EE_
x-ms-office365-filtering-correlation-id: 354951d2-3c23-4d62-ec9a-08dd184c5faa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gmwFvfDdDeeiAjoqjcl7bJAQ+GsD0mm5b74eMwVW4wjGo5/cnzQAGZ20QJVU?=
 =?us-ascii?Q?+g79F9cyvKVMDFrXZ3gRh8A+SwMveNkQvem+tf6iimHXi1D5TFsWWaB9OiZl?=
 =?us-ascii?Q?AF3U0Yj0jqcjQGCMdNqG5ZBAgObxjYgNrRZQKJPReSckIPIQ/CJhgDlbkKhp?=
 =?us-ascii?Q?UHUoB3X+C1i1bg2n3JGttMAthpJH+K+/7iFN+pxqrjDD4pl/ExCDARSARnwD?=
 =?us-ascii?Q?Wi/VK3AB+QaGY35tEX29iDCrbMsCpDNHkQf8NzMXJaZVe+gGssWbNo+6s0Ib?=
 =?us-ascii?Q?qpOe3Ps5F3q9tmu7Fzvj6xlP42OJ/1aZ4kv8e+9tYxM1Z/t7chf+LBaQANuV?=
 =?us-ascii?Q?FW8YpipLZ37rjG5N6so9n7reh/wXG3SdEmnBdBgK4mgbHmCa+uTT4Qy8GDKj?=
 =?us-ascii?Q?sU0taNY8Hcj8btBfCoy22iy+F35NOPhQHfTECsZ7Ov4PfKZBQB0iVVHrdGu5?=
 =?us-ascii?Q?ZwXVaGSd8FFfZUXmou32t7wEPCTH7aUpJMHSjIS7RzTgxMza8uc4T4BvcWst?=
 =?us-ascii?Q?WpdqlxFqQH0if5DtH5AVG/oV4uU4RUOPithrKQqek8e5McT/J8Hlf+7KDjZ4?=
 =?us-ascii?Q?1IrAMYugvkxcj2zHp9ioMGSAL7pMCRKDH0QabgOJ1cpsFZ4l8B833im3n9ud?=
 =?us-ascii?Q?l97W3C1rnDhaOxn4+HZYU5GAfLaHfxUPHEXhl7UmGxUb69fN2TTbmZjs4aN0?=
 =?us-ascii?Q?VWDD4SAOMT+4TYlEsXaF2dqusyCyrIRUwexlPfgmlheraKcRRVZJwg4+5J5r?=
 =?us-ascii?Q?GLTnp+ZnA0gm4A0mmy7OZ+egHzBSkhYWzAHhmOUJl6f6bwqFAkcHeAV3Yl8u?=
 =?us-ascii?Q?I82nXVChDaZJb8ziQOYObQRXm5oj7LIhXgT9Mdt4v1hO1ZrDtqshcN5Yxknv?=
 =?us-ascii?Q?ms0+RY6K+Ixec2MDGjBcnECqeTn7hANR52rwA4W4qec0kvhH2J3dlP6IKeza?=
 =?us-ascii?Q?BNWYv83ufUPkSRL5kLaB7giID6B2Yg0tG9AHRRWcOMSH/6B9rtXBuaDHsHuJ?=
 =?us-ascii?Q?H1Kir8rgowoaCmM4xndX0hHH71I2fPKU02IEF8gRepBFkeXUXTvLSREeQjvI?=
 =?us-ascii?Q?RvVDiq2F7xx8TuB4pdfg1RPfCEJq/Id8ZYHScfHSycctPt6xgo+0peBqXiEQ?=
 =?us-ascii?Q?kR48Mww5foa6FOlo6HeJ1B9h4c9kC3QppG7QBBjpeXbOdsKVsQAaPlL7e4dO?=
 =?us-ascii?Q?KfRTBDMzmIwMx5bnOZKBqvgt7Qb6OsgjQtpfi2F/hNa4HioC2+ZWUK8/VOXH?=
 =?us-ascii?Q?VNm75c/rjvgGo+4/EX++Q4yCEWnFqszcMiFHxcr3CXpr/kSrjDx02PfPX4fn?=
 =?us-ascii?Q?ErwmUSmOeS6E9s6vhCdjQB88uiqIhYvL6ySYzoYb3IlCxWlOcjREaSgcX9LP?=
 =?us-ascii?Q?BQkEm6sYLH0jzxxd1Sux9DretBz+9zoU02T1rJUI9pQogq6aSw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Op8lkW5mss+lKVFGASpPd+4JRVH0Ha8DzW0MJ0rV9snLPXqehfvgvx8f7D1j?=
 =?us-ascii?Q?buF0NQXjNGVsHP619P3K9+f0y/kLnyMA+1kB8+FYiHF+Rd2gqFMPLRNvO1GE?=
 =?us-ascii?Q?LhMmc9SIU6VwZd5XxMHr0/dwhhZVC3xU3c0vPapFURf3T238yafCjIviQLDC?=
 =?us-ascii?Q?2WvEa1gbCDyqOX2KUeo9GPwuaiByeqEUuGh2YxUl3bdFElWgLlqyUS5xSKmb?=
 =?us-ascii?Q?HCn22f43uAC7UQEM7SSoZoJENn7XNYzugZVA35jQ9jFdLh4mUIlwnV+zOxkO?=
 =?us-ascii?Q?PY/leNEeOG8YvqdT7J04LNos2BGZcMVdrhaVsiEP0I5fW7SyEyhK+8PWhK77?=
 =?us-ascii?Q?PSVxGkpF2lf1X1s3CaHkRSux7lk3AUKbaRQdpF0lm4/HmWffxSMIP4ywyDzC?=
 =?us-ascii?Q?cx2P5nuX9oBrZh4f9ZfTgvhusfgzNuTQaTUsi8D0iZUC7tOzyC8OojTh9lA3?=
 =?us-ascii?Q?1WQthZ2kqk9xIpYdL2cpHvy10u3xxOhTewxUXoHF3sB6PKDnWR4GoTdnEtgm?=
 =?us-ascii?Q?ehPRVFW3FuuTif6CKmwOx35HjIA6CSmwDXARjqrAtbZYeMu+N0CRQpBrKas6?=
 =?us-ascii?Q?82BYdxxve96KEamz1SDjVVCYiZirf6h/ubhY7+1LT/4tCGcoxdOlV2y5Y+Q4?=
 =?us-ascii?Q?aEMy5fzUSJWqW8p7hhSKlBzZjuhbO+TlRzXs5OZWkXfxqQwwbJhtoBeWKVmY?=
 =?us-ascii?Q?Qy7V7nMjqJ3fpanrx3v1or82yWnU45xmce0YSFGIyfnIdDmJnoSh7jMYbK8z?=
 =?us-ascii?Q?LY06KBqCElLgupsD4lYmx55L6RrcOGP3FvHEqiyK5yl2OAz7zC37CE2CB3HL?=
 =?us-ascii?Q?gf3qm0tHorrpmYH19XfRhS4BkjPUSStOUrYixujNtDuVzBcSjGxuzkfXAw6r?=
 =?us-ascii?Q?BlRyRXACs40M6e/t7tZZIoSNibt+hLgW5pl0qPKgwQSe/zpJo628XhvvbJSH?=
 =?us-ascii?Q?0DlRhPmWsJJyfsiRkOGvWZdNpMA9qzsg374auvWUK59l59m3eAngW8/rQZcc?=
 =?us-ascii?Q?aP3XSLXYGqr5+gvnv4haHy2QTVFvAfPq7NcXcUzWxqniCcrgK4FWqJQpvF/o?=
 =?us-ascii?Q?TwrKcdbgBZYnvhn4lxHsxEITp9OAj4Nz4Sba6F06kxPgr0qadwfAehDT0FCE?=
 =?us-ascii?Q?zgNCYeSaoMHLFKoSe3lMj9mVMKEcbfDJx4G4Yv8SkJsrvDT1bGRpg1mdT51T?=
 =?us-ascii?Q?ilalPSfdsatmg0FC7Vmy7cnKmAKjPiu2/6NnMC/MnmV0A/em3rtT4Q8qvB3F?=
 =?us-ascii?Q?nSQtx2tqSSd/eZyLPgE/zMPCeGSwvPouNhmwU90sdHCog3RlDB1ak4ukIBZx?=
 =?us-ascii?Q?+ZNhkAZoEJ60FRUD8v31Ro1CC5LjshFsP2SOlljkS4iMuO53H59GZZojXwMw?=
 =?us-ascii?Q?VrZqBopkZhlxdBT6RyvZEG0X0SgpEYdjiWKjpjW8wQ7gqnqZ6bEsYIdPIC5P?=
 =?us-ascii?Q?Khmp0Ga1VksqKSAB4SOcKs8Gesq18EgmmdAlD2p/cYR46d0Po7rsD7QucAKs?=
 =?us-ascii?Q?MzCnLXKLTS7yO1sc17R9J5pZ2j++N6v+TewQm0nC2TXcBjbvKJZVa3y7GcYK?=
 =?us-ascii?Q?9xb0yNZMJXOeAnX2i6ahMa015RCTCDXmqERWJwLixpx+BShEfABecbu5SxSk?=
 =?us-ascii?Q?ew=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EbcfKgfP45YeivFMsZelH1Cka/FCu5kaMrZ+/B2QZ+7OPBhWEM7MN5MAy/X23VT8uNhyuuaObUmMms0oIoU6Nor1muJycC2qnvt/BBjGuF/4bj4j7EwqL0VVb6nFPlziyA5gLuSkJ+1ECEmk9GVZr/+LexKnfPSsdMOkBlvyJcJ7ij14DvbANVFbslVHPh08kXnPsjsYFmTNBe0UkpYAFOsWLM8QUUK9IU4LM5l7p1nnmr/4zwi1+nCfrx9OwzMcUCa2bulfsZbjpnWEfZJJ6/9QC478JQlocRVCqbGOeNVJS6rwyLWvaOBa4vVm49lwh/o44XJdwcZesSFoclRsxy0xxJyz9YRDFz47N+LXlHdECGWF3hDwL1Qtohh3LQpfwEPBKE3QvFd6zCQ4UE6Yo8Lc7dbpQwHhF9/mJ29VvUlOoeqGFVT5LFx2ailUcjGBhhd0IGJS4B6P89fR/CCaimsuW3T47TguSf+nuFfDyrv9ssDG4pGuU7iXUGUi6o6lAluDUGT0qolnHcXfcasagqoPRKnn3JqulMK35zmhL7zoSp9Fsm6FCixfySEsfhj4derU6Cmb6YYKUUdtZEDOiw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 354951d2-3c23-4d62-ec9a-08dd184c5faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 12:24:05.7449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdkCpFaCB/i5EBHT0VokhqH99LpzZQD0jLzBG0D5cLVgjKTFuZb5200hBXYBmzM4KJxuwuggXXILMsLBr5++ZaGCfvt6Cpxe2hSZiGe3v90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0962
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gjd3GWYWeJMqbvmzgBoUPqKpFmqYHmTTfOadsDskkw8=;
 b=DXmUx1o7+rDtXUHEbIJTld5aylDBoZJK0mhNpN3jVi0zc+roLqlmNo6bWrCim1v5R8ANWjR5SHhuvAidZcAVGOsZZu4cIrmuJnefCaNThPbSRV2t3Wu/CA3aBCxpmbul2y6ik3ZeXozzU+eVGbSZ5DxxPinalDQHw9fuhChsxjk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=DXmUx1o7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version 1.0.4
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

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.4

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index da4596e4dc..058909eaec 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e3419a3ef9c1d0c65a2749728e332cbc5a8da2ba3dfbc24f310fa8735fb5949  libzenoh-c-1.0.2-cargo2.tar.gz
+sha256  12401035b4652eaa95d5835db85f6597358f3245c2646abb3986291104be566c  libzenoh-c-1.0.4-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index a697146049..6112eda842 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 1.0.2
+LIBZENOH_C_VERSION = 1.0.4
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
