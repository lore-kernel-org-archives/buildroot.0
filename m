Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3DC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A3142135;
	Wed, 17 Jan 2024 22:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A3142135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BskmLcBlugCI; Wed, 17 Jan 2024 22:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98BB342158;
	Wed, 17 Jan 2024 22:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98BB342158
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB391BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13C4383E61
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13C4383E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFx9PhG2Lkia for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:07 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7B1583E91
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7B1583E91
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so132276a12.0
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531866; x=1706136666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=BROcS8PDqNEX9uWC0qQAkDwJAxoG6lTNwbt4e3RgVuewDlNdEwFaaos1XOsK/9UKj1
 MUmEagebf37ykDGgtzZUzsOU+O2kBqQlGKv6BUKCulv0kUdeeGvLKg0zvudR2oMmpLOL
 pn+iEsZBMm6qZxbtYJLjgetelesyk/b9OI6Xc7X5dX12/LF5rwpnZ5XIqGooG0X3QlSC
 A37NxYK4wgS+P6XOpng5LtRVWvARc68JjO1rYfdpIJr2j9VQWz7jwTpZpSpa7zL6bhf2
 +LAnUvSvv1pff6eV6O9h83be+3eNSIF3270cf0WGZjhDYZMPfxCGj0MW5MvgG8px7PMi
 IiPQ==
X-Gm-Message-State: AOJu0YyuapeJ+OcyxgAGkHbAPkcjmsM5npIuBuajNFbf4Fqw+NpAQoIY
 fSkjyxZ3YZflUWfirHNBiEQpcAF5RcvXCIGvnrz4mxYWDnFmso/y/CtDaWmsHCcCzJ0DJs3BKxt
 N
X-Google-Smtp-Source: AGHT+IF103m1j4Ex2AdC5S2WbuQtQp4BySSWtVTXspRKL8A6c9uq0dkCFqoTdHKhI9NpgCWGxIJnwQ==
X-Received: by 2002:a05:6a20:e68a:b0:199:8cf3:8654 with SMTP id
 mz10-20020a056a20e68a00b001998cf38654mr39466pzb.9.1705531866360; 
 Wed, 17 Jan 2024 14:51:06 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:05 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:47 -0700
Message-ID: <20240117225049.28443-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531866; x=1706136666;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=UP9zeMz6Aq9lvnqSh53jCKBj1VNCceQa9whYKj7zpHlgIl8KxyrPnHkIdckS/6pkxb
 LSvrPhCnJpBxLyV/8KKdIVTX93Wa6KmPZ2TmuOkl8QFwZ2KtOEIt8hEthgkATuUXN47+
 fupZWJqZWnvSEzMWv88v9Kc7De2U4rYt4nDgs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UP9zeMz6
Subject: [Buildroot] [PATCH v3 08/10] package/flutter-gallery: add a
 configure step
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make the next patch easier to understand, add a configure step to the
flutter-gallery.mk file. The `$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle`
command is placed in the configure step because it generates several files
needed for the flutter_gen_snapshot tool to generate the target .so file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-gallery/flutter-gallery.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 57a476b1ab..50ddd9ffba 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -14,12 +14,17 @@ FLUTTER_GALLERY_DEPENDENCIES = \
 
 FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
 
-define FLUTTER_GALLERY_BUILD_CMDS
+define FLUTTER_GALLERY_CONFIGURE_CMDS
 	cd $(@D) && \
 		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
 		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_GALLERY_BUILD_CMDS
+	cd $(@D) && \
+		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
