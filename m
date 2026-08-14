Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E22C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C708143A;
	Fri, 14 Aug 2026 14:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPU9-3K4EcQX; Fri, 14 Aug 2026 14:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39D318143D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717406;
	bh=am4tzZxMrCMyAhJ8/xnRBkeOInYjUF2dqrEYCHXIeTc=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPP3BD/DJqdlf4B8iqZO/R3OyXCRCDD1wxx5nENI1GZ93IuOLmEnqpKawMiU1s+lG
	 QzA7Nj7slRuAf6zvuFWITVfP1uxjhLkD+xYdOrIIVIJsJ2gLYp1kBStlcaQmR+xlEH
	 tEOOiwfmin8CTIwCrG0Z/9cgYiWKPP6F2+HYJAxMhbBYEdHKpzRPDiyxavjBzXyuhb
	 nznB13/LZJmyYz54ewszn3C9br1IWiQnG4k71SjVIFj+5vJgSJ8rGCEbE9Oz/N59ME
	 OpNd2l6sSVcsRdP9/oHQlffmfi/1YRM787EeU2gXAnClDRFIXIyVU/Wv0BRjzLSx36
	 LtNGUUEfseX8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D318143D;
	Fri, 14 Aug 2026 14:23:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8DE13A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF6B9400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhqgD7aKztyW for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20f::7;
 helo=osppr02cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0BF64011F
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0BF64011F
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=HACw4yGc
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20f::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0BF64011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhRVMNK/xV+HbCszKkkzkejjcaFsAnJaJpfWWZ5OKcon1YLo9QdAU7QWrLW7527gjkPeVUcpUdciI0VKgx1drZwaDOvFiolZN30TKMJLIT+cn/WFc/0wGVVGNwm/7dpg/qb/IkCyVycNQWHS7bBCFAgYtnThDecTa658GMSnqHQXCarO0WN6459IMVlpc9RHF+sQtaVg+bdSXU5e0M+tqiaTaWqMeZKInXqd0j1MiCH49YsJsUv8ZKzrjkMN16Qeeg2Q2GOVjWtFzmgKZoAUh2LmdXRMxu+tmpqMWozXXpGu5oOFvEJ21Sc5Y5iGpmwadwoM/AXQBR9bNCbwV/QS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crdmypWOIarNxqtOfsd3HVpBS7aautWYI1a3Mygtc1c=;
 b=tZ5VoyVuhHZ0Z0jxlbENRl60dZw+bYRKt+aZpUcp/RRh04+x5KG+dQIrr8YyhGWMjOAjduBh/WEiCwAQXAcoLZcgxryDm5KkL7jW+uJjvdpn37Y+qQaMePuk0Ku5GkOjGknItlqMOJ7LeHBNLCxz+z9BTjrlcayVXAfQoFNFvW7skW91E2/UUqEcOCmnmp3tm84Oz617pR9yIrOi//Kfc0ZJd5wp4HzEpK50ydTgzjtqOUIAiInRsxdtP47MontRPgvX2lx2uK5NmPACmG2XccvZiO1NI178evTlEfD4qhQSnFMcV+AWu2WfRLncoqt+rsIK51YZI5Lwc6y8x+QFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crdmypWOIarNxqtOfsd3HVpBS7aautWYI1a3Mygtc1c=;
 b=HACw4yGcLjNyJFejsNOi3oyqtsCh8YKMh+MbAQvBqBDcs60IJ3vZ4Q0wrj5T85LkFvjFtufvJNpuuZFcG+BdSpGenqdlKZcTQhj3Ho4KYx1uq2jXlKzUYFQdBC6W3bh9owCYuk1inRp5oWmInHqYN/dxzfCcEzrmtgWOy3sCAcM=
Received: from DB3PR0202MB9129.eurprd02.prod.outlook.com
 (2603:10a6:10:43a::19) by PAVPR02MB9817.eurprd02.prod.outlook.com
 (2603:10a6:102:314::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 14 Aug
 2026 14:23:17 +0000
Received: from DB3PR0202MB9129.eurprd02.prod.outlook.com
 ([fe80::7510:e8c3:db37:47ff]) by DB3PR0202MB9129.eurprd02.prod.outlook.com
 ([fe80::7510:e8c3:db37:47ff%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 14:23:17 +0000
From: Kanak Shilledar <Kanak.Shilledar@axis.com>
To: "neal.frager@amd.com" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>, "thesamprice@gmail.com" <thesamprice@gmail.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "joseph@anodize.com" <joseph@anodize.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>
Thread-Topic: [Buildroot] [PATCH v2 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
Thread-Index: AQHdK+7+GqzaT9WrR0ORHBgoDo7syradmP0A
Date: Fri, 14 Aug 2026 14:23:17 +0000
Message-ID: <2f1a56870d7c09c92d467bdaa9822140f0324ff8.camel@axis.com>
References: <20260814131446.2547523-1-neal.frager@amd.com>
In-Reply-To: <20260814131446.2547523-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0202MB9129:EE_|PAVPR02MB9817:EE_
x-ms-office365-filtering-correlation-id: e005feac-7b9d-451d-654c-08defa0f958f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6049299003|38070700021|4053099003|56012099006|22082099003|18002099003|11063799006|10067099003|3023799007|41080700001;
x-microsoft-antispam-message-info: BfChBE02XAx9rUdQYUbpE0ScIosBJ71CIQ9Yr5yprX00C/V1Nlp331qO6g3I0cZb40peT43cquj5GfnJU/OkT5ylLO91ZMZT3epLgAS9n3YFNEFVmnDzBa04/jgmD0mLQiuyq7lCwGO0dTn2IVz9Lt3afzJdk4Qa+wJtlBHY9vOKfXdFYkM4+x2l4BMEkTyuD4MVvz6uTrDRaTbf9w8+3dburk7AM7UK9WVsqy74mId3lSTaHXziOlinzT+tvz9Ql8xkvTRbTRJX6+JTHHrqyEK5x3TrlaggXQuBytNevTDvMVbdtqoDaZRkUSsgqr9UvL9vLPxE4oQOGhk1XCQusF3zYDQkobTTFHV2kp6so8+oZBtrWuozvOmK+bglne4GI0T7QS01c9G5KHJ1k594Frh7BI/KeCR2WwPeBD1qUiHFo5TPQtSKMbMN0qo9SID8qtXCk7rFEiNrwAAl7DKT/eUaQEDpmOH53Vwe0YD641f6FVNYXWqFdom/cVHQI43xRZMxntPLbrOko4NEtFFOa0EgaPhKqSKKPSYphlJBdG9x9l+GihLJesgASKv92HMvvobAeuHpq5W5TCGW4L3MYHyG39MIY06F6Yl5QoWcWoJzA3RA6o/K1y8X9/ychY4AHRZ3PVZRLv0GSnuosnStJoUXsIW6DeEK1p84VYerJL8Kxjlx+p9HCqNYW2CauM2H6oz+ATMeywSnYdhnc7GOK1bjYI5Ohc9ofNlkwtosY7coq0yP1IyhmXrE4jbJw4/QpXQK0qO/3452nxD6U20L0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0202MB9129.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6049299003)(38070700021)(4053099003)(56012099006)(22082099003)(18002099003)(11063799006)(10067099003)(3023799007)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmtXYi9UcFBsdk94ZHFTbHBvSXVoUjJwd2pFa3ZJUHduZ1dmaU5reHdQSGJR?=
 =?utf-8?B?K3AwQkgyekppeXhFY215eGdlZHNJZkZrakR3UVR4anlQYllOU3VXUE9QeGVK?=
 =?utf-8?B?YzFIaW5JZWxsbWZML0tUMnJjdVBFYSs4cUMvcC9LbGgxV1lwcmFkU1JMNHFN?=
 =?utf-8?B?QkF1QkpSZTdRS1hYaUgzS0t4SmQ3QUVadnd3YWRPWG9wK2JPclFHWGlYS0NY?=
 =?utf-8?B?ZnFaN3BlN09UMVNlMlVOSCt6Q0ZOQm44cnB1TmFocjJXa2NYT2pjTWpmR1Fj?=
 =?utf-8?B?UlN0T2hZR0g4RytxaVdhVEN5blVBVGpMdmZIeVROUUZFR2J0alZWSUQ5Q201?=
 =?utf-8?B?N25pZlRuNTMzZUxIaTA3cXdMODhTSnBRMC9jdys5UTdwN2NtY3lBZGhRUXQ0?=
 =?utf-8?B?V2J1SjNGNFVncGc3bGRVZFFNYTZtMTJ2YXBUaEVUQWVoQWhSMTFkWXI5UG84?=
 =?utf-8?B?ZXgrZzVNWHV4WW5tWDQzOTJ6YXZOS2c2SWcrNEowRE1SOHlZbDdqUXRzaDIx?=
 =?utf-8?B?TkJIaWM1dlBEbmVwWWtEc0JGRmQ0ZlZvb0krc3JWUGlBUkdVOFAzeWo5ZWY5?=
 =?utf-8?B?cUdBTFZQOUpGR1JrMzBKSmVRd3ZJaGNFQk9RQWI4RnQ5WnhVYkZrZXVMcDBm?=
 =?utf-8?B?cUQ0aFh2S3lrYWZoTWoyVDVocVVRRzQxbmRTMS9XODN6UE50YTdUR2NqWlV4?=
 =?utf-8?B?ZnVhZWx3SkVoNGFnRUg5ZVZVcXNtZktCaDZpMnRDellROGxkUC8xMDhqSzJm?=
 =?utf-8?B?aGgybUVXT2RjTCsvK1BXWUEyNHZ4TFJNc3ZSbHJ3YWNYc25nZjZDd1lwVjB0?=
 =?utf-8?B?Mk5QTHVEOGl4dWZib3duQVVNajliRVFCbXhQSTZVS0dxd1Fpb3RMVFlKemd4?=
 =?utf-8?B?azNHQXJwTXlpV05LNHB6Vm11K0lEWERxdUhlUjRnTkhuNUFOeC9QeThYWTMw?=
 =?utf-8?B?MXI2SWo0aTdnblJlZTIrUTZzeVF1eG5PNDdRdElBM1NDZzMwR1NWL0I4dDR3?=
 =?utf-8?B?YjVpWlFLZTdBQU5lUE81Q0NPZnI0eHJyMjZ2WVVibjBJUlNwTTY5NXFNUWFs?=
 =?utf-8?B?aXZlTHFIbStuU1NWejFoRC96MjY2SVlabGhRdmxkOHN4VmZLQWFscEFMRkRG?=
 =?utf-8?B?bnFPY2pGb2JxNWV3WjFLMFBxMXFSS1FySWJwSTJ5bmdGVzFyaFRlNUpSUVV4?=
 =?utf-8?B?TzJCd29Wc05Tb3V6cXBDQmNSQXIvdWdRRTJaNmRXM0d2Z0JlUXJXY05zRTR4?=
 =?utf-8?B?SzllUDc1OXJ5aTVmMU5FejU2bDJaL0dwb0U4KzlFeXJuK3Q4aFFKa0I2ZFFD?=
 =?utf-8?B?bW5TdlFVblNZa1BJc1VQd0xWemlGSStxRGRpd2dCampkTXdBdHQ4bWhFMVQ1?=
 =?utf-8?B?SlAwSzJkdHpzNkpMdnNNRjdlQzc1ZFZYQmlKVlh4bG5TckJYdit2WXRLZmNp?=
 =?utf-8?B?YWhJSFowYUdCWUowWUttMW5GUEJBaUFWdGlpYkExMkIvT0NoTm9tOWgrN3Zi?=
 =?utf-8?B?dHMzOFcrQ2tTamJPV0V0ejlzTXMzM2lYSnh5bjFnZG5lZjhPUUtpVUJ1Nm5V?=
 =?utf-8?B?ejc2RnkzVkNvOG1MZjJTSjVWdlIwTktJT3FGQm1JR0tXQ3YxRTZ5ZFpqMm9u?=
 =?utf-8?B?cFhRNWw4TG5LR2x2anZtMmRzOUFPVlg3VGZ2Rlc0cjVGeXY5anVlcCtlK2Mv?=
 =?utf-8?B?RE4vbGg1SFhUajBwQkJaR0gzY3NLelJxVThkQytNcmNZbXV4SVpSL0t0REtw?=
 =?utf-8?B?WXAxZFN0RlNFUVMzVTJJV3FQRkgxS1ZBTlVZT1o3dE1neldoQ253NjN3SDlQ?=
 =?utf-8?B?d1dhVVlSQTRmZEVsWitZcEpTK0MwdDd0cjFKWHlOVnVXeFhPWE41NDNYUUNG?=
 =?utf-8?B?VEl1VEJDbnlZSkRtQzJzTzhjUzdXNS9kM1p5aU11SlJPOEw3RjlBYUlOK1hl?=
 =?utf-8?B?eUJIZGVRb2w0aTRaT2I5YlZScXp6MG54eUsvTzdRUVRBYWNyd0pPOCtmQ3FL?=
 =?utf-8?B?Z0NDNFRqem9sbXh5RDJIN2tXMDU4c1ExWC9ERXlCb2JsZUZvOVdtbGZuUGF5?=
 =?utf-8?B?UXZDc3hZb2ozMHpCdk5oZWtPWlRYYmFDVWRmT3NvQjlJS1NONCtMdW50TkJW?=
 =?utf-8?B?dEIwTjZmNzh3MTFHYXVQM1J1TVlRcllaaWx3RzZzOUlyanFRbnJlNlBVdmtX?=
 =?utf-8?B?WVJ3emlIRWs1NFBHaGJsMlBnTzM4Zy80dURKajVvUUZGeERmK3pxbHQwQ1ZK?=
 =?utf-8?B?OFJTMzNPVVdyQ2g3UUdaSUcyei9la05tWUp0MHIrQkJ0THAzdXlTQmhKaWRo?=
 =?utf-8?B?UFRLSm56WnNWREpnTUFySGZZOXRuVTRLRHBzMHFZdkpuQUIvS05IQT09?=
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0202MB9129.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e005feac-7b9d-451d-654c-08defa0f958f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 14:23:17.3703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yam5RMbUEKv5nF7XsnL9haz9mvDu1ivYW6xym+shBxYgfx891grr22y9kwmBQ4+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9817
Subject: Re: [Buildroot] [PATCH v2 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
Content-Type: multipart/mixed; boundary="===============5728463293290703725=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5728463293290703725==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-id3pCG11g8wxmkW9wSg4"

--=-id3pCG11g8wxmkW9wSg4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neal,
Thanks for the patch.

On Fri, 2026-08-14 at 14:14 +0100, Neal Frager via buildroot wrote:
> With qemu version 11.0.0, support for microblazeel has been folded
> into the
> microblaze target. This means that the run command for microblazeel-
> mmu needs
> to be changed to reflect this.
>=20
> See the notes in the qemu bump commit to 11.0.0 for more details:
> https://github.com/buildroot/buildroot/commit/9a5369effd22011b52b82c91f70=
2bacde690c41a
>=20
> Run command for qemu versions prior to 11.0.0:
> qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel
> output/images/linux.bin -serial stdio
>=20
> New run command since qemu version 11.0.0:
> qemu-system-microblaze -M petalogix-s3adsp1800 -kernel
> output/images/linux.bin -serial stdio
>=20
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - added missing endianness=3Dlittle parameter
> ---
> =C2=A0board/qemu/microblazeel-mmu/readme.txt | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/board/qemu/microblazeel-mmu/readme.txt
> b/board/qemu/microblazeel-mmu/readme.txt
> index 20fa0072ed..4d1e660650 100644
> --- a/board/qemu/microblazeel-mmu/readme.txt
> +++ b/board/qemu/microblazeel-mmu/readme.txt
> @@ -1,5 +1,5 @@
> =C2=A0Run the emulation with:
> =C2=A0
> - qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel
> output/images/linux.bin -serial stdio #
> qemu_microblazeel_mmu_defconfig
> + qemu-system-microblaze -M petalogix-s3adsp1800,endianness=3Dlittle -
> kernel output/images/linux.bin -serial stdio #
> qemu_microblazeel_mmu_defconfig
> =C2=A0
> =C2=A0The login prompt will appear in the terminal that started Qemu.
I tested this patch on master
(4146368857526dea1255355ea9beff81aaa42d09) and it is working for me.

Tested-by: Kanak Shilledar <kanak.shilledar@axis.com>

BestRegards,
Kanak Shilledar

--=-id3pCG11g8wxmkW9wSg4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRZbIB7R61KYt5yWsuslrbqDH4eIAUCan8kzAAKCRCslrbqDH4e
IGXUAPkB0ZkaAyMqDbwLQujnsGun262yG8IcCB66bJLQAa2mOAEAn1RAVJY8iqe1
ObtLx3x0qWzxi76Mg1SF4UvwbwZZkAc=
=0dmK
-----END PGP SIGNATURE-----

--=-id3pCG11g8wxmkW9wSg4--

--===============5728463293290703725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5728463293290703725==--
