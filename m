Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BBBC43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F3660A5C;
	Fri,  3 Jul 2026 14:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcn_llLBg6wm; Fri,  3 Jul 2026 14:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E19C260B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088814;
	bh=MTnSg2jvaPhO2o9yWhYyb+/8k1YK3y8H0j6XkT63AqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HJehP5ruT7REKvWPqpHw1oxwkndsOWD/bUUHU1ePy0eBYigBJ+TZy0O7PAyjXJ74X
	 /xXQew0gVxN+f8lC2hVQYJvC5Ehp3Pf66lJJ8zFe5wQSrTyF7UKR/ds7HifX10ufE9
	 PrF67JV0XOYvWKmsBNgvwdfexteWo4BiFUpaALaXukjLe1dVtnoyA+iFfrJTnjhBam
	 EQQyjZD9N/Tr8XKVXBZWfxDRZzpLAgkAByXfIAWqjOk16HQrJfxxTO3BUPgC9ywUF/
	 +Fgz739McJpKVx/oR8kgGskcJIyXyM4bFqVJs4nFthXcBacAX6low0CNX2qyfB2wZe
	 xkrnqsN/PS5BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E19C260B02;
	Fri,  3 Jul 2026 14:26:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC54A47E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ECB24008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jsj9E7ljCOb for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B855E40556
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B855E40556
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AD4E883A4; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:47:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d4875d6dcd0ba62cb1dfd91a86f43b788fd81c1
X-Git-Newrev: 351a42c6733a5174f5cef05a1cfe506a2bea3540
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.5AD4E883A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux:
 backport patch CVE-2026-53612
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/351a42c6733a5174f5cef05a1cfe506a2bea3540
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-53612
    A TOCTOU (Time-of-Check-Time-of-Use) vulnerability exists in the
    SUID binary /usr/bin/mount from util-linux. The hook_owner.c
    post-mount hook performs path-based chmod() and lchown() operations
    on the mount target after mount() has completed, without verifying
    that the target path still resolves to the same filesystem object.
    An unprivileged local user can exploit this race window using
    renameat2(RENAME_EXCHANGE) to redirect the chmod()/lchown() to an
    arbitrary path, achieving arbitrary permission/ownership
    modification on any file or directory.

For more information, see:
 - https://github.com/util-linux/util-linux/security/advisories/GHSA-g8wm-75wr-g2vh
 - https://github.com/util-linux/util-linux/commit/d0c5adaeb3a3d823aba1377794de8f009b8152cc

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0010-CVE-2026-53612.patch | 89 ++++++++++++++++++++++++++++
 package/util-linux/util-linux.mk             |  3 +
 2 files changed, 92 insertions(+)

diff --git a/package/util-linux/0010-CVE-2026-53612.patch b/package/util-linux/0010-CVE-2026-53612.patch
new file mode 100644
index 0000000000..b160f1946a
--- /dev/null
+++ b/package/util-linux/0010-CVE-2026-53612.patch
@@ -0,0 +1,89 @@
+From d0c5adaeb3a3d823aba1377794de8f009b8152cc Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 11:15:19 +0200
+Subject: [PATCH] libmount: use fd-based fchownat/chmod in hook_owner
+
+Replace path-based lchown()/chmod() with fd-based operations in the
+X-mount.{owner,group,mode} post-mount hook.
+
+For restricted users the fd_target is pinned in prepare_target() and
+re-opened after mount in hook_attach_target() to point to the mounted
+filesystem root.  For root a local O_PATH fd is opened.  Ownership is
+changed via fchownat(fd, "", ..., AT_EMPTY_PATH), mode via
+/proc/self/fd/N.
+
+This prevents TOCTOU attacks where an ancestor directory is swapped
+between mount and the chmod/chown operations.
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 24da33905c7115c4cbccd0afb2a469804e96467a)
+
+Upstream: https://github.com/util-linux/util-linux/commit/d0c5adaeb3a3d823aba1377794de8f009b8152cc
+CVE: CVE-2026-53612
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libmount/src/hook_owner.c | 32 ++++++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/libmount/src/hook_owner.c b/libmount/src/hook_owner.c
+index 11b238c8917..99f0e705d73 100644
+--- a/libmount/src/hook_owner.c
++++ b/libmount/src/hook_owner.c
+@@ -17,6 +17,7 @@
+ #include <sched.h>
+ 
+ #include "mountP.h"
++#include "pathnames.h"
+ #include "fileutils.h"
+ 
+ struct hook_data {
+@@ -48,7 +49,7 @@ static int hook_post(
+ {
+ 	struct hook_data *hd = (struct hook_data *) data;
+ 	const char *target;
+-	int rc = 0;
++	int rc = 0, fd;
+ 
+ 	assert(cxt);
+ 
+@@ -59,18 +60,33 @@ static int hook_post(
+ 	if (!target)
+ 		return 0;
+ 
++	/* fd_target is pinned in restricted mode (see prepare_target()),
++	 * for root open it here to keep chmod/chown fd-based too */
++	if (mnt_context_target_fd_required(cxt))
++		fd = mnt_context_get_target_fd(cxt);
++	else
++		fd = open(target, O_PATH | O_CLOEXEC);
++
++	if (fd < 0)
++		return -MNT_ERR_CHMOD;
++
+ 	if (hd->owner != (uid_t) -1 || hd->group != (uid_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " lchown(%s, %u, %u)", target, hd->owner, hd->group));
+-		if (lchown(target, hd->owner, hd->group) == -1)
+-			return -MNT_ERR_CHOWN;
++		DBG(CXT, ul_debugobj(cxt, " fchownat(%s, %u, %u)", target, hd->owner, hd->group));
++		if (fchownat(fd, "", hd->owner, hd->group, AT_EMPTY_PATH) == -1)
++			rc = -MNT_ERR_CHOWN;
+ 	}
+ 
+-	if (hd->mode != (mode_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", target, hd->mode));
+-		if (chmod(target, hd->mode) == -1)
+-			return -MNT_ERR_CHMOD;
++	if (!rc && hd->mode != (mode_t) -1) {
++		char buf[sizeof(_PATH_PROC_FDDIR) + 1 + sizeof(stringify_value(INT_MAX))];
++
++		snprintf(buf, sizeof(buf), _PATH_PROC_FDDIR "/%d", fd);
++		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", buf, hd->mode));
++		if (chmod(buf, hd->mode) == -1)
++			rc = -MNT_ERR_CHMOD;
+ 	}
+ 
++	if (!mnt_context_target_fd_required(cxt))
++		close(fd);
+ 	return rc;
+ }
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 22c314ce82..3f929a89a7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -43,6 +43,9 @@ UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
 # 0009-CVE-2025-14104-2.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2025-14104
 
+# 0010-CVE-2026-53612.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-53612
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
