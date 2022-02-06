Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDDDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 18:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EABD960B75;
	Sun,  6 Feb 2022 18:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wv7jjfvGNYj; Sun,  6 Feb 2022 18:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2012C60ABE;
	Sun,  6 Feb 2022 18:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E77A1BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 18:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D5948176D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 18:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ug7zFdP9Mqlc for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 18:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A4D8176B
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 18:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9156C82BDA; Sun,  6 Feb 2022 18:40:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 19:31:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d409fe085663194cbe23fbbfef38f566c4910bb8
X-Git-Newrev: b42e87772a995b19913822b810f876a5890d2369
X-Patchwork-Hint: ignore
Message-Id: <20220206184009.9156C82BDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/test_tool.py: fix
 expectation
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

commit: https://git.buildroot.net/buildroot/commit/?id=b42e87772a995b19913822b810f876a5890d2369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While committing the shellcheck feature, it was changed to output the
full shellcheck output even at verbosity level 1. However, the
expectation of the shellcheck test was not updated accordingly.

Do that now, simply merging all the shellcheck output in a single
string.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/test_tool.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index 38029297a5..a0bf88001d 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -71,9 +71,9 @@ Shellcheck = [
      'empty.sh',
      '',
      ["dir/empty.sh:0: run 'shellcheck' and fix the warnings",
-      "In dir/empty.sh line 1:",
-      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.",
-      "For more information:",
+      "In dir/empty.sh line 1:\n"
+      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
+      "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y..."]),
     ('sh shebang',
      'sh-shebang.sh',
@@ -87,21 +87,21 @@ Shellcheck = [
      'unused.sh',
      'unused=""',
      ["dir/unused.sh:0: run 'shellcheck' and fix the warnings",
-      "In dir/unused.sh line 1:",
-      'unused=""',
-      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.",
-      "^----^ SC2034: unused appears unused. Verify use (or export if used externally).",
-      "For more information:",
-      "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y...",
+      "In dir/unused.sh line 1:\n"
+      'unused=""\n'
+      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
+      "^----^ SC2034: unused appears unused. Verify use (or export if used externally).\n"
+      "For more information:\n"
+      "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y...\n"
       "  https://www.shellcheck.net/wiki/SC2034 -- unused appears unused. Verify use..."]),
     ('tab',
      'tab.sh',
      '\t#!/bin/sh',
      ["dir/tab.sh:0: run 'shellcheck' and fix the warnings",
-      "In dir/tab.sh line 1:",
-      '\t#!/bin/sh',
-      "^-- SC1114: Remove leading spaces before the shebang.",
-      "For more information:",
+      "In dir/tab.sh line 1:\n"
+      '\t#!/bin/sh\n'
+      "^-- SC1114: Remove leading spaces before the shebang.\n"
+      "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC1114 -- Remove leading spaces before the ..."]),
     ]
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
