Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA5DFF8861
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 07:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 844DE85487;
	Mon, 27 Apr 2026 07:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhSdWKv3hOiX; Mon, 27 Apr 2026 07:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A2785489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777276140;
	bh=BE/kbJhiVkk5f0wZ+xQQdf3YFUQwZvJh2ayitfRzs6w=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CGNTgsP3CDkFIK9/cf6F5rdldy8YfFsu4b4uH9iLvyOS0vk31aIDqEFXC++LmjBqh
	 7bhgnDvLBT2TbZ7XoHrW+2DuP3OGJE3SE5GCMUVAX3J2JMxURjxtg5tUJJlBpQT4Ro
	 QorDRWFdgD4SMe5Hh4GbqxDTzJtbeHP6+SMExi6KBVdJZPBPsomg7hoJYP+ymxjQxG
	 X7QWBdsHG9v3+6AFV7YoT9WcdVjwxaUoG4UZKJ/F79PGo6phwvg6wSGOdzW98DNA/d
	 EiY2t2nWVs+lK0p2cX/bslpXzfj2LagYb8K18Sp++W2v1ZVuAg+897aKekGvb/nQ4m
	 OZ8QfroIbfcLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A2785489;
	Mon, 27 Apr 2026 07:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 053991B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 07:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA46D615B9
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 07:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLERYi28OpmT for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 07:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0109260BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0109260BF8
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0109260BF8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 07:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhhhUH1Pc6hlCt5j213w+5s+Q8+cXmSgvzT2QJuL0udMdjjw8MnHkbKhlna2uLX3hOzpwbZR/oKJ21m33x1mWpzLHlhuaC5PWrEnvVRXoBh0swj6/TXKVEuAUOko95LOAn29MuRtI4nbyrsNm3GNVP84L+UFFHhfRiCrU5U1hHjivl/0nS04aqo1AlHMDsqRc4w+5tVgPkw0LemlAaurDhtnVrGwOQ/9SPMii9GPu4G0ATA6IPwzxlKfMfIwhw9rdv9LYQggjbOJaFvSiFEx+jdWq2Ena/PaNpeaAVZ+w9kLoCkJOW7SEo9S+5hOQUqvwyM0CucaAtEw0Qh1gskctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/pzdWNRCy0/SwaH/9ghfu8+kqplGHXLXE67Pq9fpHk=;
 b=NF4y5CuSLNEQDvw72Vl9SY5AxDjP9WywFbOtj2sEJvNJ7j+eqSGExd7HU0e7YyCcCKeLI8t/V3eLJiGlUqz4y472Mlz51NlflPnBRVRtQLtVOQwGPpkC9qXUPYnoicAJNsriHuRSt82aJmzwfXwj3dXhZym0KCTYvdOWogxNLqtBoIieBNGJYPP6Q0TyKqtAPKi3u9IMw9Qb+KSgb/dssN5D5OjoZUlGvHJv5ivIxaiEuCqgf1a4P4N5qo4Zkf91ZjxFExc43fEwuay2W1SfeEQnMq6Ie1pRg/7Un3mPCtlZHmoqjYrws7sPeU4YOvX8AYzTgTAmN7eL8EYO5m+b4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP265CA0376.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5e::28)
 by GV2PPF3F850C9EF.eurprd02.prod.outlook.com (2603:10a6:158:401::5cd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:48:49 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:401:5e:cafe::fe) by CWLP265CA0376.outlook.office365.com
 (2603:10a6:401:5e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 07:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 07:48:48 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 27 Apr
 2026 09:48:47 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 27 Apr
 2026 09:48:47 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 27 Apr 2026 09:48:47 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 99C7C7EC;
 Mon, 27 Apr 2026 09:48:47 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 8721E305CE1D; Mon, 27 Apr 2026 09:48:47 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Mon, 27 Apr 2026 09:48:35 +0200
Message-ID: <20260427074835.1452504-2-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|GV2PPF3F850C9EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d60d56-c8cb-4a5f-578a-08dea4316a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: GQPxTG4o3gXZoVOuCOLFesnJ63BHgGwiYRdP/8nK/UbeA4IwiOWyO1FFURweBEMDeIk43YTslOyRAnaoTp0T3sWseTIzcDFDP1gJ0TSSE0bYleWtLlsHNUOM3RifhQn4UI5sZdhd//WeFdqCf9ylukCee4+yH9Y1up0Q8uzVQi+6OXJ0//KvQgQghW2fwuQQnZu4ZIFta6joivC3eDiqiD4NzZMbY05zj8ot4aqVu4gGBszv9W6rLdWzyxseqnGDFELdTvopH+nn4HCbyIVVCOwiH5zN/csq+qqkGtRI65OE69Vi9UCIqQXyJsD3rx/S7Hy0arfcXVPRlR5TH6xBBZxBSpzwjSZ7oBTjacwWedSKnIZ/dkzO46Hgj3WdRFiz4r1+rvqUedLz4lz3kW+BLXeCFFIXxbgBbsNqjLQb9uZZkehVFcODmx3P5+xXZQJO6ucCTA6T1P59nyN5uz+lkggrNVsAm38wgwrQb5ighEfYD/XJ7sD5kmQ0G2e38orqU8UodpuZ/rontmIQJp3fd+TsQ9mhhBkqrJBkphuOEGafwAjUGjZ7ELnS6Iw8iBO7OnW7QdWeGdVAMbp7ECyHLMX9TayywLdzP0qACXKCC/sfD1HFl8hvZgKt702UYNw3xf4/KfSKjZn7cZX3tvOovouYjBHKOxp8tckm9KB/7J/qDBwKsmxphzpzz7n9mDlyvxQshYJiU/3QYxjkLWYj1zihKheZNFSEEKSSSL4TcCjSs0/7IKC5aodOJovbyzP9kS91OovMoqx1aOLvl7uSaQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3bpZuNQn+6QbucPo4cvVZS/maZI5mCrZDwC8dm3TI8Q+8YgbitvyKqdTwzGMfk19LN9TU723/gXKGvBGKBicoBTCJWKhkgr7fqHSIYifOAH5IB182FxZeUpzsFi34MbzB3qh7274vIWzimwsHGiLo8O5+h2LJnFUeA2ZInEiJ7KzHTZG/3SQsb3ww4GCBx9tOK/R2E8KWgLOnD5lmvHVf4y3UPcuW2+2k5zzqBrvmlh1Ulea5U3rFwPlIOaaYl+WuRT+1+V/0J9GOF0Sjdqfszf/DHXvBkeAOVomKJdkyWoAvwDJShJq8JkLH7/4wJhdIxG4VpovynHvCUaU3+IUq6mvU58lfD2bywWT59PwA6TQw2QJ8SZIF/3SmNuqvu+7K16Hxi7HX0P/kghs229WnwL8FSIVj2NXnHfRjqCsEEFE6Sb4Ngn+t8vmvlXtQZs/
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:48:48.0995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d60d56-c8cb-4a5f-578a-08dea4316a90
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF3F850C9EF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/pzdWNRCy0/SwaH/9ghfu8+kqplGHXLXE67Pq9fpHk=;
 b=VzpzeC/Y+8FZoCTaHByyJBb9mi/Yt1CNQL68Yqd+TGQ47k9wwsxiRnv6nTWtidRFa+/lAqRhB7TkyBGqF2GAbuYQMZVjh7a4tfnlvFl9NnN3VlH5ss94fuKrcy08BpEFuiIC66ble0Z0yssvwxMU4h/0UQ205GTRiF2S1it2ZKk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=VzpzeC/Y
Subject: [Buildroot] [PATCH v2 0/1] support: kconfig: Fix compiler warnings
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

SGksCldoaWxlIGJ1aWxkaW5nIHRoZSBgbWFzdGVyYCBicmFuY2ggb24gVWJ1bnR1IDI0LjA0LjQg
SSBhbSBnZXR0aW5nIHRoZQp3YXJuaW5nIG9mIGAtV2Zvcm1hdC1vdmVyZmxvdz1gLgoKYGBgCi4v
dXRpbC5jOiBJbiBmdW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmToKLi91dGlsLmM6ODY6MjY6
IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0ZXMgaW50
byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9
XQogICA4NiB8ICAgICAgICAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Ci4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNw
cmludGbigJkgb3V0cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGludG8gYSBk
ZXN0aW5hdGlvbiBvZiBzaXplIDQwOTcKICAgODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwgIiVz
JXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KYGBgCgpJIHRyaWVkIHRoaXMgb24gdGhlIHJlbGVhc2UgYDIwMjYuMDIueGAgYW5k
IHRoaXMgd2FybmluZyBleGlzdHMgdGhlcmUgYXMKd2VsbC4gSSBhbSBydW5uaW5nIEdDQyB2ZXJz
aW9uIGAoVWJ1bnR1IDEzLjMuMC02dWJ1bnR1Mn4yNC4wNC4xKSAxMy4zLjBgCgpLYW5hayBTaGls
bGVkYXIgKDEpOgogIHN1cHBvcnQ6IGtjb25maWc6IEZpeCBjb21waWxlciB3YXJuaW5ncwoKIC4u
Li8yNC1zdXBwb3J0LWtjb25maWctZml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoIHwgMTQgKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjQtc3VwcG9ydC1rY29uZmlnLWZpeC1j
b21waWxlci13YXJuaW5ncy5wYXRjaAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
