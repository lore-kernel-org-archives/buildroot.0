Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06744C54E76
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BC260A69;
	Sat, 18 Nov 2023 22:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BC260A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-Tkulm2fC5B; Sat, 18 Nov 2023 22:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5DA60A65;
	Sat, 18 Nov 2023 22:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5DA60A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBD941BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C24FA417B4
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24FA417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfESRHR8AzSz for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:14:30 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2712B417B3
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2712B417B3
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cf50cc2f85so6125905ad.1
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345669; x=1700950469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jk5RwTrecdBK3QoOBYQXw6rMlpy1oOO9qt5VABIG0v8=;
 b=QuTj5QseD591VD8NSTl7QmuPh8Bkc24TMB4x1hVse0OQYz7yGGjNRYeOsfpH1Z+xBu
 aBgDpzlc15CAzY2bO/Gz8id+o5Arl2OPCs4AVvieQ6Y+GHpAK+n+v/+5a8MKU3dJ4/Ns
 Fu9/irywBlVbCwouvyXunBD97X7l42NKEPuwp0dyAPz16845aYUyLjv7GD9E3jHitPyX
 NAL6k+pAnRRPDiZtPKN46niqux80K3q0FV03le7//GsTU+6+gYHL94NlyZIbBnNPTv7r
 NwCDnB54S6WGMRFhIFFE1G2nOKlH0/6d0+tbn5Lbj+sk9GFTo0BNFjknasmcJB1rSc1/
 +EwQ==
X-Gm-Message-State: AOJu0YzCNNHpuv8TpQB/oAMo0zw0NOYXFKevvrUmKc5By7u5jFFJFvbb
 v69X0MhkjiYIMt17SkYGN0+VWGemXt+XMkidgPr5AA==
X-Google-Smtp-Source: AGHT+IGL9t/A3BDR5fiVr6rmyDlU5+6oVgykw/FFl02JTxz7BrfSxlv2brdohQNk3qrTfONQupJU6Q==
X-Received: by 2002:a17:903:2c7:b0:1ca:29f:4b06 with SMTP id
 s7-20020a17090302c700b001ca029f4b06mr4514174plk.2.1700345668720; 
 Sat, 18 Nov 2023 14:14:28 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170902ea8600b001cc20dd8825sm3403361plb.213.2023.11.18.14.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:14:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:14:14 -0700
Message-ID: <20231118221414.1369987-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118221414.1369987-1-adam.duskett@amarulasolutions.com>
References: <20231118221414.1369987-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345669; x=1700950469;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jk5RwTrecdBK3QoOBYQXw6rMlpy1oOO9qt5VABIG0v8=;
 b=p0DeIsBuECY+4z+rc5SZ51oi0e7gKf9B60DUNMF0bRI7Yf2pT4XxdanFVskWJtTQPC
 XCZbzXlHZKi7/yMP+M2RlreB4DCmRYN0l+aSbcNogxLr9/XGkDOseeZWDrEgVhxulZm2
 lCWPXFf7oVACUPLmmZDB0fFXc52GSII2B3WwE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p0DeIsBu
Subject: [Buildroot] [PATCH/next v2 9/9] package/flutter-gallery: clean up
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
  application, we should use exact symlinks to icudtl.dat and
  libflutter_engine.so. Besides, the output of ls -la looks cleaner as well!

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add a far more comprehensive git log explaining the reasoning of the
          changes. [Yann]

 package/flutter-gallery/flutter-gallery.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 5299b18134..492b426510 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -46,10 +46,12 @@ define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
