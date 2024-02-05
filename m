Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F0CC48298
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A7040160;
	Mon,  5 Feb 2024 21:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A7040160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prhV6a45bZUv; Mon,  5 Feb 2024 21:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22EF740A8A;
	Mon,  5 Feb 2024 21:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EF740A8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B39411BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D88C418B9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D88C418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGosk2t47ALR for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D230841898
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D230841898
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE6C286DF8; Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:25:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 282b951ed3315c6e2a37725f0bc033bfab4c72cb
X-Git-Newrev: a627753d35d2ba97d5bddfc2491ca8b5577eba49
X-Patchwork-Hint: ignore
Message-Id: <20240205212811.BE6C286DF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: enable vulkan if
 possible
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

commit: https://git.buildroot.net/buildroot/commit/?id=a627753d35d2ba97d5bddfc2491ca8b5577eba49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the flutter-pi vulkan option if a suitable driver is enabled.
Currently, only Mesa provides Vulkan drivers. As such, gating the
feature behind the BR2_PACKAGE_MESA3D_VULKAN_DRIVER option is
reasonable at the moment and is done by three other packages already:
flutter-engine, ivi-home screen, and wlroots.

Furthermore, a dependency on BR2_PACKAGE_VULKAN_LOADER is needed as the
vulkan-loader package provides the vulkan.pc file, which the configure step
relies upon.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-pi/flutter-pi.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index f1812b154e..9edc62e7ac 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -24,7 +24,6 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_TSAN=OFF \
 	-DENABLE_UBSAN=OFF \
-	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
@@ -75,6 +74,13 @@ else
 FLUTTER_PI_CONF_OPTS += -DBUILD_TEXT_INPUT_PLUGIN=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER)$(BR2_PACKAGE_VULKAN_LOADER),yy)
+FLUTTER_PI_DEPENDENCIES += mesa3d vulkan-loader
+FLUTTER_PI_CONF_OPTS += -DENABLE_VULKAN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DENABLE_VULKAN=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_PI_CONF_OPTS += -DENABLE_OPENGL=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
