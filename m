Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13B3C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 290D3416EA;
	Wed,  1 May 2024 16:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQ85G7GKKuGH; Wed,  1 May 2024 16:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E513416EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E513416EC;
	Wed,  1 May 2024 16:27:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93B4C1BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B9D60BD9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js18byyM3lM4 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 16:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B3360BD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92B3360BD4
 for <buildroot@buildroot.org>; Wed,  1 May 2024 16:27:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C83586384; Wed,  1 May 2024 16:27:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 18:25:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07b7d8708d0c8302ad5407acf81df974050f0f5c
X-Git-Newrev: ebd44d7c5b8b4e24e401863bb779adea2ff3a226
X-Patchwork-Hint: ignore
Message-Id: <20240501162718.8C83586384@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: fix uclibc-ng build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebd44d7c5b8b4e24e401863bb779adea2ff3a226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...005-res-stasis-control.c-include-signal.h.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
