Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D4ACA0FFF
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC0184325;
	Fri, 29 Aug 2025 10:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yecJhGPlhz18; Fri, 29 Aug 2025 10:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B514684356
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B514684356;
	Fri, 29 Aug 2025 10:34:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DC8E6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 350966155A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77v4qEpqIGQK for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2116861567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2116861567
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2116861567
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so351850466b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463631; x=1757068431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IFOgKaV2sbdIFQFJcM1mGL4IueP9jQ8a03pUY/0pxA=;
 b=Q8ejSy2adrXIzfvbxw7pm4e54ucX6ANIBY6HXZygKx57a1sonyQp7luhtCLxvA3nVt
 AUNwVd7wWrpB8xcWPJR08PWKmbgS/ngmnJAa3WtYV3GPmGpcZrNnT+l9ljQ+N1tM0jT/
 Eq2RYe5Tnz7gMw/EdjTsSV9/21ML9irl54OXN69JDsHB52AX9eqrrUdJcBEoqtV4MILC
 gHwMfymSbYfkVu3MZL7W1pO27fNBQbWLAqhL91o7XzxdD91jkWswaCWYL5orCepLcN7T
 9UiVosDbdft97bZoy9B46fzw0ETqEHORm54lr87crHqBwbmvd9h8P0xBWbq1GRvM/a2J
 ow9g==
X-Gm-Message-State: AOJu0YxaD838Zmp3LVfjiBni3qThQTaotfG6/HmK4qfqWZ7ueg8xpyqu
 XAaRZ8eI1LnrDbYzJ4Fp1wAh8fPiF7IIC32EVFPcI5EDGba/H4aQJsa+FhtaViE8Qlgn9w3YzFd
 Nrmh1llQ=
X-Gm-Gg: ASbGnctmFSgeub10iMBh2XHp2GMQ0/ho2fteRf68PyKhbHa62y4jkoP286Xpm3ffL9O
 iyYIFgVCtafDL8/aDF7jSMiTVQm7F7eRjczOFlXWvo8A9WbZCCcvxZjj8XbpImERI2vpai0rcmW
 nx2St+WVWbcF+EXol8d1H+n1rAyugFPRPkpRalH8kL3jGcXK9LV+FS4ENxXapuEjjr8YxjWEmtq
 6s5ZOFjivQHYXonPQIJu6zR9SYfvoivZeu8I0tRp+Z4wRJg83dmH47TOJjl59KO3gqOEaVBK1Ug
 lHkIEzKfY5fe3wKU9F6f8bRkwbUeiZyE/vhB181GJWxLSU/T0da+9HEgW1hsV2Pt6UTlBsHKTaM
 HmEYxZdeM27aLLgE++TSN+bxQEJ8mpjAp0CBeUHwHOf6U0GV5eR49SjuzRVdUfg==
X-Google-Smtp-Source: AGHT+IH7cKHqMrktDycaYFTSmCxXw4r3v8GwRdQJRoqlTpEjdIqGsKe4Iu5ijpmHa7Q15ZAEQ9869g==
X-Received: by 2002:a17:906:f2d0:b0:afe:6b42:27a with SMTP id
 a640c23a62f3a-afe6b420d24mr1470453766b.34.1756463630809; 
 Fri, 29 Aug 2025 03:33:50 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:37 +0200
Message-ID: <20250829103340.158873-12-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463631; x=1757068431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IFOgKaV2sbdIFQFJcM1mGL4IueP9jQ8a03pUY/0pxA=;
 b=fjkfRq+1vrUuSPLO1NpN46ti7Xaj2c6sWmp83a636ZwfdA25LKitvIvn1BUXNUc3Mr
 G7ygVxzAmA5rM6lHC8iL3b7hP/PBIRslzfgQYW51l12rcdj/E8ckHN04t2k6I5t3PNKO
 SWbUm3wiqxAprupM4js6yuSD85B4DAzrkSBOBCznEgZOTleNhMwGswFcUnM0OvbsfZN8
 8Ep63WpVhhJ221Rx524vQ2QG/lbyMtgCwwKZgrRzO0pKWI5qYiSmWx1fFLfEUJ+lj7AU
 F5GwYvutb4VTQleqPhybijy8T4UB8sjSNQr8hmZViAZ3V0jO+sdKgiWqNExpoaIpm1rQ
 +wWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fjkfRq+1
Subject: [Buildroot] [PATCH 12/15] package/vis-network: remove package
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
 Config.in.legacy                     |  6 ++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/vis-network/Config.in        |  7 -------
 package/vis-network/vis-network.hash |  4 ----
 package/vis-network/vis-network.mk   | 21 ---------------------
 6 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 package/vis-network/Config.in
 delete mode 100644 package/vis-network/vis-network.hash
 delete mode 100644 package/vis-network/vis-network.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b802d564f8..f15a564bfd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_VIS_NETWORK
+	bool "vis-network has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_OPENLAYERS
 	bool "openlayers has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index bc8ca29c81..e926a3118c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1706,7 +1706,6 @@ F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
 F:	package/erlang-xmpp/
 F:	package/nginx-dav-ext/
-F:	package/vis-network/
 F:	package/vuejs/
 
 N:	John Stile <johns@msli.com>
diff --git a/package/Config.in b/package/Config.in
index b09288cb44..9a36930560 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1893,7 +1893,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
 comment "External Vue.js plugins"
diff --git a/package/vis-network/Config.in b/package/vis-network/Config.in
deleted file mode 100644
index 39e8ac54c5..0000000000
--- a/package/vis-network/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_VIS_NETWORK
-	bool "vis-network"
-	help
-	  Display dynamic, automatically organised, customizable network
-	  views. Network uses HTML canvas for rendering.
-
-	  http://visjs.github.io/vis-network/
diff --git a/package/vis-network/vis-network.hash b/package/vis-network/vis-network.hash
deleted file mode 100644
index 56f141f5f7..0000000000
--- a/package/vis-network/vis-network.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally computed
-sha256  a9f7325cbe28147318476c63f09c1d5c894d2239bfa4b4dd2dfb3dbebb0705d3  vis-network-9.1.0.tgz
-sha256  1509904280a272780fd69c04b858f512cf216f8e3464a0dd98d8f34416feced9  LICENSE-APACHE-2.0
-sha256  1f65085e54c036645082257618db2c7b787e68c3b02485e214ecd09e0834ee8f  LICENSE-MIT
diff --git a/package/vis-network/vis-network.mk b/package/vis-network/vis-network.mk
deleted file mode 100644
index 4a8def37e0..0000000000
--- a/package/vis-network/vis-network.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# vis-network
-#
-################################################################################
-
-VIS_NETWORK_VERSION = 9.1.0
-VIS_NETWORK_SOURCE = vis-network-$(VIS_NETWORK_VERSION).tgz
-VIS_NETWORK_SITE = https://registry.npmjs.org/vis-network/-
-VIS_NETWORK_LICENSE = Apache-2.0 or MIT
-VIS_NETWORK_LICENSE_FILES = LICENSE-APACHE-2.0 LICENSE-MIT
-
-# Install .min.js and .min.css as .js and .css, respectively.
-define VIS_NETWORK_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vis-network.min.js \
-		$(TARGET_DIR)/var/www/vis-network.js
-	$(INSTALL) -m 644 -D $(@D)/dist/dist/vis-network.min.css \
-		$(TARGET_DIR)/var/www/vis-network.css
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
