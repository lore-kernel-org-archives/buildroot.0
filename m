Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAD8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CB4419AE;
	Sat, 28 May 2022 20:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GH_v4VdtFE3e; Sat, 28 May 2022 20:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C194199D;
	Sat, 28 May 2022 20:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B836C1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A69524199D
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLfnOQGLT_5M for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:10:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EEAA41999
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5061085FAB; Sat, 28 May 2022 19:59:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 22:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13c7db8716efffeb11b13e06087f4105010803be
X-Git-Newrev: 6891d182b7761a9259423acbeb2488c21d53fdc4
X-Patchwork-Hint: ignore
Message-Id: <20220528195904.5061085FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libostree: fix build without
 systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=6891d182b7761a9259423acbeb2488c21d53fdc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without systemd raised since bump to
version 2022.03 in commit 0eb073ca2ba89dad2e531644fd33f693d228ef94:

src/libostree/ostree-sysroot-deploy.c: In function 'child_setup_fchdir':
src/libostree/ostree-sysroot-deploy.c:2837:19: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
 2837 |   int fd = (int) (uintptr_t) data;
      |                   ^~~~~~~~~
      |                   intptr_t

Fixes:
 - http://autobuild.buildroot.org/results/c134d849e7942911cb6bd13869dd2f3aefd8c21c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...deploy-add-a-missing-include-for-stdint-h.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
new file mode 100644
index 0000000000..35f92c37ff
--- /dev/null
+++ b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
@@ -0,0 +1,24 @@
+From 4b7fc4f1e90bbeac89d2f939cde3070e69b4787a Mon Sep 17 00:00:00 2001
+From: Luca BRUNO <luca.bruno@coreos.com>
+Date: Fri, 6 May 2022 10:07:23 +0000
+Subject: [PATCH] lib/ostree-sysroot-deploy: add a missing include for stdint.h
+
+[Retrieved from:
+https://github.com/ostreedev/ostree/commit/4b7fc4f1e90bbeac89d2f939cde3070e69b4787a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/libostree/ostree-sysroot-deploy.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
+index 404f336fb5..96cc07531e 100644
+--- a/src/libostree/ostree-sysroot-deploy.c
++++ b/src/libostree/ostree-sysroot-deploy.c
+@@ -22,6 +22,7 @@
+ #include <gio/gunixinputstream.h>
+ #include <gio/gunixoutputstream.h>
+ #include <glib-unix.h>
++#include <stdint.h>
+ #include <sys/mount.h>
+ #include <sys/statvfs.h>
+ #include <sys/socket.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
