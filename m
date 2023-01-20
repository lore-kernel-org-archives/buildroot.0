Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E987C25B4E
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD8E860FB4;
	Fri, 20 Jan 2023 19:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD8E860FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WREKNOjVj9Zi; Fri, 20 Jan 2023 19:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91146612B4;
	Fri, 20 Jan 2023 19:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91146612B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2E01BF2BB
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B6AC415BD
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6AC415BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5jtvRUVHBYZ for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 19:28:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A552F40926
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A552F40926
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 19:28:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4446290wms.3
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 11:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7qWMktVVctwSNr88jyEWvsy+ooa3SXl/bgxjyHPqbo8=;
 b=ISy7i2ydBLiP6XVIzC2dU4y+hsSihce8c33YqLcFfFD+1JlcnOjmQaxpvqhum0edMi
 ANPwUy+2rkflPd1cOE+NQ4oJ2Mpf/buACtbmPEVLT4AMLI6SUKKNgxvsBfZOsukZbBQa
 iZEJppng5cuBqO6s4sDCZunZ9GkfSLN/KB1zgfnpsQ0b+ovBwmG5R+HwTf98NTCU40Q3
 AU3vwVSULTjKu/2jCk/08F4RbfuppS1pHFn9joj6L1G0cR1AA2xLY3A2eEAq6IhGxlMY
 1GmNl4eOzyzsFKB1Ne5wzi7wWrFFHynx7BsrCEioZ0AU+hCaDUCf0wApPtqp3Wi3in5c
 VHgA==
X-Gm-Message-State: AFqh2kpF6gsoXJhW3NmTBPwufRbxSucldz2s1t1UCTzB4IyIDWLyBcq5
 J1inGdK6tWlwOlSKORQiFoQF3Ik5+0I=
X-Google-Smtp-Source: AMrXdXs3dTt9CDS2HgJRlDJqOdZjuwV6lTIOF+kr14r+4u46yfArp+PRjBiJZOi22PJYKJBKD15nYw==
X-Received: by 2002:a05:600c:3d16:b0:3db:1ae8:ad98 with SMTP id
 bh22-20020a05600c3d1600b003db1ae8ad98mr9103833wmb.33.1674242929155; 
 Fri, 20 Jan 2023 11:28:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1cf315000000b003c21ba7d7d6sm3025025wmq.44.2023.01.20.11.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 11:28:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 20:28:46 +0100
Message-Id: <20230120192846.7362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7qWMktVVctwSNr88jyEWvsy+ooa3SXl/bgxjyHPqbo8=;
 b=fAR47OSzL3H4v+xQy0Yg27trVab5bGO0raEX4MGyjicIUrt9WAFPJqsuOcpSCmLZNv
 szsuw22NUJOU5MFpsVDgXmB1KavESneE3clXGCAH2r2h5SCH4U8MOzlTe73Ebp5lIt35
 fIvh+DZu13qRrTaE41oIN71orFlF9j7BtBJluP+OB9WP/iYrfa5T9sDx/vI/8zwSAMXm
 3r5ZzcBLrJgO+UEIxJgD+N7mKaEXULoCuz6AgieIYlUWDj7amoYVlw7TCMvgCcEKo5xT
 dcpy1rY4zt89TWsHRJOfV6f4zc2lJuDCSkCygN6nynlnQHPym3CfU+4T5NnxakR0V5oe
 shWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fAR47OSz
Subject: [Buildroot] [PATCH 1/1] package/lxc: security bump to version 5.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-47952: lxc-user-nic in lxc through 5.0.1 is installed
  setuid root, and may allow local users to infer whether any file
  exists, even within a protected directory tree, because "Failed to
  open" often indicates that a file does not exist, whereas "does not
  refer to a network namespace path" often indicates that a file exists.
  NOTE: this is different from CVE-2018-6556 because the CVE-2018-6556
  fix design was based on the premise that "we will report back to the
  user that the open() failed but the user has no way of knowing why it
  failed"; however, in many realistic cases, there are no plausible
  reasons for failing except that the file does not exist.
- Drop patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-where-struct-mount_attr-is-declared.patch | 186 ------------------
 ...thod_async-to-replace-the-asyncv-one.patch |  47 -----
 ...uild-detect-sys-pidfd.h-availability.patch |  55 ------
 package/lxc/lxc.hash                          |   2 +-
 package/lxc/lxc.mk                            |   2 +-
 5 files changed, 2 insertions(+), 290 deletions(-)
 delete mode 100644 package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch
 delete mode 100644 package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
 delete mode 100644 package/lxc/0003-build-detect-sys-pidfd.h-availability.patch

diff --git a/package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch b/package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch
deleted file mode 100644
index 8de7adcc56..0000000000
--- a/package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From c1115e1503bf955c97f4cf3b925a6a9f619764c3 Mon Sep 17 00:00:00 2001
-From: Christian Brauner <brauner@kernel.org>
-Date: Tue, 9 Aug 2022 16:14:25 +0200
-Subject: [PATCH] build: detect where struct mount_attr is declared
-
-Fixes: #4176
-Signed-off-by: Christian Brauner (Microsoft) <christian.brauner@ubuntu.com>
-[Retrieved from:
-https://github.com/lxc/lxc/commit/c1115e1503bf955c97f4cf3b925a6a9f619764c3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build                | 30 ++++++++++++++++++++++++++++--
- src/lxc/conf.c             |  6 +++---
- src/lxc/conf.h             |  2 +-
- src/lxc/mount_utils.c      |  6 +++---
- src/lxc/syscall_wrappers.h | 12 ++++++++++--
- 5 files changed, 45 insertions(+), 11 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index a145faf069..f679aabbc8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -590,7 +590,6 @@ decl_headers = '''
- foreach decl: [
-     '__aligned_u64',
-     'struct clone_args',
--    'struct mount_attr',
-     'struct open_how',
-     'struct rtnl_link_stats64',
- ]
-@@ -610,7 +609,6 @@ foreach tuple: [
-     ['struct seccomp_notif_sizes'],
-     ['struct clone_args'],
-     ['__aligned_u64'],
--    ['struct mount_attr'],
-     ['struct open_how'],
-     ['struct rtnl_link_stats64'],
- ]
-@@ -630,6 +628,34 @@ foreach tuple: [
-     endif
- endforeach
- 
-+## Types.
-+decl_headers = '''
-+#include <sys/mount.h>
-+'''
-+
-+# We get -1 if the size cannot be determined
-+if cc.sizeof('struct mount_attr', prefix: decl_headers, args: '-D_GNU_SOURCE') > 0
-+    srcconf.set10('HAVE_' + 'struct mount_attr'.underscorify().to_upper(), true)
-+    found_types += 'struct mount_attr (sys/mount.h)'
-+else
-+    srcconf.set10('HAVE_' + 'struct mount_attr'.underscorify().to_upper(), false)
-+    missing_types += 'struct mount_attr (sys/mount.h)'
-+endif
-+
-+## Types.
-+decl_headers = '''
-+#include <linux/mount.h>
-+'''
-+
-+# We get -1 if the size cannot be determined
-+if cc.sizeof('struct mount_attr', prefix: decl_headers, args: '-D_GNU_SOURCE') > 0
-+    srcconf.set10('HAVE_UAPI_' + 'struct mount_attr'.underscorify().to_upper(), true)
-+    found_types += 'struct mount_attr (linux/mount.h)'
-+else
-+    srcconf.set10('HAVE_UAPI_' + 'struct mount_attr'.underscorify().to_upper(), false)
-+    missing_types += 'struct mount_attr (linux/mount.h)'
-+endif
-+
- ## Headers.
- foreach ident: [
-     ['bpf',               '''#include <sys/syscall.h>
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index ffbe74c2f6..4193cd07f5 100644
---- a/src/lxc/conf.c
-+++ b/src/lxc/conf.c
-@@ -2885,7 +2885,7 @@ static int __lxc_idmapped_mounts_child(struct lxc_handler *handler, FILE *f)
- 		struct lxc_mount_options opts = {};
- 		int dfd_from;
- 		const char *source_relative, *target_relative;
--		struct lxc_mount_attr attr = {};
-+		struct mount_attr attr = {};
- 
- 		ret = parse_lxc_mount_attrs(&opts, mntent.mnt_opts);
- 		if (ret < 0)
-@@ -3005,7 +3005,7 @@ static int __lxc_idmapped_mounts_child(struct lxc_handler *handler, FILE *f)
- 
- 		/* Set propagation mount options. */
- 		if (opts.attr.propagation) {
--			attr = (struct lxc_mount_attr) {
-+			attr = (struct mount_attr) {
- 				.propagation = opts.attr.propagation,
- 			};
- 
-@@ -4109,7 +4109,7 @@ int lxc_idmapped_mounts_parent(struct lxc_handler *handler)
- 
- 	for (;;) {
- 		__do_close int fd_from = -EBADF, fd_userns = -EBADF;
--		struct lxc_mount_attr attr = {};
-+		struct mount_attr attr = {};
- 		struct lxc_mount_options opts = {};
- 		ssize_t ret;
- 
-diff --git a/src/lxc/conf.h b/src/lxc/conf.h
-index 7dc2f15b60..772479f9e1 100644
---- a/src/lxc/conf.h
-+++ b/src/lxc/conf.h
-@@ -223,7 +223,7 @@ struct lxc_mount_options {
- 	unsigned long mnt_flags;
- 	unsigned long prop_flags;
- 	char *data;
--	struct lxc_mount_attr attr;
-+	struct mount_attr attr;
- 	char *raw_options;
- };
- 
-diff --git a/src/lxc/mount_utils.c b/src/lxc/mount_utils.c
-index bba75f933c..88dd73ee36 100644
---- a/src/lxc/mount_utils.c
-+++ b/src/lxc/mount_utils.c
-@@ -31,7 +31,7 @@ lxc_log_define(mount_utils, lxc);
-  * setting in @attr_set, but must also specify MOUNT_ATTR__ATIME in the
-  * @attr_clr field.
-  */
--static inline void set_atime(struct lxc_mount_attr *attr)
-+static inline void set_atime(struct mount_attr *attr)
- {
- 	switch (attr->attr_set & MOUNT_ATTR__ATIME) {
- 	case MOUNT_ATTR_RELATIME:
-@@ -272,7 +272,7 @@ int create_detached_idmapped_mount(const char *path, int userns_fd,
- {
- 	__do_close int fd_tree_from = -EBADF;
- 	unsigned int open_tree_flags = OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC;
--	struct lxc_mount_attr attr = {
-+	struct mount_attr attr = {
- 		.attr_set	= MOUNT_ATTR_IDMAP | attr_set,
- 		.attr_clr	= attr_clr,
- 		.userns_fd	= userns_fd,
-@@ -335,7 +335,7 @@ int __fd_bind_mount(int dfd_from, const char *path_from, __u64 o_flags_from,
- 		    __u64 attr_clr, __u64 propagation, int userns_fd,
- 		    bool recursive)
- {
--	struct lxc_mount_attr attr = {
-+	struct mount_attr attr = {
- 		.attr_set	= attr_set,
- 		.attr_clr	= attr_clr,
- 		.propagation	= propagation,
-diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
-index a5e98b565c..c8a7d0c7b7 100644
---- a/src/lxc/syscall_wrappers.h
-+++ b/src/lxc/syscall_wrappers.h
-@@ -18,6 +18,12 @@
- #include "macro.h"
- #include "syscall_numbers.h"
- 
-+#if HAVE_STRUCT_MOUNT_ATTR
-+#include <sys/mount.h>
-+#elif HAVE_UAPI_STRUCT_MOUNT_ATTR
-+#include <linux/mount.h>
-+#endif
-+
- #ifdef HAVE_LINUX_MEMFD_H
- #include <linux/memfd.h>
- #endif
-@@ -210,16 +216,18 @@ extern int fsmount(int fs_fd, unsigned int flags, unsigned int attr_flags);
- /*
-  * mount_setattr()
-  */
--struct lxc_mount_attr {
-+#if !HAVE_STRUCT_MOUNT_ATTR && !HAVE_UAPI_STRUCT_MOUNT_ATTR
-+struct mount_attr {
- 	__u64 attr_set;
- 	__u64 attr_clr;
- 	__u64 propagation;
- 	__u64 userns_fd;
- };
-+#endif
- 
- #if !HAVE_MOUNT_SETATTR
- static inline int mount_setattr(int dfd, const char *path, unsigned int flags,
--				struct lxc_mount_attr *attr, size_t size)
-+				struct mount_attr *attr, size_t size)
- {
- 	return syscall(__NR_mount_setattr, dfd, path, flags, attr, size);
- }
diff --git a/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch b/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
deleted file mode 100644
index 22013cb363..0000000000
--- a/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 25 Aug 2022 05:45:53 -0700
-Subject: [PATCH] use sd_bus_call_method_async to replace the asyncv one
-
-The sd_bus_call_method_asyncv's 10th parameter is of type
-va_list and supplying NULL when invoking it causes compilation
-error. Just replace it with the async one.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Retrieved from:
-https://github.com/lxc/lxc/commit/b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build              | 4 ++--
- src/lxc/cgroups/cgfsng.c | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 21955a0504..f8bdcf4e83 100644
---- a/meson.build
-+++ b/meson.build
-@@ -295,9 +295,9 @@ if not want_sd_bus.disabled()
-         has_sd_bus = false
-     endif
- 
--    if not cc.has_function('sd_bus_call_method_asyncv', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
-+    if not cc.has_function('sd_bus_call_method_async', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
-         if not sd_bus_optional
--            error('libsystemd misses required sd_bus_call_method_asyncv function')
-+            error('libsystemd misses required sd_bus_call_method_async function')
-         endif
- 
-         has_sd_bus = false
-diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
-index 8a3615893f..d90e5385e1 100644
---- a/src/lxc/cgroups/cgfsng.c
-+++ b/src/lxc/cgroups/cgfsng.c
-@@ -1232,7 +1232,7 @@ static int unpriv_systemd_create_scope(struct cgroup_ops *ops, struct lxc_conf *
- 	if (r < 0)
- 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to connect to user bus: %s", strerror(-r));
- 
--	r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
-+	r = sd_bus_call_method_async(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL);
- 	if (r < 0)
- 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to subscribe to signals: %s", strerror(-r));
- 
diff --git a/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch b/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch
deleted file mode 100644
index 3aa598407f..0000000000
--- a/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ef1e0607b82e27350c2d677d649c6a0a9693fd40 Mon Sep 17 00:00:00 2001
-From: Christian Brauner <brauner@kernel.org>
-Date: Tue, 9 Aug 2022 16:27:40 +0200
-Subject: [PATCH] build: detect sys/pidfd.h availability
-
-Fixes: #4176
-Signed-off-by: Christian Brauner (Microsoft) <christian.brauner@ubuntu.com>
-
-[Retrieved from:
-https://github.com/lxc/lxc/commit/ef1e0607b82e27350c2d677d649c6a0a9693fd40]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build             | 1 +
- src/lxc/process_utils.h | 6 ++++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index f679aabbc8..e999542336 100644
---- a/meson.build
-+++ b/meson.build
-@@ -735,6 +735,7 @@ foreach tuple: [
-     ['sys/resource.h'],
-     ['sys/memfd.h'],
-     ['sys/personality.h'],
-+    ['sys/pidfd.h'],
-     ['sys/signalfd.h'],
-     ['sys/timerfd.h'],
-     ['pty.h'],
-diff --git a/src/lxc/process_utils.h b/src/lxc/process_utils.h
-index 9c15b15741..ed84741d0e 100644
---- a/src/lxc/process_utils.h
-+++ b/src/lxc/process_utils.h
-@@ -15,6 +15,10 @@
- #include <sys/syscall.h>
- #include <unistd.h>
- 
-+#if HAVE_SYS_PIDFD_H
-+#include <sys/pidfd.h>
-+#endif
-+
- #include "compiler.h"
- #include "syscall_numbers.h"
- 
-@@ -136,9 +140,11 @@
- #endif
- 
- /* waitid */
-+#if !HAVE_SYS_PIDFD_H
- #ifndef P_PIDFD
- #define P_PIDFD 3
- #endif
-+#endif
- 
- #ifndef CLONE_ARGS_SIZE_VER0
- #define CLONE_ARGS_SIZE_VER0 64 /* sizeof first published struct */
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index c18e062cc1..2dd983a361 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d8195423bb1e206f8521d24b6cde4789f043960c7cf065990a9cf741dcfd4222  lxc-5.0.1.tar.gz
+sha256  bea08d2e49efcee34fa58acd2bc95c0adc64d291c07f4cfaf4ac1d8ac5a36f45  lxc-5.0.2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index e1639c5f15..4a4d3a6212 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 5.0.1
+LXC_VERSION = 5.0.2
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
