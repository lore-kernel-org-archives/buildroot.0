Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76FEC5DF86
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 12:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD3D40527;
	Wed, 19 Aug 2026 12:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIMYtGErCl0f; Wed, 19 Aug 2026 12:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787143100;
	bh=0tLHGL7B410XXVhF6pqTXQhRvvVlx+vU70WCbpTefvM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VJKBW8G011EY9humrmQtsP24s+Mr8E1u0Cu9iGIAiFZJ/ueW/M7Ujzyth//6ZfUVV
	 2pNZD6ktlx//at6XDq/oqYjG1rci3GtkdijZ2dHHUGI3HzAn+qbGFVaFVZD6tf2qpg
	 kF/r1cAFNJ6kaVteEj7KRZJ7rhrdWVA9w3dfzh1dSeE2C+bkSWauJOTKwNCuBFpksJ
	 eF6pVYtY1L8X9XNPX86RuRVVfXClSVzjXoN1daqlx6cuZFTYAPrbWt537pRl6dMJjN
	 owgWTmybh6EKWFNQ9t4+QR/Re4KHTI+l8wwUe+qV+K4Jj8CawOmbzRC3VwFizAWfpQ
	 C0X3dHTuG0Tgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B8F40539;
	Wed, 19 Aug 2026 12:38:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67CF81460
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 12:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 655B46062C
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 12:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32Go90bV8UQc for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 12:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58221605DA
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 12:38:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso6583325e9.1
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 05:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787143095; x=1787747895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ag6vY/icS91vEY/v1PumeQkNR/YxBXxGIt0fDdkmZOA=;
 b=Xu4sTubsicOMqwyj/r3b9xQdyQWv0JqhqAkc9YoCJ5oJ47YG1R3h2nyHy8Alr8ZBPV
 4uErZNj48Gh20A17nMYBrgD7BK16qDQuHTUHuFtu2u+R1mXf4ZotlAcjdVy45+JA8MM8
 RU5WCB+8G6ZQoiG8ahKiOWkIcMY4IO43BOJq+mM1YN4rSGR+thTyj7h1lapboE5uU2Pc
 X/mY5Vc2AT2zhvMARTOnxNOiwvxNmaaqZI7avMUlvSr+bCyaWFAVSJa5n5nBduxBJ6pD
 AoTQPARQTTWRJcWXHioRHxYtajVRS0EuhCttRYdwdJkLTC/nHe8ibPVONE8FUUsVAoa3
 bqKQ==
X-Gm-Message-State: AOJu0Yw9TwJ6iXvb4lhYeDD18i7tahQCwMTfNwEFO9VuWVxh3apZkgat
 9eUxnwVvzVzoyfNrOtk9EhY30ucnG9MYzD58sYC8+5qQSsM6JGNl3059BAAO4g==
X-Gm-Gg: AR+sD13xYWs3hBwNRG6d1VilYbXYJg4IAWN59paeu3BCsE/18mGwqix9dP2Vu2MdgLo
 IVJcNesac0fXNcAvp6Ru1yvq6EILv9G5oC6dEevIbrjrcBPLVY5BaBOGuCB6d/xtd38yYhsOe2k
 ZmGMWKGm6qCyl/Z6v3T10Vswfx7llK7LRJjvRy4NAnyT4tF9Nea2QhQh+I6sEgRJje0YomXXks+
 CVv0Flrx9jHVIP8j0EdOEikoF020oc6o0FQoDuo1luXNFrL8PKde4QEpd4qWKMTRGfPcyYSgc0E
 2EHfiwkgVU+AWE69c2ZQdwGsD5md7roE0/w1/1QIkOd4p3C96uEcdErMQpLshy2jz1ZiED+ctlW
 1tLqt85tHsLYgHVOnwNPfi432nyFTZLsqk1txuxA9x/yL2CAJhvNLn+cHpORJACIx02HIL90FkZ
 9wn45UAFnKvTL6gGj+fahWDpw78lpvLppyPw4MYgGL/ZzTIB6WprIZs/paAlgj/Y0XY5vUMGhWI
 86TXQZ+pg/97vC/v+5Jvr4Y7ldqQjULFfuNb4ZivlTzKv85ijpG3R2yZjGrvcMJGKoNzXowN52R
 7lRO8yC92ahkba2m0bGZz+oXt8zW7L39NTTMRJYH+NcU3pBJnp91W+4bLwYcg0BDSag=
X-Received: by 2002:a05:600c:64c8:b0:493:e451:a9e1 with SMTP id
 5b1f17b1804b1-499aa18014emr86815575e9.2.1787143094948; 
 Wed, 19 Aug 2026 05:38:14 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-499aa074740sm62165385e9.7.2026.08.19.05.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 05:38:14 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 19 Aug 2026 14:38:11 +0200
Message-ID: <20260819123811.420995-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/webkitgtk: fix wrong config option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 713d63b "package/webkitgtk: add option to enable MiniBrowser",
added support to select BR2_PACKAGE_WEBKITGTK_MINIBROWSER, but forgot
to drop the default -DENABLE_MINIBROWSER=ON entry.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/webkitgtk.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 6cab2c6a247..ee9e707cb55 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -27,7 +27,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_GEOLOCATION=OFF \
-	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
