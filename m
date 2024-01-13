Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E11C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 974D360EDE;
	Sat, 13 Jan 2024 20:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 974D360EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMCmi5ZOvAgE; Sat, 13 Jan 2024 20:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D8060E13;
	Sat, 13 Jan 2024 20:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D8060E13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 537321BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CDE2839B8
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDE2839B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gjuc8LOEnt-K for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:37 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 882928394A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882928394A
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so6474348b3a.3
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177236; x=1705782036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=561Ich8NlqBIoKcqEPqACONPv/X/gWXcHFPKIpILp2I=;
 b=l0X8zlSwEc7UpnChme5tSoZo7uCo0jV1qNQcKJu163Q9rEn6jFRFkbL2HuoQvJebPP
 wavCfBmOiaHRgcGoGtQClnL6ZRNcE+KV3sdK8Z1R97l8IDfNcboXNfclqV4JWoUB2HYH
 Gatj5R/nRw0dN5NqhpU5iGVGKnfbBqbNuVXFcfTDYun9mrrm9ctS0TdYEaRkBk0qX5WE
 U0hNlbAHquZjqbb9aVR/e1DjwKQAwkvwMhBH32hQ2reIBKtfPv6NB3Y5rd04HD/wiZNu
 5Mzhxjgx+A/I2TwhudKG3kHB1u9hWJizXAn8Wy2vg0ZlyE5ymUuQQApGySv557Kfp/MO
 sfAQ==
X-Gm-Message-State: AOJu0Yx5uk7uEMRCHFc+P/CZq2AWXKESEZ2QiAcZBo7OMxR55aiGt4U5
 GfhdkxIrCRqc/Trl4vlrNP0slr3s6oZq1X/9SZmL/LY2cMQ=
X-Google-Smtp-Source: AGHT+IGnf0sm9uYJDFIDyDtuaMYFQmElx8OlbZX8MAMoFiC28sAdODYjW5DDfWG/Ze5bk0r94pyvKg==
X-Received: by 2002:a05:6a00:1994:b0:6d9:b386:c079 with SMTP id
 d20-20020a056a00199400b006d9b386c079mr4091713pfl.43.1705177235839; 
 Sat, 13 Jan 2024 12:20:35 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:20 -0700
Message-ID: <20240113202020.21747-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177236; x=1705782036;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=561Ich8NlqBIoKcqEPqACONPv/X/gWXcHFPKIpILp2I=;
 b=oSbfvpTnM1/0GDvOWZn/O9BUgKdWbwbbmDdSyjcBleFQ/JtCpU+fwlng482ApOeEP4
 bkNyQNE7br3EkJ4d/E8TsQT6D19ZG3E8yTzZKO2Nh28KcXkB9lGASpll3eSo6VE0u6Pe
 VSWcNKmzY71VIZiQcLmc/MwlQpZAMxp+GjG/o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oSbfvpTn
Subject: [Buildroot] [PATCH v2 10/10] package/flutter-gallery: clean up
 install_target_cmds
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

Remove and create the kernel_blob.bin file in the flutter_assets directory:

  When Flutter compiles the source code, it creates the kernel_blob.bin file,
  a Dart Kernel Bytecode of the application.

  If kernel_blob.bin exists inside the flutter_assets directory, then the
  application source code can be extracted with nothing more than apktool.
  Not only is this a security risk, it's also redundant and a waste of space.

  Removing the kernel_blob.bin file generated for flutter-gallery saves 86M!
  Because this package is a reference package, and some applications may check
  if the kernel_blob.bin file exists, we also touch a blank kernel_blob.bin
  file.

Do not use relative symlinks:
  Users may not install their applications in the
  /usr/share/flutter/${package_name} directory. Because this is a reference
  application, using exact symlinks to icudtl.dat and libflutter_engine.so
  is preferable.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-gallery/flutter-gallery.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index e23dc399da..6b0954cb32 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -45,10 +45,12 @@ define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
 		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
 
-	ln -sf ../../../$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
 	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
 
-	ln -sf ../../../../../lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
