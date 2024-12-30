Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2222EE7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFC8407D6;
	Mon, 30 Dec 2024 11:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Pq2Rrqqlj1X; Mon, 30 Dec 2024 11:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC34F4073F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC34F4073F;
	Mon, 30 Dec 2024 11:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD9ACA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F093A40E3E
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ae82DUIt5yXh for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAF5B400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAF5B400C8
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAF5B400C8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:16 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaec111762bso1230090466b.2
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558694; x=1736163494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=mT8X2JOGH1PUYkMpZA1T6OH5rKb3mGTFZxwqlTNBWA1NvjhBwX+lVOtDrFD05FQ0oC
 cykVnBHXddAqDVpcuD5fmmwUmTXwGi8UK1Q3Lcg623iHhqVQt3P6UqbEE+ykUyuCPPbp
 WO/ET13bowU9kVnkx7fH5QymDL3NA6+1sjxz9EUNcIXQMXBpMQW2hY54qyMGxP6HzjlB
 N9Axez/mlkGl9e4Duu9mz3Nutl7u1lyQY8pyw9MTYSznA7RTrqXeVxQMlxbLaCm9A/I9
 I0VwZ4PHfXNGDwMpDuCnh36IeSfukQGjm41m0tirCU42f0HcGOsDi3oCJTgqEfflO0v/
 /L+Q==
X-Gm-Message-State: AOJu0YwoFguQRVuqP2eRA6LlOauaDTZtVFnUs3UB5XWG749CqQmO/wJG
 ZpAKkFHxheXBV6tdm0I6VHBxsm7Gvc/YzxoqiiLLkFczysz3vId6fyWCPg==
X-Gm-Gg: ASbGncss0J/T72XxeoM9C2PnLjbXiFeLfh4IickWolgUGtSa46xSucJZObyQIr3iFRF
 57FdDc9ltpwpTso6yjSvg/vpoUxfl85kKcNapbCKcsonp/vggEIuOP5N/Wt+FnV819Bz5AZHDSX
 xaTxJbtjEfm3IrHTN4gdSdXy+dinYfRySgQESOvcjz+AHxmsaFJB4FN2pdhgP/LvM4efXcGfU3r
 9rMvxFZfmHD4D6/bETBNJiRYYAvfSfPz0FBcxtVwojJH6o7RNfbJRrNkTXMs23czbKsN9e/
X-Google-Smtp-Source: AGHT+IFvbIopzqVBc3aU8Ju0xwHxqMEGSWITQ64B7bnqAoGbMdDDaTbMDWqwYBMX8+VjBX5V3A66zQ==
X-Received: by 2002:a17:907:2d1f:b0:aa6:966d:3f93 with SMTP id
 a640c23a62f3a-aac2b0a5b51mr2916806766b.23.1735558693569; 
 Mon, 30 Dec 2024 03:38:13 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:38:13 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:16 +0100
Message-Id: <20241230113710.679717-6-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230113710.679717-1-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558694; x=1736163494; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlp2o4rAXftkLvONOvs5uzTw+nfn7w1Zj5ZE5gO3r0I=;
 b=AkOHg/ECF4FiVfQYS7eQ0KonEl2evfvtrahk1aovyDWuBI7IYAzQCd6hEh4N+ycc+5
 lyBgY04zHkg9MZX2OaZYOeO5tyjtOSnshI6kT0wLUoAg3olPorQCkL9Ru/bVVyAYqXO8
 XGUs6pLlMgVsJpLqiioSeI1dWvlNLx/xMcTEaQbNBuH2BI80npY41T6ObriwTkxLO5mB
 LXT/gqWL0LnJtZ6XYqfQYoS+LQJ9ZQqUvrKAP2hCN0bl8AK1b7NngEdrmccGKYKYUHdt
 S1u9Ju+H3+ipuJoUjVgL0LtFBc2dwrzMOQcAWLIQaLn8N2TmAkHM7MRNnlf56L2RuhNj
 /cqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AkOHg/EC
Subject: [Buildroot] [PATCH v3 5/6]
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
