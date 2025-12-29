Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C603E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F210C60B21;
	Mon, 29 Dec 2025 17:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JbbFsZCIOBF; Mon, 29 Dec 2025 17:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B02560B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031055;
	bh=aN5kcChWL9ubV/QHUjzV5S8ucQffldcCHix3oLLs5vI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJ8gPR2zhIzou1pHsrWc+MZr122TjWZ6M797Wr5GKv9YkGyJOaaKkz+kCqRYPwWXz
	 3vpuCGNXArdQpCjLkqdByqGVYGjJ1Jr+nNrcmiU+bFR06etLc1g2zQtED8Apqp1MDY
	 ls9BvxFlwgf5e2VmEFKxDpwrGDsTp47ts13ZOt1cCqy1aQ8K0yQYfLlqtZ6DPVhPNW
	 1AFEVfnXAMW33s5/DHKawxp31aER2EgaMohSqIGa25ddHNfkDNH+Xl2/ZZ3VRW5oqb
	 de3iwLjcPQFPPd4JK5d6JTXjPCzn27KbkqfesbakETDJkYwrXwWjpJ4NOvj/MRbMbE
	 jFZDDBGh2DmiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B02560B44;
	Mon, 29 Dec 2025 17:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ABE7D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 617654055D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1U8b5D5WZCCe for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58A8A400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A8A400BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58A8A400BA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA27BA4C268E;
 Mon, 29 Dec 2025 18:52:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPY-0000000012P-2XEa;
 Mon, 29 Dec 2025 17:52:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:51:52 +0100
Message-ID: <20251229175158.3548903-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030732;
 bh=7Czqh+0aeSN7VWra0Q/VR4hKsTUQsy2cbl4XxRrY3Jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iaYkh+WcndBtqdAVy0eHosT0u4rhDzoe14oE0xmFyX2Yy3/8YPC9PytvQuZ9fnOrm
 k3TIBpwWpv7GN4BZBMyGEKjE7ex3ZhJzcP+fNPlQJwTS1fjcdj3Tna4rp3c3gvYjq5
 UNtnLlSwJfwbifSoIS54uKfejt4tJdFGwzi0OCytw5XcpfrxJFzUn1NyC8zZll0pCa
 Bf3w2QeScna6EaOEqB5yf+ZxouswOafizui89KfWmrMMBMK40IPQDNp6TojY6gFoA9
 sQpBriSMt56xhYpaWESRNeS0j1cDPJFDXEOaqs9g2TKPeWKZh4KRlKqUDz6IJna25X
 wqT07HKxgdiVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iaYkh+Wc
Subject: [Buildroot] [PATCH v7 24/29] package/mjpg-streamer: remove optional
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

The package does not support OpenCV4:
https://github.com/jacksonliam/mjpg-streamer/commit/216c090707ffd71fdf86b0c5b182954846e01bd4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mjpg-streamer/mjpg-streamer.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 5e52b45b01..e5f12d9d88 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -10,6 +10,7 @@ MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
 MJPG_STREAMER_LICENSE_FILES = $(MJPG_STREAMER_SUBDIR)/LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
+MJPG_STREAMER_CONF_OPTS = -DPLUGIN_INPUT_OPENCV=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGPHOTO2),y)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_PTP2=ON
@@ -22,16 +23,6 @@ ifeq ($(BR2_PACKAGE_LIBV4L),y)
 MJPG_STREAMER_DEPENDENCIES += libv4l
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_VIDEOIO),yyy)
-MJPG_STREAMER_CONF_OPTS += \
-	-DPLUGIN_INPUT_OPENCV=ON \
-	-DPLUGIN_CVFILTER_CPP=OFF \
-	-DPLUGIN_CVFILTER_PY=OFF
-MJPG_STREAMER_DEPENDENCIES += host-pkgconf opencv3
-else
-MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_PROTOBUF_C)$(BR2_PACKAGE_ZEROMQ),yy)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=ON
 MJPG_STREAMER_DEPENDENCIES += host-pkgconf protobuf-c zeromq
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
