Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3438C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6267060EC0
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6267060EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6A760753;
	Sat,  6 Nov 2021 15:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOPUx6FEzI6n; Sat,  6 Nov 2021 15:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 518F060733;
	Sat,  6 Nov 2021 15:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB9171BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7DE160733
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dd6jbyCwhM_7 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:07:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2B0E6061F
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:07:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u18so18453938wrg.5
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GE5qTtBh53rcbghRNU6jkUp8TYGSnx277Q9mIu0DKNQ=;
 b=PvjWk5Vx/OdPWh0p5tODE9Gjc89kSnUfHYqy3BmDYZoBDY12WJ4DxHuJ1XqvGFKyYU
 WiG29rOVnQN2nx2+YttZFdP9iAmZSmJPw/ASsDtEL7aZV0A3+iTKGuKaJZPCG1XxB0xA
 Gl+12xpHKGHIjuDQtqs18is6tj8F+5R3vsta4LNiX5p8tqxwEN0o1gK+dJulMcS9rl0y
 qVkkc9Lj6dxgbZpuxA9KwOHvYtgwz9HYgLla6vVwKgwehOH8wKPdJ2pQNH7r7bUPKsDz
 ogQROgxtVsr60c9GzVvDF768xcPJBgamF4d1FXI3NB6j61n+xlDW+cN5fsyUQB0PRe0P
 koeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GE5qTtBh53rcbghRNU6jkUp8TYGSnx277Q9mIu0DKNQ=;
 b=u/B9CJJP0fII2I95hlxTC/4Ct2ytEss2+Sej4uPyHrG+Z2lO7wyenrksXOrzazYGjU
 1d6A2srAITqwMomRZR3C2zakXGM8Mm1F9Vsydu4ERzjec0FVZnGOpVolm+HyebbgRj2V
 ENbL6baEooMqBdLaRfxnAQ7ar3u+cY55keHQnHZtSZ9ctXOW2B+/wo9kCT3oZyroWF79
 JqT8ws0xiK6q1vTE/Ef80ek6T4+Ek35GCmi0YHlgpEBq8CiOvbZmRW7JO0pdYUMYiRXN
 dVMpCoZgu3VYnXbYiCZeBMHvjNMCiRH4hGBVRrSjhAAr8ANJVbJCCSlrmVFO87rN/73e
 MIkA==
X-Gm-Message-State: AOAM532P7G95mnR5Fw4NZczyvkulugVxheOp9GCK+G7VyH0e+EBqRkaE
 4sABM6leiR90lv91MVtC/0AAvimJ2ZM=
X-Google-Smtp-Source: ABdhPJwAzUw03Koa2/YNmVeD8CXVTwMFmdv6L+eWrFZne0gNDGpIpPAM1Ayp7HdK/gz+Xbh0K6EAzQ==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr56964111wrt.31.1636211243837; 
 Sat, 06 Nov 2021 08:07:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t8sm9148020wmq.32.2021.11.06.08.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:07:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:05:28 +0100
Message-Id: <20211106150528.3185449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/coreutils: fix build with uclibc <
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

Build of coreutils with uclibc < 1.0.35 is broken since bump to version
9.0 in commit 2ee43bad85693d1c96e14f5b39ccb13a8982f50a:

In file included from ./lib/sys/random.h:40,
                 from lib/getrandom.c:22:
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/c69f5c8b8e53ed3de753f0c6d2cdd99497504b49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

diff --git a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..88390a1124
--- /dev/null
+++ b/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
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
+ - http://autobuild.buildroot.org/results/c69f5c8b8e53ed3de753f0c6d2cdd99497504b49
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
