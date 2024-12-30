Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C17C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2EE54F480;
	Fri, 28 Feb 2025 16:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lw7Nta2RjTSl; Fri, 28 Feb 2025 16:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604E44FDE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604E44FDE9;
	Fri, 28 Feb 2025 16:48:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F23E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36ACD42E46
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_7c7QkCwZ11 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2428042684
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2428042684
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F3EF87BF7; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 19:25:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d94c478ebc03fb71cd0c7ee48e7d52ff79b2807e
X-Git-Newrev: 82326a3d8392d02f53c47bdaed21ff8012a6d978
X-Patchwork-Hint: ignore
Message-Id: <20250228162955.1F3EF87BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] linux: select proper defconfig
 on PowerPC
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

commit: https://git.buildroot.net/buildroot/commit/?id=82326a3d8392d02f53c47bdaed21ff8012a6d978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The handling of BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG is currently
not doing a proper job: it is selecting ppc64le_defconfig if
BR2_powerpc64le, and using the default of "defconfig" for everything
else.

However:

- Since upstream commit 22f17b02f88b48c01d3ac38d40d2b0b695ab2d10,
  which landed in Linux 6.8, the default defconfig is
  ppc64le_defconfig and no longer ppc64_defconfig. This means that
  despite the condition in linux.mk, we are in fact now always
  building ppc64le_defconfig.

- It doesn't handle the 32-bit case, as a 64-bit defconfig gets used
  by default. This causes build failures in the autobuilders.

To fix this we explicitly handle BR2_powerpc64le, BR2_powerpc64 and
BR2_powerpc, and use appropriate defconfigs for each case.

Fixes:

  http://autobuild.buildroot.net/results/c15eaf2e7455aa265cc045e6d8be7cac5348d925/ (powerpc)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6..7e443fb227 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -343,6 +343,10 @@ LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
 ifeq ($(BR2_powerpc64le),y)
 LINUX_KCONFIG_DEFCONFIG = ppc64le_defconfig
+else ifeq ($(BR2_powerpc64),y)
+LINUX_KCONFIG_DEFCONFIG = ppc64_defconfig
+else ifeq ($(BR2_powerpc),y)
+LINUX_KCONFIG_DEFCONFIG = ppc_defconfig
 else
 LINUX_KCONFIG_DEFCONFIG = defconfig
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
