Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BBAF4613B
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 15:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CFF881E88;
	Mon, 23 Mar 2026 15:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur8Ui_-vp-kn; Mon, 23 Mar 2026 15:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9087D81E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774280231;
	bh=rg3qFY70cJRbMskgyQfA5LtTgtOCxP9I7BKCi2xduZQ=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lWH1n3W1/mGsgRzEJzLpRhM/xbKbDgQBCpZnYmEHaS2ODEbSdZN6yD5zTjmSe8dIO
	 bYhx1l898yTImezgGH5jto4v57Pl7Py2EnrC9+nMvObPwE23JnJ14ixYXtcUsvJtlc
	 JILWEuE9V4jRKG+kIIIyJ7kqDaiZ5pQMXOAlzthf8W4yQIYKK0LlUBRfbCWLmR5pKT
	 unjXFKLvEU7QIMFC6twli/ivvenmSGvBuGWkv4KkcsY5fzFjA0c4/MaCvGkFOcvJHJ
	 +jqTt/YzSbiH0E2zcIS1DIGbHHTcojmRzcTh9kGo+SOg/bdQxNYlZIQvm/8MihKqPR
	 B5CBItbmvWa3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9087D81E38;
	Mon, 23 Mar 2026 15:37:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D8AF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39DE980E91
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3OmfRIV28qP for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 15:37:08 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B68F80E72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B68F80E72
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B68F80E72
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:37:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2leVvHAA63agvALWl5vlwfWE6Ogd4n8f/Um5MwazRrGdr3AVAhfyHTBtkP2NMkt1aVwO2OIq/Pu/BxVTlZiSmP4O/EfYzaiQhFFx1jPmkw5cM90mvYgufH9BQPV56foe4Ik79ckKgi1tfUKq8iZwaFnop/NZRFa+iJM+QVVu6ITwfVoev6tWvpwH9i2sfy7d/bK1rhEV31d3LYRU/2eJHa2cLhSHuPQVz6ar0SpHJmUadL3heG46adM0Dd1JPApTAE3moutAMSQsPPvmquqLg8ZOCBAYyI3JucuCIfpI+WeKgrPa3ivKiaIOi9iQjoCde3hkKtmeT1Jkre4Z6UWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkWAWAzkUVYXqwlmp2U/mlo18SpvmDrhjZCNQflTdC8=;
 b=HpbY+JVjdy4sE3yu2jGRco+pjyES3Qche2mErvZSM6n/ZF5BAJF+Mmwjyi+nKSB43ytgcDMKNmHEgSgVcVlc+sEwiLH5kdUI4/b0yI+jmORHgcvvk7gc5rKCBaUMVVvF2xYOq1xPxM0+3PDDfzGYPbugHC2Deza/LXUa3hHLYCS/8G4QNp6pTjP23R+onzUUmSGqSyzj2j2SKtjGkH9JamXmRN2K1Z7dk6M9A+3yjYi3gGGCBQabr1pFTtY65aZFkVP/sS9ehZas0p7c5WZ2A2kiGmBOZpf60bqoIhWkHPUb3v2eXkr1SARKLHNqIuMf2CPtkvPsMvs/rPA9OCXSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BYAPR11CA0098.namprd11.prod.outlook.com (2603:10b6:a03:f4::39)
 by SJ2PR10MB7733.namprd10.prod.outlook.com (2603:10b6:a03:57b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 15:36:56 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::83) by BYAPR11CA0098.outlook.office365.com
 (2603:10b6:a03:f4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 15:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 15:36:53 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:36:52 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:36:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 10:36:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NFaqLp1000692;
 Mon, 23 Mar 2026 10:36:52 -0500
Date: Mon, 23 Mar 2026 10:36:52 -0500
To: Romain Naour <romain.naour@smile.fr>
CC: <buildroot@buildroot.org>, Dick Olsson <hi@senzilla.io>, "Sergey
 Matyukevich" <geomatsi@gmail.com>
Message-ID: <20260323153652.su6j5jnlyrtr2evf@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
 <20251204-uboot-bl1-v1-2-ce8e01d73906@ti.com>
 <a0243741-5266-4acf-a9f0-8c075e95811a@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0243741-5266-4acf-a9f0-8c075e95811a@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SJ2PR10MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: bd09086e-0732-49b5-e125-08de88f20222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: zlNIeEd+56Nfh8L0+1eUGl3rAOuxaHVMSRc/2n8P/nOtCATW2oFPhTbvQwHLkoaUzilYSlJ633S87OC6/dz1VkLQyNVWMWzhRzPBJguNbEaGfKTYjVynXQK9lEZ+7Sk6TjTHRT1Ri91SH6O5J8BHRe3+j1YEFEIqEOlEUGNsF8djE+B3cd+leLQ1hzcbenMrP26jn4Qu510ZeFVQ9bGomQv/lPUPmf6tGli4ZlFXKlILjTFBEdeD3e3pxgklPfUHsBvBAWlB9xu1/nlcKCGncKQL3a/+25w4RezgNJnX+GOE8khmvv74G/vd0IHdC8GEhRl1TwiGBWBwM+PZWJZiBZOOzXErWDc5aK7xJVoBeuDx8rAiA0UM+gCZKWyRZizsArPtI7a4Nly+yCJT5ySqBK7iZBLWBgxLZIL2fHGJ7KsdFJX32w3NkBOx1JneBWMCsgeidjlqVCVgY8AnPuvW03RvtFW5fgA9MpOQnoa6fo3wRdmqMP4KAs52w++0I7QNtmHG746BJW2qfsMC6N17mioSZbZXq0QZWfO52cy8j7ybUbqfrIZT6PLZ5Yvpkn6IfNqCFc+dCtCXSTKZvwrtvw3qiTx+tDtdIbk6teU7tvdrOl93ZgaeNzeCvI4WDMRJiBnJKTlx8QITelVzu+nkN8AWqYIxQ5j0oFSsx3iIAk5R7O8qzansjYso8+HHKCo9BNXJJeg8fANLScP0fBkvTCyyy6Z5Fgpw3NB70CKPii0gGRk2pd4MNP7QIGEoIaA2NVurm/elVFQqEqoCHRq0Hg==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C2xIMZr0gUWvsk1Y9h8nRcoXbC0PeCsAjSS45/bG52aSGdbcBBQ79FT1iDBu1552ZTd+nLfxrhIpXJOLTQwUUscVzJUzsV6fL9TyiGtVa6dwDJssaiK1lBzjzm9tQXJH5DNa94hYO1vVDMvGlQQfd7y8Km2B2o0qnbJGumd2r/Ii8Yx4H/91S30THld4fiZ1L0kQ7g+jcn+iLHTx/IzmPTp388mgJZLizpN9y+U8CGhQ/YkrMWANBqBV5mfChkaZpZczdY02gcbJ7E+XTVXInF1K4P5Ic+sDS0KHsBl52XoI4XkSCZ2FIctSVrI15OWpmhoxxVyDYRJlRdobAnUGUktO4+0TxX1QAH3Nb2vt30FFAJJSGYjSJ+R0kk3lEQ9nuwN8SeB5oCfCYJ5TadH+vVL3HOpuZEPvG41glvOU3MaF4qF6dJYCvQvc9iwJ55eD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:36:53.1266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd09086e-0732-49b5-e125-08de88f20222
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7733
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkWAWAzkUVYXqwlmp2U/mlo18SpvmDrhjZCNQflTdC8=;
 b=QuSXu1y0DXI5bPLZT3vUEtSnzwtypCgpUNnqHxYg4qJIiShXp0X0Hj79IOJetnYTZkPdX3gF50UvmVsUvvTNHbqAdgxNDtV2wKXo206HJtgCw1Vc+LeUpTJu2C77vnGJTQG8CksL7GQOD/YQd4XtOcnxB1iCHSJ8Gr1U0VABEBo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=QuSXu1y0
Subject: Re: [Buildroot] [PATCH 2/2] boot/uboot: add option to add TF-A's
 BL1 as a dependency
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

T24gTWFyY2ggMTYsIDIwMjYgdGh1cyBzYXlldGggUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Q6
Cj4gSGVsbG8gQnJ5YW4sIEFsbCwKPiAKPiBMZSAwNC8xMi8yMDI1IMOgIDE0OjI3LCBCcnlhbiBC
cmF0dGxvZiB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gPiBTb21lIFNvQ3MgKGxpa2UgVEkn
cyBBTTYyTHgpIHJlcXVpcmUgdGhlIEFSTSBUcnVzdGVkIGZpcm13YXJlJ3MgKEFURikKPiA+IFRy
dXN0ZWQgZmlybXdhcmUgQkwxIGJlIHBhY2thZ2VkIHdpdGggVS1Cb290IHRvIHByb3Blcmx5IGJv
b3QuIEFkZCBpdCBhcwo+ID4gYSBzZWxlY3RhYmxlIGRlcGVuZGVuY3kgdG8gVS1Cb290Lgo+IAo+
IEl0IGNvdWxkIGJlIGludGVyZXN0aW5nIHRvIGhhdmUgYSBkZWZjb25maWcgdXNpbmcgdGhpcyBu
ZXcgVEYtQSdzIEJMMSBvcHRpb24uCj4gCj4gV2hhdCBhYm91dCBhZGRpbmcgYSBkZWZjb25maWcg
Zm9yIHRoZSBuZXcgKHVwY29taW5nKSBiZWFnbGViYWRnZSBbMV0/IChldmVuIGEKPiBXSVAgb25l
KQo+IAo+IFsxXSBodHRwczovL3d3dy5iZWFnbGVib2FyZC5vcmcvYm9hcmRzL2JlYWdsZWJhZGdl
CgpIYSB5b3UgY2F1Z2h0IG1lIDopIEkgd2FzIHNlbmRpbmcgc29tZSBwYXRjaGVzIGZvciB0aGUg
NjJMIHJlZmVyZW5jZSAKYm9hcmQgYW5kIHRoZSBiZWFnbGViYWRnZSBiZWZvcmUgdGhleSBhbm5v
dW5jZWQgdGhlbQoKCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJyeWFuIEJyYXR0bG9mIDxi
YkB0aS5jb20+Cj4gPiAtLS0KPiA+ICBib290L3Vib290L0NvbmZpZy5pbiB8IDEyICsrKysrKysr
KysrKwo+ID4gIGJvb3QvdWJvb3QvdWJvb3QubWsgIHwgMTMgKysrKysrKysrKysrKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYm9v
dC91Ym9vdC9Db25maWcuaW4gYi9ib290L3Vib290L0NvbmZpZy5pbgo+ID4gaW5kZXggZDQwZTFl
OTVlMDdhOTUwZDNlYzQzMTNlNzEyZDRkMDFmYTI1NjA4OC4uOWE3ZmU4ZjQwYjI1MzJhOTc4OWI5
NjY2YmY5YTNlM2QyZmE5ZmVjZSAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvdWJvb3QvQ29uZmlnLmlu
Cj4gPiArKysgYi9ib290L3Vib290L0NvbmZpZy5pbgo+ID4gQEAgLTI0Miw2ICsyNDIsMTggQEAg
Y29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfWFhECj4gPiAgCSAgdHlwaWNhbGx5IHRoZSBj
YXNlIHdoZW4gdGhlIGJvYXJkIGNvbmZpZ3VyYXRpb24gaGFzCj4gPiAgCSAgQ09ORklHX1VTRV9E
RUZBVUxUX0VOVl9GSUxFIGVuYWJsZWQuCj4gPiAgCj4gPiArY29uZmlnIEJSMl9UQVJHRVRfVUJP
T1RfTkVFRFNfQVRGX0JMMQo+ID4gKwlib29sICJVLUJvb3QgbmVlZHMgQVRGIEJMMSIKPiA+ICsJ
ZGVwZW5kcyBvbiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFCj4gPiArCWRlcGVuZHMg
b24gIUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVUJPT1RfQVNfQkwzMwo+ID4gKwlz
ZWxlY3QgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDEKPiA+ICsJaGVscAo+ID4g
KwkgIFNvbWUgc3BlY2lmaWMgcGxhdGZvcm1zIChzdWNoIGFzIFRJJ3MgQU02Mkx4KQo+ID4gKwkg
IGVuY2Fwc3VsYXRlIHRoZSBCTDEgcGFydCBvZiBBVEYgaW5zaWRlIFUtQm9vdC4gVGhpcyBvcHRp
b24KPiA+ICsJICBtYWtlcyBzdXJlIEFURiBnZXRzIGJ1aWx0IHByaW9yIHRvIFUtQm9vdCwgYW5k
IHRoYXQgdGhlIEJMMQo+ID4gKwkgIHZhcmlhYmxlIHBvaW50aW5nIHRvIEFURidzIEJMMzEgYmlu
YXJ5LCBpcyBwYXNzZWQgZHVyaW5nIHRoZQo+ID4gKwkgIEJ1aWxkcm9vdCBidWlsZC4KPiAKPiBX
aGF0IGlmIEJMMzEgaXMgbm90IGJ1aWx0Pwo+IEl0IHNlZW1zIHRoYXQgQlIyX1RBUkdFVF9BUk1f
VFJVU1RFRF9GSVJNV0FSRV9CTDMxIGlzIG5lZWRlZCBhdCBsZWFzdCBidXQKPiBCUjJfVEFSR0VU
X1VCT09UX05FRURTX0FURl9CTDMxIHNob3VsZG4ndCBiZSBlbmFibGVkIGF0IHRoZSBzYW1lIHRp
bWUuCj4gCgpUaGF0J3MgYSBnb29kIHBvaW50LiBMZXQgbWUgdHJ5IHRvIGZpeCB0aGUgZGVwZW5l
bmNpZXMuCgo+IChhIGRlZmNvbmZpZyBleGFtcGxlIHdvdWxkIGhhdmUgaGVscGVkKQoKeWVhaC4g
SXQgbWF5IGhlbHAgdG8gYnVuZGxlIHRoaXMgcGF0Y2ggdXAgd2l0aCBhIG5ldyBib2FyZAoKPiAK
PiA+ICsKPiA+ICBjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMQo+ID4gIAli
b29sICJVLUJvb3QgbmVlZHMgQVRGIEJMMzEiCj4gPiAgCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRQo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsg
Yi9ib290L3Vib290L3Vib290Lm1rCj4gPiBpbmRleCA3YmQwOTM3ZGYyNDI5NjkyYmY1M2JhN2E0
NzVmMGYxOTc4N2VhYjQ4Li41NmFiZTFlMzY5NzQxZmIxM2Y0MDNkOTkzYzViMGM1MGNkZTUxODcx
IDEwMDY0NAo+ID4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ID4gKysrIGIvYm9vdC91Ym9v
dC91Ym9vdC5tawo+ID4gQEAgLTE4NSw2ICsxODUsMTEgQEAgZW5kaWYKPiA+ICAKPiA+ICBpZmVx
ICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzEpLHkpCj4gPiAgVUJPT1RfREVQRU5E
RU5DSUVTICs9IGFybS10cnVzdGVkLWZpcm13YXJlCj4gPiArZWxzZSBpZmVxICgkKEJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfQVRGX0JMMSkseSkKPiA+ICtVQk9PVF9ERVBFTkRFTkNJRVMgKz0gYXJt
LXRydXN0ZWQtZmlybXdhcmUKPiA+ICtlbmRpZgo+ID4gKwo+ID4gK2lmZXEgKCQoQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19BVEZfQkwzMSkseSkKPiAKPiBJZiBCUjJfVEFSR0VUX1VCT09UX05FRURT
X0FURl9CTDMxIGNhbid0IGJlIGVuYWJsZWQgYXQgdGhlIHNhbWUgdGltZSB0aGFuCj4gQlIyX1RB
UkdFVF9VQk9PVF9ORUVEU19BVEZfQkwxLCB0aGlzIHBhcnQgaXMgbm90IHJlcXVpcmVkLgo+IAo+
ID4gIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMV9FTEYpLHkpCj4gPiAg
VUJPT1RfTUFLRV9PUFRTICs9IEJMMzE9JChCSU5BUklFU19ESVIpL2JsMzEuZWxmCj4gPiAgZGVm
aW5lIFVCT09UX0NPUFlfQVRGX0ZJUk1XQVJFCj4gPiBAQCAtMjAwLDYgKzIwNSwxNCBAQCBVQk9P
VF9QUkVfQlVJTERfSE9PS1MgKz0gVUJPT1RfQ09QWV9BVEZfRklSTVdBUkUKPiA+ICBlbmRpZgo+
ID4gIGVuZGlmCj4gPiAgCj4gPiAraWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9C
TDEpLHkpCj4gCj4gSnVzdCBhZGQgQVRGIGRlcGVuZGVuY3kgaGVyZQo+IFVCT09UX0RFUEVOREVO
Q0lFUyArPSBhcm0tdHJ1c3RlZC1maXJtd2FyZQo+IAoKSSBsaWtlIHRoaXMgaWRlYS4KCj4gSSds
bCBtYXJrIHRoaXMgc2VyaWVzIGFzIENoYW5nZXMgUmVxdWVzdGVkLgo+IAoKVGhhbmtzIFJvbWFp
bgoKfkJyeWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
