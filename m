Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CACC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FCCB40F12;
	Thu,  1 Aug 2024 15:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcprE805mCCu; Thu,  1 Aug 2024 15:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F47440F06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F47440F06;
	Thu,  1 Aug 2024 15:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 986561BF3D9
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 15:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86E5D81FE7
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 15:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNQcDe94awAf for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 15:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ACEA81FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ACEA81FDC
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ACEA81FDC
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 15:08:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C7576C5B5E
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 15:00:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C35E20003;
 Thu,  1 Aug 2024 15:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 16:59:58 +0200
Message-ID: <20240801145958.2561632-1-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722524424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v/QhT5FOui1zCI02JQsKtMZrl1nVoIEXHL9Y4Lx99Eg=;
 b=lAZnSuSCTrjifk6CB75W7K8zUYPFJAyvnKu8kxvY3INPkNut3xSUIK3WPBL0aGzxGH4QZ9
 9ELfdM98MdLgHOaIXCQUX+CX6DjcmM+5dI0A/essg5ln6sn5yPQAjR8pQXTGqiqaL4rFAa
 Gys8Dao1JN60XPkDeIwo5j1mFejXJogjUdNr0hizzq/zs27IM5N17t/osY/ijDMx4wrsKl
 I89gYEKF8bZaM8g205x0eKcBCG4x//fNuIxuZgJhKoUOLDs2jQpaxucHeNXp4wyym9ybvY
 JhIZo/b/hLeJpGut/qVKBzR16Q5XGJWhX7+5RRVyh06Wt6FxRvSfp9/n20H0XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lAZnSuSC
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: enable libjack when selected
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add automatic JACK audio sound server support to ffmpeg if JACK/JACK2 is
selected in Buildroot configuration.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
