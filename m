Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B69CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B3384774;
	Fri, 28 Feb 2025 16:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kq-H9KiA4xCm; Fri, 28 Feb 2025 16:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E29484780
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E29484780;
	Fri, 28 Feb 2025 16:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E56711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 735C242E97
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bbE8uRQ07Jt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89974266D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E89974266D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E409A8769C; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 19:18:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f942a236e4eefad8f044bd1727a0b5c76b33e421
X-Git-Newrev: 5dae966a30c5485e45b94f750a739d36810cba4c
X-Patchwork-Hint: ignore
Message-Id: <20250228162954.E409A8769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] linux: select
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dae966a30c5485e45b94f750a739d36810cba4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 linux/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 5d348693c2..89b2e110a8 100644
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
