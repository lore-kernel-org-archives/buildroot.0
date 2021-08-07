Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E9EC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:09:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1771E61057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1771E61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B3D8248C;
	Sat,  7 Aug 2021 21:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cljv4C7nE3R; Sat,  7 Aug 2021 21:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3EB3823A0;
	Sat,  7 Aug 2021 21:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9FFA1BF3BC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7DC54035D
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gmo0XUTzJSSl for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 21:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 721B640350
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 21:09:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso8600618wmp.1
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 14:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v89lpZ/5AvE2NG9gzc4UytbpzPHSTfXHeiJ3zej/2Gc=;
 b=F5EawGBh8k0EuPUJ1cnGqQxSbfv83X8Ll9zaWRciC9e181OHVjY+aJJAApc9scAff7
 EetXzN3+m91HqP6AwXJL7kmI8dkoSNH+jrePe50IxZgjMIkTc7GEOjK1UalvYsn120pr
 kN7vUF0FIDRNa1MF9jhyJ/pSwDDh5Rts+PYk807QdZm4NDzQXlBKddSN4roVI7l9x2sW
 JCWlEAKWOPTsn51nmywrKpFo8brb4nx8EcDhaXY0PPOxAwepHD5zfRkNXVWhx+f32aVh
 qap06jsJbs5dmxj0pJ4mBS4eK7mhxyjIpMwipNQp0BpytGFw/yMEnZiujZm8Fzcptpgo
 Tp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v89lpZ/5AvE2NG9gzc4UytbpzPHSTfXHeiJ3zej/2Gc=;
 b=Qkc8UG/u3mc9gA2RHFb2NF9vv9cVwni3MZ0VzdhGIgYrEIYXovNRFxeEMQmqvb0VYf
 yD+qpmNk1qzIt94aYz5LP3veaUCJfuK+8JoZLgLqHWXVeYWCbbWmyQ4PJB91IPm4kpei
 01XT7clKlGUlgXW8OvKmszUfI3VrsUGIU1JefrJL6HSOM1DPU0Liq027LIu0m8htvGqH
 pn6qs0KjKM99S+Y9NJwbxtF2nWEyUithD/igfk1TSO04xAoIMMJJaNKsuODfeWASch+r
 pUIvcWhjexDxlY3eUZ5i97ayyBjPGm6l41e/6VC7h0ya4vJBwoumhe9rnUYwad7me8Z6
 Q67Q==
X-Gm-Message-State: AOAM532dNvjxw2I/GjS0cwXNlprv5bf3GOWkhzdveWG4S0WyS5wqZ7Po
 th+jY8Q/U0jhHB141aQIVtWoiiyW4UNmaQ==
X-Google-Smtp-Source: ABdhPJzy3HNg14vh+9W3JWe+Ixj1MHQjl4ISnCeMWdMN17WEzX3LfjXpHb21flNTXV0cNudhG90L9w==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr25863345wmm.120.1628370561327; 
 Sat, 07 Aug 2021 14:09:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e3sm14225290wrw.51.2021.08.07.14.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:09:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 23:09:09 +0200
Message-Id: <20210807210909.2081039-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tar: fix build with uclibc-ng <
 1.0.35
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the folllowing build failure with uclibc-ng which is raised since
bump to version 1.34 in commit 27fffea6db7358af20f5a3a8faa174d3b782d61f:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/f40e09d621ab5ba66dd97138dec174acfb7fda2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

diff --git a/package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..fe55e4eb4d
--- /dev/null
+++ b/package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
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
+/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
+   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+      |                                   ^~~~~~
+/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+    7 | #include <features.h>
+  +++ |+#include <stddef.h>
+    8 | 
+
+This patch is not upstreamable as it is only a workaround for
+uclibc < 1.0.35, upstream uclibc has been patched with
+https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f40e09d621ab5ba66dd97138dec174acfb7fda2a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gnu/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gnu/getrandom.c b/gnu/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/gnu/getrandom.c
++++ b/gnu/getrandom.c
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
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
