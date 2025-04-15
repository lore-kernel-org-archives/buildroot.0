Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CC3C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B55B26117A;
	Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPfARbh8K1OJ; Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BE561011
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BE561011;
	Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0272109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D3A841980
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rd29LO92AR5T for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 973BE40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 973BE40010
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 973BE40010
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso30615825e9.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746970; x=1745351770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAj1dXMDEMeD/I8ieozyI/oMaYfSje3wjLEsqttC/Vw=;
 b=RYWqLDtQPGixNffyrcOp3o/VgTRSZiZDp+1HCmcDHm4gnPg//eilr51V6WPDwILbJ+
 CgeX/YGDsuh4CVt3PHWxEX+gfYt9bt4hVUB6tcGj0j6FGp8ewqk1JGx7uBKTJ9yGSn4L
 L57uFMw4ptkaCSxCh0jDWnalIQnAsdepPHsRqhuskPctlsANaBACdcnfGD+6nHJmSxKd
 HK42qNaoy5glAtvyfLP2NJSBlP4xg5OelfrfXyMl9aJju/BxZrs1Q1xEIpVPx42mHGKy
 lKQblbaCY68cezwRVaTL5TDTV+Sa6RgzEe7bEMYvaK4Ta/FANfhHmUYarfY3jHAeZUWR
 6q+g==
X-Gm-Message-State: AOJu0Yyff6GCXQj98JRhlsB3tUtpHcf4RyPEnauBVmfin7Llj0vyAf5z
 UsNrO8wmCOisYkZ9wF8ctXkvmuLb+dF+ljlkZQZ+3yvH4ip0MZ0gBtOQp/xS+gZLWEPjyhdkv5h
 s
X-Gm-Gg: ASbGncv8TtcQGCneV9ao8sb5KmjyjAI62hWv9c7/PWSafBqqPKpCx/mM1of8nK63gdC
 hpXtwqpfWTx5Hlt/Um3Doid6GchSmTyxn5UcUPshQBI5lfCf4ADPI2y1+fiSUZTEi+cj8BQdX4j
 D3lSPbY4jfT061Cjz15yN1Ww7Y6nyPMGSt1A3YrWXVqqngmzV6+khsfMjPD8xjQ7eP39Y7oVn6r
 cQSWC2/YJ6rYKKM80APTWot/j1BfOQa/ZHqDdv4AWeYcUM5b8djMwXrpeYuODysiBKmMlmLzFUr
 IwJJzCjHwU7nyCt2CZ7uQbRpGUXbOcgcMcpX/10kCTPrNdG355Q+Zqc=
X-Google-Smtp-Source: AGHT+IHUjRIowVsPf90O6d8s2LXn6AzHAwgygfsa6lk4Q+P5cEzqoSUh7+zDndPHdyipU4FnXCx09A==
X-Received: by 2002:a05:6000:18a8:b0:38f:4d40:358 with SMTP id
 ffacd0b85a97d-39ee272a150mr647006f8f.9.1744746969834; 
 Tue, 15 Apr 2025 12:56:09 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:33 +0200
Message-ID: <20250415195547.199428-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746970; x=1745351770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eAj1dXMDEMeD/I8ieozyI/oMaYfSje3wjLEsqttC/Vw=;
 b=D9goiS5VWdku78JDqphN3bOrmVoRZlA5BffWROVuUvlcOz8SffPtV+blokA9qugShb
 N1Krcq1YwS+71Gi0IOlat4DKbmXhRTP+1o76Y4AGo96p2RsXJXgzs7YHwtQcB3KeXhpo
 C3iIcz9lMWpL99+ibVSw/zJOxVgrqA7LPXhM0aCsmhK5i1UhGidQFEbxuQ0AwGUWc1VX
 iCZO55gspcVVIHtukiDDhgaewm8+YKG9MlsiM2DlIrfTo58WkKW84J1pOUwKp7KPNAqV
 bm6iAHAvrbHpi2cwVkcHZU9xqx5BorrEmjmKAdgawMObb3G+Iuy4Y6G6TMQWQ+fnRzqJ
 OG0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D9goiS5V
Subject: [Buildroot] [PATCH 0/7] Add PURL support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBQVVJMLgoKaHR0cHM6Ly9naXRo
dWIuY29tL3BhY2thZ2UtdXJsL3B1cmwtc3BlYwoKUFVSTCBhcmUgYSBzb2Z0d2FyZSBpZGVudGlm
aWVyIHNpbWlsYXIgdG8gQ1BFLgpNb3JlIGluZm9ybWF0aW9uIG9uIFBVUkwgY2FuIGJlIGZvdW5k
IGluIHRoZSBmaXJzdCBwYXRjaCBvZiB0aGUgc2VyaWVzLgoKQWZ0ZXIgdGVzdGluZyB0aGUgdXNh
Z2Ugb2YgUFVSTCB3aXRoIERlcGVuZGVuY3lUcmFjayBhbmQKaHR0cHM6Ly9vc3NpbmRleC5zb25h
dHlwZS5vcmcgSSBjYW4gc2VlIHRoYXQgaXQgaW1wcm92ZXMgdGhlIHRyYWNraW5nCm9mIENWRXMg
YW5kIHZlcnNpb24gYnVtcC4gU2luY2UgaXQncyBlYXN5IHRvIGF1dG9tYXRlIHRoZSBQVVJMCmdl
bmVyYXRpb24gaW4gYnVpbGRyb290IEkgd3JvdGUgdGhpcyBwYXRjaCB0aGF0IEkgdXNlIHRvIGFk
ZCBQVVJMIHRvCkN5Y2xvbmVEWCBTQk9NLgoKVGhlIHNlcmllcyBpbmNsdWRlcyBzdXBwb3J0IGZv
ciBQVVJMIGZvciB0aGVzZSAnZWNvc3lzdGVtcyc6CiAgLSBweXBpCiAgLSBjYXJnbwogIC0gY3Bh
bgogIC0gZ29sYW5nCgpUaGUgdHJhY2tpbmcgb2YgQ1BBTiBwYWNrYWdlcyBpcyBub3Qgc3VwcG9y
dGVkIGJ5IE9TU0luZGV4IGJ1dCB0aGVzZQpjaGFuZ2VzIHdlcmUgcHJvcG9zZWQgYnkgRnJhbsOn
b2lzIFBlcnJhZCBpbiB0aGUgZm9sbG93aW5nIHNlcmllczoKCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2J1aWxkcm9vdC8yMDI0MDQwNzE0NDI1MC43NTU4LTEtZnJhbmNvaXMucGVycmFkQGdhZHou
b3JnLwoKVGhvbWFzIFBlcmFsZSAoNyk6CiAgcGFja2FnZS9wa2ctZ2VuZXJpYy5tazogYWRkIFBV
UkwgcGFja2FnZSB2YXJpYWJsZQogIHBhY2thZ2UvcGtnLWRvd25sb2FkOiBhZGQgJ293bmVyJyBt
YWNybwogIHBhY2thZ2UvcGtnLWdvbGFuZzogc3VwcG9ydCBQVVJMIGdlbmVyYXRpb24KICBwYWNr
YWdlL3BrZy1jYXJnbzogc3VwcG9ydCBQVVJMIGdlbmVyYXRpb24KICBwYWNrYWdlL3BrZy1wZXJs
OiBzdXBwb3J0IFBVUkwgZ2VuZXJhdGlvbgogIHBhY2thZ2UvcGtnLXB5dGhvbjogc3VwcG9ydCBQ
VVJMIGdlbmVyYXRpb24KICBwYWNrYWdlL3BrZy11dGlsczogYWRkIFBVUkwgdG8gc2hvdy1pbmZv
IG91dHB1dAoKIHBhY2thZ2UvcGtnLWNhcmdvLm1rICAgICB8ICA4ICsrKysrKwogcGFja2FnZS9w
a2ctZG93bmxvYWQubWsgIHwgIDMgKysrCiBwYWNrYWdlL3BrZy1nZW5lcmljLm1rICAgfCA1MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3BrZy1nb2xh
bmcubWsgICAgfCAxNiArKysrKysrKysrKysKIHBhY2thZ2UvcGtnLXBlcmwubWsgICAgICB8IDI0
ICsrKysrKysrKysrKysrKysrKwogcGFja2FnZS9wa2ctcHl0aG9uLm1rICAgIHwgMTYgKysrKysr
KysrKysrCiBwYWNrYWdlL3BrZy11dGlscy5tayAgICAgfCAgMyArKysKIHV0aWxzL2dlbmVyYXRl
LWN5Y2xvbmVkeCB8ICAzICsrKwogOCBmaWxlcyBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKQoK
LS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
