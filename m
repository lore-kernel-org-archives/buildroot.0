Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCECC001DB
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 12:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBEFB8403D;
	Fri, 11 Aug 2023 12:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBEFB8403D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P56pjyrXZLnB; Fri, 11 Aug 2023 12:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1078403F;
	Fri, 11 Aug 2023 12:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F1078403F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B74C31BF2C6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69B29402B1
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 12:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B29402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDDNkjT9rvd8 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 12:56:36 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7DF9400DD
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 12:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7DF9400DD
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C15283525336; Fri, 11 Aug 2023 14:56:32 +0200 (CEST)
Date: Fri, 11 Aug 2023 14:56:32 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNYwAHizfBKfreRi@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691758592; bh=lZGfOHnPCpJy2Vp0KJXK1E0lgvykqmoYyMnQos9BNQw=;
 h=Date:From:To:Subject:From;
 b=lNmLmzNljGWuOWwADskRjIx0U7R6kLTIAB8gNd9+85dcYeCMJdxqUb2PJm+Xrf8LR
 eAErAIlCfY5/lhnsHdcvP2ZM2csL3e4Ysb4XRUOPSTKQWthh1kbvHNvAImzRq2S7mj
 NA9e6Fnen9/7awvCF6/MDpJPP7S3d0bqRPrxtwd7JHGOYsA5LEq+UWSmw5Gz2VoQEc
 vGWkNGMmPotqGtabK6AYDfEEvnWhQi5/n5wH+rhbhkY9hfujgme9sZ4ziL0X6JVVr+
 rI5gyI4vh6PBxH/FIDsdnswjFhyLwFNfLNWx44yQELPQNpCD/tL3jtEgzml4igKOql
 gsaP2w7omc1eg==
Subject: [Buildroot] [PATCH] package/util-linux: fix compile issue with
 older kernel headers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux added mnt_id member to struct statx in commit:
fa2fcf4f1df1559a0a4ee0f46915b496cc2ebf60

Linux 5.4.0 was released on 24. November 2019, but it seems this change
never got backported to 5.4.252.

Upstream added a patch to guard the use of the member in commit:
https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37

Add the patch to fix an autobuild failure.

Fixes:
 - http://autobuild.buildroot.net/results/d50/d502bc9236b577e2470a30ffc39c21579b038a1c

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-libmount-ifdef-statx-call.patch      | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/util-linux/0001-libmount-ifdef-statx-call.patch

diff --git a/package/util-linux/0001-libmount-ifdef-statx-call.patch b/package/util-linux/0001-libmount-ifdef-statx-call.patch
new file mode 100644
index 0000000000..ba44650bd3
--- /dev/null
+++ b/package/util-linux/0001-libmount-ifdef-statx-call.patch
@@ -0,0 +1,57 @@
+From c0136ac0c98b18208508fbcfac31a843e0bb8a37 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Aug 2023 12:39:19 +0200
+Subject: [PATCH] libmount: ifdef statx() call
+
+In this case the statx() is use to get mount ID. It's optional and not
+required. Let's #ifdef the statx() call and also check for stx_mnt_id
+struct member.
+
+Fixes: https://github.com/util-linux/util-linux/issues/2415
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
+---
+ configure.ac              | 5 ++++-
+ libmount/src/hook_mount.c | 2 ++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a3cf330b5..ae721c7ac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -525,7 +525,10 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
+     [[#include <termios.h>]])
+ 
+ AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
+-	[#include <sys/stat.h>])
++    [[#include <sys/stat.h>]])
++
++AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
++    [[#include <linux/stat.h>]])
+ 
+ AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
+ 
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index d69a018ec..056338c49 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -294,6 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
+ 		/* cleanup after fail (libmount may only try the FS type) */
+ 		close_sysapi_fds(api);
+ 
++#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
+ 	if (!rc && cxt->fs) {
+ 		struct statx st;
+ 
+@@ -306,6 +307,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
+ 				fs->id = cxt->fs->id;
+ 		}
+ 	}
++#endif
+ 
+ done:
+ 	DBG(HOOK, ul_debugobj(hs, "create FS done [rc=%d, id=%d]", rc, cxt->fs ? cxt->fs->id : -1));
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
