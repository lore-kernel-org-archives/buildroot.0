Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01BCA0FFF
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32C28412C;
	Fri, 29 Aug 2025 10:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQyJojXYeABf; Fri, 29 Aug 2025 10:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A3F84367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A3F84367;
	Fri, 29 Aug 2025 10:34:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A981BF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E642C84325
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2CxcXsro-JG for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C093E84283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C093E84283
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C093E84283
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so318878866b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463633; x=1757068433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgqKVumg3juEQgEJub5tcwjtn1dAtlswZsTAYZ3J+pc=;
 b=FFQlfaJKmlP1RbeoRJ7ZlFljY6f2AYO9xMkSNzs0lQUzvBdhTPBqWx53mtHpzc3elZ
 iKcyYfxM84gZ88o4lP4FmwTERxA9ySfBwGi1AoZoX3e/vzaWz7QzCCuQvWyXUUId/Tqy
 bC+zyE/OhV2bai9ulxYaelwPycbDsAmiZlITqExKIqNr1E9BXuv8mkkwFegBbLFTIaFK
 ZaZrirSshoq1AGaJKbE8ZmRkLzI4ptPXjHk0G1APArXF10zwsA28lWthN9MIk9OsDKsg
 w6RpON/aLqo9b09YzAzpqBxXGsc29wa7YTNNrYMXkHgOx5rNFs/+HGIFLCFCK2daquRM
 cZwQ==
X-Gm-Message-State: AOJu0YzvoIvl69ODmOkP06KtnMn12VBhSV1sESkCcawU3T1hNWbyP/rS
 anaeDckVPzjCIgkLHIJsTWU5Bcuu2SyuoimYiyTtUe/1OgAnn9xe28+KUhA5lAkjoMB0RQD/VjT
 vVh61dCc=
X-Gm-Gg: ASbGnctbO8rd56DEmwTTrtzYuAj6+F4ikzIPFyx/vjMdhcg7pD7z3uRMsHsK+VR//p6
 ZcEVCfA1l/iyaQy/dJk1ez8sfop40P1wT4W7jvTkBkqt0grJVxpsP8GoaSUsfG0oW7gjwOim+rg
 XxZFJDWFJriW8aiPZCNL2Ht9rwUdIIW3Je3lmrutRLwMLpcLrTaqB4DBcS+L2ATq+fXFToQ8csd
 9PyBtcFixJJx0epTJzk1zkwumuQsKIyA1l1cygsSxEkqChm3JE8IJrbwdcUZYw/mim80sSugxkS
 DHCo/A7wLR8UNZhLHepoitW83RBJ0g+pvAg3C2/gUCl8lmdTtFHRLSCvGTMp7p5ndHnEfb1GXon
 LVrDMYvAa4X//8nIzXyQuOe0tPT7KhA/0W6uvtiBSdl4A79EDAQHDNy4wIPCa2NPxLs9GIKTo
X-Google-Smtp-Source: AGHT+IHGQCwxvU7wzPikgnw30CPAd1kkz7Bjce4D5Y+qVOUyBSukubw+fip/cRzBbQ5UCyaMlLcEeQ==
X-Received: by 2002:a17:907:1c9a:b0:ae3:d100:a756 with SMTP id
 a640c23a62f3a-afe296a7293mr2687585966b.56.1756463632619; 
 Fri, 29 Aug 2025 03:33:52 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:39 +0200
Message-ID: <20250829103340.158873-14-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463633; x=1757068433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgqKVumg3juEQgEJub5tcwjtn1dAtlswZsTAYZ3J+pc=;
 b=QE/JFHwS2pmN5d9sO8qlq5sM5vFIFU764/jZlXlpzk5GWMvWmMo46stM5KO1ITU/JJ
 RrsP3p/qFHQf7zXnlofwAQPLKG+nIjEKW5EGC835/rS2UYJywcqsPcSwuZ+D13en41l7
 ZSAp91Fnar3ZFO22PA3ZW4Z7RLv/HrHmhfX3jKP9VOeTjf1cD08qZRZImm5SPzpOZZKf
 nmX9Bm1ROzDcVTA6bZgYgyUd1cBX9JshXHYtFPeO7ioAPh4g0Htvd/nLUH0hekCd+j2o
 E5URBjBHxhuI7up5SPP9ICDF9Xn7oMAh7+UH3wt0czvki9V01ZxUhdo0AzTVRCDvtTAY
 MyXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QE/JFHwS
Subject: [Buildroot] [PATCH 14/15] package/jsmin: remove package
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

This package is no longer maintained and better alternative to minify
JavaScript exists since.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy             | 14 ++++++++++++++
 package/Config.in            |  1 -
 package/Config.in.host       |  1 -
 package/jsmin/Config.in      | 11 -----------
 package/jsmin/Config.in.host | 11 -----------
 package/jsmin/jsmin.hash     |  3 ---
 package/jsmin/jsmin.mk       | 29 -----------------------------
 7 files changed, 14 insertions(+), 56 deletions(-)
 delete mode 100644 package/jsmin/Config.in
 delete mode 100644 package/jsmin/Config.in.host
 delete mode 100644 package/jsmin/jsmin.hash
 delete mode 100644 package/jsmin/jsmin.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c8b4675059..aa104e5a70 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_HOST_JSMIN
+	bool "host-jsmin has been removed"
+	select BR2_LEGACY
+	help
+	  JSMin is no longer maintained and better alternative
+	  exists since then.
+
+config BR2_PACKAGE_JSMIN
+	bool "jsmin has been removed"
+	select BR2_LEGACY
+	help
+	  JSMin is no longer maintained and better alternative
+	  exists since then.
+
 config BR2_PACKAGE_VUEJS_ROUTER
 	bool "vuejs-router has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index fbb18d5f9f..45434f411a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,7 +1892,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/jsmin/Config.in"
 endmenu
 
 menu "JSON/XML"
diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13..b47f4392b4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,7 +57,6 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
-	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
 	source "package/llvm-project/lld/Config.in.host"
diff --git a/package/jsmin/Config.in b/package/jsmin/Config.in
deleted file mode 100644
index d0948b8914..0000000000
--- a/package/jsmin/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_JSMIN
-	bool "jsmin"
-	help
-	  JSMin is a filter which removes comments and unnecessary
-	  whitespace from JavaScript files. It typically reduces
-	  filesize by half, resulting in faster downloads. It also
-	  encourages a more expressive programming style because it
-	  eliminates the download cost of clean, literate
-	  self-documentation.
-
-	  http://www.crockford.com/javascript/jsmin.html
diff --git a/package/jsmin/Config.in.host b/package/jsmin/Config.in.host
deleted file mode 100644
index 25ec9bb859..0000000000
--- a/package/jsmin/Config.in.host
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_HOST_JSMIN
-	bool "host jsmin"
-	help
-	  JSMin is a filter which removes comments and unnecessary
-	  whitespace from JavaScript files. It typically reduces
-	  filesize by half, resulting in faster downloads. It also
-	  encourages a more expressive programming style because it
-	  eliminates the download cost of clean, literate
-	  self-documentation.
-
-	  http://www.crockford.com/javascript/jsmin.html
diff --git a/package/jsmin/jsmin.hash b/package/jsmin/jsmin.hash
deleted file mode 100644
index cc4490557b..0000000000
--- a/package/jsmin/jsmin.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  aae127bf7291a7b2592f36599e5ed6c6423eac7abe0cd5992f82d6d46fe9ed2d  jsmin-1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
-sha256  b420f61778af09534adc836a5086f5625b8499124051c50baefa218e7c03a58c  jsmin.c
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
deleted file mode 100644
index 84c39a7b42..0000000000
--- a/package/jsmin/jsmin.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# jsmin
-#
-################################################################################
-
-JSMIN_VERSION = 1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b
-JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
-JSMIN_LICENSE = MIT
-JSMIN_LICENSE_FILES = jsmin.c
-
-define JSMIN_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
-endef
-
-define JSMIN_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
-endef
-
-define HOST_JSMIN_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
-endef
-
-define HOST_JSMIN_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/bin/jsmin
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
