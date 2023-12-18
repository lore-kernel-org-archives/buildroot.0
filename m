Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD1BC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F024195F;
	Mon, 18 Dec 2023 18:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F024195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWrae3NqBT3x; Mon, 18 Dec 2023 18:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF5341A60;
	Mon, 18 Dec 2023 18:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EF5341A60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D04721BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A911D60AE8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A911D60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMLGIYO4YubY for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:57 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09C6960AC2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C6960AC2
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so3271882a12.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925695; x=1703530495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NdA4p6aFSEidjnmt/+wbbP+idMZEz5fQIxSPBV5Xfc=;
 b=MHbdhuUXmzTnzkWjMyNJhGV4KkARzLsN38wW7xyKODpqTlxOG+b23mn/T6S5PdUc+H
 a5O0vSE3X/+ex3QSJzI6KeaQ3yk0GgOLlHcPLuQ8c4paJGGkbNGLNuRGvGlVhBpVukr6
 87UYc5O5yaR7sHjRArSI1f3DG3cz/UET0wnx3k5mOwqsgNADNSbyESftZiJazzUKUPvz
 zoJBR5QA3ZQROgHK5UbsRqsjpPENVp5pa8bQ0MCScZ2vPkapl8qS3WPgn5wpuDB1mAHT
 hmV311++WZnHZSrggljxaq16Xn0hHLCovSShOG/XIg/a3N1hftdmDA5urZVaxe1kwd6R
 5+xg==
X-Gm-Message-State: AOJu0YzK3lHCXGAqvwWjmRtAN4pEI3GFJQi7SBSF75ndX8eaT51XlLY/
 oFFWiCiJ7fcIpriC7uTdkswKjX+YqR+E8fXdUdo=
X-Google-Smtp-Source: AGHT+IEpC67apLdyAuwPQxn4/ZT9Y60WU5DkIDRmaDz9ZMq7fnUOU39uuwpi5KAoQSfmn6hMC8HpAQ==
X-Received: by 2002:a17:90a:3883:b0:288:927d:5f93 with SMTP id
 x3-20020a17090a388300b00288927d5f93mr19489294pjb.24.1702925695524; 
 Mon, 18 Dec 2023 10:54:55 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:38 -0700
Message-ID: <20231218185440.506995-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925695; x=1703530495;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NdA4p6aFSEidjnmt/+wbbP+idMZEz5fQIxSPBV5Xfc=;
 b=XLYcc/3VLXqX6hdTXe2K2PnaqSg//WM8lIqckx4MpF0NlcK7xSV9r80H30Oc0J1OI/
 HbhVYYjnIMHp7JE2UowF2mRIO7r4tVx/6R9CINWynIlFGrHPm2lvfeZ7lWKFfL4h5qMd
 jWJGddd/ukyMnbEtWrlZgaLhqUM1zw1bhOrtk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XLYcc/3V
Subject: [Buildroot] [PATCH v2 12/13] package/flutter-gallery: clean up
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
