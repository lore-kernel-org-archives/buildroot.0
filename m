Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FD4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 09:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428D040C3D;
	Wed,  5 Oct 2022 09:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 428D040C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EciTokchuL2s; Wed,  5 Oct 2022 09:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7529740C47;
	Wed,  5 Oct 2022 09:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7529740C47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39B921BF95D
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C6360FE1
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14C6360FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1FWawU57mZH for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 09:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 014CC60FCC
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 014CC60FCC
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 09:11:27 +0000 (UTC)
Received: from iago.. (unknown [151.19.224.153])
 by serv15.avernis.de (Postfix) with ESMTPSA id AF69DBDE2DFE;
 Wed,  5 Oct 2022 11:11:24 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 11:10:31 +0200
Message-Id: <20221005091032.3014-4-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409160921.GA3547512@scaer>
References: <20220409160921.GA3547512@scaer>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 3/4] package/mpd: introduce id3tag feature
 dependency
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

id3tag is a sub-feature that is needed to extract information from mp3 files.
It selects the corresponding library and handles config settings. Two other
features need this sub-feature, but handle all library selections themselves
and omit enabling the id3tag feature. In consequence, users have to remember
to select both mp3 library and id3tag, otherwise the mpd executable will not
process mp3 files.

Reflect feature dependency in mpd Config.in to make id3tag selection automatic.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2:
 - make this a separate patch 

 package/mpd/Config.in | 4 ++--
 package/mpd/mpd.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 2606008e90..daf1469cae 100644
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
index feab894f0f..1269b90661 100644
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
