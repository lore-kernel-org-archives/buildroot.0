Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4332C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73AAF80BBB;
	Sun,  4 Dec 2022 22:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73AAF80BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sw12FftXTzNv; Sun,  4 Dec 2022 22:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A974D80B8C;
	Sun,  4 Dec 2022 22:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A974D80B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 216EB1BF599
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 22:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E986D40134
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 22:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E986D40134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPUNvgD0in-C for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 22:38:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD58340129
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD58340129
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 22:38:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n7so7516387wms.3
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 14:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l0PCuaq8PBJEG/VIClm2gJ3U3c4cOifqHAp6ECYtBGw=;
 b=MlbX9j3tIJrHAFJ6ObN85BHIQH222Cyb5HpNtkregsKaYLNV89XHkB/08EyhpEoAi4
 h/ZqYnXU38eqjLQQj3x5bfvVknx3GKpwBTMB/zhLL7cRB8Hnt1jTU906d73JI4qV3ulv
 2osKp3IkpDSD9jlSTGT0SoeFqVaw/j1eFTsPquUZD6cyKTocIqPBXcggZTHRLecINunU
 nDqVBKidIagLTMTwFuViQIW7L4Z1pkJ1mL5HEyzDZr9nHBfozt+V+SVYzIqKqFuahSnp
 yn9NqvcA1SKb43tjO5ZqKFk+upOclTOOiuUaFhqflMQLtbRukiJhUUEzPiq+l9JMuqoK
 9gMw==
X-Gm-Message-State: ANoB5pmBjvvKOxHOByVxD/Yif0orh145N2WCBUF8BYcLB8BS33w5q0UA
 XAML1EzG+MffVm+B/45Y3fUMlAYFkyo=
X-Google-Smtp-Source: AA0mqf58/ujLUdpJ4JlEwaEJWCq8UR1Fws4Htf5YHY00Be+oeALLczN+lZxkTvKfSuGt7Pcg4gqAEw==
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id
 m21-20020a05600c4f5500b003cf729bd4b4mr52880986wmq.48.1670193505658; 
 Sun, 04 Dec 2022 14:38:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c424800b003c5571c27a1sm18392871wmm.32.2022.12.04.14.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 14:38:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 23:38:21 +0100
Message-Id: <20221204223821.589076-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l0PCuaq8PBJEG/VIClm2gJ3U3c4cOifqHAp6ECYtBGw=;
 b=BYGJGVYD2Xzv0taPbIjMcUMo1llN81HWWgzuNIMffKXddtKLm1BMZ54JlJmfhtyrqs
 VGuWN2rYpxy3kC4QtNFqD7v86Flo7mA6gueIS7VfCmEQ6sEYraGUpPvb6sP25eBuWAar
 uN6+U9/OL5gxCCzdstZ3o5PhpzdUx4XyvVCNGLIzoSfqdUeSuQ88muGhCff085ud4IKX
 5OCZgUUkCFh9vnXHHPv0xdYhpynnZBO0VwTbBMxppOVXlW8FmFNN3tKxDrBoryyzEWBn
 Cv+xMvUdWIi3LGVFePbW6/OAHDSaRSgU/vnvTzDZQJucWLA5v+Rg7IfBN2Bk8fbTIM/Z
 gL9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BYGJGVYD
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix build with sys/pidfd.h
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with sys/pidfd.h raised since bump to
version 5.0.1 in commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:

In file included from ../src/lxc/utils.h:23,
                 from ../src/lxc/cgroups/cgfsng.c:51:
../src/lxc/process_utils.h:140:17: error: expected identifier before numeric constant
  140 | #define P_PIDFD 3
      |                 ^

Fixes:
 - http://autobuild.buildroot.org/results/c9ff42a921ca47f634f908bab80c80164c227a02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-detect-sys-pidfd.h-availability.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/lxc/0003-build-detect-sys-pidfd.h-availability.patch

diff --git a/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch b/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch
new file mode 100644
index 0000000000..3aa598407f
--- /dev/null
+++ b/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch
@@ -0,0 +1,55 @@
+From ef1e0607b82e27350c2d677d649c6a0a9693fd40 Mon Sep 17 00:00:00 2001
+From: Christian Brauner <brauner@kernel.org>
+Date: Tue, 9 Aug 2022 16:27:40 +0200
+Subject: [PATCH] build: detect sys/pidfd.h availability
+
+Fixes: #4176
+Signed-off-by: Christian Brauner (Microsoft) <christian.brauner@ubuntu.com>
+
+[Retrieved from:
+https://github.com/lxc/lxc/commit/ef1e0607b82e27350c2d677d649c6a0a9693fd40]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build             | 1 +
+ src/lxc/process_utils.h | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index f679aabbc8..e999542336 100644
+--- a/meson.build
++++ b/meson.build
+@@ -735,6 +735,7 @@ foreach tuple: [
+     ['sys/resource.h'],
+     ['sys/memfd.h'],
+     ['sys/personality.h'],
++    ['sys/pidfd.h'],
+     ['sys/signalfd.h'],
+     ['sys/timerfd.h'],
+     ['pty.h'],
+diff --git a/src/lxc/process_utils.h b/src/lxc/process_utils.h
+index 9c15b15741..ed84741d0e 100644
+--- a/src/lxc/process_utils.h
++++ b/src/lxc/process_utils.h
+@@ -15,6 +15,10 @@
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
++#if HAVE_SYS_PIDFD_H
++#include <sys/pidfd.h>
++#endif
++
+ #include "compiler.h"
+ #include "syscall_numbers.h"
+ 
+@@ -136,9 +140,11 @@
+ #endif
+ 
+ /* waitid */
++#if !HAVE_SYS_PIDFD_H
+ #ifndef P_PIDFD
+ #define P_PIDFD 3
+ #endif
++#endif
+ 
+ #ifndef CLONE_ARGS_SIZE_VER0
+ #define CLONE_ARGS_SIZE_VER0 64 /* sizeof first published struct */
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
