Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A1C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 18:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D52760B92;
	Wed,  3 Jan 2024 18:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D52760B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVcF6evAc_ii; Wed,  3 Jan 2024 18:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A574E60A9E;
	Wed,  3 Jan 2024 18:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A574E60A9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D88F11BF4E6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 18:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED4882318
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 18:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED4882318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_wdFIYCo3Jq for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 18:19:38 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B06182310
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 18:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B06182310
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so4583725e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 10:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704305976; x=1704910776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDqZ33M/kxAyj4uYQdEexACGTZEgqaecIwxKHHqvkVI=;
 b=KQuyk4PIYgK0ke1yfh7lTnGDy/zez29TFVubSe7ymwbgKbyBvI5FHZAhW4BbNKb92D
 t4X4M6tkxk0/+K/H8+t7/LeW9a1Nm85w97PBF2BhfBkEo7FFKneUCVFtUJUTAZK2JcVE
 xjEbhBfF932rfMwYOJHVY6LxDEQ5Gd+NuBzUZO7F9zVtIHDArwdUPAksgbHjn/0nNLe3
 bdQ56pC7l4DS0jflzoMpHAu/e9YqQfOrg8IsrLxWsBBOveAQsLaPz2sQTIeXrEiTC0t6
 2NcAkE+n/OE+yo1VZjhbd6brq1X3WPEMC0eSkE+Nz3RRVINL6KSOfBhc0X3XvGw9z16/
 fbGw==
X-Gm-Message-State: AOJu0YxCYD/GIZZh+en3XXDu74Azj2wqjb+/5FWEfKNxOynxG08MIyeQ
 FUZ740zTRB67x0+3UZmxp6RorrpgxkA=
X-Google-Smtp-Source: AGHT+IHQcNRH9HIg/oMmkepyx6apNfXTqKc7RGmvGX1U3/TEHs5K7w+68UW4GL7nlVpqRQ7wep45mg==
X-Received: by 2002:a05:600c:4753:b0:40c:a76b:6212 with SMTP id
 w19-20020a05600c475300b0040ca76b6212mr782475wmo.161.1704305976199; 
 Wed, 03 Jan 2024 10:19:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c310f00b0040d53588d94sm3073253wmo.46.2024.01.03.10.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:19:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 19:19:34 +0100
Message-ID: <20240103181934.876343-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704305976; x=1704910776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDqZ33M/kxAyj4uYQdEexACGTZEgqaecIwxKHHqvkVI=;
 b=ZF/uIwoK3zmD2dEFeM8Z+PwFCseJ1K3M4h8EcvTwFvDILtvS6APKxGs7DEtkZB7+EN
 QEJP4VLFfRVYcH7aidrZS+fk/vbPx8nY5CmMNneQ0B55e0Y5gQAVOiiZqpgO1YBxY2Sx
 RGCSuH0vwOEZ5otB14dgjHKiOaF0OIAhs4CHS6bW4xQspHkIgrV8I+/mLcrhWJGL7bm0
 6CSh9AgUNHP7/5G7TN98nVOQX9CVyc4HlsbxbNKQOxfbFtCl/MTIoWVZFX4VItoKUoYc
 NF3HbwV2kqw+7fFJ80k/7njDvw7UVyfLxKu36YSMd8wF6EWhHSLeTOYvY1ERryzG/cXq
 yFyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZF/uIwoK
Subject: [Buildroot] [PATCH 1/1] package/gdal: add sqlite optional dependency
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 5690f55c00..e9dcc826b5 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -91,7 +91,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_SFCGAL=OFF \
 	-DGDAL_USE_FYBA=OFF \
 	-DGDAL_USE_SPATIALITE=OFF \
-	-DGDAL_USE_SQLITE3=OFF \
 	-DGDAL_USE_TEIGHA=OFF \
 	-DGDAL_USE_TILEDB=OFF \
 	-DGDAL_USE_WEBP=OFF \
@@ -127,4 +126,11 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+GDAL_DEPENDENCIES += sqlite
+GDAL_CONF_OPTS += -DGDAL_USE_SQLITE3=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_SQLITE3=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
