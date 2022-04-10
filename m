Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E246C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D7C9400F1;
	Sun, 10 Apr 2022 14:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkL7v8eOhaBU; Sun, 10 Apr 2022 14:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD084017A;
	Sun, 10 Apr 2022 14:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0E51BF990
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 987EA40119
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJPmDNLKaVgo for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAE4E400F1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:53:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 21C3C83829; Sun, 10 Apr 2022 14:43:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:48:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9e533d0326c340d1a5504350c93d0b071c3d70e
X-Git-Newrev: 84b1eacc328baad3ceb63505ac588022620a05f6
X-Patchwork-Hint: ignore
Message-Id: <20220410144321.21C3C83829@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux/linux.mk: ensure custom kernel
 version is set
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

commit: https://git.buildroot.net/buildroot/commit/?id=84b1eacc328baad3ceb63505ac588022620a05f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Validate that BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is set when
required.

Fixes:
http://autobuild.buildroot.net/results/117/117c08e414776202446a9fdb96d084aa3c16af48

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
