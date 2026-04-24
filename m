Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933BDFE5215
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 12:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D55A617A0;
	Fri, 24 Apr 2026 12:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjwE3w62JjJs; Fri, 24 Apr 2026 12:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4746E61796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777033789;
	bh=2Y7hPgoAWsreuPa3qYPTbSye0vQD7WJYrW6ZspY4LD0=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZV2y7TqMdCJOWrEsiZl220GwVgTQTp9WbkqnJiM3OPXMOeOQosFAhQdcbflq870JI
	 iPUA5WPqCNxSTjjowAWKROtHQUNk6xbNfclRGVk+BUUNHmuFP1WDm+4TkCDGW5dPuw
	 iZ2i0AlgIVKSS5q+TPXWwXLUNHZkJi9YGRGB4RaV3tyIjxSAUnypOAx9R/JailuaLq
	 NmSzTv2Lh0KWGGBCJXzi/a90sWyzf0+sPGF4gqdGkPa5mOi1wBdBESiT8L5JxTmcUA
	 lebqpSZO46ob4PgT0rqRM+q7FOh8orsT1UHs6jKY3gO7CQiR7Vqf2ByLFK4tcMVvht
	 7iZP4/Jh3jOuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4746E61796;
	Fri, 24 Apr 2026 12:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FCF924D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 12:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262D142786
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 12:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyQcUS7q5g5F for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 12:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53EA142782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53EA142782
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53EA142782
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 12:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REbOFwhZ18K1TtdEjoyVFuYJmxeZphpGjLk7GoWP4dx6g6re18Dmnn900eo46fYeF3lik29fAWQO/80Jvyq5N4TBTKcXfT6JHZptYD++8oQb6P96AGANioCoqFGSOZRc7UeTAKlL9+6jaNZ/uatGqyfI2EzQGaCvlzlDKIDti+9avCl4P+vVQpOtu+Wv/ifeCLH6IHK2opsBfVFiOK2psog6tNMfr8uJ5xW4HNj5713xW/pJYMURzqkO898IW14no6ZhCNY1VKDq5yrjnbFmoQfYCtIc+Zts3UONsch6tx/iJaGVj7TNqBYC+My0ywtqfQYZyP0igO4fNLTu+TaQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuJB/n32naTJhzlluLwfOyXu+9IptE8yl0a6LdPNowo=;
 b=QJlEeW9IqKuLFQ11AoGOuKGG5Tjc6h/rS/aPUebWXSeb+UshcUXKr3HDaDvpXmtfNdysOKJK1mqMAuMuFsavFnLccTADtaRBvC+CkRWOVDe/JHouwF0DSYVlRrJkdCVHTw/n5P1iXjV11mWNeM7Il+EZMAONCVvJ4jf9/5otNcF6ZCR3pzpjbTRHrXpWaTwpfZ8kZxxOMwilZEeIjl3TSvMx8ewAJ2Xgaiu9ZzpxcG21fSbg/MGmYaopvp3c6cO06SUJ6Xtw7dkOkZaDCcj1n/F8Wiw2QwVVpsvidLow3XAyzvh4xkBQQ8bLP8LcUisUwdbfn8vDSP1wBpEf/dehcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP123CA0262.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::9)
 by AS8PR02MB9090.eurprd02.prod.outlook.com (2603:10a6:20b:5b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 12:29:41 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:400:1d5:cafe::bf) by CWLP123CA0262.outlook.office365.com
 (2603:10a6:400:1d5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 12:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 12:29:41 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 24 Apr
 2026 14:29:37 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 24 Apr 2026 14:29:37 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id B190228FE;
 Fri, 24 Apr 2026 14:29:37 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id A6C8E304A26C; Fri, 24 Apr 2026 14:29:37 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>, Petr Vorel
 <petr.vorel@gmail.com>
Date: Fri, 24 Apr 2026 14:29:16 +0200
Message-ID: <20260424122917.3911794-2-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424122917.3911794-1-kanak.shilledar@axis.com>
References: <20260424122917.3911794-1-kanak.shilledar@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C710:EE_|AS8PR02MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b9bf2d-e0c1-41da-2b31-08dea1fd28d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bHskUpIXw8hKN7EZIO6kZwAorsV+HjO4md5k+tC6fMMhdonckYUVIzG3J6A5F056o7Wq1vI7by8FJvxZbWz/J5SIwlfXVJE3YZS3OT0WVHYj+YHdcjdAXzERTVKnDM15iKWVDAWGF6ELspU24v0aq+Ols6apxt+qs130anmIhm4H4hIIm7dMfO9pmiQgtWvPOQJ2cStZQloQZtFym2kDWKQiERN2G3rfPcP1oIqAspXR6/7MQpPJlz5WS1WCon7Os2/Sprmmt/9cj2IXpE4jkzRJ54sN3xlbneuvwqTdlNbWRkPvqTL8zfz0bs594p6d4jTItZyr3GW1imtiCKBFaxrnY5pYYE7j3KKiP0XvUOAeoCHrWfQDq0Ez8uY0mIteTqm44XG179odpKpbt8Yk52fW4dTo7RPVWIFP2HuY37oFye7K3m6xa55gr2nD46vF5aIUKTPPzVqwT0e45YRj/XV65tcRIJTT4F1t5lyKMgGt+hnEt1ctcbtTywnT1xypgQ96+ZLuiXOU9ak4RuNFeIfXuUzJquQG6cEMZaCrF6c2qteLmjEvH8uwkdn6cYjWL7ROgBQL/AZga6D3Dlj4LJjkBelqOIQheyviWdhhYDPNDcS0zTxfhVN3n5ds77QdHeN3s6BKU0IO9PzrjbggpYSjgddvvHHUvkuGufmnwgY2OiEyi718dLcoPhFRITzxjjDnvyq0iBJ8l2Lh/YJiD+A4+ccSPjaybW+2pWM8UAS9dU7FlCOhP80KLMv/umWlVpoB4YmThEhJjzh2BzQNrw==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QOlOJNappHwFrjuXoHcH78ENCCWV4IwpST5tXBJ2FpfM1DeliGLHYn4qn86EF4Z/uggiLyT1g/1tIT+CFSO5Inxe5hZauoza5K/XutRgcK4JoSFWuBXbWhjYoJiYJqFGpnhB+/0qjjuwtIUPW0OYP2Oq0e3WAQ1qFTTa6ubBhQKUvmQiKJaZC71c2GdACoPARvrYc0yNPrcmaO8d5RbGmhswFG6d4lAcskFOESfEeSrl3fPBDAq/JwpphaiLW51lfdCWtg7PH2cIkh7jjcexL6qf6rUWYC4QC9CT/MMBUDiAo+Amn3MeCrK1K4UkwL0wumQfA4RTdDBA7HpbtdOIpPqu9SV87cbYiKuhCGHnlvqiVB0LhE3jRdRw5DB99Dm8HILEkfcITlbXiCo8TD5tT0FQyzh5f2ntppxFCPCdsC8ZdWxTaX8GOao7k+Y7H8ec
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 12:29:41.6657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b9bf2d-e0c1-41da-2b31-08dea1fd28d5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuJB/n32naTJhzlluLwfOyXu+9IptE8yl0a6LdPNowo=;
 b=LvjY3c5NUMHJF7aZZ+dlt8wGyBBi/TLIR72ttWY4Md+5SOcd5o5+naagg5fLdrmTlHB1xJxJw9RvjLdiqBSZi/dm4WUEaC9uzLhXSCQLi7bfHPba7BTKO/3xP48XJ1QmpL1LrPhjMG5G6LSYIZ3rpE40khvqqAaj/RwH4nbRnnA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=LvjY3c5N
Subject: [Buildroot] [PATCH 1/1] support: kconfig: Fix compiler warnings
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
bSBmb3IgdGhlIGZpbGVuYW1lIHN1ZmZpeC4KClNpZ25lZC1vZmYtYnk6IEthbmFrIFNoaWxsZWRh
ciA8a2FuYWsuc2hpbGxlZGFyQGF4aXMuY29tPgotLS0KIHN1cHBvcnQva2NvbmZpZy91dGlsLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvdXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwu
YwppbmRleCA4NjY1ZjViYjg5Li5jMmU3OTc5YWMxIDEwMDY0NAotLS0gYS9zdXBwb3J0L2tjb25m
aWcvdXRpbC5jCisrKyBiL3N1cHBvcnQva2NvbmZpZy91dGlsLmMKQEAgLTM1LDcgKzM1LDcgQEAg
c3RydWN0IGZpbGUgKmZpbGVfbG9va3VwKGNvbnN0IGNoYXIgKm5hbWUpCiBpbnQgZmlsZV93cml0
ZV9kZXAoY29uc3QgY2hhciAqbmFtZSkKIHsKIAljaGFyICpzdHI7Ci0JY2hhciBidWZbUEFUSF9N
QVgrMjBdLCBidWYyW1BBVEhfTUFYKzFdLCBkaXJbUEFUSF9NQVgrMV07CisJY2hhciBidWZbUEFU
SF9NQVgrMjBdLCBidWYyW1BBVEhfTUFYKzIwXSwgZGlyW1BBVEhfTUFYKzFdOwogCXN0cnVjdCBz
eW1ib2wgKnN5bSwgKmVudl9zeW07CiAJc3RydWN0IGV4cHIgKmU7CiAJc3RydWN0IGZpbGUgKmZp
bGU7Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
