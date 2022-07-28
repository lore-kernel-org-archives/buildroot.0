Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 711254050C;
	Thu, 28 Jul 2022 21:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 711254050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ro3lwd1PTPyZ; Thu, 28 Jul 2022 21:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8969140327;
	Thu, 28 Jul 2022 21:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8969140327
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3147D1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A9FB60AF0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9FB60AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uw2aOTvUbvxS for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C68460AE0
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C68460AE0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3B825867FD; Thu, 28 Jul 2022 20:45:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:57:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a223802adb2c6d0aca45de78ce246421a270044e
X-Git-Newrev: ba27d5a63bca33bbb17e7f3d379f9fabef50d635
X-Patchwork-Hint: ignore
Message-Id: <20220728204520.3B825867FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: needs alsa-lib mixer
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba27d5a63bca33bbb17e7f3d379f9fabef50d635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aplay needs alsa-lib mixer since bump to version 4.0.0 in commit
e843433e186c6802ae0c31cb501b2212972ed725 and
https://github.com/Arkq/bluez-alsa/commit/7050c9a81895500fe2d59ec6e4859633d4353e36:

In file included from alsa-mixer.c:11:
alsa-mixer.h:16:21: error: unknown type name 'snd_mixer_t'; did you mean
'snd_timer_t'?
   16 | int alsa_mixer_open(snd_mixer_t **mixer, snd_mixer_elem_t
      **elem,
      |                     ^~~~~~~~~~~
      |                     snd_timer_t

So select BR2_PACKAGE_ALSA_LIB_MIXER instead of building aplay
conditionally to keep backward compatibility

Fixes:
 - http://autobuild.buildroot.org/results/d3faac6e49fe9cc21091a5dfa44780b8c63189be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 42bb9133bf..73ae3d5333 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_BLUEZ_ALSA
 	depends on BR2_USE_MMU # bluez5 -> dbus
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	select BR2_PACKAGE_LIBGLIB2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
