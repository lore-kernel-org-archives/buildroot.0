Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53DFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 06:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4517041582;
	Mon, 11 Apr 2022 06:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFcQK73bhnPU; Mon, 11 Apr 2022 06:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE9C4157C;
	Mon, 11 Apr 2022 06:30:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0EC51BF46A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 06:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FDC260AB2
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 06:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGTjFUbXTGla for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 06:30:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE73460A8B
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 06:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5CEF8386F; Mon, 11 Apr 2022 06:20:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 08:29:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 989c7c8f7b6ed5c845628ba46099591539c302d7
X-Git-Newrev: 2abfc4ac716578d1584d670988ba66174762b1fe
X-Patchwork-Hint: ignore
Message-Id: <20220411062028.A5CEF8386F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux/linux.mk: ensure
 custom kernel version is set
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

commit: https://git.buildroot.net/buildroot/commit/?id=2abfc4ac716578d1584d670988ba66174762b1fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Validate that BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is set when
required.

Fixes:
http://autobuild.buildroot.net/results/117/117c08e414776202446a9fdb96d084aa3c16af48

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 84b1eacc328baad3ceb63505ac588022620a05f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 102b7a15d4..7ff7b05042 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -566,6 +566,12 @@ endif
 
 ifeq ($(BR_BUILDING),y)
 
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
+ifeq ($(LINUX_VERSION),)
+$(error No custom kernel version set. Check your BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE setting)
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 # We must use the user-supplied kconfig value, because
 # LINUX_KCONFIG_DEFCONFIG will at least contain the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
