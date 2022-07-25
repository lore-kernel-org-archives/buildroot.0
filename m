Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C1C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E69611FF;
	Mon, 25 Jul 2022 09:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E69611FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOgdJd4oFetX; Mon, 25 Jul 2022 09:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F1E161116;
	Mon, 25 Jul 2022 09:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1E161116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60AB31BF3FD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4582E84613
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4582E84613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gDl3SDuTw8Z for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:45:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE4E84188
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AE4E84188
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:45:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v13so7369493wru.12
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 02:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eOvQhUe9N0e3mnlggQ0azKXKBsUvtkx9/Ozu0RUmcBU=;
 b=HAvf1kNMXZ1Jp9aXl4zpKb0jDOCQqlNVIYoVeIaRT43t/jj6JQzFUFDMH0oYSF8Z8i
 cqLG1Gxk5DmXIo25pGl5JZXdP1SHN0DF+Aj2QKJgMnk93d8DfcdDFVgrStjJ4IwSjyB7
 IQTlnaRUoEY6ahUUyorFh+TvgkNuOiSWuPHIp2fDqXrK8Amh4+tsn723xEJzaMkaWSAS
 +TYcVAzEIaPEoOm4FhSFAXuMw5ro42W6y2ONL1vjggn+8BYDzMUyLOkvWXyW/fVZscA+
 ZrUbIsSfHzEurs55FaDj2IYwEVgTA8WDVBQtFY+BNmRGpAkhC8qe9KiZXSI0Kh6cr13L
 COeg==
X-Gm-Message-State: AJIora9eqd9d2H+soUb0Y/QbGo8EtCv0T7apkoF1bCQFxcXyvXUb1wYg
 e5ZzSbtHpM8azARi9Mj+nqxR128nxBcE6Q==
X-Google-Smtp-Source: AGRyM1v5GmJjCvC9cVMuMteK8CUFm/EaiSYeW4LsreCkR0oLmM4ZfQweeuCGTo2Y+atfcHEJ+bgL6w==
X-Received: by 2002:a5d:430d:0:b0:210:2ce0:e2a9 with SMTP id
 h13-20020a5d430d000000b002102ce0e2a9mr7224005wrq.627.1658742300225; 
 Mon, 25 Jul 2022 02:45:00 -0700 (PDT)
Received: from P-NTS-Evian.home ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfe691000000b0020d07d90b71sm11631155wrm.66.2022.07.25.02.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 02:44:59 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 11:44:56 +0200
Message-Id: <20220725094456.15051-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eOvQhUe9N0e3mnlggQ0azKXKBsUvtkx9/Ozu0RUmcBU=;
 b=d2F7CNExmqHZOtbyBf9VHxOrJx98bqBOrP1b9gag5SCfRfWdN61vwIpxRARi6UFQDE
 d4b804YllhtqM7OBeDO1AY+b0OgYoeveNlZAQT2Gj17lKfWdw0J8LJkyGqgWvxFLy/px
 B4ToKKRubgsrzfBtXTYp84hGU3Oa8dTM90VyPezd0kFYOooiSiVA9lLWrvbBJaxHlTu1
 VXj1l2UMcbfKBfZROd3rYhZ/KAzT8v2sqPnE3hcslZmRR6RlCbPCm8mEHFkh6KvBpIOS
 5L+U6lR/LP2ApZINWVWqVvr+UGIOPfQ0/bsT9wqB2yV6JswWMDmCyciR2C/B0mm5uwru
 qvtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=d2F7CNEx
Subject: [Buildroot] [PATCH] package/gcc: disable split-stack for non-thread
 builds
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit [1], the autobuilder script generate fully random
configurations that can triggers configuration that was not tested
before.

Here, the toolchain build with uClibc-ng without threads support
(BR2_PTHREADS_NONE=y) fail to build due to missing pthread.h header.

../../../libgcc/generic-morestack-thread.c:42:10: fatal error: pthread.h: No such file or directory
   42 | #include <pthread.h>

This issue was actually fixed by this commit [2] adding a patch for
gcc 4.8, 4.9, 5.3. But it get lost when gcc 6 was added to Buildroot [3].

Since then the issue was present in Buildroot but has not been noticed.

[1] https://git.buildroot.net/buildroot-test/commit/?id=27b18dcb1686a98ce718b6a816e98f8505957a6c
[2] 2631219f648f4aa13fa36d06a483e4507cb6f3d7
[3] 519d83bfa0442439026db4e71e605a5c1347e566

Fixes:
http://autobuild.buildroot.org/results/5ec/5ec9eefacd27ef4fa73066013188796b43a30428
https://bugs.busybox.net/show_bug.cgi?id=8766

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---

From Peter's comments (2016):
"I also doubt the no-thread option gets used very much.
Perhaps the way forward is to deprecate it and then make
threads always available, similar to how we did for
largefile/IPv6?"

https://bugs.busybox.net/show_bug.cgi?id=8766#c4

We are now in 2022, do we still want to support the no-thread
option?
---
 ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
 ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
 ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch

diff --git a/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch b/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..668b1cd9d7
--- /dev/null
+++ b/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From cdb76d638e91cc53949585d98fa653d3671b92ac Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..dba2d02d7f
--- /dev/null
+++ b/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 3b9d7d397fa6dc290eb05bffca80968efb6ec2e5 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
