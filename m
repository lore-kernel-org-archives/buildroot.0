Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3FFEE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB71A40B5E;
	Mon, 21 Aug 2023 20:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB71A40B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geVNjUQUfn1K; Mon, 21 Aug 2023 20:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE4640BC7;
	Mon, 21 Aug 2023 20:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FE4640BC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1610F1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BECF14155B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECF14155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7CxwS5xBNnT for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5983410A5
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5983410A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C08F486023; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 21:36:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7efd8e3c0b584a1d743db2c0005bf9b85f521ae9
X-Git-Newrev: be08ba35698991ca0f42c7c11c70690caab3e378
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.C08F486023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: fix reversed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be08ba35698991ca0f42c7c11c70690caab3e378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In commit 54b9008d482923131191da75f09966483f4ecac1 ("package/mpd: bump
to version 0.21.11"), mpd was migrated from using the autotools build
system to the meson build system.

As part of this, the BR2_PACKAGE_MPD_TCP was incorrectly modified,
leading BR2_PACKAGE_MPD_TCP disabled to actually enable TCP, and
BR2_PACKAGE_MPD_TCP enabled to not explicitly enable TCP support.

This commit fixes that by handling this option in the common way.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
