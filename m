Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A24C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE95E60BEF;
	Fri,  3 Jul 2026 14:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ob0hJX2jZ5YJ; Fri,  3 Jul 2026 14:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335B860C1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088834;
	bh=eO9Lrm9ruAnuiNLO3zks88BTvv0kfbp2kJgXpyCqGU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SR/n129ciZxnQJhBCQAgaA+1EFV6w92vllGM6lub+lOnrswlb+WRASwP6HyH4w80I
	 0fgP/pMb1Aolnh6+C0F1H0iPhmY8FpfJEUxoILyk9KCazJ/4z2eA7PV9xLKTKnwXHx
	 5KJCX+zmvVnBdv8VL2wez9C4Y8Rn8gNZOnv2FGnclnnotW+CBRVOjBKOUcdPLqtErV
	 xdKtfyoIgxf/gt115nuEr/KbNJ8dWSZvTy8UYSSnthegmrwFoWb7XFekMdR3wsYVlH
	 deUGoT1a6AHeM8KwKHfpw6qAkSeohzCFlwB7LSG1zrTbe9qZe2aQk/9F1BrMWxyAv9
	 oA6YowPLajshw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335B860C1E;
	Fri,  3 Jul 2026 14:27:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE03363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D7C540E90
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTbYhFM8J0GZ for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAEBC40ECA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAEBC40ECA
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D6F4883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:47:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a8b23da63e8dcd1be5268f14973a0ab5c1b23eed
X-Git-Newrev: 4f7f72e10ab8ddbe427620e75b0f99b6e0fb1a1f
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.6D6F4883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux:
 backport patch CVE-2026-53614
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f7f72e10ab8ddbe427620e75b0f99b6e0fb1a1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-53614
    The SUID binary /usr/bin/mount from util-linux trusts the
    environment variable LIBMOUNT_FORCE_MOUNT2 via a raw getenv() call
    in libmount/src/hook_mount.c. An unprivileged user can set
    LIBMOUNT_FORCE_MOUNT2=always to force the mount process to use the
    legacy (non-atomic) bind mount path instead of the secure new mount
    API path.

    In the legacy path, a bind mount is performed in two separate
    syscalls: first mount(src, tgt, MS_BIND) which exposes the source
    directory without security flags, then mount(tgt,
    MS_REMOUNT|MS_BIND|MS_NOSUID|MS_NOEXEC|MS_NODEV) which applies the
    flags. Between these two syscalls, a brief window exists where the
    bind-mounted directory is visible without nosuid/noexec protection.
    A concurrent process can execute a SUID binary from the bind target
    during this window.

For more information, see:
 - https://github.com/util-linux/util-linux/security/advisories/GHSA-67r7-8m5w-22wx
 - https://github.com/util-linux/util-linux/commit/cc81bbcec598cb91f0eb8456282f33eed820ed5f

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0013-CVE-2026-53614.patch | 81 ++++++++++++++++++++++++++++
 package/util-linux/util-linux.mk             |  3 ++
 2 files changed, 84 insertions(+)

diff --git a/package/util-linux/0013-CVE-2026-53614.patch b/package/util-linux/0013-CVE-2026-53614.patch
new file mode 100644
index 0000000000..2e4315500f
--- /dev/null
+++ b/package/util-linux/0013-CVE-2026-53614.patch
@@ -0,0 +1,81 @@
+From 31e37c1c7dcf25b76ccf41391fe934a75644c661 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 10:58:32 +0200
+Subject: [PATCH] libmount: fix SUID bypass via LIBMOUNT_FORCE_MOUNT2 and
+ legacy mount path
+
+Use safe_getenv() for LIBMOUNT_FORCE_MOUNT2 to ignore the variable
+in SUID context, consistent with LIBMOUNT_FSTAB and other sensitive
+environment variables.
+
+Additionally, refuse multi-step mount(2) sequences (bind+remount and
+propagation) for restricted (non-root) users in the legacy mount path.
+The two-step approach has a window between syscalls where security
+flags (nosuid, noexec, ...) are not yet applied.  The new mount API
+handles this atomically.
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 9cbfb823500f510b34767edabd3ffd5b436987b4)
+
+Upstream: https://github.com/util-linux/util-linux/commit/cc81bbcec598cb91f0eb8456282f33eed820ed5f
+CVE: CVE-2026-53614
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libmount/src/hook_mount.c        | 3 ++-
+ libmount/src/hook_mount_legacy.c | 8 ++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 374078c97f8..570ee8e01f9 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -44,6 +44,7 @@
+  */
+ 
+ #include "mountP.h"
++#include "env.h"
+ #include "fileutils.h"	/* statx() fallback */
+ #include "strutils.h"
+ #include "mount-api-utils.h"
+@@ -658,7 +659,7 @@ static int init_sysapi(struct libmnt_context *cxt,
+ 
+ static int force_classic_mount(struct libmnt_context *cxt)
+ {
+-	const char *env = getenv("LIBMOUNT_FORCE_MOUNT2");
++	const char *env = safe_getenv("LIBMOUNT_FORCE_MOUNT2");
+ 
+ 	if (env) {
+ 		if (strcmp(env, "always") == 0)
+diff --git a/libmount/src/hook_mount_legacy.c b/libmount/src/hook_mount_legacy.c
+index cfdd7af2b2c..942e26e7770 100644
+--- a/libmount/src/hook_mount_legacy.c
++++ b/libmount/src/hook_mount_legacy.c
+@@ -285,6 +285,8 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 
+ 	/* add extra mount(2) calls for each propagation flag  */
+ 	if (flags & MS_PROPAGATION) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_propagation(cxt, hs);
+ 		if (rc)
+ 			return rc;
+@@ -294,12 +296,18 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 	if ((flags & MS_BIND)
+ 	    && (flags & MNT_BIND_SETTABLE)
+ 	    && !(flags & MS_REMOUNT)) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_bindremount(cxt, hs);
+ 		if (rc)
+ 			return rc;
+ 	}
+ 
+ 	return rc;
++eperm:
++	DBG(HOOK, ul_debugobj(hs,
++		"multi-step mount(2) refused for non-root user"));
++	return -EPERM;
+ }
+ 
+ const struct libmnt_hookset hookset_mount_legacy =
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b0f7b7e988..cf75171e55 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -50,6 +50,9 @@ UTIL_LINUX_IGNORE_CVES += CVE-2026-53612
 # 0012-CVE-2026-53613-2.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-53613
 
+# 0013-CVE-2026-53614.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-53614
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
