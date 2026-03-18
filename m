Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406091077606
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A8B60A64;
	Wed, 18 Mar 2026 18:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bbc4CmYnrcQz; Wed, 18 Mar 2026 18:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12ADA60AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773858593;
	bh=Vk0Dp3lI7sYuC+n1DUGji7tr8bAgi/B0ZwSpvmP/J/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c0Gcn3gtSBqL469JxO50A5I6RCajpAUT+HfjpYEUNa5KIUwSfoJO+pM5g34NMmgfC
	 3KgTuzsnk9JFLMCLfS3SFGkNauqQD//AYqKrHrlMY7EraC76Vc9V7hdfG42lNG8ZaZ
	 oteLvXZcdETIcZRX1jHubOwSTxf7czaptQeENjMMTOejXk0nn0roen4uKyMzl33J49
	 L9oq/LA2b6aiCHNWqnL21vLmKvVzsneimv/+uWK/M6W+eXWljCqEW5KfE0q+iyH0QY
	 SsrqQtLBU/958svkdwPpAza59c6AS94TM5b5QzMfbPP1TIthXkqZm26di4b2QSjhiv
	 We3/da8BFZ4hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12ADA60AC7;
	Wed, 18 Mar 2026 18:29:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5DF41B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B75A860AC7
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzKblSlip3SP for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E606C60A64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E606C60A64
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8076884AC5; Wed, 18 Mar 2026 18:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 19:11:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c475011a82c32d465603c4cf73078a4e631a448
X-Git-Newrev: 75f62dc6693abd7f3880a75bd22b43e0ef74e12e
X-Patchwork-Hint: ignore
Message-Id: <20260318182146.8076884AC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: fix build issue if
 host-flex already built
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75f62dc6693abd7f3880a75bd22b43e0ef74e12e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix a silent build issue with the host-bootgen package if host-flex is already
built. The host-flex package will install a version of the flexlexer.h header
file that is not compatible with the version embedded in bootgen.

While the build will still 'succeed', the binary will not be correct. This
can be seen by just running the binary that is built. By default, running
bootgen without any parameters should print the help menu, but if the wrong
version of flexlexer.h is used, it will print the following instead:

$ output/host/bin/bootgen

****** Bootgen v2025.1-Merged
  **** Build date : Mar 18 2026-07:08:01
    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.

ERROR: syntax error
-h

Add a patch to the bootgen package that corrects the issue.

Upstream: CR to AMD jira

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Steven J. Hill <steven.hill@collins.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...exer-use-embedded-win_include-flexlexer.h.patch | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
new file mode 100644
index 0000000000..1de9a91223
--- /dev/null
+++ b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
@@ -0,0 +1,76 @@
+From dfe45e10791a171c3c79699257d3d3a978ec30eb Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 18 Mar 2026 09:51:58 +0000
+Subject: [PATCH] flexlexer: use embedded win_include/flexlexer.h
+
+bootgen embeds an old version of flex. If the host machine has a newer version
+of flex, the bootgen binary that is built will have errors such as the
+following, if the wrong version of flexlexer.h is used.
+
+$ output/host/bin/bootgen
+
+****** Bootgen v2025.1-Merged
+  **** Build date : Mar 18 2026-07:08:01
+    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
+    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
+
+ERROR: syntax error
+-h
+
+Running the bootgen binary should print the help menu by default and should
+not have a syntax error.
+
+Correct the path to the flexlexer.h header files, such that no host version
+of these files can cause a silent build failure.
+
+Upstream: CR to AMD jira
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ common/include/bifscanner.h        | 2 +-
+ common/include/cmdoptionsscanner.h | 2 +-
+ common/include/reginitscanner.h    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common/include/bifscanner.h b/common/include/bifscanner.h
+index 9683416..9aa72a5 100755
+--- a/common/include/bifscanner.h
++++ b/common/include/bifscanner.h
+@@ -29,7 +29,7 @@
+ #if ! defined(yyFlexLexerOnce)
+ #undef yyFlexLexer
+ #define yyFlexLexer bifFlexLexer
+-#include "FlexLexer.h"
++#include "../../win_include/FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+diff --git a/common/include/cmdoptionsscanner.h b/common/include/cmdoptionsscanner.h
+index aa2f474..78fa7cf 100755
+--- a/common/include/cmdoptionsscanner.h
++++ b/common/include/cmdoptionsscanner.h
+@@ -30,7 +30,7 @@
+ 
+ #undef yyFlexLexer
+ #define yyFlexLexer reginitFlexLexer
+-#include "FlexLexer.h"
++#include "../../win_include/FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+diff --git a/common/include/reginitscanner.h b/common/include/reginitscanner.h
+index 74463e6..d8152a6 100755
+--- a/common/include/reginitscanner.h
++++ b/common/include/reginitscanner.h
+@@ -30,7 +30,7 @@
+ 
+ #undef yyFlexLexer
+ #define yyFlexLexer reginitFlexLexer
+-#include "FlexLexer.h"
++#include "../../win_include/FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
