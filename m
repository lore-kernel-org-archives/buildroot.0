Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564AFEE801F
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02128404E9;
	Mon, 11 Sep 2023 07:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02128404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TeRTbTSvb2i; Mon, 11 Sep 2023 07:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B97404E2;
	Mon, 11 Sep 2023 07:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B97404E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4EF1BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24974401D5
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24974401D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCS6eirElGja for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64EE640122
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64EE640122
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52FB986C23; Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 09:21:20 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 20ed5635f14bfcc2b14b9498001d848919c06c5c
X-Git-Newrev: 99d5bacae619c68f2f9270a5943a5b0cd2a69aaa
X-Patchwork-Hint: ignore
Message-Id: <20230911072609.52FB986C23@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mpd: introduce
 id3tag feature dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d5bacae619c68f2f9270a5943a5b0cd2a69aaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

id3tag is a sub-feature that is needed to extract information from mp3 files.
It selects the corresponding library and handles config settings. Two other
features need this sub-feature, but handle all library selections themselves
and omit enabling the id3tag feature. In consequence, users have to remember
to select both mp3 library and id3tag, otherwise the mpd executable will not
process mp3 files.

Reflect feature dependency in mpd Config.in to make id3tag selection automatic.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 876a365ea2a1c48477eabfe3ae600a9d48f1b4ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
