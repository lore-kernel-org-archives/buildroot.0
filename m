Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0919BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 13:03:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5051D60E9B
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 13:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5051D60E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D072E6064D;
	Sat, 16 Oct 2021 13:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRRwFhuTdKdz; Sat, 16 Oct 2021 13:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3014960669;
	Sat, 16 Oct 2021 13:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F022C1BF85D
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 13:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D642183A8E
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 13:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfkNMisj15Wm for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 13:02:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D265182D14
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 13:02:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e3so31120533wrc.11
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BI2ygd3xmmvBuOMUvJiMzlQhkPxg/s3AlcxCPEca04A=;
 b=lS8nlT0sN4jNCV/OLRskDl8gyLh6cukGaIp6vDToZHqNG4Kg1EPJs5UONSZjsOCAyh
 rftqhihn+0++qLoDEmHkGAwhZaAYZzUX326iGQ+FNeRCQZfF7FR2Sbng0UWdcbkXzir9
 vTnkctiyNnfD1/IafDRpFz0t9L/adCTdTw0z9GcfIxhnpKDmDVKeT04q0BWzV/zq6EfU
 hYkXAiuqHK6cnN49YPLjYxBxApWzfQBxF7dqKHpqQLcgSxI0VELdX+d/FZTOQur02fX9
 YjEvlRKGX68G7t/HKfqUD8FPgBgdbfrh/4k/dcfSo8F00WVDOrEBKUAh+Nfm7sMjvKc6
 tfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BI2ygd3xmmvBuOMUvJiMzlQhkPxg/s3AlcxCPEca04A=;
 b=FdXsok119ggrZ/ywaI5uBMZGBdwOWsBhCXWfDRdvxbDXAXaaNcJfJNJOs6qPdrfP88
 WAwrsaeWULexP+8saugT/ht3fW0SJoI9Za8CSurfebUicwm4yTMPLn9Ep2uyPspfeGtU
 KxICCIqZob/HFV2VUW6HpUZ78gPTygXN1BQkfntFRF/YuqdLPaVVy7nFo74wZFgEJFYP
 b4Ck0hvu8ldqRnzXdZK1TlAhVB2vPgj45Pjgg8JAb/IGL3ityz0Fg/AFp793eKWd1+Tk
 BWcYkukoiN1IwSOH8g34Gf87hN0uTvyM5DWSWqTRAr6kGRbII/IWhP4msaJIgAd7+w/u
 OWrA==
X-Gm-Message-State: AOAM5306t9RHXXYx0as8aouXJ/x4PoDCunVwKyaOE2/7YyxepXh3UHoz
 1eDC+HYu3bTDdlVSX5iny/M39bGuTDw=
X-Google-Smtp-Source: ABdhPJyrrdN0QKY8VLcBYcPjQy+WvpsNSiLqhpWjmYrgiZihP8Cyoep6q4bTidSol9RZxd/CLAhzJA==
X-Received: by 2002:adf:a118:: with SMTP id o24mr21525490wro.15.1634389374863; 
 Sat, 16 Oct 2021 06:02:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id p7sm6448628wrm.61.2021.10.16.06.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 06:02:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 15:00:29 +0200
Message-Id: <20211016130029.2855627-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuio: bump to
 6ef3d8d096a641686bfdd112035aa04aa16fe81a
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
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuio/0002-fix-build-with-musl.patch | 57 -------------------
 package/libuio/libuio.hash                    |  2 +-
 package/libuio/libuio.mk                      |  3 +-
 3 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 package/libuio/0002-fix-build-with-musl.patch

diff --git a/package/libuio/0002-fix-build-with-musl.patch b/package/libuio/0002-fix-build-with-musl.patch
deleted file mode 100644
index 6e5b168c14..0000000000
--- a/package/libuio/0002-fix-build-with-musl.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c378ee112857128002754c616acb6841ee32aaf6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 2 Jul 2016 10:52:28 +0200
-Subject: [PATCH] fix build with musl
-
-limits.h header is missing in attr.c, base.c and helper.c to provide
-PATH_MAX.
-
-Fixes:
-http://autobuild.buildroot.net/results/702/7023104e6018ea46c54073ddbe5119d0f66ae5a3
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- attr.c   | 1 +
- base.c   | 1 +
- helper.c | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/attr.c b/attr.c
-index 4245140..7512f4e 100644
---- a/attr.c
-+++ b/attr.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/base.c b/base.c
-index 14ebcee..4ce7301 100644
---- a/base.c
-+++ b/base.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/helper.c b/helper.c
-index 170f084..1fb0b4c 100644
---- a/helper.c
-+++ b/helper.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <regex.h>
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.5.5
-
diff --git a/package/libuio/libuio.hash b/package/libuio/libuio.hash
index 54fb02b112..48904a94ce 100644
--- a/package/libuio/libuio.hash
+++ b/package/libuio/libuio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1494375bd493ef1a1b868ce2cbc7d29f3f9f692c21f70689eae28566e56f2c15  libuio-ca28ff0f69d89a789a47552c72db5a43d280710b.tar.gz
+sha256  cb6d2ed1c6c7fd8e0e4a9cb1d81bd88f3af37bd239fdf8966b3cb3671ff6db86  libuio-6ef3d8d096a641686bfdd112035aa04aa16fe81a.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index b6e8e7e774..a0285277ab 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# v0.2.8
-LIBUIO_VERSION = ca28ff0f69d89a789a47552c72db5a43d280710b
+LIBUIO_VERSION = 6ef3d8d096a641686bfdd112035aa04aa16fe81a
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
