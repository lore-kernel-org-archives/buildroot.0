Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCBDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9339C409EA;
	Tue, 11 Jan 2022 20:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1B1xYAC8szvr; Tue, 11 Jan 2022 20:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB5B34092F;
	Tue, 11 Jan 2022 20:32:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC4E41BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D7C40517
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRD4X3rcr4WR for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:32:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF98C4016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:32:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EC60F83465; Tue, 11 Jan 2022 20:26:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:32:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 184e710c82b87bf2eaf1d200e148e686263945e8
X-Git-Newrev: f363bc2958812539cf248f6cf44fe519445adf7a
X-Patchwork-Hint: ignore
Message-Id: <20220111202622.EC60F83465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f363bc2958812539cf248f6cf44fe519445adf7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 5.15.1
in commit 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359:

In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
                 from ./kerncompat.h:31,
                 from common/utils.c:42:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
    7 | struct sysinfo {
      |        ^~~~~~~
In file included from common/utils.c:27:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
   10 | struct sysinfo {
      |        ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ux-const-h-to-fix-build-with-5-12-headers.patch | 43 +++++++++++++++++++
 ...clude-sys-sysinfo-h-conditionally-on-musl.patch | 49 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
new file mode 100644
index 0000000000..b6c1a42456
--- /dev/null
+++ b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
@@ -0,0 +1,43 @@
+From b28f7bd9bba6f65258da48955154794f466b4104 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Thu, 30 Dec 2021 15:23:59 +0200
+Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
+ headers
+
+btrfs-tools compile fails with mips, musl and 5.12+ headers.
+
+The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
+add an explicit include of const.h to pickup the macro:
+
+  | make: *** [Makefile:595: mkfs.btrfs] Error 1
+  | make: *** Waiting for unfinished jobs....
+  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
+  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
+  | collect2: error: ld returned 1 exit status
+
+This is safe for older kernel's as well, since the header still
+exists, and is valid to include.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+[remove invalid OE Upstream-status]
+Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
+Signed-off-by: David Sterba <dsterba@suse.com>
+[Retrieved from:
+https://github.com/kdave/btrfs-progs/commit/b28f7bd9bba6f65258da48955154794f466b4104]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kerncompat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index df167fe6c..2503d1afa 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -29,6 +29,7 @@
+ #include <stddef.h>
+ #include <linux/types.h>
+ #include <linux/kernel.h>
++#include <linux/const.h>
+ #include <stdint.h>
+ 
+ #include <features.h>
diff --git a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
new file mode 100644
index 0000000000..7473fe67cb
--- /dev/null
+++ b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
@@ -0,0 +1,49 @@
+From a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 Jan 2022 22:44:44 +0100
+Subject: [PATCH] btrfs-progs: include sys/sysinfo.h conditionally on musl
+
+Make inclusion of sys/sysinfo.h conditional to avoid the following build
+failure on musl:
+
+In file included from .../i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
+                 from ./kerncompat.h:31,
+                 from common/utils.c:42:
+.../i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
+    7 | struct sysinfo {
+      |        ^~~~~~~
+In file included from common/utils.c:27:
+.../i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+   10 | struct sysinfo {
+      |        ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc
+
+The 'struct sysinfo' is defined in linux/sysinfo.h and sys/sysinfo.h,
+while both must not be included at the same time. Stop including
+linux/kernel.h that sometimes unconditionally includes sys/sysinfo.h and
+causes the double definition for some reason. As we now include
+linux/const.h directly, there's no other effective change.
+
+Pull-request: #433
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: David Sterba <dsterba@suse.com>
+[Retrieved from:
+https://github.com/kdave/btrfs-progs/commit/a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5]
+---
+ kerncompat.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 2503d1afa..6ca1526e2 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -28,7 +28,6 @@
+ #include <assert.h>
+ #include <stddef.h>
+ #include <linux/types.h>
+-#include <linux/kernel.h>
+ #include <linux/const.h>
+ #include <stdint.h>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
