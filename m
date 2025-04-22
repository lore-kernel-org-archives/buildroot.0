Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB5EC369D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD83660BDB;
	Tue, 22 Apr 2025 14:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgzdeDmrSNyJ; Tue, 22 Apr 2025 14:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6860660E77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6860660E77;
	Tue, 22 Apr 2025 14:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47B521BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382C981EE5
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tyJHbNTtf79 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13FC281EDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13FC281EDD
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13FC281EDD
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso39078735e9.0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745331597; x=1745936397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/Rt/g72Tk17+zlQkWg5TC57eI7p3XPkzVsmVfIiMz4=;
 b=aIKTn5ZrM5mEQ9/rkAp7C5EaBr3bkkyWDyIh+WqpBp9Uo+OhNuvhhkUcHchqD9/UOV
 PAeT2ypibc+fbvXCG8fUWuvvuPI4T4Rks10ZPSMiKWQCW3XXGlq57S8hdJLGkZE8zwFc
 O71CgbGjp2r7eG6yGZgZqok/btMWBnG6pyYu+a83YBNJrbV5+vcW6mkCURNtdi0H2Cdk
 zLd8hxH/xSia7MxJwKVtYryOQWrM07BznVrW0R6T8xXkGUn4C/Le8mDxY4kvv7bMXNza
 +fXLspJ8TSzGZDUPhkILXbFAubp5msMs6Ax3i1+tWrcPQkkUwt86d3niTxguhmZNC86y
 m0qg==
X-Gm-Message-State: AOJu0YxLS9kTNGW9hCMy/CBkN/ves8Rw6aHLpeS4b4HV9HJQrqPVroNn
 g0g83nIIUm2UFypd3rkJB4T1PjsgkVZv/MYBrilFnyZ5Y+MEV32bIip4rbNsiDTIBfg0v8Hz2tM
 8
X-Gm-Gg: ASbGncs7YtS1jgn5ZLZ8vh5mCYSP0yK2z7gxT/HkSLT4ioRnjel/+rzArxaX5RBoxmE
 PR7foDSnbjeULS6UZ4L7SdDDyJFXacsoIbnAIhanPKoZPZeB6uHpViYQVm6ErEsOk6cuIqTcey9
 BV8M04VhEUcgaK/YIgdmgVXOMJ7utGv01LT5KkFtQ+1vHb9D5Xt6zp9mHnGTQyyq//9Nb6wR2Jp
 Y5OFczBYOK9dCorBFXp9AryQQtqM1sCJ+Xm2u+qluE+rPpTwnlH/q3DCEA6U66K/pLqps2aL6Z8
 T6kd+371OAmhDbG36a4W8e9KdrhxmG5hxMlaXj3retCZMPcADFFTl6v0MTPuDFktOqUYTVHnt0j
 Bh2+rlwdRHT/f88IJ7K73URNYhmYIBJO0EuxV9rtd
X-Google-Smtp-Source: AGHT+IH4CgL5VVe8SuX+KpXEfo2UpfreFZNMj6y15OtKssNJMefvzWj5CkbrZdE95C8h9ulWbPrMdQ==
X-Received: by 2002:a5d:47aa:0:b0:39a:ca40:7bfb with SMTP id
 ffacd0b85a97d-39efbaf160cmr13032226f8f.54.1745331597026; 
 Tue, 22 Apr 2025 07:19:57 -0700 (PDT)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9df6sm180714555e9.1.2025.04.22.07.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 07:19:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 16:19:41 +0200
Message-ID: <20250422141943.51161-3-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422141943.51161-1-mickael.tansorier@smile.fr>
References: <20250422141943.51161-1-mickael.tansorier@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745331597; x=1745936397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/Rt/g72Tk17+zlQkWg5TC57eI7p3XPkzVsmVfIiMz4=;
 b=Y99dtX8Agzd0LUuU2IFRJDUcOGFWzI7ftIeEpWBF65Vtty/PxD60f0Iw1lrFPJTqFr
 kXXazZZZocHRUSYGZjINQoCqtIWsuhx94eaotAWN/Sb2nXjJKA+9GXjbTezdhD/1949N
 7X+xTeE0Z/9thzKdlo51aC3a0mV094Fbzk8xM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Y99dtX8A
Subject: [Buildroot] [PATCH 3/5] package/mineclonia: new patckage of
 minetest game
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWluZWNsb25pYSBpcyBhIG1pbmV0ZXN0IGdhbWUgaW5zcGlyZWQgYnkgTWluZWNyYWZ0IFsxXQpU
aGlzIGlzIGxhdGVzdCByZWxlYXNlIGF2YWlsYWJsZSBbMl0KClsxXSBodHRwczovL2NvbnRlbnQu
bHVhbnRpLm9yZy9wYWNrYWdlcy9yeXZuZi9taW5lY2xvbmlhLwpbMl0gaHR0cHM6Ly9jb2RlYmVy
Zy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlhL3JlbGVhc2VzL3RhZy8wLjExMS4xCgpTaWduZWQt
b2ZmLWJ5OiBNaWNrYcOrbCBUYW5zb3JpZXIgPG1pY2thZWwudGFuc29yaWVyQHNtaWxlLmZyPgot
LS0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21p
bmVjbG9uaWEvQ29uZmlnLmluICAgICAgIHwgIDcgKysrKwogcGFja2FnZS9taW5lY2xvbmlhL21p
bmVjbG9uaWEuaGFzaCB8IDE4ICsrKysrKysrKysrCiBwYWNrYWdlL21pbmVjbG9uaWEvbWluZWNs
b25pYS5tayAgIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNo
YW5nZWQsIDc4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21pbmVj
bG9uaWEvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9taW5lY2xvbmlhL21p
bmVjbG9uaWEuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWluZWNsb25pYS9taW5l
Y2xvbmlhLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZp
Zy5pbgppbmRleCA0MTNkMzAxNzRmLi44ZGJhZmQzY2Y0IDEwMDY0NAotLS0gYS9wYWNrYWdlL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjk0LDYgKzI5NCw3IEBAIG1lbnUg
IkdhbWVzIgogCXNvdXJjZSAicGFja2FnZS9sYnJlYWtvdXQyL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvbHRyaXMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9sdWdhcnUvQ29uZmln
LmluIgorCXNvdXJjZSAicGFja2FnZS9taW5lY2xvbmlhL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvbWluZXRlc3QvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9taW5ldGVzdC1nYW1l
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvb3BlbnR5cmlhbi9Db25maWcuaW4iCmRpZmYg
LS1naXQgYS9wYWNrYWdlL21pbmVjbG9uaWEvQ29uZmlnLmluIGIvcGFja2FnZS9taW5lY2xvbmlh
L0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4wM2NhMTE3
YTgyCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9taW5lY2xvbmlhL0NvbmZpZy5pbgpAQCAt
MCwwICsxLDcgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9NSU5FQ0xPTklBCisJYm9vbCAibWluZWNs
b25pYSIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX01JTkVURVNUCisJaGVscAorCSAgVGhlIG1h
aW4gc3ViZ2FtZSBmb3IgdGhlIE1pbmV0ZXN0IGVuZ2luZS4KKworCSAgaHR0cHM6Ly9jb2RlYmVy
Zy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlhCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmVjbG9u
aWEvbWluZWNsb25pYS5oYXNoIGIvcGFja2FnZS9taW5lY2xvbmlhL21pbmVjbG9uaWEuaGFzaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hZWEzODA3ZTczCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9taW5lY2xvbmlhL21pbmVjbG9uaWEuaGFzaApAQCAtMCwwICsx
LDE4IEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBiMDlkMWFmOTRjMzU3NmZjODlh
MTJjMjNlYTJjZDZlODRkMTE0ZmIwNGEzODlmMTc0NmYxMzk5NzIxY2QzYWU0ICAwLjExMS4xLnRh
ci5negorCitzaGEyNTYgIDFiMzc4MmNjYWQ3Yjg2MTQxMDBjZGEzMGQzZmFmNDJmYzM5ZjJlOTc5
MzI5MDhjNTQzMDA1MDUzYjY1NGNhNjggIExJQ0VOU0UudHh0CitzaGEyNTYgIDViNjY4NDEwNzA4
MjQ5MDBlZWZhOWQzM2Q3YzM4ODdmMmRmYzQzMzQ3MTdiNDYwYWE3YzhiOGFlMjNkYWY3ZDQgIG1v
ZHMvRU5USVRJRVMvbWNsX2NoYXJnZXMvdGV4dHVyZV9saWNlbnNlLnR4dAorc2hhMjU2ICAxZDk3
NzYyYzhlNzBlYzEyYzM1YWM5MTU2NjNiZWUwM2I4YzYwNDJkYzZmOThhZWMxNjdlY2FmZmYzYWYy
YmEwICBtb2RzL0hFTFAvbWNsX2NyYWZ0Z3VpZGUvbGljZW5zZS50eHQKK3NoYTI1NiAgYjVmZTAw
ZjBmYzNlN2U5ZjIyMDViNWNiMGJkYTk1MzJjZjZlMTIxYTg1YzZjZGU0ZDFhZDA3MTBhY2NhNjVj
MSAgbW9kcy9JVEVNUy9SRURTVE9ORS9MSUNFTlNFLnR4dAorc2hhMjU2ICBjYTVmNTliNDZmY2Vi
ZDE5NDk4MWM2ZjZiYTFlNzMwZDZhOTU0OGQ5NDllZjc2ZjczNmFmYzA0MzEwNTQ3YmJhICBtb2Rz
L0lURU1TL21jbF9hbWV0aHlzdC90ZXh0dXJlcy9MSUNFTlNFLnR4dAorc2hhMjU2ICA2OTdiNmY1
YzE5MDgxOTkwMWRiNGQ5YzBlZmU0NzMwOTFkMzU3ZjdlNTRmMjIxNTEwZmYzOWQzNGYwMzMzMTBj
ICBtb2RzL0lURU1TL21jbF9hcm1vcl9zdGFuZC9MSUNFTlNFLnR4dAorc2hhMjU2ICAzMzgyZjNi
Zjk5NTY2MDg5NTQzNjIxZWUzMjU2ZjdmOThiZjkzNjRkM2I4NTJjNWVkMDgyMDJkNDM1MjE1ZDdk
ICBtb2RzL0lURU1TL21jbF9iZWRzL2xpY2Vuc2UudHh0CitzaGEyNTYgIDRjMTc2ZmU4Njk4MzQw
MzdlMzVkNTM5NDYwNTI3NDJhYTM4NzU5ZDNlNmEyMzQxZGVkNGRlYjM0MzJkZDhhNWEgIG1vZHMv
SVRFTVMvbWNsX2Zsb3dlcnBvdHMvbGljZW5zZS50eHQKK3NoYTI1NiAgOTZmMTc4NTdmM2ViMjhh
N2Q5M2RhZDkzMGJjMDk5YTNjYjY1YTlhMmFmYjM3MDY5YmZkMWJhNWVjNTk2NDM4OSAgbW9kcy9J
VEVNUy9tY2xfaG9wcGVycy9MaWNlbnNlLnR4dAorc2hhMjU2ICBhODJkZmRhMWM5ZmViNzA0OTk3
ZWE0MjExNmViNmExNWExZjNmOTllZThjNDkyMTVmYmJkMzJkNTE5ZThhZDc0ICBtb2RzL0lURU1T
L21jbF9zdGFpcnMvbGljZW5zZS50eHQKK3NoYTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNl
ZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgbW9kcy9JVEVNUy9tY2xf
dG9yY2hlcy9MSUNFTlNFLnR4dAorc2hhMjU2ICAwMDY2ZTYzZDY4MmQ1NGEwMTRhZDMzNTk3OTQz
NjVhMWFiYjg3NTYyZDJiMWU1ZTMyMDkzOTc2ZDg4YzI5NWI0ICBtb2RzL0lURU1TL3NjcmV3ZHJp
dmVyL2xpY2Vuc2UudHh0CitzaGEyNTYgIGUzNjFmYzkwMGQ5MjAzODU5MzkxZDM1YzM4YzMyODRj
OTE2MDBkMjNjMTYxNzA3NmM2NDFmZjdlOWZlMTBiMTUgIG1vZHMvTUlTQy9maW5kYmlvbWUvbGlj
ZW5zZS50eHQKK3NoYTI1NiAgZDc0OTE3MmJmYTk0MmU4N2EwZGJiOTcwZWFmY2MwNjdkNWRmZmE3
M2JiNTY4ZTk4ZmVkNDc2ZmZhZDRlYWE1OSAgbW9kcy9QTEFZRVIvbWNsX3NraW5zL0xJQ0VOU0Uu
dHh0CitzaGEyNTYgIDg0OTUyYmViYTU5OTQxYmIzODc2OTdhYzU4YzQ3OGM2YTQ5NjZiNjlmNGU5
ZGU0NmJlZmIxZjhmMjVlMTk1ZWMgIG1vZHMvUExBWUVSL21jbF93aWVsZHZpZXcvTElDRU5TRS50
eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWluZWNsb25pYS9taW5lY2xvbmlhLm1rIGIvcGFja2Fn
ZS9taW5lY2xvbmlhL21pbmVjbG9uaWEubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uZWEzY2M5OTZkMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbWluZWNsb25p
YS9taW5lY2xvbmlhLm1rCkBAIC0wLDAgKzEsNTIgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CisjCisjIG1pbmVjbG9uaWEKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK01JTkVDTE9O
SUFfVkVSU0lPTiA9IDAuMTExLjEKK01JTkVDTE9OSUFfU09VUkNFID0gJChNSU5FQ0xPTklBX1ZF
UlNJT04pLnRhci5negorTUlORUNMT05JQV9TSVRFID0gaHR0cHM6Ly9jb2RlYmVyZy5vcmcvbWlu
ZWNsb25pYS9taW5lY2xvbmlhL2FyY2hpdmUKK01JTkVDTE9OSUFfTElDRU5TRSA9IEdQTHYzLCBN
SVQgKG1vZHMpCitNSU5FQ0xPTklBX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dCBcCisJbW9k
cy9iZWRzL2xpY2Vuc2UudHh0IFwKKwltb2RzL2Jpbm9jdWxhcnMvbGljZW5zZS50eHQgXAorCW1v
ZHMvYm9hdHMvbGljZW5zZS50eHQgXAorCW1vZHMvYm9uZXMvbGljZW5zZS50eHQgXAorCW1vZHMv
YnVja2V0L2xpY2Vuc2UudHh0IFwKKwltb2RzL2J1dHRlcmZsaWVzL2xpY2Vuc2UudHh0IFwKKwlt
b2RzL2NhcnRzL2xpY2Vuc2UudHh0IFwKKwltb2RzL2NyZWF0aXZlL2xpY2Vuc2UudHh0IFwKKwlt
b2RzL2RlZmF1bHQvbGljZW5zZS50eHQgXAorCW1vZHMvZG9vcnMvbGljZW5zZS50eHQgXAorCW1v
ZHMvZHVuZ2Vvbl9sb290L2xpY2Vuc2UudHh0IFwKKwltb2RzL2R5ZS9saWNlbnNlLnR4dCBcCisJ
bW9kcy9lbnZfc291bmRzL2xpY2Vuc2UudHh0IFwKKwltb2RzL2Zhcm1pbmcvbGljZW5zZS50eHQg
XAorCW1vZHMvZmlyZS9saWNlbnNlLnR4dCBcCisJbW9kcy9maXJlZmxpZXMvbGljZW5zZS50eHQg
XAorCW1vZHMvZmxvd2Vycy9saWNlbnNlLnR4dCBcCisJbW9kcy9nYW1lX2NvbW1hbmRzL2xpY2Vu
c2UudHh0IFwKKwltb2RzL2dpdmVfaW5pdGlhbF9zdHVmZi9saWNlbnNlLnR4dCBcCisJbW9kcy9r
ZXlzL2xpY2Vuc2UudHh0IFwKKwltb2RzL21hcC9saWNlbnNlLnR4dCBcCisJbW9kcy9tdGdfY3Jh
ZnRndWlkZS9saWNlbnNlLnR4dCBcCisJbW9kcy9wbGF5ZXJfYXBpL2xpY2Vuc2UudHh0IFwKKwlt
b2RzL3NjcmV3ZHJpdmVyL2xpY2Vuc2UudHh0IFwKKwltb2RzL3NldGhvbWUvbGljZW5zZS50eHQg
XAorCW1vZHMvc2ZpbnYvbGljZW5zZS50eHQgXAorCW1vZHMvc3Bhd24vbGljZW5zZS50eHQgXAor
CW1vZHMvc3RhaXJzL2xpY2Vuc2UudHh0IFwKKwltb2RzL3RudC9saWNlbnNlLnR4dCBcCisJbW9k
cy92ZXNzZWxzL2xpY2Vuc2UudHh0IFwKKwltb2RzL3dhbGxzL2xpY2Vuc2UudHh0IFwKKwltb2Rz
L3dlYXRoZXIvbGljZW5zZS50eHQgXAorCW1vZHMvd29vbC9saWNlbnNlLnR4dCBcCisJbW9kcy94
cGFuZXMvbGljZW5zZS50eHQKKworZGVmaW5lIE1JTkVDTE9OSUFfSU5TVEFMTF9UQVJHRVRfQ01E
UworCW1rZGlyIC1wICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL21pbmV0ZXN0L2dhbWVzL21pbmVj
bG9uaWEKKwljcCAtZHBmciAkKEBEKS8qICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL21pbmV0ZXN0
L2dhbWVzL21pbmVjbG9uaWEKK2VuZGVmCisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0t
IAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
