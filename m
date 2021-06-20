Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488A5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0270A60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0270A60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1F6608E6;
	Tue,  3 Aug 2021 23:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDKaMN5ZMQ9k; Tue,  3 Aug 2021 23:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21964608FD;
	Tue,  3 Aug 2021 23:13:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47B351BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E022E40687
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mZPvWchKfPD for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A91404CE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AC3D6866AF; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:20:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 026d447c2c2a3b0092c45c2afa3d17284aa31276
X-Git-Newrev: f5c0c74ebe1ce91fa12073f7c9f5652befa31541
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.AC3D6866AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: Fix build for
 mips, 2nd attempt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f5c0c74ebe1ce91fa12073f7c9f5652befa31541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch introduced in commit
uses "defined(HAVE_SYS_AUXV_H)". However, ffmpeg configure is not GNU
autoconf, and it defines the symbol to 0 when not found. Use
HAVE_SYS_AUXV_H without defined() instead.

Fixes:
http://autobuild.buildroot.net/results/da0/da03909291e97c525eb1f53dfc743a1897f59d6e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index 7af01463e8..8b81e66981 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -8,7 +8,7 @@ Check for sys/auxv.h because not all toolchains contain this header.
 Fixes https://trac.ffmpeg.org/ticket/9138
 
 Patch sent upstream:
-http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281037.html
+http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
@@ -17,7 +17,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 82367fd30d..b0154cb8b2 100755
+index 6bfd98b384..773a7d516c 100755
 --- a/configure
 +++ b/configure
 @@ -2161,6 +2161,7 @@ HEADERS_LIST="
@@ -28,7 +28,7 @@ index 82367fd30d..b0154cb8b2 100755
      sys_param_h
      sys_resource_h
      sys_select_h
-@@ -6210,6 +6211,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+@@ -6218,6 +6219,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
  check_headers windows.h
  check_headers X11/extensions/XvMClib.h
  check_headers asm/types.h
@@ -37,7 +37,7 @@ index 82367fd30d..b0154cb8b2 100755
  # it seems there are versions of clang in some distros that try to use the
  # gcc headers, which explodes for stdatomic
 diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
-index 59619d54de..4738104cdd 100644
+index 59619d54de..19196de50b 100644
 --- a/libavutil/mips/cpu.c
 +++ b/libavutil/mips/cpu.c
 @@ -19,7 +19,7 @@
@@ -45,7 +45,7 @@ index 59619d54de..4738104cdd 100644
  #include "libavutil/cpu_internal.h"
  #include "config.h"
 -#if defined __linux__ || defined __ANDROID__
-+#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
++#if (defined __linux__ || defined __ANDROID__) && HAVE_SYS_AUXV_H
  #include <stdint.h>
  #include <stdio.h>
  #include <string.h>
@@ -54,7 +54,7 @@ index 59619d54de..4738104cdd 100644
  #endif
  
 -#if defined __linux__ || defined __ANDROID__
-+#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
++#if (defined __linux__ || defined __ANDROID__) && HAVE_SYS_AUXV_H
  
  #define HWCAP_LOONGSON_CPUCFG (1 << 14)
  
@@ -63,7 +63,7 @@ index 59619d54de..4738104cdd 100644
  int ff_get_cpu_flags_mips(void)
  {
 -#if defined __linux__ || defined __ANDROID__
-+#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
++#if (defined __linux__ || defined __ANDROID__) && HAVE_SYS_AUXV_H
      if (cpucfg_available())
          return cpu_flags_cpucfg();
      else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
