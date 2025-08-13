Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA71CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 19:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D66161BB3;
	Wed, 13 Aug 2025 19:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPxOfiUbUewY; Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B9461BAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B9461BAC;
	Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD051B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2581F61BAA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay10yiNRo0tW for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 19:26:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FAC161BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FAC161BA9
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FAC161BA9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b733bbaso313365a12.3
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 12:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755113184; x=1755717984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SSie2DvEC8aGt7yKTAVRQPP/EjwDwwbFMlKAoB2DOk=;
 b=kRBof3HVh7xIituvbWRANClTwmNyObKPgODPt36F8lGbc9/OiZ3sL8mNVFzMfJFOcj
 yUV1RnZ/fTvFzDA16xa/U8FI8QXTo/ifSErNkVbpDtAZgrxY1ns5JQX4qv98dAt5UlrX
 d6I0VTqB9DhvZjssA46br3YyKQx4vwvp77u8Zab4Ox2jHRNzK/ngIg2WzG63gfqcJRyi
 +XMTOF/EcEAkiPs+UoBBLLB+E00UBzIJqUP1saXbvFFhu89qHJQwkvJ1N7eMwPpxOwYp
 zccTFzkEKHABpmjth2KQJbmJ5KpHNMt7ppoGMufXj7o2thY9TPVyd/+M0JKUXn2TiQtV
 c19w==
X-Gm-Message-State: AOJu0YwjPF5eAcpGtIVuTy+uCXrizPfvHgvn12XfJDY8XIHwl0y4pGgV
 fqdHkq58nO/scenPIJU3M1Qnyu/NMK7Zrbf+susrmkCxdL/ptSVz9R3dBgfdufnRuTptsCetypn
 mdvN7pBs=
X-Gm-Gg: ASbGncvR19rm58CESBt8JQRFMKkJ3mFky/Ex0QPUmK5EbkO604r2nTPrrAER46vJNAl
 08f9ik+/JnroeTpMPe0lAqnXU1cLBMCGqLBhrA30iM4Xsm9KExg/75lA90+xFmTY7s2dZGzcluV
 F4JK2U0oyIjY49yJA9LbKLD084X5RQh8g1E0mzHsoBJPMMEAb0YZhbZq7uMvQ0gLDq7ycMIos+V
 T6SYSGZxbIejPf4N3JrcKbL1c/HPVcpY91WY2JyZIRO/q0JfumTsGqBxYqeW/l0En6gfOV3Tk5q
 EvGGeYyMhP5u1dEyo4SkHDgnf2NwnUcecTC0pAhTnwUNHpVW8utoqtnDTYvxB69fTHuZJiCgbwd
 o9UbyfhsZA1C/nXOyySB9hmbtJ3b6saAe6rWQ34DbazFVp+weJ+P47mCfPaJ+Z5KwCxQPjvkkuu
 pmgQ==
X-Google-Smtp-Source: AGHT+IHSLToe++U2lJI72qI8Sae8WxYghyB9/077KSv3n0pdmXDy4rIovR7CDrbY27/N+JEy6/Rd3w==
X-Received: by 2002:a17:907:dac:b0:afc:b61a:df8 with SMTP id
 a640c23a62f3a-afcb98e1861mr29363666b.34.1755113183939; 
 Wed, 13 Aug 2025 12:26:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:3fd1:eaf1:73ac:376f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2453396166b.59.2025.08.13.12.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 12:26:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 21:26:03 +0200
Message-ID: <20250813192605.1540321-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
References: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755113184; x=1755717984;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SSie2DvEC8aGt7yKTAVRQPP/EjwDwwbFMlKAoB2DOk=;
 b=Tzl6ROkw537xutkKx0ybXCtotLz8gZp7JtBqoCBJ2O7pxkGs1Da1DJetAlUZNS8AKT
 mIBN1MLN0VRqLWHrJ4VfucSXy2iQosFr6u0wuI0D8HGoo4qlm4EVvjwAS82yZ6W5LsOf
 Ua9bjoNRBfwcrCCdqd0p7MjlLND81rzoGh4D0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Tzl6ROkw
Subject: [Buildroot] [RFC v2 3/5] package/pkg-qmake: support Qt6
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
