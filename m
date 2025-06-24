Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75247C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 12:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCE660BA5;
	Tue, 24 Jun 2025 12:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alFsYAxRzed0; Tue, 24 Jun 2025 12:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E22F60B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E22F60B36;
	Tue, 24 Jun 2025 12:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C5843F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F130960B3A
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eqld32ftQ1m for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 12:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0BCD60B36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0BCD60B36
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0BCD60B36
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:21:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-453643020bdso3396835e9.1
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 05:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750767688; x=1751372488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sVFOpV8uLRAOdN5dJqrYrV7zEKB7Oj5lnst9voLwHw=;
 b=MT5Y9d/6Kce2F7hDuOiFIfBiVqykRedg8EtC93Q2EfB8GVYvSOKm8AlJfZtAxGgRlZ
 n4z3fWQh/nYdW7CScpFvA4IlgFtx4eTlF3sq6fVo1wqiuOdH52HFPWWbb84GGGzwAd2h
 h/fAx+zk154GUJfqgpysACYUgULVjXy+zIw7Q+xiBe1w17e2Inpykt+UN7NBwYhOUxEG
 ITIX51YJQj+8xyolqRq2BufidM2RC/2g0mtFyZm4uUsZ6GARACYdrh3p6qpIZ2puRlxJ
 bRrLf12c7tgkOSN2k7ZqenUyLDPYLeFX1+I5nf/Sqb/2ObvrVwDO2L9lnbuX0hN1vdGY
 uiHQ==
X-Gm-Message-State: AOJu0Yxhgyg+L6WX/Mni5dd6kBimkmWuxBmnjU3JL8+K2aPvkXeI0zmr
 CTS+uuFPi3UTKre0Y2Yy3HFKkzpAm9A3VlJZ/SVdWw+Jx6ODKNnvyKt1NFc2DPaLN5nRRHf01l9
 BTQ2Y
X-Gm-Gg: ASbGncspB08neb7hFku/blCiy9+DZBbs3upZ8eIdhTdG7VJDiP/IvZ0TiZv/r9gvjxC
 3Xj2r+Lac/BHmzvzbnO9mgG91SR8DiCGSUfszNWscFRL/w7XbEtXAObDka5YLKfQ4CC5Pc7qozO
 AK/rHfOKWPy7YQRK3eLaRsjb3aRgn/Uh8crgky6a180gEet5s8egD0VHq1jYzMtChGpF2T3bwk+
 atK9FFq8LN7+DeOpHAbh+/u3x3LSkr50XorXpl3SZBelYHGBxFuh0+u2kxpe3r4aBIZEmznHRAI
 idKvsAhTK1nJTdqWstLzQS6QxTACiOVwQ4xmHbbiR1RVrdK+2poLm4U4cCHb+xy+CenaZjMJ9jW
 v47HJwmcjkw3N3r4lvNqX/kjOgpEg1rCGQPr1MHgk2k06siuxeaOUO0WFnw==
X-Google-Smtp-Source: AGHT+IHoONyLWcwZmi9kcD7DRFmgSDyXmAU50aNOrh0hXsHgnGxX9duAGkivQ6wirfLPcPgi/eBzgw==
X-Received: by 2002:a05:600c:c48e:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-453659c58d6mr157669315e9.12.1750767687588; 
 Tue, 24 Jun 2025 05:21:27 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8bb6sm175456025e9.25.2025.06.24.05.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 05:21:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 14:20:44 +0200
Message-ID: <20250624122048.946492-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624122048.946492-1-raphael.melotte@mind.be>
References: <20250624122048.946492-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750767688; x=1751372488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sVFOpV8uLRAOdN5dJqrYrV7zEKB7Oj5lnst9voLwHw=;
 b=dAn1nrIaUqLYs30l06D27vQ+Ox0bnOU1x+P8ksDgACU6MB8Rp/yToZyP5185Pryup1
 Y0+51/xVEsXPrAJCaftqpOzONSd5ukwWWANkzYDiHzk8tkhOQivKdTDsZuOT//L+DwK6
 o8ts9/jG7GWmV16kAk6gBSJj5Tu97YYswy0EdQAyi7X7uzto91XMF25jEpYCVeNLCnhn
 jrI9mH96Bu6i5sd/lhb4bJrwZM1FsN4bhWVVAPVk3gRc1/jbngQWWxddeKKfQMVZQA2w
 r72TINwt3LbkDfSKSqAO3vX1LoCww11shuYvDLZXvJ8L8Fy6k3tFYizRZqhfwEjZ0rIn
 ANuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dAn1nrIa
Subject: [Buildroot] [PATCH 2/2] package/modsecurity2: update upstream URLs
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

J2h0dHBzOi8vZ2l0aHViLmNvbS9TcGlkZXJMYWJzL01vZFNlY3VyaXR5JyBub3cgcmVkaXJlY3Rz
IHRvCidodHRwczovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHknLCBz
byB1cGRhdGUgb3VyClVSTHMgYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9tb2RzZWN1cml0
eTIvQ29uZmlnLmluICAgICAgICAgfCAyICstCiBwYWNrYWdlL21vZHNlY3VyaXR5Mi9tb2RzZWN1
cml0eTIuaGFzaCB8IDIgKy0KIHBhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5tayAg
IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tb2RzZWN1cml0eTIvQ29uZmlnLmluIGIvcGFja2FnZS9t
b2RzZWN1cml0eTIvQ29uZmlnLmluCmluZGV4IGZiMWJmYzk2MGUuLmRmNTYzNGJmODkgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvbW9kc2VjdXJpdHkyL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL21vZHNl
Y3VyaXR5Mi9Db25maWcuaW4KQEAgLTEwLDQgKzEwLDQgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01P
RFNFQ1VSSVRZMgogCSAgaW50byBIVFRQKFMpIHRyYWZmaWMgYW5kIHByb3ZpZGVzIGEgcG93ZXIg
cnVsZXMgbGFuZ3VhZ2UgYW5kCiAJICBBUEkgdG8gaW1wbGVtZW50IGFkdmFuY2VkIHByb3RlY3Rp
b25zLgogCi0JICBodHRwczovL2dpdGh1Yi5jb20vU3BpZGVyTGFicy9Nb2RTZWN1cml0eQorCSAg
aHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5CmRpZmYgLS1n
aXQgYS9wYWNrYWdlL21vZHNlY3VyaXR5Mi9tb2RzZWN1cml0eTIuaGFzaCBiL3BhY2thZ2UvbW9k
c2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5oYXNoCmluZGV4IDJjNzdmZmQ4MzAuLmZiYjdmYWJiM2Eg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5oYXNoCisrKyBi
L3BhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5oYXNoCkBAIC0xLDQgKzEsNCBAQAot
IyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9TcGlkZXJMYWJzL01vZFNlY3VyaXR5L3JlbGVhc2Vz
L2Rvd25sb2FkL3YyLjkuNy9tb2RzZWN1cml0eS0yLjkuNy50YXIuZ3ouc2hhMjU2CisjIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5L3JlbGVhc2Vz
L2Rvd25sb2FkL3YyLjkuNy9tb2RzZWN1cml0eS0yLjkuNy50YXIuZ3ouc2hhMjU2CiBzaGEyNTYg
IDJhMjhmY2ZjY2ZlZjIxNTgxNDg2Zjk4ZDhkNWZlMDM5NzQ5OTc0OWI4MzgwZjYwZWM3YmIxYzA4
NDc4ZTE4MzkgIG1vZHNlY3VyaXR5LTIuOS43LnRhci5negogCiAjIExvY2FsbHkgY29tcHV0ZWQK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5tayBiL3BhY2th
Z2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5tawppbmRleCA4OGJiZjNiYjI5Li4zNmQ2ZTFh
ODQ3IDEwMDY0NAotLS0gYS9wYWNrYWdlL21vZHNlY3VyaXR5Mi9tb2RzZWN1cml0eTIubWsKKysr
IGIvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLm1rCkBAIC02LDcgKzYsNyBAQAog
CiBNT0RTRUNVUklUWTJfVkVSU0lPTiA9IDIuOS43CiBNT0RTRUNVUklUWTJfU09VUkNFID0gbW9k
c2VjdXJpdHktJChNT0RTRUNVUklUWTJfVkVSU0lPTikudGFyLmd6Ci1NT0RTRUNVUklUWTJfU0lU
RSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9TcGlkZXJMYWJzL01vZFNlY3VyaXR5L3JlbGVhc2VzL2Rv
d25sb2FkL3YkKE1PRFNFQ1VSSVRZMl9WRVJTSU9OKQorTU9EU0VDVVJJVFkyX1NJVEUgPSBodHRw
czovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkvcmVsZWFzZXMvZG93
bmxvYWQvdiQoTU9EU0VDVVJJVFkyX1ZFUlNJT04pCiBNT0RTRUNVUklUWTJfTElDRU5TRSA9IEFw
YWNoZS0yLjAKIE1PRFNFQ1VSSVRZMl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogTU9EU0VDVVJJ
VFkyX0NQRV9JRF9WRU5ET1IgPSB0cnVzdHdhdmUKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
