Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D9CC19F28
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 10:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4C361172;
	Sat, 30 Jul 2022 10:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4C361172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3wu_Gk-myOR; Sat, 30 Jul 2022 10:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6876110E;
	Sat, 30 Jul 2022 10:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D6876110E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD2A51BF37B
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 10:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1C0C8401E
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 10:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C0C8401E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQLeJ1z9072Z for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 10:55:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5605B84012
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5605B84012
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 10:55:45 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout03.t-online.de (Postfix) with SMTP id 745E96328;
 Sat, 30 Jul 2022 12:55:42 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.98]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oHk87-1uZvaT0; Sat, 30 Jul 2022 12:55:35 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55030)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oHk86-0006mQ-23;
 Sat, 30 Jul 2022 12:55:34 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 12:55:34 +0200
Message-Id: <20220730105534.645046-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659178535-0144746C-D71423B7/0/0 CLEAN NORMAL
X-TOI-MSGID: 8310cefb-166c-4bab-a9f9-d9eefc274086
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with c++
 disabled
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The vp8 encoder depends on c++ support since commit
06a1a05b55aa64720d4ede9b07c385cc8f06625d

src/transcoding/codec/codecs/libs/libvpx.c:23:10: fatal error: vpx/vp8cx.h: No such file or directory
   23 | #include <vpx/vp8cx.h>

Fixes:
http://autobuild.buildroot.net/results/152/152dec2f7148a23fa1a434d2c6ad31de6d1b2466/
http://autobuild.buildroot.net/results/009/0090b100eca4f94d2f0081ce0db7ff9b4ae0ca79/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
