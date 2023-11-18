Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E11DC197A0
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CF842D72;
	Sat, 18 Nov 2023 01:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17CF842D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vw6Xmx1XzIXt; Sat, 18 Nov 2023 01:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4C842D65;
	Sat, 18 Nov 2023 01:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4C842D65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F04E1BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 683BA8196E
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 683BA8196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huFCC0bGhWGO for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:15 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD81D8191E
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD81D8191E
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3b2ea7cc821so1615612b6e.1
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272514; x=1700877314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sivueuR2BkR0IJL9m5H7nBnPkkewavlofqegcC+K0/c=;
 b=GJIjFdjtfG28IsEZzZBI4NauhhwcgQeDHbV9ZlvyLLGT3b7Mw85i91xpEUSGoUurqS
 JuHo02AzPuqyRNbY8PCYs+AiV62u1HJqTndpddFqeckbKsM2OyryRISyf+IM74J193qA
 8kYwjj6BxqXAPyMAppVtN4AozYcrtDpqmGJv4kY/kGJVljulBuN7Mk+W4o4gdNIaxePj
 iZdHjiFKgS4LY5Drdd5wKIeDnESkLinA83e8cDsBOHbiZ/vlaII4/n4WIT5p78IfoOVy
 L2b9LA0TOts0uPqhy6BTx9h/knJ9hw1Ur1wqNXyo3csLuAN4CMcULyvoV7ofiuprJGXC
 B/FA==
X-Gm-Message-State: AOJu0YyjrVF8CQYtOac2GRaX6NUiIS2/vU0ei3b/RPhOF7LVLPzAPGPr
 Hx2UqJdnM8hcmCU5QgtX4ytdaMzJGkg6AfM/MN6OVA==
X-Google-Smtp-Source: AGHT+IEWLrzq05pdWWi3M+47wYmNhvqsA4aQ059N3cFzti/5A5+DDJQ2TzhxSBkOkF7uVUJUJgdrIw==
X-Received: by 2002:a05:6808:bcb:b0:3b2:ef9a:4339 with SMTP id
 o11-20020a0568080bcb00b003b2ef9a4339mr1470038oik.49.1700272514392; 
 Fri, 17 Nov 2023 17:55:14 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:13 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:55 -0700
Message-ID: <20231118015456.2629144-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272514; x=1700877314;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sivueuR2BkR0IJL9m5H7nBnPkkewavlofqegcC+K0/c=;
 b=hLdVcbmG4ww12r8lM+LPplUmkaxL3IEXz6JsE678XBHVQPCSf954hm/tX7Fb2nkqgt
 qgTyXIhZT+y45aMRKVFrYUWKwmlRg80ev8RSIh3z/b8xXE8FiGx7/iZ5ry9Zpb+12h0C
 FEOIlpgJOYEM8XcLMf5i5ET1ybsZ3v+B8AZxI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hLdVcbmG
Subject: [Buildroot] [PATCH/next 7/7] package/flutter-gallery: clean up
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

  - Don't use relative symlinks.
  - Remove kernel_blob.bin and instead touch a blank one in case an
    application checks for kernel_blob.bin. This saves 86M of space!

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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
