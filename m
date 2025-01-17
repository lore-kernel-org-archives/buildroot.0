Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32512C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7FD40873;
	Fri, 17 Jan 2025 10:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxVqktaohCMj; Fri, 17 Jan 2025 10:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB00540890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB00540890;
	Fri, 17 Jan 2025 10:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A80794B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA1A160872
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9Dp8zmvPOor for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D276A6FA6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D276A6FA6C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D276A6FA6C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5401c52000fso1968749e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111252; x=1737716052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQKhb47wo+TlhDw2DVjCfnYB6u9hoXQoGintDG/89VM=;
 b=ge6hlnWYZ0pln6PVu8Ie7dWDloZNUPbAfCiRgoToxonljILehdYNbyT0sONnFRsibc
 CZ+52ALbL/ABvMxnNEgp/ndVHOEtMzroSuA6BiCFfRkEYezHR2JaXiGJBlmWDrH6U/z0
 7g6Q7RawipHUxMcksCiEU4iCXmrgN7hNxaqoUz1ltygbybg2Se1Juo6B+Ns1SM1AXMFf
 f7+uHc5ec/wZ2HLGBG7ef4kAwUAptvVGrfMNg0XT4SYpI7/EBdEyWvB3eOLzKFW7UJC8
 +ggloUO3WjZ/e1dvK5jwdWfmCUn/h0w43J4EVxZbN1DROkYwXydSitNyU5z0aF+LI66e
 fMEw==
X-Gm-Message-State: AOJu0YyO5olQ2T8ValrKJR4mpevmI0sL1omx4RdNtpaJ/AMGs/yEMAHb
 gUJXguKZW94gYNXNT0BAADrqICzAd4+vyxEkYKxiOk4u6qo/F/6/nHacxg==
X-Gm-Gg: ASbGncuH0sRPx0ITDqF75nwxzlsucJH+r0o78YskOj8UaFZp/aWNcNABbM56g0RGsGi
 zLOAaMPzvWN45YAw3Bvg76T7aL27IgWQnDxfeGmZo0PCBCsBD5Bl2l6h+2tAQiG3+RJ91oxW46j
 eY77VWUwBjzvr4fWBUTYsCSNOmZyrt7klqUvzQk8pKTn/pt5l1oOAVhR87WXoEwGdOh/D4gL7zy
 zqWliBQKW//qaLhP7kjmt1Dp/azJwKUWo3obG//WGKhUFspIQSuEvxG6vx0WQLlghpM9eDt9EIZ
 FwI6iiUYJQE=
X-Google-Smtp-Source: AGHT+IHUvzu6dwfkNucMy5uKp3gyzq5p+TPN/5M7TnVXdj7MI3DMzq767VArHvX6DeIfOCsXrjOYFw==
X-Received: by 2002:ac2:5a4e:0:b0:540:1d0a:581e with SMTP id
 2adb3069b0e04-5439c253dcbmr543748e87.28.1737111251457; 
 Fri, 17 Jan 2025 02:54:11 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:10 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:28 +0100
Message-ID: <20250117105354.618220-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111252; x=1737716052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQKhb47wo+TlhDw2DVjCfnYB6u9hoXQoGintDG/89VM=;
 b=WGi2qOEgxfPfi4UbxECDOnq1NSM9ZtUvkhaJGCwU2MOX9v8s1teZCZBMTDQMZygWNP
 RhAbmvJlhtkZNvocg/f3f7+hdyHfp7+MwNC2vjGOsOdUYmtApqMNx/9H/yC77ass58vg
 CpVy8Iz0OVBY7/mQYdSGvhLeyLJQukvx3rqwslMj2KxGwxYOK5hW9taR4x4BOhzWa20M
 6a8N34w9fuZQZdE/RGbFA93V/zN+9wy8o/5DNhySFZvFc7PAKCHEx/Xz0adJJnDsTygx
 rYj/EkZuZLrt+agDy/1KC5Y6/jk4zSA/CO3oHHTMiJnw/mPLHgptb9TLgWmdb/QScTio
 7yDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WGi2qOEg
Subject: [Buildroot] [PATCH 05/19] package/qt6/qt6multimedia: list only
 overall license
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
 package/qt6/qt6multimedia/qt6multimedia.mk | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index af50612e1c..01bf9adf96 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -10,13 +10,7 @@ QT6MULTIMEDIA_SOURCE = qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MULTIMEDIA
 QT6MULTIMEDIA_INSTALL_STAGING = YES
 QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6MULTIMEDIA_CMAKE_BACKEND = ninja
-
-QT6MULTIMEDIA_LICENSE = \
-	BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
-	GFDL-1.3-no-invariants (docs), \
-	GPL-3.0 (tests), \
-	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
-	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
+QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -61,11 +55,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
-QT6MULTIMEDIA_LICENSE += , \
-	BSL-1.0 (ffmpeg-boost), \
-	IJG (ffmpeg-libjpeg), \
-	LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and ISC and MIT and MPL-2.0 (ffmpeg), \
-	Zlib (ffmpeg-zlib)
 QT6MULTIMEDIA_LICENSE_FILES += \
 	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-Source-Code.txt \
@@ -108,10 +97,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
-QT6MULTIMEDIA_LICENSE += , \
-	Apache-2.0 (resonance-audio, eigen), \
-	LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatialaudioquick3d), \
-	MPL-2.0 and BSD-3-Clause (eigen)
 QT6MULTIMEDIA_LICENSE_FILES += \
 	LICENSES/MPL-2.0.txt \
 	src/3rdparty/eigen/COPYING.BSD \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
