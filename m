Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF0CE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 15:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CE0606F3;
	Thu, 19 Dec 2024 15:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtnchnLoT0Ba; Thu, 19 Dec 2024 15:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8067760715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8067760715;
	Thu, 19 Dec 2024 15:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6240875B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C0054028D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzzAfekr8lYR for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 15:21:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51553400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51553400DA
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51553400DA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:59 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aabbb507998so169675566b.2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734621716; x=1735226516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=S4JeTyGW+2pCyVHNT6vAYnPqSxUBT2+yHnPJYKxho7zwiOfv7rkwKmoQsg17668/kG
 rG9FasIjPLF9HnZRd990XC3/LbMv0uUyLNOJFqvVPHsB5OBxES1rQEad95pkoLJFlTT7
 PhjEmqB+I99wFOoH3JnMcSiogAO1JjKvQi3m95hNJc5CbJ4enlDOBA44X1xahbkn+Fu/
 xFx0HCQNM5+D6hP+Ezg7n7cobVc9mgufumVyBmjfweG0lG3mK8N8/3NfA0Tczbmjd0c+
 AFCx4YkbJ/aYz7J7n4SHfw458U65aC7OUF4NXrEYOUhAJaLoeZTE+XlTYMWUfGdme2hN
 M1Kg==
X-Gm-Message-State: AOJu0YyQKB5uj27SG8yWa3fwxIdtj16TjfRmOOZskmQn91qsIOiZ0TCc
 vjq4zUCIWWTjg2QyJNooAOO745FRNuuubUcWilOTMhN8QRKoUNqlmbRulw==
X-Gm-Gg: ASbGnctBtVmDLcoySDCgndFEiz0ewbKAWZL+imoTwxsW4v6ouRKyLXlwfbnu2zhLJJn
 C+bRctNCnxTu2O9sU9VVxpsijju31DpJOHviJRhXFAFYbRebGqtRROeAOT8TFAv9HRnoTUhuUlU
 7u+wMBtbXHODPsgJBJd5qiLYkHXAChfb1xI53kxrcxLtVXhm2G3mqb3FK2dx7epetTHQK2Naix2
 qWpJe62PYGqLw65pdcHWp/sWxCOXrUE2sROdy1kdJuKxuBo/jnAGy50t0k9OzNS9jN8CtH+nQ==
X-Google-Smtp-Source: AGHT+IEYkm7tgLVe/a/Fd/j0jQX9dbn1fm2KSnk5ka1942mlPLNAM3zjlLcId5BE1VR88YmcoJpsMA==
X-Received: by 2002:a17:906:6a20:b0:aab:8a24:d5a5 with SMTP id
 a640c23a62f3a-aabf47a746dmr656092366b.30.1734621716025; 
 Thu, 19 Dec 2024 07:21:56 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f070a7bsm75504166b.201.2024.12.19.07.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:21:55 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 19 Dec 2024 16:21:09 +0100
Message-Id: <20241219152105.298310-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219152105.298310-1-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734621716; x=1735226516; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=Qq+60nrJcoB0woNQTPP/sX/gy97ktS83uLPbLSj19Re2B3j5BV6l876Wq9Kv7LAp57
 mFBZuyqXF6NHfUwWjA/ejuODdHxK93nhjBleVTI3L7SBh8dT0UYRyKlzCIGjUDbk7YyG
 AuF6oPQxaz2wyZK1tKAGCIKJp5NchgMa46uNmfoEJggLl0aUygjSTy7ZLbDVIUyAp5Gm
 IHMIEEVXESYZesO6vq6vwLSIegS55nDJdmsKoEgdik2zhc4pV5U8hpmDBm5h4OP6XAJ4
 QeKs8nT5CtaGTyDXZ4xPjpMpHAiwu8xQIrcg+wNAIr+B5GGLfLkIgnWiJJQLeasZyUdU
 Cp7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qq+60nrJ
Subject: [Buildroot] [PATCH 5/6]
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
