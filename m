Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A42CC4707B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B7C42DED;
	Fri, 12 Jan 2024 00:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B7C42DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XT41WSnXhHmL; Fri, 12 Jan 2024 00:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 970CB42E11;
	Fri, 12 Jan 2024 00:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970CB42E11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74D071BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59E8542DED
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E8542DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4RWHQzIoXvJ for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:39 +0000 (UTC)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5FC142DF6
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FC142DF6
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3bb9b28acb4so4500342b6e.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021057; x=1705625857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=561Ich8NlqBIoKcqEPqACONPv/X/gWXcHFPKIpILp2I=;
 b=LTUdsixseHUMF+rDNeWEk6ulekLiADX9emFor+TYsZ5GRi8aDJUNfuL/7HampcxJ+5
 xQLmEF375RvlNGwhpjcNxMh7Frr2ZP9bSzVsOTZLCMB4Iy/cuEE9OTF1hTZzK1r5do85
 MGwnByHB5t23igYN8rw9oZNs69hLBKxtZtwNqKKpzadyG5YTbQxvzTGW5vRPH7doIqd9
 tFi3Gf1xnttbWvo7UgaE+ssJBuV5YQC7jgwpmtAzhRg8u2kcQSpKL+waIcdMZRb8T0W1
 Ucdf7i+28J/+ANsCZx5LF3TsebzTH/F5qlZUaaCAYibQjVTlvcJHDeLEvV+gjGxaYiMO
 O1gw==
X-Gm-Message-State: AOJu0YyrtCsIN7K0AogunHRK8jWtiqMg0fwBLQWCLkM5RLpIXlQmkgQM
 w3cpLeoboar8o8NEmGysJwYEkoZG0W/cAo/P4rD5YTf/5vo=
X-Google-Smtp-Source: AGHT+IFNC1cTnOLKY10xm67z5OwET8v2E0B6ZfAE6jMQ/8O780G/0EUQwsVIMXJnWk3ShFmp2dzzSA==
X-Received: by 2002:a05:6808:138f:b0:3bd:5f3c:e021 with SMTP id
 c15-20020a056808138f00b003bd5f3ce021mr251421oiw.26.1705021057656; 
 Thu, 11 Jan 2024 16:57:37 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:36 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:19 -0700
Message-ID: <20240112005719.1082305-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021057; x=1705625857;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=561Ich8NlqBIoKcqEPqACONPv/X/gWXcHFPKIpILp2I=;
 b=rD0i1ljJoy9xfY90rYdFQqDhSADMrkVsdhqF2SItSV8d45A8MEsckVaS9Gmh3b/kt9
 98L+chKifGe5PkNAbbyybQsGz6zNPcX1N4O/0w0IptLJEFvDlTp0TNdmr82fF9Cemp8V
 m1G2NqRrPk7r+R3yShJ7UE/NAYGt4LjbrB0Eo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rD0i1ljJ
Subject: [Buildroot] [PATCH 10/10] package/flutter-gallery: clean up
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
