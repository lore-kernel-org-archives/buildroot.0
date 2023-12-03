Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22452C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 14:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47DB60F2E;
	Sun,  3 Dec 2023 14:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47DB60F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h56dwa2hgaoE; Sun,  3 Dec 2023 14:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2492D60F22;
	Sun,  3 Dec 2023 14:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2492D60F22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 358971BF47D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E90281A27
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E90281A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGQurEUOizqO for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 14:47:28 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD660819F6
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 14:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD660819F6
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33338c47134so1170998f8f.1
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 06:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701614845; x=1702219645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j9zJAzQ84O33ZUcvtt12dbZ5GjTBjNb/I6szzROmH14=;
 b=C9OjL47aVxUodK70uUcVwdAfYGZVpjkuQ+8vg4/yx1jHmKUugKo5tQ3boPw1Zy77ft
 6WGAI1WZnW72QKR3RmyeGTp5Tjm0UbLv1cMOzb7j+u4aLXlGYM+MmC4iJjhosH8T3Nyp
 eJAwFrQZ77lkDUSEOfFErNlcGM0FH1+xLimTV1lxyXW4bJYx4Nq2MmxFNutNHMyHazTZ
 H5c8BFAXbWx2PL6f4p0zDqkApN+eZN6Qz5hZRVgfU9IGT5t9JpwUvj+hShGwiJTL4RPv
 wB8s38eRgn7/bBFn3tWgt/i09B2+IG6PbA8xpPzgMr0H83FvIX24djE4EtWiKDQ0vjYn
 /+sQ==
X-Gm-Message-State: AOJu0Yy3ZhmPp53KXQaZD/LLf0zWtzmshTzLl+bnzyVQctbLSiq8T/eZ
 syd4BiN/9rWrcYFdMDTP3sIrWbCZY00=
X-Google-Smtp-Source: AGHT+IHLns3lC32I6benBLbpJ6Hlsz32XZ6UGw/rGY55yDgM3FVE69qeVFxMLBOT20XypLsgalpZZQ==
X-Received: by 2002:a1c:7c08:0:b0:40b:5e21:ec48 with SMTP id
 x8-20020a1c7c08000000b0040b5e21ec48mr580589wmc.122.1701614844840; 
 Sun, 03 Dec 2023 06:47:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay31-20020a05600c1e1f00b004080f0376a0sm11842172wmb.42.2023.12.03.06.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 06:47:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 15:47:22 +0100
Message-ID: <20231203144722.1942484-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701614845; x=1702219645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j9zJAzQ84O33ZUcvtt12dbZ5GjTBjNb/I6szzROmH14=;
 b=FaKWLNJnTZST7ymn4SuYXwyWvBSz9BHofRUhxgxKpqqKLTNCp1ef6k9iln4TKXcPiR
 7B3Ti9hrO8ZRAalqYSwldtPSv+S7wRxDaJGAm96f4pOix6lTW6Zr1R8Y9kJLHSx/oDa9
 d1jhVy47046qE8rqveXslJSaPUdRiVhTELWJC3hxBuHLRK1nVrX+c/IEKpRlCCb6dYKU
 3yEK82gSGhh7TopPM9i8tBpKQnEpH+WZ24W7Tx22UFNgHYi42I64fdFicxOVlHsIuLuV
 gd5c/iIdb7536M2h2APjq6rlCNtiXIDg+0fw9lWM6WgUcyuuWvZvW7VOhi9dW6LJESX/
 Watw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FaKWLNJn
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc >= 12
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
 ...ib-psos-task.c-fix-build-with-gcc-12.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch

diff --git a/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch b/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch
new file mode 100644
index 0000000000..52200dcbcb
--- /dev/null
+++ b/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch
@@ -0,0 +1,55 @@
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
