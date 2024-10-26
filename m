Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2060BD10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE9240169;
	Sat, 26 Oct 2024 21:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6a6CsQ3cZV3; Sat, 26 Oct 2024 21:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6FCD4016B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6FCD4016B;
	Sat, 26 Oct 2024 21:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 011FB5C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6556605A7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCCElyT5XW_Q for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DEBC60597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DEBC60597
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DEBC60597
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:31:15 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a3aeb19ea2so11834545ab.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729978274; x=1730583074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YwWY42iRsF2WP66lY0Rz3qyzVzAoa1yQrvAKhNQkkso=;
 b=UUS6ZjhMI+Eqmcx/IFgWuUB7bOj91RKbKb30PPnTJ7HyM+97m3zroctAG9lytnM+t1
 28DTFOFWeFEL+ZwViMhBhdCoRrO733O+a0ERjUGCxmWi8mcoB3IX8z4QY5y6lKuHuk/o
 FJRfaRBvjzU1Op4JUgsgp82yWotdgTnS/xkR8a1Va61leDotU4QB4yjOAe/U7lfIGo3E
 U9ETtGW66I/QCVklNdPep66OXG5BnLZtf/9+/TJVgy8/iLYFwAksoZGzcPEnlmd52P7v
 49y8oCemJKCql0JIhOYXDFWfPD8Rca6hk0smveYkIAXvTBkuzWYtTOyZ1TFsC9ui035c
 Whaw==
X-Gm-Message-State: AOJu0YzNA3Phimf4Swko4vvr6nHYwmgEl82wOcJkOPiRlI52HMZma/nh
 95VoUELr5cD/E/9/z3rWsFG+xL0nMAoerPE2uZIodtSk6CwWEwGHBASqSg==
X-Google-Smtp-Source: AGHT+IHCS1cXlLY/E9E1bUYa6OJklMzLpqkWOnKZxjCOiLzTr2ouYBi09EX4kiD2Ca0gOem/aB//1w==
X-Received: by 2002:a05:6e02:1a44:b0:3a4:ec57:d7b3 with SMTP id
 e9e14a558f8ab-3a4ed294445mr29532795ab.12.1729978274099; 
 Sat, 26 Oct 2024 14:31:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6c2eac5sm8774095ab.0.2024.10.26.14.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 14:31:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:31:11 -0600
Message-Id: <20241026213111.3732338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729978274; x=1730583074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YwWY42iRsF2WP66lY0Rz3qyzVzAoa1yQrvAKhNQkkso=;
 b=J0ThJOqesQyhkF18SAm+IKUHTXYzWuGfz9Ej6MzFzo1Ts+JqOoIybModW3jGylJ95o
 0hy6x/3vJjJJlR2HQvWR+5CjEfewqNj3P+I/ikbLhvHu0/fMwJugJy3JR0yOGy1tfwck
 r+ImU7+nBWA2lze+7GEPVA+9RxksrPKXoe8GRtzWZT9jYBoUz1Qa5klccJ2PMUjty0Bc
 QuuHga2LeonwSJz/hUOrWM/9eE5qFtAAeY6b8MXr9VEFMMhMJZBsL9O55Z5iglhH9Jb4
 aozHaBQhkFx7ZCJFaH4XrkfJ2RFbLsopf45EA0xDmhCJoCZlt7++OjCpdvwYovJ+Oksp
 BEEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J0ThJOqe
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.24.3
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index b6fea9a4b9..4234fc0501 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  32ff588b9ae1f26d652b6fdd07ec7066  dbus_fast-2.12.1.tar.gz
-sha256  e91a7d43efbd9e0bcef755a53526afba506a74a0d43e0818c1e9b4d6b1396945  dbus_fast-2.12.1.tar.gz
+md5  3d7ef3e3ae2691d45dcf3d07511eca4f  dbus_fast-2.24.3.tar.gz
+sha256  9042a1b565ecac4f8e04df79376de1d1d31e4c82eddb6e71e8b8d82d0c94dd3d  dbus_fast-2.24.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 4703009cd9..359a69784a 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.12.1
+PYTHON_DBUS_FAST_VERSION = 2.24.3
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/1d/5f/f0757ce529d353739970ebc4a2d9b083b2dcbe0f737fc98706e36f4a0f96
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/0a/37/a27e7f2dc6a18b5dcee70ffb08013a33770c2154a51fb5e2c04a7f4169fa
 PYTHON_DBUS_FAST_SETUP_TYPE = pep517
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
