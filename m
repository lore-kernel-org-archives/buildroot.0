Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D4CC71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C4B40689;
	Sun, 15 Jun 2025 10:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAkR2yjkKKX1; Sun, 15 Jun 2025 10:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BC240594
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BC240594;
	Sun, 15 Jun 2025 10:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DCA51A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 429CD40548
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OffZXvXOu0-f for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0814052D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C0814052D
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39AB383750; Sun, 15 Jun 2025 10:06:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 11:29:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5c8736485f7e7d3623069ff10968dd17542422c
X-Git-Newrev: 92f23ce83ae0fa5b19f034ba6d1d5e7dcd073991
X-Patchwork-Hint: ignore
Message-Id: <20250615100636.39AB383750@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: fix path to local
 FlexLexer.h
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92f23ce83ae0fa5b19f034ba6d1d5e7dcd073991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With bootgen xilinx_v2025.1, the local FlexLexer.h file is not in the same
directory as the cpp files including it, so the previous patch used to solve
the issue below needs to be updated to find the local FlexLexer.h which is in
the win_include directory of bootgen version xilinx_v2025.1.
See upstream commit [1].

So this patch corrects the path for including the local FlexLexer.h header for
fixing the below issue.

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})

This build failure can also happen if the host-flex Buildroot package
is built before host-bootgen.

The failure can be reproduced, in the Buildroot docker reference image
with the commands:

    utils/docker-run
    make versal_vck190_defconfig
    make host-flex host-bootgen

Fix it by using normal local #include statements by:

sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *

Fixes: https://autobuild.buildroot.org/results/60220f94cca1bcca5667afcb2acffb5aacae048b

[1] https://github.com/Xilinx/bootgen/commit/86b862096bcbdb45d4ce1504ecfe90fb29f318a5#diff-0d754a86508dc8a894b72796966f332c0316942c5d5ab42ae6a0766dcfcb52dc

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
index 6d048e9bd9..817fee195e 100644
--- a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
+++ b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
@@ -17,7 +17,7 @@ issues like:
 
 Fix it by using normal local #include statements by:
 
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
+sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *
 
 Upstream: submitted to AMD internal jira process
 
@@ -37,7 +37,7 @@ index 8d4d364..35f0aa5 100755
  #define yytext_ptr yytext
  
 -#include <FlexLexer.h>
-+#include "FlexLexer.h"
++#include "../win_include/FlexLexer.h"
  
  int yyFlexLexer::yywrap() { return 1; }
  int yyFlexLexer::yylex()
@@ -50,7 +50,7 @@ index 661d7f3..a76ac81 100755
  #define yytext_ptr yytext
  
 -#include <FlexLexer.h>
-+#include "FlexLexer.h"
++#include "../win_include/FlexLexer.h"
  
  int yyFlexLexer::yywrap() { return 1; }
  int yyFlexLexer::yylex()
@@ -63,7 +63,7 @@ index d830734..dede473 100755
  #define yytext_ptr yytext
  
 -#include <FlexLexer.h>
-+#include "FlexLexer.h"
++#include "../win_include/FlexLexer.h"
  
  int yyFlexLexer::yywrap() { return 1; }
  int yyFlexLexer::yylex()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
