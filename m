Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D266BC021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794C740655;
	Tue,  4 Mar 2025 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRWR4Psb75rS; Tue,  4 Mar 2025 08:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E6A4065E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E6A4065E;
	Tue,  4 Mar 2025 08:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D5AD2
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 08:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADA7605DD
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 08:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq3FiLNTzRAC for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 08:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=151ed2091=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E14A605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E14A605D8
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E14A605D8
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 08:39:40 +0000 (UTC)
X-CSE-ConnectionGUID: kX+K911kQCOgKB/8JkaFsw==
X-CSE-MsgGUID: oA0Xy7PGQiyFIBuETI6Zgw==
X-IronPort-AV: E=Sophos;i="6.13,331,1732550400"; d="scan'208";a="40163837"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2025 16:39:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6j0Ushcwyi9P+/CJWDXH3AdNcNbd0+OQ9+Ggx17fLd8xEFa/qh85pzLsNJ/4/aSqpZjJiiiZspkHsREF3KTHDTYiwICOG7FrTMG2u8c52E/zxlj9x5HEFG6AqH9Gxnz59D8A8+jNYll9hfB/jPDvlyF1dS2zxm2faOuAzWdZ9A/9cHq5XAQpLn5LHTb3PQtOs6xkouRjDEMGKtivjkcUnykjfp+4lR9Az1z6ig1XXtiWbw5Jw2zJjfK6MunTeTQRfu8Q05LY1cSDp2BhKZYSkH1PJNd7bxIqrl+cHVO4eDBfCdY7TIMzzU0PNAp6THfwJXbFF4vC7EpT/8sSN6y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1Hba8bbmLLBwipihiisxxYbZNc7OugVE+5udUo17xU=;
 b=FPYFv7Vf0O8fumUpEvl6dtvP5mkTdGhMDEMN8BmTd2nXiiq2u2BJf1D/bjZAMakG/4i9KEW/CDmYht7IPaIcYJ5wzoGHdaMUy9Edq3L3ofyF2DBuQS5UFn+KWaPBkiupQc3AE36ZU9e4c6P/pRLom0WyYtIzb85uYfbGIIcoFkL70sOmbk0F1UbrLtbeID6wTO3+0eC5vyNw+owEAYp5JWlLNpx6zj6aZ3M+TGyOF7nJRPcGgQa0SlhdoUseNqlG6fVPtvya1MkrcN43sO0LtK6mlBKWx16kCPKmQtyicHduQaY8vbkogouiOEw/i0W4pfare09+AM1LydKDBMG4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BL0PR04MB6499.namprd04.prod.outlook.com (2603:10b6:208:1ca::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 08:39:37 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:39:37 +0000
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Michael Walle
 <michael@walle.cc>, =?iso-8859-1?Q?Ga=EBl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Chris Packham <judge.packham@gmail.com>, Edgar
 Bonet <bonet@grenoble.cnrs.fr>
Thread-Topic: [Buildroot] [PATCH v6 3/5] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
Thread-Index: AQHbhLPDhI/KaA7hbUyMEu5a3lD0vrNWKNuAgAyPqAA=
Date: Tue, 4 Mar 2025 08:39:37 +0000
Message-ID: <Z8a8SGiT2TiRaGYV@ryzen>
References: <20250221225529.441084-1-romain.naour@smile.fr>
 <20250221225529.441084-3-romain.naour@smile.fr> <Z7wyy7HiZ2KHCiVw@ryzen>
In-Reply-To: <Z7wyy7HiZ2KHCiVw@ryzen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BL0PR04MB6499:EE_
x-ms-office365-filtering-correlation-id: a167f052-0cbe-4a3e-8bdb-08dd5af818d9
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/eeZYiNWIUHaAAJhMM5VbysJknCWV6exmZAyjJWjGRv8jKDqRwpBXpgbYd?=
 =?iso-8859-1?Q?BqHaTMhPAPjW76i06gWAvbkz9Hf8C4PPi3l9gQlMDP5cdt9B/ZGAkCBmGf?=
 =?iso-8859-1?Q?+GXtWO/vQqSWSCsCqpHZ19+XSpfyjm7L+pTuKdfzaiRZ6Xus8Y7JWYiZIe?=
 =?iso-8859-1?Q?VntX/FH8+N5h3+M0Lpxci65moNfmFdTsbEqW450fWUHtDzss3LwkMT/RYP?=
 =?iso-8859-1?Q?ySIBRBQypYKtqQjzaFAsfL1P0gFZD0kFOgTByb/1Iym2QwK2pp+oJCBtP7?=
 =?iso-8859-1?Q?bm3c+dzI53z6CazMQrj2jjXd6CGnLw8fsDUi5DRca23iya6GYue5af/eVc?=
 =?iso-8859-1?Q?238qeWog0FteZcWgPJx/0iJ+D+cxuDcXejwjjHYLzDqx/0iYEluSJr+zKZ?=
 =?iso-8859-1?Q?8zn7cVjCnGxCSlgy37fHkEGEO5JOcdTReRfKzkGxpMF3byzICID58KVCFC?=
 =?iso-8859-1?Q?TVJKDruygg4E0dVY+MIGtDEWlLJSlT/Tzifpr4ltCHQnj3+eb53RM2+4s+?=
 =?iso-8859-1?Q?3wviFfDJxGAhhbTVpO4jYeUvwmeyHtHLXolzsHBB/7XLxG8Pvuxjw4/bvw?=
 =?iso-8859-1?Q?A/BTKiQLKxyOFT7svkALFco0BXeef5kgUrrVFyWnF1cVKK2r0xgBIXaNK1?=
 =?iso-8859-1?Q?HPlW+oFUrNSo7MUEHzygchF/qgABrIz50eEs2iKq2pbLGeZubKzV4Kaxg4?=
 =?iso-8859-1?Q?o+lAX4Gapio0a9b4CbVCHrbQIGvT4X2FF/uWvI1VWxTm2mpYoCRcs+5RiR?=
 =?iso-8859-1?Q?DofB3UD+xyZOZz8dotDJ8pOtdthbZJhYMNu6GVNA7eMeSKdBXlpMZeXbEG?=
 =?iso-8859-1?Q?WtegsKINQHIkYAm1w5eLo/JcW09K4Jr9wlXXvrwnEGhOi15ZZjLXPJy4kc?=
 =?iso-8859-1?Q?DQGCC7xg6NuT9A+rWzQtrExlFK3eP6cYTzPWsohGx5Hrw4d3gnj43bEgx0?=
 =?iso-8859-1?Q?DgOHcMYyezOlv9eiuIlHJWekiwsm2/ROysF2JXeZC6Tvk0ffIlix90+muy?=
 =?iso-8859-1?Q?vcDlEOTQ/RNUr8qX3VSdxCUD/8qfUyB0HY1Fg4V5MFy9qPaa9CScehdXSr?=
 =?iso-8859-1?Q?efLmkAEv6yuVr52zvIc3FUdN21KyvRrIr/y/C6Vx+x5lAUwes4iudOljv3?=
 =?iso-8859-1?Q?nGO1k9OGdIsJOhwfwtqfgKDs5P4na91O4RlrqIB1DQiQyezPqpMuuncrnc?=
 =?iso-8859-1?Q?qbjy5YUGr6gALuleqfJuzT/7dwCq1qo02lv9aajZnu0Xc844TjQ8S9uYXS?=
 =?iso-8859-1?Q?fGaMI639dVDYKs5QCkBpnRLgBTjsM6hKKTgKKbPQrRccm6hzj1KWZIYzW3?=
 =?iso-8859-1?Q?bbkc+IKniOvSCwCdXImjlVFJFwYjwCQ9O2JompRYzh9OxWZxkKqJEt5GhY?=
 =?iso-8859-1?Q?W91Je7byFEw0KmH170EkfEpvePpQ9FsFUMsC7ZzsErKfRpCaSTgkSFLvQS?=
 =?iso-8859-1?Q?7B6ypHoNrnRC1yRn/Q3OCu0i2Z4OR9HSDDoA9j+Q8PFvpqtjGYWdxpIGhz?=
 =?iso-8859-1?Q?JhWnhJPxLwTPGf5x7Qa1ru?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nFadjBS28EZkWtsC8GUhx/l1NOidgzJ9LVHIhdalb+9Op2HQalyMu2lSx8?=
 =?iso-8859-1?Q?XdiCRlS+KoLqgGyO8hPHEPpJm8P4V1U9fC4U75KL4vEoY/9o5FPbX6sEp9?=
 =?iso-8859-1?Q?uOxjbdgobUBx4Ra874I+bYorGp9F4Wm9yVM+lpYl4wueCEJSTCNGPRamYK?=
 =?iso-8859-1?Q?KHxSAZxUQerhALQ11GJ1FMP/2RGoBZXR4O2DFnabUT4C9qN0bnNa7vEuqb?=
 =?iso-8859-1?Q?s7HDMWvM5Eh7DDLtg5Tu40haFMGoqct76/KsVs13DFKjmF5mIAh1mruQBa?=
 =?iso-8859-1?Q?qL5DK7NirZUoPal1m98a/THBhVEbCvEfmq561GoWZJpTgYKCIfPWbndkq+?=
 =?iso-8859-1?Q?qd5qwKabTDXDkf61Eg2s5u7bTrzOk9uAvswZO0jncn6ijDIm9QtJxb9JNx?=
 =?iso-8859-1?Q?k9l9T6rlkHWTsuYZW0uNEaCiXXHQf0vczMhTBr5cgl9PfO+HqJDGBFN5Kb?=
 =?iso-8859-1?Q?bpHZBXi1EcEbuytYkrwVLFAXu25IpXnNZbKP+l0axHgnc11b2q0ZS2vnja?=
 =?iso-8859-1?Q?bfcCcYdUQp1Q6XEpdCe/pmAbkJJKpS+Bm+/LHfJYgJkF3NWpgiKuf+yxn8?=
 =?iso-8859-1?Q?+2EOtBzMi2fTV8DQNaiRY/K++v92OU3rFifRsTha0u8SdhWWl3rRTe+psC?=
 =?iso-8859-1?Q?Zq0/XK8MRtdl37YlL9sSzvnwDHEJb8Izb/JrIRUfHw0mHJcRk+NFA4xrkI?=
 =?iso-8859-1?Q?ZwcXJ1EpFaZLCmWqEn4Gv/5sgIo3HnrtKWZSskYAFIH743k0NFCBqnOpOr?=
 =?iso-8859-1?Q?2YtlAzUxgyp0VZFmV/X26M5swQhe3ErNMvrHrfxmIftRTNkg1+ad64e7ur?=
 =?iso-8859-1?Q?MTtd7Cg1hChDCDoQvavwgknteYMaIooSDTAuLLU/ZO0YnjxX6aouYhkAwU?=
 =?iso-8859-1?Q?HZnyVTKXj9h7n2voFgas+IVknGUAT64cPvKkee6OLpb0enW9I4akPJ3ESG?=
 =?iso-8859-1?Q?gdEZ5Gycxt49sKx80x8FNWejsUjVQAf1IlcmjOXMfZrEoNhxlTWPPBrTYD?=
 =?iso-8859-1?Q?UPErQ7olH8SLAco/z37xANT19++BPVgvccAzSON/5GS5Eecq45E7Zq+06Y?=
 =?iso-8859-1?Q?OSEP6WnRlmyjxPMIARSnvKzjXM+1hooVo1KQhJVSubM+bVuTGtxdh87Ixk?=
 =?iso-8859-1?Q?0Nq6tnzBWb5JaQV0nsRD1SQPuLmzTZotMGEbZufrsldPDxtLSosk4NGUDD?=
 =?iso-8859-1?Q?2s4f9XEW2k8qo7BfaPtsAIGOUtjZw73DTq06R5k3dM79JT5Tn8De++Iwn4?=
 =?iso-8859-1?Q?zkldTNe04askI6PXmHseAGvtZ4EBxDCYqhgFTzscxvV+cxnjIB0L2s0xHW?=
 =?iso-8859-1?Q?oVgU/7vzb32YkGNp7Aj72YLHcKe7fCw6a3aBnCnwRlQ+yKvQH03s25pT7D?=
 =?iso-8859-1?Q?efbL+MISkhziXDUL09TZgsBIYvbK5tEIhH/nMEuRzqSEaGiKa0agxihPWl?=
 =?iso-8859-1?Q?+EfEmLZ2ntzPB7BfyJJm2BEe+37GICbX1ej7sYoQRh2Wfdr+UjcCRy0UfM?=
 =?iso-8859-1?Q?Jxsx024RkxjXX3oYM2nVTbSfb6LlJJe/mdaKzFVFhDJrdvoG+Pjb8vpYsf?=
 =?iso-8859-1?Q?ZpBD2bldDg5lpe38g1M9dM7BtsKhwmIedQDpgiFsKqCF515HWlnlfxp81l?=
 =?iso-8859-1?Q?tclXZ04FYkvRh9+oL3pQf48RNjgZjUOYalIDa3w+1qP7g0DPOuK47pfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <E00BA9352306CE45A38231E9F74188B9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WROLcOorII6FRBMVCc3P4hcadzT/ljPIRhz/cCNzbEWZlLHh/zCJLsxREF1+OvEiEctPjlab660T5Ik7+EeqN2FeB3+r/KcTnuVKaCuJTlaEe4k82MK0mG57hPrOv9f7OYuhZthz4Bj4brVXJf2IMMwCqYr5H3fF9XuLnN0zQFkOlaaU7oaXtlFdN/VjZn4y2hC2u05MQSRjcwlt7pPf9Sfj0N7jGiVNucm19d7efTJzc2qXU1m0U8VAK6gYbwoTBGchRYp7K53dV6H2O9ldqhJS3g7tXEtWAUt2kTQzPlfyyn1GOOsqOzdopshb33Iy/Ulvr/ax5k1xjAlnuYMkC3WpLWwZcZZGJiBMOrmbfL7Ov+UwZlVyUcnL0pbKb7IqvvCBI7JtAhavXZ3kUZvDSUtgh33fgKcsdaof6Sf85/E89L+fMcfUYxr1zsgXjMlr6aYwsJZ1TJN+vKUejLHWUwoN9spubAt+g7E/6n+M9FIRrNzYYG7uawWQPVQejGrBz4FQ+2ByzRRPRdHVGxmPRRvpCVtuQp1MuFNygNRoEHsBFpmNIQSTp1T1tqGMziTgVsKUE8d9oU6i4B8es5U7S0DK6LE/nQ3RErgT28NPEP/glAj06lnP76qd2K5o/f6v
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a167f052-0cbe-4a3e-8bdb-08dd5af818d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 08:39:37.1179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e11Ufy+/t5faqO1emVj88CzCgb47e6GdMKuO1/t0d36hKPENkUzn8Hpx5UXhNMe4pYDaxbaCq9c4awSzhXVdkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1741077580; x=1772613580;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=I1Hba8bbmLLBwipihiisxxYbZNc7OugVE+5udUo17xU=;
 b=YarGAHglWTeVmXAJc557k9S34dKqnYBxcq1yTD8MFcl/PlwcxUx/NGmV
 DiuX53YkOliAMVssxja+ORkMPOpuC/fKnvI2FSuisxJUMTwIF5/E/1DyD
 m9VrQF7vyHh4Um4WLcp1mnUE12n3fGUyiC5C2g1LLQg7vyE+9pACsqILk
 ZIqYBqVQfmP9tJE9rmkUV+dfTfbo5P1B1D4mjJxxw5mZCvZ2pBVbVpcQz
 m1t7dZpwbKYCPxaWbV96LGugL5CSxGz9ZoXvwuLc9OriSqyMMP9Cloiub
 mgkdd2hYykF5vgpMA3mCIRVUYU6ybSkn5oYW6we4YTB04X7nC+EOE+3gy
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1Hba8bbmLLBwipihiisxxYbZNc7OugVE+5udUo17xU=;
 b=yUqdcTlyg+jPOdkJ/ATah+g7A86ucR0exJyFw4PrfrGQNhkxFgE90RAHYj/GtbJ2AV9rLeAJABsc3Clgx1dHmOjATwJfe8AKNmGMl/Bz+2mdvC3iQ8b0lRNsMhihHJ4y2ROPh9kPEwJUDE3NrHhjVT5nM3BDqc4oaa1HNBs6K0w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=YarGAHgl; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=yUqdcTly
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v6 3/5] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 24, 2025 at 09:50:19AM +0100, Niklas Cassel wrote:
> On Fri, Feb 21, 2025 at 11:55:27PM +0100, Romain Naour via buildroot wrote:
> > 
> > Note: We want to create a list of dts files (LINUX_DTS_LIST) present in
> > diectrories listed by BR2_LINUX_KERNEL_CUSTOM_DTS_DIR. But
> > LINUX_DTS_LIST must not contain BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
> > paths. Use GNU 'find' print format %P to print each dts file path
> > without their respective dts overlay directory path.
> > Do the same for LINUX_DTSO_LIST.
> 
> Personally, I would drop this Note: from the commit message.
> 
> I think that your commit message is doing a really good job of explaining
> the problem (and the solution), but I don't think it needs implementation
> details like this in the commit message.
> 
> If you think this is important enough to keep, then it should probably be
> included as a comment next to the definition of LINUX_DTS_LIST instead of
> being in the commit message.
> 
> Regardless (if you chose to kill it, or to have it as a comment), I don't
> think you need to send a new version just for this, it could be fixed up
> while applying.
> 
> Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>

This series seems to have stalled.

Did you decide to wait for 2025.02 to get released before applying?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
