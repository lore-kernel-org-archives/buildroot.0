Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352AC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 10:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB1D40632;
	Tue, 27 Sep 2022 10:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB1D40632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlRVtAzCWfPp; Tue, 27 Sep 2022 10:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 606B141719;
	Tue, 27 Sep 2022 10:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 606B141719
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 273B11BF297
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 10:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0082B40632
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 10:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0082B40632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWkNhdn7tLVW for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 10:58:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C834056A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88C834056A
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 10:58:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 u16-20020a05600c211000b003b5152ebf09so6633420wml.5
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 03:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/CbFLxsbO7SgKbItpPOZogQpk/8KSa1YiU9QQthaDOA=;
 b=5c5bLre3bmJgIqZQfUrdgm7qPk6ZoHDbl5CAoN/hFeAQpJ75Wil8lXqW+d8uIyCmi6
 s3YnuGnmkkKUB7WH4jYVPFIS1ji05ML09Mllrk2pzxvgG4Ohgs+j1c/XmcZpKm9qgULe
 VOfSb0cq9bFVOwwTtwWrhe7e5E/9NDKbWqKUhf9u0ci8/SjXJ6J9zCcHpFhG8y+3gAnx
 B9I6iFNKiHR00F7Th2ezcoa5k5Yx+jtrmVB2wUo+Y8tmqMX0hEt0t/DYOVW1s14ro6St
 RjPlbR2cE/tVqqGdID+ujen0pygtcmw69OZ+a9SVRcyF6J5o09s9z4GK3i4Q4bQfEhrd
 U4jQ==
X-Gm-Message-State: ACrzQf1k7iJ4qRsefsmKNONbv2u0+DeudpHtcIQWb+TMo28AvX5+MCYO
 TUTtt3Bw+aEL5J+mizQBnXELFCVIQsHDPw==
X-Google-Smtp-Source: AMsMyM7xZL1nCSbOIH18G4wHAe5U5cf8XRBI74ZbjfCVCROsDPxV/rwgczc+s/DrHzfJfA1+3dYE8g==
X-Received: by 2002:a05:600c:1e87:b0:3b5:1e2:3c3c with SMTP id
 be7-20020a05600c1e8700b003b501e23c3cmr2160812wmb.130.1664276319748; 
 Tue, 27 Sep 2022 03:58:39 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003a6125562e1sm1272597wms.46.2022.09.27.03.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:58:39 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 12:58:35 +0200
Message-Id: <20220927105835.760768-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/CbFLxsbO7SgKbItpPOZogQpk/8KSa1YiU9QQthaDOA=;
 b=eJuli0NGXlrXVUOxiBCuIS/9K3szCo1To59HUW53n2wkfslhDMCs786nqKt1hf9pQC
 XrUmPbAsQlC8joBm9I6qRpQRdYBXGNlxek11OlxZisHTYo6uG2NJ6HqO/rqsyydoji8j
 +rDCKyMxzwIgC4g/UtYjwPu5mof8mb0NlZsR0RRqsxMd/Fz1U2nzsgHc3+ZqTpunZnAM
 C74UVEuX5MA4A6f4z8toWXV6K46DvcRhIck/EWI8uYyo0AAix2Om1aOB2keEhSE/5l6O
 17hkSmx+xVKYwl8O28GJcpNzxq7xWozO9vU93Fawg3k9hAJXKf3uR84gNqQomH83mJ7H
 NNcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eJuli0NG
Subject: [Buildroot] [PATCH] package/efibootmgr: bump to version 18
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches which are already applied upstream.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 .../0001-Allow-build-with-uClibc.patch        | 40 -------------------
 .../efibootmgr/0002-remove-extra-decl.patch   | 28 -------------
 package/efibootmgr/efibootmgr.hash            |  2 +-
 package/efibootmgr/efibootmgr.mk              |  2 +-
 4 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 package/efibootmgr/0001-Allow-build-with-uClibc.patch
 delete mode 100644 package/efibootmgr/0002-remove-extra-decl.patch

diff --git a/package/efibootmgr/0001-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
deleted file mode 100644
index fd29233dc3..0000000000
--- a/package/efibootmgr/0001-Allow-build-with-uClibc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From bbfcc60497c326576bb23cb01d90115ef3cf6947 Mon Sep 17 00:00:00 2001
-From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-Date: Fri, 25 Nov 2016 20:26:52 +0200
-Subject: [PATCH] Remove unneeded <uchar.h> include
-
-This fixes the build with uClibc.
-
-Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
----
- src/efibootdump.c | 1 -
- src/eficonman.c   | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/src/efibootdump.c b/src/efibootdump.c
-index 6ff8360..7c5a1c5 100644
---- a/src/efibootdump.c
-+++ b/src/efibootdump.c
-@@ -19,7 +19,6 @@
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <uchar.h>
- #include <unistd.h>
- 
- #include "error.h"
-diff --git a/src/eficonman.c b/src/eficonman.c
-index 2c2be38..9bfae79 100644
---- a/src/eficonman.c
-+++ b/src/eficonman.c
-@@ -17,7 +17,6 @@
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <uchar.h>
- #include <unistd.h>
- 
- #define  _(String) gettext (String)
--- 
-2.10.2
-
diff --git a/package/efibootmgr/0002-remove-extra-decl.patch b/package/efibootmgr/0002-remove-extra-decl.patch
deleted file mode 100644
index f838d50a20..0000000000
--- a/package/efibootmgr/0002-remove-extra-decl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Wed, 13 Jun 2018 09:41:01 -0400
-Subject: [PATCH] remove extra decl
-
-Downloaded from upstream commit
-https://github.com/rhboot/efibootmgr/commit/99b578501643377e0b1994b2a068b790d189d5ad
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/efibootmgr.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index de38f01..4e1a680 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
- 					       "invalid numeric value %s\n",
- 					       optarg);
- 			}
--                        /* XXX efivar-36 accidentally doesn't have a public
--                         * header for this */
--			extern int efi_set_verbose(int verbosity, FILE *errlog);
- 			efi_set_verbose(opts.verbose - 2, stderr);
- 			break;
- 		case 'V':
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index fdbc9a2732..71a9826331 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  22a95ebe0d5c9fb2915b3a100450f8f37484d1dbb8b296f55b343cc84f10397d  efibootmgr-17.tar.gz
+sha256  442867d12f8525034a404fc8af3036dba8e1fc970998af2486c3b940dfad0874  efibootmgr-18.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 7e09b5f659..672a93c282 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = 17
+EFIBOOTMGR_VERSION = 18
 EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
