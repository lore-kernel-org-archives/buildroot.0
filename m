Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82B9C369A1
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 01:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7A560B6B;
	Sun,  6 Apr 2025 01:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wC560F0gHiJ9; Sun,  6 Apr 2025 01:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42996074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42996074C;
	Sun,  6 Apr 2025 01:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FB7E5E
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69F5E40585
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uidg4hwk3hwd for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 01:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 197864014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197864014E
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 197864014E
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 97E985844AF
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 00:49:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49B79443E3;
 Sun,  6 Apr 2025 00:49:08 +0000 (UTC)
Date: Sun, 06 Apr 2025 02:48:53 +0200
Message-Id: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHXP8WcC/22MQQ6CMBBFr2K6tqYzCDGuvIchBqZTmERb0xKCE
 u5uYUfi8s3892aVOAondT3MKvIoSYLPgMeDor7xHWuxmRUaLA0AaifT4zuJ77QhBktVxQyk8v4
 dOT+31r3O3EsaQvxs6RHW67/KCBq0c9ZcCkRwbXVrQxie4k8UXmt2c9CUe8doKvhM2Fhnm3bn1
 Muy/ACc+E672AAAAA==
X-Change-ID: 20250112-fix_zxing-0ce1dc66ee1c
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehhffhtedvvedtkeejkefgveevleffjeejtefhffdtvdehkeetfefgieekveffteenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejhedphhgvlhhopegludelvddrudeikedruddruddvngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhhuhhnlhgvthhhsehtrhhoohguohhnqdhsohhfthifrghrvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743900548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kUyMX+ntdbssej1dLXDl/teI987TzWeCDQOjC5dbHHI=;
 b=AZy7B5jpc0RV88Wnt19Xm694lwebhoIUNMznIKBQWsg0kCp+ncCmFW2jpiGuGPqtZYc9gH
 bCnKGclnfeWZJgMd0fHWWqWW6e3fVQ8JUfkP2L3FcMV3Uu9QVRGTNHnidpKU4JyVfxEioA
 40KQW+ETsuuomvVzQlfWDWYb+1ecGFU5XQAv+6vmCVJ0wilKCk04rANH/On6SgbNk6G5L7
 e7aDFrgrPeuCh+uwiEEewpi7UYupUbBatsG51teo83ueWCzKwLjLFR4tpVZhVD2pzvFQeK
 951U5BqOaQa3lGgR8RwcTz8QcEHmhFA60bXRz+Lz9hmyqd32l9uWXiW/nmqq5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AZy7B5jp
Subject: [Buildroot] [PATCH v2 00/11] Bump gstreamer version to 1.24.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release note :
    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v2:
- Deactivated new plugins that arent supported in Buildroot yet
- Link to v1: https://lore.kernel.org/r/20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com

---
Thomas Bonnefille (11):
      package/gstreamer1/gstreamer1: bump version to 1.24.11
      package/gstreamer1/gst1-devtools: bump version to 1.24.11
      package/gstreamer1/gst-python: bump version to 1.24.11
      package/gstreamer1/gst1-libav: bump version to 1.24.11
      package/gstreamer1/gst1-rtsp-server: bump version to 1.24.11
      package/gstreamer1/gst1-vaapi: bump version to 1.24.11
      package/gstreamer1/gstreamer1-editing-services: bump version to 1.24.11
      package/gstreamer1/gst1-plugins-base: bump version to 1.24.11
      package/gstreamer1/gst1-plugins-good: bump version to 1.24.11
      package/gstreamer1/gst1-plugins-bad: bump version to 1.24.11
      package/gstreamer1/gst1-plugins-ugly: bump version to 1.24.11

 .../gstreamer1/gst1-devtools/gst1-devtools.hash    |   4 +-
 package/gstreamer1/gst1-devtools/gst1-devtools.mk  |   2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash      |   4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |   2 +-
 ...Update-code-for-webrtc-audio-processing-1.patch | 883 ---------------------
 package/gstreamer1/gst1-plugins-bad/Config.in      |   4 +
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |   4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  19 +-
 .../gst1-plugins-base/gst1-plugins-base.hash       |   4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |   2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash       |   4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |   6 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |   4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |   4 +-
 package/gstreamer1/gst1-python/gst1-python.hash    |   4 +-
 package/gstreamer1/gst1-python/gst1-python.mk      |   2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |   4 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk           |   2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |   4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        |   2 +-
 .../gstreamer1-editing-services.hash               |   4 +-
 .../gstreamer1-editing-services.mk                 |   2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |   4 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |   2 +-
 24 files changed, 56 insertions(+), 920 deletions(-)
---
base-commit: e3f50f6b124f6c44df44b137d72cb4610db08a2a
change-id: 20250112-fix_zxing-0ce1dc66ee1c

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
