Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589D3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B98F60B63;
	Thu,  9 Jun 2022 20:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USYTOrFRZcXE; Thu,  9 Jun 2022 20:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7666060A;
	Thu,  9 Jun 2022 20:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 631BD1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51C1741C94
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyn0naQ-EWI0 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56CB141B6B
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F54686ECF; Thu,  9 Jun 2022 20:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:31:27 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e37acca9b6d0ed18e5bb023b82d3f9ff219ec53b
X-Git-Newrev: 86ff2cb992d92f04ed07455443ca7229a1e24e4c
X-Patchwork-Hint: ignore
Message-Id: <20220609202328.8F54686ECF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mono: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=86ff2cb992d92f04ed07455443ca7229a1e24e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

mono unconditionally uses pthread_attr_get_np and so needs NTPL since
version 4.0.1.43 and
https://github.com/mono/mono/commit/748fefa1d7199f008c6e56499ba482fb17fe1583:

mono-threads-linux.c: In function 'mono_threads_platform_get_stack_bounds':
mono-threads-linux.c:26:15: error: implicit declaration of function 'pthread_getattr_np'; did you mean 'pthread_attr_init'? [-Werror=implicit-function-declaration]
   26 |         res = pthread_getattr_np (pthread_self (), &attr);
      |               ^~~~~~~~~~~~~~~~~~
      |               pthread_attr_init

Fixes:
 - http://autobuild.buildroot.org/results/6534ee4ae699c17ee98f6f89a8a1212936e04481

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5471d7ce252208ffa8a7cdbb6f1f03939097ba39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 44b8cf8581..76178bcf9b 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
@@ -23,7 +23,7 @@ config BR2_PACKAGE_MONO
 
 	  http://download.mono-project.com/sources/mono/
 
-comment "mono needs a toolchain w/ C++, threads, dynamic library"
+comment "mono needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
