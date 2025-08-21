Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F7ECA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DDC617A2;
	Thu, 21 Aug 2025 18:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71hZgBP9h3oM; Thu, 21 Aug 2025 18:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B596178C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B596178C;
	Thu, 21 Aug 2025 18:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A00E1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 702FC845F1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di1_xdTCmeqZ for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2958842DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2958842DA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 935FD813AF; Thu, 21 Aug 2025 18:57:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:41:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7e67a0b99baadf321feacc7870bdc3e8bac3a0ae
X-Git-Newrev: 30d84a9927b58bcf9bdd0190cfebd289741309ed
X-Patchwork-Hint: ignore
Message-Id: <20250821185703.935FD813AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bcusdk: fix build
 w/ gcc-14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30d84a9927b58bcf9bdd0190cfebd289741309ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When using gcc-14 the compilation fails with the following error
message:

```
close.c: In function 'EIBClose':
close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   38 |   close (con->fd);
      |   ^~~~~
      |   pclose
openlocal.c: In function 'EIBSocketLocal':
openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   57 |       close (con->fd);
      |       ^~~~~
      |       pclose
make[6]: *** [Makefile:611: close.lo] Error 1
```

This patch include <unistd.h> to include the declaration of close.

Fixes: https://autobuild.buildroot.org/results/483/483fc4584815507c3798eb972e22e51f70f52c23/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14955941e23f88259b06038633353eb7061b532d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0005-include-unistd-for-close-declaration.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/bcusdk/0005-include-unistd-for-close-declaration.patch b/package/bcusdk/0005-include-unistd-for-close-declaration.patch
new file mode 100644
index 0000000000..c05a68d9a3
--- /dev/null
+++ b/package/bcusdk/0005-include-unistd-for-close-declaration.patch
@@ -0,0 +1,70 @@
+From 7fe256a6e3b28e3ca5c163e38844c9e7c05099c1 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Tue, 12 Aug 2025 18:43:26 +0200
+Subject: [PATCH] include unistd for close declaration
+
+When using gcc-14 the compilation fails with the following error
+message:
+
+```
+close.c: In function 'EIBClose':
+close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+   38 |   close (con->fd);
+      |   ^~~~~
+      |   pclose
+openlocal.c: In function 'EIBSocketLocal':
+openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+   57 |       close (con->fd);
+      |       ^~~~~
+      |       pclose
+make[6]: *** [Makefile:611: close.lo] Error 1
+```
+
+This patch include <unistd.h> to include the declaration of close.
+
+Upstream: https://sourceforge.net/p/bcusdk/patches/6/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ eibd/client/c/close.c      | 1 +
+ eibd/client/c/openlocal.c  | 1 +
+ eibd/client/c/openremote.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/eibd/client/c/close.c b/eibd/client/c/close.c
+index 900fcd8..f7508bb 100644
+--- a/eibd/client/c/close.c
++++ b/eibd/client/c/close.c
+@@ -24,6 +24,7 @@
+     along with this program; if not, write to the Free Software
+     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
++#include <unistd.h>
+ 
+ #include "eibclient-int.h"
+ 
+diff --git a/eibd/client/c/openlocal.c b/eibd/client/c/openlocal.c
+index c7fd5d7..df2e9f9 100644
+--- a/eibd/client/c/openlocal.c
++++ b/eibd/client/c/openlocal.c
+@@ -27,6 +27,7 @@
+ 
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <unistd.h>
+ 
+ #include "eibclient-int.h"
+ 
+diff --git a/eibd/client/c/openremote.c b/eibd/client/c/openremote.c
+index 24d7ecd..9b2be39 100644
+--- a/eibd/client/c/openremote.c
++++ b/eibd/client/c/openremote.c
+@@ -30,6 +30,7 @@
+ #include <netinet/in.h>
+ #include <netinet/tcp.h>
+ #include <netdb.h>
++#include <unistd.h>
+ 
+ #include "eibclient-int.h"
+ 
+-- 
+2.50.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
