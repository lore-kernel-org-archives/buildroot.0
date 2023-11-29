Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD7EC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 11:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B2FF419FB;
	Wed, 29 Nov 2023 11:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B2FF419FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBYok2zefi4D; Wed, 29 Nov 2023 11:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9094341A00;
	Wed, 29 Nov 2023 11:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9094341A00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 249341BF369
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 11:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A93860AE8
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 11:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93860AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsHwj9qB9iNn for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 11:03:08 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6230613C8
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 11:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6230613C8
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6cda22140f2so1770663b3a.1
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 03:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701255786; x=1701860586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZMYxmWTvNWaE3NFryAEDCSy0k1S2v1CSdIgw/MsbwE=;
 b=WGhKrXRRsJU3Ftq62DQQYbJh2WB8gGMdfkBQfGBWGMvFC8UzZSxNQmcYgMEKefbpPy
 GSiX+cmLLaGgcQcSIrmoP++tXtkLHOIuY3ngZNk7sED78m/ozHfGxxzDJGV/EuhdXLRu
 w/KV9a2bKsJzaDe+S7pHwNAy1oErdZcl++5Jx+oX/25rt3qaujf0qvpiIOUCqLUeCVdO
 VxEgTEk2UAeconszM2l37DJnDqZWN13Wa5Sl1+Pwq1ZogHINpK/RzKm9zRb/GNGF0KJv
 y7K0ylxz13l+JTsVGzU1sX6mw65qJ7cvLlvas5+x+qZZe05Q/Ahmux1syA1ekcJGAJHn
 i5nQ==
X-Gm-Message-State: AOJu0YwzhMariIsjZi/j9enk43nNpYMa0Qy6H4jGJSDR8bqzVMQT9U9Z
 sBs1jcfF3AstYEmxY/Bt4m9a3n6T04wtSi1ALJKdVw==
X-Google-Smtp-Source: AGHT+IEkiJGlE8ZS24v3Si0PdCkrbxPPB5OnbL+GDXk4WLAmO1X+DxsOGUHN4hDFZFMnu04BN0FVZw==
X-Received: by 2002:a05:6a00:2d86:b0:6cd:daa5:138f with SMTP id
 fb6-20020a056a002d8600b006cddaa5138fmr447318pfb.0.1701255785973; 
 Wed, 29 Nov 2023 03:03:05 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056a0010c300b006cdd5dfc11asm810213pfu.166.2023.11.29.03.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 03:03:05 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 08:02:57 -0300
Message-ID: <20231129110258.3708-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1701255786; x=1701860586;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZMYxmWTvNWaE3NFryAEDCSy0k1S2v1CSdIgw/MsbwE=;
 b=fYNLBXx9nXmEvF81PR7hxEgAoH+EwD2k7DloQLe1n9PiSfNO0lytwTcvoiR7TntDaD
 WhDToX6DLkmJLO+sgB7Wp1s70JytfyyjWYasX6qWv9PxyE9sEBYGBt4E/dPgCIwimdGX
 FpRRSle1QMg9I3zONAUPz8Y1qnPFxG1xas0rK2x891X9cg8DfqpTkju2RvHuJxQU4V8k
 0FO/wAZ27psHzfHpWJL5C7u25hJrl67dFYTr4fxuo4qx/UWoiFfE8mkZbXOjqJLrj6eC
 HKOhYnmjbn5r1MoSohCftWmxm4TC5haqZy0U7U6QMHfEcChXBjWGXCCMx2TFD+9+bXx0
 cgDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fYNLBXx9
Subject: [Buildroot] [PATCH 1/2] package/rsyslog: bump version to 8.2310.0
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2Uv
cnN5c2xvZy9yc3lzbG9nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xv
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCA0MDQ5NTkwYmI4Li45
MGRmM2UwNTRmIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICBhNmQ3MzFlNDZhZDNkNjRmNmFkNGIxOWJiZjFiZjU2Y2E0NzYwYTQ0YTI0YmI5NjgyMzE4OWRj
MmU3MWY3MDI4ICByc3lzbG9nLTguMjIwNC4xLnRhci5negorc2hhMjU2ICAyMGQ5Y2U3OTJiZjBh
N2VkMDcwM2RiZjA5NDE0OTBmOGJlNjU1ZjQ4YjU1YjRiZWJkYzA4MjdiYmIwZGRiZjExICByc3lz
bG9nLTguMjMxMC4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDg0ZmQyZDJlNWUuLmNmOWYyYzBlNzkgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yMjA0LjEKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjMxMC4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
