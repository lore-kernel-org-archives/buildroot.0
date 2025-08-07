Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B1BC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E097804D1;
	Thu,  7 Aug 2025 17:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UP4rR-Cd1XTu; Thu,  7 Aug 2025 17:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3EB780C5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3EB780C5D;
	Thu,  7 Aug 2025 17:19:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5BB31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B821D400DD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzF7Mc0kSxgJ for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4347740092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4347740092
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41A0086FCC; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:38 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 60b8fb63cc523909e1e428cce6fb9598e5497d33
X-Git-Newrev: 325fa4b316bcee70947ce10fcdfd0aaba072337b
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.41A0086FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ltp-testsuite:
 backport musl build fixes
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4828644247239847913=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4828644247239847913==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=325fa4b316bcee70947ce10fcdfd0aaba072337b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

When building LTP with a musl toolchain with kernel headers >= 6.14,
compilation fails with error:

    In file included from listmount02.c:22:
    listmount.h: In function ‘listmount’:
    listmount.h:18:16: error: variable ‘req’ has initializer but incomplete type
       18 |         struct mnt_id_req req = {
          |                ^~~~~~~~~~

The issue can be reproduced with commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_BUILDROOT_MUSL=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_LATEST_VERSION=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_PACKAGE_LTP_TESTSUITE=y
    EOF
    make olddefconfig
    make ltp-testsuite

Backport 2 commits from upstream which fixes LTP on musl on
kernel >= 6.14.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien:
 - add commands to reproduce the issue in commit log
 - move _AUTORECONF up to be nearer _VERSION
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0ccd9300cdca0358cd7b10c3f87a3cbac1b328d6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...onfigure-Fix-build-on-kernel-6.14-headers.patch | 51 +++++++++++++++++++++
 .../0002-statmount02-Remove-linux-btrfs.h.patch    | 52 ++++++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk             |  3 ++
 3 files changed, 106 insertions(+)

diff --git a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
new file mode 100644
index 0000000000..6638ee2ccd
--- /dev/null
+++ b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
@@ -0,0 +1,51 @@
+From 3ef4bac1dd253628dfdb8a823b51ae0d24fa0616 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 2 Jun 2025 19:08:30 +0200
+Subject: [PATCH] configure: Fix build on kernel 6.14 headers
+
+We decided in a2300dc0f5 to remove <linux/mount.h> in lapi/mount.h and
+use only <sys/mount.h>. But later in 5c5411ea8e we add autotools checks
+in configure.ac which use <linux/mount.h> for detection, but kept using
+lapi/mount.h. This worked until now, because no toolchain used new
+header enough. Recent Alpine update broke that.
+
+This fixes CI build on Alpine v3.22 (the default Alpine version in
+GitHub action), which uses 6.14.2 kernel headers, which already define
+struct mnt_id_req (configure.ac detect it but lapi/mount.h was not using
+a correct header):
+
+    listmount.h: In function 'listmount':
+    listmount.h:18:16: error: variable 'req' has initializer but incomplete type
+       18 |         struct mnt_id_req req = {
+	  |                ^~~~~~~~~~
+
+Link: https://lore.kernel.org/ltp/20250602170831.404641-1-pvorel@suse.cz/
+Fixes: 5c5411ea8e ("Add listmount/statmount fallback declarations")
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Acked-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream: https://github.com/linux-test-project/ltp/commit/3ef4bac1dd253628dfdb8a823b51ae0d24fa0616
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9ff098b273..69c5be7362 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -254,8 +254,10 @@ AC_CHECK_TYPES([struct mount_attr],,,[
+ 
+ AC_CHECK_TYPES([struct cachestat_range],,,[#include <sys/mman.h>])
+ AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
+-AC_CHECK_TYPES([struct mnt_id_req],,,[#include <linux/mount.h>])
+-AC_CHECK_TYPES([struct statmount],,,[#include <linux/mount.h>])
++
++# Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
++AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
++AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
+ 
+ # Tools knobs
+ 
+-- 
+2.50.0
+
diff --git a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
new file mode 100644
index 0000000000..c82c422000
--- /dev/null
+++ b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
@@ -0,0 +1,52 @@
+From fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Wed, 4 Jun 2025 16:13:18 +0200
+Subject: [PATCH] statmount02: Remove <linux/btrfs.h>
+
+statmount02.c does not need <linux/btrfs.h> because it's skipped.
+
+Avoid using it fixes the problem due the old problem of indirect include
+<linux/mount.h> by <linux/fs.h> on Alpine v3.22 (the default Alpine
+version in GitHub action), which uses 6.14.2 kernel headers:
+
+    In file included from /usr/include/linux/fs.h:19,
+                     from /usr/include/linux/btrfs.h:29,
+                     from statmount02.c:23:
+    /usr/include/linux/mount.h:155:8: error: redefinition of 'struct statmount'
+      155 | struct statmount {
+          |        ^~~~~~~~~
+    In file included from statmount.h:12,
+                     from statmount02.c:20:
+    ../../../../include/lapi/mount.h:58:8: note: originally defined here
+       58 | struct statmount {
+          |        ^~~~~~~~~
+    /usr/include/linux/mount.h:193:8: error: redefinition of 'struct mnt_id_req'
+      193 | struct mnt_id_req {
+          |        ^~~~~~~~~~
+    ../../../../include/lapi/mount.h:49:8: note: originally defined here
+       49 | struct mnt_id_req {
+          |        ^~~~~~~~~~
+
+Fixes: 5f9942dffe ("Add statmount02 test")
+Suggested-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream: https://github.com/linux-test-project/ltp/commit/fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435
+---
+ testcases/kernel/syscalls/statmount/statmount02.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/statmount/statmount02.c b/testcases/kernel/syscalls/statmount/statmount02.c
+index 504c558a11..07f877e040 100644
+--- a/testcases/kernel/syscalls/statmount/statmount02.c
++++ b/testcases/kernel/syscalls/statmount/statmount02.c
+@@ -20,7 +20,6 @@
+ #include "statmount.h"
+ #include "lapi/stat.h"
+ #include "lapi/sched.h"
+-#include <linux/btrfs.h>
+ 
+ #define MNTPOINT "mntpoint"
+ 
+-- 
+2.50.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f6098037c0..a3da6ec118 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -11,6 +11,9 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
+# 0001-configure-Fix-build-on-kernel-6.14-headers.patch
+LTP_TESTSUITE_AUTORECONF = YES
+
 LTP_TESTSUITE_CONF_OPTS += --disable-metadata
 
 ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)

--===============4828644247239847913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4828644247239847913==--
