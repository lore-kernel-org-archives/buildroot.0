Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B88C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 718D1407E5;
	Mon, 25 Mar 2024 18:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV_5qKPBqIfg; Mon, 25 Mar 2024 18:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3614407F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3614407F3;
	Mon, 25 Mar 2024 18:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5363F1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A3F2819D1
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze1dOS_MkkgY for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E1BD81973
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E1BD81973
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BDF08043D; Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:04:57 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 02aa5bd419ce140356fc5b8515b7307d1fdc6687
X-Git-Newrev: 0cea473c1842ca3041a291a5818a94e29be95cd0
X-Patchwork-Hint: ignore
Message-Id: <20240325181756.3BDF08043D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/xvisor: fix build
 without python interpreter
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cea473c1842ca3041a291a5818a94e29be95cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failures on a system not providing the "python"
interpreter binary raised at least since bump to version 0.3.1 in commit
c4f8b8968770ecbf6444a5921c6472f126717626 and more probably
since the addition of the package in commit
e23ddf0c13e6d3b054782b86188396a0c2add1a5 and
https://github.com/xvisor/xvisor/commit/ba904b4066f4b375cb1ad76ca41570741dbec62e:

/bin/sh: line 1: /home/buildroot/autobuild/instance-2/output-1/build/xvisor-0.3.1/tools/scripts/d2c.py: cannot execute: required file not found

or

/bin/sh: /home/buildroot/instance-0/output-1/build/xvisor-0.3.2/tools/scripts/d2c.py: /usr/bin/python: bad interpreter: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/2e100bacc9e9face8351287e4c979c1729709d7b
 - http://autobuild.buildroot.org/results/5d8a08512db1b3095158753e3a7843b0fd6c9749

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 24e996d14d28decfb9863996456b6b2720939422)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...py-explicitly-use-the-python3-interpreter.patch | 35 ++++++++++++++++++++++
 package/xvisor/xvisor.mk                           |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch b/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
new file mode 100644
index 0000000000..349d4415e2
--- /dev/null
+++ b/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
@@ -0,0 +1,35 @@
+From 888c94e7a121d96aa88f84c58fe7e2bd771fc5ac Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 25 Aug 2023 21:56:37 +0200
+Subject: [PATCH] TOOLS: d2c.py: explicitly use the python3 interpreter
+
+When compiling Xvisor on a system not providing the "python"
+interpreter binary, compilation fails with output:
+
+    (d2c)       core/vio/keymaps/modifiers.c
+    /bin/sh: 1: /build/xvisor-0.3.2/tools/scripts/d2c.py: not found
+
+This commit fixes the issue following the PEP 394 recommendation:
+https://peps.python.org/pep-0394/
+
+It sets the "shebang" to `#! /usr/bin/env python3` to allow using other
+interpreters in the PATH, or virtual environment.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+
+Upstream: https://github.com/xvisor/xvisor/commit/888c94e7a121d96aa88f84c58fe7e2bd771fc5ac
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/scripts/d2c.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/scripts/d2c.py b/tools/scripts/d2c.py
+index b46a7bc468..daac4a5450 100755
+--- a/tools/scripts/d2c.py
++++ b/tools/scripts/d2c.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#! /usr/bin/env python3
+ #/**
+ # Copyright (c) 2013 Anup Patel.
+ # All rights reserved.
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index d7bb288ea8..3fa2b5d9bb 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-dtc host-flex
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3
 
 XVISOR_MAKE_TARGETS = all
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
