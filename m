Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF5CA1005
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24F160B6E;
	Mon,  1 Sep 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orPdc6HtfUE1; Mon,  1 Sep 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C577E6141F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C577E6141F;
	Mon,  1 Sep 2025 20:32:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8DFD2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB0F409A5
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh253jAM2jpQ for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4B3F40212
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4B3F40212
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4B3F40212
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b04163fe08dso298211966b.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758769; x=1757363569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SSie2DvEC8aGt7yKTAVRQPP/EjwDwwbFMlKAoB2DOk=;
 b=UwX2oiadj135YNNlGJSSmegT/AUuPL3CocIUeCWh+AZJEJpq1xAolbOHWqHibXF+Ci
 aND/BfsU8EvqRErGfxrffkwQ5qbF+qG6hqq4V3d1QjnPhMIzQRVDa1/SKtvY0IkSJA1y
 o/LG/jtt0DbMsw/OCaz0hMGj5HnL5+nU1/6Q0QwdUzxbgFivL7AIsxLHzmiFGiB6N0BN
 iC+fjTbQqZgJ71X84SG1e1vUqRX4qYQGdwPNMOq5C3hEHEES/i/iwYRyNURR36Wa0+R0
 oPHpEzRNef765XiGwXLFhLrXoEvE26hoyxNGYhr4a31wnDLcG9Qc1QvvJ+HvcAR8HU5f
 aIlw==
X-Gm-Message-State: AOJu0Yzao5WMhY/tsk805ndMQaQHU4rwr8hV1j9fiGae2y28SzX2WFMS
 keFiAyzTXMePjpLfEk8PCKUs9NxxY++F+FE4mSs+qAgULMIDmWhccPfwogpwPRqLmyub6OrU1KZ
 /ttux
X-Gm-Gg: ASbGncuRx84V5bcPHdtzQGAsBA6rP5aUORVY3mZp6GVRTSEhuIMvYegtrfXEw2F4umw
 UPHmBIa7D14iUSZNsafxQp6jkKkQn5v+6O7/FK4t7rY2je8TNhXxivbuPO56Co7tBdIHp/Kgdw0
 iRqdPFwZdLB0WVl/Ri9larqzlZ3tIrf3Y/FSAo3sYCVZLLEQe21DW2fDoafKWlYPaJlXltzTAvO
 DPrcFMMCHVPbgk4UC1RzB1sE5a8ANd+jFHCi6PGJP5RQc93mKjfmYf8LZMFLHTf6+DFAkQclLs8
 evn4asQjPayy5+11SPBktMEpwaCeKAZFfyRzpziKtElXoeOK7YvSwO+TFPrkgKfDh5ewUa4Wuzc
 pp0X580+vGH49o3xbTKNIcDDfuXCHaDCIyzWzm/wRb8+WAM8nKygY8Npt6cyWRRZ2Hr7prGZt/D
 ox8OZtvD7DDzwtL1EMjeNR+w==
X-Google-Smtp-Source: AGHT+IG5RX6XUguRlK7voVvAl+GhlWG9ZsK09ByXfbnXJ+8+vXRi5lUsOxRtoGI/7GP+e5fwgRqTDg==
X-Received: by 2002:a17:907:9712:b0:afe:b781:e893 with SMTP id
 a640c23a62f3a-b01d9793548mr945078766b.43.1756758768672; 
 Mon, 01 Sep 2025 13:32:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm553530166b.79.2025.09.01.13.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 13:32:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 22:32:08 +0200
Message-ID: <20250901203210.804061-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
References: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758769; x=1757363569;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SSie2DvEC8aGt7yKTAVRQPP/EjwDwwbFMlKAoB2DOk=;
 b=q+/e5N8wSoTty3kUa/CRRcw58eGeqwr6Sr1E0ivpJAsRxDx0CBssyWDHNpxn/hHxNs
 zgX40is9ZfK6IelXWJSA+BXSOv5QbyK2D2nJnvk/JCw/QAYc92LBNYeDS1gb6O/LuqdC
 PvZVWZF5KrU2jsb+R2JYegEWHQp6Zks8kGt7I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=q+/e5N8w
Subject: [Buildroot] [RFC v4 3/5] package/pkg-qmake: support Qt6
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
 Richard Genoud <richard.genoud@bootlin.com>,
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
