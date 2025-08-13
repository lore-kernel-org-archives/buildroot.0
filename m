Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C744CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 19:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F3C84034;
	Wed, 13 Aug 2025 19:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnbYWlyvacVq; Wed, 13 Aug 2025 19:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5019D83FC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5019D83FC4;
	Wed, 13 Aug 2025 19:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 898CE1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB0B83F99
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mnAPPtWEpJE for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 19:26:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B27D83FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B27D83FB2
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B27D83FB2
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:28 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so31670766b.1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 12:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755113186; x=1755717986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Blxy4HyevyRRHVgsLhuZ0FiHsljJxSdYpyi/FHRDL2k=;
 b=IEXn+PWm05vLWZqy08VXDx7CATr72/2Aq/miyYowZO0BVOolE/G+zibMMuEpxPMWHS
 qVmMsgq1+Ve8gXNgIweCxhq0LFR1VgfDZdI2666up2vKTpBFMKvCj1kaI54fv5dUeXCC
 w3Z0cQI7KUgIC9G12o4e20LMhK31Y/ruV2OLlrHR8RC92AiGe4+vG6VnD02+od2HUpWp
 LQYhalJPFfjPxE7GReKApKvnmOXX/pbHbYz3kEmnA9fnQEH0XTBeRKCSEj5gTjG7vEaF
 VKnpVQHDAMWKbkCGkOPGk8b3xdwQ/gVtHrpi9iVCsxMxM+zX2+3IOftAGghm1AA3Ou3J
 pMFA==
X-Gm-Message-State: AOJu0YwKz3D/4BJUfSBQ8iZZvW8qufxqMM3qESQ+/w4h8lQV3pCmlwH0
 eVcbPapK103ODzC22gvdo5T2ZNBQ/fpJRQ2HKhwmCFA0ixd0IiE5k7Pmp7TWmlFAsEH+YDHDc7b
 RhCrG7YI=
X-Gm-Gg: ASbGncvylRy5SAzIYMKGiXE6XvJnw6aY+3HU01bNWxeHCqisUbWFVK7NCrRHsJlY8H4
 8OnbKaNXUS2pJrBCCsaTx6olYAQiglTh+owFLB49wC9UoRbLYljhnjubhmdaJM/eqZNBvhyrhjO
 wbn45XBU2hJXMr5TV2rTOyws6oHY0PeDD+1k2rMSmci+PnSdph4Vg4FqoETVlgdsrZNfusDQoF+
 cdH8FucMCWCiWMIFw2pMGX4MvKmjtF2oTM+GvrEzPRZoia3pCMzpGXvsFDJQwh1bPG3NXe9N3HS
 4N/kaZNsnCuJSHcWbb5eOAPnvpt2giWKOkzv1XApyDsC3wmC14geGqToX1LIUrbkpiQNuFADZqm
 hDk/6RYM5SjL/k7+jDzTgxf/3RwxtWS0Abrq8CE5gg9Me2xnYjo7Wy5ECni9d0p9rosINXCJhkl
 DKgw==
X-Google-Smtp-Source: AGHT+IHEmN0a/BrXYI5PxVVM9Iw1IG6d3nrHm4Qy5rIW39QUrI4LDwKGcREhNpi1Yh7lmNvvGQeMgA==
X-Received: by 2002:a17:907:94c1:b0:af9:116c:61cf with SMTP id
 a640c23a62f3a-afcb98e90a0mr33197466b.43.1755113186306; 
 Wed, 13 Aug 2025 12:26:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:3fd1:eaf1:73ac:376f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2453396166b.59.2025.08.13.12.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 12:26:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 21:26:05 +0200
Message-ID: <20250813192605.1540321-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
References: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755113186; x=1755717986;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Blxy4HyevyRRHVgsLhuZ0FiHsljJxSdYpyi/FHRDL2k=;
 b=kjCe7XNgzOfe402kOhoDOtK6rqjxtFN9NdT8OqQUHWN6mlfx2u53vIsLrBj99Uf4cf
 0XL8D24NteXGtV3nMiUq3LqhtZLqACZBJng3Q6GgDLGI/jggyJxSiKbJA2kLt+gT2Ph9
 mFTL8cYlGEtWvK6L7kkRi5dGA6XsJpQeb6oJA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kjCe7XNg
Subject: [Buildroot] [RFC v2 5/5] package/cutekeyboard: enable build with Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable building of cutekeyboard with Qt6. With the merge of
QuickControls2 into qtdeclarative, the corresponding Kconfig option has
also disappeared in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v2

 package/cutekeyboard/Config.in       | 13 ++++++++-----
 package/cutekeyboard/cutekeyboard.mk |  6 +++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
index bd661b0cd42e..4f83316644a2 100644
--- a/package/cutekeyboard/Config.in
+++ b/package/cutekeyboard/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_CUTEKEYBOARD
 	bool "cutekeyboard"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
 	help
 	  CuteKeyboard is a Qt virtual keyboard plugin for
 	  embedded applications.
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe995..8181950aac50 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -6,7 +6,11 @@
 
 CUTEKEYBOARD_VERSION = v1.3.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
-CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+ifeq ($(BR2_PACKAGE_QT5),y)
+CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
+else
+CUTEKEYBOARD_DEPENDENCIES += qt6declarative
+endif
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
 CUTEKEYBOARD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
