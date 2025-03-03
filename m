Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CAEC282D2
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225736078F;
	Mon,  3 Mar 2025 16:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CqrwTlaWV6P; Mon,  3 Mar 2025 16:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B6D607B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B6D607B3;
	Mon,  3 Mar 2025 16:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 637ECB91
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52EE18213A
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LBmxvcRRc2H for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EF4A82142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF4A82142
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EF4A82142
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bbd711eedso11895415e9.3
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741018563; x=1741623363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQc0dIF+R/o+o2jcbt8AWJsEkSywziEg9Qv4wNHIttE=;
 b=pY3qgPyF8bpWEFmQOJxcQ4MnwqC7kNPftfL8JGvj+lDecoP7dYlThT5qyWpob758Pw
 yRI1GC/6xIWeVjOGhFwVEo99L9/8lJiTweJwBeVZMlR6ZY5sF/pHAj4txTinSRizSkcA
 iy30m05z7rs5LWFF7y3uCaiuAMToac/WuyULP9Yh0hXkhxktar0qOXGk5UZlyvyB27Pl
 MgKATNmmEDxrvGBCgc+sqOhurDMeQgDusEdt6bHXDxp5WvdTZVBtu7YgaJnNZk6dIomy
 w8g8N1asoUxgMRTSPSTw244O4UT+Mwwzcb6lP9IeyJlSyMelfVUQm6S4D172AwFdWitw
 CbRw==
X-Gm-Message-State: AOJu0YwQmd/RP/REU8U79lhj6GY3h4pV3ife+j3lBWWCYanyut/d4vzd
 v+5GchTT+AnuYzMh4z5C1Q42GV1BVD2kqbco4qDAgqfV2J1el3gV/ME5Czueg8WOpYhPIvYp2ca
 cLgg=
X-Gm-Gg: ASbGncsv5UT+BUOnz7B/VMoCo0T7QpGmOHbPN2r8dEzfjWkLxc2IVLy0IeuiNL3o171
 EBMmAhXGXTKPg6BSr/G5O5MHvDZGcMh/N/lQRscAWJA/9KqS8wANC6TQnFobZH/todjv8VD0aG7
 4Oiqbjr3Z9IoHu+9t2FfFk3r4S0+ttdhg9nqBdnPfERF5Q4cUPp15OWPf0rranIbjzFQKrUkON/
 cR6Dfd20XX6heDReswZcx8yH700erDITxAZNJ/rX0u5j8WAfk0Ge3bNhB5tqqmeo8fWIq86hGIk
 LiqHsN/I8eWRKIRcwSNdRS/cTjUspL4n4XhXvyUVSL3UX9Q=
X-Google-Smtp-Source: AGHT+IGzHhiILu5LR1NX5mlET+I1jdw4b2t7I9qsw/U8S+Rm/jsNZw4+lW0Gd2lsltYpd0BKPeBOrg==
X-Received: by 2002:a5d:588a:0:b0:390:fbcf:56ea with SMTP id
 ffacd0b85a97d-390fbcf5860mr5582651f8f.14.1741018561389; 
 Mon, 03 Mar 2025 08:16:01 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6a87sm15133199f8f.32.2025.03.03.08.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:15:59 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 841875FA05;
 Mon,  3 Mar 2025 16:15:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 16:15:54 +0000
Message-Id: <20250303161557.571619-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303161557.571619-1-alex.bennee@linaro.org>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741018563; x=1741623363; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQc0dIF+R/o+o2jcbt8AWJsEkSywziEg9Qv4wNHIttE=;
 b=Y/+9TzZJ1r7GCguqCeYKCZ/SkV6zYSpLINv7m63iWD3dnuYTZKNzPOyVfoFWfmfrgB
 j3DNP8TFv1gx4dIn5g3J5H8roXFii3t3e90uwP0ih7mF7B/cYzuJqfPCK830/1TxWtvy
 5mQdVacdxJGx/VCracFTQG2SyCFW4KnPzl1a+tdUt2ZdcPg/PUvTvvSxQmBBgOUg7/KG
 hQipmLpjx0oDYO92Su4b+QA1hlveqYGRfO2XDSEyPjp0EHeOmt6J7SySbGeL/y5qXw11
 1zdu1kTsHUrE7MfaJbvMf2zpWgoDaWrBGYvWA6OzgDEeI0sRBhzdl758YR3e5SDQHp+O
 UEPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y/+9TzZJ
Subject: [Buildroot] [PATCH v4 3/6] package/vulkan-[headers|loader|tools]:
 bump to 1.4.307 release
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

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHJlbGVhc2UuIFdlIG5vdyBuZWVkIHRoZSByZWNlbnRseSBh
ZGRlZAp2dWxrYW4tc2RrIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSB2b2xrIGxvYWRlci4KClNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2Mwog
IC0gZml4IHVwIGNvbW1lbnQsIHByb3Blcmx5IHNlbGVjdCB0aGUgU0RLIHBhY2thZ2UKLS0tCiBw
YWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2ggfCAyICstCiBwYWNrYWdl
L3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rICAgfCAyICstCiBwYWNrYWdlL3Z1bGth
bi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoICAgfCAyICstCiBwYWNrYWdlL3Z1bGthbi10b29s
cy9Db25maWcuaW4gICAgICAgICAgICAgfCAzICsrLQogcGFja2FnZS92dWxrYW4tdG9vbHMvdnVs
a2FuLXRvb2xzLmhhc2ggICAgIHwgMiArLQogcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRv
b2xzLm1rICAgICAgIHwgMyArKy0KIDYgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2Fu
LWhlYWRlcnMuaGFzaCBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMuaGFz
aAppbmRleCBiMzhiZmNmZjQ3Li5jMzhmYjJjNDAyIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGth
bi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2gKKysrIGIvcGFja2FnZS92dWxrYW4taGVhZGVy
cy92dWxrYW4taGVhZGVycy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKLXNoYTI1NiAgMzE3ZTQ2N2E1ZmIyZWFhNmExOGI5ODRlYzcwZmRiZmFjY2Q5MzU5NWEzZTZm
NGJjY2VjYTdkM2ZhYjI4MDUwNSAgdnVsa2FuLWhlYWRlcnMtMS4zLjI2Mi50YXIuZ3oKK3NoYTI1
NiAgNmU4NDQ1YmMxMmMxZTI3MDJjMjdmNGYwMmQxYTA1N2ZiODNmNDBjYzU2YzZhOGU0NTgzMTQx
ZDRlYWFkOTBkNCAgdnVsa2FuLWhlYWRlcnMtMS40LjMwNy50YXIuZ3oKIHNoYTI1NiAgYWMyNGU1
ZWE5MjBlNDMxOGU0ZDAyYzQwODZhZTUxZjUzY2ZiMDNmZWVkMDZjMThkZjEwMTllN2FkYTFlYzdi
YyAgTElDRU5TRS5tZApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4t
aGVhZGVycy5tayBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMubWsKaW5k
ZXggMjBiMjQ4MzY0ZC4uYjg4OWRlNjkwZSAxMDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4taGVh
ZGVycy92dWxrYW4taGVhZGVycy5taworKysgYi9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGth
bi1oZWFkZXJzLm1rCkBAIC02LDcgKzYsNyBAQAogCiAjIE5vdGU6IGNoYW5naW5nIHRoaXMgdmVy
c2lvbiB3aWxsIGFsc28gYWZmZWN0IHZ1bGthbi1sb2FkZXIgYW5kCiAjIHZ1bGthbi10b29scywg
c28gcGxlYXNlIHVwZGF0ZSB0aG9zZSBwYWNrYWdlcyBhcyB3ZWxsLgotVlVMS0FOX0hFQURFUlNf
VkVSU0lPTiA9IDEuMy4yNjIKK1ZVTEtBTl9IRUFERVJTX1ZFUlNJT04gPSAxLjQuMzA3CiBWVUxL
QU5fSEVBREVSU19TSVRFID0gJChjYWxsIGdpdGh1YixLaHJvbm9zR3JvdXAsVnVsa2FuLUhlYWRl
cnMsdiQoVlVMS0FOX0hFQURFUlNfVkVSU0lPTikpCiBWVUxLQU5fSEVBREVSU19MSUNFTlNFID0g
QXBhY2hlLTIuMCwgTUlUCiBWVUxLQU5fSEVBREVSU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5t
ZApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1sb2FkZXIuaGFzaCBi
L3BhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLmhhc2gKaW5kZXggZTA5ZWNkYThh
OS4uNzIyNzFiNzQ1MCAxMDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1s
b2FkZXIuaGFzaAorKysgYi9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNo
CkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgM2JiYWE1ZWU2
NDA1OGE4OTk0OWViNzc3ZGU2NmNlOTRiZmUzMTQxODkyNTE0MTcyY2ZjOTQ1MWM3NTY4MDJkNSAg
dnVsa2FuLWxvYWRlci0xLjMuMjYyLnRhci5negorc2hhMjU2ICA2NjFmN2I3ZDE1MzY1Mzg0MjA3
NzEzNzJkZDgwNTBmMmQyMjRmY2YzYTAyM2YzMWQ2NmVhNzZkOGFmN2I5MTFlICB2dWxrYW4tbG9h
ZGVyLTEuNC4zMDcudGFyLmd6CiBzaGEyNTYgIDQzYzBhMzdlNmEwZmE3ZmYzYzg0M2IzZWM1YTRm
YWM4NGI3MTI1NThkZGFjMTAzZmJkNGMxNjQ5NjYyYTllY2UgIExJQ0VOU0UudHh0CmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3Z1bGthbi10b29scy9Db25maWcuaW4gYi9wYWNrYWdlL3Z1bGthbi10b29s
cy9Db25maWcuaW4KaW5kZXggNTRmYTUzOWRhYi4uYmIwZGNlODI4MiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzL0Nv
bmZpZy5pbgpAQCAtNiwxMiArNiwxMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfVlVMS0FOX1RPT0xT
CiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgdnVsa2FuLWxvYWRlcgog
CXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5fSEVBREVSUwogCXNlbGVjdCBCUjJfUEFDS0FHRV9W
VUxLQU5fTE9BREVSCisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZVTEtBTl9TREsKIAogCWhlbHAKIAkg
IFRoZSBLaHJvbm9zIG9mZmljaWFsIFZ1bGthbiBUb29scyBhbmQgVXRpbGl0aWVzLgogCiAJICBo
dHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scwogCi1jb21tZW50ICJ2
dWxrYW4tdG9vbHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBkeW5hbWljIGxpYnJhcnksIHRo
cmVhZHMsIGdjYyA+PSA0LjkiCitjb21tZW50ICJ2dWxrYW4tdG9vbHMgbmVlZHMgYSB0b29sY2hh
aW4gdy8gQysrLCBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMsIGdjYyA+PSA0LjksIHZ1bGthbi1z
ZGsiCiAJZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IEJSMl9TVEFUSUNfTElC
UyB8fCBcCiAJCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFCUjJfVE9PTENIQUlOX0dD
Q19BVF9MRUFTVF80XzkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10
b29scy5oYXNoIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2gKaW5kZXgg
MjRjMDY5Nzc4NC4uNGM5YmY1OWUwOCAxMDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tdG9vbHMv
dnVsa2FuLXRvb2xzLmhhc2gKKysrIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xz
Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA4Yzc3
ZDAyNjk0ZDA1MTZhZTJiYTNmMzcxODc0NTY0N2U4N2U3ODhlZjkzZmFhYmIyZTM2NzRmZjMyNjA4
MDEwICB2dWxrYW4tdG9vbHMtMS4zLjI2Mi50YXIuZ3oKK3NoYTI1NiAgNGYwYmFlYWYwNzhjMmE5
ZDI5OGI4N2Q2ZDZlZjg1YzNmYWYwOGYwZjk1YjhhN2Q3ZDdmZjI0M2M2ZGUyNzA3YyAgdnVsa2Fu
LXRvb2xzLTEuNC4zMDcudGFyLmd6CiBzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNjNDJiNWM0
NzFiZjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VOU0UudHh0CmRpZmYg
LS1naXQgYS9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsgYi9wYWNrYWdlL3Z1
bGthbi10b29scy92dWxrYW4tdG9vbHMubWsKaW5kZXggOWY1YmY0NmI3OS4uOWRlZWRhNjA4NiAx
MDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLm1rCisrKyBiL3Bh
Y2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5tawpAQCAtMTEsNyArMTEsOCBAQCBWVUxL
QU5fVE9PTFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0CiAKIFZVTEtBTl9UT09MU19ERVBF
TkRFTkNJRVMgPSBcCiAJdnVsa2FuLWhlYWRlcnMgXAotCXZ1bGthbi1sb2FkZXIKKwl2dWxrYW4t
bG9hZGVyIFwKKwl2dWxrYW4tc2RrCiAKIFZVTEtBTl9UT09MU19DT05GX09QVFMgKz0gXAogCS1E
QlVJTERfQ1VCRT1PRkYgXAotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
