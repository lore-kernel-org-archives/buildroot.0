Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307D8C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3E12607A8;
	Tue, 26 Jul 2022 21:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E12607A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RG6HnIJ56mZb; Tue, 26 Jul 2022 21:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3699607B5;
	Tue, 26 Jul 2022 21:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3699607B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 516C41BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CECB81462
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CECB81462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abgLO7VrGEPY for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:46:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F21B81461
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F21B81461
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AE0B88633D; Tue, 26 Jul 2022 21:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:45:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b296904ee764ef2f5dbb620f6bf487fe540580b
X-Git-Newrev: 97cd3680a4cc4bc0c71bccccb1459eda4b880159
X-Patchwork-Hint: ignore
Message-Id: <20220726213259.AE0B88633D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: simplify alsa-lib
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

commit: https://git.buildroot.net/buildroot/commit/?id=97cd3680a4cc4bc0c71bccccb1459eda4b880159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having the user need to figure out that 3 alsa-lib features
are needed for pulseaudio ALSA support, have the top-level pulseaudio
option select the relevant alsa-lib features, when alsa-lib is
enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/Config.in     | 3 +++
 package/pulseaudio/pulseaudio.mk | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 78b7da906e..0fcd7b16eb 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -14,6 +14,9 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_UCM if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBTOOL
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 567540c225..0958107f8c 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -105,8 +105,9 @@ else
 PULSEAUDIO_CONF_OPTS += -Dwebrtc-aec=disabled
 endif
 
-# pulseaudio alsa backend needs pcm/mixer/ucm apis
-ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_UCM),yyy)
+# our Config.in makes sure that all needed alsa-lib features are
+# enabled
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 PULSEAUDIO_DEPENDENCIES += alsa-lib
 PULSEAUDIO_CONF_OPTS += -Dalsa=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
