Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63436E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DBFF40866;
	Tue, 30 Dec 2025 11:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMIujzX9qyxP; Tue, 30 Dec 2025 11:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71D0D40861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095345;
	bh=tzWxfDSvWDU9tuwKtUaoMQQVKnBx8XNmyiFJPjJdo3k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeICK7uPsfk/kukhZAOZz0Dt3Wfj70eA2Q71sA1Aw8yJIQpCjv17zBFM7vjITxZA5
	 PNNYxcBShTvfGzuA/CJoUkdx5TZmDntFJhGtDKwlYVDuzcVYlKeB93cDJEixlp6amP
	 NbU+MeP/2011drx5sZJx+ch59ecTZY8iMnhybkxClCNmu7fGhTLDfSWjbNx/rHYG2K
	 4iZBROjNmYQ6DGNmgSCWx9YLwioxQ8b/zf8+iM3WMAZElzS5/A7uFUD4MufngUiA4p
	 nA8MsjgA/9ovkqoXoDDv43RV8Z0bfr5vM88vJnGJJOkdervG2mUGi37A1M6VoJclUM
	 k4sDRy5MGaSmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D0D40861;
	Tue, 30 Dec 2025 11:49:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A748235B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 995F760AA4
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Klqss8phIgEn for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85908608BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85908608BB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85908608BB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:49:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A795A4C2AB7;
 Tue, 30 Dec 2025 12:46:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBL-000000003Vt-44Tf;
 Tue, 30 Dec 2025 11:46:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:32 +0100
Message-ID: <20251230114545.2236640-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095199;
 bh=50XQJoP89Plvw4VfZOkBuidMAl+MWq8e3RC8//UWV1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HvqDXDH05h4CXRm+eFuAYKHWE4+/moeecdh3zuxp0ZQEEyMImVNGL9Y+xqBiA2iRu
 LFBYaz6sQWeIw70+CfFMUbU7Gagg7MbtJOPoZ7nlpuC8DKfnz8kTmDlBZwdR5hRSQ1
 pIs9WpxXRYNvSYs896MVUu5fk1W92XzL8yaK6p1k1evzb6+xtjEfiTQGpQmGH3fzcE
 JXPb4oCjAL3ZlZaH6wdTEBZhcBZ6Rxlhl/cdqCVI/wvCle4xuL4jPvScPr1vxoB08g
 XOhSsSGiKQs0mqz4q0jb8Pr3bNjSFMH/KFlbTADKAM2m3Yuj5h/FxKacrkpQ4J4lC5
 qnrJxUUsAVO2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HvqDXDH0
Subject: [Buildroot] [PATCH v9 11/19] package/ffmpeg: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 983a87eb2e..6e4ccd5b8b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -297,12 +297,9 @@ else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),y)
-FFMPEG_CONF_OPTS += --enable-libopencv
-FFMPEG_DEPENDENCIES += opencv3
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
-else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
 FFMPEG_DEPENDENCIES += opencv4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
