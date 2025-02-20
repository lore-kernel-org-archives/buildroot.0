Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9253C021AD
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 07:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974A683ADA;
	Thu, 20 Feb 2025 07:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5t55O0iF_Qz; Thu, 20 Feb 2025 07:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 979DE83AE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 979DE83AE7;
	Thu, 20 Feb 2025 07:28:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D48F2D
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35C0403B4
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70GzyC3857bK for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 07:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF411413A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF411413A4
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF411413A4
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:28:38 +0000 (UTC)
X-CSE-ConnectionGUID: I7JA67u7R8i+rEF+wu+f8A==
X-CSE-MsgGUID: ss0QE6ZTQlWiQOa5//YSLQ==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 20 Feb 2025 08:28:31 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 23CFBB5A87
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:28:31 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 1A62DB5A86
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:28:31 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 08:28:30 +0100
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.171)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Feb 2025 08:28:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohEcPS25MdPx3zrEfW0Zs8zrVUEqjUEZu1iQTLRxINcpiJB+5STC+kMhyuIKERcXg4my64XBQs7auiN8dL7nvnZ0/zIge26u2VzZsG2KStyDcoy58ZYvsDDE487TmPhWb068Jv+tz4+phDDl4xh9/UhmHE4zqH+49tm145dsWVvuKuv70fhHqoNnAHBP2MJQmWcVx1Gqg/JySP6PSmm18ZFbDZ2ONDmCPTHLwsIOEHZ4rUy2XrdIb7lKrmOEk5Zi7w1d8sazijq3YqIDtlZcst78aNHVAbpLrIonr52kCmhmjJyU5bW0TuMkoGGpe2V7EF202bka98Iyi6b8mN2gEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5jIc2W4/IYU4tpSIeG3Sziu22WkIa4wjBzKxvEsWvE=;
 b=BNBktmG+XFVYsuah4Nln/z3OO3aHJ6noUoK24JcUsMRDjjC/LRITnFDnbpmv4CrAeIze8zThPbh89mRKEZVQTqlGvTvZPwdCBr/YBi39vdimN4f6hmJutu/ects64583LYQs0Irstq7wXOtTE7JP/hKGz/zkz2OvYYUzz0JckW8LQHCpNtBq/qGDO3I2T4JCy8FtmcKKDE3PVUWwhia1EzIkyE6vc9xrWk6I4UD7z1oEpV0N8Q4qXfxYe7R8E43sUaMpZgmqMNof2JIjPb/zfrZ/XyD5TMee6DBuc+Y71Biz4z5np9h1JLowez2AEmaTVN2OFSfQUxGqa2KJrcdmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DB9P250MB0595.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:334::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Thu, 20 Feb
 2025 07:28:29 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%6]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 07:28:29 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 2/2] package/libzenoh-c: bump to version 1.2.1
Thread-Index: AduDaOkEGZ/nroa+RoyRZOFuwVhnpA==
Date: Thu, 20 Feb 2025 07:28:29 +0000
Message-ID: <AS1P250MB0608C01490AFFE8F6CD5A1FCA9C42@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DB9P250MB0595:EE_
x-ms-office365-filtering-correlation-id: 42832a6c-b448-48b9-e199-08dd51802c27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qEeQfW9CEgye+cPGdFJc0RoO2cI90QXL/vJdMPaak7xA2E3Cea8gwp1qzQ5m?=
 =?us-ascii?Q?VM9UDNfeGzvfrq4QoXr2Zsn9woXHSogYyCUBYPUSoQ6BUypwu2l5I0lOrcYM?=
 =?us-ascii?Q?SDBJ6rT13uRtEHuH+ycKvFJ9RyNTdoYqVyHScgNdmL1gSW1GJe6EaJMe9kTR?=
 =?us-ascii?Q?TXU3ViCMuTQ9N6rTC5qbb4JTzYy5ukaRG1vMy/D2EPE1A969ZGqQo27PTiAC?=
 =?us-ascii?Q?NamYs7xLCC4FqLsVa/Wbq4tueMMUI6hnidoi5TfV7N/xPAJB10evAI3kQvDq?=
 =?us-ascii?Q?ao4fVhbPE66PJlM3JMEo72PZAAx64ohrW6Vf7KqPtSRrzJq37T3HJ5y8QW+Y?=
 =?us-ascii?Q?VNSmAY6ESbpZmwpcAlze9JVVK1wBftEe6OCu0BMr9c5CJQuZT4CmxP+uygy/?=
 =?us-ascii?Q?n1JnXq1WGRlv4zUQZiDtpi658HqsRSnEZPFemWtmo5VXgFVsj0IK3Fid8Mxw?=
 =?us-ascii?Q?9mvm0LPCYgM1yi1dlGqhHeafWrotdWQ1L9WfYO3ODIXPh8qtBQDaG4Im15hL?=
 =?us-ascii?Q?sQXJCrFHfL+ouBn9P+e4zAl7kZ8j+y1gvOZVJ2/hPrwcP1cooR4O8CPXmswK?=
 =?us-ascii?Q?0W8fTagGvlwMp5HtqIXLJUDUEXrYj2jVATj7ebbMe1xsTMTKHicsQQTqB5V3?=
 =?us-ascii?Q?OMIADcWZx3wvYAwDgh3BkZbfyI3xd5vVsKmnltm5RuLEUxSSta7ze3NgK0ye?=
 =?us-ascii?Q?51itcmGIzc4Ntc+u7pGjm7b/TVuK9VZqA8ImytRcGYV6bFNPA471NIR+CTsc?=
 =?us-ascii?Q?Bho/fWwrMrNBYuz+Jdt0/Lek2uCDMNv/QgeMM63JWecnAQWp1VOk8Oe78gSe?=
 =?us-ascii?Q?swl1XoN49aQday82GP+syrxzjiGgBX69+wfdxU8ctmHqzsO1If9VRult/6+s?=
 =?us-ascii?Q?XZd7eU3Vhu2bTdndSdwuJ16/Y2AsYX2Noioh/Vg5kq8YO8TUg1mJYPMhiiIv?=
 =?us-ascii?Q?0LzfNUagWsdD0tZtSkMLAD30o3YCt38FJydEelfE24TutxJGYoPUwDrxanNz?=
 =?us-ascii?Q?Wrf/wBK5t3qdSSgxA0Hxj9X34TUOksUDdnFphR8/WeyazDdPkgW4c8kiS2hN?=
 =?us-ascii?Q?cTeEsFjTsPuO9tQ1p3R34ETBMFBK2aYmILfc60xHAx6dVWdmqQ33NW2yJnb+?=
 =?us-ascii?Q?F1MNb+f+bgyRrG6C8SeSe5odq5FAGsK6bec3vx6vRsoiXJpPPbPsa4q/wMKg?=
 =?us-ascii?Q?i9oweAMyP+oN05EUXLJkSlm5F+OqOnIlNfdEt+rYCk0kG4g8++oMKdWgnYxE?=
 =?us-ascii?Q?1JKmGRA5+1YiZOKblwJCgCoairp1XH9z8xtqeNCFissi81imOn7jL4BDHTDL?=
 =?us-ascii?Q?Fpl0FpXl5/vIa+P6qoc8cDu40aSjUqK4WsIM2AXPTSDtU/tc7mYRlS7RPt6u?=
 =?us-ascii?Q?q2F9GLGteKCKE2DsosvNt1vIrXs2FQfMbo2+L73KKCxvRxFIKkr+YTtz8TKu?=
 =?us-ascii?Q?bELxJxmHRvwVTPOkBSoqmo/KPQaKTSgu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XE5hHR6Uizg2aLBhzPHIxyaXPVW2jWewYf+v32tQ7CK0rHwyVhkels1D0Idf?=
 =?us-ascii?Q?sBsY0UfF9dcWSb/jnn/OlOhct8gDbmIE8bQp3czK7jKuleqBnTq5Jk1evd8Z?=
 =?us-ascii?Q?EuH2pNOAP3wQmCcm07kshEhB0jG+nGkV1WBHX0ZRS/tN02oT6Zu1niHMwE/f?=
 =?us-ascii?Q?Ia++K/IbrX1OzWZC9EE6Rxf0+VIwdusgPDddZomzI9vcHyI5G3fRH3W6haKa?=
 =?us-ascii?Q?LNkuxA5G7IOXFo74xsbmjbZBcxd4DhsZ9DDKaO7FM5r8cMQtVVN4+ek4zsLC?=
 =?us-ascii?Q?DQzx4izRMx/IZWruH34R0tds03bVJdVKhLoJn7/fTxoZcC0YBErmrLaeB0Fz?=
 =?us-ascii?Q?6Nib3U3IXiWZC0TbO2RgSYZz9ohzn3mTisMYRoudO5zJwr9uVqw2QBm5pCEr?=
 =?us-ascii?Q?t7POlX/WmJKhi968NMuw4eZjsgWXM8QaPVojIgn0IeAHAniG/ODOvmDmFPR/?=
 =?us-ascii?Q?rG7nH8puuVoWMegiE37yK3ENXgS9zwm1EhzEvnGk4MFjysOZ0cyd4CseoOoF?=
 =?us-ascii?Q?O/Mc85K+niksZ1Kv429OcWdj6DiN/mm3ZCaVTZLNDiTLsLCu1kn/TPl9UT/r?=
 =?us-ascii?Q?ZPNOe5QorCcmwpMztcjgwYD3YNEQXDf1/6r0L5/5ugAa2wpdeMzzwQp8VsgF?=
 =?us-ascii?Q?8ziHlyqteA+DeqQKj1lDwVE8x5GPCx8zv2pREEJMqeq5jo4z5/jPD6A7wzEe?=
 =?us-ascii?Q?OfKfz/Vu6V9rAKIFVn+Zd9biIwq2u69VlSu3MH5/ZlgcbsYFGjI4FDXCSGKK?=
 =?us-ascii?Q?d1zXVYvroS/7r8QIDYATrbKTrPhKsjnxgCY5V2QW2Tr9U4mJ/iW4RGC4xXT0?=
 =?us-ascii?Q?0X5NUpIJe0MWa7UMNVye8nW+jh0gmoeiZwDiyTRxS+VzM0qpPqUbrhibjTcv?=
 =?us-ascii?Q?E/WQ9M+4b3nFpZPE+9CnsYjrCf2Qxs1st5nmK8Gbz38eAVfCHXEDRyz9gyqT?=
 =?us-ascii?Q?l8XsWvTWeGGkvqtmfxo0f2VBR+wOa6nt1y4ekEgaGyA/1AnR0H4zfupIVEVo?=
 =?us-ascii?Q?Qx8R/XbOaaWXLWBpULp75V2r9hi81DbEIM1nKOxWV+qm9829YOKI9PDS7QBU?=
 =?us-ascii?Q?SUdebp7Ubz0yT0zjthvL1m5VYh80oEwKLwG4khbxRyuoN1cJr5SZipOkJ/Ml?=
 =?us-ascii?Q?3V5nj3eqNtpiKvYvzrPLp9Ofn1Wh7hUkhVq9XAmuqcO6+cJLxA6CShL0fChl?=
 =?us-ascii?Q?9pSFMHhbTr68G0QymJAXQCtj5LXZGmroeTCmJTJCQ72vgFwMbVRvPX4DecxG?=
 =?us-ascii?Q?hbzZwVjRfU0pDUUstLx7E5koL3HnFPm8nGXaINEt1tD9f2R8na5i7+822Qs8?=
 =?us-ascii?Q?UWVG/sw0ooBby+Ra4NSgAkG4pTElWl4cp/XSOvHxopGWC7OO5UVBdSCWiwgt?=
 =?us-ascii?Q?a5mS7EXIljmYGYJsKISAhtVJwN0N9KLDkAZzMjTYnduamlxFXXtsuEQN8468?=
 =?us-ascii?Q?ZvGQr5agOqNOnRjj1+Dvox2QbTMC5wnu96BC7a+4MHR/Pmzxi1mzpaLJ2sjh?=
 =?us-ascii?Q?zzLq2oHTr0sGxX26PcUm2Uy9Kt4vZ7IS+bYschiSKE7TRXUOCQjTZ4MqCNqx?=
 =?us-ascii?Q?B3ylOBfmvPXhenL38NoVBs7FlN/5RbzH6ulwOp0IwyCqqfpx7hxQF06rbZKE?=
 =?us-ascii?Q?Bg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bhdFTQos/i2DNZoaM5d3neP0+Q6qNDnxJcKWURwQHLUrQ0BgXVUMN4FYq5j7ekZxG5NB7EXhyodR2QtH2ogJ0NFEjWm3caZLa10bYN0J4I3CZbsbVf8Y1H8Ma/v4elB8sy9yedWH58/X8NcmZTLv8UYQpM0KaY7WnMwtktjvvRROBOf/WdSx1oVO7KQ7KexjBT8U/SAOAhQbfrJZJ/bOhPrXQbpVq7Lxy67toLrFS1DyOqBLBiXNwcO4x9B4ouoGPaITO+G+HBZuBbXEuuePmPC2Mssghx51xS7zvYexezcj/B2OKBRBs15j92zjlTKAsg2Wytpicwvhp1IrNgL34kM9oi5WO7APPMcfUx85xKNvoyEj9aAEMtxgIgg7Mqp7/2DCmGW210SG5YeHKz932BuhFVPoy4EPeW+ISUvB4nYmTc1IdATAVMKlLTaZJxnU4r09EuNLx5gG2c3nngFpy5uD53hIiO6zG0a2YcutQUQe67vRPTO5sedg3Bq7TWiN7Wdq/kYVXw//XhAbLFTYatORtgQDEG4tPp+tHG2VdImJsDcVCwm3qCTJwCgP9uKsjtTv7BdawuqPx9kV0V+Sow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42832a6c-b448-48b9-e199-08dd51802c27
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 07:28:29.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EvQOLYvA3pBd0XzaPwc1uh6oDjo1JJNmjRCuJZKGYvTp+Zg3VbhSgbX9Se9R2G9fiGX9wzPaKKwPUVtDn/5n78bsEVkOqIHTUt6Oaqh5Hhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P250MB0595
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5jIc2W4/IYU4tpSIeG3Sziu22WkIa4wjBzKxvEsWvE=;
 b=QhjMtlphUgxGAUCKD/83VMLHOclnezpDWkSfUYRtnD85GCEv76PLTVyXZ/N75sIuvwfJJHLS7C3kcwGzQgYNtg+nWtlSQndA/njLYqUws7cIL+Z6K3NBx4ub1m5OoQ495HnEwI3TccVArHijLJ/p+3IQc3+37rKm/5vRwhHpz/w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=QhjMtlph
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-c: bump to version 1.2.1
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

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.2.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index f83e23eed4..e460392bfa 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e7a2bf47edaa5c73bb6dd44558eb2b1367a9e0a0bbbddead463df45c400cb54  libzenoh-c-1.1.0-cargo2.tar.gz
+sha256  71c27b1f715d184d842bc007bfcbbbec6c2af775ff3b607ad90d7bd4c3c91b6c  libzenoh-c-1.2.1-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index 9258db56bd..148edd008a 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 1.1.0
+LIBZENOH_C_VERSION = 1.2.1
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
