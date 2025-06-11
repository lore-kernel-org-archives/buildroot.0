Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689FCC677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 11:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5CB423E4;
	Wed, 11 Jun 2025 11:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36-zVMugbn5P; Wed, 11 Jun 2025 11:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7798423B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7798423B3;
	Wed, 11 Jun 2025 11:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8A441F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 11:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F995608A7
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 11:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cLeGYJv90Ff for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 11:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DE2F60836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE2F60836
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DE2F60836
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 11:16:52 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-adb47e0644dso155593666b.0
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 04:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640610; x=1750245410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uq10Zo6+zuNb8ZgFbaD7EiYsIjEWDrTvBqEfE3AJvYU=;
 b=t2S683QzUlAc9vmNn9U5ZFTGZNNGSrh07Knp7+M6NjZ4rgIYrpDnikQcRVj0l7sStG
 6Vv+i43YTSO0EKdL9MRJ/paODf7HiZO2pPzo7qr7EUfTIWU1z2/+Y+gnEXCaniRzyR3w
 rp7psAsSvh6G59YPUXN+1D1sOUR3YDOnFMBhDUTp0yn2HCrnf+Oc9UpV73cdk7BcCBwr
 X1UiGZRZq3Ojn5Oqz3cpplE/KD+uSlt7zVrmvfAyC4tAoMNSnoJ9ys5WR/oMyeNPAUGg
 3znIOw76eQJfRo6cXLFE9A2Ng9H4AtDjO9n7clmqe0K0c6Z4BJvDifIphSpqP3jtKesD
 8gmQ==
X-Gm-Message-State: AOJu0YyI8/IUytkSVzUR9mftcrYNpeo/pet1aKDsCFTwW/zK1sHL/24g
 kipN/+c86KDMc2TbzhM4PwSROSbfVtWUkeawJGvPGJ1DL+vWVNydqEfZuE4V+YjrF0P1mrtJH9l
 oYhR4
X-Gm-Gg: ASbGncvqfSypbOFZSHeRdAAwmriES4PJR4Hg+8FCUVyPqsJ497FovyF0FC+/FEK9iSR
 7bgftY7wWNsia+9nwL7gUMghda6K0z7HYGYdhS4OerNpJA5Cv1HYIYRi/6MTVP33oo5H0h76AxK
 VmxIqJFyVmI4tRJd5KwtIMscI3Dxy+ZL+swh2R3SCrwA86jLAEveggmtxr7Ec6rVR4zJfRu2URV
 FHlkI9RvuYIAPJS2zcU388OVLA74vumdt2XJz4g6RZaBhJfU3QqDtZN0Ub61wZm2sO4/BSReoKa
 CJu5S6XlY9Ak1NavyJDmNA//+smerMJpp+buen9NLB4614qXx2aJvgPN8FcG4XU=
X-Google-Smtp-Source: AGHT+IEws3HK3F/LWDDqc33tixpgg5WIk2andVrYG+zOHp7cvs9JUr4H3/Sz41FmT0aWRyELEYozyA==
X-Received: by 2002:a17:907:72c9:b0:adb:2f9b:e16f with SMTP id
 a640c23a62f3a-ade899665famr298438966b.16.1749640610033; 
 Wed, 11 Jun 2025 04:16:50 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1db55ccdsm862624866b.44.2025.06.11.04.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:16:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 662A05F8C1;
 Wed, 11 Jun 2025 12:16:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 11 Jun 2025 12:16:36 +0100
Message-ID: <20250611111640.702572-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611111640.702572-1-alex.bennee@linaro.org>
References: <20250611111640.702572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749640610; x=1750245410; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uq10Zo6+zuNb8ZgFbaD7EiYsIjEWDrTvBqEfE3AJvYU=;
 b=cpKFVOpV8X5EBkqI0i47n/iYQ6fii9FgfU+rgN3hNV4gaz/tmrGzkuuBokD48tLaMb
 AuYHzQ5HJCNbxZPCvUW5jTZ1gA7dypXZZhMWfwKRC0vjwwKi4feAm5/R+LA4KvgQB61H
 YGp2v2gAOdYO8OGCdV6O1OET0iEHSutbDm43BqC/Z3jHHaJZkIYx+W0vHYdl2PhaEvbe
 ylLutPwghlo8eKuG9BZSvZCOWPsWfJF221t5c4BCVltMtNeGq2v9sNMrdfIUOVxk/SH/
 clsCkJn0JK3XSM8e7Fw9ZDlL3tKmu+A7fTotvUCvdOXm4PC0YE4s32PMoOW7mRvnnWRG
 tyCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cpKFVOpV
Subject: [Buildroot] [PATCH v6 3/5] package/vulkan-[headers|loader|tools]:
 bump to 1.4.317 release
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHJlbGVhc2UuIFdlIG5vdyBuZWVkIHRoZSByZWNlbnRseSBh
ZGRlZAp2dWxrYW4tc2RrIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSB2b2xrIGxvYWRlci4KClNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2NQog
IC0gMS40LjMxNiAtPiAxLjQuMzE3CnY0CiAgLSAxLjQuMzA2IC0+IDEuNC4zMTYKICAtIGRvZXNu
J3Qgc2VlbSB0byBuZWVkIGlzeXN0ZW0gcGF0Y2ggbm93CnYzCiAgLSBmaXggdXAgY29tbWVudCwg
cHJvcGVybHkgc2VsZWN0IHRoZSBTREsgcGFja2FnZQotLS0KIHBhY2thZ2UvdnVsa2FuLWhlYWRl
cnMvdnVsa2FuLWhlYWRlcnMuaGFzaCB8IDIgKy0KIHBhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVs
a2FuLWhlYWRlcnMubWsgICB8IDIgKy0KIHBhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9h
ZGVyLmhhc2ggICB8IDIgKy0KIHBhY2thZ2UvdnVsa2FuLXRvb2xzL0NvbmZpZy5pbiAgICAgICAg
ICAgICB8IDMgKystCiBwYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMuaGFzaCAgICAg
fCAyICstCiBwYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsgICAgICAgfCAzICsr
LQogNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5oYXNoIGIvcGFj
a2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5oYXNoCmluZGV4IGIzOGJmY2ZmNDcu
LjI4NjYzOWI1NzkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhl
YWRlcnMuaGFzaAorKysgYi9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzMTdlNDY3
YTVmYjJlYWE2YTE4Yjk4NGVjNzBmZGJmYWNjZDkzNTk1YTNlNmY0YmNjZWNhN2QzZmFiMjgwNTA1
ICB2dWxrYW4taGVhZGVycy0xLjMuMjYyLnRhci5negorc2hhMjU2ICA3ODY2NTk1OWQxMGIwOTA2
MWQ4YzNlMjFkYjhiZjNlOGI2OTllMmQzZDUzMmZjZTg1MGEzMjMxMmRiYTcyMjhiICB2dWxrYW4t
aGVhZGVycy0xLjQuMzE3LnRhci5negogc2hhMjU2ICBhYzI0ZTVlYTkyMGU0MzE4ZTRkMDJjNDA4
NmFlNTFmNTNjZmIwM2ZlZWQwNmMxOGRmMTAxOWU3YWRhMWVjN2JjICBMSUNFTlNFLm1kCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rIGIvcGFja2Fn
ZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5tawppbmRleCAyMGIyNDgzNjRkLi41MmQ1
YjU2MDg2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJz
Lm1rCisrKyBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMubWsKQEAgLTYs
NyArNiw3IEBACiAKICMgTm90ZTogY2hhbmdpbmcgdGhpcyB2ZXJzaW9uIHdpbGwgYWxzbyBhZmZl
Y3QgdnVsa2FuLWxvYWRlciBhbmQKICMgdnVsa2FuLXRvb2xzLCBzbyBwbGVhc2UgdXBkYXRlIHRo
b3NlIHBhY2thZ2VzIGFzIHdlbGwuCi1WVUxLQU5fSEVBREVSU19WRVJTSU9OID0gMS4zLjI2Mgor
VlVMS0FOX0hFQURFUlNfVkVSU0lPTiA9IDEuNC4zMTcKIFZVTEtBTl9IRUFERVJTX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLEtocm9ub3NHcm91cCxWdWxrYW4tSGVhZGVycyx2JChWVUxLQU5fSEVBREVS
U19WRVJTSU9OKSkKIFZVTEtBTl9IRUFERVJTX0xJQ0VOU0UgPSBBcGFjaGUtMi4wLCBNSVQKIFZV
TEtBTl9IRUFERVJTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoIGIvcGFja2FnZS92dWxrYW4tbG9h
ZGVyL3Z1bGthbi1sb2FkZXIuaGFzaAppbmRleCBlMDllY2RhOGE5Li41YmZjMDJmNWM4IDEwMDY0
NAotLS0gYS9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoCisrKyBiL3Bh
Y2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzYmJhYTVlZTY0MDU4YTg5OTQ5ZWI3NzdkZTY2
Y2U5NGJmZTMxNDE4OTI1MTQxNzJjZmM5NDUxYzc1NjgwMmQ1ICB2dWxrYW4tbG9hZGVyLTEuMy4y
NjIudGFyLmd6CitzaGEyNTYgIGU0ZTE4NTg1ZmU5MDJlZTA0ZTg2YzFjZGIyOTk2YjY4NmJmZmVm
MmNhYjAyY2I2MDc5MjIxZmU2OWRmMDVhZjggIHZ1bGthbi1sb2FkZXItMS40LjMxNy50YXIuZ3oK
IHNoYTI1NiAgNDNjMGEzN2U2YTBmYTdmZjNjODQzYjNlYzVhNGZhYzg0YjcxMjU1OGRkYWMxMDNm
YmQ0YzE2NDk2NjJhOWVjZSAgTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2Fu
LXRvb2xzL0NvbmZpZy5pbiBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzL0NvbmZpZy5pbgppbmRleCA1
NGZhNTM5ZGFiLi5iYjBkY2U4MjgyIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi10b29scy9D
b25maWcuaW4KKysrIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluCkBAIC02LDEyICs2
LDEzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9WVUxLQU5fVE9PTFMKIAlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fSEFTX1RIUkVBRFMgIyB2dWxrYW4tbG9hZGVyCiAJc2VsZWN0IEJSMl9QQUNLQUdF
X1ZVTEtBTl9IRUFERVJTCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1ZVTEtBTl9MT0FERVIKKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfVlVMS0FOX1NESwogCiAJaGVscAogCSAgVGhlIEtocm9ub3Mgb2ZmaWNp
YWwgVnVsa2FuIFRvb2xzIGFuZCBVdGlsaXRpZXMuCiAKIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS9L
aHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzCiAKLWNvbW1lbnQgInZ1bGthbi10b29scyBuZWVkcyBh
IHRvb2xjaGFpbiB3LyBDKyssIGR5bmFtaWMgbGlicmFyeSwgdGhyZWFkcywgZ2NjID49IDQuOSIK
K2NvbW1lbnQgInZ1bGthbi10b29scyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIGR5bmFtaWMg
bGlicmFyeSwgdGhyZWFkcywgZ2NjID49IDQuOSwgdnVsa2FuLXNkayIKIAlkZXBlbmRzIG9uICFC
UjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgQlIyX1NUQVRJQ19MSUJTIHx8IFwKIAkJIUJSMl9UT09M
Q0hBSU5fSEFTX1RIUkVBRFMgfHwgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2ggYi9wYWNrYWdl
L3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMuaGFzaAppbmRleCAyNGMwNjk3Nzg0Li41MDQxNzcz
NzliIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMuaGFzaAor
KysgYi9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMuaGFzaApAQCAtMSwzICsxLDMg
QEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDhjNzdkMDI2OTRkMDUxNmFlMmJhM2Yz
NzE4NzQ1NjQ3ZTg3ZTc4OGVmOTNmYWFiYjJlMzY3NGZmMzI2MDgwMTAgIHZ1bGthbi10b29scy0x
LjMuMjYyLnRhci5negorc2hhMjU2ICA0NTg2MzA5YWI1YjJhOTU4NGZkZTYyZmQ4NWIwZWY1YmI5
OGI0Y2RiY2E5Y2IxYmEzYTJiNDk3OGRjMmYzNTVjICB2dWxrYW4tdG9vbHMtMS40LjMxNy50YXIu
Z3oKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2Mx
MGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVs
a2FuLXRvb2xzL3Z1bGthbi10b29scy5tayBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10
b29scy5tawppbmRleCA5ZjViZjQ2Yjc5Li45ZGVlZGE2MDg2IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsKKysrIGIvcGFja2FnZS92dWxrYW4tdG9vbHMv
dnVsa2FuLXRvb2xzLm1rCkBAIC0xMSw3ICsxMSw4IEBAIFZVTEtBTl9UT09MU19MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRS50eHQKIAogVlVMS0FOX1RPT0xTX0RFUEVOREVOQ0lFUyA9IFwKIAl2dWxr
YW4taGVhZGVycyBcCi0JdnVsa2FuLWxvYWRlcgorCXZ1bGthbi1sb2FkZXIgXAorCXZ1bGthbi1z
ZGsKIAogVlVMS0FOX1RPT0xTX0NPTkZfT1BUUyArPSBcCiAJLURCVUlMRF9DVUJFPU9GRiBcCi0t
IAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
