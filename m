Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859B9C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BDB9402A6;
	Wed, 26 Aug 2026 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgL0wRAMzLQe; Wed, 26 Aug 2026 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787778011;
	bh=qP1GZ4rIIuOJhp7vAwHfrR3E3nWInWZesHH8p7jR7ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ezBtF7MsFCD3JLZ/QT93LFhR5IKPJHBnqCO2B5RrqGi8jN7zu8bo+iH/vzEqjDPu+
	 Bz7ap6daLaJK/Q5u6lIc0OehCasHsqzdt4suo4uFffTOIh5wmR8etKNdIm8S92zx1W
	 gs+j1k9SfNVBgdB0c3f2cDxllk9cPui0Dy0sAYSeNKTspmJuCc2g6x0E1ARcBmPWXH
	 TRZ7iggIOdq7sYitfCY/PpMMWFsA0y+BIH6i/OqfrvfQQNJg8Qs5uRHHGRCHTKLhpB
	 wyvKfFKT2wEBhZXN68WAVdnRp7yZStinsWNxZeG+b9fKW44bXrBi7vQZwwRuGtopEy
	 HWJGuI+zZxrQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AED406C5;
	Wed, 26 Aug 2026 21:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 398A129B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3750740247
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uEkOSN1Gyzw for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D59A400A6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 749A3920AF; Wed, 26 Aug 2026 20:59:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 22:58:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ae04257a05da271623dd6375ca1cc7171a9ae1
X-Git-Newrev: d8dde961bc05a554f4a90c3bfd00a202ccfac71e
X-Patchwork-Hint: ignore
Message-Id: <20260826205913.749A3920AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: fix thread dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8dde961bc05a554f4a90c3bfd00a202ccfac71e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit 54f96add94901511862df18e527e456982005b8e ("package/bind:
security bump version to 9.20.24") the depends on
BR2_TOOLCHAIN_HAS_THREADS_NPTL was incorrectly downgraded to
BR2_TOOLCHAIN_HAS_THREADS:

-       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+       depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv

This is wrong because libuv depends on
BR2_TOOLCHAIN_HAS_THREADS_NPTL. This causes unmet dependencies:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBUV
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS_NPTL [=n] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
  Selected by [y]:
  - BR2_PACKAGE_BIND [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y] && BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS [=y]

Fix that by switching back to the BR2_TOOLCHAIN_HAS_THREADS_NPTL
dependency.

Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security bump version to 9.20.24")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 6f5f14a6bb..ab8ddcd0a2 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_USE_MMU # fork(), libcap, libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
-	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ threads, dynamic library, C++, gcc >= 4.9"
+comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
