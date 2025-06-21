Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95392C71157
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 19:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 514F1606BA;
	Sat, 21 Jun 2025 19:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3LMR4LwCdWV; Sat, 21 Jun 2025 19:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F06960710
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F06960710;
	Sat, 21 Jun 2025 19:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 996AFE2
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8038181374
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4ryl2UZcJLN for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 19:08:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1DA8813B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DA8813B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1DA8813B0
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:08:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FF2AA4C2545;
 Sat, 21 Jun 2025 21:08:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38436)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uT3Zd-000000007xx-0sYb;
 Sat, 21 Jun 2025 19:08:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 21 Jun 2025 21:08:20 +0200
Message-Id: <20250621190820.516046-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250621190820.516046-1-bernd@kuhls.net>
References: <20250621190820.516046-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750532901;
 bh=5yo18NHM4HEYBlfdqWDr81VjrWiGUcE3EuSEn8awHUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eozsnt+PTnuu3TZoX8pGTDqJY6w+47QG9H2n2cT3sc+B5VY8oj6oJ+/m86JRy5qrz
 VueOmpS0Bn9/ny/1vXQPcFoRjRrHBLLTa7d0s30Ua5vonpEB9ZOs2JUGG5+rTeRtff
 hkr7RqCInpIZ3fVarpNc2AmsB5eYbOtqf+0HTHYTv6HPXwU4vrz65REBnQWjvSK43N
 KR0NTyUdGdLx1brDvPjOfwR0hSLi96HoZ68Oee54zJo8GZWYul08hzgHgwpbfRq9Ts
 6cp7JJ/tD6d/qc6DoJPJUn3luDlcduMBZEB8y7gS996zBiaEVUA6Z1YF2XfquvslqM
 QZAVpwR0/P8vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=eozsnt+P
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: add optional support for
 OpenCV4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 79820d0077..c98817d09d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -294,6 +294,10 @@ endif
 ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv3
+else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
+FFMPEG_CONF_OPTS += --enable-libopencv \
+	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
+FFMPEG_DEPENDENCIES += opencv4
 else
 FFMPEG_CONF_OPTS += --disable-libopencv
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
