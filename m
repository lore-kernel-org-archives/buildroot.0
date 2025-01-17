Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE19C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553036FB81;
	Fri, 17 Jan 2025 10:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OSFE2mFmi34; Fri, 17 Jan 2025 10:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 155106FB76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 155106FB76;
	Fri, 17 Jan 2025 10:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44265B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F4F9403D7
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcRZaE1c0hXf for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 098544013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 098544013C
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 098544013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2267089e87.3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111003; x=1737715803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3IJ6r1BsVder2RFxSdvWUtj+jgybTFozFFa6OYDoiw=;
 b=fMHMly6j4695jwhGiEJ/Ki7BSE1lt0/tOg1RKOLyTsALcmSTF+HqOZQ1YPyOw/0Ysj
 HpUgKpKnpO/tWV6I1MGwRyerKr4yhdbJ+kDlC0rDt08rDvnFlZSMq9S7QRxlNYcPQpjh
 mv/am9WKfYYJdCRVDRM46ftA6htkQyYIPkN9ui7X9PI8pr5LHZoi5Y9gV/Lhrn33e9mL
 Un4IMNXoeoovQ6J15mv5qwyPAxMNndnX/kXPgZt5WSSziF3GdSQhSg4EIUCgAvKd0ttm
 wqrizviuOK+hGAr993LBH1veVVR0yXzoetkfUJQGVI5ZXe5DdkURPhBfMeAk/rjJsEqM
 3doQ==
X-Gm-Message-State: AOJu0YyIbv5HioVapxxguWpTPNkXuVYsvO8DT80oCLOhIDaLIRHsm9LL
 IbBSvw3YlYrEjpkEmatXU4Pi63RqUaKEb33U6KnMbr2NuBy4R3QGUGtW+Q==
X-Gm-Gg: ASbGncvzEHaWg/RzgfhUHGPs+g9g1vCaibZ9zcwizKKs0+gHiXBuJYA0gp4nH0Pri+G
 VsjNQVtNkzL63rHRtxwxDmOdbw+14BRLOpk7ZwZdjA4NZHbykBKjQMK1tK+TPlK/cKIfAXvktTS
 HUtW3S4XctK/JWFCP4DJclDhexb7BW097C8wEps5SAETcsBGxk6zXB7k3j+3m7+dDQrGOd6o6N7
 5MeoaG7D5gmAfgtU2lY62xT6Zti7+qG6B3Hfqf5rz3HzWrMo04YZDsFkggObNU8BuJxtjN2zW4V
 OMXwLDiVo8U=
X-Google-Smtp-Source: AGHT+IHtRCdFVu9B8f9iLtSV6T0gJEJ2tfnP0jDgVndcJQvVzY8UILUxLeqmClCz0K4ogkK8MiA2Nw==
X-Received: by 2002:a19:7005:0:b0:542:2990:6e99 with SMTP id
 2adb3069b0e04-5439c22a8a4mr506505e87.2.1737111002496; 
 Fri, 17 Jan 2025 02:50:02 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:01 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:51 +0100
Message-ID: <20250117104911.613221-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111003; x=1737715803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3IJ6r1BsVder2RFxSdvWUtj+jgybTFozFFa6OYDoiw=;
 b=E6XfvBz4O2rGFWlEZ4Y+CSgodAXxJFKrNFFcaUytxrI7yksvUl/t8iTbWAJG61EMx6
 OfJHiiqL0NcliEqhuuzcbvcWYTb9VbF/qRsrzqxdr1SPBrppNCDKBovKxZ3rBNYX1J4e
 UzrqIPkOYgLReUupZhNYdwjD+tEQB6FoWGaLrBDhhkRFaetmrULso5/T9s+FBV2RwuT0
 tFlyWTL33t/C0EZn79an6RJ4auYF6CPieHAIBYWz0Zfpz6V7EAcEtVHizFaAnzYI0dcK
 +MdBrSMFjTgQEKW/cklhZNjSw5gqA8P1MkuS3cwgUVM4SogtkNLWKiHQUZ7FIXaUFgwr
 bHEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E6XfvBz4
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
