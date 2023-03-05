Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630EDC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0631E4109F;
	Sun,  5 Mar 2023 17:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0631E4109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGkZrKYATJiG; Sun,  5 Mar 2023 17:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE28410C2;
	Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE28410C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25F121BF870
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A0940600
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A0940600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFXPngNiWDHW for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE70400F3
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE70400F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE49F86330; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:33:59 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: f8c1d7a2fa770e2194b566bae1a5c3e3968267ae
X-Git-Newrev: a1d2b230f8a176137ab051094755bfadbadbadab
X-Patchwork-Hint: ignore
Message-Id: <20230305173947.EE49F86330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/efivar: needs
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1d2b230f8a176137ab051094755bfadbadbadab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Add a thread dependency as Upstream quickly closed
https://github.com/rhboot/efivar/pull/238 to fix the following build
failure without threads raised since bump to version 38 in commit
f24029b561fbda0953c7dbd93d2485b03873996d and
https://github.com/rhboot/efivar/commit/cff88dd96b9d43e2c5875a24ba6180b196890ded:

thread-test.c:14:10: fatal error: pthread.h: No such file or directory
   14 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f2da14f91dc602a32dd5b2b7bdf3d3aa43afa7f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c29f6d63e0adebc8502dd707d3e4050af254d342)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efibootmgr/Config.in | 5 +++--
 package/efivar/Config.in     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 98ff71c996..5800e6c143 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS # efivar
 	depends on !BR2_STATIC_LIBS # efivar
+	depends on BR2_TOOLCHAIN_HAS_THREADS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
@@ -15,9 +16,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhboot/efibootmgr
 
-comment "efibootmgr needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efibootmgr needs a toolchain w/ dynamic library, threads, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 74f2bb5abb..d4402dbcf7 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_EFIVAR
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
 	# and the efivar source handles that situation. However, some
 	# Sourcery CodeBench toolchains use 4.4 kernel headers but they
@@ -22,9 +23,9 @@ config BR2_PACKAGE_EFIVAR
 
 	  https://github.com/rhboot/efivar
 
-comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efivar needs a toolchain w/ dynamic library, threads, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
