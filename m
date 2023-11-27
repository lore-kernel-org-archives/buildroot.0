Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6AEC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 19:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DAE560F34;
	Mon, 27 Nov 2023 19:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DAE560F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wITuOoKXwSul; Mon, 27 Nov 2023 19:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB92760F3F;
	Mon, 27 Nov 2023 19:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB92760F3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174051BF40F
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF7044071B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 19:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF7044071B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5O1uxeOL8Yd for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 19:25:08 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FEBF400CB
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 19:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FEBF400CB
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso32273855e9.3
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 11:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701113106; x=1701717906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bevkTuwlC2HhnPFni03jaFou7WtzNEu4Eht/VwPy5zc=;
 b=wtZOZW0kRp6aP1rGUrhXk3ZIFhxDyP8o6KwXSHDl7ZNlD3hMGMyiEQPgR7tV5/iBN8
 5Od5+hvcJu9tg9BnuHRSnebi24gZBhsNpLjwGYbuh1QbunsN467+CLQjjyrwMrjpPunv
 MUKBE+OdnnQ6JnwoZDqijoo452Sbi4vLd7BN0x8HzsWdTkgJP9sB/fy9IVsglGkGBoFk
 Y2ZqJXLjypQ2D3uHzGaZg+7c88nlQcLSL70F4fDGNQ+YI3KS4n/A+vLix8ub7uKg4AXe
 VHVEeXCCvzBSyJ9TU6UJkNoqDTs7nnJEc7hyi0h9mh7wHeK2BeSmC3G7nud8slddgL6l
 Jrpw==
X-Gm-Message-State: AOJu0YwqaF/31qGA9YFKB1DvyBC/HDuV4iI3v68wp/CosKReV2RMP51p
 GqboWHwfH4cgymSv8JiUCorFe0cZABnBOLAiBkg=
X-Google-Smtp-Source: AGHT+IFtUivbB6m2M5rn+iRMuLrpfQSg3IUmCUtkwVc6sPM97hCHQwSbBRlTEdFjGjV8v9WtYQtVyg==
X-Received: by 2002:a05:600c:1f8c:b0:40b:2bdc:5753 with SMTP id
 je12-20020a05600c1f8c00b0040b2bdc5753mr5988977wmb.27.1701113105795; 
 Mon, 27 Nov 2023 11:25:05 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 p34-20020a05600c1da200b00406408dc788sm15647902wms.44.2023.11.27.11.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:25:05 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 20:24:55 +0100
Message-ID: <20231127192455.2822374-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1701113106; x=1701717906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bevkTuwlC2HhnPFni03jaFou7WtzNEu4Eht/VwPy5zc=;
 b=I0ssHpH6CCwXOsxZvClB2FyXpRK44E74KKcOFehr5fes2a+cH+Y2Ahf1XOWmvhlGFz
 EDc7+mu3dUuGs0Ty2hWL/0W/QHL/u4Ym0ys5rddiQCdJnYj1LFVSWyjsT8ZpiLg13vMN
 GIx2kLEm+ClHdlwyGpRf7NaHcKcFnrJ9iP3SM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=I0ssHpH6
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi_{3_qt5we,
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
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
c2kKLS0KMi40Mi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
