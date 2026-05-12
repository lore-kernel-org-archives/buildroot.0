Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5EACD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 10:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60F060C26;
	Tue, 12 May 2026 10:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5iEjxje-T0H; Tue, 12 May 2026 10:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9452A60C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778583385;
	bh=a0KE3BDVWN9zJwolPW6snPO+MglsrcRpgQE0lnd/6NY=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f0fmp/z+OhJdhEy1hWf89i742oO7pscqO7DDg0L1od3kxZKNa3HUdNdPQQ/ypHDeW
	 jXO65aSzATjjN8TnlCk9cTWnxFM5odDMve7CTtZjVQuLryjjT73DRCFREZR4fgxA3d
	 PTaPswolbL0WakIqbn8bKvAkpndtcCvtkAwzbkj16qW46VOgBbNU0rCnhWjW1z0UTm
	 IJ63BpmrZxEN7CL1vfMFDe5rbTpT7hxB9CGUxQoHEhYSl0LpOF+VYGKJiKaj/UAZsu
	 xQom/Oo1ZuiorqBGtJhK0dQQyWg3nobUX6HpDptEUXkBPh0odKsphp2fK0/0n6Kvne
	 PX1pEqhmSjdBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9452A60C23;
	Tue, 12 May 2026 10:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E55D2398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB29182203
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7O4XwVy_3db for <buildroot@buildroot.org>;
 Tue, 12 May 2026 10:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9C0082201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C0082201
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9C0082201
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTj9ha8OfFIJ9p63iD1ZgG3Tz6oRESqDTLYj8vbtmpJbidWth9RL1nFYLispuFHdyxaLS7T/N4b2iz/8NsP6ag7ddwRYy3pGApZino7Vq6h/atOCAHONjqMPi0XnskuWaVXEyxyZpkH2j3eWmDk9udFjltvVpykH+PkHLKHOz9Qs+h5nTvQ6vjbD8IzT3kqd0Dry0UQm4ekQVABiRvxuiyJVC4zrpoK3gKxn11DIzFECCtoCth9A0u6pSezgPDxi7My5YDfgv12ZYTvK6LQf2/eq8zK6czP29DNd27LfSAvKepa4AdWma9CqoELsI//kBGh0v5ZrKdqpEyDTU6hFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r27cKYfZO1jx+j0VCrKR4R4GxlPI/Pn/CyFxFe2ZVww=;
 b=fcmDjMMzxnaNMsV06sIcq5jGS1LSFhKiRKR296SLrUZ+5viJGXCY9GwbFsEq45jQXjthy8JvxsQglx1ouwqujDUW5UuSXcEntrBnRjp9quA/l9dG/4KA/rJn86NGveP91LpKFc+EB4xqD3aq7qH6k8EyXoY1/UMiCUQtRVfsRzL7xbBCeCP4TQuGRkm1KGPQhHE7YtWwZ8CwqcFiGyrPmvBZMe4o3tnLH59engyLLxOTU5JvIQ/FZ0/W5YjPYY2baUkgTPMalt/9IPjDs4ZZZJ82ut4dlrVSNdOGfO8KYp75UZKA/qQO5izOHU7hKkM0iLbPOOrceNUzQT+XbdsEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP123CA0194.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::12)
 by DU4PR02MB11263.eurprd02.prod.outlook.com (2603:10a6:10:5ec::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:56:11 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::24) by CWLP123CA0194.outlook.office365.com
 (2603:10a6:400:19c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 10:56:10 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 12 May
 2026 12:56:10 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 12 May
 2026 12:56:10 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 12:56:09 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id EF0291B01;
 Tue, 12 May 2026 12:56:09 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id DD637305CE15; Tue, 12 May 2026 12:56:09 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Tue, 12 May 2026 12:56:00 +0200
Message-ID: <20260512105602.83368-1-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|DU4PR02MB11263:EE_
X-MS-Office365-Filtering-Correlation-Id: 362df4ec-eeb0-416d-369e-08deb01513b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 4ohjUj7DRQaUgxcM+eq9q4ExvOikBiPiX5AxN/aaq6ZRGBk10NF4KqHHOr+ne+UWPT3kxTIe1f+D5H7T7U31G/TkY8PsRYKlRve0Cg3h2Xg36OxvPXdsj0VaIXDECFQyky3g4C5pbPiCcQHeYtfeKc690+ijF739iI+0NFJHTs7GtCai6kTE6LH1r984W59rf7/7k9E6ylJ8stLwXUM3L7BeFypvOu6iKnkQRrVPCTgEw4ZHKAoO5A/99NAOP2ojSwIQFn73BzPBEC+/2FEx4qMJ3+nZZO9cwncLzYALBIC/gjq68T7s/tCmxc3/b02TuoUG9eKKU/62oKHKaKsXBeEEqM/sCJUbET9V2fQfCpAugNpegpO3UkK2q/ouHSeGGYqA2pwdejNUMHIHHFYWG4JCrinh5SgmSAF4+OnKIKCYvXfm3uFKmqusmNkW5VESFZL50CZPN7rwkLDOdZpJ2lCgNlYLEe/cbm9taEXUMX2CqzIk0q/iEwYMg6oBQL3ciyuEOXveFIRhSksi/2CBbimh5mVQphZuMUDKod39zxdfsiHy+mo58Y/mWscKEhqVPzUHDdJPs+MZGrBwXxVanInQB930srpJ4OrTO21qgHiyMvXIS/+8KfhljwwfGn5SLmsYPmbhUfJHrmnbHDeWzuim24NRbRGT4Ix/GjLuru+LauvLSHYLu50Gnk33bH0dt9Ma7MoPEg+GVmxtQ3O0tvtl2quXB8LDS3bg/rXSyow=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(11063799003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vjrBLy6RPT+kKfsHrlUYA3xfGKnwSQCAGVvWFbwGq/vMtZ7MFvI2VFq3mjhF2Ivsni64PerKYpH2RzBnUez9l6zjG2yW9ZPwVR2qi7xeR32O2wJ1rWygiY+W5gGF2+sCPsM7g+7jKIB8MghTeyvlzYFhzYv2/y87gPkVfLQJ5aEwMLY5QQyM5qe0lpnMwicUbQyo8yoFw2W/TeHEF3jeOwtZpvhgAFfkh28qwqVaRiDVnMZfkcWmzaVSIkb3Psjjb/Oplscqt9cUr3Sc+h0ifV7izYfOLu0Ze7RBiudA4CGmnhxn2QhGxOtElt3Jd+lT696C4qE6emnHm5RpsGEdMXG8NVxKC4gUDFk1W4mPmny/gG1yA2LLHBXql8S8AXyEIbiJqjsMHV5N2z/T9wCtJgSCkWyUvLvYNDHWsDrf+E2RfO810fahPhEzfx1hk2z+
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:56:10.4476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 362df4ec-eeb0-416d-369e-08deb01513b8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11263
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r27cKYfZO1jx+j0VCrKR4R4GxlPI/Pn/CyFxFe2ZVww=;
 b=hJjnajPCPjRjDqZglug6hzxNzzl9OwQj2qihUsP+2kdH+FCDgUf1Kcn22xweT30acsd1BjMRfGTpG5Y34TuerLc2fJXaAq6aibYKYNkH8fr7ZDDXxwlQuqCqXW14oh0NGppeGg4npih48060YPO0u2Q+ItJUcShBLpz+AQgvd8I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=hJjnajPC
Subject: [Buildroot] [RESEND v3 0/1] support: kconfig: Fix compiler warnings
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
aW9uIGAoVWJ1bnR1IDEzLjMuMC02dWJ1bnR1Mn4yNC4wNC4xKSAxMy4zLjBgCgpUaGFua3MgYW5k
IFJlZ2FyZHMsCkthbmFrIFNoaWxsZWRhcgoKS2FuYWsgU2hpbGxlZGFyICgxKToKICBzdXBwb3J0
OiBrY29uZmlnOiBGaXggY29tcGlsZXIgd2FybmluZ3MKCiAuLi51cHBvcnQta2NvbmZpZy1GaXgt
Y29tcGlsZXItd2FybmluZ3MucGF0Y2ggfCA0NSArKysrKysrKysrKysrKysrKysrCiBzdXBwb3J0
L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMgICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDQ2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L2tjb25m
aWcvcGF0Y2hlcy8yNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNo
CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
