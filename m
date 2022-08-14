Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27DEC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 672C2404EE;
	Sun, 14 Aug 2022 19:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 672C2404EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8d0RiGG4-xJZ; Sun, 14 Aug 2022 19:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFEB4026F;
	Sun, 14 Aug 2022 19:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FFEB4026F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFCC81BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B97404026F
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97404026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yi1ThS_GdmZO for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:58:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4C9B4026D
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C9B4026D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 049B087595; Sun, 14 Aug 2022 19:43:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:51:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70db731a792f992f4ea8304a95a167c0c9203783
X-Git-Newrev: 8d7be66f70cccbaf61e5cb6b2414b9d9ce162f48
X-Patchwork-Hint: ignore
Message-Id: <20220814194359.049B087595@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpcast: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d7be66f70cccbaf61e5cb6b2414b9d9ce162f48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version
20211207 in commit ecf85b4ef58873e9acf749adedfbaa90baaaf3c0:

receivedata.c: In function 'findSlice':
receivedata.c:348:2: error: unknown type name 'ptrdiff_t'
  348 |  ptrdiff_t pos = slice - clst->slices;
      |  ^~~~~~~~~
receivedata.c:17:1: note: 'ptrdiff_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
   16 | #include "fec.h"
  +++ |+#include <stddef.h>
   17 |

Fixes:
 - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/udpcast/0001-fix-musl-build.patch | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/udpcast/0001-fix-musl-build.patch b/package/udpcast/0001-fix-musl-build.patch
new file mode 100644
index 0000000000..0e213b2793
--- /dev/null
+++ b/package/udpcast/0001-fix-musl-build.patch
@@ -0,0 +1,31 @@
+fix musl build
+
+Fix the following musl build failure:
+
+receivedata.c: In function 'findSlice':
+receivedata.c:348:2: error: unknown type name 'ptrdiff_t'
+  348 |  ptrdiff_t pos = slice - clst->slices;
+      |  ^~~~~~~~~
+receivedata.c:17:1: note: 'ptrdiff_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+   16 | #include "fec.h"
+  +++ |+#include <stddef.h>
+   17 | 
+
+Fixes:
+ - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/4MBES2CPUSUNIZTC7NXCQYS2GAE4DQSG/]
+
+diff '--color=auto' -Nura udpcast-20211207.orig/receivedata.c udpcast-20211207/receivedata.c
+--- udpcast-20211207.orig/receivedata.c	2022-08-13 21:48:06.226588614 +0200
++++ udpcast-20211207/receivedata.c	2022-08-13 21:48:40.242992238 +0200
+@@ -1,6 +1,7 @@
+ #include <assert.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <stddef.h>
+ #include <stdlib.h>
+ #include <sys/time.h>
+ #include <errno.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
