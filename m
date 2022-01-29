Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 23:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACEDF81435;
	Sat, 29 Jan 2022 23:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qytdxgpLTIPW; Sat, 29 Jan 2022 23:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA5E681422;
	Sat, 29 Jan 2022 23:14:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4CA1BF370
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 23:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDCD481422
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 23:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJweJS7mZ3_z for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 23:14:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38FA48140D
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 23:14:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DwvFn644tBBmwDwvFnaKqe; Sun, 30 Jan 2022 00:14:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643498062; bh=DO0vRICkFKlG49bOPUpDYGqEUGa0pwqz9nkxrObTPSI=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ar4p1Dy1zr2kaY1ChpddyiltanOZ/2KghTbtHk5/2rm6Idx5i94cga/hKlyJtgeah
 kleCNdZtrHm5YqX6kcAcxNlFzLqAoLRVi4+8Ps1a795+QuMvXjiX+mvqm7O9cY+WuQ
 95i7HV74cEP6cNlBYi2wLJ1neDNrO4X0YH6feKamxdG2KBMVN/V/dwT4BMIA+13ucF
 Q2AwF9JC7AWW9X+T1Hhc6MGp8dvhEl7Vh8xsYtmhR0L/j/yL8AB72O/N9qggBjsv9L
 Qxtrbi2Ric+goUeEk5X04hfGCbZ7Elt4iamep+OD6lxRucjy0BOJ0RyUBgYHBDAjXt
 YselwUoOu7a3A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 00:14:20 +0100
Message-Id: <20220129231420.3470589-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPLdmYjMl2RnsqorQSkd//YxLB9v3UuOS1d7irx8JqxPVlsxee6zZ1UX+ZSH8Mxc5RbDo2IgU1ESReH264yrQ2+ApYSgGw2IL8sxZVVw1QSlraE8DPTs
 htz13uPc0WcglbiSWRk3YTwI1k1dlOxnUdtWMpZKvZMQV6kps31QwZoEYAdkr0+IATYEsoxIZAfJW5gy9uQsnWeVNsgu/9fzPUXrWjYIyjqrXaPogFdCovsK
 A66KeFm/JR175uxdlDYc1dTQgCzBeAv8qbLc3FZGT4XVj7KuEGeD8JLdKHvkkFYV
Subject: [Buildroot] [PATCH] board/andes: fix build failure with host gcc >=
 10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Nylon Chen <nylon7@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch to fix linux bug:
```
  HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status
```

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478164

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ve-redundant-YYLOC-global-declaratio.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
