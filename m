Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0423C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 14:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA58403E2;
	Mon,  1 Jul 2024 14:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgGKsaGxVrTM; Mon,  1 Jul 2024 14:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FE4240DFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FE4240DFE;
	Mon,  1 Jul 2024 14:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 003471BF2F9
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 14:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86B95605FA
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rewYt0E5Adg for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 14:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC658605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC658605E6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC658605E6
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 14:57:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42567ddf099so22511825e9.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 07:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719845841; x=1720450641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQH6Tkn5eYbLya57/+OikzwYT7PnyUE3j81ZLUPTfNI=;
 b=on0fil3LRGRIOm8D7ijmV9kOhD2WKWfodeEiqp67Ujfzzhk42i9TLXIduyNUqsHkOf
 MQvl+dXKbspfqOP5eCND7CksKCzL30/jhwiPGz0z/iOQwrQ3ws6Talr2ZMaUoW7z8bwM
 jbdpuVTQsEf3xp0zUDljQ8hmoG0zhoc3r5Av7hieuhswqTbqGXxQd7kOiobD659UOIeQ
 TlTgau07ZifFu6lBGrf1aXmtzlimh0qhK9+DzcuoMt/A7EzAsW3hglTUf41kDGt8L37V
 O1iEjGzBrIfqFSv3kXsmBZX5dAOAmHMzEHV2BR4GYkdURZo+1ZV23bcn7VOFua2SqvGf
 Ya9A==
X-Gm-Message-State: AOJu0YyTPbgzxynFLxuJtEThSuLKpwM4lMOFVRf2Ponchr4sBLeBCodY
 KqN0LQp0hn2qJrRbPtNKZXqFhXaNFiD54Y6zkxj+q3jeM8TuqzUcjD4Z+xAoxxdL+p9R58i6xTB
 6FS8=
X-Google-Smtp-Source: AGHT+IHPu9QLmQQZzjEgSiJvOb8AWZQtS457LNp7WaAeelYpkSZ5xuXUORP58Nz5qYJRY45xNtOBPQ==
X-Received: by 2002:a5d:470b:0:b0:367:3ff3:2b83 with SMTP id
 ffacd0b85a97d-367756bb4efmr3852779f8f.41.1719845840776; 
 Mon, 01 Jul 2024 07:57:20 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e141esm10153286f8f.58.2024.07.01.07.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 07:57:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 16:57:03 +0200
Message-Id: <20240701145708.2886402-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719845841; x=1720450641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rQH6Tkn5eYbLya57/+OikzwYT7PnyUE3j81ZLUPTfNI=;
 b=fnz3vfpRBmPrVMjT0h3+VO2t7pwBL2biiyTrHZlqXF9Qoeci5KTW5MhGkVoO04GKsW
 reAhVpyuf0osOYBPZixHnACA+bAeAVqOkFbmageKrFgatBRoqoHUKbgijateKSfo7ak/
 y7WWeEjjXOi4e2274vEundoOeVFYQJkso8E9AWv9eBDYwUVvn8TanDQyo6s6LCDhU5mA
 DqfH9kmikXQ2s6US99yYjfF+QULGnBu2xbfAV9WTpDm052rvwA19ZomM2pHOaRlRyt1Y
 E/2kpwFdpc/bvLhN4JDmjJ8WfnZPdAaTXOxnJfJmF0WeTcVoApM+la9LxEN+DGU0gGmz
 da+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fnz3vfpR
Subject: [Buildroot] [PATCH 1/4] package/python-sdbus: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFj
a2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3B5dGhv
bi1zZGJ1cy9Db25maWcuaW4gICAgICAgICB8ICA4ICsrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1z
ZGJ1cy9weXRob24tc2RidXMuaGFzaCB8ICA1ICsrKysrCiBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9w
eXRob24tc2RidXMubWsgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXNk
YnVzL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5
dGhvbi1zZGJ1cy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMv
cHl0aG9uLXNkYnVzLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5k
ZXggOGE1Y2NlYmE3OC4uMGQ1OGRmN2Q1MCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9E
RVZFTE9QRVJTCkBAIC0yNjY4LDYgKzI2NjgsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1qbWVzcGF0
aC8KIEY6CXBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvCiBGOglwYWNrYWdlL3B5dGhvbi1yc2EvCiBG
OglwYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyLworRjoJcGFja2FnZS9weXRob24tc2RidXMvCiBG
OglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ptZXNwYXRoLnB5
CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3JzYS5weQog
RjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVy
LnB5CmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmlu
ZGV4IDU1MGZkYzFmNDEuLjQ1ZDhhOGM3ZWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmlu
CisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0xMzM0LDYgKzEzMzQsNyBAQCBtZW51ICJFeHRl
cm5hbCBweXRob24gbW9kdWxlcyIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNjYXB5L0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNjaGVkdWxlL0NvbmZpZy5pbiIKIAlzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLXNjaXB5L0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLXNkYnVzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNkbm90aWZ5L0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNlY3JldHN0b3JhZ2UvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9weXRob24tc2VlL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZp
Zy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iNTc2MmY1MTMwCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluCkBAIC0wLDAg
KzEsOCBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9TREJVUworCWJvb2wgInB5dGhvbi1z
ZGJ1cyIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1NZU1RFTUQgIyByZXF1aXJlZCB0byBnZXQg
c2QtYnVzCisJaGVscAorCSAgTW9kZXJuIFB5dGhvbiBELUJ1cyBsaWJyYXJ5LiBCYXNlZCBvbiBz
ZC1idXMgZnJvbQorCSAgbGlic3lzdGVtZC4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL2lnbzk1
ODYyL3B5dGhvbi1zZGJ1cwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9u
LXNkYnVzLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFzaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xM2M4YzJiYjVmCi0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLmhhc2gKQEAgLTAsMCAr
MSw1IEBACisjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NkYnVzL2pz
b24KK21kNSAgNDZkM2VhMDBhNDkxYzJlZWMyYTI1Y2NmNjFiOGE3N2EgIHNkYnVzLTAuMTIuMC50
YXIuZ3oKK3NoYTI1NiAgYzM2OTJkNzU3MDQ0MzhhNzhhZGMxNDM5MzUwYmMzMmYzMGQ2YjM4YWQz
NDRjZmM5NDc3M2RiODljNmNlNGE4OSAgc2RidXMtMC4xMi4wLnRhci5negorIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKK3NoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4
NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLm1rIGIvcGFja2FnZS9weXRo
b24tc2RidXMvcHl0aG9uLXNkYnVzLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLmU0YmU2ZWZlZjQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1
cy9weXRob24tc2RidXMubWsKQEAgLTAsMCArMSwxOSBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKyMKKyMgcHl0aG9uLXNkYnVzCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitQWVRI
T05fU0RCVVNfVkVSU0lPTiA9IDAuMTIuMAorUFlUSE9OX1NEQlVTX1NPVVJDRSA9IHNkYnVzLSQo
UFlUSE9OX1NEQlVTX1ZFUlNJT04pLnRhci5negorUFlUSE9OX1NEQlVTX1NJVEUgPSBodHRwczov
L2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvOGUvMzkvM2Q0OWYwZDE4ZGNiYTMzNDRh
Zjc1NmYzMWU0NDA4ZTdkZTUwYjNkZjg2ZmEzZjNlYTZmNjA0NDAyZjE2CitQWVRIT05fU0RCVVNf
U0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKK1BZVEhPTl9TREJVU19MSUNFTlNFID0gR05VIExlc3Nl
ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHYyIG9yIGxhdGVyIChMR1BMdjIrKQorUFlUSE9OX1NE
QlVTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCitQWVRIT05fU0RCVVNfREVQRU5ERU5DSUVTID0g
c3lzdGVtZAorCitpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKK1BZVEhPTl9TREJVU19FTlYg
Kz0gUFlUSE9OX1NEQlVTX1VTRV9TVEFUSUNfTElOSz0xCitlbmRpZgorCiskKGV2YWwgJChweXRo
b24tcGFja2FnZSkpCi0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
