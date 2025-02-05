Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC9EC02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC7060AAF;
	Wed,  5 Feb 2025 09:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHVLU7mTHjq2; Wed,  5 Feb 2025 09:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F291D60DA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F291D60DA5;
	Wed,  5 Feb 2025 09:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23573CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FE340B39
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38Ocl_IabbLx for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B35440254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B35440254
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B35440254
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E03A43219;
 Wed,  5 Feb 2025 09:47:41 +0000 (UTC)
Date: Wed, 05 Feb 2025 10:47:38 +0100
Message-Id: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALozo2cC/22MQQrCMBBFr1JmbSQTMYgr7yFFbDJpBzSRpIRqy
 d0du3b5/n+8FQplpgLnboVMlQunKIC7Dtx0jyMp9sJgtDlqRKMCL7fPwnFU2hF6Zy0ROhD/lUn
 OrXXthScuc8rvLV3xt/6rVFSoQvD6dDAGw2AvQ0rzg+PepSf0rbUvyGogXqQAAAA=
X-Change-ID: 20250112-fix_zxing-0ce1dc66ee1c
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfffkeeufedvjeegvefgvedtteffjeevvedtffevfffgkeffkedvvdfftdeljefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopegludejvddrudeirddvrddutdelngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehfhhhunhhlvghthhesthhrohhoughonhdqshhofhhtfigrrhgvrdgtohhmpdhrt
 ghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738748861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+oxLcrV/uTC2XzEAuNMHN86ZWaUKmppghJ4dlRLnwJM=;
 b=lWYaWlBZ66RH5atmxhZvXb6gD/iybGFeqgEycmBE1jrlYuXULmXstdcd6y5q9IP7lebYOY
 orGA63sWbZCg3Y25BocaYWDok90vshH/jMNYuJPG/tam9D/EeN48H/fy8EO4UnQJktDPOP
 9kDEPcPH9An52bauN1f61B0wGbDXwKwFjZ01z+1zebW43SXAmrXt4dpvTAaY6J7RYyimUo
 rn+PN4ISsedT4UvBYaBy7JKi7deU2yDtG9pt6t+NPHQNU1bADaMg0N5rX/AAU4V0kdxkPt
 XuJRypYjE+BTSeoIHX3ezq6Qm9CEfFNEvqycEdD5BEnaQohSbgJgpiHbm3gaAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lWYaWlBZ
Subject: [Buildroot] [PATCH 00/12] Bump gstreamer version to 1.24.11
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
Thomas Bonnefille (12):
      package/gstreamer1/gst-omx: remove gst-omx
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

 Config.in.legacy                                   |   7 +
 package/gstreamer1/Config.in                       |   1 -
 package/gstreamer1/gst-omx/Config.in               |  11 -
 package/gstreamer1/gst-omx/gst-omx.hash            |   3 -
 package/gstreamer1/gst-omx/gst-omx.mk              |  39 -
 .../gstreamer1/gst1-devtools/gst1-devtools.hash    |   4 +-
 package/gstreamer1/gst1-devtools/gst1-devtools.mk  |   2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash      |   4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |   2 +-
 ...Update-code-for-webrtc-audio-processing-1.patch | 883 ---------------------
 package/gstreamer1/gst1-plugins-bad/Config.in      |   4 +
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |   4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |   3 +-
 .../gst1-plugins-base/gst1-plugins-base.hash       |   4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |   2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash       |   4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |   4 +-
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
 29 files changed, 46 insertions(+), 973 deletions(-)
---
base-commit: d59575bc47fe2dbd74a43360bcc49983af162563
change-id: 20250112-fix_zxing-0ce1dc66ee1c

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
