Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C7EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4F240564;
	Mon, 11 Sep 2023 07:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4F240564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8wfg1dIRIyc; Mon, 11 Sep 2023 07:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BF140512;
	Mon, 11 Sep 2023 07:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41BF140512
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65E7F1BF955
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA3B607A4
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FA3B607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bZX1bLqCYyp for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D65A60595
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D65A60595
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48EC486C22; Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 09:14:19 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f16afb8d9f2b410fcb190874b59971fef16dfeca
X-Git-Newrev: 20ed5635f14bfcc2b14b9498001d848919c06c5c
X-Patchwork-Hint: ignore
Message-Id: <20230911072609.48EC486C22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mpd: fix reversed
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

commit: https://git.buildroot.net/buildroot/commit/?id=20ed5635f14bfcc2b14b9498001d848919c06c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
