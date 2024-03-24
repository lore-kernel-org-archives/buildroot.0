Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD001C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7656640B26;
	Sun, 24 Mar 2024 17:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxa8UFPE6UmX; Sun, 24 Mar 2024 17:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8773C40B3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8773C40B3A;
	Sun, 24 Mar 2024 17:11:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6EC1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 254DE405A1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EXTa_Ozpiiu for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72B640554
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C72B640554
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B13AE83BB4; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 17:01:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f30f5e4f61e72a507df96bea1960a9388c780a82
X-Git-Newrev: 24e996d14d28decfb9863996456b6b2720939422
X-Patchwork-Hint: ignore
Message-Id: <20240324171116.B13AE83BB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: fix build without python
 interpreter
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24e996d14d28decfb9863996456b6b2720939422
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index eba37be9b7..2a51706b55 100644
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
