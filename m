Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 12:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745AB6131A;
	Thu,  9 Nov 2023 12:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 745AB6131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehn70818bOBq; Thu,  9 Nov 2023 12:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C726260F1E;
	Thu,  9 Nov 2023 12:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C726260F1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2215B1BF40F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF8D660F1E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8D660F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3av83WUuf9Y for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4274960A9B
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4274960A9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30D0F8614F; Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 13:47:25 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: c286101af860755e7d879b0132c56af09d4fb413
X-Git-Newrev: c284d6bba0944ae3af609312ab2411e525787d28
X-Patchwork-Hint: ignore
Message-Id: <20231109125230.30D0F8614F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/nano: really
 disable nanorc for !BR2_PACKAGE_FILE
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

commit: https://git.buildroot.net/buildroot/commit/?id=c284d6bba0944ae3af609312ab2411e525787d28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Commit 3c4fa30f7abf (package/nano: fix tiny build) tried to explicitly
disable libmagic/coloring/nanorc, but accidently passed 2x
--disable-libmagic instead of --disable-nanorc.  Fix that.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c71477f663c64bf7e3455e235f610fe17d0956c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 8a2003b92a..8b93527bec 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -34,7 +34,7 @@ ifeq ($(BR2_PACKAGE_FILE),y)
 NANO_DEPENDENCIES += file
 NANO_CONF_OPTS += --enable-libmagic --enable-color --enable-nanorc
 else
-NANO_CONF_OPTS += --disable-libmagic --disable-libmagic --disable-color
+NANO_CONF_OPTS += --disable-libmagic --disable-color --disable-nanorc
 endif # BR2_PACKAGE_FILE
 endif # BR2_PACKAGE_NANO_TINY
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
