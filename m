Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1C7C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68654145B;
	Fri, 17 Jan 2025 10:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkHearA-Ckid; Fri, 17 Jan 2025 10:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E1841A4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E1841A4A;
	Fri, 17 Jan 2025 10:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9D5A94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C478040173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1d3mNVFOXSy for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6972440283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6972440283
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6972440283
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:32 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-540254357c8so1968954e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111270; x=1737716070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3IJ6r1BsVder2RFxSdvWUtj+jgybTFozFFa6OYDoiw=;
 b=IZS6wlVD8ecLNAGeWilQZBk9Y9tWLikESa0CYN8R6OnncSUcyCbT+9k8Q4ygifiLjW
 jibb4z0Fp7fdMXyjSYO6IxDtyf0pYeCP+N7JE0FAHujnRpZadmBJYnngCjIlS9HeB9WU
 2t1Bflc3Wc7HDM74cAzpcRoqzcnCpM8BmcXYNT1QdLkQMCJsnOtAzexYPXRHvmoqPhdR
 OOn59msQtPgbEn+VoHxNhP3ZpFkwebHjHsnF3pbmN4KX8oh28wBiueF8hggxW/6gdZSj
 GNayCXYqdbq0qIaNOtOIAKYW96LwRBcRV0FF3H0HkaJsQ5Ndd84mSwY+6JGQnQL8TuSf
 wEuw==
X-Gm-Message-State: AOJu0YxwWC5F5hZvxjfO7YS3NUvBm9SUGuxUOWBiEDgiD9aSV+GKRPZo
 pwIvd7SbYsrXho/yRqU8Tjj0YycYO0uVUubA2GexhbQj8BtNpS2CALb3ew==
X-Gm-Gg: ASbGncv/02SEHTPJasI8fS8BuzhO3MIhoFf2O3yGpJsuaXOCLWuc+GO9yQ4DQXLCUC7
 Y7PDbTon6MBvXtO/kkL0i9CVNn5GqiY80S6a8TUMtmIvcJFzGOFGbATqc7dk19ZaSOqukCITUop
 v7aDk1SgxaV+I4/h0WEtafwONDLxG5GL6xwgOV/Jv+8tV+chPhb9k+i+T0txqSYkO+rcWWnSXWn
 +WdN6gOqkVZS9ylRD5HGhGhpRi64jAMLMbn7Jwa+IyUWOMBKfSgWi8cMQitOfseLTmw89zoJGdk
 x2zVjACACdE=
X-Google-Smtp-Source: AGHT+IHBvCNR3JdOPmMcUHgjG8MyLRoIG+tXDj51PFE5Kcp49lrYmBGoN1pIvOUM1omrB52xO7iBgA==
X-Received: by 2002:a05:6512:2346:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-5439c2805f9mr732496e87.34.1737111270081; 
 Fri, 17 Jan 2025 02:54:30 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:28 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:34 +0100
Message-ID: <20250117105354.618220-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111270; x=1737716070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3IJ6r1BsVder2RFxSdvWUtj+jgybTFozFFa6OYDoiw=;
 b=Iw6+R5ae1NHA8D7SCm2Ta81atGEt7SEjeNaKd7PLgX8dY6APDkGGIJoqtliGtIYfGe
 1sCw/GuoxLVMUFeotHo3TNm/ZzJ/tWhcr2WimqnsZU7/lHuHpOnbzc1Wsjckp1iRrmJ5
 oEAsRtx4IwFi/UaiGjsMkCpc76WDzNEXvdejHYq5XvcPhP84wWwevyrSyIjHNEP6mfGt
 K/hNMVqwLFxYvi/8oU/RAkJFfWpOh3GVUyz71ET/ZUcApTa1lQAcUrm3w2GueitGmv82
 HLo4I/zG+Qe2uffRnbZuV952VjOYA5mw395RdKHj9vPtLTWeVqoRXLgrjHNthF7VHJ67
 AV5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iw6+R5ae
Subject: [Buildroot] [PATCH 11/19] package/qt6/qt6multimedia: simplify help
 text
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index d2d4a73232..b3b3c80231 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -3,16 +3,11 @@ config BR2_PACKAGE_QT6MULTIMEDIA
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_NETWORK
 	select BR2_PACKAGE_QT6SHADERTOOLS
-
 	help
-	  Qt Multimedia is an add-on module that provides  a rich set
-	  of QML types and C++ classes to handle multimedia content. It
-	  contains an easy to use API for playing back audio and video
-	  files and rendering those on screen, as well as a
-	  comprehensive API for recording audio and video from the
-	  system's cameras and microphones.
+	  This package provides Qt6 Multimedia:
 
 	  https://doc.qt.io/qt-6/qtmultimedia-index.html
+	  https://code.qt.io/cgit/qt/qtmultimedia.git
 
 if BR2_PACKAGE_QT6MULTIMEDIA
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
