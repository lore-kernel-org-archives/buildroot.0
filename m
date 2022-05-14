Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34046C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DA340525;
	Sat, 14 May 2022 21:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIfapGKreU8O; Sat, 14 May 2022 21:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2DEC401D2;
	Sat, 14 May 2022 21:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C299F1BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEFA240004
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JzxB8iKg0EG for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03A7A401D2
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:04:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 94BB384D91; Sat, 14 May 2022 20:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 22:58:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecaca2d01e02076ba8f400d180125cc9482cc1fc
X-Git-Newrev: 91600a62afa7fece61f692f0df8e446c459b09ff
X-Patchwork-Hint: ignore
Message-Id: <20220514205359.94BB384D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libks: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=91600a62afa7fece61f692f0df8e446c459b09ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libks needs NPTL since its addition in commit
5752d18bfcdb060c9d3b8c13330344cbdee74b75:

/nvmedata/autobuild/instance-17/output-1/build/libks-1.8.0/src/ks_thread.c: In function 'thread_launch':
/nvmedata/autobuild/instance-17/output-1/build/libks-1.8.0/src/ks_thread.c:237:21: error: 'pthread_setname_np' undeclared (first use in this function); did you mean 'pthread_setcanceltype'?
  237 |  if (thread->tag && pthread_setname_np)
      |                     ^~~~~~~~~~~~~~~~~~
      |                     pthread_setcanceltype

Fixes:
 - http://autobuild.buildroot.org/results/8a93b75ee51e005383eac17aa7577b43eda4cd92

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libks/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libks/Config.in b/package/libks/Config.in
index 366b5bda71..4781d188bf 100644
--- a/package/libks/Config.in
+++ b/package/libks/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBKS
 	bool "libks"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -11,6 +11,6 @@ config BR2_PACKAGE_LIBKS
 
 	  https://github.com/signalwire/libks
 
-comment "libks needs a toolchain w/ C++, threads, dynamic library"
+comment "libks needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
