Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C5CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1608432A;
	Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVz3NIe6ruca; Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25EA841E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25EA841E8;
	Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90540D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7709E40473
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPpNwxvV3gBn for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BF1341261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BF1341261
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BF1341261
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso276888766b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463626; x=1757068426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SphZsqQtOqTXXYwRawlmoUT/bjL+aVAZW3LGxNmfx6Y=;
 b=O/T5J9aYxiGNB1M7yUUL+Qse/6uOjP8BWN/ai44+EB67ZoO4dHZTJ91ciE+RDhdDU4
 ZhncBitKHJnWnjkcKl/DXu0/AjDAr8LKwjTtmZrWnZwYePe1VIsFi1HArwsLAsVgyVr6
 Owc60DUobr1tI8szLtzOjgCHMeDPPdFcTgddlAiru2vPdRtKo8FviuokF3AEOuQpQeOo
 dIK6KTi3nf717OCU8DH8vsHA5i8i7fX3bxB+GIr+GOr0a0cemO+KhYDNsmCJ2NDpi1AF
 W5Q0WIfUfkExN2zNLAdAvTCASKOYEAHvvRuhQ59NZbKEtGkXJ4ddC78OIQwhruY3o2Qb
 RWfQ==
X-Gm-Message-State: AOJu0Yz072LTs8K788EuzOt9fzRsqYicylO04lW5iAGtYgWSW2PMyaw6
 XTcZfJTp3lxPOSwQQpSsL1XMY04dmdFFhfwh9B1bxiDQN3CJHMorJ6jvKlkVqAbOcTlGzJvwuFa
 UEjC/Ne0=
X-Gm-Gg: ASbGncs1BKFYm2g96NIjFK1c7WaTYhKpHUWpu1QCs5re/NvVzk49gH+IcjUeEbL4HW6
 IMTTratYw8oEY/3M8EhkR8vbylvs/Z74VWLDIwBEqtslzSgyoIpW5kyzziAUr4+BQvKQCRToIKv
 U6doTjlZIfQ/Xm6PzsbkRygu5UpCSNBM+oN+wk08JGla2B+ia+sg5QOIDR4U1iwp2QbuCljEZ4J
 oo5rJPvNLlUccCqXm70SHELdZMafxdOMC+CSdU/4aY5FLkFtPPvOsX6oaRRY36B9OYUA8ZZ19/J
 bIrpRpBD+/FC41klxOqZn/Aw059Q0IIBYYpJC5BRtbi4pweAnLTgtZ5fkXpZivl730IWHBGLAmr
 VXVbZE5xNeQDn0a4VMv/aNhig96y5fUSBM7rx1qB9ZIiNSv+A/wA=
X-Google-Smtp-Source: AGHT+IHB4H8uinMBSOLF5QMyIVbwFPrFldx5BsyGhr2cxbZwJEVXkg3gVePSOVTSycaeVXdiDs+ezA==
X-Received: by 2002:a17:907:9623:b0:afe:c099:aeb3 with SMTP id
 a640c23a62f3a-afec099b18dmr965762666b.25.1756463625913; 
 Fri, 29 Aug 2025 03:33:45 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:31 +0200
Message-ID: <20250829103340.158873-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463626; x=1757068426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SphZsqQtOqTXXYwRawlmoUT/bjL+aVAZW3LGxNmfx6Y=;
 b=YEvrTS2cnkzNlUt70FU1SXbbbUZoeXF+ddmPlBLnq5xZc/Vo/trDz7U8TuqpHGjM4b
 WfiB2KKIl0SHIT5/iSBJ8UsWTPqSi7Db8wb8hzKpfjWc5At4XcKMTwuXZtAS57E0ZB5T
 DuzbD7isYlzApwsxiG3+IesNd1BBmeNse0Vnds8Zj9FjDR3IdvtM4sJqPWLYi6Vw1NTa
 j4R+QgIVREn7Cy84Je57W/xOEqgJScqEhhDiLqpRnRTEpp+sgvSNrwH4AInIhQlojAIv
 14+zXzra0dvDwY7Mv+WismTOy9ywvXVPdRaW7V95+falhbvGN19y5ccsKR9SgvQyLzwg
 fZVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YEvrTS2c
Subject: [Buildroot] [PATCH 06/15] package/flot: remove package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Simon Dawson <spdawson@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy       | 90 +++++++++++++++++++++++++++++++++++++++
 package/Config.in      |  1 -
 package/flot/Config.in | 97 ------------------------------------------
 package/flot/flot.hash |  3 --
 package/flot/flot.mk   | 34 ---------------
 5 files changed, 90 insertions(+), 135 deletions(-)
 delete mode 100644 package/flot/Config.in
 delete mode 100644 package/flot/flot.hash
 delete mode 100644 package/flot/flot.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c55961facb..729193f4c5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,96 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_FLOT_TIME
+	bool "flot-time has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_THRESHOLD
+	bool "flot-threshold has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_SYMBOL
+	bool "flot-symbol has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_STACK
+	bool "flot-stack has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_SELECTION
+	bool "flot-selection has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_RESIZE
+	bool "flot-resize has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_PIE
+	bool "flot-pie has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_NAVIGATE
+	bool "flot-navigate has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_IMAGE
+	bool "flot-image has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_FILLBETWEEN
+	bool "flot-fillbetween has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_ERRORBARS
+	bool "flot-errorbars has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_CROSSHAIR
+	bool "flot-crosshair has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_CATEGORIES
+	bool "flot-categories has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT_CANVAS
+	bool "flot-canvas has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_FLOT
+	bool "flot has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_EXPLORERCANVAS
 	bool "explorercanvas has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 3211776e08..2a86c81edc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,7 +1892,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/flot/Config.in"
 	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
diff --git a/package/flot/Config.in b/package/flot/Config.in
deleted file mode 100644
index 404487202c..0000000000
--- a/package/flot/Config.in
+++ /dev/null
@@ -1,97 +0,0 @@
-config BR2_PACKAGE_FLOT
-	bool "flot"
-	select BR2_PACKAGE_JQUERY
-	help
-	  Flot is a pure Javascript plotting library for jQuery. It
-	  produces graphical plots of arbitrary datasets on-the-fly
-	  client-side.
-
-	  The focus is on simple usage (all settings are optional),
-	  attractive looks and interactive features like zooming and
-	  mouse tracking.
-
-	  The plugin works with Internet Explorer 6+, Firefox 2.x+,
-	  Safari 3.0+, Opera 9.5+ and Konqueror 4.x+ with the HTML
-	  canvas tag.
-
-	  http://www.flotcharts.org/
-
-if BR2_PACKAGE_FLOT
-
-comment "flot plugins"
-
-config BR2_PACKAGE_FLOT_CANVAS
-	bool "canvas"
-	help
-	  Flot plugin to render axis tick labels directly to the canvas
-
-config BR2_PACKAGE_FLOT_CATEGORIES
-	bool "categories"
-	help
-	  Flot plugin for plotting textual data or categories
-
-config BR2_PACKAGE_FLOT_CROSSHAIR
-	bool "crosshair"
-	help
-	  Flot plugin for showing crosshairs when the mouse hovers
-	  over the plot
-
-config BR2_PACKAGE_FLOT_ERRORBARS
-	bool "errorbars"
-	help
-	  Flot plugin for plotting error bars
-
-config BR2_PACKAGE_FLOT_FILLBETWEEN
-	bool "fillbetween"
-	help
-	  Flot plugin for computing bottoms for filled line and bar
-	  charts
-
-config BR2_PACKAGE_FLOT_IMAGE
-	bool "image"
-	help
-	  Flot plugin for plotting images
-
-config BR2_PACKAGE_FLOT_NAVIGATE
-	bool "navigate"
-	help
-	  Flot plugin for adding panning and zooming capabilities to a
-	  plot
-
-config BR2_PACKAGE_FLOT_PIE
-	bool "pie"
-	help
-	  Flot plugin for rendering pie charts
-
-config BR2_PACKAGE_FLOT_RESIZE
-	bool "resize"
-	help
-	  Flot plugin for automatically redrawing plots when the
-	  placeholder size changes.
-
-config BR2_PACKAGE_FLOT_SELECTION
-	bool "selection"
-	help
-	  Flot plugin for selecting regions
-
-config BR2_PACKAGE_FLOT_STACK
-	bool "stack"
-	help
-	  Flot plugin for stacking data sets
-
-config BR2_PACKAGE_FLOT_SYMBOL
-	bool "symbol"
-	help
-	  Flot plugin that adds some extra symbols for plotting points
-
-config BR2_PACKAGE_FLOT_THRESHOLD
-	bool "threshold"
-	help
-	  Flot plugin for thresholding data
-
-config BR2_PACKAGE_FLOT_TIME
-	bool "time"
-	help
-	  Flot plugin for handling time axes
-
-endif
diff --git a/package/flot/flot.hash b/package/flot/flot.hash
deleted file mode 100644
index fb7a331975..0000000000
--- a/package/flot/flot.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21  flot-0.8.3.tar.gz
-sha256  52cb566b16d84314b92b91361ed072eaaf166e8d3dfa3d0fd3577613925f205c  LICENSE.txt
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
deleted file mode 100644
index 58e3ff1276..0000000000
--- a/package/flot/flot.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# flot
-#
-################################################################################
-
-FLOT_VERSION = 0.8.3
-FLOT_SITE = http://www.flotcharts.org/downloads
-FLOT_LICENSE = MIT
-FLOT_LICENSE_FILES = LICENSE.txt
-FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
-	$(if $(BR2_PACKAGE_FLOT_CANVAS),canvas) \
-	$(if $(BR2_PACKAGE_FLOT_CATEGORIES),categories) \
-	$(if $(BR2_PACKAGE_FLOT_CROSSHAIR),crosshair) \
-	$(if $(BR2_PACKAGE_FLOT_ERRORBARS),errorbars) \
-	$(if $(BR2_PACKAGE_FLOT_FILLBETWEEN),fillbetween) \
-	$(if $(BR2_PACKAGE_FLOT_IMAGE),image) \
-	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
-	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
-	$(if $(BR2_PACKAGE_FLOT_RESIZE),resize) \
-	$(if $(BR2_PACKAGE_FLOT_SELECTION),selection) \
-	$(if $(BR2_PACKAGE_FLOT_STACK),stack) \
-	$(if $(BR2_PACKAGE_FLOT_SYMBOL),symbol) \
-	$(if $(BR2_PACKAGE_FLOT_THRESHOLD),threshold) \
-	$(if $(BR2_PACKAGE_FLOT_TIME),time) \
-	)
-
-define FLOT_INSTALL_TARGET_CMDS
-	for i in $(FLOT_FILES); do \
-		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js || exit 1; \
-	done
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
