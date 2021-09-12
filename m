Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EB0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:41:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8CF560FE3
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8CF560FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673D781B10;
	Sun, 12 Sep 2021 19:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_4s4Jza3JJi; Sun, 12 Sep 2021 19:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B667781B01;
	Sun, 12 Sep 2021 19:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E90621BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D77E840155
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZknPt85vjoUM for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:41:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74F934012A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:41:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so5123347wmq.0
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F5qf+v8zcbr+v5Y2ALYvRLkHsZJRb4UddBRJwjLlN+M=;
 b=O1nSeobXI8LuCQjWW96reWGIixGt8SyP5b7m6OGckz880r9QQOQRCy1PzbMJ8gl/hz
 4QMzOzc17v0xqKb1ObnqjMOSC6nz/b3t+5HJ+lFI3XnzgXg2U/aRMvIvsoKHlPAO+x+h
 zWK0YgwAkQq56ovPo00y2gH4kBAtQsVj5yibR2x0WtriXKFaURtq2VkraXUme/ZjwUoM
 YMSYu18uzXFjrfnl2FVrdb02KdX1N9H81M6LRFZnzTXsecMceXKNYIWPTVbpcyPRqld6
 /shA0pVK4Nvp1A1QSgUPCLiSYY/G1VDjuCdi1jtgfTKs28pfjepb8xJQWIsYiJnk2ils
 REwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F5qf+v8zcbr+v5Y2ALYvRLkHsZJRb4UddBRJwjLlN+M=;
 b=fKIJ7c548Pv+LaEd047UfnQtX5RzVTQrgqHjoOIvceu6OEk2Xpzzees9uGoWl1fe5x
 Vq04rapOd9EqHr2by3zN3pB82CvxSXsZhGv/lT4oAqNE8ZhZDqOg1Xnk2bC0LfVng5wW
 xgTY+dK/jkfMDqyhqXCRowrtDbhnolgGxHTTY5C1BWgDavjcdCGPpKzb9XBQ45JX8RLj
 w1jXAnQM2q1EZykCyWctfv6ghUqjNXCWVB+1UZzj/ESC5uj7wrn453uaocNmuzU8GoK9
 hlo7cUmLcfuy2hdoNnRq8udj75dhW7xShBn5YSvjC2WOZ7+c13QNTf+dHmVNpoOtTzNc
 5XGA==
X-Gm-Message-State: AOAM532/iFP46Vp8nU8ZbCu6c6uVm3LFuiyGKJgSGv6j4/BpkTv/sPeo
 SeinSWXKcngPzj6Ne+9+h19EMOLx6p4=
X-Google-Smtp-Source: ABdhPJwSK3b/QxDLHYwywyYW4qOtZi38c5IAzQ3Ey1pqORoXow/RkhbNyTTzytYOdnKf5yqSoyUbyA==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr7816934wmb.61.1631475667436; 
 Sun, 12 Sep 2021 12:41:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r26sm4972706wmh.27.2021.09.12.12.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:41:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:40:57 +0200
Message-Id: <20210912194057.2556882-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libfuse: fix build with glibc >=
 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with glibc >= 2.34:

ulockmgr_server.c:127:12: error: conflicting types for 'closefrom'; have 'int(int)'
  127 | static int closefrom(int minfd)
      |            ^~~~~~~~~
In file included from ulockmgr_server.c:14:
/home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/unistd.h:363:13: note: previous declaration of 'closefrom' with type 'void(int)'
  363 | extern void closefrom (int __lowfd) __THROW;
      |             ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3769b18ca804fba3b5974af799972a7d889b39a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ally-define-closefrom-fix-glibc-2-34.patch | 64 +++++++++++++++++++
 package/libfuse/libfuse.mk                    |  7 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch

diff --git a/package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch b/package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch
new file mode 100644
index 0000000000..7c3346e47b
--- /dev/null
+++ b/package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch
@@ -0,0 +1,64 @@
+From 5a43d0f724c56f8836f3f92411e0de1b5f82db32 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 24 Jul 2021 22:02:45 +0100
+Subject: [PATCH] util/ulockmgr_server.c: conditionally define closefrom (fix
+ glibc-2.34+)
+
+closefrom(3) has joined us in glibc-land from *BSD and Solaris. Since
+it's available in glibc 2.34+, we want to detect it and only define our
+fallback if the libc doesn't provide it.
+
+Bug: https://bugs.gentoo.org/803923
+Signed-off-by: Sam James <sam@gentoo.org>
+
+[Retrieved from:
+https://github.com/libfuse/libfuse/commit/5a43d0f724c56f8836f3f92411e0de1b5f82db32]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac           | 1 +
+ util/ulockmgr_server.c | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9946a0efa..a2d481aa9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,6 +55,7 @@ fi
+ 
+ AC_CHECK_FUNCS([fork setxattr fdatasync splice vmsplice utimensat])
+ AC_CHECK_FUNCS([posix_fallocate])
++AC_CHECK_FUNCS([closefrom])
+ AC_CHECK_MEMBERS([struct stat.st_atim])
+ AC_CHECK_MEMBERS([struct stat.st_atimespec])
+ 
+diff --git a/util/ulockmgr_server.c b/util/ulockmgr_server.c
+index 273c7d923..a04dac5c6 100644
+--- a/util/ulockmgr_server.c
++++ b/util/ulockmgr_server.c
+@@ -22,6 +22,10 @@
+ #include <sys/socket.h>
+ #include <sys/wait.h>
+ 
++#ifdef HAVE_CONFIG_H
++	#include "config.h"
++#endif
++
+ struct message {
+ 	unsigned intr : 1;
+ 	unsigned nofd : 1;
+@@ -124,6 +128,7 @@ static int receive_message(int sock, void *buf, size_t buflen, int *fdp,
+ 	return res;
+ }
+ 
++#if !defined(HAVE_CLOSEFROM)
+ static int closefrom(int minfd)
+ {
+ 	DIR *dir = opendir("/proc/self/fd");
+@@ -141,6 +146,7 @@ static int closefrom(int minfd)
+ 	}
+ 	return 0;
+ }
++#endif
+ 
+ static void send_reply(int cfd, struct message *msg)
+ {
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 2677e46853..6dce641f7f 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -11,7 +11,12 @@ LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_CPE_ID_VENDOR = libfuse_project
 LIBFUSE_INSTALL_STAGING = YES
-LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+# We're patching configure.ac
+LIBFUSE_AUTORECONF = YES
+# add host-gettext for AM_ICONV macro
+LIBFUSE_DEPENDENCIES = \
+	host-gettext \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPTS = \
 	--disable-example \
 	--enable-lib \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
