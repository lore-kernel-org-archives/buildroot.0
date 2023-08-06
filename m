Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62CAC04A6A
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B78280B32;
	Sun,  6 Aug 2023 11:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B78280B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbXPzYfktFIv; Sun,  6 Aug 2023 11:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A329A81E8F;
	Sun,  6 Aug 2023 11:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A329A81E8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0582B1BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37838605A5
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37838605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqZI1jR1Im2u for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79D23600B6
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79D23600B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65388842D8; Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:46:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f788a8f527c038112671ff6fdc968823a54cf3aa
X-Git-Newrev: c2a450ddd6ab8235009149a9fc14ff77199a9d57
X-Patchwork-Hint: ignore
Message-Id: <20230806114715.65388842D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: disable
 telescopecontrol plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2a450ddd6ab8235009149a9fc14ff77199a9d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
stellarium which included this commit
https://github.com/Stellarium/stellarium/commit/186b06fa215bd28ea03cc291dc861b552af8d99a

It removed the previously bundled libindi source and lets stellarium
download the sourcecode of the indiclient package (not present in
buildroot) during the build:

$ find output/build/stellarium-23.2/ -iname *.zip
output/build/stellarium-23.2/_deps/indiclient-subbuild/indiclient-populate-prefix/src/v1.8.5.zip

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 4dc5692d79..cc25f91063 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -20,6 +20,7 @@ STELLARIUM_CONF_OPTS = \
 	-DENABLE_NLS=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
+	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
@@ -34,13 +35,9 @@ STELLARIUM_DEPENDENCIES += qt5serialport
 ifeq ($(BR2_PACKAGE_GPSD),y)
 STELLARIUM_DEPENDENCIES += gpsd
 endif
-STELLARIUM_CONF_OPTS += \
-	-DENABLE_GPS=ON \
-	-DUSE_PLUGIN_TELESCOPECONTROL=ON
+STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
-STELLARIUM_CONF_OPTS += \
-	-DENABLE_GPS=OFF \
-	-DUSE_PLUGIN_TELESCOPECONTROL=OFF
+STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
