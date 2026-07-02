Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F35C44502
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE99840FE8;
	Fri,  3 Jul 2026 14:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-NpihjQSfEO; Fri,  3 Jul 2026 14:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5ED441165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088821;
	bh=KWlA+d5KDYaoAKGIDB8sCcJx/nbOqdHE7g7OfZjlHLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dilw1U00gIg4E+US6CeYc1nzHCkdMtU+jurhIeTpaFRmVFaz+0IT5vGWYIeYm6WSs
	 +qj27a9tUySgl7SBXlmMpRohPF1w6etM+MzceCUMARx79lDWiJjdEz+F2CBFNqPCCH
	 L4AHpp782etJm1gAkIAhuJq55VVIF+BXCIV4m7Szgj2pAU6rXPZWpcRZ/1FrPfrsXx
	 diqJ1qbeHwUEj6tkSCdPkeFXT2Z6pz4wClG47PC7CoY2E61XNqtmkQjLJDG207Pc0u
	 tWTf0rGBLxUZROt/XI6P9aTpFgq2+pfVFAzF8HDlYX5nl+GZMo9SFUg8P0dX/FBXzR
	 Hdvuo+lpqP4uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5ED441165;
	Fri,  3 Jul 2026 14:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1F029E5
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8D9B60648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUUZkRmlpJIe for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28C160AAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C28C160AAD
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64F47883A1; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:47:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 351a42c6733a5174f5cef05a1cfe506a2bea3540
X-Git-Newrev: a8b23da63e8dcd1be5268f14973a0ab5c1b23eed
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.64F47883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux:
 backport patch CVE-2026-53613
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8b23da63e8dcd1be5268f14973a0ab5c1b23eed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-53613
    A TOCTOU vulnerability exists in the SUID binary /usr/bin/mount from
    util-linux. When processing restricted (non-root) mount requests,
    libmount validates the mount target against /etc/fstab entries and
    checks user permissions, but the actual mount()/move_mount() syscall
    re-resolves the target pathname. An attacker can use
    renameat2(RENAME_EXCHANGE) to atomically swap an ancestor directory
    of the mount target between the permission check and the mount
    syscall, redirecting an authorized user-directory mount to any
    root-owned path (e.g., /etc/sudoers.d).

For more information, see:
 - https://github.com/util-linux/util-linux/security/advisories/GHSA-8gj5-72r3-428g
 - https://github.com/util-linux/util-linux/commit/b639bf5c4277b7f828b3fcbdbf94bad5a4d20060
 - https://github.com/util-linux/util-linux/commit/0b010025a0e429bc80355c94db86a843395d49e2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0011-CVE-2026-53613-1.patch |  99 +++++++++++++
 package/util-linux/0012-CVE-2026-53613-2.patch | 189 +++++++++++++++++++++++++
 package/util-linux/util-linux.mk               |   4 +
 3 files changed, 292 insertions(+)

diff --git a/package/util-linux/0011-CVE-2026-53613-1.patch b/package/util-linux/0011-CVE-2026-53613-1.patch
new file mode 100644
index 0000000000..8e6d8267a5
--- /dev/null
+++ b/package/util-linux/0011-CVE-2026-53613-1.patch
@@ -0,0 +1,99 @@
+From b639bf5c4277b7f828b3fcbdbf94bad5a4d20060 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 27 May 2026 10:35:39 +0200
+Subject: [PATCH] lib/fileutils: add ul_open_no_symlinks()
+
+Add a helper that opens a path rejecting symlinks at any component,
+not just the last one.  Uses openat2(RESOLVE_NO_SYMLINKS) when
+available (Linux >= 5.6), falls back to open(O_NOFOLLOW).
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e01e38b24346a21f1d01498c265486a12c009e61)
+
+Upstream: https://github.com/util-linux/util-linux/commit/b639bf5c4277b7f828b3fcbdbf94bad5a4d20060
+CVE: CVE-2026-53613
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ configure.ac        |  1 +
+ include/fileutils.h |  2 ++
+ lib/fileutils.c     | 24 ++++++++++++++++++++++++
+ meson.build         |  1 +
+ 4 files changed, 28 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 3bbc94488b9..2d9388a3cfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -345,6 +345,7 @@ AC_CHECK_HEADERS([ \
+ 	linux/kcmp.h \
+ 	linux/net_namespace.h \
+ 	linux/nsfs.h \
++	linux/openat2.h \
+ 	linux/pr.h \
+ 	linux/raw.h \
+ 	linux/securebits.h \
+diff --git a/include/fileutils.h b/include/fileutils.h
+index 6fc93d0db82..996e183221d 100644
+--- a/include/fileutils.h
++++ b/include/fileutils.h
+@@ -61,6 +61,8 @@ static inline int is_same_inode(const int fd, const struct stat *st)
+ 	return 1;
+ }
+ 
++extern int ul_open_no_symlinks(const char *path, int flags, mode_t mode);
++
+ extern int dup_fd_cloexec(int oldfd, int lowfd);
+ extern unsigned int get_fd_tabsize(void);
+ 
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index b7acae43082..a9c2022be5f 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -11,7 +11,14 @@
+ #include <unistd.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
++#include <sys/syscall.h>
+ #include <string.h>
++#include <fcntl.h>
++#include <errno.h>
++
++#ifdef HAVE_LINUX_OPENAT2_H
++# include <linux/openat2.h>
++#endif
+ 
+ #include "c.h"
+ #include "all-io.h"
+@@ -343,3 +350,20 @@ char *ul_basename(char *path)
+ 
+ 	return p;
+ }
++
++int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
++{
++#if defined(SYS_openat2) && defined(RESOLVE_NO_SYMLINKS)
++	struct open_how how = {
++		.flags = (__u64) flags,
++		.mode = (__u64) mode,
++		.resolve = RESOLVE_NO_SYMLINKS,
++	};
++	int fd = syscall(SYS_openat2, AT_FDCWD, path, &how, sizeof(how));
++
++	/* only fall back to O_NOFOLLOW if the syscall is unavailable */
++	if (fd >= 0 || errno != ENOSYS)
++		return fd;
++#endif
++	return open(path, flags | O_NOFOLLOW, mode);
++}
+diff --git a/meson.build b/meson.build
+index c79939c0525..7b2b9ee71eb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -198,6 +198,7 @@ headers = '''
+         linux/kcmp.h
+         linux/net_namespace.h
+         linux/nsfs.h
++        linux/openat2.h
+         linux/mount.h
+         linux/pr.h
+         linux/securebits.h
diff --git a/package/util-linux/0012-CVE-2026-53613-2.patch b/package/util-linux/0012-CVE-2026-53613-2.patch
new file mode 100644
index 0000000000..7c1a7326d1
--- /dev/null
+++ b/package/util-linux/0012-CVE-2026-53613-2.patch
@@ -0,0 +1,189 @@
+From 0d3d55975aa3492c62fd345eac38f41cd166c0b0 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 11:13:54 +0200
+Subject: [PATCH] libmount: add fd_target to context for TOCTOU prevention
+
+Add a pinned O_PATH target fd to libmnt_context with lazy-open getter
+mnt_context_get_target_fd() and mnt_context_close_target_fd().
+
+The fd is opened via ul_open_no_symlinks() (RESOLVE_NO_SYMLINKS) to
+reject symlinks at any path component.  The fd is closed on context
+reset.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 78a860982e036f38fe9c0b3344998df5ac2c2ff5)
+
+Upstream: https://github.com/util-linux/util-linux/commit/0b010025a0e429bc80355c94db86a843395d49e2
+CVE: CVE-2026-53613
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libmount/src/context.c           | 43 ++++++++++++++++++++++++++++++++
+ libmount/src/context_mount.c     |  7 ++++++
+ libmount/src/hook_mount.c        | 18 ++++++++++++-
+ libmount/src/hook_mount_legacy.c |  3 +++
+ libmount/src/mountP.h            |  7 ++++++
+ 5 files changed, 77 insertions(+), 1 deletion(-)
+
+diff --git a/libmount/src/context.c b/libmount/src/context.c
+index a0ca25f8b74..3ef40d6d85a 100644
+--- a/libmount/src/context.c
++++ b/libmount/src/context.c
+@@ -37,6 +37,7 @@
+  */
+ 
+ #include "mountP.h"
++#include "fileutils.h"
+ #include "strutils.h"
+ #include "namespace.h"
+ #include "match.h"
+@@ -67,6 +68,7 @@ struct libmnt_context *mnt_new_context(void)
+ 	cxt->ns_orig.fd = -1;
+ 	cxt->ns_tgt.fd = -1;
+ 	cxt->ns_cur = &cxt->ns_orig;
++	cxt->fd_target = -1;
+ 
+ 	cxt->map_linux = mnt_get_builtin_optmap(MNT_LINUX_MAP);
+ 	cxt->map_userspace = mnt_get_builtin_optmap(MNT_USERSPACE_MAP);
+@@ -173,6 +175,7 @@ int mnt_reset_context(struct libmnt_context *cxt)
+ 	cxt->map_userspace = mnt_get_builtin_optmap(MNT_USERSPACE_MAP);
+ 
+ 	mnt_context_reset_status(cxt);
++	mnt_context_close_target_fd(cxt);
+ 	mnt_context_deinit_hooksets(cxt);
+ 
+ 	if (cxt->table_fltrcb)
+@@ -398,6 +401,46 @@ int mnt_context_is_restricted(struct libmnt_context *cxt)
+ 	return cxt->restricted;
+ }
+ 
++int mnt_context_target_fd_required(struct libmnt_context *cxt)
++{
++	return mnt_context_is_restricted(cxt);
++}
++
++int mnt_context_reopen_target_fd(struct libmnt_context *cxt)
++{
++	assert(cxt);
++
++	if (!mnt_context_target_fd_required(cxt))
++		return 0;
++	mnt_context_close_target_fd(cxt);
++	if (mnt_context_get_target_fd(cxt) < 0)
++		return -errno;
++	return 0;
++}
++
++int mnt_context_get_target_fd(struct libmnt_context *cxt)
++{
++	assert(cxt);
++
++	if (cxt->fd_target < 0) {
++		const char *target = mnt_fs_get_target(cxt->fs);
++
++		if (target)
++			cxt->fd_target = ul_open_no_symlinks(target,
++						O_PATH | O_CLOEXEC, 0);
++	}
++	return cxt->fd_target;
++}
++
++void mnt_context_close_target_fd(struct libmnt_context *cxt)
++{
++	assert(cxt);
++
++	if (cxt->fd_target >= 0)
++		close(cxt->fd_target);
++	cxt->fd_target = -1;
++}
++
+ /**
+  * mnt_context_force_unrestricted:
+  * @cxt: mount context
+diff --git a/libmount/src/context_mount.c b/libmount/src/context_mount.c
+index 28e01309d8c..77435684b4a 100644
+--- a/libmount/src/context_mount.c
++++ b/libmount/src/context_mount.c
+@@ -733,6 +733,13 @@ static int prepare_target(struct libmnt_context *cxt)
+ 	if (rc == 0)
+ 		rc = mnt_context_call_hooks(cxt, MNT_STAGE_PREP_TARGET);
+ 
++	if (rc == 0
++	    && mnt_context_target_fd_required(cxt)
++	    && mnt_context_get_target_fd(cxt) < 0) {
++		DBG(CXT, ul_debugobj(cxt, "failed to pin target"));
++		rc = -errno;
++	}
++
+ 	if (!mnt_context_switch_ns(cxt, ns_old))
+ 		return -MNT_ERR_NAMESPACE;
+ 
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 37179fb59ad..50e656e04af 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -541,9 +541,25 @@ static int hook_attach_target(struct libmnt_context *cxt,
+ 		umount2(target, MNT_DETACH);
+ 	}
+ 
+-	rc = move_mount(api->fd_tree, "", AT_FDCWD, target, MOVE_MOUNT_F_EMPTY_PATH);
++	/* fd_target is open in restricted mode (see prepare_target()) */
++	if (mnt_context_target_fd_required(cxt)) {
++		int fd = mnt_context_get_target_fd(cxt);
++
++		if (fd < 0)
++			return -errno;
++		rc = move_mount(api->fd_tree, "", fd, "",
++				MOVE_MOUNT_F_EMPTY_PATH | MOVE_MOUNT_T_EMPTY_PATH);
++	} else
++		rc = move_mount(api->fd_tree, "", AT_FDCWD, target,
++				MOVE_MOUNT_F_EMPTY_PATH);
++
+ 	hookset_set_syscall_status(cxt, "move_mount", rc == 0);
+ 
++	if (rc == 0) {
++		/* re-open to point to the mounted filesystem root */
++		rc = mnt_context_reopen_target_fd(cxt);
++	}
++
+ 	return rc == 0 ? 0 : -errno;
+ }
+ 
+diff --git a/libmount/src/hook_mount_legacy.c b/libmount/src/hook_mount_legacy.c
+index 94a8fc685eb..d6631b08864 100644
+--- a/libmount/src/hook_mount_legacy.c
++++ b/libmount/src/hook_mount_legacy.c
+@@ -248,6 +248,9 @@ static int hook_mount(struct libmnt_context *cxt,
+ 		return rc;
+ 	}
+ 
++	/* re-open to point to the mounted filesystem root */
++	rc = mnt_context_reopen_target_fd(cxt);
++
+ 	cxt->syscall_status = 0;
+ 	return rc;
+ }
+diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
+index a4ce7c04268..97d0bf8fa79 100644
+--- a/libmount/src/mountP.h
++++ b/libmount/src/mountP.h
+@@ -443,6 +443,8 @@ struct libmnt_context
+ 	unsigned int	has_selinux_opt : 1;	/* temporary for broken fsconfig() syscall */
+ 	unsigned int    force_clone : 1;	/* OPEN_TREE_CLONE */
+ 
++	int		fd_target;	/* pinned target fd (RESOLVE_NO_SYMLINKS) */
++
+ 	struct list_head	hooksets_datas;	/* global hooksets data */
+ 	struct list_head	hooksets_hooks;	/* global hooksets data */
+ };
+@@ -640,6 +642,11 @@ extern int mnt_context_prepare_update(struct libmnt_context *cxt);
+ extern int mnt_context_merge_mflags(struct libmnt_context *cxt);
+ extern int mnt_context_update_tabs(struct libmnt_context *cxt);
+ 
++extern int mnt_context_target_fd_required(struct libmnt_context *cxt);
++extern int mnt_context_get_target_fd(struct libmnt_context *cxt);
++extern void mnt_context_close_target_fd(struct libmnt_context *cxt);
++extern int mnt_context_reopen_target_fd(struct libmnt_context *cxt);
++
+ extern int mnt_context_umount_setopt(struct libmnt_context *cxt, int c, char *arg);
+ extern int mnt_context_mount_setopt(struct libmnt_context *cxt, int c, char *arg);
+ 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3f929a89a7..b0f7b7e988 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -46,6 +46,10 @@ UTIL_LINUX_IGNORE_CVES += CVE-2025-14104
 # 0010-CVE-2026-53612.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-53612
 
+# 0011-CVE-2026-53613-1.patch
+# 0012-CVE-2026-53613-2.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-53613
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
