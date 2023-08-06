Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0271EEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B575340B48;
	Mon, 21 Aug 2023 20:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B575340B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBsxLZEZU2lt; Mon, 21 Aug 2023 20:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0722B40BBF;
	Mon, 21 Aug 2023 20:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0722B40BBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 987321BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5F661121
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF5F661121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 728XZlhnpekm for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD9C6111C
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD9C6111C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9FD186024; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 21:46:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: be08ba35698991ca0f42c7c11c70690caab3e378
X-Git-Newrev: 876a365ea2a1c48477eabfe3ae600a9d48f1b4ab
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.C9FD186024@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: introduce id3tag
 feature dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=876a365ea2a1c48477eabfe3ae600a9d48f1b4ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

id3tag is a sub-feature that is needed to extract information from mp3 files.
It selects the corresponding library and handles config settings. Two other
features need this sub-feature, but handle all library selections themselves
and omit enabling the id3tag feature. In consequence, users have to remember
to select both mp3 library and id3tag, otherwise the mpd executable will not
process mp3 files.

Reflect feature dependency in mpd Config.in to make id3tag selection automatic.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 4 ++--
 package/mpd/mpd.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8f0af7b2d3..f350b7e72a 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -127,7 +127,7 @@ config BR2_PACKAGE_MPD_LIBSNDFILE
 config BR2_PACKAGE_MPD_MAD
 	bool "mad"
 	default y
-	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_MPD_ID3TAG
 	select BR2_PACKAGE_LIBMAD
 	help
 	  Enable mad input support.
@@ -141,7 +141,7 @@ config BR2_PACKAGE_MPD_MODPLUG
 
 config BR2_PACKAGE_MPD_MPG123
 	bool "mpg123"
-	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_MPD_ID3TAG
 	select BR2_PACKAGE_MPG123
 	help
 	  Enable mpg123 input support.
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b599e320e0..0205208946 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -190,7 +190,7 @@ MPD_CONF_OPTS += -Dsoxr=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MAD),y)
-MPD_DEPENDENCIES += libid3tag libmad
+MPD_DEPENDENCIES += libmad
 MPD_CONF_OPTS += -Dmad=enabled
 else
 MPD_CONF_OPTS += -Dmad=disabled
@@ -204,7 +204,7 @@ MPD_CONF_OPTS += -Dmodplug=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
-MPD_DEPENDENCIES += libid3tag mpg123
+MPD_DEPENDENCIES += mpg123
 MPD_CONF_OPTS += -Dmpg123=enabled
 else
 MPD_CONF_OPTS += -Dmpg123=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
