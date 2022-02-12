Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FC8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07A2D40158;
	Sat, 12 Feb 2022 22:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9CJldY9W9cP; Sat, 12 Feb 2022 22:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFCC4400AB;
	Sat, 12 Feb 2022 22:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A08E1BF4DD
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47AA540339
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVL2c_AmXbY1 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:02:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 762F0402F3
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A6588825B3; Sat, 12 Feb 2022 21:54:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 23:01:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdefb4538e07ef37d77aa3634907b15652d31ff9
X-Git-Newrev: 498117df1261c582ca70851c8a4f58db95632f2c
X-Patchwork-Hint: ignore
Message-Id: <20220212215455.A6588825B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: improve host build
 failure fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=498117df1261c582ca70851c8a4f58db95632f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Peter Seiderer package util-linux doesn't need raw support
when built for host, so let's remove:
HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
in favor of:
HOST_UTIL_LINUX_CONF_OPTS += --disable-raw
This is a better approach than my commit:
https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 1ca605f3fb..a25b69d910 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -41,7 +41,6 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 	touch $(@D)/disk-utils/raw.8
 endef
 UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
@@ -202,6 +201,11 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--without-ncursesw \
 	--without-tinfo
 
+# Disable raw command since starting from version 2.37 needs a
+# work-around to build but in the end we don't need at all.
+HOST_UTIL_LINUX_CONF_OPTS += \
+	--disable-raw
+
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
 HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
 # disable commands that have ncurses dependency, as well as
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
