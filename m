Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE33C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDF560AE0;
	Thu, 28 Jul 2022 20:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDF560AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehJvoe486eLi; Thu, 28 Jul 2022 20:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A5D360A73;
	Thu, 28 Jul 2022 20:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A5D360A73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0783F1BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E21812F7
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E21812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rl9lYx68pIJG for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C3D8130C
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34C3D8130C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1130E867FD; Thu, 28 Jul 2022 20:45:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:56:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5e1cec70087df0964200beb81d9269bf2813f6d
X-Git-Newrev: fd4783258b187b06ce9da6baaa4b1b9197c3f184
X-Patchwork-Hint: ignore
Message-Id: <20220728204520.1130E867FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mediastreamer: simplify alsa-lib
 feature selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd4783258b187b06ce9da6baaa4b1b9197c3f184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having the user need to figure out that 2 alsa-lib features
are needed for mediastreamer ALSA support, have the top-level pulseaudio
option select the relevant alsa-lib features, when alsa-lib is enabled
as already done for pulseaudio in commit
97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mediastreamer/Config.in        | 2 ++
 package/mediastreamer/mediastreamer.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 471d8ad91a..e776b60df3 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_MEDIASTREAMER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_ORTP
 	help
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 5d66a09880..febbb7b343 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -22,7 +22,7 @@ MEDIASTREAMER_CONF_OPTS = \
 	-DENABLE_UNIT_TESTS=OFF \
 	-DENABLE_ZRTP=OFF
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MEDIASTREAMER_CONF_OPTS += \
 	-DENABLE_ALSA=ON \
 	-DENABLE_SOUND=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
