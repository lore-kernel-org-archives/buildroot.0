Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E15CC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48AA240CE7;
	Sat, 27 Jul 2024 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mr1URiO_HKFc; Sat, 27 Jul 2024 14:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4B7140CFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B7140CFF;
	Sat, 27 Jul 2024 14:18:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DABDA1BF8A8
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D438D40CD7
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vB_-l7dQ8MpE for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B790D40CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B790D40CE7
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:18:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F1B2875B9; Sat, 27 Jul 2024 14:18:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 16:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 127c42033590e73e3161852acd540a79c98d9f3d
X-Git-Newrev: c19a417674961fe6a10b566d600ceb6b4989ec8b
X-Patchwork-Hint: ignore
Message-Id: <20240727141808.9F1B2875B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnfs: fix build with gcc >= 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c19a417674961fe6a10b566d600ceb6b4989ec8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
