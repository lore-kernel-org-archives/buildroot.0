Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB62CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 09:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7F360ED0;
	Fri, 26 Jun 2026 09:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39t0WWUjSnsf; Fri, 26 Jun 2026 09:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB5760EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782467855;
	bh=/QGfzD2Il/dJsF6ykP4KIvs+MVF7+Pu0lOJ1sgUTa+s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mKdR8ARnLtg1Q1qNchicHoA27LwcTnA9UlBsQW1+84rzJqgYvL6qG/KzvYZDZp4lr
	 qsqY3XBFpyuOUM9e1tRfGkqegzM46ZyWw1vftJDxBe3/KKGfBS95X2Q7PJQoi6UT/Z
	 u3WyIN+VOMJrFPKK4IWCjB+PrBNRRS1dQgGzya7RR3IlnnauPlORNpZRPbaLNqwY3n
	 ulZYs0qRIYBn+mOuElSIplyu2BOsFOprpqU766tq8eYoQHSseQhk0j+zNzMr/C0KTn
	 NLCNJPg1ffIbWx8IwO/x4ScsJL+puZfYo5lLVGJ1o0xW8m0g/P38hdGHnEBgaq60S0
	 VNyT9DuQoKrZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB5760EDF;
	Fri, 26 Jun 2026 09:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06DF93A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1010403F1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Lsl8FgHiSza for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC361406D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC361406D1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC361406D1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49241a577d8so5844655e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 02:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782467847; x=1783072647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6lw3DVXbOyLPLx5x79dAjitEweDkYDiy+TD0Ii+ocL0=;
 b=ZEbS8SeZDFE/rPygP7pp2tNWW0sTjGkb/d3r13cR67/Vz1HQCdniyzIDBdBjXWi0/V
 dcj+jQ7xrUAwPTWTioQ89ygE0COSx/VGxaLuyQA1m3/X6zCidAi9Z/ycwXK7HN9XF2S7
 RAMYDGa5J2YzBBYBJXE8rA9Xu1slBNRxFT6zkyhEVfGfdf5Ionfm4wF6++cZNmIDixuz
 zkazyax9MOdYZ3tFfFPTxnRZp8KFKcaXu7k1b67sUDl6Aq59xM6t4Ys2sCIVeLnp1iNp
 ldEZS1Fhy6e2Bm5Ah/8VyEDiKYOVuFZUo+71JS9ZhyqDvJgcsq97RDhb+ztTNDwQyLbV
 YQ0A==
X-Gm-Message-State: AOJu0YySLGNDQkQjxrSET8YXSJiI4z7sepKwy9eJLGOL8li7G1CdZ4nl
 tCtlBh886npt5zXWx5MhrZZY+aObmHG1ufUcUNJPUczASvCxL9wV/c1xKWmRrYSiQlVqilZfjtr
 9qRB0
X-Gm-Gg: AfdE7clPBQFgASbv7okBUwHMOrYdou4NR4vReiX4A5GD0QO9fyMHmT1BzRFor96/pGz
 Ki+wWuffMiMwxMrybhAv2iJqLwHKCp+m+wHx3ZgWALc0LXfi0dtvAaoGiVjMnQ7/YyyrM/WCJD3
 jCvYexI8GWRpXi4giWXAsKMO+nj41LgvqoGCfXs0mw1L7cjugrwgbPxXM/Cp9z6hYWL097Pq4gb
 80iOTmWC2g5gMovNKohc1mxadxg3dqinNJRe5hc6GrpqyZ4t1AKMc1mR/CDeFdkkJzfDu6pUozj
 GHDB5F9zjrm7S93kQ6dtIZkyd/7P1mrYgYArHGeF+M4ZOp0UcGSeXMdbSZ3V3n/GvaLTX+fRd38
 pkcd4YxBQKi62KHjKwMxy+K4B2KMZat+0lQ3vZ51rKYrW4abnPfwWtVo0DDQkPuCa1Lq6ca+OUM
 Etwfne
X-Received: by 2002:a05:600c:e54a:10b0:490:b8ee:d6a5 with SMTP id
 5b1f17b1804b1-4926683b8ebmr60456505e9.6.1782467847458; 
 Fri, 26 Jun 2026 02:57:27 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm68222045e9.1.2026.06.26.02.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 02:57:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 26 Jun 2026 11:57:21 +0200
Message-ID: <20260626095724.248205-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626095724.248205-1-thomas.perale@mind.be>
References: <20260626095724.248205-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782467847; x=1783072647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lw3DVXbOyLPLx5x79dAjitEweDkYDiy+TD0Ii+ocL0=;
 b=UObSgo/s0Zuz5sNbBKYiRdtqElu1TddmrSsp0sbL5YN4QgXpID5izbOFQW/S0nUnqM
 oc4QuGYL6tgOuMvdgHuKFEBXqFHsqJZScy9rRjogmDSfHuHI/rMVPy1lnbEFm+hEJboy
 kTNcS20qYqbI5JUNlRmkH/YjfsoaDxBP3a9H6ijvHrFfI5xAdx+oviZbHt9I5W9rrv+k
 tOyPTPLqOy9332H4YjWNs5NIEUiJhP9nnaQNm7cAeabWlCgIWdCA2/+uHlg1AhzSpA2d
 rLaTHUjHjMIL0v38mnRVtBG9lNJojA1KBQqW+h8yqgrEW4DrlobVtj+MxK5Y/DyM9fcj
 oqeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UObSgo/s
Subject: [Buildroot] [PATCH 2025.02.x 4/5] package/util-linux: backport
 patch CVE-2026-53613
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 .../util-linux/0011-CVE-2026-53613-1.patch    |  99 +++++++++
 .../util-linux/0012-CVE-2026-53613-2.patch    | 189 ++++++++++++++++++
 package/util-linux/util-linux.mk              |   4 +
 3 files changed, 292 insertions(+)
 create mode 100644 package/util-linux/0011-CVE-2026-53613-1.patch
 create mode 100644 package/util-linux/0012-CVE-2026-53613-2.patch

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
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
