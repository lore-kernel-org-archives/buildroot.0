Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60816C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170F0402E9;
	Sun,  6 Feb 2022 14:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1L49qkfoK8M; Sun,  6 Feb 2022 14:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32ED64028C;
	Sun,  6 Feb 2022 14:50:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61A6C1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D52560B64
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CF3ha5Mbe5KW for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:50:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CDEF60681
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:50:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E4E9A82BA0; Sun,  6 Feb 2022 14:42:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:49:37 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 728ece090b894a9404d4944b453b78738774d721
X-Git-Newrev: b7dadab3e1c602fc98ad112ea622a3152862aead
X-Patchwork-Hint: ignore
Message-Id: <20220206144251.E4E9A82BA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] board/andes: fix build
 failure with host gcc >= 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7dadab3e1c602fc98ad112ea622a3152862aead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add patch to fix linux bug:
```
  HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status
```

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478164

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3529e8c21c939d73cc0090cb41c17b02db5b1013)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Remove-redundant-YYLOC-global-declaratio.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 0000000000..71ae991816
--- /dev/null
+++ b/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
@@ -0,0 +1,52 @@
+From f9df4186c17d686f1ca38f973d7a3a49e8e37c01 Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
+
+gcc 10 will default to -fno-common, which causes this error at link
+time:
+
+  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
+
+This is because both dtc-lexer as well as dtc-parser define the same
+global symbol yyloc. Before with -fcommon those were merged into one
+defintion. The proper solution would be to to mark this as "extern",
+however that leads to:
+
+  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
+   26 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+In file included from dtc-lexer.l:24:
+dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
+  127 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+cc1: all warnings being treated as errors
+
+which means the declaration is completely redundant and can just be
+dropped.
+
+Signed-off-by: Dirk Mueller <dmueller@suse.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[robh: cherry-pick from upstream]
+Cc: stable@vger.kernel.org
+Signed-off-by: Rob Herring <robh@kernel.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index 06c040902444..d1b3810156c7 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
