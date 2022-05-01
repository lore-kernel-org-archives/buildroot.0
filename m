Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FE3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 11:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 917E3403CA;
	Sun,  1 May 2022 11:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwmGVPRVP5yd; Sun,  1 May 2022 11:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B08CD40150;
	Sun,  1 May 2022 11:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5B51BF310
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 11:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1803F605D5
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 11:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWNywh4eO_Do for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 11:06:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1F9A605A3
 for <buildroot@buildroot.org>; Sun,  1 May 2022 11:06:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.124.42])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B1A3819F5A6;
 Sun,  1 May 2022 13:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651403215;
 bh=v4w4tEOBP5iAg/1uAtnpCoai0Ku/anB7L94uBq/DhIE=;
 h=From:To:Cc:Subject:Date:From;
 b=RE/zoFQISjsUlSzwcepkgANaVw3LBWhsmjWvNFriMjJO6JJVqJ/pTZYg/11uuhmqH
 /opFH5+P4IiD8LHbWz4hhdQ8PY0anq3Ysyzd5W24f/RiA8Fg7dtO2oY0jTYZft5ei1
 63FGEzZ0gWQ1uu2izzPQiv7VhEGBQq+8YAbABXdXh9b/lwkpslPrTYAGundLKtenep
 cgHgN6NgGaCaFt/O2UVIag9Z7NcGSVH02cPHA3JO8402vlzYlU8Xyw57p7cfuKXnF5
 hofWwL75LEfZybvfYoo5ay94K4dZRpUelirl7E9MAwTBI9ArluV0KEiveoBxL6WEVG
 e3rds2R636JDQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 13:06:40 +0200
Message-Id: <20220501110640.300796-1-ju.o@free.fr>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glslsandbox-player: fix build with
 libexecinfo
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix build failure raised on uclibc and musl since the addition of
libexecinfo package in commit:
eea8ba446c10701a273432552108d80fb2224ef4

Fixes:
- http://autobuild.buildroot.net/results/9591ffe5968fe5f20b29799d1c234426cacd549a

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glslsandbox-player/glslsandbox-player.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index c5fbf062b7..70bd5ca370 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -12,6 +12,11 @@ GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
 GLSLSANDBOX_PLAYER_LICENSE = BSD-2-Clause
 GLSLSANDBOX_PLAYER_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libexecinfo
+GLSLSANDBOX_PLAYER_CONF_ENV += LIBS="-lexecinfo"
+endif
+
 ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_PNG),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += libpng
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-libpng
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
