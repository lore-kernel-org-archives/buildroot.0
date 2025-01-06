Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA8E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 594D280AED;
	Mon,  6 Jan 2025 13:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMUSh0sv0v12; Mon,  6 Jan 2025 13:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6474A80B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6474A80B14;
	Mon,  6 Jan 2025 13:43:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CDB7DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CCDD40216
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBhrWA7w04KR for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DD5C402DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD5C402DE
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DD5C402DE
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so2403652066b.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170971; x=1736775771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=WHASJ6O2qIk5E3b/jjBLdKJdb0HkU8bmYbDYccWrvrKGHlX6q+HMIZPe+AWhxtXtLt
 MppLiLX8fr4OVulvOcJVrF/JYB6z/vWCgWWzTay41uQg85cSk5X69U7wmu31ntPXV1E8
 HBjV1F388NE4ydOqH66f4e4xdb/i5X7ZUCcI5Ezmpirix3EJSM9nQRIYI0tK2n5J8iFQ
 n6qKyf4xWMQN419leOWlVvnwlRoAPf/CVPMVpD89j6ATZme12ZstMvU5lCdEwC160kem
 iEnasCgh1j2SCMuxVcu6S/bjlGgKVHjSLECNsLXExanJMctmx7yZ4z8AOqd6lxcOp9gT
 mbiA==
X-Gm-Message-State: AOJu0YyNfvlH+GECqeyJ8PuOovh2sFvn4uGs7AH/n4j675upc6znL3Dk
 FUWAhWMOooV2QCz2LxDX6Au/JjyLQYdEGx4FAu2by3j6q0ToA12NZ2q1ng==
X-Gm-Gg: ASbGncsxa56fTQP0dMdMWninHUsk7xOQYxuEd1T1AuUtrgcqi9I+HPiW+u9dOV+cLex
 ZzgXjFtuS8Nn7cjl65B3AqJvAuLbBBvzMXQ+HIc+Y1dvNN1xbaDkXcgw7SrSvLT4DFhQxhsFLTw
 qPl0V35sQX+Tv2m8qyb7zqjNSrT57EZBFIDJBD2kkNb26AbXWFexTguxJj46jBEcauVxz4hTHkg
 +87jou7T1JiswDy4thn+R2wFLxBxvOYW5FA0AksaxXP4+b6I1sENg5drhYgVcrRKbsUZILWYQ==
X-Google-Smtp-Source: AGHT+IHJG1y5HJhHZ8IvrQUcGZQkogZoq+vV/izqHeorULEMoI9+8knSR9yXhDNz3ZA/sfooR/PCwA==
X-Received: by 2002:a17:907:9804:b0:aaf:123a:e4f0 with SMTP id
 a640c23a62f3a-aaf123af03emr3628035566b.6.1736170971452; 
 Mon, 06 Jan 2025 05:42:51 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:50 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:20 +0100
Message-Id: <20250106134219.1914954-9-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170971; x=1736775771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=brA0i9NWa1UA/YnG1XiEVAWW4qg/8cEGwmGOhTvVMRjBsX46iq02rEAW0ObW/JmjfZ
 QW0x7F0/9r+n9nvBG14d51uHb5xEdq/+9RUPfymZJ++LYun5ZlusqZLrgd/OYSDPQgAQ
 9Yxmr1QgdSae7iU6/fS3ZZEq7/LCLHCdGECRIwsmD4Ow2163Xh9/eHbcu+JetzV0j48E
 BIu/X6V2CHgaX/mU2imXItZnp548fjlcrHCO+5dbispGBX1+sw3J8qySlU59/uRH2wm0
 cF/M++muLlL6+QOYjmVBXRqkVOz+//vat8W6nK3TtPWkDB0gkGSd1/nLCAxJa6h74jQI
 WSJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=brA0i9NW
Subject: [Buildroot] [PATCH v4 8/9]
 support/testing/tests/package/test_sysrepo.py: add new test
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

U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgotLS0K
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc3lzcmVwby5weSB8IDI1ICsrKysrKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc3lzcmVwby5weQoK
ZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGFlZGQ3MzY3NzIuLjM1
MzQ0NThhOTYgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM4
OSw2ICsxMzg5LDcgQEAgRjoJcGFja2FnZS9yYXVjLwogRjoJcGFja2FnZS9zeXNyZXBvLwogRjoJ
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl95YW1sbGludC5weQog
RjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25feWFtbGxpbnQucHkK
K0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc3lzcmVwby5weQogCiBOOglI
ZXJ2w6kgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CiBGOglwYWNrYWdlL2FsY2hl
bXkvCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3N5c3Jl
cG8ucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3N5c3JlcG8ucHkKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYmYwYzJhMTMwNQotLS0gL2Rldi9u
dWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc3lzcmVwby5weQpA
QCAtMCwwICsxLDI1IEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKKwor
Y2xhc3MgVGVzdFN5c3JlcG8oaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBp
bmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICAiIiIKKyAg
ICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgIEJSMl9QQUNLQUdFX1NZU1JF
UE89eQorICAgICAgICAiIiIKKworICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAgICAgICAgY3Bp
b19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNw
aW8iKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJtdjUiLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKKyAgICAgICAgc2VsZi5lbXVs
YXRvci5sb2dpbigpCisKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygic3lzcmVwb2N0bCAtaCIp
CisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soInN5c3JlcG9jdGwgLWwiKQorCisgICAgICAgIHNl
bGYuYXNzZXJ0UnVuT2soInN5c3JlcG9jZmcgLWgiKQorICAgICAgICBzZWxmLmFzc2VydFJ1bk9r
KCdzeXNyZXBvY2ZnIC1YIC1kIG9wZXJhdGlvbmFsIC14ICIvc3lzcmVwby1tb25pdG9yaW5nOnN5
c3JlcG8tc3RhdGUiJykKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygnc3lzcmVwb2NmZyAtWCAt
ZCBvcGVyYXRpb25hbCAteCAiL3N5c3JlcG8tbW9uaXRvcmluZzpzeXNyZXBvLXN0YXRlIiAtZiBq
c29uJykKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
