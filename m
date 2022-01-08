Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E68C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAF8440124;
	Sat,  8 Jan 2022 10:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOepZfrvI7Op; Sat,  8 Jan 2022 10:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1FA140194;
	Sat,  8 Jan 2022 10:00:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D546B1BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F3060A9F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5rZr1IB4tbj for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:00:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB65C60073
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:00:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB02B82AB7; Sat,  8 Jan 2022 09:54:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 10:59:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21a1a5927004787217b19f09e6b113b68f91511e
X-Git-Newrev: 315ba5c26dd6bb0c01067e8346b4a7eceb7d0ee1
X-Patchwork-Hint: ignore
Message-Id: <20220108095426.DB02B82AB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to version 250.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=315ba5c26dd6bb0c01067e8346b4a7eceb7d0ee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch

Fixes a build issue with toolchains using kernel headers < 5.6,
when the openat2(2) syscall is not available [2].

Add a new patch to fix homework-mount with linux-headers < 5.2.

[1] https://github.com/systemd/systemd-stable/commit/cd88d010e862d26ce816eb3bd6735a80999ac41e
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fddb5d430ad9fa91b49b1d34d0202ffe2fa0e179

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...call-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 +++++++++
 ...syscall-define-all-MOUNT_ATTR_-if-missing.patch | 84 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 4 files changed, 35 insertions(+), 86 deletions(-)

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
new file mode 100644
index 0000000000..0934886acb
--- /dev/null
+++ b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
@@ -0,0 +1,33 @@
+From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Fri, 7 Jan 2022 22:25:23 +0100
+Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
+
+MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
+but it's defined in kernel headers since version 5.2.
+
+[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/basic/missing_syscall.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 8267b1a90c..793d111c55 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -569,6 +569,10 @@ static inline int missing_open_tree(
+ #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
+ #endif
+ 
++#ifndef MOVE_MOUNT_T_EMPTY_PATH
++#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
++#endif
++
+ static inline int missing_move_mount(
+                 int from_dfd,
+                 const char *from_pathname,
+-- 
+2.31.1
+
diff --git a/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch b/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch
deleted file mode 100644
index d0c4f6eaa0..0000000000
--- a/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 0764e3a327573e7bda2f0e1a914f28482ab00574 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Fri, 24 Dec 2021 09:15:51 +0900
-Subject: [PATCH] missing-syscall: define all MOUNT_ATTR_* if missing
-
-Fixes #21876.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-0764e3a327573e7bda2f0e1a914f28482ab00574]
----
- src/basic/missing_syscall.h | 48 ++++++++++++++++++++++++++++++++-----
- 1 file changed, 42 insertions(+), 6 deletions(-)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 3da30e6f0e..0b0cc3cec2 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -462,20 +462,56 @@ struct mount_attr {
- struct mount_attr;
- #endif
- 
-+#ifndef MOUNT_ATTR_RDONLY
-+#define MOUNT_ATTR_RDONLY       0x00000001 /* Mount read-only */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NOSUID
-+#define MOUNT_ATTR_NOSUID       0x00000002 /* Ignore suid and sgid bits */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NODEV
-+#define MOUNT_ATTR_NODEV        0x00000004 /* Disallow access to device special files */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NOEXEC
-+#define MOUNT_ATTR_NOEXEC       0x00000008 /* Disallow program execution */
-+#endif
-+
-+#ifndef MOUNT_ATTR__ATIME
-+#define MOUNT_ATTR__ATIME       0x00000070 /* Setting on how atime should be updated */
-+#endif
-+
-+#ifndef MOUNT_ATTR_RELATIME
-+#define MOUNT_ATTR_RELATIME     0x00000000 /* - Update atime relative to mtime/ctime. */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NOATIME
-+#define MOUNT_ATTR_NOATIME      0x00000010 /* - Do not update access times. */
-+#endif
-+
-+#ifndef MOUNT_ATTR_STRICTATIME
-+#define MOUNT_ATTR_STRICTATIME  0x00000020 /* - Always perform atime updates */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NODIRATIME
-+#define MOUNT_ATTR_NODIRATIME   0x00000080 /* Do not update directory access times */
-+#endif
-+
- #ifndef MOUNT_ATTR_IDMAP
--#define MOUNT_ATTR_IDMAP 0x00100000
-+#define MOUNT_ATTR_IDMAP        0x00100000 /* Idmap mount to @userns_fd in struct mount_attr. */
- #endif
- 
- #ifndef MOUNT_ATTR_NOSYMFOLLOW
--#define MOUNT_ATTR_NOSYMFOLLOW 0x00200000
-+#define MOUNT_ATTR_NOSYMFOLLOW  0x00200000 /* Do not follow symlinks */
- #endif
- 
--#ifndef AT_RECURSIVE
--#define AT_RECURSIVE 0x8000
-+#ifndef MOUNT_ATTR_SIZE_VER0
-+#define MOUNT_ATTR_SIZE_VER0    32 /* sizeof first published struct */
- #endif
- 
--#ifndef MOUNT_ATTR_SIZE_VER0
--#define MOUNT_ATTR_SIZE_VER0 32
-+#ifndef AT_RECURSIVE
-+#define AT_RECURSIVE 0x8000
- #endif
- 
- static inline int missing_mount_setattr(
--- 
-2.25.1
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index cc33cd4c52..f89b2ce17d 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  41317fb443f7555de427aea69fda36c74661e77b58203cd6587eb8e1f612f46b  systemd-250.tar.gz
+sha256  ccfdd97679972cd3d9fb15bc3c647a3ee3351a434e20e1e3eec2851caa1b4849  systemd-250.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0b52cc47d1..404943c45c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 250
+SYSTEMD_VERSION = 250.1
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
