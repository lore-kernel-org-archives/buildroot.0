Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66265C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 17:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10825605F0;
	Sun, 21 Jul 2024 17:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjJjzRZPeFcI; Sun, 21 Jul 2024 17:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA52D60602
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA52D60602;
	Sun, 21 Jul 2024 17:28:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 913151BF2C3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F402811A7
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-_M_2u-Ysve for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 17:28:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AF0C810B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF0C810B3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AF0C810B3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 17:28:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3687fd09251so1308614f8f.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 10:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721582928; x=1722187728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p/dnbbYT/5jCiyUopvd2LnGNWUaaFzE4h369cXATBeQ=;
 b=FcCelZH9DlErAoyKHmFIzRVY0E0u6HtdyownT4VKBYEBd47jDTagcVkyZNg2bda6MU
 l6E/RbEbkE93iIt6S0iAbTg8Ws2asyC9GmzLJzAMT/Lh7hqSwEfwhqvG3NSbJ8XvzD0h
 JpcHwMETKHELSZi97GN8nWsWqGa1vo/zphte6Z5u60NA/z6tePvPGAkGGUOy48U4Hogi
 Et0/4eQodlwhVTXcrB/lT02L0wDUKcm3AsyRhVE+9fX71vy2cyELY1dI9qW0EpRgUamc
 pjxS5fWJ1IPN3xuO2moHWuqqdYQ8jCnIOTcS1cdZpxLSCttyL3P01ggW9YqkHssSd741
 gltg==
X-Gm-Message-State: AOJu0YztnO+pZwsxHH3YmqcAU5R55GdgQhFEGmf9shbwZrqEi3+gEvc+
 mG5h06YncNazAqGUSE51kJm2T3/EYC56OgD++YGOB/c22KjbkZLBdY8CNw==
X-Google-Smtp-Source: AGHT+IHYtydsu50tVW1ljgGgLcITGTRBlQBEMKalM9mOrWPunzt5rxiyDd2R/biS9An932xHW933Lg==
X-Received: by 2002:a5d:5f8d:0:b0:368:78ed:994c with SMTP id
 ffacd0b85a97d-369bae4e008mr3282866f8f.17.1721582928515; 
 Sun, 21 Jul 2024 10:28:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786848basm6436379f8f.15.2024.07.21.10.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 10:28:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 19:28:43 +0200
Message-ID: <20240721172843.2342941-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721582928; x=1722187728; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p/dnbbYT/5jCiyUopvd2LnGNWUaaFzE4h369cXATBeQ=;
 b=SpIlJtCP8uSGDznn3Se/jiLqweW3LIBrAptlnmmtCwlZlnLCjjaIpY1KvjJ56Y0B4E
 puNdViTxgDBD8lEy+TetWvOXVsb7wYMjMM/45CKsxIA3GZtlCYtaen2d1Lk44AcrqHgF
 5bTz9oXK2E1JrlZ6uogl9ZGVZo0R+SIsb8MXFgNMAeeZPPnhUuj+RXtLzxLCFF6wSnZ5
 r5pAp3xu1JIp7CY0Vf+QPyCjZ0Oq5pvO/eK/NGjH7byYtuC5iuXwvg0TtJgUnuks240g
 LrfoZ2aqMDBzScUjWNaXF+M6PcWFtlXj9IMjrFLN/me/jp3OI1jCQlTVVCc2vli2ANwW
 uH4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SpIlJtCP
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: bump to latest git
 commit
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc >= 14 thanks to
https://github.com/nfc-tools/libfreefare/commit/494233d33b3a9d21da1bb0f1c59606820afe4691

mifare_desfire_crypto.c: In function 'cmac':
mifare_desfire_crypto.c:139:23: error: implicit declaration of function 'malloc' [-Wimplicit-function-declaration]
  139 |     uint8_t *buffer = malloc (padded_data_length (len, kbs));
      |                       ^~~~~~
mifare_desfire_crypto.c:69:1: note: include '<stdlib.h>' or provide a declaration of 'malloc'
   68 | #include "freefare_internal.h"
  +++ |+#include <stdlib.h>
   69 |

Fixes:
 - http://autobuild.buildroot.org/results/778be216f62b8c2e05aba1b3e297dab0c6c6ccd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfreefare/libfreefare.hash | 4 ++--
 package/libfreefare/libfreefare.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
index 9115518a3f..6ef30513d1 100644
--- a/package/libfreefare/libfreefare.hash
+++ b/package/libfreefare/libfreefare.hash
@@ -1,5 +1,5 @@
-# From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
-sha256  bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
+# Locally computed
+sha256  48db20cccdf3435a9f205bcbb67dbd4eec055991d21840fb419874efd9ce9df8  libfreefare-c2b0cfa4b9fb0e4be88604f00b7a2405618d5abc.tar.gz
 
 # Hash for license file:
 sha256  be6209dfd763a0ba77fbe990cfd2512804441d8b5f0cad927baa3341b50fcade  COPYING
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 16f15b34e4..7065c441dc 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBFREEFARE_VERSION = 0.4.0
-LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
-# Do not use the github helper here, the generated tarball is *NOT*
-# the same as the one uploaded by upstream for the release.
-LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
+LIBFREEFARE_VERSION = c2b0cfa4b9fb0e4be88604f00b7a2405618d5abc
+LIBFREEFARE_SITE = $(call github,nfc-tools,libfreefare,$(LIBFREEFARE_VERSION))
 LIBFREEFARE_DEPENDENCIES = host-pkgconf libnfc openssl
 LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
+# From git
+LIBFREEFARE_AUTORECONF = YES
 LIBFREEFARE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
