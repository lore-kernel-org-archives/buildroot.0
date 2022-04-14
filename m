Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A875FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED4683F0A;
	Thu, 14 Apr 2022 19:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4LiGmvUfnrq; Thu, 14 Apr 2022 19:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E49A83EF4;
	Thu, 14 Apr 2022 19:35:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09AED1C1190
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC0F560F8D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKFI66xOwAjG for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3022060E5E
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DAE8083C33; Thu, 14 Apr 2022 19:24:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:24:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a92509f50bb3eae972cf2f32cf3af38b2736413
X-Git-Newrev: 5b149694093a74402b1f41b5a8e16687cd19be05
X-Patchwork-Hint: ignore
Message-Id: <20220414192443.DAE8083C33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix build on kernel <
 4.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b149694093a74402b1f41b5a8e16687cd19be05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lsns unconditionally uses NS_GET_NSTYPE since version 2.38 and
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=de72df79d72fa906e71e2ac922d8745ff22deee5
which is only available since kernel 4.11 and
https://github.com/torvalds/linux/commit/e5ff5ce6e20ee22511398bb31fb912466cf82a36
resulting in the following build failure:

sys-utils/lsns.c: In function 'add_namespace_for_nsfd':
sys-utils/lsns.c:719:25: error: 'NS_GET_NSTYPE' undeclared (first use in this function)
  719 |  clone_type = ioctl(fd, NS_GET_NSTYPE);
      |                         ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...lsns-improve-dependence-on-NS_GET_-ioctls.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
new file mode 100644
index 0000000000..8e79b8d4d3
--- /dev/null
+++ b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
@@ -0,0 +1,34 @@
+From fc686823b008bc95e2ebe904c706a117a03e2754 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 6 Apr 2022 10:38:43 +0200
+Subject: lsns: improve dependence on NS_GET_ ioctls
+
+Fixes: http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e
+Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=fc686823b008bc95e2ebe904c706a117a03e2754]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sys-utils/lsns.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c
+index 1a7e9f333..75625b3a6 100644
+--- a/sys-utils/lsns.c
++++ b/sys-utils/lsns.c
+@@ -40,7 +40,9 @@
+ 
+ #ifdef HAVE_LINUX_NSFS_H
+ # include <linux/nsfs.h>
+-# define USE_NS_GET_API	1
++# if defined(NS_GET_NSTYPE) && defined(NS_GET_OWNER_UID)
++#  define USE_NS_GET_API	1
++# endif
+ #endif
+ 
+ #include "pathnames.h"
+-- 
+cgit 
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
