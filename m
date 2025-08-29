Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307CACA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0312684384;
	Fri, 29 Aug 2025 10:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaajoCKe2ply; Fri, 29 Aug 2025 10:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A212B84360
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A212B84360;
	Fri, 29 Aug 2025 10:34:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A9366C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C94D41261
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSUJdshfbzt6 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB312404DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB312404DB
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB312404DB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afec5651966so347622566b.2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463632; x=1757068432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VAv5cAtPdOqjgIJ6mYJZ3y1E3VZVvWF4htB1feYelSc=;
 b=QQToyWkM3mPo1qoQtLKn0/AGm5ufBKQZhdLnm5TCnHf/bOhJusDJvzuQYJUl3eOq6a
 8Pwd/Fh+pVNueFezbmDi384b8LozkrrcCtlgO1sF/TqYXz7QaVRrcFJT6n1QxWz7lqPh
 giMLtzEw/G/TAWDHWp40P7LZhHzvUKJbS850Q8XxiyFXJjWs2qGbTA8vb5kZL5kEpDsp
 xsTbL4AApqK0aNfc6Ea7YbA3Fj6UA9rpaDv/eGwlHXVsVZ45MP6cD/WNlPQtGKAVCHgg
 UTtM2pS5Ex57qGTbPmc4fWsfCwaRHn2SGJGjkjfK1LAPeUlGkGCxy/PqtlbON7hyucq9
 3HcQ==
X-Gm-Message-State: AOJu0Yy1mONaC5uDCHN7G0Msov4F0npTs9HkWyIHA4ZjZBL97fHnxDaQ
 hTVtENNLJkMo/X9lp4w1VYmNt0EjReeyFcpE2Xjg3cnApMraGa0942oQ366s1S6lQDIEpOHfufh
 2XjonMN8=
X-Gm-Gg: ASbGnct9ws0TbCHeBvHsYJNY52tB/JeqJzP3fJGe0tdv1hdV/s59pQZyhI0GIb2k5pT
 YZXFubcoRfoOG22fRr4rl6Y/IRCPG7HTdZzTbpl5A6PltzoMfr4l5m2ffnf8QdreN+clSMIaq2Z
 iBL6K4htT8ZuVQDNdC47xVTPcYat0lXfCLndiNhaesyfybDqvf0QQOJ++mwYbz8btf+272AOe7m
 3RY8M3BqVL28KjL2iHxVXjIEQrAXVZBrSlMn2CU+0x29ZKIFWxU0dns73qN6uE9QIMyDfl3xWN0
 XW1p4tUtZ3kLdDiesv7uDmkRH8Z8UfyYdPeAMbyFKf9/RUaB2dZ5PeIyy8PQWikhCrLXjXP8M4C
 IgCnnMkECHLbM6Mot9p/kAO7LOT9X6SnoLdJUZLFD11+vQ8ZNJGe8KnDioS90SA==
X-Google-Smtp-Source: AGHT+IEZyyloLcbNxOZcqFDYYMj+TmqfzaYE2iNOYt3BinO1cLSghhneuaux2yfdN1RQ+CJ5fQ1yTA==
X-Received: by 2002:a17:906:eecd:b0:af9:24e7:1c85 with SMTP id
 a640c23a62f3a-afe295c0656mr2828429166b.55.1756463631687; 
 Fri, 29 Aug 2025 03:33:51 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:38 +0200
Message-ID: <20250829103340.158873-13-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463632; x=1757068432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VAv5cAtPdOqjgIJ6mYJZ3y1E3VZVvWF4htB1feYelSc=;
 b=NPgR+lNpUuL8ly7MQGVDv8GX05hRlEvodzZBO7fjr61MlPQ9GeQMPYkI5owHXIKjO9
 u8jJzxMKBA68JjjHwkHxkzH6GjrKFxqSRX9ozcGCJcAhgC8Uk6xFv6yoMKzMWb4gBcfT
 zoYwRdpugGR3whAY21Q/unGZvRKxJaRTMFvZs041SIThYclNwqkyaEhHXBz6jClrvakf
 ypA93c49+WZgmQKMwTv6yOD5en4uv5xm0dmsosEhZVhcxSZLNJsnHpjnriBtIVbrNqUl
 eYo56pDXiSOEH5krF2rusZXYgGhQ5/eG7+jEJkpBKVWg61cP5IM2+soSIc+fzuBi2y2w
 T8BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NPgR+lNp
Subject: [Buildroot] [PATCH 13/15] package/vuejs: remove package
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
 Config.in.legacy                       | 12 ++++++++++++
 DEVELOPERS                             |  3 ---
 package/Config.in                      |  5 -----
 package/vuejs-router/Config.in         |  6 ------
 package/vuejs-router/vuejs-router.hash |  3 ---
 package/vuejs-router/vuejs-router.mk   | 19 -------------------
 package/vuejs/Config.in                |  6 ------
 package/vuejs/vuejs.hash               |  3 ---
 package/vuejs/vuejs.mk                 | 19 -------------------
 9 files changed, 12 insertions(+), 64 deletions(-)
 delete mode 100644 package/vuejs-router/Config.in
 delete mode 100644 package/vuejs-router/vuejs-router.hash
 delete mode 100644 package/vuejs-router/vuejs-router.mk
 delete mode 100644 package/vuejs/Config.in
 delete mode 100644 package/vuejs/vuejs.hash
 delete mode 100644 package/vuejs/vuejs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f15a564bfd..c8b4675059 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_VUEJS_ROUTER
+	bool "vuejs-router has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_VUEJS
+	bool "vuejs has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_VIS_NETWORK
 	bool "vis-network has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e926a3118c..ba91e2b5ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1706,7 +1706,6 @@ F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
 F:	package/erlang-xmpp/
 F:	package/nginx-dav-ext/
-F:	package/vuejs/
 
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
@@ -3183,8 +3182,6 @@ F:	package/starfive-spltool/
 
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
-F:	package/vuejs/
-F:	package/vuejs-router/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
diff --git a/package/Config.in b/package/Config.in
index 9a36930560..fbb18d5f9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1893,11 +1893,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/vuejs/Config.in"
-if BR2_PACKAGE_VUEJS
-comment "External Vue.js plugins"
-	source "package/vuejs-router/Config.in"
-endif
 endmenu
 
 menu "JSON/XML"
diff --git a/package/vuejs-router/Config.in b/package/vuejs-router/Config.in
deleted file mode 100644
index ac79b3ea61..0000000000
--- a/package/vuejs-router/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_VUEJS_ROUTER
-	bool "vuejs-router"
-	help
-	  The official router for Vue.js.
-
-	  http://router.vuejs.org
diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
deleted file mode 100644
index 299ca61649..0000000000
--- a/package/vuejs-router/vuejs-router.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  093fee5133cf82e75d25940d86f58a4e3f194b74262205ff5c1926aed53339c4  vue-router-4.5.1.tgz
-sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
deleted file mode 100644
index a6d9df6dc2..0000000000
--- a/package/vuejs-router/vuejs-router.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# vuejs-router
-#
-################################################################################
-
-VUEJS_ROUTER_VERSION = 4.5.1
-VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
-VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
-VUEJS_ROUTER_LICENSE = MIT
-VUEJS_ROUTER_LICENSE_FILES = LICENSE
-
-# Install .prod.js as .js
-define VUEJS_ROUTER_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vue-router.global.prod.js \
-		$(TARGET_DIR)/var/www/vue-router.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/vuejs/Config.in b/package/vuejs/Config.in
deleted file mode 100644
index 6456d288f9..0000000000
--- a/package/vuejs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_VUEJS
-	bool "vuejs"
-	help
-	  VueJS web application framework.
-
-	  http://vuejs.org
diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
deleted file mode 100644
index 894eaa4874..0000000000
--- a/package/vuejs/vuejs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  afddbe7bb09a00bb23e738c2a5354819bf662955fd4a06abc630a3d1acc41a8b  vue-3.5.16.tgz
-sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
deleted file mode 100644
index 8f5c002548..0000000000
--- a/package/vuejs/vuejs.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# vuejs
-#
-################################################################################
-
-VUEJS_VERSION = 3.5.16
-VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
-VUEJS_SITE = https://registry.npmjs.org/vue/-
-VUEJS_LICENSE = MIT
-VUEJS_LICENSE_FILES = LICENSE
-
-# Install .prod.js as .js
-define VUEJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vue.global.prod.js \
-		$(TARGET_DIR)/var/www/vue.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
