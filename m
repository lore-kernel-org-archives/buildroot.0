Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC2DC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9274F40840;
	Thu, 12 Jun 2025 08:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPpFoIbb7O7a; Thu, 12 Jun 2025 08:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AF9407E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AF9407E3;
	Thu, 12 Jun 2025 08:41:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6021E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51440421BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUIFmZaYWdQ2 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72890421E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72890421E3
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F528811D1; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 21:33:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ef3504f49871c14bcf96dbb4258d17ec5bd903f
X-Git-Newrev: ad327ba29e998e67be5c8e173b288174a6b3bbe4
X-Patchwork-Hint: ignore
Message-Id: <20250612083835.6F528811D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: Re-apply fix build on
 machines with modern flex
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad327ba29e998e67be5c8e173b288174a6b3bbe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With bootgen 2025.1, the directory structure was re-done.  In the process of
doing this, the source files in the bisonflex directory lost the fix below
which had been applied on an earlier version of bootgen for the issue below.

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})

Fix it by using normal local #include statements by:

sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

This patch re-adds the patch to fix this to buildroot.

Fixes: https://autobuild.buildroot.org/results/056384322246877253cd8d0781717ce495cbe769/
Upstream: patch submitted to AMD internal jira process

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-By: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ex-Fix-build-on-machines-with-modern-flex.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
new file mode 100644
index 0000000000..6d048e9bd9
--- /dev/null
+++ b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
@@ -0,0 +1,72 @@
+From e7e341b7ba6fa9fb875718e8740b03c2041278e8 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 2 Jun 2025 12:09:13 +0100
+Subject: [PATCH] bisonflex: Fix build on machines with modern flex
+
+With bootgen 2025.1, the directory structure was re-done.  In the process of
+doing this, the source files in the bisonflex directory lost the fix below
+which had been applied on an earlier version of bootgen:
+
+Bootgen embeds an old version of flex, but uses the system include syntax
+(#include <>) to reference it, causing conflicts on systems with the
+development headers for a modern flex version installed, leading to build
+issues like:
+
+../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
+../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})
+
+Fix it by using normal local #include statements by:
+
+sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
+
+Upstream: submitted to AMD internal jira process
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ bisonflex/bif.yy.cpp        | 2 +-
+ bisonflex/cmdoptions.yy.cpp | 2 +-
+ bisonflex/reginit.yy.cpp    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bisonflex/bif.yy.cpp b/bisonflex/bif.yy.cpp
+index 8d4d364..35f0aa5 100755
+--- a/bisonflex/bif.yy.cpp
++++ b/bisonflex/bif.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/bisonflex/cmdoptions.yy.cpp b/bisonflex/cmdoptions.yy.cpp
+index 661d7f3..a76ac81 100755
+--- a/bisonflex/cmdoptions.yy.cpp
++++ b/bisonflex/cmdoptions.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/bisonflex/reginit.yy.cpp b/bisonflex/reginit.yy.cpp
+index d830734..dede473 100755
+--- a/bisonflex/reginit.yy.cpp
++++ b/bisonflex/reginit.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
