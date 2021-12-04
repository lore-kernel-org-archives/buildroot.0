Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C54C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 12:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF8A083F7B;
	Sat,  4 Dec 2021 12:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMP7DRyHy-TI; Sat,  4 Dec 2021 12:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E822383F79;
	Sat,  4 Dec 2021 12:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1EA1BF30A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B8A5405FB
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDWoKLH2QLN3 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 12:37:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3941F4028D
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 12:37:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E268B884F1; Sat,  4 Dec 2021 12:32:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 13:36:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99d2826e039858b749504cb53e713e8b53664b39
X-Git-Newrev: 6950e10d9306e4475fd63060b0b14455784f9fdb
X-Patchwork-Hint: ignore
Message-Id: <20211204123248.E268B884F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix uclibc-ng and musl build
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
Content-Type: multipart/mixed; boundary="===============0254122188151052992=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0254122188151052992==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6950e10d9306e4475fd63060b0b14455784f9fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on uclibc-ng and musl raised since bump
to version 6.1.0 in commit 33c69c02fb4c1176584d1e2dd336b74ed39f5d65:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                     ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/6d102f005cfaeba582a78a11460bf38014f56bf9
 - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0004-block-export-fuse.c-fix-musl-build.patch  | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/qemu/0004-block-export-fuse.c-fix-musl-build.patch b/package/qemu/0004-block-export-fuse.c-fix-musl-build.patch
new file mode 100644
index 0000000000..4856821843
--- /dev/null
+++ b/package/qemu/0004-block-export-fuse.c-fix-musl-build.patch
@@ -0,0 +1,49 @@
+From 304332039014679b809f606e2f227ee0fc43a451 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Oct 2021 11:52:09 +0200
+Subject: [PATCH] block/export/fuse.c: fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
+https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
+and avoid the following build failure on musl:
+
+../block/export/fuse.c: In function 'fuse_fallocate':
+../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
+      |                     ^~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b
+
+Fixes: 50482fda98b ("block/export/fuse.c: fix musl build")
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Message-Id: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+[Retrieved from:
+https://gitlab.com/qemu-project/qemu/-/commit/304332039014679b809f606e2f227ee0fc43a451]
+---
+ block/export/fuse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/block/export/fuse.c b/block/export/fuse.c
+index 2e3bf8270b..823c126d23 100644
+--- a/block/export/fuse.c
++++ b/block/export/fuse.c
+@@ -31,6 +31,10 @@
+ #include <fuse.h>
+ #include <fuse_lowlevel.h>
+ 
++#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
++#include <linux/falloc.h>
++#endif
++
+ #ifdef __linux__
+ #include <linux/fs.h>
+ #endif
+-- 
+GitLab
+

--===============0254122188151052992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0254122188151052992==--
