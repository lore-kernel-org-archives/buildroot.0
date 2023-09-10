Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C13C71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3201D40AEE;
	Sun, 10 Sep 2023 21:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3201D40AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4at5-rRUBUEO; Sun, 10 Sep 2023 21:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79C5B40AFF;
	Sun, 10 Sep 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C5B40AFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4FB1BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 653C3812F8
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 653C3812F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv_1Ar_UsPth for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9209E8135B
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9209E8135B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8213886BF9; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:16:35 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7b78ac85b930185157423f668669d3bf7f13de1d
X-Git-Newrev: cfa0d424f99c8ac78e23d8c38bde6dc1fb38e63f
X-Patchwork-Hint: ignore
Message-Id: <20230910214436.8213886BF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/stellarium:
 disable telescopecontrol plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfa0d424f99c8ac78e23d8c38bde6dc1fb38e63f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit c2a450ddd6ab8235009149a9fc14ff77199a9d57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stellarium/stellarium.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index a62488907f..09f1177afd 100644
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
