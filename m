Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4700DE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C50815CC;
	Wed,  8 Jan 2025 22:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzSjZN4BRUoi; Wed,  8 Jan 2025 22:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3CA815CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3CA815CE;
	Wed,  8 Jan 2025 22:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF13A1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA19E60BAA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H39FMQVcJBZZ for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11F960B9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F11F960B9E
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBD6983F26; Wed,  8 Jan 2025 22:04:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:21:35 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 0bb33c4694778bde6defe38c180a9334eb421805
X-Git-Newrev: 1f6275e558efe187795de6726cf0b0b47bcfc6c4
X-Patchwork-Hint: ignore
Message-Id: <20250108220443.DBD6983F26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f6275e558efe187795de6726cf0b0b47bcfc6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The autobuilders are regularly reporting issues when building the
Linux kernel due to BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL not being
enabled.

Since the autobuilders are always using
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG, let's have this option
select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when the latest kernel is
used.

For now, we enable this for ARC, Sparc and x86-64, but it might have
to be extended for additional architectures based on build results.

Fixes:

  http://autobuild.buildroot.net/results/596699ede6e651163a23fa50386d84aca24c9a28
  http://autobuild.buildroot.net/results/77a767bcd78f9ed21668cc268e91a4584a821661
  http://autobuild.buildroot.net/results/e846d13c9f001b76a08ffb94f69c8dd26b4f5811

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5dae966a30c5485e45b94f750a739d36810cba4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 63078d686e..a7caf2743c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -168,6 +168,12 @@ config BR2_LINUX_KERNEL_USE_DEFCONFIG
 
 config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
+	# We know that the default configuration on some architectures
+	# requires host-openssl, so select it for the latest kernel
+	# version. This is mainly needed to fix autobuilder testing.
+	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
+	       BR2_LINUX_KERNEL_LATEST_VERSION && \
+	       (BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
