Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B1EFF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A8AF83E8E;
	Wed, 29 Apr 2026 09:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td5UskBcUDHc; Wed, 29 Apr 2026 09:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A2D683E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777455410;
	bh=GN8pCUn4ogTa1IDdLJOIUvNOfa5sVOo0xNL5Qid+PhU=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aw44op9tYGnQyMBBXHttuJHxvB25YkG8AL0da0jnsAZBgal8n/mI2xZzbwyImuwr3
	 sXpp1fnaoUHxsHprpO9GlWzGA5zSwDqwISZMFJDCoiCXns6/d2pKI/aAd6/LeIZHnl
	 Wepw6CIFoaPc9awHDIlRvT/8GMdFaH/cq+XRoNgFzqmfKnAtX7rbHAAk406oIttYeC
	 uJJiarOyJOmGZLQdPQu0STWerNp/ComS7IGJIUkacUqzw7zVw3Y2oLMKDH8im12Pwr
	 8nkZzrME+UssgH0ihnJZWsXuVaBk9tCS2G53ydeCScKxdgTJnLTyN9bQxkE5fli82Y
	 iKOFecBlk4+yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2D683E8F;
	Wed, 29 Apr 2026 09:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA49D231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBCBC83E8E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hFhYqorsofY for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 09:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FF9083E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF9083E8A
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FF9083E8A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ4m/+s2zWirb0slCUVsCc4GDixmG6zP43sDVOsuFhx8p8uOO+FEG/Kph1oLCrnPeShZz3d9pUllbejK0RWu82T9V72Urbat7trnx1Nw3E56giClvsEjMp7MvN8gk1RuKatL31nlw9MkbX4+5PMMEodbv/3BIYKOoPRMHo3+Qoyw+2ObQpR9Giq1qqrgc6DZRDDeu1N5ozBREbSQIT0t+R15gdgco4WDFzA280UpRF1zJgBgmPkYc5lP8tf/JvLkLwi1+SxqW1OCJdUPbWHKZqQdHNcIw4vI9zHXelvM3Z6SLoRbTYcRADPVi6RSjhjdYFPoTPtJhDGE92ApfoxKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkmmk4qjBBkv+j7B/uP22wqQe+QdsLVA+QR7JSijiGc=;
 b=P/1PqzehsWzT7J+24mOIUIhbU1Yn8RRLiyvAg6A6CXLcmmvyHiTo3jgVAYDQhqBFAjJscuKOE9mT/t6r2TlT83I3RfyUih/kqdFkvCHrn8JxXZ27UbEFcVjhtuDwBgz08US0V4r1h9j/kYaZyj5MiZLgCUcYXltOzHA/sceSJmi3pNa00lT5ppI0Py3OV142k4L5ZwG59LUe16Mib1Za9uwYRpQJkIZ9/0labjuTV4eQQJoK5JYmL1tkyJW+GGr/71amOWthkxrMFoDQSndHDp8RpoCGgmFAhY9aLzFY3nhA9pmc6WfExmUjH1j1oLVETebHOeblDwM7A97CnPfphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP265CA0386.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::19)
 by VI1PR02MB6144.eurprd02.prod.outlook.com (2603:10a6:800:186::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 09:36:41 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::5a) by CWLP265CA0386.outlook.office365.com
 (2603:10a6:400:1d6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 09:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 09:36:40 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 29 Apr
 2026 11:36:40 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 29 Apr
 2026 11:36:40 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 29 Apr 2026 11:36:40 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id 561B2A82;
 Wed, 29 Apr 2026 11:36:40 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 4B8B4305D2A6; Wed, 29 Apr 2026 11:36:40 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>, Petr Vorel
 <petr.vorel@gmail.com>
Date: Wed, 29 Apr 2026 11:36:15 +0200
Message-ID: <20260429093615.3993498-3-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429093615.3993498-2-kanak.shilledar@axis.com>
References: <20260429093615.3993498-2-kanak.shilledar@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|VI1PR02MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c9b8ed-194e-4e28-d465-08dea5d2d170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jF/3DIxje0gPgTSMMF6mE+9ezAL5+EPaw1E6fL0mLEpi5jEIDBo+lfWT584+DiuwZ9ZAQtmBBDF0gBrtzFvqbSRiaXSaGfMXXltagvtTBDG65A8F/pgZIazvtaI4mPisxflPDHgX81VncBMHfyREK6cx39BCrdBW/UqNTbw2c9O8qC1UDAbZ63soYZpcop8+ctYosNoxwl+TnGukLcVaVzaoJH6kToeZcxF6cLrsJSShQOCYo8uLflc2NGwJSG7flZZ77M6hjElpm8wfoiv+CNd95Oh1wClg8S8tWbkV2ascnWLh4cUlnZp0TpS1EBQ6jP7RGFx93Ale2u1Eifl1m+mPDM2EUDn6h69Q0LPU4Nv7kYyBCDbFEkHH7YTr/3Nyr5XV0yed9LiNCXYtc9YffjWXMqwPvDBQ6+q0zQ9HhctsEwbVE9ZPz6Z96IHNpy48YSj3l88rB3m6ACBzR+zm2CyxpNyQhFkfGug5d6Ooh2s79XSZjl4+Dt5x6fCo3EBa3y+Lzqsg4s1YiOwXrXSzmbogvp3bzG5LyQ8klP9vbxixtKn9qtrcvVOMvn57SWQ8sydNtgVsQSO9VTvlpZ/sd3jJhFE7RVtukNg6pKbVSGngcAPzH1pFucSiLD0gz7MMJi3R/ApKzZ8LOOzXqGukysom7J7/85VpcXz93IFBRGx0NFgd9F05Bwy1TShGyRY94ogLcSSPrYSZU1ty/tNJto3tj0gUYCb/nM6VyAgXdAINLGLYd1IKi6hm7L2733gGbtCRKyXMuXpkSqOlHBb/sA==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: waZ5cjH7R/6QymfgyKgovNhd4UkUeFQauFGc56j4cCHKd0clxGi+ygBbDxjRojXP2ZwEZZwyqgxJkUckCVZlfiUf6i7MbZyg8t5KcEtkjk6C8AzfxmxQ2IIagqvM++XFuvHWyd0QYdGai9GXNk+1G9ndZE+RfgX17FPdgfETGF71QrHhPagGCm9RwGE3UOZ7r+xr0pLgvBn5cJ6+uNnxJ9kwNMpFIW9r780nQDhqMNMV11SarjZTmdtj35u2BaKHnQKtyhH2qkbws8eTzwZwjSQgWCHmBaSUw0S8mP2AfO2de80PGtzD3LhReQPO7/HBhEocGKn5ZJ2T7rlMni8kBT9aQNJfc+zhiScXQOdJrPYstfG0RSxzgUEHmPUo93c7h71v9SSOJckn5SdvjmWo0rLH5joSRG6cXocCkBjf4cTvZ9aVsoAHN/lJxCjBD05k
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:36:40.8349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c9b8ed-194e-4e28-d465-08dea5d2d170
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkmmk4qjBBkv+j7B/uP22wqQe+QdsLVA+QR7JSijiGc=;
 b=HZmuShsUfayyhEulE9mDjRuzAG68G//iat6hWqEX96REMuOZTeeUF/+yFmEiNHSyiJTQGfXMdE9XJB7QoVauFdBTSnc/IGGDb5FdpV21CQFWh2uEPe1LcgnGprf7/b5z6iJo8WJ849+5BRdjr8NGjpfphCeobu6PDtQTaifoB5Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=HZmuShsU
Subject: [Buildroot] [PATCH v3 1/1] support: kconfig: Fix compiler warnings
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

QWRkIGEgbmV3IHBhdGNoIHRvIGZpeCB0aGUgY29tcGlsZXIgd2FybmluZyBnaXZlbiBvbiBVYnVu
dHUgMjQuMDQuNCBpbgpgdXRpbC5jYCB3YXJuaW5nIG9mIGAtV2Zvcm1hdC1vdmVyZmxvdz1gLgoK
YGBgCi4vdXRpbC5jOiBJbiBmdW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmToKLi91dGlsLmM6
ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0
ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3Zl
cmZsb3c9XQogICA4NiB8ICAgICAgICAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Ci4vdXRpbC5jOjg2Ojk6IG5vdGU6
IOKAmHNwcmludGbigJkgb3V0cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGlu
dG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDQwOTcKICAgODYgfCAgICAgICAgIHNwcmludGYoYnVm
MiwgIiVzJXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KYGBgCgpVcGRhdGUgYGJ1ZjJgIHRvIGBQQVRIX01BWCsyMGAgc2ltaWxh
ciB0byBgYnVmYCwgdGh1cyBnaXZpbmcgZW5vdWdoCmhlYWRyb29tIGZvciB0aGUgZmlsZW5hbWUg
c3VmZml4LgoKLS0KQ2hhbmdlcyBpbiB2MzoKKiBVcGRhdGVkIHRoZSBjb21taXQgbWVzc2FnZQoq
IEdlbmVyYXRlZCB0aGUgcGF0Y2ggdXNpbmcgYGdpdCBmb3JtYXQtcGF0Y2hgLCBhbmQgYWRkZWQg
dG8gdGhlCiAgYHNlcmllc2AuCgotLQpDaGFuZ2VzIGluIHYyOgoqIENoYW5nZWQgZnJvbSBkaXJl
Y3QgZmlsZSBmaXggdG8gcGF0Y2ggYmFzZWQgZml4LgoKU2lnbmVkLW9mZi1ieTogS2FuYWsgU2hp
bGxlZGFyIDxrYW5hay5zaGlsbGVkYXJAYXhpcy5jb20+Ci0tLQogLi4udXBwb3J0LWtjb25maWct
Rml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoIHwgNDUgKysrKysrKysrKysrKysrKysrKwogc3Vw
cG9ydC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzICAgICAgICAgICAgICAgIHwgIDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC9r
Y29uZmlnL3BhdGNoZXMvMjQtc3VwcG9ydC1rY29uZmlnLUZpeC1jb21waWxlci13YXJuaW5ncy5w
YXRjaAoKZGlmZiAtLWdpdCBhL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzI0LXN1cHBvcnQta2Nv
bmZpZy1GaXgtY29tcGlsZXItd2FybmluZ3MucGF0Y2ggYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hl
cy8yNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRjNzYyNzQxMjMKLS0tIC9kZXYvbnVsbAor
KysgYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBp
bGVyLXdhcm5pbmdzLnBhdGNoCkBAIC0wLDAgKzEsNDUgQEAKK0Zyb20gMzkyNjI0NzQzZTcxNjZh
MDU2NDc0Y2Q4M2IxODc0MzQwOWQyNTU2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IEthbmFrIFNoaWxsZWRhciA8a2FuYWsuc2hpbGxlZGFyQGF4aXMuY29tPgorRGF0ZTogRnJpLCAy
NCBBcHIgMjAyNiAxMzozMjozNiArMDIwMAorU3ViamVjdDogW1BBVENIXSBzdXBwb3J0OiBrY29u
ZmlnOiBGaXggY29tcGlsZXIgd2FybmluZ3MKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworT24gVWJ1bnR1IDI0LjA0LjQsIHRoZSBjb21waWxlciBnaXZlcyB0aGUgd2Fybmlu
ZyBvZgorYC1XZm9ybWF0LW92ZXJmbG93PWAuCisKK2BgYAorLi91dGlsLmM6IEluIGZ1bmN0aW9u
IOKAmGZpbGVfd3JpdGVfZGVw4oCZOgorLi91dGlsLmM6ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZ
IGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXpl
IGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9XQorICAgODYgfCAgICAgICAg
IHNwcmludGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOworICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn4KKy4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNwcmludGbigJkgb3V0cHV0
IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGludG8gYSBkZXN0aW5hdGlvbiBvZiBz
aXplIDQwOTcKKyAgIDg2IHwgICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1l
KTsKKyAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgorYGBg
CisKK1VwZGF0ZSBgYnVmMmAgdG8gYFBBVEhfTUFYKzIwYCBzaW1pbGFyIHRvIGBidWZgLCB0aHVz
IGdpdmluZyBlbm91Z2gKK2hlYWRyb29tIGZvciB0aGUgZmlsZW5hbWUgc3VmZml4LgorCitTaWdu
ZWQtb2ZmLWJ5OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrLnNoaWxsZWRhckBheGlzLmNvbT4KKy0t
LQorIHN1cHBvcnQva2NvbmZpZy91dGlsLmMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcv
dXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYworaW5kZXggODY2NWY1YmI4OS4uYzJlNzk3
OWFjMSAxMDA2NDQKKy0tLSBhL3N1cHBvcnQva2NvbmZpZy91dGlsLmMKKysrKyBiL3N1cHBvcnQv
a2NvbmZpZy91dGlsLmMKK0BAIC0zNSw3ICszNSw3IEBAIHN0cnVjdCBmaWxlICpmaWxlX2xvb2t1
cChjb25zdCBjaGFyICpuYW1lKQorIGludCBmaWxlX3dyaXRlX2RlcChjb25zdCBjaGFyICpuYW1l
KQorIHsKKyAJY2hhciAqc3RyOworLQljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9N
QVgrMV0sIGRpcltQQVRIX01BWCsxXTsKKysJY2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYyW1BB
VEhfTUFYKzIwXSwgZGlyW1BBVEhfTUFYKzFdOworIAlzdHJ1Y3Qgc3ltYm9sICpzeW0sICplbnZf
c3ltOworIAlzdHJ1Y3QgZXhwciAqZTsKKyAJc3RydWN0IGZpbGUgKmZpbGU7CistLSAKKzIuNDMu
MAorCmRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMgYi9zdXBwb3J0
L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMKaW5kZXggY2MxNzYwMzViZS4uY2EyMTkzZTczNCAxMDA2
NDQKLS0tIGEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzCisrKyBiL3N1cHBvcnQva2Nv
bmZpZy9wYXRjaGVzL3NlcmllcwpAQCAtMTIsMyArMTIsNCBAQAogMjEtQXZvaWQtZmFsc2UtcG9z
aXRpdmUtbWF0Y2hlcy1mcm9tLWNvbW1lbnQtbGluZXMucGF0Y2gKIDIyLWtjb25maWctbHhkaWFs
b2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKIDIzLWtjb25maWctbW4tY29uZi1oYW5kbGUt
YmFja3NwYWNlLUgta2V5LnBhdGNoCisyNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBpbGVyLXdh
cm5pbmdzLnBhdGNoCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
