Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E245C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C72827F3;
	Sun, 27 Feb 2022 19:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mg5HATovWKKI; Sun, 27 Feb 2022 19:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528D1827A1;
	Sun, 27 Feb 2022 19:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05EE91BF3EC
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7545540220
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqjaVpE6hmNT for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED814052B
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 56241827CC; Sun, 27 Feb 2022 19:37:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:35:08 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: af705b14a91b2c025d36e77f2f876abc3602835d
X-Git-Newrev: baf475e84743d2f97b657e220f9bff10f3ee4c70
X-Patchwork-Hint: ignore
Message-Id: <20220227193728.56241827CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/util-linux:
 improve host build failure fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=baf475e84743d2f97b657e220f9bff10f3ee4c70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 498117df1261c582ca70851c8a4f58db95632f2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5a4ff64d01..40fd518a58 100644
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
