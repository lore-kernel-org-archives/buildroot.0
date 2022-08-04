Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00AEC25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 22:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49BF041D1C;
	Thu,  4 Aug 2022 22:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49BF041D1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MU21YOKmiE3H; Thu,  4 Aug 2022 22:16:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D8341D0B;
	Thu,  4 Aug 2022 22:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D8341D0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAA01BF302
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D03183295
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D03183295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53JXIjNhgP_2 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 22:16:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F878328E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8F878328E
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 22:16:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id EE8F8240007;
 Thu,  4 Aug 2022 22:16:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 00:15:57 +0200
Message-Id: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659651369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NOsGSyzNRgsTju5M/skMS8sr/tdFAcdlxnxsyccMfX0=;
 b=Z768Gyaxi8yz34bG5qm/Pw6cvRRweLyzQUTySCSN6UcsvaIA+QvKKwGEMS2Qo6inwxLbBm
 s1K6b4jaWXRSXcu/w0xhFyUaSTLKh1NML4gvJcdHdFwVjYVf66ON25I4JHnM5YL9M7ADNW
 uzBvFmOlb7hJhuiXUzzu5kzjTe4tXFpwROY8rq9e53GaQNAZVLozZP7KXidVjsZ7urkDmd
 5cFHxlfRJ7uRq/atgnuQx4ySVDflCwyvh2H37z8kmnRs+YCd2Rh0Wu76O2Dx2nwDcyLKzF
 zLkFk3guWG1EpPenmp1gO5itA55jPTQX/ptBUxkvsVp+3+mIatA8EnxzAmKQFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z768Gyax
Subject: [Buildroot] [PATCH 1/3] package/sdl2: be more explicit in disabling
 optional features
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
Cc: Michael Fischer <mf@go-sys.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add many more explicit --disable-<foo>, as we have for example seen
video-vivante being autodetected when not needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 94533fa9b4..d255112ce9 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -20,7 +20,24 @@ SDL2_CONF_OPTS += \
 	--disable-esd \
 	--disable-dbus \
 	--disable-pulseaudio \
-	--disable-video-wayland
+	--disable-video-vivante \
+	--disable-video-cocoa \
+	--disable-video-metal \
+	--disable-video-wayland \
+	--disable-video-dummy \
+	--disable-video-offscreen \
+	--disable-video-vulkan \
+	--disable-ime \
+	--disable-ibus \
+	--disable-fcitx \
+	--disable-joystick-mfi \
+	--disable-directx \
+	--disable-xinput \
+	--disable-wasapi \
+	--disable-hidapi-joystick \
+	--disable-hidapi-libusb \
+	--disable-joystick-virtual \
+	--disable-render-d3d
 
 # We are using autotools build system for sdl2, so the sdl2-config.cmake
 # include path are not resolved like for sdl2-config script.
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
