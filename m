Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93388C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA4B80C35;
	Thu,  1 Aug 2024 21:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Idck4MQh7ncP; Thu,  1 Aug 2024 21:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD4980CEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD4980CEA;
	Thu,  1 Aug 2024 21:07:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24FF31BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1327F606AE
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnkooynAAPn9 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523B360689
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523B360689
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:07:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C76B838DB; Thu,  1 Aug 2024 21:07:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:06:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99f65ecb6a16e75d92c3f88e4e01959a2948e4d9
X-Git-Newrev: 15e411d800999a70cc04a8d506ead40ea3dba210
X-Patchwork-Hint: ignore
Message-Id: <20240801210722.3C76B838DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add optional dependency on
 jack
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

commit: https://git.buildroot.net/buildroot/commit/?id=15e411d800999a70cc04a8d506ead40ea3dba210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add automatic JACK audio sound server support to ffmpeg if either JACK
or JACK2 are enabled.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 87c482656c..5b2d33883d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -82,6 +82,16 @@ else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
+ifeq ($(BR2_PACKAGE_JACK1),y)
+FFMPEG_CONF_OPTS += --enable-libjack
+FFMPEG_DEPENDENCIES += jack1
+else ifeq ($(BR2_PACKAGE_JACK2),y)
+FFMPEG_CONF_OPTS += --enable-libjack
+FFMPEG_DEPENDENCIES += jack2
+else
+FFMPEG_CONF_OPTS += --disable-libjack
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
