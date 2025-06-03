Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32CAC61CE5
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DA4612E1;
	Tue,  3 Jun 2025 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WoUQ5egs4TZ; Tue,  3 Jun 2025 14:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83B526130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B526130B;
	Tue,  3 Jun 2025 14:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7182DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDEA8417F2
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtYH_iluqNhu for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 14:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C163E4045E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C163E4045E
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C163E4045E
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad89f9bb725so1133463066b.2
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 07:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748959264; x=1749564064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRSLBxg0O+4LnhUPNrYJES/ShwVCMYnA6a6EhQ+aCHk=;
 b=q/Drp6C2psf0QmBoRT/AHRzQN5kyd2BTQ98jToxqhWmIPUoQa4jxNH2ucTSoaNVx04
 auuuCkUPErT5K5/6IvlOhB8M97nbyTBRB1AJnqi3HjEe+GptxSbl6ALg6r6OkUeTqb8W
 7bBlHfhp3/3PTHbA9Ra/UY9rPjNfkoGBdpsxQxXcKrPq+/GmXs0F1AHWoiIRcE7sSuVY
 h9TbJ4zchrPJ+ATymPenBpEs7Ps3pELYisVWpeT5aYESkOvLUt5DgXKvkD8Yriaa8dZr
 dKFlK1KmrLY45m2LoKEzR2btOQwiOtXueO8OjJS1LdpQ4VsSP0PgPqlAfiVOaO36j1XG
 4mgg==
X-Gm-Message-State: AOJu0Yx4ySBDoJQDDTkm1ABBKWYLEIUSc66FcewEyg43AmWsVV1B+Cz9
 Oo2dSoYpbGWe03HiO3qA4i7Z2tZNz2KwJH+1hL+vQ0fcFk2PInlWa7ypwsN4U4z29uActZ5i6Gq
 ISpjMThw=
X-Gm-Gg: ASbGnctDTmDiWejsKwiyiZ9AB2JbAEKfgX75+vXg1skB0+OlMR44Gg+V2Z/pUQjdW37
 TGndrQqPhHmYUWoX7vyatSAfdYd+KIPjXDjaYdTMLdc4DshH2uG0ULgQsPUX4ryK7H04aPz+Imc
 lAAEl2957ZngE4iN9X5BHjbs543Jc56MuqjsS29h0dAqGo9XfmhDfTbwifwUtUcZ93ju/3fXm3s
 9vtVc4ufgqquhuhEg4mJ+I9RljTbXNTBOVWwsM9mIor/ZD67wzW9dQ2jXAeAJRLbISM34IWejmF
 IhmgUcWlH8gvyMtZGQ8vZ+AE0AvWCbJe30UIl/hT4fi8F4pqn25Q
X-Google-Smtp-Source: AGHT+IH2/i0+n3ObzxIJjHp+7f5veKhnoIveXdZ3ICBpULdHgHlIe0eDrG+nSMEJu5RK5oBTFiGlLg==
X-Received: by 2002:a17:907:2d9e:b0:ad8:ac7e:eead with SMTP id
 a640c23a62f3a-adb36be22a1mr1479558866b.39.1748959263604; 
 Tue, 03 Jun 2025 07:01:03 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd045c8sm962230266b.103.2025.06.03.07.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:01:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 01DCE5F9CD;
 Tue, 03 Jun 2025 15:01:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  3 Jun 2025 15:00:56 +0100
Message-ID: <20250603140100.1910123-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603140100.1910123-1-alex.bennee@linaro.org>
References: <20250603140100.1910123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748959264; x=1749564064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRSLBxg0O+4LnhUPNrYJES/ShwVCMYnA6a6EhQ+aCHk=;
 b=sISDdiWHs0qfJoJ1+V1PGSED6PFQ9Zrbz9oAVCyPOFj1FIe6GbjOvjgBaLwtPhr4Ov
 T6g+sQyIOR8+mRU7sx5rLd8kYuj5U9qxuvnWttWVsf+LCXT11hJWjwW+dYYoOr1m1/IZ
 7oyunheWhB01aGF//sb8MeyKy2Qgl06G+CX3I1NlmJKG6ADXeqznJO0Ct4Xunu5U8bhK
 2w3Dtj6yB5lAeBdTbZkPPGfwtX9N2cpQyj8b4TUVNlmWY0lM45pRtgcJfBVvBMk/pA6b
 6F3Kw/QJ5nOxu3Q/Kmyr99wxCM8Nm8NDVqTzkHounBAIeaZ8lR5ljfoH0HZ/FiPUw5Op
 dnYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sISDdiWH
Subject: [Buildroot] [PATCH v5 2/4] package/vulkan-[headers|loader|tools]:
 bump to 1.4.316 release
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
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2NAog
IC0gMS40LjMwNiAtPiAxLjQuMzE2CiAgLSBkb2Vzbid0IHNlZW0gdG8gbmVlZCBpc3lzdGVtIHBh
dGNoIG5vdwp2MwogIC0gZml4IHVwIGNvbW1lbnQsIHByb3Blcmx5IHNlbGVjdCB0aGUgU0RLIHBh
Y2thZ2UKLS0tCiBwYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2ggfCAy
ICstCiBwYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rICAgfCAyICstCiBw
YWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoICAgfCAyICstCiBwYWNrYWdl
L3Z1bGthbi10b29scy9Db25maWcuaW4gICAgICAgICAgICAgfCAzICsrLQogcGFja2FnZS92dWxr
YW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2ggICAgIHwgMiArLQogcGFja2FnZS92dWxrYW4tdG9v
bHMvdnVsa2FuLXRvb2xzLm1rICAgICAgIHwgMyArKy0KIDYgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLWhl
YWRlcnMvdnVsa2FuLWhlYWRlcnMuaGFzaCBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2Fu
LWhlYWRlcnMuaGFzaAppbmRleCBiMzhiZmNmZjQ3Li40ZGZkODVkMjIzIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2gKKysrIGIvcGFja2FnZS92
dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMzE3ZTQ2N2E1ZmIyZWFhNmExOGI5ODRlYzcwZmRiZmFj
Y2Q5MzU5NWEzZTZmNGJjY2VjYTdkM2ZhYjI4MDUwNSAgdnVsa2FuLWhlYWRlcnMtMS4zLjI2Mi50
YXIuZ3oKK3NoYTI1NiAgODk1Y2FhZTVhNjhlZjZiYmVjMjkxYzdkZjk1M2E0NjNjNzUxYmVlMWI2
ZTYyOGI2MTJjZmJjMmVmODNlZTNhNSAgdnVsa2FuLWhlYWRlcnMtMS40LjMxNi50YXIuZ3oKIHNo
YTI1NiAgYWMyNGU1ZWE5MjBlNDMxOGU0ZDAyYzQwODZhZTUxZjUzY2ZiMDNmZWVkMDZjMThkZjEw
MTllN2FkYTFlYzdiYyAgTElDRU5TRS5tZApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4taGVh
ZGVycy92dWxrYW4taGVhZGVycy5tayBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhl
YWRlcnMubWsKaW5kZXggMjBiMjQ4MzY0ZC4uNmIxNTljMTA1NCAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5taworKysgYi9wYWNrYWdlL3Z1bGthbi1o
ZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rCkBAIC02LDcgKzYsNyBAQAogCiAjIE5vdGU6IGNoYW5n
aW5nIHRoaXMgdmVyc2lvbiB3aWxsIGFsc28gYWZmZWN0IHZ1bGthbi1sb2FkZXIgYW5kCiAjIHZ1
bGthbi10b29scywgc28gcGxlYXNlIHVwZGF0ZSB0aG9zZSBwYWNrYWdlcyBhcyB3ZWxsLgotVlVM
S0FOX0hFQURFUlNfVkVSU0lPTiA9IDEuMy4yNjIKK1ZVTEtBTl9IRUFERVJTX1ZFUlNJT04gPSAx
LjQuMzE2CiBWVUxLQU5fSEVBREVSU19TSVRFID0gJChjYWxsIGdpdGh1YixLaHJvbm9zR3JvdXAs
VnVsa2FuLUhlYWRlcnMsdiQoVlVMS0FOX0hFQURFUlNfVkVSU0lPTikpCiBWVUxLQU5fSEVBREVS
U19MSUNFTlNFID0gQXBhY2hlLTIuMCwgTUlUCiBWVUxLQU5fSEVBREVSU19MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRS5tZApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1s
b2FkZXIuaGFzaCBiL3BhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLmhhc2gKaW5k
ZXggZTA5ZWNkYThhOS4uYTlmYWI2YmEwMCAxMDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tbG9h
ZGVyL3Z1bGthbi1sb2FkZXIuaGFzaAorKysgYi9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2Fu
LWxvYWRlci5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgM2JiYWE1ZWU2NDA1OGE4OTk0OWViNzc3ZGU2NmNlOTRiZmUzMTQxODkyNTE0MTcyY2ZjOTQ1
MWM3NTY4MDJkNSAgdnVsa2FuLWxvYWRlci0xLjMuMjYyLnRhci5negorc2hhMjU2ICAwMGU5Y2I1
YTQ5ZTQ4ZDdhODFhMzIzNTFjMDQ4NjY0NjhjNDA5NjZkZmRmNjM5MzU3MDk1M2EzMGM0MWY2ZGNl
ICB2dWxrYW4tbG9hZGVyLTEuNC4zMTYudGFyLmd6CiBzaGEyNTYgIDQzYzBhMzdlNmEwZmE3ZmYz
Yzg0M2IzZWM1YTRmYWM4NGI3MTI1NThkZGFjMTAzZmJkNGMxNjQ5NjYyYTllY2UgIExJQ0VOU0Uu
dHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3Z1bGthbi10b29scy9Db25maWcuaW4gYi9wYWNrYWdl
L3Z1bGthbi10b29scy9Db25maWcuaW4KaW5kZXggNTRmYTUzOWRhYi4uYmIwZGNlODI4MiAxMDA2
NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvdnVs
a2FuLXRvb2xzL0NvbmZpZy5pbgpAQCAtNiwxMiArNiwxMyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
VlVMS0FOX1RPT0xTCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgdnVs
a2FuLWxvYWRlcgogCXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5fSEVBREVSUwogCXNlbGVjdCBC
UjJfUEFDS0FHRV9WVUxLQU5fTE9BREVSCisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZVTEtBTl9TREsK
IAogCWhlbHAKIAkgIFRoZSBLaHJvbm9zIG9mZmljaWFsIFZ1bGthbiBUb29scyBhbmQgVXRpbGl0
aWVzLgogCiAJICBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scwog
Ci1jb21tZW50ICJ2dWxrYW4tdG9vbHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBkeW5hbWlj
IGxpYnJhcnksIHRocmVhZHMsIGdjYyA+PSA0LjkiCitjb21tZW50ICJ2dWxrYW4tdG9vbHMgbmVl
ZHMgYSB0b29sY2hhaW4gdy8gQysrLCBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMsIGdjYyA+PSA0
LjksIHZ1bGthbi1zZGsiCiAJZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IEJS
Ml9TVEFUSUNfTElCUyB8fCBcCiAJCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFCUjJf
VE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXRv
b2xzL3Z1bGthbi10b29scy5oYXNoIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xz
Lmhhc2gKaW5kZXggMjRjMDY5Nzc4NC4uZjRjN2FmMGU5MSAxMDA2NDQKLS0tIGEvcGFja2FnZS92
dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2gKKysrIGIvcGFja2FnZS92dWxrYW4tdG9vbHMv
dnVsa2FuLXRvb2xzLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAot
c2hhMjU2ICA4Yzc3ZDAyNjk0ZDA1MTZhZTJiYTNmMzcxODc0NTY0N2U4N2U3ODhlZjkzZmFhYmIy
ZTM2NzRmZjMyNjA4MDEwICB2dWxrYW4tdG9vbHMtMS4zLjI2Mi50YXIuZ3oKK3NoYTI1NiAgM2Q1
NmQ1NzdiOTA4ZTY2Mjc4OTFiMGYwYzBmYzViYTVlYTlkYjA2MjBkMGE3NzU1ZTJlZjMxMmUzNjI5
YWNiZiAgdnVsa2FuLXRvb2xzLTEuNC4zMTYudGFyLmd6CiBzaGEyNTYgIGNmYzc3NDliOTZmNjNi
ZDMxYzNjNDJiNWM0NzFiZjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VO
U0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsg
Yi9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsKaW5kZXggOWY1YmY0NmI3OS4u
OWRlZWRhNjA4NiAxMDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xz
Lm1rCisrKyBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5tawpAQCAtMTEsNyAr
MTEsOCBAQCBWVUxLQU5fVE9PTFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0CiAKIFZVTEtB
Tl9UT09MU19ERVBFTkRFTkNJRVMgPSBcCiAJdnVsa2FuLWhlYWRlcnMgXAotCXZ1bGthbi1sb2Fk
ZXIKKwl2dWxrYW4tbG9hZGVyIFwKKwl2dWxrYW4tc2RrCiAKIFZVTEtBTl9UT09MU19DT05GX09Q
VFMgKz0gXAogCS1EQlVJTERfQ1VCRT1PRkYgXAotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
