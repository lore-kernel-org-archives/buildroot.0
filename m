Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1C7C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 15:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44513605FB;
	Wed,  1 May 2024 15:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qkta0ZNjxLNG; Wed,  1 May 2024 15:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3846160BD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3846160BD9;
	Wed,  1 May 2024 15:00:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 843C91BF83E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DBF960BD9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1nJOSwQcQPV for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 15:00:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B605605FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B605605FB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B605605FB
 for <buildroot@buildroot.org>; Wed,  1 May 2024 15:00:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so48292975e9.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 08:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714575646; x=1715180446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nSdjybKU0bdoldaTTIg7YzL44MjkPLgxflHF+2LcozA=;
 b=OwJKxvsNc0dny9xHXKTB83y6641cuITIkMv590IjfmQhv4mCc7Do1tgKIX8ePC5YnY
 myZS9CcMJe972JF2J0cGyW9dpzf2gnyoG4ONL+RUm9scBhDmQvUW9q3uPYldDYb4UYOO
 jrqe7urSKadwqNXF3JHxIax3CfZXUp91Ve4APYaR+vZ0iJKgb4fWXKx6Twi7aedHoaJa
 zo/VUsXJs552JtbvQbJfa38lACQAsEq49RbByjtYQqyvwRWg5lsYHXAJoEGenGNfFlS0
 PtmmG+x+Pli7QYusRaMnLX8wErlPEW0WUVXQD+kDTQGebFXm6ErDDzIuw0k2CITMtuhV
 njQQ==
X-Gm-Message-State: AOJu0YywlYjeNZrVkYVjEwPXyDul5IW21YwztExgEq3JpxuAxh6vDB2W
 ktzWb2ldxK8iBcK78+b8T4S/gUvh2gzAQ0x4pZYJOMPq1jPP4H+MgiaRog==
X-Google-Smtp-Source: AGHT+IGyX05dnpZoHPkqyAJxoxos1P2p9A71uO6CteAce1xbXml7Ass4Ok5jQ94UKNYHaaB0xFmQ1g==
X-Received: by 2002:a05:600c:46ca:b0:41a:a4d1:a896 with SMTP id
 q10-20020a05600c46ca00b0041aa4d1a896mr1831563wmo.16.1714575645512; 
 Wed, 01 May 2024 08:00:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 bi15-20020a05600c3d8f00b0041c24321934sm2447737wmb.41.2024.05.01.08.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:00:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 17:00:42 +0200
Message-ID: <20240501150042.281549-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714575646; x=1715180446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nSdjybKU0bdoldaTTIg7YzL44MjkPLgxflHF+2LcozA=;
 b=Azv49Pclx8R7muJi5baa9kJg30l7DNGQKjPj3ga1kCwh12tS1ot/I0XwYNygJEdALM
 cq7cPb8HkSars4GMAvkZqW09x3n6xRe70aeTaTxQ+KoiKyFs8hAgVy/NrTBdzKAIogKa
 m54Pfi49Z3rxIJlR4H6LPINaKSYY9LON+8TJG4jNwDFM68wOXNycCJsS/Xw3D9FbCHuS
 GPtoj/Xva0/ljSVZ+qAJ5QZGJDgMqk54kZ3ZCcAUbsxRcYAh0n3lpfQRaG+d5yfY77Kx
 +W9tZpvFRI1DSWE2T/i8W869z7ArMD+x3C8RPPkPqq+ihdArgiER/HpaX3F3rV030Dun
 NvbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Azv49Pcl
Subject: [Buildroot] [PATCH 1/1] package/asterisk: fix uclibc-ng build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc-ng build failure raised since bump to version
20.7.0 in commit 0e6d4d2171ce70d3aa6693f860a36ff08fc4d2b3 and
https://github.com/asterisk/asterisk/commit/2694792e13c7f3ab1911c4a69fba0df32c544177:

stasis/control.c: In function 'exec_command_on_condition':
stasis/control.c:313:3: warning: implicit declaration of function 'pthread_kill'; did you mean 'pthread_yield'? [-Wimplicit-function-declaration]
  313 |   pthread_kill(control->control_thread, SIGURG);
      |   ^~~~~~~~~~~~
      |   pthread_yield
stasis/control.c:313:41: error: 'SIGURG' undeclared (first use in this function)
  313 |   pthread_kill(control->control_thread, SIGURG);
      |                                         ^~~~~~

Fixes: 0e6d4d2171ce70d3aa6693f860a36ff08fc4d2b3
 - http://autobuild.buildroot.org/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...es-stasis-control.c-include-signal.h.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/asterisk/0005-res-stasis-control.c-include-signal.h.patch

diff --git a/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch b/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
new file mode 100644
index 0000000000..fc615c4a19
--- /dev/null
+++ b/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
@@ -0,0 +1,43 @@
+From 8391dc3891337ecff8becefe1927a30d3922b848 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 1 May 2024 16:50:50 +0200
+Subject: [PATCH] res/stasis/control.c: include signal.h
+
+Include signal.h to avoid the following build failure with uclibc-ng
+raised since
+https://github.com/asterisk/asterisk/commit/2694792e13c7f3ab1911c4a69fba0df32c544177:
+
+stasis/control.c: In function 'exec_command_on_condition':
+stasis/control.c:313:3: warning: implicit declaration of function 'pthread_kill'; did you mean 'pthread_yield'? [-Wimplicit-function-declaration]
+  313 |   pthread_kill(control->control_thread, SIGURG);
+      |   ^~~~~~~~~~~~
+      |   pthread_yield
+stasis/control.c:313:41: error: 'SIGURG' undeclared (first use in this function)
+  313 |   pthread_kill(control->control_thread, SIGURG);
+      |                                         ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/asterisk/asterisk/pull/728
+---
+ res/stasis/control.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/res/stasis/control.c b/res/stasis/control.c
+index 360f20790..4ed0e2af1 100644
+--- a/res/stasis/control.c
++++ b/res/stasis/control.c
+@@ -41,6 +41,8 @@
+ #include "asterisk/musiconhold.h"
+ #include "asterisk/app.h"
+ 
++#include <signal.h>
++
+ AST_LIST_HEAD(app_control_rules, stasis_app_control_rule);
+ 
+ /*!
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
