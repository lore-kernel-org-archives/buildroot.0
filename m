Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC5E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE86F81CEF;
	Mon, 29 Dec 2025 18:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvlZzKx0UqyM; Mon, 29 Dec 2025 18:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D68F80B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031473;
	bh=aN5kcChWL9ubV/QHUjzV5S8ucQffldcCHix3oLLs5vI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hc7TBwiCno+OTIsc2scQQPWBGnureWXtGK70bJ0B7Evq3kBtKkLHvoH45QsG8EeTC
	 MGi3HgB4qOF2C/OpPtfbkVuQT6hnBuC6/J8+1K1z0ni1mKnEzZzYO7XinsJi8+Cole
	 BfgcU3qd04MTwNr9JTeo6zFuWWlxzucqHsY1f//BQjDLAhPsgm6jZb7QGjNtm9K5SO
	 dphI3Jfqg6sl3U9Wqzp0FWCih+0c+GAIJF4NCwiJg806i5c9j11bXiARLPiroAEqL1
	 nXE1NXosPfAjBGndGjPO/+Ba1sfD03g+/oBNfb7u6Sx7jjc0/WFRsymcY+lnNRp6TO
	 CP4MePfnQoirQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D68F80B5A;
	Mon, 29 Dec 2025 18:04:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A5CE177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C67780B5A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGIgGOb5bz3R for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:04:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6700F80B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6700F80B29
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6700F80B29
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:04:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51A89A4C268E;
 Mon, 29 Dec 2025 18:59:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWw-000000002P5-2XCK;
 Mon, 29 Dec 2025 17:59:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:32 +0100
Message-ID: <20251229175938.3549882-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031190;
 bh=7Czqh+0aeSN7VWra0Q/VR4hKsTUQsy2cbl4XxRrY3Jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MZs7KIGJNfG54odKdKAcQNInlWiWBk/b1nTdicuKYg/8F8LD1cTH3wgAL1tI+D77r
 s0rXIBTA+Uo+VLxhFJWDm1Lf26DfJyEJhCBrCYII+CxIAkEk8LNi0leK5M+9Igz7KE
 wiuqldE5iMq+idIIrndat94smYSwGpeEPaZ5oWd+NK4cBv5z8S+5fyxKuM3TcPy4AC
 fvsmJnq5gd+Tw9iuWH04rxkyq7rF4dod2lw+LsnuXC8W51Xt9TfI+Jmb30PGulF7f3
 yFDpnjBNWowZhnaII9bfC+ZXPj6fvOe3KT6rLCAbTwrnOlDO1ygvWUe9671gmMsjvW
 navqNSCFFmkxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MZs7KIGJ
Subject: [Buildroot] [PATCH v8 24/29] package/mjpg-streamer: remove optional
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
