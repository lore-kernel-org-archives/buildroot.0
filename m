Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FB3FF8862
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 07:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD21360BF8;
	Mon, 27 Apr 2026 07:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMTG8Ch_blmJ; Mon, 27 Apr 2026 07:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C72E8615B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777276148;
	bh=pWv+JUwB5bm/rMq0sDNVOt5xiaBxTeWOWWix4Y/En24=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ru79hSOBfD3V/G9QYtejdsZlvGP33hMGC4ZP/0kgYggYOKKTr+Z1oLlWMT7pStu9p
	 Pb6NeLBHM/tyOlo8RRMHe8PmHZzlXDV/wZvG+Vz+PdK7B5+4CXtKR46G3om0B67uyw
	 N7vBkYQ1lXIE7qMN9CI3ap4hv1iZg2RYclpE9H/scudU6j8K53O10+9QUk/zxDtoxx
	 pGGrj8wasihzA5VHgLAmaoNIOjCpUB8Xi4nUw8Daxipcq9i9LfhwsSyjmiJzBD32fU
	 g3x/4k+UH9SIMIP44QuhXArQnz6tYsGlm6wvfvJgrv6OyU29y8bnT6P3jyO/fd6Ltl
	 WUmNVvevGy7GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C72E8615B9;
	Mon, 27 Apr 2026 07:49:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3E702DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 07:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3D5E85496
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 07:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coW79QjnSe9B for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 07:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85FF38548C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FF38548C
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85FF38548C
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 07:49:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKPaQuoC25VH99NOK5VzcBPwmgnFwJNFBMpkz2DnIJ9VR/1bbGF1MuciMc8iAIVfccTOvdJPAtTjJ2kAnBNJFuguvx7flbJmd7FBiRjLocucvk/cnwOGH3iwvmwZR8OOCMWMInZKMOUi/5hoX9j2WUH00sL9cA7GdoDhnmZfDratxTyjEN7ao0sxB8B4O01RNeEVlrMlBbeB9gtRSMfIHy4bRo0Ip6Iykcdki7pwwxxtnTRVsy/1nSNHeXLRmgfcMYomqB9iXno0To5ayjvwVsDhnF8gXTsHQLCDBx0/DQBkSHpRU0qwWADuPawtMfSvCHvriPYok4VLKi+8ML2MkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqV7CFif+2J3W7+zAwC3x3SEUgWpCbFTOxxV1nbpTws=;
 b=jdHwOZQIz7973iwVDb0gdIhSABT1+IczFMQH2OYOVf/YLhWhH36mkNP9xdGa/9p53GtCYo2PL/HlEiyH/pr2a5Sz8wdvZpzABQ5cnCg5J3jFvHz8QgsKovRC1LciTK6RahZtArc1glVvH5rp9yjfkFHYovBI8dotIlW/3gyUp/S97VLiru2juIyZIFxEwtQpP3kViN8b623TIcIwwvRD1gG+vSSibX6NkWaO7Xc/f1FBxbs9RpGYbubth+NJ6hMisvprGOnm1nlrLqPo+0u8m2W/+z8FTrq90sOSeQqZ3qKB5KMwDpHYixEA4j9XIulEt1yrSRNTb9kfQuI1v2tLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from DB8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::25)
 by DU0PR02MB8523.eurprd02.prod.outlook.com (2603:10a6:10:3e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:48:59 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::b0) by DB8P191CA0015.outlook.office365.com
 (2603:10a6:10:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 07:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 27 Apr 2026 07:48:58 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 27 Apr
 2026 09:48:58 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 27 Apr 2026 09:48:57 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1C2147EC;
 Mon, 27 Apr 2026 09:48:58 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 11F61305CE1D; Mon, 27 Apr 2026 09:48:58 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>, Petr Vorel
 <petr.vorel@gmail.com>
Date: Mon, 27 Apr 2026 09:48:37 +0200
Message-ID: <20260427074835.1452504-4-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427074835.1452504-2-kanak.shilledar@axis.com>
References: <20260427074835.1452504-2-kanak.shilledar@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|DU0PR02MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1775be-efce-49e4-7517-08dea43170cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 0HtJaFXcbOr10yWfz9+ccTEYAFP3IFpadGe85NPJMtJiGghs3kHtOUXh4tZbKG/ohV0LiniPOuL6hjq6aAnaZBDFhtNhZv7kYkE59GFskhO8N0s9AfWsjav+qlXaAqT8IoGC2D3a+gPqEOGwMLBzpy1yUu/cBbUXbSU91RabyERaGWx8ffxba21RPAJrTnsXGXB+9wN+PyliK3TIRulovfjwopWO0d+iKqawBEmiIJ/IOtQYwWrzmmDgTijWJyn7uFAcDMUYHR1NJcCmQCMQBLBsdz+72YaAts6fL7q5/wof55zglHdZAiNEkUWzD01JXk8qoUhj6t8yjVbKweYHGbjfF1rZiLb3Z44bZruDsbLJlHB6Ej32nKSSy5tViINq98KBpZOtszzDbfKug7RXxFRBygxU6668/rxxLzCwN26ax3x0IwIBMtqXdKOlduEPySQdYPm0ZbqdNiOyuEtd/KFuQBQ8KvCkzwoLWyIaIETq0IS/8BukOB3meYyBhLveUqPk6Y9K/4Qe3g6Aa/0CqTkPm2hwn0jtOyysSaN5geg5J5gThV2vc9ZLGmb5kH/5SGicR9yvVVoKT71ujJqOTVd+UQHPh9IcTY/mFOtsL4ihyRCM8p+usFBDhhDD4DyGIhSfH8s6BQkz54pQwEQ8ofSyvGGtQoXAJspYq9y6laXR39LdKtVMzC8rBwYeaUSECOziAO26HSPIhDNCH06W929F2T+19x2kODHJnjqvnN8=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nva78mWzBt9kJiK3Iy0szXwK3GlH0old3a9L5Nnko9pg+LClCpxXqo7Gt3ugI6X8erTB6+15btgSuSVYUX+7wggN8xm4hd3S6k0rmYF6IcsKsjLvI3CXHFeUUKw2sDcLU6WOUZAYSUqPVaX5bLeUS1d3lasXAJxiwzlt7X4goVddF1vEECqj9VvcsyPYym5Fo2Rxbjeu+zGHzUismvYlM6d4sJR21BkFVkg1ojv0wRvJe4YgxOo9uby0rDBSuh0/KwvFUfLeh7j+tbr9q5DiIvDqxdYiYz5j6RB9o1tj/wV2Cq9pbZmdF0jQdhqNC3EJzyqdKFD1zU+wz+FrkGlJtZf8nO7IpiE5IU2gKmho8RRVzS8F05AyzQbUfHT/QMMt0ZlHE0q6gUW1qpCzFob/xRHSZIcI90/JpPk9BJD5jBr5KKrlbB36NzhhSMO1xEU5
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:48:58.5675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1775be-efce-49e4-7517-08dea43170cf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqV7CFif+2J3W7+zAwC3x3SEUgWpCbFTOxxV1nbpTws=;
 b=LCEGcBqKFO24wWXQwwjdizGeJNudsKmp9em3y6LZLc8arJquqKiQEQJZwDQjziaVdXP/JEJ2nYm+4olwrXLDwa/m/oPyHFRfnShfqFgx5d1WyotKQBkytkq8SX7ww3l11t9ht75sKirx5fcB9l3TfCp1x5BvhZ1S2n1yI5mMC/4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=LCEGcBqK
Subject: [Buildroot] [PATCH v2 1/1] support: kconfig: Fix compiler warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVWJ1bnR1IDI0LjA0LjQsIHRoZSBjb21waWxlciBnaXZlcyB0aGUgd2FybmluZyBvZgpgLVdm
b3JtYXQtb3ZlcmZsb3c9YC4KCmBgYAouL3V0aWwuYzogSW4gZnVuY3Rpb24g4oCYZmlsZV93cml0
ZV9kZXDigJk6Ci4vdXRpbC5jOjg2OjI2OiB3YXJuaW5nOiDigJglc+KAmSBkaXJlY3RpdmUgd3Jp
dGluZyAxMCBvciBtb3JlIGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5k
IDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KICAgODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwg
IiVzJXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBefgou
L3V0aWwuYzo4Njo5OiBub3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCAxMSBvciBtb3JlIGJ5dGVz
IChhc3N1bWluZyA0MTA3KSBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA0MDk3CiAgIDg2IHwg
ICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1lKTsKICAgICAgfCAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmBgYAoKVXBkYXRlIGBidWYyYCB0byBg
UEFUSF9NQVgrMjBgIHNpbWlsYXIgdG8gYGJ1ZmAsIHRodXMgZ2l2aW5nIGVub3VnaApoZWFkcm9v
bSBmb3IgdGhlIGZpbGVuYW1lIHN1ZmZpeC4KCi0tCkNoYW5nZXMgaW4gdjI6CiogQ2hhbmdlZCBm
cm9tIGRpcmVjdCBmaWxlIGZpeCB0byBwYXRjaCBiYXNlZCBmaXguCgpTaWduZWQtb2ZmLWJ5OiBL
YW5hayBTaGlsbGVkYXIgPGthbmFrLnNoaWxsZWRhckBheGlzLmNvbT4KLS0tCiAuLi4vMjQtc3Vw
cG9ydC1rY29uZmlnLWZpeC1jb21waWxlci13YXJuaW5ncy5wYXRjaCB8IDE0ICsrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzI0LXN1cHBvcnQta2NvbmZpZy1maXgtY29tcGlsZXIt
d2FybmluZ3MucGF0Y2gKCmRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1z
dXBwb3J0LWtjb25maWctZml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoIGIvc3VwcG9ydC9rY29u
ZmlnL3BhdGNoZXMvMjQtc3VwcG9ydC1rY29uZmlnLWZpeC1jb21waWxlci13YXJuaW5ncy5wYXRj
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kYWVmMTNiY2Y2Ci0tLSAv
ZGV2L251bGwKKysrIGIvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjQtc3VwcG9ydC1rY29uZmln
LWZpeC1jb21waWxlci13YXJuaW5ncy5wYXRjaApAQCAtMCwwICsxLDE0IEBACitJbmRleDoga2Nv
bmZpZy91dGlsLmMKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KKy0tLSBrY29uZmlnLm9yaWcvdXRpbC5jCisrKysga2Nv
bmZpZy91dGlsLmMKK0BAIC0zNSw3ICszNSw3IEBAIHN0cnVjdCBmaWxlICpmaWxlX2xvb2t1cChj
b25zdCBjaGFyICpuYW1lKQorIGludCBmaWxlX3dyaXRlX2RlcChjb25zdCBjaGFyICpuYW1lKQor
IHsKKyAJY2hhciAqc3RyOworLQljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgr
MV0sIGRpcltQQVRIX01BWCsxXTsKKysJY2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYyW1BBVEhf
TUFYKzIwXSwgZGlyW1BBVEhfTUFYKzFdOworIAlzdHJ1Y3Qgc3ltYm9sICpzeW0sICplbnZfc3lt
OworIAlzdHJ1Y3QgZXhwciAqZTsKKyAJc3RydWN0IGZpbGUgKmZpbGU7CisKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
