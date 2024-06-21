Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C2C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 16:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E4341745;
	Fri, 21 Jun 2024 16:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdN5DhAgV31E; Fri, 21 Jun 2024 16:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F22344262
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F22344262;
	Fri, 21 Jun 2024 16:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03AA91BF232
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E487A402E3
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egL1IDP2uxJi for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 16:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C054840156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C054840156
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C054840156
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 16:11:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso20034815e9.0
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986258; x=1719591058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4WnWKuMsNLnBR0JP8I2dC15viE/E2FF1htE+oPODMU=;
 b=t83MgUDD6wPamEgDMxzkcR9Nb3oyk9OpPmZXNyYImrQ4PEKrzuIgDvgsQIuunBSo++
 hmY0GcF3F0cRUT83+BPRxtNW2JF5G15fZvumyqnmjp0ax+uDnuQhs+xVlnpzbBmIxrUr
 HUmnuAEr5/u22HgN8srAn7cQuA2Q5FdkFX57/1KIDTUv0WDfc9nrELlkY0YEsRwuS3jD
 GhzlxGAxoy5WSSU7624Pp7Fr4eqyohSLtys6KTYUvWXrnBeop0F97UbWxLvNvlBSyA0Z
 NYZBiaDdozonjN4EHqHKd+jdoCYI39DdjHoz3pi1noFTwf07CBBFQvls+sF5cJzGQJ58
 TI9Q==
X-Gm-Message-State: AOJu0YxViWhhMmhKr0Sp3ARr6/qy+iJsPkHqtc98yL/ipmS0HbnfgpDJ
 HI32b62WHs2MQ6gXz7m+udoRoCOtKTdogbvw8qi0rIkN1YQfd9RM+WWUqqRbDyLTQ6l+J90vcav
 Y
X-Google-Smtp-Source: AGHT+IEv+cK4K1nAT5dKh4y/4l6iHe9tIFwH0sZh1UGtD81Cw4C9MVro7Yql3+WQ4dkIyvwLjrLQIg==
X-Received: by 2002:adf:e28c:0:b0:363:1c9d:d853 with SMTP id
 ffacd0b85a97d-366de98d15dmr200721f8f.32.1718986258458; 
 Fri, 21 Jun 2024 09:10:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm2185522f8f.28.2024.06.21.09.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:10:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 18:10:44 +0200
Message-ID: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718986258; x=1719591058;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4WnWKuMsNLnBR0JP8I2dC15viE/E2FF1htE+oPODMU=;
 b=RDEMvclZwmpZihjiju1PRfI6QNJ6EYu4iX17nO3rt/8G7BSoBCKx2Ij3hKOKL+68P/
 QlyVydOwXWIrftqEjngl0fNReKrIeZMjLVs7ap6qI3QbhERq/hYxt8x9Lx9CBuACWN4b
 +naZ+X3TNvuyPqmAV9BL6tmd59TUebffelwCA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RDEMvclZ
Subject: [Buildroot] [PATCH 1/6] package/libopenssl: use $(RM) instead of rm
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libopenssl/libopenssl.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index d209bb8e96ba..88debf114a3b 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -135,8 +135,8 @@ endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-	rm -rf $(TARGET_DIR)/usr/lib/ssl
-	rm -f $(TARGET_DIR)/usr/bin/c_rehash
+	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
+	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
 # libdl has no business in a static build
@@ -166,7 +166,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
+	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-1.1
 endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
