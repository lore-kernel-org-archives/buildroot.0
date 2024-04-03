Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EA3CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E24418E2;
	Wed,  3 Apr 2024 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XcSNTeNUY6y; Wed,  3 Apr 2024 21:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 967F9418CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 967F9418CE;
	Wed,  3 Apr 2024 21:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 718831BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E7B56073E
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rihg7LtEPoMu for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7892960D53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7892960D53
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71DA084A80; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:09:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57391fad2e619395340b81957ddceab1b1df2e20
X-Git-Newrev: a26701a0dbe2654f4a1e2a53c709ac12077e18f4
X-Patchwork-Hint: ignore
Message-Id: <20240403210939.71DA084A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: Add compatibility to
 libgpiod2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a26701a0dbe2654f4a1e2a53c709ac12077e18f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

swupdate supports both the old and the new API, so HAVE_LIBGPIOD is
enabled if either is enabled.

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/swupdate/Config.in   | 4 ++--
 package/swupdate/swupdate.mk | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index ba3f6a0c0f..3708df0881 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -37,8 +37,8 @@ config BR2_PACKAGE_SWUPDATE
 	    remote handler.
 	  * Select BR2_PACKAGE_LIBRSYNC to add support for using
 	    rdiff handler.
-	  * Select BR2_PACKAGE_LIBGPIOD to add support for
-	    microcontroller firmware update.
+	  * Select BR2_PACKAGE_LIBGPIOD or BR2_PACKAGE_LIBGPIOD2 to add
+	    support for microcontroller firmware update.
 	  * Select BR2_PACKAGE_EFIBOOTMGR to add support for EFI Boot
 	    Guard.
 	  * Select BR2_PACKAGE_LIBCURL, BR2_PACKAGE_LIBWEBSOCKETS,
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ca8c140886..a2b0995227 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -72,7 +72,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=n
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+ifeq ($(BR2_PACKAGE_LIBGPIOD2),y)
+SWUPDATE_DEPENDENCIES += libgpiod2
+SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
+else ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
 SWUPDATE_DEPENDENCIES += libgpiod
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
