Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08118CCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 07:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57E382264;
	Wed, 12 Nov 2025 07:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCq1sLqeFpKT; Wed, 12 Nov 2025 07:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC668226C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC668226C;
	Wed, 12 Nov 2025 07:53:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 061191C3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0E9040A29
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxJW0vMczg5C for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 07:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2884240A24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2884240A24
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2207983DAC; Wed, 12 Nov 2025 07:53:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 08:52:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c530f9d846f50ba0e1b5e2df58117a4815a2bfc5
X-Git-Newrev: 9e8a6c0dc27f542363e5e834c1dc67e72bc23514
X-Patchwork-Hint: ignore
Message-Id: <20251112075346.2207983DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvme: needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e8a6c0dc27f542363e5e834c1dc67e72bc23514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit f75faf43506e5090857eb4a9d876d430ff34a972 bumped nvme
from 1.12 to 2.15 which depends on dynamic library:

../libnvme-wrap.c:8:10: fatal error: dlfcn.h: No such file or directory
    8 | #include <dlfcn.h>

Fixes:
https://autobuild.buildroot.net/results/5bc/5bccbbd7ad4ce4a6898f6bcfd0a92c09e61324ca/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvme/Config.in      | 5 +++++
 package/petitboot/Config.in | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/nvme/Config.in b/package/nvme/Config.in
index 16b8726144..a27ddf50a9 100644
--- a/package/nvme/Config.in
+++ b/package/nvme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NVME
 	bool "nvme"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_MMU # libnvme
 	select BR2_PACKAGE_LIBNVME
 	help
@@ -7,3 +8,7 @@ config BR2_PACKAGE_NVME
 	  Express (optimized PCI Express SSD interface) devices.
 
 	  https://github.com/linux-nvme/nvme-cli
+
+comment "nvme needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 50d5a4da70..76cbbe9c6d 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2, agetty
 	depends on BR2_USE_WCHAR # elfutils, kexec-lite
-	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2
+	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2, nvme
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || !BR2_PACKAGE_KEXEC_ARCH_SUPPORTS # kexec
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
