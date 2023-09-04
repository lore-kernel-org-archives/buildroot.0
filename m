Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20672C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 12:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D67D4092C;
	Mon,  4 Sep 2023 12:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D67D4092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5diHS8ImPlj8; Mon,  4 Sep 2023 12:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4359440937;
	Mon,  4 Sep 2023 12:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4359440937
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A95F91BF360
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 12:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A404020B
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 12:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A404020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_fJIQFlNSXn for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 12:46:16 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45ACF40126
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 12:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45ACF40126
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so221604666b.1
 for <buildroot@buildroot.org>; Mon, 04 Sep 2023 05:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693831574; x=1694436374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ot2/mdkI7VEL9gJnRL8PFbCSe0aBtOjmaSM+4+1LFMQ=;
 b=G2o+g5jzRDVahOPUSvv8fyEg4OV1ormkajKm5FjKQF2YudOIT4WEO7Kc7i4UbaC/Wd
 AurMGt5rnkPWlqLiylkCpGaShfqoH6WjLYBpAWRR1AwGTkHy1vDC757BfU9hu3F4gz1Y
 PQMx/ZNvG6QnT6SAq/hPDF2gFHH3O30epG2kFjr7NpsrsNJC9SyD5sMJgLgOlCAz6Jur
 sMyYtN1mw+pe2MFiX9J8+lhhqTrGGju3zDKTilbhkQ5EDpXPimUPjc7LPLR16WwDjIO4
 tR0yzM3iaSwSdpXPX/4DDiOxJe5JcAiKywgqlgqMbJaFkNC2xND1wsPahe+I9BPshcmy
 9VzQ==
X-Gm-Message-State: AOJu0YzuJqC7M1ZbMiRpvC1GTlzzpgsVSQ+WcpBVTTzBywj4WFsXx6fh
 2C8J97QzSPSacIck3plUlxz88cx9lAM=
X-Google-Smtp-Source: AGHT+IHmBTCLbni8zLCoVfA033CKW8sF9eYrvnQ3yV+26YVb7P0cQsC8PnDk3haObXf/OqLbxuohlA==
X-Received: by 2002:a17:906:31c7:b0:99c:e38d:e484 with SMTP id
 f7-20020a17090631c700b0099ce38de484mr8518167ejf.6.1693831573845; 
 Mon, 04 Sep 2023 05:46:13 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 j24-20020a170906051800b0099bcdfff7cbsm6084330eja.160.2023.09.04.05.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 05:46:13 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Sep 2023 14:45:50 +0200
Message-Id: <20230904124551.94741-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693831574; x=1694436374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ot2/mdkI7VEL9gJnRL8PFbCSe0aBtOjmaSM+4+1LFMQ=;
 b=n/awaTJ9IFN/eylLdMD9gcZxGVpvMvDkydLXZ2EMYxAzhtfIkEOMrFQrW1Fsrn+hVc
 pkj3R2pylZrSHSeltDvIQT1BAXt+bb+jlToWtndMvJj0H4QDCGNq73SXp1YENgMf1zEk
 KR2KK1HPenvYYKq2NbNgAM8cgI+1RO0c+3zIxXH4YspxoQ9eX2sv1TfxmLoIHoq9P3H4
 HZ4HF2qy4kuVBG4oKeIpHgJT+p38Bvwaq9mkFoQcdl3/cMj+VHOY2WMs/kX5fKQcbZxS
 uczvC+W25VycXhZrwfLWIIUDFFnCmGG4m0qJ35VIy/519n2ont2nXWYFJXq8ycEbZloC
 LmSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n/awaTJ9
Subject: [Buildroot] [PATCH] package/util-linux: fix build with old glibc
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

The build still fails with older glibc versions (2.28 for example).
Apply an upstream fix from
https://github.com/util-linux/util-linux/issues/2448.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 .../0001-libmount-fix-statx-includes.patch    | 127 ++++++++++++++++++
 .../0001-libmount-fix-statx-includes.patch    |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 package/util-linux/0001-libmount-fix-statx-includes.patch
 create mode 120000 package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch

diff --git a/package/util-linux/0001-libmount-fix-statx-includes.patch b/package/util-linux/0001-libmount-fix-statx-includes.patch
new file mode 100644
index 0000000000..c818423769
--- /dev/null
+++ b/package/util-linux/0001-libmount-fix-statx-includes.patch
@@ -0,0 +1,127 @@
+From 7d679f29aee9f56b07bd792e07b5b4e1ca2f3fa7 Mon Sep 17 00:00:00 2001
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
+index 738b369ee8..e6114aac36 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -326,7 +326,6 @@ AC_CHECK_HEADERS([ \
+ 	linux/nsfs.h \
+ 	linux/pr.h \
+ 	linux/raw.h \
+-	linux/stat.h \
+ 	linux/securebits.h \
+ 	linux/tiocl.h \
+ 	linux/version.h \
+@@ -518,7 +517,6 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ ])
+ 
+ AC_CHECK_TYPES([struct mount_attr], [], [], [[#include <linux/mount.h>]])
+-AC_CHECK_TYPES([struct statx], [], [], [[#include <linux/stat.h>]])
+ AC_CHECK_TYPES([enum fsconfig_command], [], [], [[#include <linux/mount.h>]])
+ 
+ AC_CHECK_MEMBERS([struct termios.c_line],,,
+@@ -527,8 +525,9 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
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
+index a5fe517266..538eab0b74 100644
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
+index 056338c491..0ebb829985 100644
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
+index 1d3f4abcec..3817b39271 100644
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
+index 221ae373b6..6beb9dbaba 100644
+--- a/meson.build
++++ b/meson.build
+@@ -79,7 +79,7 @@ have_mountfd_api = cc.sizeof('struct mount_attr', prefix : '#include <linux/moun
+ conf.set('HAVE_STRUCT_MOUNT_ATTR', have_mountfd_api ? 1 : false)
+ conf.set('HAVE_MOUNTFD_API', have_mountfd_api ? 1 : false)
+ 
+-have_struct_statx = cc.sizeof('struct statx', prefix : '#include <linux/stat.h>') > 0
++have_struct_statx = cc.sizeof('struct statx', prefix : '#include <sys/stat.h>') > 0
+ conf.set('HAVE_STRUCT_STATX', have_struct_statx ? 1 : false)
+ 
+ build_libmount = not get_option('build-libmount').disabled()
+@@ -177,7 +177,6 @@ headers = '''
+         linux/nsfs.h
+         linux/mount.h
+         linux/pr.h
+-        linux/stat.h
+         linux/securebits.h
+         linux/tiocl.h
+         linux/version.h
+@@ -640,7 +639,7 @@ have = cc.has_member('struct stat', 'st_mtim.tv_nsec',
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
