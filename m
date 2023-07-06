Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC9AEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C446A41625;
	Thu,  6 Jul 2023 11:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C446A41625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yl5Hl2fq4QDA; Thu,  6 Jul 2023 11:39:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39304180D;
	Thu,  6 Jul 2023 11:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39304180D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62E061BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A26A4027F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A26A4027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLdegsf0RAST for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:38:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DCE740136
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCE740136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5357286897; Thu,  6 Jul 2023 11:38:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:36:02 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5d6308d5434e970036ce4fcb5f8623395b22a558
X-Git-Newrev: 3a8384bc40c263acca12af28910bf2c80061833e
X-Patchwork-Hint: ignore
Message-Id: <20230706113855.5357286897@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] linux: make kconfig
 depend on host-make
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a8384bc40c263acca12af28910bf2c80061833e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
$(BR2_MAKE). However, this also implicitly sets LINUX_KCONFIG_MAKE.

Thus, when host-make is being used in a build that has
PER_PACKAGE_DIRECTORIES enabled, the dotconfig step will try to use the
make instance from the host directory, but since it is not listed in
LINUX_KCONFIG_DEPENDENCIES, it won't be available yet at that point in
time.

Add an explicit dependency to LINUX_KCONFIG_DEPENDENCIES to have it
copied over early enough.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 66681bd4a6b9faadf9a6f772efb2705b06084cfc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index cc36b5251d..1c4fe45ac9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,7 +88,8 @@ LINUX_DEPENDENCIES += \
 # only if the host does not have them.
 LINUX_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
-	$(BR2_FLEX_HOST_DEPENDENCY)
+	$(BR2_FLEX_HOST_DEPENDENCY) \
+	$(BR2_MAKE_HOST_DEPENDENCY)
 
 # Starting with 4.18, the kconfig in the kernel calls the
 # cross-compiler to check its capabilities. So we need the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
