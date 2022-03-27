Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D07C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2687B81471;
	Sun, 27 Mar 2022 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTozPxJZmGV9; Sun, 27 Mar 2022 15:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31132828B5;
	Sun, 27 Mar 2022 15:46:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8ED1BF9AA
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9788268F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHZdbgo_XPhp for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5560E81C6F
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0123B85D67; Sun, 27 Mar 2022 15:37:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 16:53:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87674334dd8a8c9094a806d26f2683f9fca782f0
X-Git-Newrev: de59a62af68593303bf420338e719a17e1a5e243
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.0123B85D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgee: needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=de59a62af68593303bf420338e719a17e1a5e243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.20.5
in commit 10780e8d6df83d7a92b6dd3282e91fdc0ba369af and
https://gitlab.gnome.org/GNOME/libgee/-/commit/f0ccfe94ff731929e93601a38f931a12d52e5c2e:

task.c:59:1: error: initializer element is not constant
 static GOnce gee_task_data_async_pool = (GOnce) G_ONCE_INIT;
 ^

Fixes:
 - http://autobuild.buildroot.org/results/8354ea4192bcf2eb9c3be74d93b640db52ced10a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/granite/Config.in | 6 ++++--
 package/libgee/Config.in  | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/granite/Config.in b/package/granite/Config.in
index 726bde1b2d..9519e16d45 100644
--- a/package/granite/Config.in
+++ b/package/granite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANITE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgee
 	depends on BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_LIBGEE
 	select BR2_PACKAGE_LIBGLIB2
@@ -12,7 +13,8 @@ config BR2_PACKAGE_GRANITE
 
 	  https://github.com/elementary/granite
 
-comment "granite needs libgtk3 and a toolchain w/ wchar, threads"
+comment "granite needs libgtk3 and a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libgee/Config.in b/package/libgee/Config.in
index 07c387c985..cb33ec9ec2 100644
--- a/package/libgee/Config.in
+++ b/package/libgee/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libgee is an utility library providing GObject-based
@@ -10,6 +11,7 @@ config BR2_PACKAGE_LIBGEE
 
 	  https://wiki.gnome.org/Projects/Libgee
 
-comment "libgee needs a toolchain w/ wchar, threads"
+comment "libgee needs a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
