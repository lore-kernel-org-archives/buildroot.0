Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1343C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CC281DEF;
	Tue, 14 Jan 2025 07:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hp5HrdvoHnc; Tue, 14 Jan 2025 07:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E72B81DF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E72B81DF5;
	Tue, 14 Jan 2025 07:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB17DB89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A53B60E72
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yay2cFmcZLjv for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81DCF60F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DCF60F15
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81DCF60F15
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso999277566b.2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839841; x=1737444641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=GV2knCRj2ZPD9+XfDDgR3qEdG0MboxePWetBrnwf+Gk+XJQYzrSuR+Iikzg6RyuOdF
 sVUhMGLno+fVbhlJZLD8KhWE5OxUqZbkNtup1C++5TaBmIbX8ViugZ8Fz9X7K2JYBxOQ
 aOMNHiqVfhQ7323VKiRwAVUtUq0RuuJjpvSjFfWtHIKViNOK/E/jE0fUR0aBaXu4yu8u
 vqOSCcc/UE5q0vtU7SZVJDzUjqc/XBqrnDJARA6AxUGYvC7YJBtXFSbkpj8vXr1OdLY8
 11MZzL91r4tqVjkrBfgS8qWkwK+HCJ8M3t17GRBFHJNesZVhWWnEhbxqZpJP5lSK3GVh
 z8WQ==
X-Gm-Message-State: AOJu0YxnBcD32mqeFRCgAaTNDCJAgsrxqi0LTUF0N7dkAQMyzoVyjR6c
 6IrA2zcCP3fLIsjMnjk76VT05UJ8we8y+gXQ6vuIUHdhzLTSNM6gyoJH9A==
X-Gm-Gg: ASbGnctsByMlnyRH5FUwFUxdCrAYwnXPhtLoNa9b/plQgRsj+ohON/6iMDxv+BJvPTu
 6U5qnIz9zjWdHLaBlinJAE0ce6MKoerpia0Vzzq2fuXPXhgMe8KazeCSaeHMtsJZ0u/8RYAh+6O
 Hmy3qw2uuSJdJlkZNSDVCbay4V19+k8U6BoXIpWaLqJmkWm/zo9t94qG+rxD/oRGSQA4S0cUamZ
 GF4pJwcPCQloES86FcZpl8LFrX6byiN2DKIXkrcscdZoKCyIMp/usui9Bty0GHrUX023AnbTw==
X-Google-Smtp-Source: AGHT+IHH39zgVUIdRBltGNxyMdpLI4+ge8uXcEawCr/+XjrcsK4ppM1wHJwWxJTPDE2niaUWd/R91w==
X-Received: by 2002:a17:907:948d:b0:aac:29a:2817 with SMTP id
 a640c23a62f3a-ab2ab73bbf5mr1937871866b.26.1736839840871; 
 Mon, 13 Jan 2025 23:30:40 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:40 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:54 +0100
Message-Id: <20250114072947.284965-8-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839841; x=1737444641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=hazynh448WPq3M9Qkdfly9PZ967mxEyWjLhHe8duMEWy1N3ciS1+pJyMc6niy8g5Hu
 fj53HMK6+ZkJXdBxFmLL/4XHPOOLTU82jJCwauqc9oopxDfDT7GSnkJImbjyiqcWgE7T
 Tph3DBaURmK5QcA9HRKjU1u81NCMT+0+X86JNiM6gF04s7zCthmYz2kH4fHcG518hyN8
 AyQTOQyqT3QDMQxGzfF0E4oi1jWsHBcQ0csp57qGdPgcFP8CJrs+UXs9odJqL9JFR83g
 9i7II3zx1d6Zq5EFuIsnZe4jKHBNZBbVzCpBgU4O4HrMozN2an4WUpiu3S8LEgk/opin
 w7dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hazynh44
Subject: [Buildroot] [PATCH v5 7/9]
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
