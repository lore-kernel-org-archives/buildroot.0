Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1933DC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 14:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A18EB41730;
	Tue,  4 Oct 2022 14:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A18EB41730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id md4PUWqXMcbC; Tue,  4 Oct 2022 14:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DCC41733;
	Tue,  4 Oct 2022 14:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48DCC41733
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE711BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 14:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA74F40462
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 14:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA74F40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnGvFx8BeL71 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 14:40:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E8F4027F
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76E8F4027F
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 14:40:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s30so15428331eds.1
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1RODfkvfC+yAWUZ8IwNt/4EUez9DxsNXxbdgOSNzNgU=;
 b=APcbkZcxVQtGpp7NwtuEkNcon8m5wygJ9ls8YrLgFNFgQYlWEntdDoyTXJt6u2+WSw
 Xp3m9B0nZJjte1v7/OG6At8uc+QjL8aXYO6+sLbyOdSFkYKISO30lhLkWoq14M6XRZmS
 OfYTZM+78SXwgNiBYDjDGpZqiR8uQ7CXFwIn4yPP8iQO10DYPNXairellSk+dtCG5syd
 91fQJUpB3vtX1XMu/c1eHuk+ug16WauHKSttfzZ2Mvd3vaDL8u/BvPFPou5J+HDA79RC
 h0zGfyiWernA0boFMxTyHKWVr7PRn8UYkg0oDoLSEceo32dIuf4Pju8CKxEnCFFGByLJ
 L0/g==
X-Gm-Message-State: ACrzQf32jm9NVUP6GYlOvn7/IjVimgKv/n27/cDZQARQh58EgqsupUNL
 SHTI+neGBVve2QsgDzhsX/RuTPsfr8gYoQ==
X-Google-Smtp-Source: AMsMyM46/dPUFb2wrSdvvh1032G32B8pQvau/M84O1ce4SkQGPnZk3nuho1TaTnGM+uWjiLQJy66Nw==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id
 eb5-20020a0564020d0500b00425b5c8faebmr22992636edb.273.1664894399627; 
 Tue, 04 Oct 2022 07:39:59 -0700 (PDT)
Received: from centennial.enunes.eu.com (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 d25-20020a50fe99000000b00457a92f8ad6sm1828777edt.28.2022.10.04.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:39:59 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 16:39:43 +0200
Message-Id: <20221004143943.1456694-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004143943.1456694-1-nunes.erico@gmail.com>
References: <20221004143943.1456694-1-nunes.erico@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RODfkvfC+yAWUZ8IwNt/4EUez9DxsNXxbdgOSNzNgU=;
 b=pyleVfJyHfaAgfNj1mRBEYBy57v0Fbrp38+d3L95J4YDXTQUi4CG74oWee4d65YZRw
 ZeAloVtXCKC/rJcZlmgcOVlih+4SC/J6/g73c5hNxF37BASViMx1NsxmOjY3iGepsksV
 d/avRcjZURWihK7YZzgS0Fx2yIodw9118iMriKfcrch06jdzm8EnzFIdJdymHVU36/Fm
 RNlQwEK5iYAFUD6JfEIPcyP9Nfjud90hvqz0jQAmygCGnlB+flM/HgBlC3h3im6/gHGi
 F9X0kU84zEjYnv7xA3FEF+jgzbSbs51OW0xtbXwPpcPe/bzD8ZhGnu+Y58Sf3PB1w5/Q
 CrSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pyleVfJy
Subject: [Buildroot] [PATCH v2 2/2] package/efibootmgr: bump to version 18
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
v2:
- no changes, just resubmission due to the changes requested in efivar
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
