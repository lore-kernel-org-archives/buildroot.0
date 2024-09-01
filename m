Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6BFC54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C1B560777;
	Sun,  1 Sep 2024 09:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCpT_tWR4CyB; Sun,  1 Sep 2024 09:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C266060797
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C266060797;
	Sun,  1 Sep 2024 09:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1BEC1BF4E2
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B431409F6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Uqunvt6YJBG for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6073C40B35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6073C40B35
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA94F868A8; Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 10:51:01 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 141f1472a57f607dda7ff169f18d89d912993802
X-Git-Newrev: 16ec025f81cefbe20c76f9d32036809e6d12467e
X-Patchwork-Hint: ignore
Message-Id: <20240901090452.CA94F868A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libnfs: fix build
 with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=16ec025f81cefbe20c76f9d32036809e6d12467e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with gcc >= 14 which enables
-Werror=implicit-function-declaration
(https://gcc.gnu.org/gcc-14/porting_to.html):

nfs-stat.c: In function 'main':
nfs-stat.c:287:30: error: implicit declaration of function 'ctime' [-Wimplicit-function-declaration]
  287 |         printf("Access: %s", ctime( (const time_t *) &st.nfs_atime));
      |                              ^~~~~
nfs-stat.c:177:1: note: 'ctime' is defined in header '<time.h>'; this is probably fixable by adding '#include <time.h>'
  176 | #include <pwd.h>
  +++ |+#include <time.h>
  177 | char *uid_to_name(int uid)

Fixes:
 - http://autobuild.buildroot.org/results/73c3828a4e5d275ca0dfdd5b314494e2b00393c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c19a417674961fe6a10b566d600ceb6b4989ec8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-utils-nfs-stat.c-include-time.h.patch     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch b/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch
new file mode 100644
index 0000000000..649d84524c
--- /dev/null
+++ b/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch
@@ -0,0 +1,39 @@
+From 034205b6b3acd64f9c75010d8da27e2c9f1bc82f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 18:04:05 +0200
+Subject: [PATCH] utils/nfs-stat.c: include time.h
+
+Include time.h to fix the following build failure with gcc >= 14 which
+enables -Werror=implicit-function-declaration
+(https://gcc.gnu.org/gcc-14/porting_to.html):
+
+nfs-stat.c: In function 'main':
+nfs-stat.c:287:30: error: implicit declaration of function 'ctime' [-Wimplicit-function-declaration]
+  287 |         printf("Access: %s", ctime( (const time_t *) &st.nfs_atime));
+      |                              ^~~~~
+nfs-stat.c:177:1: note: 'ctime' is defined in header '<time.h>'; this is probably fixable by adding '#include <time.h>'
+  176 | #include <pwd.h>
+  +++ |+#include <time.h>
+  177 | char *uid_to_name(int uid)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/73c3828a4e5d275ca0dfdd5b314494e2b00393c8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/sahlberg/libnfs/commit/39e1ae0206fb519c551b48b0e6de57f3e764e886
+---
+ utils/nfs-stat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/nfs-stat.c b/utils/nfs-stat.c
+index 17ddb311..0ec33544 100644
+--- a/utils/nfs-stat.c
++++ b/utils/nfs-stat.c
+@@ -50,6 +50,7 @@ WSADATA wsaData;
+ #include <inttypes.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
++#include <time.h>
+ #include "libnfs.h"
+ #include "libnfs-raw.h"
+ #include "libnfs-raw-mount.h"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
