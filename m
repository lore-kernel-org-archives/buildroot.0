Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A09C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570AD408C0;
	Wed, 26 Oct 2022 21:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570AD408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dm507itikoBY; Wed, 26 Oct 2022 21:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 296C7408DE;
	Wed, 26 Oct 2022 21:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 296C7408DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB391BF31D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02A6660D5D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02A6660D5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRHuAmcOwiB1 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F9F60C20
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8F9F60C20
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:41:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n14so6920635wmq.3
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 14:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35qCU0FbTBgPAqxy5dcoWGWAIP+jhf9QP28TDoFT45M=;
 b=ZXomUqgtHK0YyCAOQo76xWOG280UNDJnjoxVdXffMET1UTorsyN6psugoUPWLBpdQV
 Tpgp+UWatJEl1UxZfisnxuFPvjJt86r1bYZGYCU9K9A2BZWbpsiwMHu3wyPgMM/wYCwy
 LQlgTl9ESShJEq+FFFsI5n/S8FXRjIK1u7DT7ZTXtrG+ouvpUonRATNZzKHQgLOfYxWN
 C2TyXVa5RMFdjqOd9Qqr8MsJC9GcPEZw9jI92xIyQ0tENlX/z0mmtjsHG6MxJND9SJlf
 FFsHCaH/8Z33RP0rxx3oe6ARH/sZSWO+FEZoVul0aEQzlUmUWm4BPS50fsozls3c6zWI
 PaDQ==
X-Gm-Message-State: ACrzQf3Je+e3yQOQ2bqCIG13vE7ui7iFvt7TI/WYDCXnEqRPGVDgK1u0
 SQZai9LzgcMaQS+UwKoZnTPfFz4XJAc=
X-Google-Smtp-Source: AMsMyM4XXOYEgH9bo9YlJovWp+3aD2C3iTHovU7qHh8ytKtyXgpha6a0sujL1t+vrCwFGEWnbOmwpQ==
X-Received: by 2002:a05:600c:19ca:b0:3c6:ee5a:45fd with SMTP id
 u10-20020a05600c19ca00b003c6ee5a45fdmr3809686wmq.106.1666820458409; 
 Wed, 26 Oct 2022 14:40:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b003b50428cf66sm2979409wms.33.2022.10.26.14.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:40:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 23:40:55 +0200
Message-Id: <20221026214055.625267-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=35qCU0FbTBgPAqxy5dcoWGWAIP+jhf9QP28TDoFT45M=;
 b=Em6jQF4vzhoRCS0ecGyi+BowJi0MLQYhb2ZFIQz7WZytZrFmBs+4UwfEFGor60iF+7
 l466EWq+CpPUptpeUXSzJPU1unibxG4KxMWPTIJXWZ29/1wAO+bxaJJezu9OGKg44EDy
 7fTnPDkeJMRyNIslxRXsl9uC5KsuqBs+FcFlFPwzZGwgOm3yEHum3qU80NRPQ/DvY4aZ
 SR0UIAkZDJu4hJH9ORy8yWiCC2Hwrw2rQjQm1YtBK9ApHBTmSo1ugKB+us/aP+w+e67K
 Qys0Vj40wYi5k60uwgUS2rmWegaHPgXD98a91E446rcA0alxMTonlHe0F768qnXNLhKT
 G8Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Em6jQF4v
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-ipstats-Add-param.h-for-musl.patch   | 29 ----------------
 .../0002-ipstats-add-missing-headers.patch    | 33 -------------------
 ...-_GNU_SOURCE-when-checking-for-setns.patch | 29 ----------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 5 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
 delete mode 100644 package/iproute2/0002-ipstats-add-missing-headers.patch
 delete mode 100644 package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch

diff --git a/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch b/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
deleted file mode 100644
index db6982ab8b..0000000000
--- a/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cf6b60c504d4be5e1df2b2745e55d677967831d0 Mon Sep 17 00:00:00 2001
-From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Tue, 9 Aug 2022 04:01:05 +0000
-Subject: [PATCH] ipstats: Add param.h for musl
-
-Fix build error for musl
-| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:231: undefined reference to `MIN'
-
-Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
-[ upstream status: cf6b60c504d4be5e1df2b2745e55d677967831d0 ]
----
- ip/ipstats.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ip/ipstats.c b/ip/ipstats.c
-index 5cdd15ae..1ac275bd 100644
---- a/ip/ipstats.c
-+++ b/ip/ipstats.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0+
- #include <assert.h>
- #include <errno.h>
-+#include <sys/param.h>
-
- #include "list.h"
- #include "utils.h"
---
-2.37.2
-
diff --git a/package/iproute2/0002-ipstats-add-missing-headers.patch b/package/iproute2/0002-ipstats-add-missing-headers.patch
deleted file mode 100644
index d4b9a5d10d..0000000000
--- a/package/iproute2/0002-ipstats-add-missing-headers.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 28c740473510cd911b97cc5d7d23bd809a0f200b Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Tue, 9 Aug 2022 13:27:33 -0700
-Subject: [PATCH] ipstats: add missing headers
-
-IWYU reports several headers are not explicitly
-included by ipstats.
-
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-[ upstream status: 28c740473510cd911b97cc5d7d23bd809a0f200b]
----
- ip/ipstats.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ip/ipstats.c b/ip/ipstats.c
-index 1ac275bd..dadded14 100644
---- a/ip/ipstats.c
-+++ b/ip/ipstats.c
-@@ -1,7 +1,11 @@
- // SPDX-License-Identifier: GPL-2.0+
-+#include <alloca.h>
- #include <assert.h>
- #include <errno.h>
-+#include <stdio.h>
-+#include <string.h>
- #include <sys/param.h>
-+#include <sys/socket.h>
-
- #include "list.h"
- #include "utils.h"
---
-2.37.2
-
diff --git a/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch b/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
deleted file mode 100644
index a5076d7711..0000000000
--- a/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d5fe96ab70928508f072a47449e9b641e46de323 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 22:34:40 -0700
-Subject: [PATCH] configure: Define _GNU_SOURCE when checking for setns
-
-glibc defines this function only as gnu extention
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-[ upstream status: d5fe96ab70928508f072a47449e9b641e46de323 ]
----
- configure | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure b/configure
-index 440facb7..c02753bb 100755
---- a/configure
-+++ b/configure
-@@ -191,6 +191,7 @@ check_ipt_lib_dir()
- check_setns()
- {
-     cat >$TMPDIR/setnstest.c <<EOF
-+#define _GNU_SOURCE
- #include <sched.h>
- int main(int argc, char **argv)
- {
--- 
-2.37.2
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index a4b0e62c02..45af05a200 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791  iproute2-5.19.0.tar.xz
+sha256  523139e9e72aec996374fa2de74be4c53d2dd05589488934d21ff97bae19580a  iproute2-6.0.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 5c3595d5f4..287c6b14e2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.19.0
+IPROUTE2_VERSION = 6.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
