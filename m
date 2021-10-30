Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A2EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:48:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D294660E54
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D294660E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90CD8401FF;
	Sat, 30 Oct 2021 21:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTs3cKog37Wm; Sat, 30 Oct 2021 21:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 972E740201;
	Sat, 30 Oct 2021 21:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F20301BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E59E980D35
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1h0EP7Jsddg for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:48:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B52A980D34
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:48:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d13so22224621wrf.11
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bMR3RoIXiiwuCg9NHgh4RQBTzv/GUxEUDLgAvUrlKI=;
 b=lkt6eS6RsyydBho0XvqYpdw4YK6dRENuMP89/T1CDFHMmgRpgxH5v3e0Bxf/j+XA9c
 AcG+ZE95JvtkYdS310alGRtivdPU9GNiQcozP41+qPWQEs7FbOiTQVFe1k6lVFfz1xnz
 82f8jniofxgGtydqZk+H982DPQLZg5bt4n0q4Ct19IfyiXfyqTFn01NcDD1E1dL3LrQ+
 GIVJZssIust10gNt0utIUX/Iclm3Vm2iumtWMwKNObLdE4aWd0i0vK/DlSBYlbhJT6s3
 MGxE2nu4C4cK+uiYL9hQ5K7GTnxm2KzsH8zNHzlWOIWj4nE/Jxor6DSkUp2dLcVOMqLw
 MhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bMR3RoIXiiwuCg9NHgh4RQBTzv/GUxEUDLgAvUrlKI=;
 b=aq09K9aQxDNL7wvu8zR6BPORUMSGWRUYcC9hoYQtkUJPEh7PzF7f7KNwkq0NOHSeWc
 qevSjq81lxofN7SFhb9AYr8q9RUsZJPZgcxFzEfgrwg/9ClZCIYlpQhrjARW+1eXaHBn
 dboyrvPHqYMplaKaGyeXfcZZsv6RbxK4WLUgc4K7JtOAiZJpTYAnYMzHtYbIWqELEUxd
 BUGeDKNO+fL5XZH4BXz6EGo1Ni+L4BC5+qZnmSaxF4SlehVcotacBoDJZCQO499oGvoN
 ybk/2/IFoSd5GxETheBZX9fpx6m+QVMnoJ41Z/coZ6av7PWzIKiogyMyIIe0e1S/fGqX
 1XWQ==
X-Gm-Message-State: AOAM530yk4qKeAYkFBEd80nK73eVX3P/fOlnvTRpHlynHtAzsQ4lG9EE
 1jeak77w79ZgBbPM03A1thvVi4cvedE=
X-Google-Smtp-Source: ABdhPJxTgZV7oSw+46VOzVcUsPNRGYt4CeF6JNtnjxKA5hGwrdNVfa7zDSVLDuIIgjnaz6RUlKjeJw==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr15758196wrn.257.1635630484650; 
 Sat, 30 Oct 2021 14:48:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id i3sm12073488wmq.18.2021.10.30.14.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:48:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:46:22 +0200
Message-Id: <20211030214622.2154510-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nano: fix build with uclibc < 1.0.35
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

Build of nano with uclibc < 1.0.35 is broken since bump to version 5.9
in commit 3e62e9b14b2656f813c20ec6aaee99e3a85601c7:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/1932c524aa6b6a3337a0fc21b44adaac60972d30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

diff --git a/package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..f67f6d34bb
--- /dev/null
+++ b/package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
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
+ - http://autobuild.buildroot.org/results/1932c524aa6b6a3337a0fc21b44adaac60972d30
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
