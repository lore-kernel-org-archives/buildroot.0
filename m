Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93ABC3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FCCF407D2;
	Sat, 10 May 2025 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftzn-8--iatI; Sat, 10 May 2025 20:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86921407B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86921407B6;
	Sat, 10 May 2025 20:31:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C1E6E0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1D908111B
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyhAcp9MBmsx for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F859810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F859810E8
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F859810E8
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54fcb8b889cso1299372e87.3
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746909108; x=1747513908;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WcArtEppaDBr25FYsUeeQYKrzzimjsAkLCqjBIp2iHs=;
 b=BbceH0JBMOfwhWKjQiSi+sQ4inSY5RwgYCQjfrVSJ3XRZYLhqtC4/pDj9ByON1Mp/+
 oyKlM0uHw007XR8xsvEnzYYLcKgLX7oPX0520G4YuyKK77fpaCVB147TgKSXVJEcHZno
 0EC2jYrjeT35gJcCIdPPdjj5Hu5TvFgbg7RmgQ+XQsHGQYzIPgbGuoWqFg5BB6VVYLCh
 XGWQzc3Ayg/28PShp0Wwyt/vOhwfkkQ6cpjo7WNojtwdT0tQqe0R1ADp2HgENOg1gg/T
 hve1co97OHB7dLPKTXFxnJL0YWs1od/OzBl+bcrh2hSKU1rIQEV3UbMt78i6KlP2US0C
 LBqw==
X-Gm-Message-State: AOJu0YywW2AJi4+79DmhD9nCizIYjJandfLqI0QkaHZtSEbW3kdvzhys
 Kt67BmpPbPda6EaAwPCER0rGS+dZ10JTvurVFAGU+Gj2QhWQknJNCbawxybw
X-Gm-Gg: ASbGncsxt7CocM/W0OoJpCRPyvidYp5Lr1fiZMj/QdigR2q9c1i9yDEEZXas4KDRXep
 2+UA+/3c0CE+H2U0eOwjm7k0rNM9P3111n/2JXTx8MARcDh990Fd8RJRf2Pn+IjxMfuE3tdscjE
 7VPXP+JxtgMiehqZcG9s71AoomkQawS/I4joJlUnERMaQKLQ0BK8A25ju9FxB0buXmT1qaf74Rh
 ApQEP+3AgNipiY7YYBBy07isCRgt75bD4yIRlRIM8xMd3DPVmu0w59l64Jwk3ockfuwpJ05h9Q5
 WlbCGDx5Sr9+9843gCkS1BwMl+yG4xc6qhdCQV6PnjJ2BIkcU9Rx3G3Y7nDNm0F/QT7f3gPOqhM
 =
X-Google-Smtp-Source: AGHT+IHGTuN5aKOpxJV5+at0uvadB8PIg78dtPq+UxwageIphzgw/Xd/phIrizOTNLPHw71wDxq0Pg==
X-Received: by 2002:a05:6512:1246:b0:54d:68d3:eeec with SMTP id
 2adb3069b0e04-54fc67ec917mr3032871e87.52.1746909107416; 
 Sat, 10 May 2025 13:31:47 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf27sm810561e87.88.2025.05.10.13.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:31:46 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat, 10 May 2025 22:31:20 +0200
Message-ID: <20250510203122.1916485-5-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510203122.1916485-1-lazzer@gmail.com>
References: <20250510203122.1916485-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746909108; x=1747513908; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WcArtEppaDBr25FYsUeeQYKrzzimjsAkLCqjBIp2iHs=;
 b=fz5BQWEOu0HO4BqwQEFmcPdb3SUBvQfHRdydICR2JFdI0r/8aKXziAmAN6pNYQMqv/
 fDfnXMrmHeqG1o7t+Av+nW4X9gF/K6ngIFhng+mM1X6kLBWltM24gdqvIYxPJM3hzCxE
 HGJt9K6Q6nEZB7OYgjBsQGMkGvhWDdnzdAQpxyy3YC/lofqp5MjeNnRqL3LnzUfpu10O
 1qWXrvafs3DahW+lNSBaeeKe+j8g2iihu9XEPYowAK3wPEWtTN4ONK5a7UGDt77wUrcz
 mokA/+dM4BycsnpxBqNFEBLZY5kCcvEH9FiLShaOhGguBvxkaDV9VGo7C5/gJxYUOkWG
 70cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fz5BQWEO
Subject: [Buildroot] [PATCH v2 4/5] package/netopeer2: bump to version 2.4.1
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

Q2hhbmdlbG9nOgogaW50ZXJuYWwgc3VwcG9ydCBvZiBpZXRmLXN5c3RlbS1jYXBhYmlsaXRpZXMg
YW5kIGlldGYtbm90aWZpY2F0aW9uLWNhcGFiaWxpdGllcyAoQGplcmVtaWU2d2luZCkKIG1pbm9y
IGJ1Z2ZpeGVzIGFuZCBpbXByb3ZlbWVudHMKCkRlcGVuZHMgb246CiAtIGxpYnlhbmcgdjMuMTIu
MiBodHRwczovL2dpdGh1Yi5jb20vQ0VTTkVUL2xpYnlhbmcvcmVsZWFzZXMvdGFnL3YzLjEyLjIK
IC0gbGlibmV0Y29uZjIgdjMuNy4xIGh0dHBzOi8vZ2l0aHViLmNvbS9DRVNORVQvbGlibmV0Y29u
ZjIvcmVsZWFzZXMvdGFnL3YzLjcuMQogLSBzeXNyZXBvIHYzLjYuMTEgaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3JlcG8vc3lzcmVwby9yZWxlYXNlcy90YWcvdjMuNi4xMQoKU2lnbmVkLW9mZi1ieTog
TWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9uZXRvcGVl
cjIvQ29uZmlnLmluICAgICAgfCAxIC0KIHBhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5oYXNo
IHwgMiArLQogcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLm1rICAgfCAyICstCiAzIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL25ldG9wZWVyMi9Db25maWcuaW4gYi9wYWNrYWdlL25ldG9wZWVyMi9Db25maWcuaW4K
aW5kZXggZGIzMWE3ODZhMS4uYzE0ODE4MDY0ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9uZXRvcGVl
cjIvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbmV0b3BlZXIyL0NvbmZpZy5pbgpAQCAtMTYsNyAr
MTYsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTkVUT1BFRVIyCiAJc2VsZWN0IEJSMl9QQUNLQUdF
X0xJQlNTSAogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTU0hfU0VSVkVSICMgRm9yIGxpYm5ldGNv
bmYyIHRvIGhhdmUgU1NICiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQllBTkcKLQlzZWxlY3QgQlIy
X1BBQ0tBR0VfT1BFTlNTTCAjIEZvciBsaWJuZXRjb25mMiB0byBoYXZlIFRMUwogCXNlbGVjdCBC
UjJfUEFDS0FHRV9TWVNSRVBPCiAJaGVscAogCSAgTmV0b3BlZXIyIGlzIGEgc2V0IG9mIHRvb2xz
IGltcGxlbWVudGluZyBuZXR3b3JrIGNvbmZpZ3VyYXRpb24KZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmV0b3BlZXIyL25ldG9wZWVyMi5oYXNoIGIvcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhh
c2gKaW5kZXggNmEyNzhmYmJhZi4uM2E3MGIxNTUzOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9uZXRv
cGVlcjIvbmV0b3BlZXIyLmhhc2gKKysrIGIvcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAyYjFkYWFj
MDM3ZjE4YzMwM2UwYzBkYzMzMThiYTMwMTk2NDU5NDcyZTRjNTlmMmY4NTQ3ZWU3NGQ0Y2RmMzFk
ICBuZXRvcGVlcjItMi4xLjQ5LnRhci5negorc2hhMjU2ICA4NmQ3N2VmY2I2NWYwYmIyYzNiYzBm
MjEyOGEzMjAxMTNjZTcxMjVmMzk4ODJmZTdkODMzNGMxNjhlZDk1NjdkICBuZXRvcGVlcjItMi40
LjEudGFyLmd6CiBzaGEyNTYgIGI0NmYxNjFmYmRjZjEyN2QzZWYyMjYwMmUxNTk1OGMzMDkyZmUz
Mjk0ZjcxYTJkYzhjZGY4ZjY2ODljYmE5NWIgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmV0b3BlZXIyL25ldG9wZWVyMi5tayBiL3BhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5tawpp
bmRleCA0ODUzZTVkMTc2Li43MWYyYzUwNjQwIDEwMDY0NAotLS0gYS9wYWNrYWdlL25ldG9wZWVy
Mi9uZXRvcGVlcjIubWsKKysrIGIvcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLm1rCkBAIC00
LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTkVUT1BFRVIyX1ZFUlNJ
T04gPSAyLjEuNDkKK05FVE9QRUVSMl9WRVJTSU9OID0gMi40LjEKIE5FVE9QRUVSMl9TSVRFID0g
JChjYWxsIGdpdGh1YixDRVNORVQsTmV0b3BlZXIyLHYkKE5FVE9QRUVSMl9WRVJTSU9OKSkKIE5F
VE9QRUVSMl9ETF9TVUJESVIgPSBuZXRvcGVlcjIKIE5FVE9QRUVSMl9MSUNFTlNFID0gQlNELTMt
Q2xhdXNlCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
