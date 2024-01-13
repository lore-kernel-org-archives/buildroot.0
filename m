Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D29EC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49DFA60E4B;
	Sat, 13 Jan 2024 21:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49DFA60E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05zwEGJJndl8; Sat, 13 Jan 2024 21:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AB960F13;
	Sat, 13 Jan 2024 21:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AB960F13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0B71BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC7560EE4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC7560EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAbuWbMH0JwI for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BCDD60D64
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCDD60D64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C5D86064; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:07:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b6358d4daffd5188b58322598c866ebfadd6304
X-Git-Newrev: 52f8db409fade387f0f90940c0b32acb27317017
X-Patchwork-Hint: ignore
Message-Id: <20240113211502.21C5D86064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix
 webrtc-audio-processing condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=52f8db409fade387f0f90940c0b32acb27317017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The condition checking whether the webrtc-audio-processing package is
enabled, added in commit
3ccd3b4c384e98703841b12f7309362957f8f17d ("package/pipewire: bump to
version 0.3.32") is obviously incorrect, and can never be true.

Fix the condition to use the correct variable instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 628c69ff8a..f0f3cd847c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -225,7 +225,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dcompress-offload=disabled
 endif
 
-ifeq ($(WEBRTC_AUDIO_PROCESSING),y)
+ifeq ($(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),y)
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=enabled
 PIPEWIRE_DEPENDENCIES += webrtc-audio-processing
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
