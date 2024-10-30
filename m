Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1DD5CCB0
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 13:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3825160807;
	Wed, 30 Oct 2024 13:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCwATl9dl9yK; Wed, 30 Oct 2024 13:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D08D608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D08D608A9;
	Wed, 30 Oct 2024 13:43:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B057F5E50
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E28240096
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S1wxO8rDdJ2 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 13:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FB6E400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB6E400FF
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FB6E400FF
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:43:46 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so67272115ad.0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 06:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730295825; x=1730900625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oue8D4gHDcOffeMwU5hBMqeUG79qiN7gtooleGayi0c=;
 b=rYheL1/7/uzYLAx6W0neXsWtrHLXgIWAojFy9RERUj2ufTNiFntRd9wBCGFK9+sh1z
 Gx6Yy0nKtnpQaDNQ9ZIdfTbYaLVWhFl2Mu+EMP5Z23wDP/XMkhkZxRq7T0dO5fXimyST
 0/pG8yLYAgS1EdSznXUUKpNP9n14ZIDEx2BueR6HJREq0Q4Nt/PStl2uVqc286msQZEk
 V4XCkzFIiY22FL7bbyya6yBT9ywSBTaHdAqYR9Y4y3RoJAi7vF8EPFJ407QRJDersgTn
 BRhoLOdGefEs0dEwheQ1dWsW8fE0JAxvWJsvvSWUN+Rio5lWSQqqFlu+qHN+z2kwZ4jx
 Fu2A==
X-Gm-Message-State: AOJu0Yz5rGSD+HS01LFp8OyK2igY45nI1nvc507wSNrlnddp+niI7r3Y
 2c9eSGXrdIIerdX/8wvB3lDKcSYcOeWsEEmpy9vmH/zT8vdHUT5Pel0scRCvBHQ=
X-Google-Smtp-Source: AGHT+IHbTyplJy8ZzuwJKYIULwVW56KHRMUdGyPicDRrzE6OPPmzUAYaDS6aLmPLZunIoyo4Gxt7Cw==
X-Received: by 2002:a17:902:f60a:b0:20c:a055:9f07 with SMTP id
 d9443c01a7336-210c6c0210bmr195095285ad.26.1730295825088; 
 Wed, 30 Oct 2024 06:43:45 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02e97asm80829505ad.195.2024.10.30.06.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 06:43:44 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 21:43:33 +0800
Message-ID: <20241030134339.2482614-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029054713.786223-1-fancp2007@gmail.com>
References: <20241029054713.786223-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730295825; x=1730900625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oue8D4gHDcOffeMwU5hBMqeUG79qiN7gtooleGayi0c=;
 b=XWcQkowvUfVLWCQypYpvGtFEPskkZB6yja9ddEeEESl4vtb5gOwT+D7JRgirOnTRGp
 XT8br3i6pNDSQZFqxPY8FXh0n/+1kic67//z95qLAzWYD5opQcCPnUDNJk1ZTQ39NNJw
 WbC+Lx+Jhp2QeFud9llFkL3QLvJCqc//4kMLtymTD2TjQoQCl2tfp33CBwlkLao9oG+4
 ZOJYGC/u4zoNN95/3lDihDMAZ4LgY8kxYYVzQ/0bdYXmfsem4bQ5wo3epUFXiaIHui5b
 CenTfssXIKdRmSTMSX28yS+kvVxnItdNfeRib19csjFkipUaOSATU3X+lV+L66Bf83vZ
 4ogA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XWcQkowv
Subject: [Buildroot] [PATCH v4] package/python-pgcopy: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgoKLS0tCkNoYW5n
ZXMgdjEgLT4gdjI6CiAgLSBhZGQgbWlzc2luZyBjb25maWcgbWVudSBlbnRyeSBpbiBDb25maWcu
aW4KCkNoYW5nZXMgdjIgLT4gdjM6CiAgLSBmaXggaGVscCB0ZXh0IGluZGVudCBpbiBDb25maWcu
aW4KCkNoYW5nZXMgdjMgLT4gdjQ6CiAgLSBhZGQgbWlzc2luZyBkZXBlbmRlbmNpZXMgaW4gdGhl
IENvbmZpZy5pbiBmaWxlCiAgLSBhZGQgYSBjb21tZW50IGZvciB0aGUgaG9vayBQWVRIT05fUEdD
T1BZX0NMRUFOX1BZMl9TQ1JJUFQKICAtIHJlbW92ZSB0aGUgcHJlIGNvbmZpZ3VyZSBob29rIFBZ
VEhPTl9QR0NPUFlfQ1JFQVRFX1NFVFVQX0NGRwotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3B5dGhvbi1wZ2NvcHkvQ29uZmlnLmluICAgICAg
ICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0
aG9uLXBnY29weS5oYXNoIHwgIDUgKysrKysKIHBhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24t
cGdjb3B5Lm1rICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwg
NTEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXBnY29w
eS9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0
aG9uLXBnY29weS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcGdjb3B5
L3B5dGhvbi1wZ2NvcHkubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwpp
bmRleCA3NmYxNWY3MDhhLi5mN2NmYmYzYWQ1IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBi
L0RFVkVMT1BFUlMKQEAgLTI5MjMsNiArMjkyMyw5IEBAIEY6CXBhY2thZ2UvbHJ6aXAvCiBOOglT
YW0gVm9zcyA8c2FtLnZvc3NAZ21haWwuY29tPgogRjoJcGFja2FnZS9yaXBncmVwLwogCitOOglT
Y290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5jb20+CitGOglwYWNrYWdlL3B5dGhvbi1wZ2NvcHkv
CisKIE46CVPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
LmNvbT4KIEY6CWJvYXJkL2FybWFkZXVzLwogRjoJY29uZmlncy9hcm1hZGV1cyoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggYjFlOTk5YTYz
Yi4uZWRhODc3YmNlMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KQEAgLTEyNTksNiArMTI1OSw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBt
b2R1bGVzIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tcGF0aHZhbGlkYXRlL0NvbmZpZy5pbiIK
IAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXBlcmlwaGVyeS9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL3B5dGhvbi1wZXhwZWN0L0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9u
LXBnY29weS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1waWNrbGVzaGFyZS9D
b25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1waWV4aWYvQ29uZmlnLmluIgogCXNv
dXJjZSAicGFja2FnZS9weXRob24tcGlncGlvL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uLXBnY29weS9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvQ29uZmln
LmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZmNGFiNTU0NGYKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvQ29uZmlnLmluCkBAIC0wLDAg
KzEsMjEgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fUEdDT1BZCisJYm9vbCAicHl0aG9u
LXBnY29weSIKKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgcG9zdGdyZXNxbAorCWRlcGVuZHMg
b24gQlIyX1VTRV9XQ0hBUiAjIHBvc3RncmVzcWwKKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJ
QlMgIyBwb3N0Z3Jlc3FsCisJZGVwZW5kcyBvbiAhQlIyX09QVElNSVpFX0ZBU1QgIyBwb3N0Z3Jl
c3FsCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BPU1RHUkVTUUwKKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
UFlUSE9OX1BTWUNPUEcyCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9QWVRaCisJaGVscAor
CSAgVXNlIHBnY29weSBmb3IgZmFzdCBkYXRhIGxvYWRpbmcgaW50byBQb3N0Z3JlU1FMIHdpdGgK
KwkgIGJpbmFyeSBjb3B5LgorCisJICBodHRwczovL2dpdGh1Yi5jb20vYWx0YXVyb2cvcGdjb3B5
CisKK2NvbW1lbnQgInB5dGhvbi1wZ2NvcHkgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBs
aWJyYXJ5LCB3Y2hhciIKKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCisJZGVwZW5kcyBvbiBCUjJf
U1RBVElDX0xJQlMgfHwgIUJSMl9VU0VfV0NIQVIKKworY29tbWVudCAicHl0aG9uLXBnY29weSBj
YW4ndCBiZSBidWlsdCB3aXRoIE9wdGltaXplIGZvciBmYXN0IgorCWRlcGVuZHMgb24gQlIyX09Q
VElNSVpFX0ZBU1QKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24tcGdj
b3B5Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0aG9uLXBnY29weS5oYXNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjlmYTc5OTA4NzcKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0aG9uLXBnY29weS5oYXNoCkBAIC0wLDAg
KzEsNSBAQAorIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9wZ2NvcHkv
anNvbgorbWQ1ICBiYjc5NDBlZDgyMWY1NGYzMjcwNWM0NjJmNzU4MjQ1OCAgcGdjb3B5LTEuNi4w
LnRhci5negorc2hhMjU2ICAwZGE5MjM1ZWVhNGVlOWNlYjRmNTJiOTc1MjNiYzg5ZGI5YTZmOGU4
MGY4OTdiNDkyMTRlODE0ZWExM2QwNGIwICBwZ2NvcHktMS42LjAudGFyLmd6CisjIExvY2FsbHkg
Y29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2ICA5NjkxOTE0MjhjYjA3MjllNjg5NDY4
YmRjZDE1MjI5MWE0ZTE2ODg3NTc1NWM5Nzc0NWNkMmRmNmRlNTUyMGMxICBMSUNFTlNFLnR4dApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcGdjb3B5L3B5dGhvbi1wZ2NvcHkubWsgYi9wYWNr
YWdlL3B5dGhvbi1wZ2NvcHkvcHl0aG9uLXBnY29weS5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi4yNzZlZjc3ZTdlCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9w
eXRob24tcGdjb3B5L3B5dGhvbi1wZ2NvcHkubWsKQEAgLTAsMCArMSwyMSBAQAorIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKyMKKyMgcHl0aG9uLXBnY29weQorIworIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKKworUFlUSE9OX1BHQ09QWV9WRVJTSU9OID0gMS42LjAKK1BZVEhPTl9QR0NPUFlfU09V
UkNFID0gcGdjb3B5LSQoUFlUSE9OX1BHQ09QWV9WRVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9QR0NP
UFlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9iMC83ZC9h
NWM4MzNmOTIxYjIwY2RiMWU4NTM4ZTcyYTYwNjViY2M2N2JiYjI3MGZhN2EzNWU5OGYyZDM5N2Nl
MGMKK1BZVEhPTl9QR0NPUFlfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKK1BZVEhPTl9QR0NPUFlf
TElDRU5TRSA9IE1JVAorUFlUSE9OX1BHQ09QWV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQK
K1BZVEhPTl9QR0NPUFlfREVQRU5ERU5DSUVTID0gcG9zdGdyZXNxbCBweXRob24tcHN5Y29wZzIg
cHl0aG9uLXB5dHoKKworIyBSZW1vdmUgdGhlIGZpbGUgb25seSBmb3IgUHl0aG9uIDIsIGl0IHdp
bGwgY2F1c2UgY29tcGlsYXRpb24gZXJyb3JzCitkZWZpbmUgUFlUSE9OX1BHQ09QWV9DTEVBTl9Q
WTJfU0NSSVBUCisJJChSTSkgJChARCkvcGdjb3B5L2Vycm9ycy9weTIucHkKK2VuZGVmCitQWVRI
T05fUEdDT1BZX1BPU1RfRVhUUkFDVF9IT09LUyArPSBQWVRIT05fUEdDT1BZX0NMRUFOX1BZMl9T
Q1JJUFQKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
