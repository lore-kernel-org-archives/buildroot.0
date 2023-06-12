Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B496CC7EE2F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A81481405;
	Mon, 12 Jun 2023 19:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A81481405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjZnndGfq7pZ; Mon, 12 Jun 2023 19:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFBB813F6;
	Mon, 12 Jun 2023 19:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EFBB813F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8A2E1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82053409F8
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 19:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82053409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id to4TPPInRFXK for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 19:38:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D4B7405D3
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D4B7405D3
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 19:38:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DFAE0D0FFB
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 19:26:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B91D6C0007;
 Mon, 12 Jun 2023 19:26:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1q8nBk-003bUA-NL; Mon, 12 Jun 2023 21:26:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 21:26:47 +0200
Message-Id: <20230612192648.859014-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bootgen: add patch to fix builds on
 machines with modern flex versions
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
http://autobuild.buildroot.net/results/293/2936d9b054269b7055e66ab5a7f7c1f7f4926d48/

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})

Fix it by using normal local includes (#include "") instead.

Notice: This was already fixed on master, but the cmdoptions.yy.cpp and
reginit.yy.cpp hunks were accidently dropped when the changes were squashed
for the 2023.1 release.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...n-machines-with-modern-flex-versions.patch | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
