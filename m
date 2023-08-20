Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD41EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EDDD415EF;
	Sun, 20 Aug 2023 21:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDDD415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qt0C-dCIhwBZ; Sun, 20 Aug 2023 21:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5DB415EA;
	Sun, 20 Aug 2023 21:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C5DB415EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCCD71BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6D7360BE9
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D7360BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69VKY8sx6iOv for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:19:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A901B60B03
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A901B60B03
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94F5B85E7E; Sun, 20 Aug 2023 21:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:16:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c252392fb557c8fb7c882cfdd44ca38978bc8908
X-Git-Newrev: c243e1b81a1eb9d579e88e9beae3965425300523
X-Patchwork-Hint: ignore
Message-Id: <20230820211934.94F5B85E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/util-linux: fix
 compile issue with older kernel headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c243e1b81a1eb9d579e88e9beae3965425300523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-libmount-ifdef-statx-call.patch           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
