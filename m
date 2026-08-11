Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8B1C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 04:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB284070C;
	Tue, 11 Aug 2026 04:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KidEIzy0rrIk; Tue, 11 Aug 2026 04:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC60D406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786424295;
	bh=lgUVSUmxk5g/0HUnDwQoqUEn/1z9fcqj0WtLP8h5nOw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m56OsGLzK2LULm1kBtqOla9nfqNs4zzuN2qmlQlav5502kFwJSlc8Gm/+xMQ6rooM
	 Eoc3qFFQlJP0BKngq5EO7nd771HsJKs27kWLoI62VzHF/yusE9dZ+yY324aa7G2VyE
	 zeoqm3/PQGbugIomwganM1ZPJy+tttxhpu8tAxoBo78UMtQTjI5Ab9QzLWqs3DpRtw
	 N/wNlnUPcrwrDjzim7uxh9L2g4Id5SwqdWjfgcZ4tacvXvXouAnKPYHcl4t7XiL2Hy
	 aos6P/mhcflYIszGROtUhIjHS9edFDYxKqg8nzunQ7j9xW/VSqGGW+M149+lEtS8Uz
	 biNbfB83eR60Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC60D406FC;
	Tue, 11 Aug 2026 04:58:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4DD218
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E004005F
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJk43JySEWNw for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 04:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E49BD40050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E49BD40050
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E49BD40050
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:58:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so29200685e9.2
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786424291; x=1787029091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5MAKFui612pTKksU3WMPA92rODnLBvSOIb/wnuUreoo=;
 b=C7N9OHCbErLUGE++CnH3kyb6IzwsMPs4tpdWYdsPwsLfbWrJnvcTuYtjqoAhyib7IF
 73eexpFv8W/4TBCbkMS24gYHWVG2xNvlRda/JoBfcqgHHmrL5S7pgaCSwthvNmS50RWA
 a1d/cpgNtv7ccyBdvTPW8dQVT9TZXriLabdu25yeYIeFGpPpYe/abdWFE9QCWpqi7Y74
 Ix9e5YON9rCuFYLJSFykT49bpbHDufhPgXrU/TUtA4QNiQTE+g4CTr22A0aZdHCqg/x7
 gfen9+Llhyfp7FlZLtfzXenV2ZDufJSKv8kqwf3Wy1TpmnHoeCP/n7sxjto8u2NR3VNY
 DOcw==
X-Gm-Message-State: AOJu0YzwZpTwDumIk8a62JLtii75ElyT44T2/crtIbRmIjBnqy/n7a+Z
 h2pA3TgnKBguJB/hiwzNazEYB9XZd0QN9VRHfcDxkIUYjfQ8stOy1nOZm38iOA==
X-Gm-Gg: AR+sD11mojnxonDlSm9Iaf6X5a7apexd/xJiS/tCVPh8wcuyPAGWAa365jMWrvO5Vqz
 8ke2jMX9nKWbEl/TUZuq2veMNArKqKD1Nj3/rLH1LZC2/KSIXJKNkd4yyQk61n07Ldjd2nHld50
 1fENVMDkMm0xaLFk34lUHJbLwU9Wfw7U81GxCkazWsQfqwYdwJLhexLowIXgCT8w+nJd1L7O4KP
 IDG7u6F59GM/XcrrN7kvtJUghv7xa/j5u7q+B70gYJjVS6Ulai4oTVz89AHuP88WQ4hFFwuvxlp
 2l69kvxGPneVaWuGfeITFfWLfqi//9aVbZzhFgu6bCKUw4EV/K964EuoBIFKi5xAuRTo0uJMmMt
 qZwHPjqnhBnRY2dMtJOLr9CrUp3BySMxn7ITCAsmNS5JXtweFXHJtmrhz5y03m86vQ0OHaDvQp9
 aaHA4wvEytNKtmp1c8pAVTBw1TBXA3xTN3cbP0KfWFL5LpAZCUHDQygzbcF/m9GMpQ2370QYWFz
 s6/2QAokO/UvuMnT9vm9JzD
X-Received: by 2002:a05:600c:4705:b0:492:4e09:9fc1 with SMTP id
 5b1f17b1804b1-49978472fb3mr9440025e9.15.1786424290498; 
 Mon, 10 Aug 2026 21:58:10 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499788a5be9sm13966095e9.4.2026.08.10.21.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 21:58:09 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 11 Aug 2026 06:58:01 +0200
Message-ID: <20260811045801.234968-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786424291; x=1787029091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5MAKFui612pTKksU3WMPA92rODnLBvSOIb/wnuUreoo=;
 b=UJ7MHM4Kbmmd+fnJAKRwfh+5gHcxlCioInjDLWkHluX6G+AQxgAGawwDKHUeqnsB6V
 pgi4qYWVJNHNrWql6jQ0odYmYzuA/ztAJFTgG7tTx2C8WdwKil+e3OxEuNlhysPTi6R4
 OJ1TtdkJNWk3TY/CEelCFuGnXz5wVF6dwvko5BCQwjkEm9lqeHcgGcIX7SKocyh+NRLm
 h/czBagMNTVDKtFaKTGYrCPy6s7OMr/jXM5ArxRP400gwH5LIuhnDE84j55Y2HUcT/2a
 0mu/MAaqYtAMAPiS/Q5hNnp9m35ySK3dF8p8UnKLu/EJWc3Oo1cmQzX0BidV5sDjCIjL
 rc8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UJ7MHM4K
Subject: [Buildroot] [RFC][PATCH] package/nfs-utils: bump version to 2.9.2
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

Remove patches upstreamed in this release.

Release announce:
https://lore.kernel.org/linux-nfs/dc0f6f41-84be-4a70-92db-89890bded3ab@redhat.com/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
[RFC] Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
exportfs [1]. This is a regression from 2.9.1. Buildroot uses
--disable-nfsdctl => we should probably wait for the fix.

Kind regards,
Petr

[1] https://lore.kernel.org/linux-nfs/9fec9f1b-1c10-4a20-8282-dfc9addb4ee8@est.tech/

 ..._file-fix-missing-string.h-inclusion.patch | 28 -------
 ....h-file-to-deal-with-old-Linux-api-a.patch | 77 -------------------
 ...kend_sqlite.c-fix-getrandom-fallback.patch | 30 --------
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  2 +-
 5 files changed, 3 insertions(+), 138 deletions(-)
 delete mode 100644 package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
 delete mode 100644 package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
 delete mode 100644 package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch

diff --git a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
deleted file mode 100644
index 838d519d5a..0000000000
--- a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2d99ff0aa8a3b4d20558bce742edaaed9d24b3cb Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 7 Apr 2026 17:23:13 +0200
-Subject: [PATCH] fh_key_file: fix missing string.h inclusion
-
-Add #include <string.h> to fix build failure.
-
-Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-1-giulio.benetti@benettiengineering.com/T/#t
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/nfs/fh_key_file.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
-index 5f5eafc1..81ea1500 100644
---- a/support/nfs/fh_key_file.c
-+++ b/support/nfs/fh_key_file.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- #include <errno.h>
-+#include <string.h>
- #include <uuid/uuid.h>
- 
- #include "nfslib.h"
--- 
-2.47.3
-
diff --git a/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
deleted file mode 100644
index c5c57c6503..0000000000
--- a/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 218e1b572123f527bd92c17ebb7ac00c2a7e6c01 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 7 Apr 2026 17:47:40 +0200
-Subject: [PATCH] Introduce compat.h file to deal with old Linux api and fix
- build failure due to missing NETLINK_EXT_ACK
-
-In compat.h check if NETLINK_EXT_ACK exists, otherwise define it to fix
-build failure and where at the moment <linux/netlink.h> is included
-let's include "compat.h"
-
-Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-2-giulio.benetti@benettiengineering.com/T/#u
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/export/cache.c       |  2 +-
- support/export/cache_flush.c |  2 ++
- support/include/compat.h     | 10 ++++++++++
- utils/nfsdctl/nfsdctl.c      |  1 +
- 4 files changed, 14 insertions(+), 1 deletion(-)
- create mode 100644 support/include/compat.h
-
-diff --git a/support/export/cache.c b/support/export/cache.c
-index 2f128d7d..65008f51 100644
---- a/support/export/cache.c
-+++ b/support/export/cache.c
-@@ -40,7 +40,7 @@
- #include <netlink/genl/ctrl.h>
- #include <netlink/msg.h>
- #include <netlink/attr.h>
--#include <linux/netlink.h>
-+#include "compat.h"
- 
- #ifdef USE_SYSTEM_NFSD_NETLINK_H
- #include <linux/nfsd_netlink.h>
-diff --git a/support/export/cache_flush.c b/support/export/cache_flush.c
-index ed7b964f..2a24dec7 100644
---- a/support/export/cache_flush.c
-+++ b/support/export/cache_flush.c
-@@ -38,6 +38,8 @@ extern int no_netlink;
- #include "sunrpc_netlink.h"
- #endif
- 
-+#include "compat.h"
-+
- static int nl_send_flush(struct nl_sock *sock, int family, int cmd)
- {
- 	struct nl_msg *msg;
-diff --git a/support/include/compat.h b/support/include/compat.h
-new file mode 100644
-index 00000000..83229b65
---- /dev/null
-+++ b/support/include/compat.h
-@@ -0,0 +1,10 @@
-+#ifndef COMPAT_H
-+#define COMPAT_H
-+
-+#include <linux/netlink.h>
-+
-+#ifndef NETLINK_EXT_ACK
-+#define NETLINK_EXT_ACK 11
-+#endif
-+
-+#endif /* COMPAT_H */
-diff --git a/utils/nfsdctl/nfsdctl.c b/utils/nfsdctl/nfsdctl.c
-index 016dd2eb..c7126748 100644
---- a/utils/nfsdctl/nfsdctl.c
-+++ b/utils/nfsdctl/nfsdctl.c
-@@ -26,6 +26,7 @@
- #include <netlink/msg.h>
- #include <netlink/attr.h>
- #include <linux/netlink.h>
-+#include "compat.h"
- 
- #include <readline/readline.h>
- #include <readline/history.h>
--- 
-2.47.3
-
diff --git a/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch b/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
deleted file mode 100644
index 86d615ca34..0000000000
--- a/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From dbd44e7d6d4140e5e9d01f0a6daf6f3e45e5acbc Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 8 Apr 2026 14:28:28 +0200
-Subject: [PATCH] support/backend_sqlite.c: fix getrandom() fallback
-
-In old Linux/Glibc versions __NR_getrandom is defined in <sys/random.h>
-so let's add it to fix build failure.
-
-Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-3-giulio.benetti@benettiengineering.com/T/#u
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/reexport/backend_sqlite.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
-index 0eb5ea37..a1e981e4 100644
---- a/support/reexport/backend_sqlite.c
-+++ b/support/reexport/backend_sqlite.c
-@@ -9,6 +9,8 @@
- #include <string.h>
- #include <unistd.h>
- 
-+#include <sys/syscall.h>
-+
- #ifdef HAVE_GETRANDOM
- # include <sys/random.h>
- # if !defined(SYS_getrandom) && defined(__NR_getrandom)
--- 
-2.47.3
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 19315e60a3..93f8e463a1 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.1/sha256sums.asc
-sha256  302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c  nfs-utils-2.9.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/sha256sums.asc
+sha256  e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed86c9d3dc4097e8c  nfs-utils-2.9.2.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index df9fdbc052..8a3a745316 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.9.1
+NFS_UTILS_VERSION = 2.9.2
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
