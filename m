Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79106E7719A
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A24660BA2;
	Wed,  8 Jan 2025 22:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys-R2iQGhFeb; Wed,  8 Jan 2025 22:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30CFB60BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30CFB60BA5;
	Wed,  8 Jan 2025 22:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 180881FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D13402F4
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPEupbSdFR29 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18EF3402FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18EF3402FE
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 058BE83F32; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:28:54 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 39e5e3a29a52a688f9cf172a8e8317d2e2d01e8d
X-Git-Newrev: 13250bf4aafbde9b0f946d5d07aaf3b6dc34d31f
X-Patchwork-Hint: ignore
Message-Id: <20250108220444.058BE83F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] linux: select proper
 defconfig on PowerPC
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

commit: https://git.buildroot.net/buildroot/commit/?id=13250bf4aafbde9b0f946d5d07aaf3b6dc34d31f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit 82326a3d8392d02f53c47bdaed21ff8012a6d978)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
