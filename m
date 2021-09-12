Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D633C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319A661056
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 319A661056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0251D60771;
	Sun, 12 Sep 2021 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWkAlQ7wI0de; Sun, 12 Sep 2021 20:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F91E60767;
	Sun, 12 Sep 2021 20:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4DE1BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6275381871
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxceyLndmY5S for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96D33818A7
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 94F418A4CB; Sun, 12 Sep 2021 20:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:44:47 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5c8f90820f1b6c75292352abff998ced45ab3ccf
X-Git-Newrev: 03593c71508bbfc05d4afffeee50fdae4be9778e
X-Patchwork-Hint: ignore
Message-Id: <20210912201458.94F418A4CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/qemu: fix
 fuse-lseek on uclibc-ng and musl
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03593c71508bbfc05d4afffeee50fdae4be9778e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure on uclibc-ng raised since bump to
version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9:

../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 52286188caceda0919b6c7a0f40b55a928ef4b48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch | 44 ++++++++++++++++++++++
 package/qemu/qemu.mk                               |  8 +---
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch b/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
new file mode 100644
index 0000000000..50762055bf
--- /dev/null
+++ b/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
@@ -0,0 +1,44 @@
+From 8c3fcbf23fe31cf56f21ce1737bf22fe65fc553b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Aug 2021 23:40:01 +0200
+Subject: [PATCH] block/export/fuse.c: fix fuse-lseek on uclibc or musl
+
+Include linux/fs.h to avoid the following build failure on uclibc or
+musl raised since version 6.0.0:
+
+../block/export/fuse.c: In function 'fuse_lseek':
+../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
+  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
+      |                   ^~~~~~~~~
+../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
+../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
+  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
+      |                                          ^~~~~~~~~
+      |                                          SEEK_SET
+
+Fixes:
+ - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://patchwork.ozlabs.org/project/qemu-devel/patch/20210827220301.272887-1-fontaine.fabrice@gmail.com/]
+---
+ block/export/fuse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/block/export/fuse.c b/block/export/fuse.c
+index fc7b07d2b5..2e3bf8270b 100644
+--- a/block/export/fuse.c
++++ b/block/export/fuse.c
+@@ -31,6 +31,9 @@
+ #include <fuse.h>
+ #include <fuse_lowlevel.h>
+ 
++#ifdef __linux__
++#include <linux/fs.h>
++#endif
+ 
+ /* Prevent overly long bounce buffer allocations */
+ #define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
+-- 
+2.32.0
+
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 88516678d1..520618cd55 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -91,14 +91,8 @@ QEMU_OPTS += --disable-tools
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
-QEMU_OPTS += --enable-fuse
+QEMU_OPTS += --enable-fuse --enable-fuse-lseek
 QEMU_DEPENDENCIES += libfuse3
-# musl does not support SEEK_HOLE/SEEK_DATA
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-QEMU_OPTS += --disable-fuse-lseek
-else
-QEMU_OPTS += --enable-fuse-lseek
-endif
 else
 QEMU_OPTS += --disable-fuse --disable-fuse-lseek
 endif
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
