Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11163C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824C160AFD;
	Sat,  5 Nov 2022 21:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 824C160AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yk8OgvbYhkzV; Sat,  5 Nov 2022 21:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2D160A90;
	Sat,  5 Nov 2022 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E2D160A90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0681BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4116C408CB
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4116C408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWLcVxS70nnQ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:23:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6437A408BD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6437A408BD
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:23:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g12so11276563wrs.10
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 14:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/rRq6uNNU79eLCvXO9Xv2AxPPQGPT2n+M2yXpZwi2I=;
 b=Ys2hkurtYpZnrCe4S4ZRw8+g9W42WZI6dLNJJ3E8zL4vE7txDHgiUQXokDkiHE3ZAO
 XEcjEofhlzgDqNopU6bIvvmLCp0scOHmgaSiKRtyCsbzq/ypfX2Wck89q4gLzaX8xq9W
 hj9aKcjr/jFdrSLtXz7ai5uNwd3oJ9bhqcQ0ook8dqXWG632DJmh6qFRn0D/tkDJKo5c
 YfJmWTcCMLMdLQZYcdSvM43zOksnsqdWfYfPQa5gz+neCEtKWiR8wBHnMv0rPrafI8i4
 pLnZbqREEdKkliELpi9sWfjAJ4KgR8+0bOvxQliLWExEXoSk6RjwOmguE7BGp5UZUEhf
 vLkQ==
X-Gm-Message-State: ACrzQf3wvof8s0y3sYLvFk+gQZQIXtHNX8KlJUgO+Uo5a96IeBEXfv4T
 zHui2SGCJ4CU/rpFNHLwX2daszWWWVU=
X-Google-Smtp-Source: AMsMyM42TwFB7Qb2PN3e7EwuyFjNWjU+9pB5CcpQP0h8g+625FaSC4WSRk8JdBMzBd6cyWkMiM4s2A==
X-Received: by 2002:adf:dd91:0:b0:236:a261:6930 with SMTP id
 x17-20020adfdd91000000b00236a2616930mr26154195wrl.551.1667683425084; 
 Sat, 05 Nov 2022 14:23:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g1-20020a7bc4c1000000b003b3365b38f9sm3624421wmk.10.2022.11.05.14.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 14:23:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 22:23:43 +0100
Message-Id: <20221105212343.353414-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m/rRq6uNNU79eLCvXO9Xv2AxPPQGPT2n+M2yXpZwi2I=;
 b=ilAOUpd/nWHcg2b0oHu0hULanjtpH1hLzpgEcr74LLApSkh+KnW0WJTORGZYvjjngS
 +s3ucozG1PfJpb7CcY/yLzseQP7j1Vuu5BR+AQeosWNqTcC+oln0HR+syh83i+pdK7v6
 TML7hIJExcF0NMnZeL9OpcrYrOeUDGI3zxukrEFevXOFvH7TrlAZawPC2CafdB8SPTBC
 o68T1sl7O/Qu0DbBTGJL8eMzG2pZaW4rHyfBDSlmp7+6yXldQYlFs+2YgbrrMx2v8+nh
 Bq+vDPYC+qUubUZOqfCX0Lt7i4kAr1yEZxhOvTVoUjqSTpQ4SGBqZDVxZ1Ytx8VkjbBz
 Nvvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ilAOUpd/
Subject: [Buildroot] [PATCH v2,1/1] package/lxc: bump to version 5.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LXC 5.0 will be supported until June 2027 and our current LTS release,
LXC 4.0 will now switch to a slower maintenance pace, only getting
critical bugfixes and security updates.

We strongly recommend all LXC users to plan an upgrade to the 5.0
branch.

- Switch to meson-package
- Add an upstream patch to fix the following build failure with glibc
  2.36 (unfortunately upstream doesn't plan to fix this for 4.x:
  https://github.com/lxc/lxc/issues/4183 and patch is only working with
  meson, not autotools)

https://discuss.linuxcontainers.org/t/lxc-5-0-lts-has-been-released
https://discuss.linuxcontainers.org/t/lxc-5-0-1-has-been-released

Fixes:
 - http://autobuild.buildroot.org/results/f77e2dc44c9a224f280e08089a890e85c302274f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Rebase patch so it applies cleanly on master

 ...-where-struct-mount_attr-is-declared.patch | 186 ++++++++++++++++++
 package/lxc/lxc.hash                          |   2 +-
 package/lxc/lxc.mk                            |  36 ++--
 3 files changed, 204 insertions(+), 20 deletions(-)
 create mode 100644 package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch

diff --git a/package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch b/package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch
new file mode 100644
index 0000000000..8de7adcc56
--- /dev/null
+++ b/package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch
@@ -0,0 +1,186 @@
+From c1115e1503bf955c97f4cf3b925a6a9f619764c3 Mon Sep 17 00:00:00 2001
+From: Christian Brauner <brauner@kernel.org>
+Date: Tue, 9 Aug 2022 16:14:25 +0200
+Subject: [PATCH] build: detect where struct mount_attr is declared
+
+Fixes: #4176
+Signed-off-by: Christian Brauner (Microsoft) <christian.brauner@ubuntu.com>
+[Retrieved from:
+https://github.com/lxc/lxc/commit/c1115e1503bf955c97f4cf3b925a6a9f619764c3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build                | 30 ++++++++++++++++++++++++++++--
+ src/lxc/conf.c             |  6 +++---
+ src/lxc/conf.h             |  2 +-
+ src/lxc/mount_utils.c      |  6 +++---
+ src/lxc/syscall_wrappers.h | 12 ++++++++++--
+ 5 files changed, 45 insertions(+), 11 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a145faf069..f679aabbc8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -590,7 +590,6 @@ decl_headers = '''
+ foreach decl: [
+     '__aligned_u64',
+     'struct clone_args',
+-    'struct mount_attr',
+     'struct open_how',
+     'struct rtnl_link_stats64',
+ ]
+@@ -610,7 +609,6 @@ foreach tuple: [
+     ['struct seccomp_notif_sizes'],
+     ['struct clone_args'],
+     ['__aligned_u64'],
+-    ['struct mount_attr'],
+     ['struct open_how'],
+     ['struct rtnl_link_stats64'],
+ ]
+@@ -630,6 +628,34 @@ foreach tuple: [
+     endif
+ endforeach
+ 
++## Types.
++decl_headers = '''
++#include <sys/mount.h>
++'''
++
++# We get -1 if the size cannot be determined
++if cc.sizeof('struct mount_attr', prefix: decl_headers, args: '-D_GNU_SOURCE') > 0
++    srcconf.set10('HAVE_' + 'struct mount_attr'.underscorify().to_upper(), true)
++    found_types += 'struct mount_attr (sys/mount.h)'
++else
++    srcconf.set10('HAVE_' + 'struct mount_attr'.underscorify().to_upper(), false)
++    missing_types += 'struct mount_attr (sys/mount.h)'
++endif
++
++## Types.
++decl_headers = '''
++#include <linux/mount.h>
++'''
++
++# We get -1 if the size cannot be determined
++if cc.sizeof('struct mount_attr', prefix: decl_headers, args: '-D_GNU_SOURCE') > 0
++    srcconf.set10('HAVE_UAPI_' + 'struct mount_attr'.underscorify().to_upper(), true)
++    found_types += 'struct mount_attr (linux/mount.h)'
++else
++    srcconf.set10('HAVE_UAPI_' + 'struct mount_attr'.underscorify().to_upper(), false)
++    missing_types += 'struct mount_attr (linux/mount.h)'
++endif
++
+ ## Headers.
+ foreach ident: [
+     ['bpf',               '''#include <sys/syscall.h>
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index ffbe74c2f6..4193cd07f5 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -2885,7 +2885,7 @@ static int __lxc_idmapped_mounts_child(struct lxc_handler *handler, FILE *f)
+ 		struct lxc_mount_options opts = {};
+ 		int dfd_from;
+ 		const char *source_relative, *target_relative;
+-		struct lxc_mount_attr attr = {};
++		struct mount_attr attr = {};
+ 
+ 		ret = parse_lxc_mount_attrs(&opts, mntent.mnt_opts);
+ 		if (ret < 0)
+@@ -3005,7 +3005,7 @@ static int __lxc_idmapped_mounts_child(struct lxc_handler *handler, FILE *f)
+ 
+ 		/* Set propagation mount options. */
+ 		if (opts.attr.propagation) {
+-			attr = (struct lxc_mount_attr) {
++			attr = (struct mount_attr) {
+ 				.propagation = opts.attr.propagation,
+ 			};
+ 
+@@ -4109,7 +4109,7 @@ int lxc_idmapped_mounts_parent(struct lxc_handler *handler)
+ 
+ 	for (;;) {
+ 		__do_close int fd_from = -EBADF, fd_userns = -EBADF;
+-		struct lxc_mount_attr attr = {};
++		struct mount_attr attr = {};
+ 		struct lxc_mount_options opts = {};
+ 		ssize_t ret;
+ 
+diff --git a/src/lxc/conf.h b/src/lxc/conf.h
+index 7dc2f15b60..772479f9e1 100644
+--- a/src/lxc/conf.h
++++ b/src/lxc/conf.h
+@@ -223,7 +223,7 @@ struct lxc_mount_options {
+ 	unsigned long mnt_flags;
+ 	unsigned long prop_flags;
+ 	char *data;
+-	struct lxc_mount_attr attr;
++	struct mount_attr attr;
+ 	char *raw_options;
+ };
+ 
+diff --git a/src/lxc/mount_utils.c b/src/lxc/mount_utils.c
+index bba75f933c..88dd73ee36 100644
+--- a/src/lxc/mount_utils.c
++++ b/src/lxc/mount_utils.c
+@@ -31,7 +31,7 @@ lxc_log_define(mount_utils, lxc);
+  * setting in @attr_set, but must also specify MOUNT_ATTR__ATIME in the
+  * @attr_clr field.
+  */
+-static inline void set_atime(struct lxc_mount_attr *attr)
++static inline void set_atime(struct mount_attr *attr)
+ {
+ 	switch (attr->attr_set & MOUNT_ATTR__ATIME) {
+ 	case MOUNT_ATTR_RELATIME:
+@@ -272,7 +272,7 @@ int create_detached_idmapped_mount(const char *path, int userns_fd,
+ {
+ 	__do_close int fd_tree_from = -EBADF;
+ 	unsigned int open_tree_flags = OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC;
+-	struct lxc_mount_attr attr = {
++	struct mount_attr attr = {
+ 		.attr_set	= MOUNT_ATTR_IDMAP | attr_set,
+ 		.attr_clr	= attr_clr,
+ 		.userns_fd	= userns_fd,
+@@ -335,7 +335,7 @@ int __fd_bind_mount(int dfd_from, const char *path_from, __u64 o_flags_from,
+ 		    __u64 attr_clr, __u64 propagation, int userns_fd,
+ 		    bool recursive)
+ {
+-	struct lxc_mount_attr attr = {
++	struct mount_attr attr = {
+ 		.attr_set	= attr_set,
+ 		.attr_clr	= attr_clr,
+ 		.propagation	= propagation,
+diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
+index a5e98b565c..c8a7d0c7b7 100644
+--- a/src/lxc/syscall_wrappers.h
++++ b/src/lxc/syscall_wrappers.h
+@@ -18,6 +18,12 @@
+ #include "macro.h"
+ #include "syscall_numbers.h"
+ 
++#if HAVE_STRUCT_MOUNT_ATTR
++#include <sys/mount.h>
++#elif HAVE_UAPI_STRUCT_MOUNT_ATTR
++#include <linux/mount.h>
++#endif
++
+ #ifdef HAVE_LINUX_MEMFD_H
+ #include <linux/memfd.h>
+ #endif
+@@ -210,16 +216,18 @@ extern int fsmount(int fs_fd, unsigned int flags, unsigned int attr_flags);
+ /*
+  * mount_setattr()
+  */
+-struct lxc_mount_attr {
++#if !HAVE_STRUCT_MOUNT_ATTR && !HAVE_UAPI_STRUCT_MOUNT_ATTR
++struct mount_attr {
+ 	__u64 attr_set;
+ 	__u64 attr_clr;
+ 	__u64 propagation;
+ 	__u64 userns_fd;
+ };
++#endif
+ 
+ #if !HAVE_MOUNT_SETATTR
+ static inline int mount_setattr(int dfd, const char *path, unsigned int flags,
+-				struct lxc_mount_attr *attr, size_t size)
++				struct mount_attr *attr, size_t size)
+ {
+ 	return syscall(__NR_mount_setattr, dfd, path, flags, attr, size);
+ }
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index d460bc6a01..c18e062cc1 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  db242f8366fc63e8c7588bb2017b354173cf3c4b20abc18780debdc48b14d3ef  lxc-4.0.12.tar.gz
+sha256  d8195423bb1e206f8521d24b6cde4789f043960c7cf065990a9cf741dcfd4222  lxc-5.0.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index cece27411e..f0a0e8041a 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.12
+LXC_VERSION = 5.0.1
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
@@ -13,56 +13,54 @@ LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
 
 LXC_CONF_OPTS = \
-	--disable-apparmor \
-	--disable-examples \
-	--with-distro=buildroot \
-	--disable-werror \
-	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
+	-Dapparmor=false \
+	-Dexamples=false \
+	-Dman=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 LXC_DEPENDENCIES += bash-completion
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-LXC_CONF_OPTS += --enable-capabilities
+LXC_CONF_OPTS += -Dcapabilities=true
 LXC_DEPENDENCIES += libcap
 else
-LXC_CONF_OPTS += --disable-capabilities
+LXC_CONF_OPTS += -Dcapabilities=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-LXC_CONF_OPTS += --enable-seccomp
+LXC_CONF_OPTS += -Dseccomp=true
 LXC_DEPENDENCIES += libseccomp
 else
-LXC_CONF_OPTS += --disable-seccomp
+LXC_CONF_OPTS += -Dseccomp=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-LXC_CONF_OPTS += --enable-selinux
+LXC_CONF_OPTS += -Dselinux=true
 LXC_DEPENDENCIES += libselinux
 else
-LXC_CONF_OPTS += --disable-selinux
+LXC_CONF_OPTS += -Dselinux=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBURING),y)
-LXC_CONF_OPTS += --enable-liburing
+LXC_CONF_OPTS += -Dio-uring-event-loop=true
 LXC_DEPENDENCIES += liburing
 else
-LXC_CONF_OPTS += --disable-liburing
+LXC_CONF_OPTS += -Dio-uring-event-loop=false
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-LXC_CONF_OPTS += --enable-pam
+LXC_CONF_OPTS += -Dpam-cgroup=true
 LXC_DEPENDENCIES += linux-pam
 else
-LXC_CONF_OPTS += --disable-pam
+LXC_CONF_OPTS += -Dpam-cgroup=false
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LXC_CONF_OPTS += --enable-openssl
+LXC_CONF_OPTS += -Dopenssl=true
 LXC_DEPENDENCIES += openssl
 else
-LXC_CONF_OPTS += --disable-openssl
+LXC_CONF_OPTS += -Dopenssl=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
