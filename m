Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D3FA3740
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 09:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 588C881313;
	Tue, 25 Oct 2022 09:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 588C881313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZisyCnYuelvQ; Tue, 25 Oct 2022 09:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D5F812F6;
	Tue, 25 Oct 2022 09:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D5F812F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0922D1BF279
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 09:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8B5D4025F
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 09:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8B5D4025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ye_qCwNxoJtp for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 09:41:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42639400C4
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42639400C4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 09:41:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 12573D27F1
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 09:38:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58203E0003;
 Tue, 25 Oct 2022 09:37:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1onGNg-00Elq8-Vu; Tue, 25 Oct 2022 11:37:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 11:37:51 +0200
Message-Id: <20221025093752.3520434-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/booten: Fix build on machines with
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...x-build-on-machines-with-modern-flex.patch | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
