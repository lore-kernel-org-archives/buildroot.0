Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32F8CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 14:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950C24047C;
	Sun, 23 Nov 2025 14:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMn9gTw_2eI5; Sun, 23 Nov 2025 14:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 785304047E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785304047E;
	Sun, 23 Nov 2025 14:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2692E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 14:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA33780670
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 14:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HxlwiWlAUON for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 14:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE10A8066F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE10A8066F
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 14:16:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCA5B85589; Sun, 23 Nov 2025 14:16:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Nov 2025 15:10:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 752d46c7264e926dd7c9f4c46b4172cff62b7fa3
X-Git-Newrev: c8cb1a238de5a803228f12ad32b36cae2acfc778
X-Patchwork-Hint: ignore
Message-Id: <20251123141603.CCA5B85589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8264158958021494855=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8264158958021494855==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c8cb1a238de5a803228f12ad32b36cae2acfc778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump of e2fsprogs to 1.47.3 in Buildroot commit
bb004ddba26ea86687d917fa16d313ea92aff41c causes the package to fail
building when the kernel headers are >= 5.10 but < 5.12.

Indeed the new version of e2fsprogs detects the presence of
<linux/fsverity.h> (which occurred in 5.10), and when it's available,
enables some fsverity functionality, which uses an ioctl() that was
only introduced in 5.12. This causes some build breakage if the
headers used are 5.10 or 5.11.

We fix this by introducing a patch, submitted upstream, that not only
verifies the availability of the header file, but also the
availability of the ioctl().

Fixes:

  https://autobuild.buildroot.net/results/c573233b1f871c61f916eda9c402c84070902432/ (host-e2fsprogs)
  https://autobuild.buildroot.net/results/0ed16cad1d1f500d0e577d03166c06381be73ffc/ (e2fsprogs)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...c-check-for-FS_IOC_READ_VERITY_METADATA-a.patch | 103 +++++++++++++++++++++
 package/e2fsprogs/e2fsprogs.mk                     |   7 ++
 2 files changed, 110 insertions(+)

diff --git a/package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch b/package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
new file mode 100644
index 0000000000..36442a53b8
--- /dev/null
+++ b/package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
@@ -0,0 +1,103 @@
+From 1a2ce8cd956065106ae27a36a5000f00ebc4591f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 22 Nov 2025 21:12:23 +0100
+Subject: [PATCH] configure.ac: check for FS_IOC_READ_VERITY_METADATA
+ availability
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 6bfa843b4435334ac073e42950b48d8bacb54977 ("mke2fs: enable
+copying of fs-verity metadata") introduced support for reading
+fs-verity metadata, which requires using the
+FS_IOC_READ_VERITY_METADATA.
+
+The code is conditionally compiled when the kernel headers have
+<linux/fsverity.h> available. Unfortunately, this check is not
+sufficient: <linux/fsverity.h> was introduced in Linux 5.10, but the
+FS_IOC_READ_VERITY_METADATA was not introduced before 5.12, so if one
+is using 5.10 or 5.11 kernel headers, the build fails with:
+
+./../misc/create_inode.c: In function ‘copy_fs_verity_data’:
+./../misc/create_inode.c:589:10: error: variable ‘arg’ has initializer but incomplete type
+  589 |   struct fsverity_read_metadata_arg arg = {
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
+[...]
+./../misc/create_inode.c:600:20: error: ‘FS_IOC_READ_VERITY_METADATA’ undeclared (first use in this function)
+  600 |   size = ioctl(fd, FS_IOC_READ_VERITY_METADATA, &arg);
+      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This commit therefore extends the configure.ac check to ensure that
+not only <linux/fsverity.h> exists but also that it defines the
+FS_IOC_READ_VERITY_METADATA ioctl.
+
+Upstream: https://github.com/tytso/e2fsprogs/pull/256
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac        | 18 ++++++++++++++++++
+ misc/create_inode.c |  6 +++---
+ 2 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a0171163..3e5586a3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1997,6 +1997,24 @@ OS_IO_FILE=""
+ esac]
+ AC_SUBST(OS_IO_FILE)
+ 
++dnl Check for fsverity ioctl
++if test "${ac_cv_header_linux_fsverity_h}" = "yes"; then
++   AC_MSG_CHECKING([for FS_IOC_READ_VERITY_METADATA ioctl])
++   AC_PREPROC_IFELSE(
++   [AC_LANG_PROGRAM([[
++#include <linux/fsverity.h>
++#ifndef FS_IOC_READ_VERITY_METADATA
++# error "FS_IOC_READ_VERITY_METADATA not available"
++#endif
++]], [])], [
++   AC_DEFINE([HAVE_FS_IOC_READ_VERITY_METADATA], [1], [Define to 1 if FS_IOC_READ_VERITY_METADATA ioctl is available])
++   AC_MSG_RESULT([yes])
++   ],
++   [
++   AC_MSG_RESULT([no])
++   ])
++fi
++
+ dnl
+ dnl Make our output files, being sure that we create the some miscellaneous 
+ dnl directories
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 624efc03..a7918873 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -30,7 +30,7 @@
+ #ifdef HAVE_SYS_SYSMACROS_H
+ #include <sys/sysmacros.h>
+ #endif
+-#ifdef HAVE_LINUX_FSVERITY_H
++#if defined(HAVE_LINUX_FSVERITY_H) && defined(HAVE_FS_IOC_READ_VERITY_METADATA)
+ #include <linux/fsverity.h>
+ #include <linux/fs.h>
+ #endif
+@@ -569,7 +569,7 @@ out:
+ }
+ #endif /* FS_IOC_FIEMAP */
+ 
+-#ifdef HAVE_LINUX_FSVERITY_H
++#if defined(HAVE_LINUX_FSVERITY_H) && defined(HAVE_FS_IOC_READ_VERITY_METADATA)
+ static inline off_t round_up(off_t n, off_t blksz, off_t bias)
+ {
+   return ((n - bias + (blksz - 1)) & ~(blksz - 1)) + bias;
+@@ -738,7 +738,7 @@ static errcode_t copy_file(ext2_filsys fs, int fd, struct stat *statbuf,
+ 		err = copy_file_chunk(fs, fd, e2_file, 0, statbuf->st_size, buf,
+ 				      zerobuf);
+ 
+-#ifdef HAVE_LINUX_FSVERITY_H
++#if defined(HAVE_LINUX_FSVERITY_H) && defined(HAVE_FS_IOC_READ_VERITY_METADATA)
+ 	if (!err && (flags & EXT4_VERITY_FL))
+ 		err = copy_fs_verity(fs, fd, e2_file, statbuf->st_size);
+ #endif
+-- 
+2.51.1
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 27e5e37bca..ad3d1dbe75 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -18,6 +18,13 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
+# 0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
+# the additional dependencies are only needed for autoreconf
+E2FSPROGS_AUTORECONF = YES
+E2FSPROGS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+E2FSPROGS_DEPENDENCIES += host-gettext host-autoconf-archive
+HOST_E2FSPROGS_DEPENDENCIES += host-gettext host-autoconf-archive
+
 E2FSPROGS_SELINUX_MODULES = fstools
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't

--===============8264158958021494855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8264158958021494855==--
