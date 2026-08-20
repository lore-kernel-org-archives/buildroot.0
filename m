Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A07C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 00:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F2680BF5;
	Thu, 20 Aug 2026 00:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv4km7J57hrg; Thu, 20 Aug 2026 00:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787184182;
	bh=SO4JfO+O/nTdA85ZbHQfnz/GRF573tkj+MTENHUW9ks=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WHQaSJ8CT1QG7h+svZROqygnQGUgvsb0gk+9W7PK93Xknl3eCVYIxJxtCM37cUV6A
	 pdHkwT5eIQCrQpXBT7bw0dh3jBUHU9LJ8JZk/lILM6CiB0URc5+eYNO0y6e6rOrN73
	 t/l/MywZkah7ZL7l3P3U4QxuCMFo3GeLWqC+2MHyg3iLxvAri2H8lkwaGVnmP4Xd5y
	 1I5LUdyptuuHloh15lTmycd4E6qB869Wj9GaU7GLDfAaFlclWuoXoFaJHkY5fVwE0x
	 hMl7D6IwL6RRr67J1r0ZtRPLLHAJbotTtRl56THy5qZOiVUECB7SGj5O1S0Z1aDF/Y
	 Z4nTKCpHcLBww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 105A680BFA;
	Thu, 20 Aug 2026 00:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F22323
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 00:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C4F880C41
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 00:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4PRAgY6Jwcu for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 00:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=THmLG+Ru
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E5D580BF5
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 00:02:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-499840a2575so12469745e9.3
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 17:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787184177; x=1787788977; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ebp8yQ0itXF/mE2lxaACWXI4lnerLaq0BeGaARwtHsM=;
 b=THmLG+RuYCd2uzwgsXbF/sqdUEbouUxf247PgKkFfmA5pCnvLpd9tgY9sLGC4IBNZ3
 iwekU9cC8vgP9Ob/+grNEP/XSheMadHHWYPF8Pfiors3R9ibp/8L8Ua9YRer54HaJPZg
 fv+8BbE87iE/svwW7I03pLXcNque5RXDcBaY5PKbiKGYNotj5dFu7i2GJbbw4UGcZgbQ
 bZQuKlVJFTQmKEjSzZ1GVKdofH5EA0nyRJcYVkotpNe1GsOAPp9xnI8ci1fd+LvooF2l
 PXx7MqodjTxaTe8/qFN0l5uMiHkHFouwdEI7MoQsuwXPqWoDWVy88//TDhdFEvu+Am6H
 8u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787184177; x=1787788977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ebp8yQ0itXF/mE2lxaACWXI4lnerLaq0BeGaARwtHsM=;
 b=ECLclMiUDqeoniVJx98jdIUtd99ahj8qAiGxE+NAL9U1vfibSo0dzOKzGHeZeWYAJD
 QG0tv1WKnQFaDbD7anJm4si2ByRqmmp6TERqrbIpcBI4tdddc8cHybXE9yJyunNnhfXN
 ydlwrEVz1c2/U0Mpp+TI83O4hKzAEXFbXZan8wW2mKwhiL6bWwVXkY/A+zvdAiJB/aik
 VtDbMkfAuzFJweBYBxwnpsJf2hZJ798FrXmBc4PBWzDunszOdkbelY83HM0xCzCtqyuV
 9Jh4sgrdr1+FiME1B3285stU7dTeEmdd2H2eB7u+PaRgqG3e9HEKjDHQVZWrgeJS+l+M
 Poyg==
X-Gm-Message-State: AOJu0YznsC/6rYcqeC1sXBAwdrTPBZK40bjbCgVm+eCU7qBk2Lf1m1eS
 U7Ba9mF4SMNQeW4bIkToozKKQ8FYWouSvSB9UHiZfD4VJabubJn4Z/EbNB8fpg==
X-Gm-Gg: AR+sD12I2Xwai3SKDWF+ZU1ED/37xyCdn6GFKPE61OyT6HP0rd8EOEhuDuWG2LjjYUk
 Iic3Uiwyi9QjBrmVbmj6y2XTdyJrvEScGzImFazwqUidTrZvR6RVorkD4j2yd8bdJFvpG0Mw4yj
 dXchzAv6nTihGzEhHMfIHvQ0mabbzyYZv9RucVXhKaYwR6gQIfPihjRGHj2rhsvzgWFtPH8nOTj
 5HrqiXCXCotNHRWm/scuaZewaHf/uuR+s7zxMMEQbHB+DeZAzFfohhPauHjk29syM1n6RRelUs0
 xg0f1O5wkAfrfQMGnAlj+zCOaIulyE9Hnh0pqRab0+ofIAO0EsUj6CQdaUPJ0TRIu/FzxqJs5yX
 zRuGKD91plY5e3XQ9TX2aY9YqW0eHISHbUaL5HUp8Ei0djRwphp/yKKzdUhhOhj+FTt2XLoIHvo
 Iv+e2EcLt4HyB/4t8dKC3GIyg6FIBEli48j+bmn07xHAZ8YoE2Z9qFJAhDybE2WjeNnT/h23JSf
 HO868PxAQT/j+eWLuOuxwc=
X-Received: by 2002:a05:600c:37c6:b0:499:858f:2653 with SMTP id
 5b1f17b1804b1-499aa14b457mr164589765e9.2.1787184176850; 
 Wed, 19 Aug 2026 17:02:56 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0d6721sm127909395e9.11.2026.08.19.17.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 17:02:56 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 20 Aug 2026 02:02:51 +0200
Message-ID: <20260820000251.441942-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/nfs-utils: bump version to 2.9.2
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

Backport 3 patches from upstream fixing this release regressions:

* 67ed1bdb ("exportfs: link failure with --disable-nfsdctl")
* cec8eeb6 ("getport: fix missing stddef.h inclusion")
* cf80edae ("statd: fix memory leak in sm_mon_1_svc() when existing host re-monitors")

And 4th patch which fixes error on old toolchains, e.g.
br-arm-full-static or bootlin-aarch64-glibc-old.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Backport 3 fixes + 1 reported upstream.

Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
               bootlin-aarch64-glibc-old [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 ..._file-fix-missing-string.h-inclusion.patch | 28 -------
 ...-leak-in-sm_mon_1_svc-when-existing-.patch | 40 ++++++++++
 ....h-file-to-deal-with-old-Linux-api-a.patch | 77 -------------------
 ...tport-fix-missing-stddef.h-inclusion.patch | 33 ++++++++
 ...fs-link-failure-with-disable-nfsdctl.patch | 39 ++++++++++
 ...kend_sqlite.c-fix-getrandom-fallback.patch | 30 --------
 ...ort-Fix-switch-case-on-old-compilers.patch | 46 +++++++++++
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  5 +-
 9 files changed, 164 insertions(+), 138 deletions(-)
 delete mode 100644 package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
 create mode 100644 package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
 delete mode 100644 package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
 create mode 100644 package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
 create mode 100644 package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
 delete mode 100644 package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
 create mode 100644 package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch

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
diff --git a/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch b/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
new file mode 100644
index 0000000000..b83fb21687
--- /dev/null
+++ b/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
@@ -0,0 +1,40 @@
+From cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae Mon Sep 17 00:00:00 2001
+From: xuchenchen <xuchenchen@kylinos.cn>
+Date: Sat, 15 Aug 2026 13:58:16 -0400
+Subject: [PATCH 1/3] statd: fix memory leak in sm_mon_1_svc() when existing
+ host re-monitors
+
+When an already-monitored host sends a new SM_MON request with a
+different priv cookie, the code sets existing=1 and reuses the
+existing notify_list entry. However, clnt->dns_name is overwritten
+with the newly allocated dnsname without freeing the old value,
+causing a memory leak.
+
+Since statd is a long-running daemon, repeated SM_MON requests with
+changing cookies will accumulate leaked strings.
+
+Fix by freeing the old dns_name before overwriting it.
+
+Signed-off-by: xuchenchen <xuchenchen@kylinos.cn>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+[Upstream status: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae]
+---
+ utils/statd/monitor.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/utils/statd/monitor.c b/utils/statd/monitor.c
+index c76589ca..76ef16f1 100644
+--- a/utils/statd/monitor.c
++++ b/utils/statd/monitor.c
+@@ -187,6 +187,8 @@ sm_mon_1_svc(struct mon *argp, struct svc_req *rqstp)
+ 	NL_MY_VERS(clnt) = id->my_vers;
+ 	NL_MY_PROC(clnt) = id->my_proc;
+ 	memcpy(NL_PRIV(clnt), argp->priv, SM_PRIV_SIZE);
++	if (existing)
++		free(clnt->dns_name);
+ 	clnt->dns_name = dnsname;
+ 
+ 	/*
+-- 
+2.53.0
+
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
diff --git a/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch b/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
new file mode 100644
index 0000000000..51f41f97fb
--- /dev/null
+++ b/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
@@ -0,0 +1,33 @@
+From cec8eeb69dc65eb91e0cb23ebff23530d9397425 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 15 Aug 2026 14:00:36 -0400
+Subject: [PATCH 2/3] getport: fix missing stddef.h inclusion
+
+getport.c uses offsetof() but does not include <stddef.h>. On glibc
+this works because offsetof is pulled in transitively, but on musl it
+is not available without the explicit include, causing:
+
+  getport.c:459:41: error: implicit declaration of function 'offsetof'
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+[Upstream status: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cec8eeb69dc65eb91e0cb23ebff23530d9397425]
+---
+ support/nfs/getport.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nfs/getport.c b/support/nfs/getport.c
+index 608e185b..6bd2f713 100644
+--- a/support/nfs/getport.c
++++ b/support/nfs/getport.c
+@@ -27,6 +27,7 @@
+ #endif
+ 
+ #include <sys/types.h>
++#include <stddef.h>
+ #include <sys/time.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-- 
+2.53.0
+
diff --git a/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch b/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
new file mode 100644
index 0000000000..80a54d5f90
--- /dev/null
+++ b/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
@@ -0,0 +1,39 @@
+From 67ed1bdb1af1c70a5fd3b377a997401b7676b827 Mon Sep 17 00:00:00 2001
+From: jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 15 Aug 2026 14:20:03 -0400
+Subject: [PATCH 3/3] exportfs: link failure with --disable-nfsdctl
+
+Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
+exportfs. This is a regression from 2.9.1.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+[Upstream status: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=67ed1bdb1af1c70a5fd3b377a997401b7676b827]
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ea19715..2ce1e129 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -256,8 +256,6 @@ PKG_CHECK_MODULES(LIBNL3, libnl-3.0 >= 3.1)
+ PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >= 3.1)
+ 
+ AC_CHECK_HEADERS(linux/nfsd_netlink.h)
+-AC_DEFINE([HAVE_NFSD_NETLINK], 1,
+-	  [Define to 1 if nfsd generic netlink support is available])
+ 
+ # ensure the system netlink headers have the latest features
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
+@@ -279,6 +277,8 @@ AC_ARG_ENABLE(nfsdctl,
+ 	enable_nfsdctl="yes")
+ 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" = "yes" ])
+ 	if test "$enable_nfsdctl" = yes; then
++		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
++	  		[Define to 1 if nfsd generic netlink support is available])
+ 		PKG_CHECK_MODULES(LIBREADLINE, readline)
+ 	fi
+ 
+-- 
+2.53.0
+
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
diff --git a/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch b/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
new file mode 100644
index 0000000000..cfccf0b9f6
--- /dev/null
+++ b/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
@@ -0,0 +1,46 @@
+From 7b886f3502977040461a8b31f5948a128f7069e2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Thu, 20 Aug 2026 01:03:10 +0200
+Subject: [FTBFS,PATCH,nfs-utils 1/1] getport: Fix switch case on old compilers
+Cc: Steve Dickson <SteveD@RedHat.com>,
+    Giulio Benetti <giulio.benetti@benettiengineering.com>,
+    Julien Olivain <ju.o@free.fr>
+
+Buildroot distro compiles with fairly old compilers, which defaults to
+old C11 standard (some of still used compilers don't even have newer
+standard than C11). Workaround code which requires C23 with using { }.
+
+This fixes error:
+
+    getport.c:460:3: error: a label can only be part of a statement and a declaration is not a statement
+       size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
+       ^~~~~~
+
+Fixes: 1a6dcd74 ("Removed warnings in nfs_sockaddr2universal()")
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status:
+https://lore.kernel.org/linux-nfs/20260819232049.438643-1-petr.vorel@gmail.com/
+]
+---
+ support/nfs/getport.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/support/nfs/getport.c b/support/nfs/getport.c
+index 6bd2f713..18ea0777 100644
+--- a/support/nfs/getport.c
++++ b/support/nfs/getport.c
+@@ -456,9 +456,10 @@ char *nfs_sockaddr2universal(const struct sockaddr *sap)
+ 	int len = sizeof(struct sockaddr);
+ 
+ 	switch (sap->sa_family) {
+-	case AF_LOCAL:
++	case AF_LOCAL: {
+ 		size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
+ 		return strndup(sun->sun_path, path_len);
++	}
+ 	case AF_INET:
+ 		if (inet_ntop(AF_INET, (const void *)&sin->sin_addr.s_addr,
+ 					buf, (socklen_t)sizeof(buf)) == NULL)
+-- 
+2.53.0
+
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
index df9fdbc052..6e0fb1a04c 100644
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
@@ -12,6 +12,9 @@ NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libnl libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 
+# 0003-exportfs-link-failure-with-disable-nfsdctl.patch
+NFS_UTILS_AUTORECONF = YES
+
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPTS = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
