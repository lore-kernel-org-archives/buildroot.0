Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15843C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 17:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D784460600;
	Sun, 12 May 2024 17:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JgZNh_GU8V3; Sun, 12 May 2024 17:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E612360616
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E612360616;
	Sun, 12 May 2024 17:54:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7CC1BF421
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6999E4063E
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 17:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcgTkiPxOTMf for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 17:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D5B840637
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D5B840637
 for <buildroot@buildroot.org>; Sun, 12 May 2024 17:54:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6652F870C4; Sun, 12 May 2024 17:54:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 18:53:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aea54eab471c0efe696984859a6dcd2f7487f83c
X-Git-Newrev: 31e7ca602686f936a7ca9baa6830f16d9744e429
X-Patchwork-Hint: ignore
Message-Id: <20240512175414.6652F870C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: remove libatomic from linker
 flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=31e7ca602686f936a7ca9baa6830f16d9744e429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kodi added detection for atomic/libatomic with commit
https://github.com/xbmc/xbmc/commit/1673f476b802da1da942cef256cae6272fdf9a4b
so we can remove our own code to handle the dependency.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/kodi.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 62463b731e..94cab237dc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -217,11 +217,6 @@ else
 KODI_CONF_OPTS += -D_AVX2_OK=OFF -D_AVX2_TRUE=OFF
 endif
 
-# mips: uses __atomic_load_8
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
 KODI_C_FLAGS += -std=gnu99
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
