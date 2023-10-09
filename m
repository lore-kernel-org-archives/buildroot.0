Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7929E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 13:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4B161184;
	Mon,  9 Oct 2023 13:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E4B161184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sLCYd0o5P3C; Mon,  9 Oct 2023 13:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A81C6119F;
	Mon,  9 Oct 2023 13:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A81C6119F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3CB1BF33F
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 13:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA32081BB0
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 13:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA32081BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h76xyMXXyxcN for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 13:11:36 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A322F81B8A
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 13:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A322F81B8A
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso8098447a12.3
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 06:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696857094; x=1697461894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWqu8XG7sIBLQZmUXCG4de5eiSRDGNuqLBQz1pk06SY=;
 b=e4xagKX0tZchtQxSFSs6YbOKKeaVRPWh5sNRr7ZvsfCFwxaPfDMZ687adznufaR8yK
 P3YozzD+Vo+c68SnmGe0WTVzbZ0AbJAShq1rBpJX4Um9YkqVNS9WUpFliG3FWcf8lPYn
 dMDEMws/xsiK4cYfk/0SH1fWdNKHL2lvuOFcqTwgU3C+xALSjn2KIRt50ftj+AS8dTf4
 QwnxNsllMZPqTNjRvsLMV8SW7U/IRQ2HBBiJYrcU4R5hMC/K7EfDLMFkb+dqBN7ixEIK
 A/GUGoWcVguh9L6Ftx657KS1PSzcjRR0nTTn0K9UoJovrtbWAQ/Y25oxj8fJ2w9mFUL+
 U1Vg==
X-Gm-Message-State: AOJu0Yz/nST2YsiHl0/rMX9yRIxBT7nF1hZw3f4m4AlMWR4cOA/8WbdM
 myCtFszJ0conk2sG6EnH51rcgEHdcv4=
X-Google-Smtp-Source: AGHT+IHleRvXPl3ykfvORJny1fcpJyz7/eT1ignb6nAh2ioytIyQskD9dRLgVAF1CzyiHI+b53REaQ==
X-Received: by 2002:aa7:cd7a:0:b0:532:bf2a:8cbc with SMTP id
 ca26-20020aa7cd7a000000b00532bf2a8cbcmr12881422edb.16.1696857092818; 
 Mon, 09 Oct 2023 06:11:32 -0700 (PDT)
Received: from lanodev2.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 b11-20020aa7c90b000000b00536246d1eadsm6069903edt.41.2023.10.09.06.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 06:11:32 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org,
	peter@korsgaard.com
Date: Mon,  9 Oct 2023 15:11:20 +0200
Message-Id: <20231009131120.134257-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696857094; x=1697461894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vWqu8XG7sIBLQZmUXCG4de5eiSRDGNuqLBQz1pk06SY=;
 b=jY2MCr08PAfCaMmaVympvqeXHSC7EX1bThd94MnFtwJZOWwhwskyvfgsYR+2EJ7zVX
 cSCqmKgzSYI9a1x3zBMX9Dx4vkOfX9cMakz4rGGE0arbT16zXql2gIClA7mbITB/fGGS
 T1U7W02RUv0LhuMrOxB0xwLdBk48A2K37Te8GA1T2DUyJgQLefcpJZFvRdYWHF5F5n/T
 LETg8HZ6wc0gL8gBdKAd7/IPKOy1dLW7sTf6s1oU7ACJw93tECze9XqxKCOz4CNvHeNQ
 e0yfq+XWPzEdC2AcxcxxtybVGl1IXpY1G+FZoVLoMb73AyNq+tONcYXqFtB2Qw/7tdBe
 o4dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jY2MCr08
Subject: [Buildroot] [PATCH v2] package/util-linux: fix build with old glibc
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build still fails if newer kernel versions are mixed with older
glibc versions (Kernel 6.1 and glibc 2.28 for example).

Apply upstream fix [1], see bug report [2].

[1] - https://github.com/schubi2/util-linux/commit/8d67fc4e66816791aaadf0b03940b96c6dc3d92c
[2] - https://github.com/util-linux/util-linux/issues/2448

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
Still cant build util-linux, neither on master nor on 2023.08.x

v1->v2:
*   rebase using the commit in upstream master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 .../0001-libmount-fix-statx-includes.patch    | 127 ++++++++++++++++++
 .../0001-libmount-fix-statx-includes.patch    |   1 +
 package/util-linux/util-linux.mk              |   2 +-
 3 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 package/util-linux/0001-libmount-fix-statx-includes.patch
 create mode 120000 package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch

diff --git a/package/util-linux/0001-libmount-fix-statx-includes.patch b/package/util-linux/0001-libmount-fix-statx-includes.patch
new file mode 100644
index 0000000000..60cde1a63e
--- /dev/null
+++ b/package/util-linux/0001-libmount-fix-statx-includes.patch
@@ -0,0 +1,127 @@
+From 8d67fc4e66816791aaadf0b03940b96c6dc3d92c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 23 Aug 2023 11:50:37 +0200
+Subject: [PATCH] libmount: fix statx() includes
+
+Using sys/stat.h and linux/stat is too tricky.h together. It seems
+better to rely on libc and use sys/stat.h only. Users affected
+by old libc must update to use recent util-linux.
+
+Fixes: https://github.com/util-linux/util-linux/issues/2448
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ configure.ac              | 5 ++---
+ include/fileutils.h       | 4 ++--
+ libmount/src/hook_mount.c | 2 +-
+ libmount/src/utils.c      | 2 +-
+ meson.build               | 5 ++---
+ 5 files changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 27c379a78be..aa4b3bc1c64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -333,7 +333,6 @@ AC_CHECK_HEADERS([ \
+ 	linux/nsfs.h \
+ 	linux/pr.h \
+ 	linux/raw.h \
+-	linux/stat.h \
+ 	linux/securebits.h \
+ 	linux/tiocl.h \
+ 	linux/version.h \
+@@ -527,7 +526,6 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ ])
+ 
+ AC_CHECK_TYPES([struct mount_attr], [], [], [[#include <linux/mount.h>]])
+-AC_CHECK_TYPES([struct statx], [], [], [[#include <linux/stat.h>]])
+ AC_CHECK_TYPES([enum fsconfig_command], [], [], [[#include <linux/mount.h>]])
+ 
+ AC_CHECK_MEMBERS([struct termios.c_line],,,
+@@ -536,8 +534,9 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
+ AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
+     [[#include <sys/stat.h>]])
+ 
++AC_CHECK_TYPES([struct statx], [], [], [[#include <sys/stat.h>]])
+ AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
+-    [[#include <linux/stat.h>]])
++    [[#include <sys/stat.h>]])
+ 
+ AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
+ 
+diff --git a/include/fileutils.h b/include/fileutils.h
+index a5fe517266f..538eab0b74e 100644
+--- a/include/fileutils.h
++++ b/include/fileutils.h
+@@ -94,13 +94,13 @@ static inline int close_range(unsigned int first, unsigned int last, int flags)
+ #  define HAVE_CLOSE_RANGE 1
+ # endif	/* SYS_close_range */
+ 
+-# if !defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(SYS_statx) && defined(HAVE_LINUX_STAT_H)
+-#  include <linux/stat.h>
++# if !defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(SYS_statx)
+ static inline int statx(int fd, const char *restrict path, int flags,
+ 		    unsigned int mask, struct statx *stx)
+ {
+ 	return syscall(SYS_statx, fd, path, flags, mask, stx);
+ }
++#  define HAVE_STATX 1
+ # endif /* SYS_statx */
+ 
+ #endif	/* HAVE_SYS_SYSCALL_H */
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 056338c4914..0ebb8299853 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -294,7 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
+ 		/* cleanup after fail (libmount may only try the FS type) */
+ 		close_sysapi_fds(api);
+ 
+-#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
++#if defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
+ 	if (!rc && cxt->fs) {
+ 		struct statx st;
+ 
+diff --git a/libmount/src/utils.c b/libmount/src/utils.c
+index 1d3f4abcece..3817b392711 100644
+--- a/libmount/src/utils.c
++++ b/libmount/src/utils.c
+@@ -111,7 +111,7 @@ static int safe_stat(const char *target, struct stat *st, int nofollow)
+ 
+ 	memset(st, 0, sizeof(struct stat));
+ 
+-#if defined(AT_STATX_DONT_SYNC) && defined (HAVE_STRUCT_STATX)
++#if defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(AT_STATX_DONT_SYNC)
+ 	{
+ 		int rc;
+ 		struct statx stx = { 0 };
+diff --git a/meson.build b/meson.build
+index 9a36c9157cc..d412ff38203 100644
+--- a/meson.build
++++ b/meson.build
+@@ -84,7 +84,7 @@ have_mountfd_api = cc.sizeof('struct mount_attr', prefix : '#include <linux/moun
+ conf.set('HAVE_STRUCT_MOUNT_ATTR', have_mountfd_api ? 1 : false)
+ conf.set('HAVE_MOUNTFD_API', have_mountfd_api ? 1 : false)
+ 
+-have_struct_statx = cc.sizeof('struct statx', prefix : '#include <linux/stat.h>') > 0
++have_struct_statx = cc.sizeof('struct statx', prefix : '#include <sys/stat.h>') > 0
+ conf.set('HAVE_STRUCT_STATX', have_struct_statx ? 1 : false)
+ 
+ build_libmount = not get_option('build-libmount').disabled()
+@@ -182,7 +182,6 @@ headers = '''
+         linux/nsfs.h
+         linux/mount.h
+         linux/pr.h
+-        linux/stat.h
+         linux/securebits.h
+         linux/tiocl.h
+         linux/version.h
+@@ -645,7 +644,7 @@ have = cc.has_member('struct stat', 'st_mtim.tv_nsec',
+ conf.set('HAVE_STRUCT_STAT_ST_MTIM_TV_NSEC', have ? 1 : false)
+ 
+ have = cc.has_member('struct statx', 'stx_mnt_id',
+-                     prefix : '#include <linux/stat.h>')
++                     prefix : '#include <sys/stat.h>')
+ conf.set('HAVE_STRUCT_STATX_STX_MNT_ID', have ? 1 : false)
+ 
+ # replacement for AC_STRUCT_TIMEZONE
diff --git a/package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch b/package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch
new file mode 120000
index 0000000000..bc21ebedb7
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch
@@ -0,0 +1 @@
+../0001-libmount-fix-statx-includes.patch
\ No newline at end of file
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ed9512c33c..fbfe579364 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -31,7 +31,7 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
-# 0001-libmount-ifdef-statx-call.patch
+# 0001-libmount-fix-statx-includes.patch
 UTIL_LINUX_AUTORECONF = YES
 
 UTIL_LINUX_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
