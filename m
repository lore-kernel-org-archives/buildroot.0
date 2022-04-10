Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC21C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CD2416B9;
	Sun, 10 Apr 2022 15:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOAMMJxtNUbF; Sun, 10 Apr 2022 15:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E41414CD;
	Sun, 10 Apr 2022 15:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5C61BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DAED60D66
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZTKoRGFvwfu for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78AD9600B3
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A4EEB8388E; Sun, 10 Apr 2022 15:29:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:35:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e0121e94771e264c21ec1ea2dac908f79ee2af6c
X-Git-Newrev: e05dbffa0770353fb32f44ec7b045258a9e1bfac
X-Patchwork-Hint: ignore
Message-Id: <20220410152900.A4EEB8388E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pipewire: needs
 NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=e05dbffa0770353fb32f44ec7b045258a9e1bfac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since bump to version 0.3.26 in
commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/b029000610d122ac12939d02ade2264605ff43de

thread-loop.c:(.text+0x81c): undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/6019f4e9676743685e8af81d60ef198c1eba1fde

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f54b5a64f2f51c7e30b291dfa177f855bd88d6f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index dd13f31a73..3bfcf42a81 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
@@ -46,7 +46,8 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ dynamic library, threads, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
