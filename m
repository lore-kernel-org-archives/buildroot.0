Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A399E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E781760A73;
	Sat, 11 Jan 2025 18:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zl1ykQ_1KEG; Sat, 11 Jan 2025 18:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE8B66119A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8B66119A;
	Sat, 11 Jan 2025 18:23:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08488940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E436B41296
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u92nwZBCy9Ut for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C26F441291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26F441291
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C26F441291
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:23:01 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a9cb8460f7so20404085ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736619780; x=1737224580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnvweUHL6e6TvyYQWs11Q6+9zEweiIw9G5FZGQTwqhQ=;
 b=R+N/Kik4vcigqfdDJoDaCz0XBKXzmqUwB8ZHj4VrmN6uZnsbcIZY1vW9rL2CCu5Pcm
 TgFGiVe1fKxAo7Kx+sTnv6BWZwoFtPtDQFTrK7WMARzTIJL06b5pl78ZfGSOoD7nF8M1
 /d9e1cBv+ksK45EEdGKB+lSaJxK3Uxp3FWpmXZCcWAqIqH1hUc2rlKr7HSKi9AYUbDhX
 rBGgipVybYTGtsszn/Br1kAtExwZlIrr8yzv7WaLtgg5+XTSnFbtY4om3NFdHq7JI/Li
 eGp5BWPh6RNUz9e6BU5QbHQJFhq9D1K4qZ0vQIHOZh3n4QX5VVE5Ol8fkzqv7KIoqbdS
 nMAw==
X-Gm-Message-State: AOJu0YyQrvoFBOPQq6HanraB9luiEDkeS4PC5N+MMOQ41hkZVNRWqUKp
 fxZIDtN1uKreXZndNVgOVCCIwuPVG/WoHbEBlFtobsjw4Uw/FPWUxlhay2Ms5uI=
X-Gm-Gg: ASbGncu9pg0yjkvK4XuEKrdCqGqie1xOq8fPJub8zEV7SJWHy81Wg9QDKvXi3YgTtMw
 PCQZ3pYf4bGo2ntVerLakbJRcCjz2Nr9Xxo+DIeRI1XGaltRfz+FPeBGOH28qAfNHEkiuc9no/p
 lc4+JvuB2UjjKI28CWatNTEysFS9PoxkLSSTjQfxPgFxrqnCsgBnzrIRgZ/fGrAVmSy0CnWzWKD
 6Th0mKBhjW86fsy0s78+VT2zPKWl+z8LQXurML9XqS1FHs1baV/7glboRcmKabj1PYJBAVpMEFL
 diutJjny/s56eS0G1O2rGICgVa8ShUc=
X-Google-Smtp-Source: AGHT+IH2t96uLedDVfFtvFOcIpAsHwqKerxJjLsvTyOKf5QKWYVA16mTpyM3F401DmZ5wm7zjbxJtQ==
X-Received: by 2002:a05:6e02:1a47:b0:3ce:6828:8955 with SMTP id
 e9e14a558f8ab-3ce68288f5bmr12752645ab.5.1736619780359; 
 Sat, 11 Jan 2025 10:23:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717d4esm1643750173.98.2025.01.11.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:22:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:22:58 -0700
Message-Id: <20250111182258.2930651-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736619780; x=1737224580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fnvweUHL6e6TvyYQWs11Q6+9zEweiIw9G5FZGQTwqhQ=;
 b=jEuFeYJlgG0b08n+6SLpqAl3VQO6/BUrgDWBFxEzQFszKabc2tdVnfgT1/GyznX+Y4
 3d0tTIRVI+AjLct2g99KFHtBK02B65ko2hFukv93qr0G8AyQuqU+UbhMarFi8UoIOTIG
 Ej/fMKEuYRSl5Sv0ZgHrf+QZQ/eijbZj0IWWYwm5jwznm3gf61PEmiWvlvXoPHkXJJ6y
 8WzpXjH1G7To9n8r8MFFBgXCxfr9zMMFkR/eqaI8S3cUvgPMY89uzf2DYBOMVS8Ls4Aa
 tLN0sVYkOWt+aYV6k8Ghb+bOtJ5FmAyzkTpzdNfzR3Z7c5hSuTwO9zeYE/pAjR75p9K+
 Xsnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jEuFeYJl
Subject: [Buildroot] [PATCH 1/1] package/python-tomli: bump to version 2.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 8ee4939af0..ec30f06db2 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  e65b234adc4513d94792c69bb025b622  tomli-2.0.2.tar.gz
-sha256  d46d457a85337051c36524bc5349dd91b1877838e2979ac5ced3e710ed8a60ed  tomli-2.0.2.tar.gz
+md5  1e0e2fb2e29f3d77f0507bee71fb4ab4  tomli-2.2.1.tar.gz
+sha256  cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff  tomli-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index 3c3d4dc182..c23ae94758 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.0.2
+PYTHON_TOMLI_VERSION = 2.2.1
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/35/b9/de2a5c0144d7d75a57ff355c0c24054f965b2dc3036456ae03a51ea6264b
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/18/87/302344fed471e44a87289cf4967697d07e532f2421fdaf868a303cbae4ff
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
