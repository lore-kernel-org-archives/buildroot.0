Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C087C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11F64089D;
	Mon,  1 Aug 2022 20:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11F64089D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQWNwbwwTM-K; Mon,  1 Aug 2022 20:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39254086D;
	Mon,  1 Aug 2022 20:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39254086D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8021BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 240A540129
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 240A540129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rITmFFglwuqq for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0013B40117
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0013B40117
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AA33D86C1B; Mon,  1 Aug 2022 20:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:35:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e80c99e1519dafc2cf88ab4672eecda88359ecb1
X-Git-Newrev: 795ef710027b8f2843ef7a8e3556d7c4b20a7b67
X-Patchwork-Hint: ignore
Message-Id: <20220801202217.AA33D86C1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: fix build error with
 c++ disabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=795ef710027b8f2843ef7a8e3556d7c4b20a7b67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The vp8 encoder depends on c++ support since commit
06a1a05b55aa64720d4ede9b07c385cc8f06625d

src/transcoding/codec/codecs/libs/libvpx.c:23:10: fatal error: vpx/vp8cx.h: No such file or directory
   23 | #include <vpx/vp8cx.h>

Fixes:
http://autobuild.buildroot.net/results/152/152dec2f7148a23fa1a434d2c6ad31de6d1b2466/
http://autobuild.buildroot.net/results/009/0090b100eca4f94d2f0081ce0db7ff9b4ae0ca79/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/Config.in    | 3 ++-
 package/tvheadend/tvheadend.mk | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index c033b29819..99a24ec011 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -66,7 +66,8 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	select BR2_PACKAGE_LIBVPX
+	# vp8 encoder needs c++
+	select BR2_PACKAGE_LIBVPX if BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_X264
 	help
 	  Enable transcoding support.
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1d1a714505..8ceb7493c8 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -47,6 +47,12 @@ TVHEADEND_DEPENDENCIES += rpi-userland
 else
 TVHEADEND_CONF_OPTS += --disable-omx
 endif
+ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_INSTALL_LIBSTDCPP),yy)
+TVHEADEND_CONF_OPTS += --enable-libvpx
+TVHEADEND_DEPENDENCIES += libvpx
+else
+TVHEADEND_CONF_OPTS += --disable-libvpx
+endif
 ifeq ($(BR2_PACKAGE_X265),y)
 TVHEADEND_CONF_OPTS += --enable-libx265
 TVHEADEND_DEPENDENCIES += x265
@@ -59,6 +65,7 @@ TVHEADEND_CONF_OPTS += \
 	--disable-libopus \
 	--disable-omx \
 	--disable-vaapi \
+	--disable-libvpx \
 	--disable-libx264 \
 	--disable-libx265
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
