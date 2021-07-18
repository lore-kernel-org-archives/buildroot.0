Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E966DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4AE6103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB4AE6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B30421EE;
	Tue,  3 Aug 2021 23:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBvofQbs1cKp; Tue,  3 Aug 2021 23:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 759B240609;
	Tue,  3 Aug 2021 23:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6120B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEC7640EAB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2IApsz_Snq9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10FEE40EAD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 65C1283FEF; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 13:50:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b5ba0119e858f0bdc2683f15dd7758eb08ed1f6a
X-Git-Newrev: 7bb4f886abfc227c704accbb880059bb8fc85064
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.65C1283FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sane-backends: fix
 uclibc compile due o missing stdarg.h include
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5934973866491398844=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5934973866491398844==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7bb4f886abfc227c704accbb880059bb8fc85064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add missing stdarg.h include for va_list/va_start/va_end.

Fixes:

  - http://autobuild.buildroot.net/results/88f4ea971875b1a5eb88662326d9343341eaaea2

  microtek.c: In function ‘MDBG_INIT’:
  microtek.c:163:3: error: unknown type name ‘va_list’
    163 |   va_list ap;
        |   ^~~~~~~
  microtek.c:78:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
     77 | #include "microtek.h"
    +++ |+#include <stdarg.h>
     78 |
  microtek.c:164:3: warning: implicit declaration of function ‘va_start’; did you mean ‘sane_start’? [-Wimplicit-function-declaration]
    164 |   va_start(ap, format);
        |   ^~~~~~~~
        |   sane_start
  microtek.c:165:54: warning: passing argument 4 of ‘vsnprintf’ makes pointer from integer without a cast [-Wint-conversion]
    165 |   vsnprintf(_mdebug_string, MAX_MDBG_LENGTH, format, ap);
        |                                                      ^~
        |                                                      |
        |                                                      int
  In file included from ../include/sane/sanei_config.h:50,
                   from microtek.c:70:
  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:359:57: note: expected ‘__va_list_tag *’ but argument is of type ‘int’
    359 |         const char *__restrict __format, __gnuc_va_list __arg)
        |                                          ~~~~~~~~~~~~~~~^~~~~
  microtek.c:166:3: warning: implicit declaration of function ‘va_end’ [-Wimplicit-function-declaration]
    166 |   va_end(ap);
        |   ^~~~~~

and

  sm3600-scanutil.c: In function ‘debug_printf’:
  sm3600-scanutil.c:69:3: error: unknown type name ‘va_list’
     69 |   va_list ap;
        |   ^~~~~~~
  sm3600-scanutil.c:48:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
     47 | #include "sm3600-scantool.h"
    +++ |+#include <stdarg.h>
     48 |
  sm3600-scanutil.c:75:3: warning: implicit declaration of function ‘va_start’; did you mean ‘sane_start’? [-Wimplicit-function-decla
ration]
     75 |   va_start(ap,szFormat);
        |   ^~~~~~~~
        |   sane_start
  sm3600-scanutil.c:76:28: warning: passing argument 3 of ‘vfprintf’ makes pointer from integer without a cast [-Wint-conversion]
     76 |   vfprintf(stderr,szFormat,ap);
        |                            ^~
        |                            |
        |                            int
  In file included from ../include/sane/sanei_config.h:50,
                   from sm3600.c:70:
  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:339:23: note: expected ‘__va_list_tag *’ but argument is of type
 ‘int’
    339 |        __gnuc_va_list __arg);
        |        ~~~~~~~~~~~~~~~^~~~~
  In file included from sm3600.c:94:
  sm3600-scanutil.c:77:3: warning: implicit declaration of function ‘va_end’ [-Wimplicit-function-declaration]
     77 |   va_end(ap);
        |   ^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rotek-fix-uclibc-compile-include-stdarg.h.patch | 58 +++++++++++++++++++++
 ...600-scanutil-fix-uclibc-compile-include-s.patch | 59 ++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch b/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
new file mode 100644
index 0000000000..c5af162469
--- /dev/null
+++ b/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
@@ -0,0 +1,58 @@
+From 145e16008e7479ea58278e55f71d6dfcd4db714b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 18 Jun 2021 19:51:45 +0200
+Subject: [PATCH] backend/microtek: fix uclibc compile (include stdarg.h for
+ va_list/va_start/va_end)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  microtek.c: In function ‘MDBG_INIT’:
+  microtek.c:163:3: error: unknown type name ‘va_list’
+    163 |   va_list ap;
+        |   ^~~~~~~
+  microtek.c:78:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
+     77 | #include "microtek.h"
+    +++ |+#include <stdarg.h>
+     78 |
+  microtek.c:164:3: warning: implicit declaration of function ‘va_start’; did you mean ‘sane_start’? [-Wimplicit-function-declaration]
+    164 |   va_start(ap, format);
+        |   ^~~~~~~~
+        |   sane_start
+  microtek.c:165:54: warning: passing argument 4 of ‘vsnprintf’ makes pointer from integer without a cast [-Wint-conversion]
+    165 |   vsnprintf(_mdebug_string, MAX_MDBG_LENGTH, format, ap);
+        |                                                      ^~
+        |                                                      |
+        |                                                      int
+  In file included from ../include/sane/sanei_config.h:50,
+                   from microtek.c:70:
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:359:57: note: expected ‘__va_list_tag *’ but argument is of type ‘int’
+    359 |         const char *__restrict __format, __gnuc_va_list __arg)
+        |                                          ~~~~~~~~~~~~~~~^~~~~
+  microtek.c:166:3: warning: implicit declaration of function ‘va_end’ [-Wimplicit-function-declaration]
+    166 |   va_end(ap);
+        |   ^~~~~~
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/microtek.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/backend/microtek.c b/backend/microtek.c
+index 200a69c1a..63560179c 100644
+--- a/backend/microtek.c
++++ b/backend/microtek.c
+@@ -57,6 +57,7 @@
+ 
+ #include "../include/sane/config.h"
+ 
++#include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+-- 
+2.31.1
+
diff --git a/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch b/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch
new file mode 100644
index 0000000000..0ea9de245e
--- /dev/null
+++ b/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch
@@ -0,0 +1,59 @@
+From 7dafc52dda96fa68f39058b10eec3d822fd5ea9d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 18 Jun 2021 19:56:56 +0200
+Subject: [PATCH] backend/sm3600-scanutil: fix uclibc compile (include stdarg.h
+ for va_list/va_start/va_end)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  sm3600-scanutil.c: In function ‘debug_printf’:
+  sm3600-scanutil.c:69:3: error: unknown type name ‘va_list’
+     69 |   va_list ap;
+        |   ^~~~~~~
+  sm3600-scanutil.c:48:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
+     47 | #include "sm3600-scantool.h"
+    +++ |+#include <stdarg.h>
+     48 |
+  sm3600-scanutil.c:75:3: warning: implicit declaration of function ‘va_start’; did you mean ‘sane_start’? [-Wimplicit-function-declaration]
+     75 |   va_start(ap,szFormat);
+        |   ^~~~~~~~
+        |   sane_start
+  sm3600-scanutil.c:76:28: warning: passing argument 3 of ‘vfprintf’ makes pointer from integer without a cast [-Wint-conversion]
+     76 |   vfprintf(stderr,szFormat,ap);
+        |                            ^~
+        |                            |
+        |                            int
+  In file included from ../include/sane/sanei_config.h:50,
+                   from sm3600.c:70:
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:339:23: note: expected ‘__va_list_tag *’ but argument is of type ‘int’
+    339 |        __gnuc_va_list __arg);
+        |        ~~~~~~~~~~~~~~~^~~~~
+  In file included from sm3600.c:94:
+  sm3600-scanutil.c:77:3: warning: implicit declaration of function ‘va_end’ [-Wimplicit-function-declaration]
+     77 |   va_end(ap);
+        |   ^~~~~~
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/sm3600-scanutil.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/backend/sm3600-scanutil.c b/backend/sm3600-scanutil.c
+index 6fe67ed0c..616bf3f4c 100644
+--- a/backend/sm3600-scanutil.c
++++ b/backend/sm3600-scanutil.c
+@@ -43,6 +43,7 @@ Userspace scan tool for the Microtek 3600 scanner
+ 
+ ====================================================================== */
+ 
++#include <stdarg.h>
+ #include <unistd.h>
+ #include "sm3600-scantool.h"
+ 
+-- 
+2.31.1
+

--===============5934973866491398844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5934973866491398844==--
