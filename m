Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C891C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 14:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D7660888;
	Sun,  3 Dec 2023 14:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D7660888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnHEsTYGKgOr; Sun,  3 Dec 2023 14:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57EA360A88;
	Sun,  3 Dec 2023 14:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57EA360A88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1C51BF47D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 600E681D02
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 600E681D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXtGNJBCusgX for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 14:54:26 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04BEA81A5F
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 14:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04BEA81A5F
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c09dfa03cso3532975e9.2
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 06:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701615264; x=1702220064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VN/FT47xmS7q/qnVjf8KfSyGICsBSSArt1Trc8dOiSQ=;
 b=oMTSohfWab0SKy0sx6uQ7R1oHCM8yF83RJqchK9q7hN090WojnC8IB8eb3BRje92fw
 sK/HIM6krONhEukKG3zcirboiOblk2jY+a0xfYrNwDoxcIp0OJtnXiiDYtj3ZQq9ivcJ
 8nOBLnKr+TBO/VOqhLPXK6DwyrxPII8UATPLJtabCpG1ZBGw0F3v8S64WZ4WDhjx779G
 LL3yCyQpf1M+/5qmhZl7q5U7/g/cHKJnKB5eGXXqx00pZVH5eledpEujRgpllEpyTvfx
 9uv+KFat2xuzu/eVGa5Ckv5y78DUg3kOhh5PsnQo4DinBw8S2jbbqEdHo/LgEfk87ldC
 6Zgg==
X-Gm-Message-State: AOJu0Yztq2JvGPZusr2YtDlXaL1rtHDH2fllsw/s8cr03q1XoUa+Fi01
 t1yUkewIM1e3NGNbEqHMGJ6Oa7kujXY=
X-Google-Smtp-Source: AGHT+IFy03cFoH1tRrdFLRRGUVRiERdhbtbK1S2kLeLf03ti3TcJLXfJxQ7dZ0pm4c/ZmooTei0lSQ==
X-Received: by 2002:a05:600c:4f84:b0:40b:5e1e:cf0 with SMTP id
 n4-20020a05600c4f8400b0040b5e1e0cf0mr1872770wmq.43.1701615263610; 
 Sun, 03 Dec 2023 06:54:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b0040b4cb14d40sm15614667wmb.19.2023.12.03.06.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 06:54:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 15:54:18 +0100
Message-ID: <20231203145419.1946230-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701615264; x=1702220064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VN/FT47xmS7q/qnVjf8KfSyGICsBSSArt1Trc8dOiSQ=;
 b=ExrE4KzVmuJb9SZQBjzJhSDS0kqQ49rxhC5EhfF3HFMK/5MALjZu4qElsVYiSgCgeW
 hevb5G3APTbb4wSAEF8GKrf1AdtEksA0p2HP9ljPQTMERXfF1vEXKZ2ZPbedwqIagaV6
 s2NjSR2JN106S4SgygDixpkI0nNwaT3k5811l3NmIJSBu+H/kdrP+GbeJxUy4A8hKmc0
 Lt9LdyNiQLc+qPqgUtmLnj+QfFe9y4sovZ8vHhcbnhEA3ZEJGns3wEvAZ9aWDuBunmhL
 8Gwc5vI2VNUOoi7zqS0mRUfviWMEUQGBDiQqSkYXLNK1z2RlYtweSps55B5JiIGXYXhP
 zu7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ExrE4KzV
Subject: [Buildroot] [PATCH v2,
 1/1] package/xenomai: fix build with gcc >= 12
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 12:

task.c: In function 't_start':
task.c:398:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
  398 |         return ret;
      |                ^~~
task.c:364:13: note: 'ret' was declared here
  364 |         int ret;
      |             ^~~
task.c: In function 't_resume':
task.c:444:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
  444 |         return ret;
      |                ^~~
task.c:428:13: note: 'ret' was declared here
  428 |         int ret;
      |             ^~~

Fixes:
 - http://autobuild.buildroot.org/results/bc1b40de22e563b704ad7f20b6bf4d1f73a6ed8a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add missing Upstream tag to patch

 ...ib-psos-task.c-fix-build-with-gcc-12.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch

diff --git a/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch b/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch
new file mode 100644
index 0000000000..fcc1f1e673
--- /dev/null
+++ b/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch
@@ -0,0 +1,56 @@
+From 6c6da9e6d75ccfaa83c1efe14211f080c14181c6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Dec 2023 15:28:50 +0100
+Subject: [PATCH] lib/psos/task.c: fix build with gcc >= 12
+
+Fix the following build failure with gcc >= 12:
+
+task.c: In function 't_start':
+task.c:398:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
+  398 |         return ret;
+      |                ^~~
+task.c:364:13: note: 'ret' was declared here
+  364 |         int ret;
+      |             ^~~
+task.c: In function 't_resume':
+task.c:444:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
+  444 |         return ret;
+      |                ^~~
+task.c:428:13: note: 'ret' was declared here
+  428 |         int ret;
+      |             ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bc1b40de22e563b704ad7f20b6bf4d1f73a6ed8a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lore.kernel.org/xenomai/20231203144307.1940139-1-fontaine.fabrice@gmail.com/T/#u
+---
+ lib/psos/task.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/psos/task.c b/lib/psos/task.c
+index f678be61d..27bcc28a9 100644
+--- a/lib/psos/task.c
++++ b/lib/psos/task.c
+@@ -362,7 +362,7 @@ u_long t_start(u_long tid,
+ {
+ 	struct psos_task *task;
+ 	struct service svc;
+-	int ret;
++	int ret = SUCCESS;
+ 
+ 	CANCEL_DEFER(svc);
+ 
+@@ -426,7 +426,7 @@ u_long t_resume(u_long tid)
+ {
+ 	struct psos_task *task;
+ 	struct service svc;
+-	int ret;
++	int ret = SUCCESS;
+ 
+ 	CANCEL_DEFER(svc);
+ 
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
