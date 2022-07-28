Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A4C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 917C4402F2;
	Thu, 28 Jul 2022 21:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 917C4402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqs-G6ur51GQ; Thu, 28 Jul 2022 21:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B7F40354;
	Thu, 28 Jul 2022 21:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B7F40354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 340781BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F2160A73
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F2160A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLly_K6graG6 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49F3460ACD
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F3460ACD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 26E27867FA; Thu, 28 Jul 2022 20:45:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:57:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc08b57079eaf1494ab4f2d1f79ccecc63a8d767
X-Git-Newrev: 2ba6015eb1aaa2f0b4663bfdce31f4fb9db3f3be
X-Patchwork-Hint: ignore
Message-Id: <20220728204520.26E27867FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: simplify alsa-lib feature
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ba6015eb1aaa2f0b4663bfdce31f4fb9db3f3be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having the user need to figure out that 2 alsa-lib features
are needed for mpv ALSA support, have the top-level mpv option select
the relevant alsa-lib features, when alsa-lib is enabled as already done
for pulseaudio in commit 97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/Config.in | 2 ++
 package/mpv/mpv.mk    | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 81b1e24b5f..6811497d73 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_MPV
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index ff77f248e5..f9250070d1 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -39,8 +39,7 @@ else
 MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
 endif
 
-# ALSA support requires pcm+mixer
-ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MPV_CONF_OPTS += --enable-alsa
 MPV_DEPENDENCIES += alsa-lib
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
