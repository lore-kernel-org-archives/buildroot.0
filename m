Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239FEC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 01:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D277883883;
	Sat, 27 Apr 2024 01:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6K8onoJtsre; Sat, 27 Apr 2024 01:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6651838B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6651838B6;
	Sat, 27 Apr 2024 01:55:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6E61BF59E
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 01:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBBCA614B4
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 01:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmwKf-RM0PLo for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 01:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B13A2614B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B13A2614B0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B13A2614B0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 01:55:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2062440f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 18:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714182931; x=1714787731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SMMb2V8rh69YLn1xAL8Ldj8KUfDv76B4dTlFjMkifJo=;
 b=D1Kbl8uMOqyG2tZhsCk9w2IuXvrzj8ifeD3OuwDun9UKl4TgXYlF46WiCX5XZJ3YXF
 dYhGRhtCEfGTMSpdUg8BfOGXqOGE/ZV7NhhUXF5mpWjgmOKmNF3gaulnGPdqX2I/awKK
 XTJCwzxPLOVUK8Eg+DN33rvM2AdWZcelAXCspmeKttG1ljTzvceFlUlEinnHjeljEmYU
 RgwBGVDZI9E9D49C6ECNUU9QDrfiOVlhwq2R7OPnL/3qvnXg1uRpc6JLeEN3kOUTvmsc
 J8bz64j6dSd0K6kwuDrUEJFL+0RviiHTLFMFasrQMVKdKDJxT/XvfLzXfrlPtJwh1j1p
 Bo4Q==
X-Gm-Message-State: AOJu0Yw5YeW6rprpx+KtwhBFNH3jQdzQri2y5TnoJzrtX0CBIwyEaRGt
 ROku3l0hyz7ZEOFoH/8h+oXMolcE3Tyi5HwB4yxOr1wYJBRUKvuFfxaEfefDH7TnF9COPDyltSZ
 nA+A=
X-Google-Smtp-Source: AGHT+IGfOR47kJmxDiq6jqJoGLtcjH/RmRaVD0Zd0Jgvy69x7fibU6P0wOZfkEjwYxlVr5323SAyNQ==
X-Received: by 2002:a05:600c:a4d:b0:41a:c92:d323 with SMTP id
 c13-20020a05600c0a4d00b0041a0c92d323mr2625686wmq.10.1714182930898; 
 Fri, 26 Apr 2024 18:55:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d54cd000000b0034335e47102sm23539601wrv.113.2024.04.26.18.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 18:55:30 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 03:55:17 +0200
Message-ID: <20240427015517.413015-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1714182931; x=1714787731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SMMb2V8rh69YLn1xAL8Ldj8KUfDv76B4dTlFjMkifJo=;
 b=U2M3o9xRqQuGW7PYvj8u5Dlym7EUi9iSXjgBsQl+kCSuBmwlUcMadWDm69HDnpanyr
 RvEOtcWvwUt/MeDROWZPsLbMyyQ3CCqRgr7mok5We8M1XT1XgyobRZY0B7DTK4QGXRSv
 0xWt3OdSaB7aXTZqVxskFnlFxhdA3rdpRd8hI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=U2M3o9xR
Subject: [Buildroot] [RESEND PATCH 1/1] board/raspberrypi_{3_qt5we,
 cm4io*}: autoprobe of bluetooth driver
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGNvbmZpZy50eHQgb2YgdGhlIFJhc3BlcnJ5IFBpJ3Mgc3VwcG9ydGluZyBXaS1GaSBhbmQg
Qmx1ZXRvb3RoIChpLmUuCnplcm8gVywgemVybyAyIFcsIDMsIGFuZCA0KSBzd2l0Y2ggdGhlIEJs
dWV0b290aCBmdW5jdGlvbiB0byB1c2UgdGhlCm1pbmktVUFSVCAodHR5UzApIGFuZCByZXN0b3Jl
IFVBUlQwICh0dHlBTUEwKSBvdmVyIHRoZSBHUElPcyAxNCBhbmQgMTUKKGFzIHBlciBtaW5pdWFy
dC1idC1vdmVybGF5LmR0c1sxXSkuIEFsbCBvZiB0aGVtIHR1cm4gb24gdGhlIHBhcmFtZXRlcgpr
cm5idCB0byBhdXRvcHJvYmUgdGhlIGJsdWV0b290aCBkcml2ZXIuCgpIb3dldmVyLCB0aGUgY29u
ZmlnLnR4dCBmb3IgUGkgMyAoUXQ1IFdlYkVuZ2luZSkgYW5kIHRoZSBDb21wdXRlIE1vZHVsZQo0
IElPICgzMi1iaXQgYW5kIDY0LWJpdCkgYWRkIHRoZSBtaW5pdWFydC1idCBvdmVybGF5IGFzIHdl
bGwgYnV0IGRvIG5vdAp0dXJuIG9uIHRoZSBwYXJhbWV0ZXIga3JuYnQuCgpUaGlzIGFkZHMgdGhl
IG1pc3NpbmcgZHRwYXJhbT1rcm5idD1vbiBmb3IgdGhlc2UgY29uZmlnLnR4dCBmb3IgdGhlCmJl
YXV0eSBvZiBjb25zaXN0ZW5jeS4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBp
L2xpbnV4L2Jsb2IvcnBpLTUuMTAueS9hcmNoL2FybS9ib290L2R0cy9vdmVybGF5cy9taW5pdWFy
dC1idC1vdmVybGF5LmR0cwoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRh
eUBydG9uZS5mcj4KLS0tCiBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM19xdDV3ZS50eHQgICAg
IHwgMyArKysKIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ19jbTRpby50eHQgICAgICAgfCAzICsr
KwogYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvXzY0Yml0LnR4dCB8IDMgKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJy
eXBpL2NvbmZpZ18zX3F0NXdlLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zX3F0NXdl
LnR4dAppbmRleCA3NTIzMTBiMTc5Li5mNjhhMWYyOGY1IDEwMDY0NAotLS0gYS9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfM19xdDV3ZS50eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
XzNfcXQ1d2UudHh0CkBAIC0yNCwzICsyNCw2IEBAIGdwdV9tZW1fMTAyND0yMDAKCiAjIGZpeGVz
IHJwaSAoM0IsIDNCKywgM0ErLCA0QiBhbmQgWmVybyBXKSB0dHlBTUEwIHNlcmlhbCBjb25zb2xl
CiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKKworIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRv
b3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCitkdHBhcmFtPWty
bmJ0PW9uCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfY200aW8udHh0IGIv
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvLnR4dAppbmRleCBjZjdlNmRmMWExLi5kMzY3
OTVjNGZmIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfY200aW8udHh0Cisr
KyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ19jbTRpby50eHQKQEAgLTI1LDYgKzI1LDkgQEAg
Z3B1X21lbV8xMDI0PTEwMAogIyBmaXhlcyBycGkgKDNCLCAzQissIDNBKywgNEIgYW5kIFplcm8g
VykgdHR5QU1BMCBzZXJpYWwgY29uc29sZQogZHRvdmVybGF5PW1pbml1YXJ0LWJ0CgorIyBlbmFi
bGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0
YWNoL2J0YXR0YWNoCitkdHBhcmFtPWtybmJ0PW9uCisKICMgZW5hYmxlIFJUQwogZHRwYXJhbT1p
MmNfdmM9b24KIGR0b3ZlcmxheT1pMmMtcnRjLHBjZjg1MDYzYSxpMmNfY3NpX2RzaQpkaWZmIC0t
Z2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvXzY0Yml0LnR4dCBiL2JvYXJkL3Jh
c3BiZXJyeXBpL2NvbmZpZ19jbTRpb182NGJpdC50eHQKaW5kZXggODEzZjZlYmE3Yi4uYjVkODQw
NmU2OSAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvXzY0Yml0LnR4
dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfY200aW9fNjRiaXQudHh0CkBAIC0yNSw2
ICsyNSw5IEBAIGdwdV9tZW1fMTAyND0xMDAKICMgZml4ZXMgcnBpICgzQiwgM0IrLCAzQSssIDRC
IGFuZCBaZXJvIFcpIHR0eUFNQTAgc2VyaWFsIGNvbnNvbGUKIGR0b3ZlcmxheT1taW5pdWFydC1i
dAoKKyMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVk
IG9mIGhjaWF0dGFjaC9idGF0dGFjaAorZHRwYXJhbT1rcm5idD1vbgorCiAjIGVuYWJsZSBSVEMK
IGR0cGFyYW09aTJjX3ZjPW9uCiBkdG92ZXJsYXk9aTJjLXJ0YyxwY2Y4NTA2M2EsaTJjX2NzaV9k
c2kKLS0KMi40NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
