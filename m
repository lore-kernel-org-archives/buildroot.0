Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBCBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E5B41D79;
	Wed, 30 Mar 2022 17:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtZcrHt_NJGA; Wed, 30 Mar 2022 17:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342E341D2A;
	Wed, 30 Mar 2022 17:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE84C1BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE6D40569
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kr6HWhcf4EUh for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:22:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1841D40168
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:22:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D348C85FD1; Wed, 30 Mar 2022 17:12:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 19:19:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7dcc62e62f8728b6d73ec43a419c1ce6abc93e05
X-Git-Newrev: b78b4fedb5c19e87d866fdef0acd028c633fa900
X-Patchwork-Hint: ignore
Message-Id: <20220330171246.D348C85FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgee: needs gcc
 >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=b78b4fedb5c19e87d866fdef0acd028c633fa900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit de59a62af68593303bf420338e719a17e1a5e243)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
