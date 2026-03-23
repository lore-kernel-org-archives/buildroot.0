Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20D5F46139
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 15:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743D240B00;
	Mon, 23 Mar 2026 15:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_ffgGJhzLq9; Mon, 23 Mar 2026 15:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8231240B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774279894;
	bh=tMTwoEXH3Jef44jr9Hutsac5u7WNQlMWGLIMDU/Ssv8=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B5P8dQTtSzWiHLoSL+RuyF4VbowVxFjoHsbp6DAJFVAqDJbNN8SzCKc3WKwKhg7kr
	 omQzXEYn8+gAMLZwhz09UuhtXtiJkSw9BOeXZ+/lbPCSaD89H71Si8qQy7sdZHdjam
	 lmsji8IcDhz3XCntuVvt5cucrrE2oqml4qhRVTdkPowOiqNcuoCAjGJ5DoqzcfZwDb
	 YPKm43d/e5dzDq1qr+WmQh94tZJ1Zd2S5M1IXoptyUlla+nPh3qMbwWLtKVnGzV3yO
	 ZkN6RPZpkz0awblHYyKkX3bGc4pgosWtNt0ZCvhLduscsO3BopelMilZuqM36tBAyo
	 8/sHRu6gdxrqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8231240B07;
	Mon, 23 Mar 2026 15:31:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BD41D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0C24020B
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3wVO10dF4in for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 15:31:32 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26FD7401E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26FD7401E0
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26FD7401E0
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrfX4v0PKSEfIiN8e14Ufh1wozG9G4v+Am5uBMjObyO2fsp+EFl43QbW6JTLtencp5UzBymEyK3pG63SEqHRS9HlEP4DJauKt81g6FyZf1NjhcWFVct/6FXPT0ad3kCXvPpSGP2nJ9rFq4O8+Yx71orVOstByvoZOpJX5K5TKzVty2OAfW1rSGtwT6olxnLihLAewU3svq6fEvUJ2Ei20rbd/J31KR/lpxTNbNIVri0Vmt9J6XO7rZ4GOzoWCFG3pC/B1tCE58IUfU8j740zFlQqdNUeU4dLjqDmlN66B5XzzjQjNKzK01Cx6mE7AYypeAwcKztFcL4ncOYDtt03tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbF+i2vwDGxL7Xxw5l3ixzw0fGw+jdLzqk/KkevwLXQ=;
 b=NS9SIy/+2Rkb38hFEU0RzO3+6SsPhAfxi9aDdjz6bhBNmZ8RBpwcjb3qg1gCz3nXD4dCE2w2EpxA/N9sMJPkEg2YGVlIk+9z3ZzfsKk3wNwura8SnJGVo+LRGamu0m2Bj0Q6ztA2dPfPSkek8Hmo1HARfkz/qKCEiWs/3dvCitfoiQT8f5QeRNRmHQvgKpihLBXIC8n25sqiaCrH/HxbLlDJ0YxEn4AvypcmHKTM7mpFFeQW5ffeW4tg01vHA4hjoaF9FhAQaAYuZW+h/HOe2M/od9OlkswLI19nn65furHgBQnFhl+HYlAbllpiWqRdEBJNEbn1sXrD4oJOB1PBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.25; Mon, 23 Mar 2026 15:31:28 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::2e) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 15:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 15:31:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:31:27 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:31:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 10:31:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NFVR5b509899;
 Mon, 23 Mar 2026 10:31:27 -0500
Date: Mon, 23 Mar 2026 10:31:27 -0500
To: Romain Naour <romain.naour@smile.fr>
CC: <buildroot@buildroot.org>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Message-ID: <20260323153127.yxa4m5meoi5jdpsf@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241014-optee-cleanup-v1-1-70a2fa042ba1@ti.com>
 <0f2cc081-c2e2-4c73-8ac3-11d2ad13e919@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f2cc081-c2e2-4c73-8ac3-11d2ad13e919@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 86301ae9-6062-42bd-49c5-08de88f14054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: xDaCz6nOlTsh+zodg1kktaQff1YzgwomJDZ/S2ICKSDqmrGikyet2qwosVWEPolHd2T+XmUi5gQYFNAY/l2tNlXXjH6TIYPGjSyxg+OohmD/hB47KHONFn2Ld89jvnlqBiKD6sr/NW1IxzQE1VAayLkc4WBib6dxHjcqg+duHBKHC8YmJCiKExyAbJe8F+wQM3MJVEZYUc111rJop2MAXmHEPbRClmZfWPf9s8zHqkmPk4Mazy6X+iVMhPlBBBNIw6v0uxyIIxexxetxwx3oMflwsOo+45uKfWiC++2nY/78AycvCSTfYaXBCqPr8HAGdFMh2dOdfxpjvg7Ka+K22+AVz7pslsCDNuvEL+208lJByD87oxtu5kSRsAE+RbOLd5gjd45XN2gJAMUBG6xSudsGTCFbipn/M+tvMxPeEmzQf0OyZkhTfJSLt+pB1cdJo7obIqWAfdcCw2XNVRSTIsCegr3WoQy5m5w5um4ihX4MvgWYduIQ6GczJ2B5D3gFihcgSZ4DGYL0lB0MnJMwp1VqOzBGLnMMO7n4Ry+hn8UQnXNR8M93pDwHB34XK/smjVHiXBebHTB8OtzMZJJiZzrZrwqSvjmJK5p/aKUHPVgcDhGRqJoQ/iuu+5yhPYAM81hfLyNrBpacaZ68Tj0mrzC09cHbBrURDnJt0KpLWMhYHG3SS//MWIwnrbRH0cnczQ+t6F6+B4F2GY+hXLdTS2BVJss1NB519+WfXY4DwBZQ2q9xsKeKU5ShDHWoXz3auZtelbVHnAfWOvkshFcbgg==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xkDxBoSTGi/v9kTWZiLOueqc4EFQNr+YSxibhwxhvkOU9a+fLkduI2pAx9IuJplNwDiqYOe/TAq2xLM755tP1b8mDdghpoZDpb8okxyFUHns7nK3+DgfWO3JozOE9SRtiiMWOHtrOjcuXJbSA01ADUq7KyA82pQS3aLwnkLjQ2p7Ekh3Glv+IftzTSLi7ZX6U/cJzkOU/0HIcQp0NO/ZXC0ugLWDIiYgCE3RWTdA+By7aiGEgX5A/GlQ/EvwzhJxh8UBYgOalfW856TLdJit2FNDQfMkMl409aHPst9AgY69ja9AugwOx62B5RootOw4AG6yB0f8RSyULIto9XHypzvFEPHiDHZIxGrQBDWmCMQVgk7uwLPgGD6AhAmnNAGPSgwMtdpqelXDTMHd5PVOmRC2RmCHUft7yF+CpX4KtkFwAJWF+/50i7UXsD6XkEVc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:31:28.0023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86301ae9-6062-42bd-49c5-08de88f14054
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbF+i2vwDGxL7Xxw5l3ixzw0fGw+jdLzqk/KkevwLXQ=;
 b=PqHs+jzjfGF6/Gd3X/6m+Ky4saSNSwmRYpPkBZkXW2/Bgt30I8Qs7pErbeK6pcji6JjQx9WMYBN8lHoKB2QTTqfOU8aaLuBMYv5hBjN5eR8iM0/GY9+qSuir1rC7gE2VLmEDB6A6CZyzVqijvw/koCd2juPKG6dM6TNOkAMWdFk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=PqHs+jzj
Subject: Re: [Buildroot] [PATCH] boot/uboot: make OP-TEE binary in U-Boot
 selectable
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTWFyY2ggMTcsIDIwMjYgdGh1cyBzYXlldGggUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Q6
Cj4gSGVsbG8gQnJ5YW4sIEFsbCwKPiAKPiBMZSAxNC8xMC8yMDI0IMOgIDIyOjA3LCBCcnlhbiBC
cmF0dGxvZiBhIMOpY3JpdMKgOgo+ID4gVGhlcmUgYXJlIGEgZmV3IGRpZmZlcmVudCB2ZXJzaW9u
cyBvZiBPUC1URUUgd2UgY2FuIHNlbGVjdC4gUmF0aGVyIHRoYW4KPiA+IG1hbnVhbGx5IGFkZGlu
ZyB0aGVzZSBpbiB0aGUgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fTUFLRU9QVFMgZmllbGQsCj4g
PiBhbGxvdyB0aGVtIHRvIGJlIHNlbGVjdGFibGUgZnJvbSB0aGUgVS1Cb290IG1lbnUuCj4gCj4g
SXQgc2VlbXMgdGhpcyBwYXRjaCBpcyBzdGlsbCBwZW5kaW5nIGluIHRoZSBCdWlsZHJvb3QgcGF0
Y2h3b3JrLi4uIHNpbmNlIDIwMjQuLi4KPiAKPiBBIG5ldyBvcHRpb24gd2FzIGFkZGVkIGluIEJ1
aWxkcm9vdCAyMDI1LjAyIHRvIHNlbGVjdCBiZXR3ZWVuIHRlZS5lbGYgb3IgdGVlLmJpbgo+IFsx
XS4KPiAKPiBJIHJlY2VudGx5IHVwZGF0ZWQgc29tZSBCZWFnbGVib2FyZCBkZWZjb25maWcgYW5k
IEkgbm90aWNlZCB0aGF0IHdlIHdlcmUgdXNpbmcKPiAndGVlLXBhZ2VyX3YyLmJpbicgdGhhdCBp
cyBub3dhZGF5IGRlcHJlY2F0ZWQgYnkgT1AtVEVFIHNpbmNlIDMuMjEuIEkgYWRkZWQgYQo+IG5l
dyBvcHRpb24gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUFRFRV9URUVfUkFXX0JJTiBbMl0gdG8g
dXNlICd0ZWUtcmF3LmJpbicKPiAodGVlLmJpbiBkb24ndCB3b3JrIHdpdGggVEkgU29DcykuIEl0
J3MgdGhlIHNhbWUgY2hhbmdlIHRoYW4geW91ciBwYXRjaCB1c2luZwo+ICd0ZWUtcmF3LmJpbicg
aW5zdGVhZC4KPiAKPiBTZWUgaG93IGl0J3MgdXNlZCBmb3IgdGhlIEJCQUk2NCBkZWZjb25maWcg
WzNdLgo+IAo+IEluZGVlZCwgb3RoZXIgVEkgYW02eCBib2FyZCBkZWZjb25maWdzIG5lZWQgdG8g
YmUgY29udmVydGVkIHRvIHVzZQo+ICd0ZWUtcmF3LmJpbicuIENhbiB5b3Ugc2VuZCBhIHBhdGNo
IGZvciByZW1haW5nIFRJIGRlZmNvbmZpZz8KCkFoIHllYWggdGhlIHRlZS1yYXcuYmluIGlzIHdo
YXQgd2Ugc2hvdWxkIGJlIHVzaW5nLiBZZXAgSSdsbCBzZW5kIGEgCnBhdGNoIHRvIGZpeCB0aGVz
ZSB1cC4gVGhhbmtzCgp+QnJ5YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
