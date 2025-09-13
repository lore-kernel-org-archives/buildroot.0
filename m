Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA03CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D40841D7;
	Sat, 13 Sep 2025 17:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReJLhraloOpP; Sat, 13 Sep 2025 17:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB2C841A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB2C841A2;
	Sat, 13 Sep 2025 17:33:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D5B12D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13F4605D0
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBMn-v00gL0J for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 17:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE4FF60746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4FF60746
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4FF60746
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:33:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45f2313dd86so15669715e9.2
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757784795; x=1758389595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YI+5IAkJLlp5A10X8YI7dcAXy4MjQqcADSkcYb7O5rk=;
 b=OUc2KEIcZwhYSVknnSN06UOfYy9Uxfjlh1xVjshw1F9wE/WdE+NJyJtIA0+i+1QLF2
 hDqfIlyFNGp8KmRRF6uNHqZ5dfbWf5lypPVgEpvpfA5iHKwJ5oyGoh8DYIoZf/Lqo44K
 mWgTPOgTG2ZTWo+YvcxI1WRKBdCGZcEufpObQ00VLiE0o+o9dOaIXVteLX9WqmQyMLuX
 XU9UYh244oH5VL3kHpYkw+sF8NZ5HAgKU5L2M6rClrSE4KnBlXHCtRTxxP4hZIMX4+aG
 YOWQw/mTuoyUreyC5SFP4q6oqAHZNysqpzkMPPrrblOCNmZyBilO/cZtYXoVrm8hvil3
 vcPw==
X-Gm-Message-State: AOJu0YxFSsC3NXuqC/t0gXoXPPnQljwW10sy3HdR/NLE6COqz4iqKojJ
 kNTOujXeGD/3cV9lEPxsv0IjEQh9YPcNIAyJFHaknDHA7O3hF+Lurj0h+x6kNU+h6XJx+EY2wan
 /Z0q5mlsA3g==
X-Gm-Gg: ASbGncuHtee6d5j8qe/PeP8yBE97Ml+1RO6QVWs0RRA/uO8N/jsFN+f6084lzEeWIP2
 6Ew+SiME4vmNpnxmpnc3fnH9C8daPuowdcVS8eC/KH+/G7L9GxxoQPtm/a/mmOnnCZ+1Ms2LdsS
 PwsiUEYtwro11XQlgT508fMuKPOxOv7uIoT/5GbTslCC+NLeDmLsc6Npyaya2oXWH3LpMukZT3W
 /L2VPy0uGQTQFN1VTjJJyCIOpI2+MWCPFBBvAmccCD0jHza2FZnD2x7InP6DkxzGfloaYCq/A8P
 p4kM/xArsUIzzSJBpmI7j0jkQnGIgaHB3RPoH41UpzIno/nTVthoBCnje6RSKXGdObTKipSoPsM
 2Slr4dxB+sMBlTmhY3+gtZf11NRKVDJ3r7lOSn4ucdSv4ZJ6pHJE4psEnZveDbLGQuqDfo5NJNq
 vWlNkH3DrRrLNRQNjLdlV1
X-Google-Smtp-Source: AGHT+IFrhr16GjAcbv032OIfvmUBjLSitZmIfc8msv52BdJAxGzSFHvd1ySbM45AIx4tAkrPeGnpkA==
X-Received: by 2002:a05:600c:c4aa:b0:45b:7d24:beac with SMTP id
 5b1f17b1804b1-45f211d4635mr80576905e9.10.1757784794809; 
 Sat, 13 Sep 2025 10:33:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0156d40esm111056805e9.1.2025.09.13.10.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 10:33:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 19:33:11 +0200
Message-ID: <20250913173311.2624001-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250913173311.2624001-1-romain.naour@smile.fr>
References: <20250913173311.2624001-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757784795; x=1758389595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YI+5IAkJLlp5A10X8YI7dcAXy4MjQqcADSkcYb7O5rk=;
 b=uRQFvSAZjU18PzwsZnL9FyWc/JufWtkXLrG4peXFNlRQd+RdNanvqYUJ6bmE8GFTqv
 Y2jqtPOh7CBh/GldUxvMQp8beMaFsx/jcZ+qY5SJeCm0+kpUyCU/m8U39mp58ivsK1XO
 2seyoPGVsMl+qz6hiToJqGhKMCVtmVy3OJH7Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=uRQFvSAZ
Subject: [Buildroot] [PATCH 2/2] package/python3: do build-time detection of
 non-working uClibc-ng aarch64 toolchains
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgcmVwb3J0ZWQgb24gdGhlIG1haWxpbmcgbGlzdCBbMV0gd2hpbGUgaW52ZXN0aWdhdGluZyB0
aGUKVGVzdFpmc1VjbGliYyBHaXRsYWItQ0kgZmFpbHVyZSwgdGhlIHB5dGhvbiAzLjEzIGludGVy
cHJldGVyIGl0c2VmCnNlZ2ZhdWx0IGF0IHJ1bnRpbWU6CgogIEZhdGFsIFB5dGhvbiBlcnJvcjog
X1B5VGhyZWFkU3RhdGVfQXR0YWNoOiBub24tTlVMTCBvbGQgdGhyZWFkIHN0YXRlCiAgUHl0aG9u
IHJ1bnRpbWUgc3RhdGU6IHByZWluaXRpYWxpemVkCiAgVGhyZWFkIDB4U2VnbWVudGF0aW9uIGZh
dWx0CgpUaGlzIGlzc3VlIGlzIHJlbGF0ZWQgdG8gdGhlIHB5dGhvbiAzLjEzIHZlcnNpb24gYnVt
cMKgWzJdIHdlcmUgc2V2ZXJhbAppbnRlcm5hbCBjaGFuZ2VzIHdlcmUgYWRkZWQgWzNdIHRvIHN1
cHBvcnQgUEVQIDcwMyBbNF0uClBFUCA3OTMgaXMgYWJvdXQgQ1B5dGhvbuKAmXMgZ2xvYmFsIGlu
dGVycHJldGVyIGxvY2sgKOKAnEdJTOKAnSkgcmVtb3ZhbApmb3IgbXVsdGktdGhyZWFkcyBzdXBw
b3J0IHRoYXQgcmVxdWlyZXMgYSB3b3JraW5nIEMxMSAidGhyZWFkX2xvY2FsIgpmb3IgdGhyZWFk
LWxvY2FsIHN0b3JhZ2UgWzVdLgoKU2luY2UgaXQncyBvbmx5IGZhaWxpbmcgb24gdUNsaWJjLW5n
IG9uIGFhcmNoNjQgdGFyZ2V0cywgZG8gYnVpbGQtdGltZQpkZXRlY3Rpb24gb2Ygbm9uLXdvcmtp
bmcgdUNsaWJjLW5nIGFhcmNoNjQgdG9vbGNoYWlucy4gQW5vdGhlciBzb2x1dGlvbgp3b3VsZCBi
ZSB0byBjb21wbGV0ZWx5IGRpc2FibGUgdUNsaWJjLW5nIG9uIGFhcmNoNjQgdGFyZ2V0cy4KClsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvN2E0ZDI0NWQtMTU1Ni00M2M5LTg5
OTctNmIxZjc5MWFmYmZlQGdtYWlsLmNvbS8gKFRlc3RaZnNVY2xpYmMpClsyXSBkNjNlMjA3ZWI4
NjkwNjNmODJjODY3NjU4Njc2YzI5MDNiZWIwOGNiClszXSBodHRwczovL2dpdGh1Yi5jb20vcHl0
aG9uL2NweXRob24vY29tbWl0LzZlOTdhOTY0N2FlMDI4ZmFjYjM5MmQxMmZjMjQ5NzM1MDM2OTNi
ZDYKWzRdIGh0dHBzOi8vcGVwcy5weXRob24ub3JnL3BlcC0wNzAzLwpbNV0gaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9vbmxpbmVkb2NzL2djYy0xNS4xLjAvZ2NjL1RocmVhZC1Mb2NhbC5odG1sCgpDYzog
V2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KU2lnbmVkLW9mZi1ieTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Ci0tLQogcGFja2FnZS9weXRob24zL3B5dGhv
bjMubWsgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rIGIvcGFja2FnZS9weXRob24zL3B5
dGhvbjMubWsKaW5kZXggMTU0NjkxNWYwOC4uNjAzNjQ0MjFmMyAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9weXRob24zL3B5dGhvbjMubWsKKysrIGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKQEAg
LTMyMywzICszMjMsMTIgQEAgUFlUSE9OM19UQVJHRVRfRklOQUxJWkVfSE9PS1MgKz0gUFlUSE9O
M19SRU1PVkVfT1BUSU1JWkVEX1BZQ19GSUxFUwogaWZlcSAoJChCUl9CVUlMRElORykkKEJSMl9Q
QUNLQUdFX1BZVEhPTjMpJChCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDKS0kKEJSMl9UT09MQ0hB
SU5fSEVBREVSU19BVF9MRUFTVF81XzEpLHl5eS0pCiAkKGVycm9yIFB5dGhvbjMgZG9lc24ndCB3
b3JrIHdpdGggdUNsaWJjIGFuZCBrZXJuZWwgaGVhZGVycyA8IDUuMS4gUGxlYXNlIHVzZSBhIGRp
ZmZlcmVudCB0b29sY2hhaW4gb3IgdW5zZWxlY3QgUHl0aG9uMy4pCiBlbmRpZgorCisjIFNpbmNl
IHB5dGhvbiAzLjEzLngsIHVDbGliYy1uZyB0b29sY2hhaW4gZm9yIGFhcmNoNjQgdGFyZ2V0cyBj
YXVzZXMgYQorIyBzZWdmYXVsdCBhdCBydW50aW1lLiBFbmNvZGluZyB0aGlzIGFzIGEgZGVwZW5k
ZW5jeSBpbgorIyBDb25maWcuaW4gY2F1c2VzIHRvbyBtYW55IHByb2JsZW1zIGZvciBwcm9wYWdh
dGluZyByZXZlcnNlCisjIGRlcGVuZGVuY2llcy4gVGhlcmVmb3JlIGluc3RlYWQgd2UgZG8gYSBi
dWlsZCB0aW1lIGNoZWNrLgorIyBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvN2E0
ZDI0NWQtMTU1Ni00M2M5LTg5OTctNmIxZjc5MWFmYmZlQGdtYWlsLmNvbS8KK2lmZXEgKCQoQlJf
QlVJTERJTkcpJChCUjJfUEFDS0FHRV9QWVRIT04zKSQoQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElC
QykkKEJSMl9hYXJjaDY0KSQoQlIyX2FhcmNoNjRfYmUpLHl5eXkpCiskKGVycm9yIFB5dGhvbjMg
ZG9lc24ndCB3b3JrIHdpdGggdUNsaWJjIG9uIGFhcmNoNjQuIFBsZWFzZSB1c2UgYSBkaWZmZXJl
bnQgdG9vbGNoYWluIG9yIHVuc2VsZWN0IFB5dGhvbjMuKQorZW5kaWYKLS0gCjIuNTEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
