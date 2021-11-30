Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949D1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 17:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 387F460760;
	Tue, 30 Nov 2021 17:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEPE2ejvJsQs; Tue, 30 Nov 2021 17:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C07606C9;
	Tue, 30 Nov 2021 17:34:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBBA61BF358
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7BF84049D
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z976Bdm-83N0 for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 17:33:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD94940494
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 17:33:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v11so46113122wrw.10
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RFe30dVrf1eTPDTBayt/XGkvIZifpEx+vQoY1Xwr3n8=;
 b=eny0zyY0NJwylb8LCy1pGTkYbtEJ5L73AhQe55br9xuGoGJLF+Oe+bNVg2OjHyxi+B
 gmPfwRnGUGmKlypcTsyWsZwUDVViI/0CfdaJ6yRd1f6W+rs0UL3Fyon+UUmo5g3xd8rc
 wDjzVH9W4CO1USSVXcLbX1ACmFKSIyYGA+3ca2zvMAaS6V9HzG01o1p0LtsWfpUROe4e
 +u7JUDrV5YZSvJ+rky93wauA8QtMnoVl+4k1oYhu3UmqJpRj75w6kn8gCuM6v41FuTdI
 4XkCjIzRO1RkDGogNVrW3+YYcIE0FKIewiBSEYP/vvqQtlkRkEk3En447kYPa4v05SJi
 oMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RFe30dVrf1eTPDTBayt/XGkvIZifpEx+vQoY1Xwr3n8=;
 b=K1vEHi5JfAFObGJ4/rvWDO4fgd0jRfh0Vxg2s/WgMET+imXgmm6ZNpvNnQOpCXrqV6
 YQqrl3LHkRd9KnzE8S5K/hSm7v6tBBTBBku4ac5qsCWXtUkzdZv5oS26UioeRH6K+cOS
 bw5C3EoqE5pJUEXTQ0D6kmkwzaY4fEuoBtqwNQB1FaJmvwShAH9gVqIpzjORJSD+mPXE
 Z8geM6Ndqh6RJDLWT034AHpdeKJjOuyyklIi95xRN0WGGYl2riM0gApeeEB+Y6IPa2Uh
 ARxF3EzbogANVSA8adpCdaNbmvYkUEJtKRRJpRWb41S8KI7RUUN+Zqs7a5BAQJUzC/EK
 iwLQ==
X-Gm-Message-State: AOAM531s1E0EEezW+/uj/zA0neDhtj/JfGjwl7OePmaxWI67rB1lCU5Z
 QTwgQEp5YgsF838IHrLh1zB3XBLP4QptKg==
X-Google-Smtp-Source: ABdhPJw22rOpMa1HYuY74ljP3GzipNrxA41zxmKeLSfyCF1wPptgqAP3upue/xTMRT6PT/gVKn20OQ==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr414113wri.6.1638293634644;
 Tue, 30 Nov 2021 09:33:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o10sm21036051wri.15.2021.11.30.09.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:33:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 18:34:11 +0100
Message-Id: <20211130173411.34460-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/diffutils: fix build with uclibc <
 1.0.35
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

Fix the following build failure with uclibc < 1.0.35 raised since bump
to version 3.8 in commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/adecc3e5def140348dfff30961fe6514c9a8e7b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/diffutils/0003-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

diff --git a/package/diffutils/0003-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/diffutils/0003-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..52952e0aaa
--- /dev/null
+++ b/package/diffutils/0003-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -0,0 +1,46 @@
+From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Apr 2021 07:49:46 +0200
+Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
+
+Fix the following build failure with uclibc < 1.0.35 which is raised
+since the addition of getrandom module in
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=682cc4e678aceff32dea2a84b6e5147bdf5a20a7:
+
+In file included from ./sys/random.h:40,
+                 from getrandom.c:22:
+/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
+   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+      |                                   ^~~~~~
+/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+    7 | #include <features.h>
+  +++ |+#include <stddef.h>
+    8 |
+
+This patch is not upstreamable as it is only a workaround for
+uclibc < 1.0.35, upstream uclibc has been patched with
+https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
+
+Fixes:
+ - http://autobuild.buildroot.org/results/adecc3e5def140348dfff30961fe6514c9a8e7b5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/getrandom.c b/lib/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/lib/getrandom.c
++++ b/lib/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.30.2
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
