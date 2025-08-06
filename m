Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0D1C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 11:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B84383C8B;
	Wed,  6 Aug 2025 11:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id risOt-r5LB2s; Wed,  6 Aug 2025 11:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E04845CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E04845CB;
	Wed,  6 Aug 2025 11:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD7131
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3346F414E5
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCxoEOhHg4zN for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72280414B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72280414B5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72280414B5
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so5841972f8f.2
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 04:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754481199; x=1755085999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3A8T3go1kMZqLquCA73NL1gpnU9RCDFAIwiJjewnio=;
 b=Fy8OZ1XDcqZWp7T5X3wA/1mAxbXYDfIEs1UgRQbsCas9QaALIzQ8B/lqZR7kBPOofR
 Q1ZwAEtc7ZAh18sgI/v7FIZMbMk80O3fj3MBd/ny2BS1zl2hgMej3qUFpI+xwVm86K/e
 hHXoR2Wj709O+tJzVhBZOj83GA4Xr6KQE8WF21XbaXBW6HaQPI3/dTXEGgL3mh9yhdWo
 1/O6hsK2dk6I8Zgq8xqeabRqNFwDCw9qQdU0/AnyZPbPolxZuzxLnOb/aTzQop7qJjSj
 G5WQZ3yted0Jd+BzdW8ww6hfbjeNXvSakaeFrF9NblrRUx0jmGCNtQdvSqmkZ8ChlXgy
 N//Q==
X-Gm-Message-State: AOJu0YzXs3CNBIjbodlmKn9/f69n77snXmAPYd9bjL8qDX5JgvEUdaNr
 fXf5gu6QtYEpk67DC/C8TvBdMVh2XEv7dDMNhLWQ9UZSMZGpcd6lOuDFlUiNsEdzfxGIcAghl2q
 u2vGS
X-Gm-Gg: ASbGnct7ZLnLvAMixmYOT5uJDxL40Aroed3ydzudFQ6p7Q5UblWyDUQDFuJ8mRRWzRU
 eJDutcxyAsBSRhOLh/5YzzU8sFQmmN7v5a78Q1C50wW1p/rYsO/CcgdaTpqoP6F+R1F3GSNBv76
 Rf7UJePBSL0QMh7llVGfYbTcG58d54kLo9Qv/OMuTRtkPWfrE0l5j7jVzeX4RKJARfJmwNuef2H
 8/c9kk0epFTooXMMUWQvmZhiqR40j2JMtSA9o0u1Z7MVj10Z9f8omIfUMwZJBRJ1X8l+YlkNtc1
 ZUxaDX3QBlze4eEbsGQhu9Td1wqMrv2YPoGxXhPpF6KWp12sVRMwzuYHNqGJC0RZ3Si1lDKz+7l
 QR3jDazxnEAQTuirqJPEq6qhwtBpl3dznbVVLpk3cEJNuubMLOWklWvC++e/zNr59RLVR8ils1r
 ZgoH5lDH4C/h8Vr941ng==
X-Google-Smtp-Source: AGHT+IFh2EhYzAjdO4mQCwLc+0epIPkqs2F2mn5jBX54w5t0VanbqB/xCx4Wed8CIiIAO2CslYne4g==
X-Received: by 2002:a5d:5d07:0:b0:3b8:893f:a185 with SMTP id
 ffacd0b85a97d-3b8f41b8ae2mr2221230f8f.53.1754481199110; 
 Wed, 06 Aug 2025 04:53:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:3f96:8759:f916:8982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm142606555e9.22.2025.08.06.04.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:53:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 13:52:18 +0200
Message-ID: <20250806115219.3307438-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
References: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754481199; x=1755085999;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3A8T3go1kMZqLquCA73NL1gpnU9RCDFAIwiJjewnio=;
 b=a20MeaK+EfD65idt6m4qbys7DL7m7mV8fO1ZoE/Lpx2oTs+MPKUX/ASOl+N1+86+U4
 03WXYVChstxxG6gIyd5stzKyAuyn3a1PB8nhFEqDSgWvfZmeKx7JKLBy2FXUJ67rpxFg
 5AphFkCqJEEnsGoLRuiAscBtb/IovSRaFFgHY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=a20MeaK+
Subject: [Buildroot] [RFC PATCH 3/4] package/pkg-qmake: support Qt6
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
