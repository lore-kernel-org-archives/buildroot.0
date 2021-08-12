Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72597C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:52:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316796108C
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 316796108C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F3861436;
	Thu, 12 Aug 2021 21:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6I1Ry31nE07; Thu, 12 Aug 2021 21:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723AE61411;
	Thu, 12 Aug 2021 21:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5861C1135
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48F944023D
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIK7QSp54fe0 for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90168401D3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:51:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A56038D48A; Thu, 12 Aug 2021 21:50:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:51:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b04d4f22cf5dbc75042b67859c8d2c8d8bbdc49
X-Git-Newrev: ca2e12b4fc5215c8e4f261ef9b0b2d5761f9472c
X-Patchwork-Hint: ignore
Message-Id: <20210812215058.A56038D48A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add libfuse3 optional
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ca2e12b4fc5215c8e4f261ef9b0b2d5761f9472c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfuse3 is an optional dependency which is enabled by default since
version 6.0.0 and
https://gitlab.com/qemu-project/qemu/-/commit/0c9b70d5900a5108e899edfdd6f3790f8cb6bdc2

So add this dependency and fix the following build failures on musl
raised since bump to version 6.0.0 in commit
6b86c9335fc3ff381878156c6243454d4b688df9:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                       ^~~~~~~~~~~~~~~~~~~~
../block/export/fuse.c:563:23: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:639:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  639 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:639:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  639 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/0196609043bd37543e6a0d17ffc2254302ea7ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-block-export-fuse.c-fix-musl-build.patch  | 46 ++++++++++++++++++++++
 package/qemu/qemu.mk                               | 13 ++++++
 2 files changed, 59 insertions(+)

diff --git a/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch b/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
new file mode 100644
index 0000000000..0da6b3ff73
--- /dev/null
+++ b/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
@@ -0,0 +1,46 @@
+From 4d5280c066eb46a31556044fb52c2618928b0019 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 9 Aug 2021 10:04:07 +0200
+Subject: [PATCH] block/export/fuse.c: fix musl build
+
+Fix the following build failure on musl raised since version 6.0.0 and
+https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
+because musl does not define FALLOC_FL_ZERO_RANGE:
+
+../block/export/fuse.c: In function 'fuse_fallocate':
+../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
+      |                       ^~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to qemu-devel@nongnu.org]
+---
+ block/export/fuse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/block/export/fuse.c b/block/export/fuse.c
+index ada9e263eb..07e31129a6 100644
+--- a/block/export/fuse.c
++++ b/block/export/fuse.c
+@@ -635,6 +635,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
+             offset += size;
+             length -= size;
+         } while (ret == 0 && length > 0);
++#ifdef FALLOC_FL_ZERO_RANGE
+     } else if (mode & FALLOC_FL_ZERO_RANGE) {
+         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
+             /* No need for zeroes, we are going to write them ourselves */
+@@ -654,6 +655,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
+             offset += size;
+             length -= size;
+         } while (ret == 0 && length > 0);
++#endif
+     } else if (!mode) {
+         /* We can only fallocate at the EOF with a truncate */
+         if (offset < blk_len) {
+-- 
+2.30.2
+
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 50ace104ce..88516678d1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -90,6 +90,19 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+QEMU_OPTS += --enable-fuse
+QEMU_DEPENDENCIES += libfuse3
+# musl does not support SEEK_HOLE/SEEK_DATA
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+QEMU_OPTS += --disable-fuse-lseek
+else
+QEMU_OPTS += --enable-fuse-lseek
+endif
+else
+QEMU_OPTS += --disable-fuse --disable-fuse-lseek
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 QEMU_OPTS += --enable-seccomp
 QEMU_DEPENDENCIES += libseccomp
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
