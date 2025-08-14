Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFE8CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 15:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB0A60BE1;
	Thu, 14 Aug 2025 15:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_El-K4f_Ewc; Thu, 14 Aug 2025 15:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E83460BFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E83460BFF;
	Thu, 14 Aug 2025 15:33:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C596D1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C333340E84
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVfO-wHiKLCL for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 15:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C0EB40DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C0EB40DDD
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C0EB40DDD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so177430466b.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185603; x=1755790403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SSie2DvEC8aGt7yKTAVRQPP/EjwDwwbFMlKAoB2DOk=;
 b=rlfQN/j71TLnULen8xBwp+RClqpMI/kKqkkY/9GhXDNZX/NNkAkDkkRsh+hn2SZycE
 /08uDM56ynPo63jqGdrbMM7o7IEzEISQBTqmY3GKZ24NgEtPGx0996mOFPNCXGoE9daW
 ZDA7uJ6KmzRywDKZUMKV2p8OXTFWuEI4OE5vvOaJy3O+ohYyGZrVcHVgmzdtJbeLoiry
 4Nc9fXVMw8p5o1fCM+zUV0moIDnLtmsxq4mrENjy0nQ2jbk7nUsyd15DbqijFQN3khez
 xd00a+qggSKq/aFdh8D0BUc6xEwlB9Lx7ZScPPGPxrQA4QLnnxEp8ReEZJwqMYfFSFTM
 jUYw==
X-Gm-Message-State: AOJu0Yx/gUNTBfU2VD7dzL9YzXqfbXq3en/EWxua5y0VC37NH7KgitDK
 i6xlBUHotaeAMIT2s69zd4HAvfbbgt0wmRqIEH9GGBGvaeAT3sZHJEePkEoYj66MNRD6IUH6VTT
 uKCkdu/o=
X-Gm-Gg: ASbGncvxNOu33UttCU9CrZc5q0XBdKMgDTeQ0gVAxcFiFfQT+3noiEfJLrrRENaDTdE
 2/BsNts31CZQKy1zzk1izqxbomguRVy87FA9QGsJuPMxmd/yZpojLivyXGjqNGqIbwQlrUbySC+
 lokS5HCOEMZyU07WoOm602dz+zlV8aiJt6bLILm7BfJVw0tWFzatXelqXb/re9SYZc/LFYhqWgF
 fOulCR69tl+sbWVaPIp1am/wduf3epfA9lCPCI1j5zYlCt/SSmPJG708UvdiEesMPArpvNnZAPW
 Zh0OpSZg6L2rid8DlqHSUyfa4YRxgzNyttYvdgaPDIWGlKWSHJWY2rjLJQaAV2zj2gB3k8fQAKy
 pQFB5SRfgVzyV+GU95YXLcExYsCb8OSg8HasnesPmvFGcUH2dt0Mg+kNMEmkuJHUB23iozIk1hV
 Mu
X-Google-Smtp-Source: AGHT+IHDifBBLLcX5h2PqC1i97LBBV3qZbWZoKnJkrUlw14mpb8GDwe0NVc+uwkxQpfzfQw6aOIaRg==
X-Received: by 2002:a17:907:9710:b0:af9:c119:3b4 with SMTP id
 a640c23a62f3a-afcb93be17bmr352138066b.13.1755185602927; 
 Thu, 14 Aug 2025 08:33:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:9b30:e43:d6cd:c58f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2561928966b.101.2025.08.14.08.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 08:33:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 17:32:57 +0200
Message-ID: <20250814153259.6822-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755185603; x=1755790403;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SSie2DvEC8aGt7yKTAVRQPP/EjwDwwbFMlKAoB2DOk=;
 b=kw9I/gTQtI4yh0pQfWIHEfUqDq5uRPeSdoz1rrORnT7wbmXX5/V2820eAm+D4u3jtJ
 v2vNpq657oN5njsO0RMLJECWAw3IoOlWubBb5z3R+knvWEKfHlP0/wZgT/bg8xyhx8P3
 RcgP9RyiFCmG3wQOJUt3nrIAVdFGycT1BDnU4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kw9I/gTQ
Subject: [Buildroot] [RFC v3 3/5] package/pkg-qmake: support Qt6
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
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Extend build support to Qt6.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 package/pkg-qmake.mk | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index ccf78692e885..1449690ca114 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -20,11 +20,22 @@
 #
 ################################################################################
 
+
+ifeq ($(BR2_PACKAGE_QT5),y)
+QT_VERSION = 5.15
+else
+QT_VERSION = 6.8
+endif
+
+QT_VERSION_MAJOR = $(word 1,$(subst ., ,$(QT_VERSION)))
+QT_VERSION_MINOR = $(word 2,$(subst ., ,$(QT_VERSION)))
+QT_BASE = qt$(QT_VERSION_MAJOR)base
+
 #
 # Hook to sync Qt headers
 #
 define QT_HEADERS_SYNC_HOOK
-	sed -e '/^MODULE_VERSION/s/5\.15\.[3456789]/$(QT5_VERSION)/' -i \
+	sed -e '/^MODULE_VERSION/s/$(QT_VERSION_MAJOR)\.$(QT_VERSION_MINOR)\.[3456789]/$(QT_VERSION)/' -i \
 		$($(PKG)_BUILDDIR)/.qmake.conf
 	touch $($(PKG)_BUILDDIR)/.git
 endef
@@ -45,15 +56,15 @@ define inner-qmake-package
 $(2)_INSTALL_STAGING_OPTS	?= install
 $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
 
-ifneq ($(1),qt5base)
-$(2)_DEPENDENCIES 		+= qt5base
+ifneq ($(1),$(QT_BASE))
+$(2)_DEPENDENCIES 		+= $(QT_BASE)
 endif
 
 ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
-$(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
+$(2)_POST_PREPARE_HOOKS += QT$(QT_VERSION_MAJOR)_QT_CONF_FIXUP
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -62,7 +73,7 @@ $(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
 	cd $$($(2)_BUILDDIR) && \
-	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
+	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT$(QT_VERSION_MAJOR)_QMAKE) $$($(2)_CONF_OPTS)
 endef
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
