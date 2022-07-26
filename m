Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DC5C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9560B402F9;
	Tue, 26 Jul 2022 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9560B402F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bgs4glMPlW60; Tue, 26 Jul 2022 21:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596B1402E5;
	Tue, 26 Jul 2022 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596B1402E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34EEE1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 196E160671
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 196E160671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYa_UpW5Ac_T for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:46:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 498E1605A6
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 498E1605A6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A5AC386380; Tue, 26 Jul 2022 21:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa61d29b84be8e32022a68c3c4055300a97d581b
X-Git-Newrev: 9b296904ee764ef2f5dbb620f6bf487fe540580b
X-Patchwork-Hint: ignore
Message-Id: <20220726213259.A5AC386380@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: alsa needs UCM
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b296904ee764ef2f5dbb620f6bf487fe540580b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa needs UCM since bump to version 16.1 in commit
6f3131296484767f037d3535ab69f328e94351db to avoid the following build
failure:

In file included from ../src/modules/alsa/alsa-mixer.h:51,
                 from ../src/modules/alsa/alsa-ucm.c:51:
../src/modules/alsa/alsa-ucm.h:26:10: fatal error: alsa/use-case.h: No such file or directory
   26 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c651c03bc493ac721ad6517ace550237488ef8a8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index b423057ab6..567540c225 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -105,8 +105,8 @@ else
 PULSEAUDIO_CONF_OPTS += -Dwebrtc-aec=disabled
 endif
 
-# pulseaudio alsa backend needs pcm/mixer apis
-ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+# pulseaudio alsa backend needs pcm/mixer/ucm apis
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_UCM),yyy)
 PULSEAUDIO_DEPENDENCIES += alsa-lib
 PULSEAUDIO_CONF_OPTS += -Dalsa=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
