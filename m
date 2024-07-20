Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332EBC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D09C74064B;
	Sat, 20 Jul 2024 21:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yp2GL5Enk-Dh; Sat, 20 Jul 2024 21:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A08C4063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A08C4063C;
	Sat, 20 Jul 2024 21:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E61941BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0E28605E3
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrkXskOKvdAJ for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F5D6605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F5D6605E0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F5D6605E0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:18:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so14627245e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 14:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721510324; x=1722115124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VnDe6NrD6Mt3Kc6zzMS9DOwdLELIJglhUKBiTYkP+LI=;
 b=YySv43Xwp29XZG9GC7fV0fhrcWWeSM2HkAEqHB0U0qkclqWulrHuRetAZCQ/gCiMvD
 uIYxL/b6GVQo+KrkV21nwQUD3VsCovIibGMU9InMAafbMhCToUgWgsFa7FB1le+4jhnE
 Yi0ftutxlzr/Z70OtFH0LWlAyb1/agMxeb/lrT4hg6y3pC+PcCS3mZQr8fBPM1HRgrSA
 sFzNLkivzZ4Djs6u0uh/XOBymVslNnHZcI0QD+wKPd3XHMIssQBZR7BZO1fAGE2Q72/k
 zuZDeZOtmu21356PzTP40YEhVT5Pizie4+90Hb5Xiq1ncS2VklK5iQPJAtwXIKtVTNn3
 LVnA==
X-Gm-Message-State: AOJu0Ywl/WbRmtqT7uTTd2uUAEXphom7e6idcNi6MEpjT8+1HNbGYrZm
 QumarMgYXjDu+8MsC7EvouTF4QkcYTRRx4xtG99eADu6iiTO6OGBwk3ccw==
X-Google-Smtp-Source: AGHT+IGq9dJe/0l8mYhoTTZ0qDNtz2at0DcBsuC+cjd4L2+/I9YQDjZbE1+snnq81DkBWNPxQg+++w==
X-Received: by 2002:a05:600c:5128:b0:427:abfd:4432 with SMTP id
 5b1f17b1804b1-427d2ac009dmr53954755e9.12.1721510323812; 
 Sat, 20 Jul 2024 14:18:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6937fc7sm68665675e9.46.2024.07.20.14.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 14:18:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:18:41 +0200
Message-ID: <20240720211841.1728725-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721510324; x=1722115124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VnDe6NrD6Mt3Kc6zzMS9DOwdLELIJglhUKBiTYkP+LI=;
 b=hz2ItW6nnfidblcbfBghKZgBoP1Mln9pGs5srzIc8i1PT0D1OeR31jpwcyXzf657JF
 IgpRCKG0wM7vts/EHHGtstsfZLG5qBYKh2Rn+NT0EtZahAKa8Lmyzkmf6iDD0ZWYYc3t
 w90Qqxi5cNrPydPHGA/wPo5LL+nMNxGLuW8JCgx2h/16btnngpvfOpSCUc1W76iF7zzN
 IvHwXTApj+Aay8z3qiBzkOfSnYgCg9kheZUdw3FgCOgNRCByHzkKIUbGFfQwBwKo9O33
 zJ1XPFhxQQZt5riie1cxie2xHbPU9TZv83wBGngfJg8V4qRq0yWQK0fMesW65g0RUhyT
 oZvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hz2ItW6n
Subject: [Buildroot] [PATCH 1/1] package/flashrom: bump to version 1.4.0-rc2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- This bump will fix the following static build failure raised
  since switch to meson-package in commit
  37dded43ae681e8319d7b76f9a612c71991467a9 thanks to
  https://github.com/flashrom/flashrom/commit/67ca4a71c477320d4b726acd152b7536344e227f
  (which doesn't apply cleanly above version 1.3.0):

  ld (ld-elf2flt): -shared used without passing a shared library ID

- With above patch, classic_cli can't be built without a static library
  (i.e. with BR2_SHARED_LIBS)

Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
 - http://autobuild.buildroot.org/results/ee61dc30056b6c3335d64054c875bfb40526033d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...et_enable.c-Drop-_LARGEFILE64_SOURCE.patch | 38 -------------------
 package/flashrom/flashrom.hash                |  5 +--
 package/flashrom/flashrom.mk                  | 12 ++++--
 3 files changed, 10 insertions(+), 45 deletions(-)
 delete mode 100644 package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch

diff --git a/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch b/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch
deleted file mode 100644
index 1ee8d0f7e3..0000000000
--- a/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 59287a0bd0e4d58a4d2b434bde3db9b2376ac7c1 Mon Sep 17 00:00:00 2001
-From: Angel Pons <th3fanbus@gmail.com>
-Date: Tue, 16 May 2023 11:13:17 +0200
-Subject: [PATCH] chipset_enable.c: Drop `_LARGEFILE64_SOURCE`
-
-This file does not access any large files, so there's no need to define
-this feature test macro.
-
-Change-Id: I866cfa2f996eeea5846e5d9189647ad7a4a4e3e4
-Signed-off-by: Angel Pons <th3fanbus@gmail.com>
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/75271
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: Nico Huber <nico.h@gmx.de>
-Reviewed-by: Anastasia Klimchuk <aklm@chromium.org>
-Reviewed-by: Alexander Goncharov <chat@joursoir.net>
-
-Upstream: https://github.com/flashrom/flashrom/commit/59287a0bd0e4d58a4d2b434bde3db9b2376ac7c1
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- chipset_enable.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/chipset_enable.c b/chipset_enable.c
-index 9d3df5f8..3846ecfb 100644
---- a/chipset_enable.c
-+++ b/chipset_enable.c
-@@ -24,8 +24,6 @@
-  * Contains the chipset specific flash enables.
-  */
- 
--#define _LARGEFILE64_SOURCE
--
- #include <stdbool.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.34.1
-
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index d3bfbad781..cecec5273f 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,3 @@
-# Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.3.0.tar.bz2.asc
-sha256  a053234453ccd012e79f3443bdcc61625cf97b7fd7cb4cdd8bfbffbe8b149623  flashrom-v1.3.0.tar.bz2
+# Locally computed
+sha256  318c54a4143a1a05b30cecd64fbff41a0f5cd35a020622864c11fb44f8ed04d4  flashrom-1.4.0-rc2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 478b53e1ac..1e7d332dae 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.3.0
-FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
-FLASHROM_SITE = https://download.flashrom.org/releases
+FLASHROM_VERSION = 1.4.0-rc2
+FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
-	-Dclassic_cli=enabled \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
@@ -80,4 +78,10 @@ endif
 
 FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
+ifeq ($(BR2_SHARED_LIBS),)
+FLASHROM_CONF_OPTS += -Dclassic_cli=enabled
+else
+FLASHROM_CONF_OPTS += -Dclassic_cli=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
