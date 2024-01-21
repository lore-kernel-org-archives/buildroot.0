Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FF8C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D342C60AEE;
	Sun, 21 Jan 2024 20:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D342C60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prALvjB0wRBe; Sun, 21 Jan 2024 20:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298CF60AB9;
	Sun, 21 Jan 2024 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298CF60AB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CB891BF37F
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 259F581EEF
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259F581EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Wnsv47deSOj for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 20:42:57 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EB1E81EB5
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 20:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB1E81EB5
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so2013691a12.1
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 12:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705869776; x=1706474576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C4+3T7kBn8+xyYQZvQhFmr62k1NUZ63AhadLL2IVNwU=;
 b=u5thiViEpDR6WU6PsYQrj/qnYm1xm4QMrQdv3iyv/JLp0OniE1IjZtUMOI1XFzRAK5
 TyAimQcqfb7m9YJiruLMjXFKppz48mlJdAn4Gfe0GYxDFsU961Fdu8GQaoLJWk+9aW8+
 qFTDsdTYadSG0gLA2nfxZ9rFbBVfS8dT+4XIoDL4dSlmbzwYIQEIja+9/tYUn4em3fI1
 sPy5vjKtxgvaLCnsSYUHsdCRpTOktabwBu2NhWSJ4SqhorkG57ktO8j5COlz3QI3AOTh
 sa+PwJ5F65mC8wYgdd8SmPXmluz0y63PC7sJAym2YRbjBSTNqXI4m+TGWmrgDeC2Atka
 dS6A==
X-Gm-Message-State: AOJu0YzivOwgz1WyMQs+G49fAgaAQUupa/3qGk+vdHq3oMDh0ODRI/7g
 7QLfkKoOmIdZ1NW0jwJ5YilU+90xKg2MO6/iJGNITajgcBa+qRday0SRwkP1q3+/eY0lTUKNGj3
 J
X-Google-Smtp-Source: AGHT+IGpct0Ebkpe/MGvI2PNCOvTQfnnEnqhVdH+R2EX86+Ki/J99lyH3BlvX8qn/oM7kgKUAJh9Gw==
X-Received: by 2002:a05:6a20:2593:b0:199:9d1a:cba5 with SMTP id
 k19-20020a056a20259300b001999d1acba5mr4948940pzd.37.1705869775948; 
 Sun, 21 Jan 2024 12:42:55 -0800 (PST)
Received: from fedora.. ([75.174.148.104]) by smtp.gmail.com with ESMTPSA id
 u30-20020a63471e000000b0059b2316be86sm6927606pga.46.2024.01.21.12.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 12:42:55 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 13:42:51 -0700
Message-ID: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705869776; x=1706474576;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C4+3T7kBn8+xyYQZvQhFmr62k1NUZ63AhadLL2IVNwU=;
 b=LcA4QMKHDWC/Qr5sHhwAlfI2T3w7XBG/xSjPlOrHjWKGzKiRKapkax6GxGOTT9Lpdu
 0ASVO8X3nK42yxcgcjAzd8DqXTu0y0hBaQq5GZkClDAkfnJOfJ+dRdORY7OQSHf8DkOP
 aQYkDuTi437bF2AUyAZMUzPZg3HUA0MZNxSuY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LcA4QMKH
Subject: [Buildroot] [PATCH 1/2] package/wlroot: vulkan renderer depends on
 vulkan loader
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Without the vulkan-loader package present, the configure step fails with the
following error message:
```
Run-time dependency vulkan found: NO (tried pkgconfig and system)
Message: Install "vulkan" or pass "-Dvulkan=disabled" to disable it.
```

The above error is due to the lack of the vulkan.pc file provided by the
vulkan-loader package. A search of autobuild failures containing
BR2_PACKAGE_WLROOTS=y and BR2_PACKAGE_MESA3D_VULKAN_DRIVER=y shows two build
failures. However, the failure reasons happened before wlroots could compile.
One for gerbera-1.10.0 and another for host-rust-1.64.0.

Add a dependency on the vulkan-loader package to resolve the above issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/wlroots/wlroots.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index bb5c8f497d..fdd2fb8250 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -41,9 +41,9 @@ else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER)$(BR2_PACKAGE_VULKAN_LOADER),yy)
 WLROOTS_RENDERERS += vulkan
-WLROOTS_DEPENDENCIES += mesa3d
+WLROOTS_DEPENDENCIES += mesa3d vulkan-loader
 endif
 
 WLROOTS_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
