Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41791C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A02410A4;
	Thu, 28 Jul 2022 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3A02410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ro7TPwz5Lmf; Thu, 28 Jul 2022 20:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28E540611;
	Thu, 28 Jul 2022 20:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28E540611
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4A261BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0CCA402F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0CCA402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXx-qeA_Fgke for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:55:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC771401AF
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC771401AF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A8C35866F7; Thu, 28 Jul 2022 20:41:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:55:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 543333ecae495b25ed702043c1f6358c8ed9eb6f
X-Git-Newrev: 5b4350b6b9a23687016bbdf99c32caa90118a9c7
X-Patchwork-Hint: ignore
Message-Id: <20220728204133.A8C35866F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: fix speex dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b4350b6b9a23687016bbdf99c32caa90118a9c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pulseaudio needs speexdsp, not speex resulting in the following build
failure since commit 7752afbe4bb9fa1def5ba89daf21564ea58af79a which
explicitly enable or disable speex:

../output-1/build/pulseaudio-16.1/meson.build:713:2: ERROR: Dependency "speexdsp" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/8d4c5d5bfd65744753ca75180dd45a01c90f0b91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 7b2d362316..8c4b99b6ff 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -162,9 +162,11 @@ else
 PULSEAUDIO_CONF_OPTS += -Dx11=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX),y)
+# This is not a mistake: the option is called speex, but what it
+# really needs is speexdsp
+ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
 PULSEAUDIO_CONF_OPTS += -Dspeex=enabled
-PULSEAUDIO_DEPENDENCIES += speex
+PULSEAUDIO_DEPENDENCIES += speexdsp
 else
 PULSEAUDIO_CONF_OPTS += -Dspeex=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
