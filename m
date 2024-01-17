Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA72C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EC14023B;
	Wed, 17 Jan 2024 22:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49EC14023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imWo47iG2MCu; Wed, 17 Jan 2024 22:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D9C40263;
	Wed, 17 Jan 2024 22:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71D9C40263
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0221BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7082083E63
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7082083E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVUAUtXT0I2d for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:11 +0000 (UTC)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E30E83E61
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E30E83E61
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5989d8decbfso4390682eaf.2
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531870; x=1706136670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=561Ich8NlqBIoKcqEPqACONPv/X/gWXcHFPKIpILp2I=;
 b=HwC9rBZ3RHATUBAQ/XFwOZe8FAGOgA1NijG91A8q8NCz0xtlOnQt+fNLy/1pfQk1h6
 N5WHsjCEfIqwCgYESTdjGLorNueUh//wIjpe+Lmp5IPPxrdz2VNdHYs4bQ9NaunVXCxx
 RZwx2c0nQpng4MGAMNlIbRr7y9cLDV7UmXn5sHbqAALtzOEQaOqXizxLOMVpw+/lx5YF
 1HG27S3+ExqjHvQysgSdzIiU9WL6nhsSjtJMeVPi5JLgwNUaxQ2OzSoJCedtruhMbFp8
 XfYIN1qecXf9+dNI/s0mJ/7ua3+9EmG4PZB4HkTYptPbLPSzZm6/rGhhSNfK+P4RrWpE
 SwKg==
X-Gm-Message-State: AOJu0Yx5BodnT7uuX+knmklqaYLUaj7/cRRisApU8WAB5TBqzGw7NjpI
 WTogFARVY6HR4GLOA6INptZwwNg63kJzuE2rteQnrpsldAE=
X-Google-Smtp-Source: AGHT+IFkrHL2R7ZtFqZLnwbLYN2YlQnTmf1BcGeBRs7DnSjIGRLvoU0hgLMaxXwIuyupPqxkVTvo1w==
X-Received: by 2002:a05:6358:610d:b0:172:db95:fcaf with SMTP id
 13-20020a056358610d00b00172db95fcafmr6428481rws.30.1705531869756; 
 Wed, 17 Jan 2024 14:51:09 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:49 -0700
Message-ID: <20240117225049.28443-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531870; x=1706136670;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=561Ich8NlqBIoKcqEPqACONPv/X/gWXcHFPKIpILp2I=;
 b=oHfWSoAgd6YM01B622OFNwSCXvO4wrqmLSOsYDh0h2bm3rCEpljw7pdpbkPUf1afxd
 dBrZxB0a3fXjbnFa3qTMqFu6YZ6znT6clXr0GRbbYuf5wWJH4UQu03iX5PK7NPcpO510
 HFEUshETkDz2tdt9wGySDej6mxBSOitW87uHA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oHfWSoAg
Subject: [Buildroot] [PATCH v3 10/10] package/flutter-gallery: clean up
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
