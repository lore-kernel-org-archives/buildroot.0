Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DCEEB64D7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6D14097F;
	Tue, 13 Jun 2023 21:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6D14097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOPmYXBvCseh; Tue, 13 Jun 2023 21:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F53417B8;
	Tue, 13 Jun 2023 21:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F53417B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BBEA1BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1333841827
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1333841827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hf-oUZqbzTfe for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:54:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 146E84097F
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 146E84097F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F28AA82DE8; Tue, 13 Jun 2023 21:54:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 23:53:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ea4f3b549512d7f25696aece1b3db029aa427b8
X-Git-Newrev: bf7b627174e1bbf82d59574cd2c64c930a0df976
X-Patchwork-Hint: ignore
Message-Id: <20230613215457.F28AA82DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: add patch to fix builds
 on machines with modern flex versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf7b627174e1bbf82d59574cd2c64c930a0df976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/293/2936d9b054269b7055e66ab5a7f7c1f7f4926d48/

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})

Fix it by using normal local includes (#include "") instead.

Notice: This was already fixed on master, but the cmdoptions.yy.cpp and
reginit.yy.cpp hunks were accidentally dropped when the changes were
squashed for the 2023.1 release.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lds-on-machines-with-modern-flex-versions.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch b/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch
new file mode 100644
index 0000000000..b13dd2b03b
--- /dev/null
+++ b/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch
@@ -0,0 +1,69 @@
+From 29a4e487527d109f517fc47a7c284b7732b27a10 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 12 Jun 2023 21:04:25 +0200
+Subject: [PATCH] Refix builds on machines with modern flex versions
+
+Bootgen embeds an old version of flex, but uses the system include syntax
+(#include <>) to reference it, causing conflicts on systems with the
+development headers for a modern flex version installed, leading to build
+issues like:
+
+../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
+../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
+
+http://autobuild.buildroot.net/results/293/2936d9b054269b7055e66ab5a7f7c1f7f4926d48/build-end.log
+
+Fix it by using normal local #include statements by:
+
+sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
+
+Notice: This was already fixed on master with:
+https://github.com/Xilinx/bootgen/pull/20
+
+Notice: The patch was not applied, instead a different patch with the same
+content was applied to master:
+https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed
+
+This patch was not applied to the xlnx_rel_v2023.1 branch, instead most
+of the content was included in:
+https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a
+
+But the cmdoptions.yy.cpp and reginit.yy.cpp hunks were accidently dropped:
+https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a#diff-e0287adb420dbecc112acdf7d4a1efba8ea6cbf06401e4e8679b8ffd22a091d8
+
+Upstream: https://github.com/Xilinx/bootgen/pull/24
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ cmdoptions.yy.cpp | 2 +-
+ reginit.yy.cpp    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
+index 38fed35..4e940ab 100644
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
+diff --git a/reginit.yy.cpp b/reginit.yy.cpp
+index d830734..dede473 100644
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
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
