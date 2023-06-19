Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A86EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 20:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9639A41559;
	Mon, 19 Jun 2023 20:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9639A41559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WciobjFazptB; Mon, 19 Jun 2023 20:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF8C5401F3;
	Mon, 19 Jun 2023 20:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF8C5401F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2533E1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F261960DDF
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F261960DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1U28SoHVfn5 for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 20:25:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2A4160D80
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 20:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2A4160D80
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E5F9842D3; Mon, 19 Jun 2023 20:25:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 21:38:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a240f9da855fc4a01ae1a1a755722f8fc3773705
X-Git-Newrev: 66681bd4a6b9faadf9a6f772efb2705b06084cfc
X-Patchwork-Hint: ignore
Message-Id: <20230619202544.9E5F9842D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: make kconfig depend on host-make
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66681bd4a6b9faadf9a6f772efb2705b06084cfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
