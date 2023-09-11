Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF67EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA0F4033A;
	Mon, 11 Sep 2023 07:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA0F4033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnBcPFFYFbWx; Mon, 11 Sep 2023 07:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EBB40511;
	Mon, 11 Sep 2023 07:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EBB40511
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF54E1BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8B31607A4
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B31607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6Cf0pjXTJ0W for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D44DC60595
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D44DC60595
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C453986C38; Mon, 11 Sep 2023 07:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 09:13:58 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 00316d993a186b96f4f643cfe246247a3c34d17d
X-Git-Newrev: 0c4c853483e2bb314ed08050ceae00541e91ceae
X-Patchwork-Hint: ignore
Message-Id: <20230911072724.C453986C38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mpd: fix reversed
 logic in tcp disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c4c853483e2bb314ed08050ceae00541e91ceae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

In commit 54b9008d482923131191da75f09966483f4ecac1 ("package/mpd: bump
to version 0.21.11"), mpd was migrated from using the autotools build
system to the meson build system.

As part of this, the BR2_PACKAGE_MPD_TCP was incorrectly modified,
leading BR2_PACKAGE_MPD_TCP disabled to actually enable TCP, and
BR2_PACKAGE_MPD_TCP enabled to not explicitly enable TCP support.

This commit fixes that by handling this option in the common way.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit be08ba35698991ca0f42c7c11c70690caab3e378)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d73072a439..b599e320e0 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -285,8 +285,10 @@ else
 MPD_CONF_OPTS += -Dsqlite=disabled
 endif
 
-ifneq ($(BR2_PACKAGE_MPD_TCP),y)
+ifeq ($(BR2_PACKAGE_MPD_TCP),y)
 MPD_CONF_OPTS += -Dtcp=true
+else
+MPD_CONF_OPTS += -Dtcp=false
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
