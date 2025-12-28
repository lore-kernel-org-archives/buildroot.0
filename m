Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCF2D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D99C600CA;
	Sun, 28 Dec 2025 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KF_cc9JQahPP; Sun, 28 Dec 2025 07:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D4956083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908402;
	bh=aN5kcChWL9ubV/QHUjzV5S8ucQffldcCHix3oLLs5vI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMVRwFVi+M8CFI2ujDjiLGbgacHU7jgFo9aspm4eTk98/y7PIecBu25u6zeaGbXku
	 tW1OAbmTRIoROpGqvHLajiCmMHXCZT+z8taPchCvaXHaohFrMpKAx+RQ0vPy16TwZJ
	 6IDTYaM6JxngAxt/qsPchV7+jxrj6GT8oh6UkIYCyBVpjRh3HppDuIxCJvFA62huSD
	 7WNtmM2NEFop5D4Pzg7NM49R/VojppYdWh+q3bda5ongzRoK5lHuaKaOc+CiiFmOJw
	 UGmriWm/+Ae98eQLOg97OBs/+kxoBOt0vm+gbOsOJ2bNmPju6gnN85RWvcptPpPO1d
	 3JHW6uS9U7YhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4956083E;
	Sun, 28 Dec 2025 07:53:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BA21E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8585400B1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9fUKMBvaGo2 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6D7140087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6D7140087
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6D7140087
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D3F2A4C2329;
 Sun, 28 Dec 2025 08:48:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVr-000000004ex-31Ai;
 Sun, 28 Dec 2025 07:48:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:19 +0100
Message-ID: <20251228074822.3370464-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908119;
 bh=7Czqh+0aeSN7VWra0Q/VR4hKsTUQsy2cbl4XxRrY3Jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AhYygB2XYfprCM7aYZ/aX9gaDp4Fzu7p9vUIry0UdF7QQK3dWg/rfGQCsnGszfMiG
 4Cvo+ueLNLeDIk66DJ1ZURszdT2YjU0dBk1P4AXWXaBPrurqY/VesgKwnSGeRmHFjX
 nNgZjGfW65aIo4ot8/7GyvzoqxrQIWLHV3cqbDuD0pUKZLkn44gTs0q1vuBphnvUfC
 GO33MV2GAdzl6TXfqHt+N90GzbD1IjMBnkEngE+E9x8MgyPG17W/EYqQSUMNEMx7m3
 E9rkP5jqQSX9ySDnSbruGS369Ynrom//f9qUTkCoeqSIr3eD1IwlKAVGvh3ynLB3E4
 DP2OqkAwNzz8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AhYygB2X
Subject: [Buildroot] [PATCH v6 24/26] package/mjpg-streamer: remove optional
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
