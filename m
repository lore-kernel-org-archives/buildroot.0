Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EC4C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CCE81F39;
	Thu, 12 Jun 2025 08:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGRvgDx9tUgB; Thu, 12 Jun 2025 08:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94AF081E07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94AF081E07;
	Thu, 12 Jun 2025 08:38:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09D541E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6EE6405D4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSYhCpb0gFVu for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2468440077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2468440077
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2203682D97; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:46:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fd75bfb02fefdf23d9fe284ff58ed28487edd8e
X-Git-Newrev: 62e784cb97641b5d09eaab04f81e10982d636bcc
X-Patchwork-Hint: ignore
Message-Id: <20250612083827.2203682D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: drop dead code related to
 BR2_GCC_SUPPORTS_LIBCILKRTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=62e784cb97641b5d09eaab04f81e10982d636bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libcilkrts library was removed from gcc 8.x, and gcc 8.x is the
oldest version we allow building (to still support PowerPC SPE). So it
means the BR2_GCC_SUPPORTS_LIBCILKRTS is basically dead code because:

	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8

Will never evaluate to 'y' in current Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/Config.in.host         |  5 -----
 package/gcc/gcc-final/gcc-final.mk | 19 -------------------
 2 files changed, 24 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4258debbd1..8930c2a42a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -51,11 +51,6 @@ config BR2_GCC_VERSION_15_X
 
 endchoice
 
-# libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
-config BR2_GCC_SUPPORTS_LIBCILKRTS
-	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-
 config BR2_GCC_SUPPORTS_DLANG
 	bool
 	default y if BR2_aarch64
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 99d7047b5f..43aea72420 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -85,25 +85,6 @@ else
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 endif
 
-ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
-
-# libcilkrts does not support v8
-ifeq ($(BR2_sparc),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-# Pthreads are required to build libcilkrts
-ifeq ($(BR2_PTHREADS_NONE),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-# disable libcilkrts as there is no static version
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-endif # BR2_GCC_SUPPORTS_LIBCILKRTS
-
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
