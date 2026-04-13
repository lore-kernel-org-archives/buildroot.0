Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F5EBFD37
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 11:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAB460E78;
	Mon, 13 Apr 2026 11:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgjNGOGqGmxE; Mon, 13 Apr 2026 11:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B1960E33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776078668;
	bh=wCgo5UzSDV93F5ZgencPPkAE4ikl0AENZc5+8cqlfPk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=N3+mQ+Yi1xDlCqLoNxshjzVkb35Lf52dLCA5mAeKJ+/FXGfvoaHh0cqCcttyC7sif
	 5Pn+mjcjOO+6goTqg3cwwSJhjsTz0fz+Lk020vfXP4KLIfsg5YsyjHhnIP5xdgV9aX
	 O2v+DFrlfcH77YRRY9EAZGZeZ8d+83Lh/PFPxwW3HwKdeJMZTG929uqvmdmBQnuxv2
	 02x7CSIGZIbylp2uNhki2UVFQs6bsPndlh2j0p7gNYpSxRsOou47ODWblpMuUBWi2Z
	 GrroqYMVRyLv8B6ndYqAyRSENR9BFkK2kMpFsynC6peq5H+ksZ2vPRdR4Pt8H8EdIH
	 p8uLUdsOtrG0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B1960E33;
	Mon, 13 Apr 2026 11:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D15F5194
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B741960E1F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 428q9nobj8L3 for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 11:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8AD360883
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8AD360883
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8AD360883
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:11:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5a2c9c5ff87so4302384e87.0
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 04:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776078664; x=1776683464;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oFL9zggqGwkmh/clahz7j7KHJsVWEDYXsnujeMffAuI=;
 b=GtHdjmkkl3dMSeGXkCFQbHDoYT/j/U+qQRS0g57WI9S33k+f4E8y8fQXFGwp4pi/Nu
 6meSQRQ+cTKsABAzZx45+FrqfBgh0IJGtnCBlY4RVhXTBkTMsnF2TrD9iVX6j8L6ZKXa
 XsPErvmY9abkzuUrP2YrI1McPP03mzzkO3Uod689MFQY4x2zoY85nRg+jm7xx5ErJIlP
 HtxL9J2yzgbRG36YROJ/QxfkBqYKM6Yjzv8zGnAmN96TLXqAVdAvyQmZjeLPU2j9sjpq
 IsMsq3fRqKZ/knnclCYK8qBiAg+FI4Yzwmvjm9s7J1WLbpjjE/EN0S3iQK/ecdS+PUeT
 s8Kg==
X-Gm-Message-State: AOJu0YxSWyI/Ke0d/2QmZCWJX+9K5RZmbnVLPMD0+IcTyyBKbvbANwzy
 bLqTEyVG7Rq1PV25iKaKe+qmJAJHQFSb2SB4Djr7kJVSUgAFAF5pyNonDsNt2g==
X-Gm-Gg: AeBDiev8LO2pSb3vdPy5CCuYXn2ugWCtvYKo6pz8ZFk/PVAbh+i/S1xqe3L6HAjovye
 jXpHAJlPQkwRs9gT3PbRPV6ANWae53Ee2LecIgad3NMYh9Vbc9XFSz2DShdyZoDHdMBpZSrNoiA
 m1TZ8cnworarAbKa4hkGeWaqSw5cPqvreirp3OyZbEWvxBp2pOL0cs5YpzfL0kl7+apSP5fJuw3
 IGRlxXLU90mfwRVGZ7RYvqufCjZ3ozIZNn5OoRDtH+PSDT99wSgeamP7lKSrrgo5+citrqvLliu
 spUJ1oUHVvCnBwApNqoEtSym+3mHKec+aoXy8lMnNA18ADqeCEw/XTU5JHdrMy/5QkXIuBypb6D
 6QUh2gkRZcXwbI3GX7879Awio6aubguhTw5fXuXM1C4D4ncEKiurRSpWvmE0gHF7BrRvc2QZd9Q
 iFPL8LBBoDUohcTjk5hd/N+iIf72NDbLyLvS354HkDshoDdTks3l6EIlOlyllNHg2/TZGAdA==
X-Received: by 2002:a05:6512:10d4:b0:5a2:cac3:5271 with SMTP id
 2adb3069b0e04-5a3efe8ebf4mr4258974e87.42.1776078663506; 
 Mon, 13 Apr 2026 04:11:03 -0700 (PDT)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a3eee938fasm2491190e87.34.2026.04.13.04.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 04:11:02 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 13:10:53 +0200
Message-ID: <20260413111053.3846215-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776078664; x=1776683464; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oFL9zggqGwkmh/clahz7j7KHJsVWEDYXsnujeMffAuI=;
 b=T3/uZMVjFu+eLw6W253i8Nx5l8v/LRDCxG9a9yFruJGYPAfZmAWQuzeHMJ5juL0P3m
 K2nuFmjLjDg9sW0qoMWHUaUR4fgsX8i5F/BfzWXofpcpec95pSkhYOXET6wyykGjcNba
 agPrJnqLO3GYl/Ezsw9rSJsTFpKGBoKdn3UDj9vj01S3eJa2xZka6qN/NQyWoVDq4T09
 GpgkMSvvNuFij+iGgpSPT91p7lt5sVrmBmkrfuM/ZDNz1Oy4kvIl5gzdzb2JVPRx7VDf
 leTGoqML5nCNKxBgJj51IE6I7HLMPcBnfZDZ8016YqxdDZ66Z8jLTdfEmeG6ZV0RJEmd
 g8Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=T3/uZMVj
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: Add option to
 install ath11k (WC68655) firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpcm13YXJlIGZvciBRdWFsY29tbSBXQ042ODU1IFdpRmkgNkUgY2hpcC4KClNpZ25lZC1v
ZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBhY2thZ2Uv
bGludXgtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgfCA2ICsrKysrKwogcGFja2FnZS9saW51
eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluCmluZGV4IDVhZDQ5NTc3
NTYuLjU4YmE2MGU5YzMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmln
LmluCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluCkBAIC0xODgsNiArMTg4
LDEyIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9BVEhFUk9TXzEwS19RQ0E5
OThYCiAJaGVscAogCSAgRmlybXdhcmUgZmlsZXMgZm9yIHRoZSBBdGhlcm9zIFFDQTk4OFggbW9k
dWxlCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9BVEhFUk9TXzExS19XQ042
ODU1CisJYm9vbCAiQXRoZXJvcyAxMWsgKFdDTjY4NTUpIgorCWhlbHAKKwkgIEZpcm13YXJlIGZp
bGVzIGZvciB0aGUgUXVhbGNvbW0gV0NONjg1NSBXaUZpIDZFIGNoaXAKKwkgIChhdGgxMWsgZHJp
dmVyLCBodzIuMCkuCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9CUkNNX0JD
TTQzWFgKIAlib29sICJCcm9hZGNvbSBCUkNNIGJjbTQzeHgiCiAJc2VsZWN0IEJSMl9QQUNLQUdF
X0xJTlVYX0ZJUk1XQVJFX0NZUFJFU1NfQ1lXNDNYWApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51
eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGlu
dXgtZmlybXdhcmUubWsKaW5kZXggNGZlMWM0ZDVmYy4uZTdhNjliZWIxZiAxMDA2NDQKLS0tIGEv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xp
bnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCkBAIC0yNzIsNiArMjcyLDEyIEBAIExJTlVY
X0ZJUk1XQVJFX0ZJTEVTICs9IGF0aDEway9RQ0E5ODhYL2h3Mi4wL2JvYXJkLmJpbiBcCiBMSU5V
WF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19h
dGgxMGsKIGVuZGlmCiAKKyMgYXRoMTFrCitpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX0FUSEVST1NfMTFLX1dDTjY4NTUpLHkpCitMSU5VWF9GSVJNV0FSRV9ESVJTICs9IGF0aDEx
ay9XQ042ODU1L2h3Mi4wCitMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNF
TlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsKK2VuZGlmCisKICMgc2Q4Njg2IHY4CiBpZmVxICgk
KEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0xJQkVSVEFTX1NEODY4Nl9WOCkseSkKIExJTlVY
X0ZJUk1XQVJFX0ZJTEVTICs9IGxpYmVydGFzL3NkODY4Nl92OC5iaW4gbGliZXJ0YXMvc2Q4Njg2
X3Y4X2hlbHBlci5iaW4KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
