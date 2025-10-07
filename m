Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C20CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 08:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20BEC834DB;
	Tue,  7 Oct 2025 08:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O7s2yy0dZ1j; Tue,  7 Oct 2025 08:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB4E83FFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB4E83FFD;
	Tue,  7 Oct 2025 08:05:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A703226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 08:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C90983FFD
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 08:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF22XLyeBMR1 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 08:05:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7421A834DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7421A834DB
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7421A834DB
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 08:05:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6394b4ff908so9350811a12.3
 for <buildroot@buildroot.org>; Tue, 07 Oct 2025 01:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759824352; x=1760429152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mXz5d6osS71pGvv1MKrjY4PwJ1cbty0r2XQ81yqhlps=;
 b=lCDkoy9kV98w2RB+mEFtEePYAgwOlN0LN1JCdwh7YhTRQSr7agINOe/P9VhEwL1hRe
 LryHi4bBwbrjhY5Ovpsny1PYgjYfmrgGDmfKQxEOT4p7TVD+z1B0f30zheA2A2+Q4Wcx
 5zjhTwNpNlvumm+QhGnW97qLu+vg447bdtljWye50iUWmv3HcCSnR1DVlM887aAeBXJ0
 FlxUJy7L6nzcQ5zPdPk0ASDiq8wrs5sI+PmbnfgYgzr8c0yvqbxUiHEJqnUgY4uymiSS
 lHet6Z2rIyXRf4WHC0hvEZ1aew/6UYFEADcdE0mvLA+f+j0tAyhlj0FhioigNMqmdixv
 Fjvw==
X-Gm-Message-State: AOJu0YwalbMDV9J7LKDOlm/ok3uglA2V0LbKuwIRg8998O3rFoGAJ6XK
 S7iw/C53foqC/zbsOmhgB0Pt+jIhL07D5aS1fRUoqK45EHKZzHnvyZuk3ulDN64shnW1p1pK2N2
 /Kfd0V0Q=
X-Gm-Gg: ASbGncvoGepeu/RLK6UIcOS4KXAX+F6kvPgO7S5yhOinQz3j6pzvGeHYzJAz9ULiTOb
 nMeACQoTHg2aOUl0k5M1grcdr0gO4vm8J7x8SSobKdI4xD0vJEEpOrjKJ7TGeVM5c359OrMAp9t
 xfgSgNxz1d+IEmhsaQATEK3tfp3IS6fBVNgjtIregJ8E039UiDFiVVCmDJmAnUCzTJE+klwyFlV
 b5t+mwSVLOdnejBlE0gAPIfGhr/ZGuh7qOF/pGVwcFIAlI6PAuJr6nnegusI89CHz1RshpdNRD8
 wl1+8er/SNK9nNVWHb6wSu2wo+I40sYjIccovJYxYPXiKVN5jwVhVxKrX6+RpHxGp8G/qvOCsXn
 4PjiR06/d7PEGV5rPxSTKgZANsCk6QEWkE8zBKzAsRbMtm/hwxatJcye+VW+kKtYLsu/2xysTNR
 BJFww5L7zQvIbK6sLEDQP1whqOpk0g8Tpri16k0hFv6iDwaEN5glD3P9b+X5Uk6meunFSBljRnt
 CysPjoYhHKuwQ2D+evz0NZ3GA==
X-Google-Smtp-Source: AGHT+IG84aIwNHJkWd+fNE0DgVhmgu3Hw8XXOl0kNWixxyplJSrbN6y8l7AcTGYE5JEG/KsZiQ6F5Q==
X-Received: by 2002:a05:6402:34c3:b0:62e:e5b3:6388 with SMTP id
 4fb4d7f45d1cf-63939c28081mr17718973a12.19.1759824352050; 
 Tue, 07 Oct 2025 01:05:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881000e8sm11956457a12.32.2025.10.07.01.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 01:05:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  7 Oct 2025 10:05:47 +0200
Message-ID: <20251007080547.2028121-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759824352; x=1760429152;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mXz5d6osS71pGvv1MKrjY4PwJ1cbty0r2XQ81yqhlps=;
 b=ITRAWzGKBLKJ+hcGgnGEo6dUK1xefLWE/xeFWaDW2gapZlg3yOP65FZoMTpLxbQjds
 qnCF1Z9gvcPwQO5M53oe+Z9K9jMKLqiAmUjxjNdsYNQCQPgw0DVIFSB6oZaUFVukC1Lx
 hbUOPKVzZg0CxIiOn7nDPgopJXXOAgGyLhdIo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ITRAWzGK
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release announcement:
https://lists.denx.de/pipermail/u-boot/2025-October/599798.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2025.07...v2025.10

With upstream commit a239b0b0b6db ("Add symlink from gpl-2.0.txt to
a COPYING file"), COPYING is now a symlink to Licenses/gpl-2.0.txt,
causing the install command in UBOOT_COPY_OLD_LICENSE_FILE to fail
because the source and destination refer to the same file. To avoid
this, copy the license file only if Licenses/gpl-2.0.txt does not
already exist.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 boot/uboot/uboot.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9320f942d674..d40e1e95e07a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2025.07"
+	bool "2025.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2025.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2025.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -340,7 +340,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2025.07/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2025.10/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 40c60d60838f..7b71e2d948ca 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c92568a55911..7bd0937df242 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -307,7 +307,7 @@ endif
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-	if [ -f $(@D)/COPYING ]; then \
+	if [ -f $(@D)/COPYING ] && [ ! -f $(@D)/Licenses/gpl-2.0.txt ]; then \
 		$(INSTALL) -m 0644 -D $(@D)/COPYING $(@D)/Licenses/gpl-2.0.txt; \
 	fi
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
