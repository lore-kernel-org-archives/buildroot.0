Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2FDC7618B
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 15:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1550418D8;
	Wed, 15 Mar 2023 15:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1550418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58ct2DkwLwN8; Wed, 15 Mar 2023 15:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786244190B;
	Wed, 15 Mar 2023 15:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786244190B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07C241BF31E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4762402E6
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4762402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6agapRctHaP for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14EA140374
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14EA140374
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0319587456; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 16:03:53 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: fe1d532ac2c27a662e51a06c879521be92ddcbe2
X-Git-Newrev: c37f7127377619ed30008804305abe8b7d4b3d26
X-Patchwork-Hint: ignore
Message-Id: <20230315150627.0319587456@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/mpv: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=c37f7127377619ed30008804305abe8b7d4b3d26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

mpv unconditionally uses pthread_getcpuclockid since version 0.33.0 and
https://github.com/mpv-player/mpv/commit/fd3caa264ea0848e7e30db94390063c87e247003
resulting in the following build failure without NPTL since commit
e3cf26dda31e6c1720c53e0229d93fe2a5ea18aa:

../common/stats.c: In function 'get_thread_cpu_time_ns':
../common/stats.c:75:9: error: implicit declaration of function 'pthread_getcpuclockid'; did you mean 'pthread_getspecific'? [-Werror=implicit-function-declaration]
   75 |     if (pthread_getcpuclockid(thread, &id) == 0 &&
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         pthread_getspecific

Fixes:
 - http://autobuild.buildroot.org/results/98cde5cbb0844c6ef483a75cf9a6f3fd3a46c693

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 720a68e33be7f46c8b5866d6b8f98b400f83f979)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/Config.in   | 6 +++---
 package/tovid/Config.in | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 6811497d73..8efb353c33 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_MPV
 	bool "mpv"
 	depends on BR2_INSTALL_LIBSTDCPP # libass
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
@@ -34,10 +34,10 @@ config BR2_PACKAGE_MPV
 
 	  https://mpv.io/
 
-comment "mpv needs a toolchain w/ C++, threads, gcc >= 4.9"
+comment "mpv needs a toolchain w/ C++, NPTL, gcc >= 4.9"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 3dbb0e229e..c263acdd62 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TOVID
 	bool "tovid"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mpv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON3
@@ -29,12 +29,12 @@ config BR2_PACKAGE_TOVID
 
 	  http://tovid.wikia.com/wiki/Installing_tovid
 
-comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.9"
+comment "tovid needs a toolchain w/ NPTL, C++, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR
@@ -45,6 +45,6 @@ comment "tovid depends on python3"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
