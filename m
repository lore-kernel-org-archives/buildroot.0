Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07A5C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605634EEB0;
	Fri, 28 Feb 2025 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNtBbrmMOcrR; Fri, 28 Feb 2025 16:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC1B42E4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC1B42E4B;
	Fri, 28 Feb 2025 16:31:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8484068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 138BB80A6F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Acy9wAnksCBb for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FBF780AB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FBF780AB8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CEE487A7D; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:42:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ee745782a0802b1479eb6a8f678b6a261775295
X-Git-Newrev: ee65a2119aba93692970ae83e083974ef865c15b
X-Patchwork-Hint: ignore
Message-Id: <20250228162932.2CEE487A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/android-tools: fix
 build issue on mips64 and powerpc64
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7369102593425095699=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7369102593425095699==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ee65a2119aba93692970ae83e083974ef865c15b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The kernel headers on mips64 and powerpc64 were historically "broken",
defining u64 as an "unsigned long" instead of "unsigned long
long". This has been fixed in the upstream Linux kernel by introducing
the __SANE_USERSPACE_TYPES__ definition.

Our commit a2e178d6b45dfc5b8d1d50fcbbfc0bec5ebf1ae2 ("android-tools:
disable on some architecture with old kernel headers") already
disabled building fastboot on powerpc64 and mips64 systems that have
too old kernel headers. However, it turns out that even with the new
kernel headers, there are build issues because
__SANE_USERSPACE_TYPES__ isn't defined everywhere it should be in the
android-tools code base. The Debian patche
debian/patches/ppc64el-ftbfs.patch adds some definitions, but it's
missing one file, and in another the definition comes too late.

This commit adds an extra patch that fixes this up, and makes fastboot
build properly on mips64 and powerpc64.

Fixes:

  http://autobuild.buildroot.net/results/8528ff876e695f79bdfe64f5330d9d51eeef66cb/ (powerpc64)
  http://autobuild.buildroot.net/results/36ac6af73b618c28d1636093da333f7ebd9d6cfe/ (mips64)

This issue has been occurring as far as Feb 2021, with the first
occurence apparently being:

  http://autobuild.buildroot.net/results/d9521b4bfeafb1140c21745dbfe28d476a9b71ec/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ..._utils-make_ext4fs.c-define-__SANE_USERSP.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/android-tools/0016-extras-ext4_utils-make_ext4fs.c-define-__SANE_USERSP.patch b/package/android-tools/0016-extras-ext4_utils-make_ext4fs.c-define-__SANE_USERSP.patch
new file mode 100644
index 0000000000..5f3650cc77
--- /dev/null
+++ b/package/android-tools/0016-extras-ext4_utils-make_ext4fs.c-define-__SANE_USERSP.patch
@@ -0,0 +1,68 @@
+From 5db9529436f13b8c073a0310da3a1107f84645da Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 4 Dec 2024 20:51:22 +0100
+Subject: [PATCH] extras/ext4_utils/make_ext4fs.c: define
+ __SANE_USERSPACE_TYPES__
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Debian patch ppc64el-ftbfs.patch is already defining
+__SANE_USERSPACE_TYPES__ in a few files to solve a conflict between
+kernel header definitions and local definition of some types, on
+powerpc64 and mips64.
+
+However, the Debian patch lacks an update to ext4_utils.c, and has the
+definition too late in make_ext4fs.c. This commit therefore fixes
+those two remaining issues, fixing:
+
+error: conflicting types for ‘u64’; have ‘long unsigned int’
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ extras/ext4_utils/ext4_utils.c  | 5 ++++-
+ extras/ext4_utils/make_ext4fs.c | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/extras/ext4_utils/ext4_utils.c b/extras/ext4_utils/ext4_utils.c
+index e95f5cc..9f6836f 100644
+--- a/extras/ext4_utils/ext4_utils.c
++++ b/extras/ext4_utils/ext4_utils.c
+@@ -14,6 +14,10 @@
+  * limitations under the License.
+  */
+ 
++#if defined(__linux__)
++#define __SANE_USERSPACE_TYPES__
++#endif
++
+ #include "ext4_utils.h"
+ #include "uuid.h"
+ #include "allocate.h"
+@@ -36,7 +40,6 @@
+ #endif
+ 
+ #if defined(__linux__)
+-#define __SANE_USERSPACE_TYPES__
+ #include <linux/fs.h>
+ #elif defined(__APPLE__) && defined(__MACH__)
+ #include <sys/disk.h>
+diff --git a/extras/ext4_utils/make_ext4fs.c b/extras/ext4_utils/make_ext4fs.c
+index 3124aed..332a213 100644
+--- a/extras/ext4_utils/make_ext4fs.c
++++ b/extras/ext4_utils/make_ext4fs.c
+@@ -14,6 +14,10 @@
+  * limitations under the License.
+  */
+ 
++#if defined(__linux__)
++#define __SANE_USERSPACE_TYPES__
++#endif
++
+ #include "make_ext4fs.h"
+ #include "ext4_utils.h"
+ #include "allocate.h"
+-- 
+2.47.0
+

--===============7369102593425095699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7369102593425095699==--
