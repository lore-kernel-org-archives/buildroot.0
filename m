Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1500EE77180
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D8F61450;
	Fri, 13 Dec 2024 11:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yW_w0ZyY2XQv; Fri, 13 Dec 2024 11:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2BBF60839
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2BBF60839;
	Fri, 13 Dec 2024 11:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4AFECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D712F40146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eq9MX1L8tQla for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBAED40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBAED40003
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBAED40003
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30227c56b11so15001231fa.3
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091128; x=1734695928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJwInSS5qbtZwcDWbSnkrXob76bX52YmbhVA9kOAuC0=;
 b=LMXkj5zlIG8Belf8P8bKH6Llt88BwkfLRiapMS6cUDyrUrQOyRrboNWHcCVKz6ZB9R
 P9L8ZMyoNXlhsw1MucGc/fqCpfNChNtzhu0pHQANYKUbtK+UJFt/e09jm2Z/DCdyLufy
 0sPf1P6qW5UbkuWwHUL3JfpXXN9CZbatM8jKX89Ba42dpDVzRjdHulyY3H0wsuCZfNef
 MYy3Pb2GOUYsiUpMPoyZRP1vZcO/sTOnHRmsAT6OLWjzjA0QYbWhE/4h9hoEG4fZCluE
 KGvyaV8ebL5gkt63zQPvky/A4VbGHDMj9IrTbXD3kWp++qufrLycqSwmxW3sYf4WkmOS
 LpBg==
X-Gm-Message-State: AOJu0Yw8QdgewAVYoGhmqKhQVxG5HsZSEy+ZPNjL21E8VxdN+yIJ6YPg
 kz+Y2c9YLDN0r8wkJq9+jYpILWFy9zrdI+wy+bMYY4i2WiyCcwu8Z+bT+A==
X-Gm-Gg: ASbGncsGB8U/VgzkOcEJ66e0qHPAznll551j6i64TkKifSTGis8vCvUp13PkrJnjdPm
 XEAMoi6l7zZTuC59L5PLraDO+db9rOVSXQR4kZXUA+qh3h4C+R6+sVrTvU41HMzBRBkyWXjdQ/S
 3bYohCm32ZJWVYcvhU+KhUuzPG9VPQMF165u+r89mYlhGxaERyMCh2ESqiaOrnuNF8XFWPl0B+k
 9BioYgTb3iNYXLjIVzgKJYWYdMG0X1vU+zmHNnr5KHnQVsq7lyVinpNt7zGMc1x0I7q6aA/4Rea
 VtHEnyTMNGd/mwM=
X-Google-Smtp-Source: AGHT+IFXMZsa8A8Tm83bOT0MvyNrRpjFvp8VKh6e4Vhw2bexfvgcTK5U/Iu/y5QmKL1bx/q+hM4U6A==
X-Received: by 2002:a2e:bc19:0:b0:2ff:c95a:a067 with SMTP id
 38308e7fff4ca-3025443fce5mr7217971fa.13.1734091128473; 
 Fri, 13 Dec 2024 03:58:48 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:47 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:12 +0100
Message-ID: <20241213115820.655993-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091128; x=1734695928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJwInSS5qbtZwcDWbSnkrXob76bX52YmbhVA9kOAuC0=;
 b=GZKFiksZq96pV0juznQcviXQBtAZvVvB0u1sr1/S1fKI6Y2BhGDhl/LcZlUn/kgUzw
 vd46NyPw5CBRHXcrAnBPLmH9gfIvMQzUK16UFz0zHhAT5q24kfhQ63uYxllg1AP+JF9g
 ELEDmUkchWMFCsPhGKEmhOus/INFifYAq2yeYbKCG1sX08narqPnOVavgbai0LlB220W
 ZJgMXHE4LizfMC28wsDh7B1kERw2LpVPrQqmEyKUDoWY7VNYwJrWMhgBbjNuT5Q7Ksaj
 MnDizpOf0/0MvbOGQY6YUfpKmPJKKaVN0YTwN9FSF9AaSnVJ1r9BaGRmo7TmS7eXVZbc
 KFGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GZKFiksZ
Subject: [Buildroot] [PATCH 5/8] package/qt6/qt6base: add blind host option
 for selecting 'Qt Widgets'
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

Needed by new package qt6quick3d.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 3 +++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index a6dfb40c34..e38e99fbaf 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -20,3 +20,6 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 # (e.g. qhelpgenerator).
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
+
+config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 153fe1abfa..a4c56da601 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -118,10 +118,16 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
-	-DFEATURE_widgets=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
+
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
 else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
