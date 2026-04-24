Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF19FE5215
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 12:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B5F617AE;
	Fri, 24 Apr 2026 12:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wOaJbqSAZp3; Fri, 24 Apr 2026 12:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44946617A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777033790;
	bh=jppZaa61eL8SNZ81FC2WcEg9dxdlW+NoOf787CzbRyE=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o78V6eecS9MZGFINtWwItXpWZ3CYYDKu6QiwdO+wMnQLtt/U4ZyJR6EWABZe2oD4H
	 85QWL2htVfa8gCS1IUlk+g9Ud/M5it/YAaA8Tt+/HKhHbV35nkNTlQnEExSu0qHfgV
	 z5ju045sx5OzRwxP7TBmJTcOitWK8hlE7NownGgxNtOAEcTXpletEgVHz4xCtlbiw5
	 1T5rkJ9+lFGoMmyUA9Dnx5J0wh4l/sp47o2zcd/hyXaoAUck9BiYP0gNvSi+hBZ3un
	 tyP+gtF0UmOuov5cn95g+sJyjTGP2syDLWPRKkruQFhNtiKGPzLSK3Ahkgu83u+5/p
	 cqDmlYdQN+jWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44946617A1;
	Fri, 24 Apr 2026 12:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E70D3231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 12:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D917E80C58
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 12:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SX8HOChqsYM for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 12:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21C2480647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C2480647
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C2480647
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 12:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqSbOPwgg7dZ96IwYVlKFFT2pxlj6hS5jV2xvXImNMwcFyp1FWfLpFZ79Gew2kPi++QEU8ukw6ceamcBb+kv5V5NzxWweVA2DfdNl8HMcT1OEj1RQUsXKETcOr0Bi2U4em/SiShm7kimnPH/yC4ms8YACNb8Jh7+ocxQBUPG4gWE1vDa0GBILi3X16Q0g/N4c7iqesiJzSA3d3zppQKdA2yphVH+zYKqZdwd4Yvgf0qZKIldChN1MvrjpIAAhqpUSLF7TUvf192eFzLLVPCrDgxGsnqbyXl5XTg6ekSUk9fjMfko28stGKqziD4vQ1tbpgw6ccjg/4rg11RGUGORUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMN+0hMyQuiQGPQidbmKyT0kwRbe/dtcDHLYOpfOnig=;
 b=bTtW7klM6lEMQLGMIBoV5TOzwXObJ9BbIiPtJZPOpiNnP8y4b9YmPf1gswjNJua4CCN9oHCycMW75hsXY06AygmpUy0tsFDotasd1nOs2+nn5d7li9dJzGTj8oQvkuSH11/gHrzuh00NTpd5gtYQ6OqLv+h/JddLecMR81UfD9NNG9UTJuyasXOixWOOFc3x2HmrqsX2qQo97XQcGHHHl/97HdmusSnE2aZu9gcMelMOhWnRKYoskZ23DJJ+1XEnUWGEOaqwQO5IRIG4lJlARGNRSrb2QZx68p8qoXTANov8gD39Kwqc8bps+Ay07lRQJXSOvG/SKp91Hx5IGOySLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP123CA0261.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::6)
 by VI1PR02MB6255.eurprd02.prod.outlook.com (2603:10a6:800:17d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 12:29:39 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:400:1d5:cafe::53) by CWLP123CA0261.outlook.office365.com
 (2603:10a6:400:1d5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 12:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 12:29:38 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 24 Apr
 2026 14:29:37 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 24 Apr 2026 14:29:37 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7B7A92B7;
 Fri, 24 Apr 2026 14:29:37 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 66C8E304A26C; Fri, 24 Apr 2026 14:29:37 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Fri, 24 Apr 2026 14:29:15 +0200
Message-ID: <20260424122917.3911794-1-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C710:EE_|VI1PR02MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc534c4-3101-4a1e-97b3-08dea1fd26db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: wVUU69is/5E359X3eGRch8QuaWcCQPMbJJ3Yjag79eW2ZelGUVQxTDUTONWQe8aBeD+G7OzYNnC23dCKolA5DSggizNcIOec/AcW2zugoT1AmbTz20Urh4MFtt2BCD2OPNWsrvOWKCCo6Xhu8kbSMHfazE4yMUGGjV5EpQ6QKO07btm4ibIXFfHOHTKt19hhA28UBKMypf6nlkwnLW5hzxtVs4q8XXLrQGaTvsHGH0QGDWk8hCwZkdhzzfIkJQy7sBobltVT9VybHtQL87D8KbhlvxWGeS1B5lSv1xQEGiu33AijoYgLNkaXHKELOGXfMmkL33gPA0AwbL10Mwg+xKSCoig8kDwRBqwZoroN+p47Cmn/yVvJ7C1BuaO2ss5ArNR9Oy1hqZYKGFYS4+jCvmthu+7yoZfU+2yDCuUf2EC2S7TBocL4W+F7QMuC3ZPu6teBLmO4kTKBsHGC7CP77gLgt8idjSNQ1sE58yq9+kDU2cX9vqS6arxKtPi93rFjbtuma/bZGW9G7aK+4LzaJw28+ZTrU9grK8DvtcCd4nsVT1+TWQROwfXCZM3PmCCvp+3kGXu4EPyuBR9LyS4wGx4oIg1aC9pfvIvGZADwVGp1Lh+Na1wynqjlhL1kVbtpCWzyb2lNtgvDStb8lk5Po73+X+oano+cBIjnh9xOw+Q2vfHdBFRg865u7J0GJk6lOiqK6VV8c3XfYA4aNVCrDl6yUlvE2/Wf2h74jMiPB+E4AQ99jz/o7wywLNyCoZAAyQYMUy8fcY5C7ljExHy1FA==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2Wpdm6NOZhGyhHLBQdkUPAZgK19MvoMYa4U/6u860SUa+JCRYkMfutK1bzyHeVCS4kwZF+8Slb/AMFdFny6pGFFTsZwId+sCeszPxnqJZ6vIoiObumjuGLHq1v3Wa4ArZdfOejOdEzHpKEDLrlFaavTSRsr2RDtcZ0WQwrYMOK43ZH1AXJT2yEEKRqILy3dtG3tWQJuG/+T52b3AbTu24dQkti/93JO6oIOqWTKr0ZkdQARSkqihOQyCE3NoIze8llydb7bYENM+uwNg0JhQ7/IY/umjJyVFh+vkqW+96jt0xHq6X6ctON1z0ExU67Uf7vP8iI4naKZSr0jEzjskUR0bl7/yb9MZrB0e+NAu2xcqaRVeeRoZacQUyKdXw6IpkapozbezY9usn5iZQJ72iE6+bcBEVGvVrXjcfj3wt9AJtkKWB2enA1ybRNlUjy/1
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 12:29:38.3480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc534c4-3101-4a1e-97b3-08dea1fd26db
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6255
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMN+0hMyQuiQGPQidbmKyT0kwRbe/dtcDHLYOpfOnig=;
 b=o7X3TRMWXlHRrZswgAFbP7gzBlo3+AzOepFK4RUo35lhYQ1x/7ZwYsDbzYdQjoLxJzbIRZpF+liQx9bdYaPRdFjuuaR+X6rOMwXDTj5qtM4n5TVRvjvUbJZCf80LV1koa78ZVrb6iK08DEhZKqi9HWICZiRFS6gOvFfwlGIn/Pc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=o7X3TRMW
Subject: [Buildroot] [PATCH 0/1] support: kconfig: Fix compiler warnings
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
bGVkYXIgKDEpOgogIHN1cHBvcnQ6IGtjb25maWc6IEZpeCBjb21waWxlciB3YXJuaW5ncwoKIHN1
cHBvcnQva2NvbmZpZy91dGlsLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKClRoYW5rcyBhbmQgUmVnYXJkcywKS2FuYWsgU2hpbGxlZGFyCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
