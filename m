Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB5C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 19:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146606077B;
	Mon, 22 Apr 2024 19:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5HJ0HS3LvyP; Mon, 22 Apr 2024 19:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12FE7608B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12FE7608B2;
	Mon, 22 Apr 2024 19:26:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 456F41BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA41608B2
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 19:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fV89YoZjeDGA for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 19:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.51;
 helo=mail-lf1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B13B6077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B13B6077B
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B13B6077B
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 19:26:14 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51ae315bb20so2998343e87.1
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 12:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713813971; x=1714418771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//erx5ysnPP2a0/Wvv2CwyBf1hY9WNgSmNEO/V4aGkM=;
 b=p79iit7p676ttXvBif9Bg87LuakxIuDSGiacMg1vQrLf1KnqQpCWU4epeABudWCm2d
 onG9576zRlr3mPBCytvJca47olEY6SL3PYz6L2GzWewU/w+Gloa5mwi26cEvzzNdqzwM
 PDtZuH9oItqXBHQWqZ90eH4E5Lek6ovE4GP1VjQf30t6Zdz563GBKKN+0MA3So5W+ZYn
 qnHcIY1zypg6mvujVtkO84c20R6aCBc19Do/ogTuXNa+lZ3QXT45oCpiPKJNI+UtO7Hn
 dKAhV9XbwXtH4JDd3LhZgRO7ZXT2azgpY4rsFfJtgIsWHT3a8U5/VxbtxHyCZF48ksmy
 ilZw==
X-Gm-Message-State: AOJu0Yw2SRIeMpMZhFpmJYT+RE/7I52Y8oE69QnxeZtxdj7iAFxOA7Sg
 ux4d2yb2H4cFUQ8Y1dAwUdIgZWg0N6mLlL+Kob2chnr1lrnSTvJSFsziZQ==
X-Google-Smtp-Source: AGHT+IG8e3RkgWIl20dcN+evArMSjZWAT7ijVnVttd474Dx4yLRIflHUg4v4UzsbLBpkRwVLl3jt5g==
X-Received: by 2002:a05:6512:3488:b0:51a:d2ea:97c3 with SMTP id
 v8-20020a056512348800b0051ad2ea97c3mr5294424lfr.69.1713813970648; 
 Mon, 22 Apr 2024 12:26:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:148b:3752:e121:4c3e])
 by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b00a57e2d39d56sm635484ejc.223.2024.04.22.12.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:26:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 22 Apr 2024 21:26:07 +0200
Message-Id: <20240422192607.1830232-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.76
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - https://www.lighttpd.net/2024/2/19/1.4.74
 - https://www.lighttpd.net/2024/3/13/1.4.75
 - https://www.lighttpd.net/2024/4/12/1.4.76

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 5907558ada..c5545150b0 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha512sum
-sha512  ee41a72b09614d630174ef832b08c050708f62c0b6299e82b0a5f91a63d62702d31237ae5bb1850f0160b94e36a66af38a2d7abdaa920235265d416d2b0b4015  lighttpd-1.4.73.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha256sum
-sha256  818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8  lighttpd-1.4.73.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha512sum
+sha512  940f00f2d84e3424c389108d09756a0af41db3559474135b6c502deccd08ad051b5184f3f7907436384964d2b05045e27dca463af98c889cee69b0ae6e202782  lighttpd-1.4.76.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha256sum
+sha256  8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011  lighttpd-1.4.76.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index be8eda6b8d..b54f5dd213 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).73
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).76
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
