Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49836C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 13:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF638133D;
	Tue, 25 Oct 2022 13:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF638133D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUJLRbhishU0; Tue, 25 Oct 2022 13:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF2E81336;
	Tue, 25 Oct 2022 13:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCF2E81336
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3361BF94B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 13:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 266BB401BA
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 13:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 266BB401BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vRqf-BPJzNf for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 13:33:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2161401A2
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 13:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2161401A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAF1A87047; Tue, 25 Oct 2022 13:33:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 15:32:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f17b56f1aa43361eff4a81538a61e34c509ebb70
X-Git-Newrev: 6381ae865fb2ed8d7f840925610ded76774e25e7
X-Patchwork-Hint: ignore
Message-Id: <20221025133322.AAF1A87047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/booten: Fix build on machines with
 modern flex / host-flex
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

commit: https://git.buildroot.net/buildroot/commit/?id=6381ae865fb2ed8d7f840925610ded76774e25e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/3a8/3a8b66027cde3cdd9d02745381526d52bb626a78/

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})

Fix it by using normal local #include statements by:

sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

Patch submitted upstream: https://github.com/Xilinx/bootgen/pull/20

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Fix-build-on-machines-with-modern-flex.patch | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
new file mode 100644
index 0000000000..ea82f5e70c
--- /dev/null
+++ b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
@@ -0,0 +1,133 @@
+From 7251dce3dc974c7372e7024ade3e8a455266cfd2 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 18 Mar 2022 09:02:31 +0100
+Subject: [PATCH] Fix build on machines with modern flex
+
+Bootgen embeds an old version of flex, but uses the system include syntax
+(#include <>) to reference it, causing conflicts on systems with the
+development headers for a modern flex version installed, leading to build
+issues like:
+
+../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
+../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
+
+Fix it by using normal local #include statements by:
+
+sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Submitted upstream: https://github.com/Xilinx/bootgen/pull/20]
+---
+ FlexLexer.h         | 6 +++---
+ bif.yy.cpp          | 2 +-
+ bifscanner.h        | 2 +-
+ cmdoptions.yy.cpp   | 2 +-
+ cmdoptionsscanner.h | 2 +-
+ reginit.yy.cpp      | 2 +-
+ reginitscanner.h    | 2 +-
+ 7 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/FlexLexer.h b/FlexLexer.h
+index b115b5d..1c0386f 100755
+--- a/FlexLexer.h
++++ b/FlexLexer.h
+@@ -33,15 +33,15 @@
+ //
+ // If you want to create multiple lexer classes, you use the -P flag
+ // to rename each yyFlexLexer to some other xxFlexLexer.  You then
+-// include <FlexLexer.h> in your other sources once per lexer class:
++// include "FlexLexer.h" in your other sources once per lexer class:
+ //
+ //	#undef yyFlexLexer
+ //	#define yyFlexLexer xxFlexLexer
+-//	#include <FlexLexer.h>
++//	#include "FlexLexer.h"
+ //
+ //	#undef yyFlexLexer
+ //	#define yyFlexLexer zzFlexLexer
+-//	#include <FlexLexer.h>
++//	#include "FlexLexer.h"
+ //	...
+ 
+ #ifndef __FLEX_LEXER_H
+diff --git a/bif.yy.cpp b/bif.yy.cpp
+index 7dd0841..9e09267 100644
+--- a/bif.yy.cpp
++++ b/bif.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/bifscanner.h b/bifscanner.h
+index a6ec9e4..ded78da 100755
+--- a/bifscanner.h
++++ b/bifscanner.h
+@@ -28,7 +28,7 @@
+ #if ! defined(yyFlexLexerOnce)
+ #undef yyFlexLexer
+ #define yyFlexLexer bifFlexLexer
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
+index 6ee80de..1acfcce 100644
+--- a/cmdoptions.yy.cpp
++++ b/cmdoptions.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/cmdoptionsscanner.h b/cmdoptionsscanner.h
+index a48af09..e02c1f1 100755
+--- a/cmdoptionsscanner.h
++++ b/cmdoptionsscanner.h
+@@ -29,7 +29,7 @@
+ 
+ #undef yyFlexLexer
+ #define yyFlexLexer reginitFlexLexer
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+diff --git a/reginit.yy.cpp b/reginit.yy.cpp
+index 8422867..ff088f9 100644
+--- a/reginit.yy.cpp
++++ b/reginit.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/reginitscanner.h b/reginitscanner.h
+index 4e78af9..23177be 100755
+--- a/reginitscanner.h
++++ b/reginitscanner.h
+@@ -29,7 +29,7 @@
+ 
+ #undef yyFlexLexer
+ #define yyFlexLexer reginitFlexLexer
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
