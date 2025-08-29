Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11781CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E6E8412D;
	Fri, 29 Aug 2025 10:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV5CQWl9ASjT; Fri, 29 Aug 2025 10:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5DE84343
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5DE84343;
	Fri, 29 Aug 2025 10:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 190C6D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C31D615B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W61MBcq_Uivz for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBD1B61567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD1B61567
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBD1B61567
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so318868966b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463628; x=1757068428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7Qxh+pyriD1s6Q188Ofgus8o86E8nCyT2TLwXYBlAY=;
 b=X3GoIV57ithkXZKlCIxTbj/VXK8Th8YUYDKXeygzgqOkD9ynN72mvG1inccp7XF1Ky
 E6NONcdXXlS7ysoqytb9j+M17JgYRQVDwHY+BCByrvdnAgtsRVmRoX95CjPyZUVe1Uh0
 nC/OTxT2wHGYYquaFD4c3db1C//Rr6i67hqbVJrUlmW4seL3wlG/4CqQRSRzFuxwqXNn
 DiourDBSa7QfR2EcChpK5eVzj9Dx4vBjPuqe7mUe4F7ASdu5XPJu0E8oCeTqCLxLAt81
 UwOtOWx35m007+oeGDM199Hr1CetfMUxr1dhOb9tkbKWFVdhh3cJcZQ17wCD3cJENGZv
 CxiQ==
X-Gm-Message-State: AOJu0YyGCuu53HHW9gVd4A9hO+Ewjw3TDzve6it9f+w7b5Ja5uJYa8BR
 cDmnXGybZyocfSz6XbdogYFylU8nr2W8052j9fzGi4yElt/TnesTBq51jm3cyaDYqnUcjs0cnFk
 EnZxiu9E=
X-Gm-Gg: ASbGncvmed2HWGP2jnjovNOnzb83Tc64FkRe9qcF59d+MICsD6cXpDwbkklfCMskZM/
 fgdQ3u8QIeqUq/fLXB67gySwLoAOUE28y4XyvU4qBr7lzNB4RK/fYmXtQqM8uuWdhvG4YSGLrpP
 arUwPJlUICzsNAhFkLspCEDooKO9lPnQhP/biV0bNXtgG7est6qPXsCrEadDREGsT1of5XtzyXr
 iINF1y5y9fv9U/TwYIEzrqpaHEeA/wpJMwN1eLJTWoVzWgqBiHZiGSGHFEUN4DwdgxrqRPrGm1w
 XGkjLUMg0g3rp2HUs9oKCNN5RZwCIK8EPsOnou83wpd8rOKg0xn2Uveq+u4eR0hOT5ofROumsJ2
 Mu3kyLeSwO0uh2GDqXAtxW9pmi9OK2cVC1y3KzZPzA9I2QyPGIIs=
X-Google-Smtp-Source: AGHT+IHzdpOybCzxmfdcesd3asJQdcSXyU119ngy9eLqrjyK9rz2Ztxm1jBL2O93u2kbmaGLA0qvdg==
X-Received: by 2002:a17:907:c1e:b0:aff:117c:c632 with SMTP id
 a640c23a62f3a-aff117cc8camr60283966b.37.1756463627435; 
 Fri, 29 Aug 2025 03:33:47 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:33 +0200
Message-ID: <20250829103340.158873-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463628; x=1757068428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7Qxh+pyriD1s6Q188Ofgus8o86E8nCyT2TLwXYBlAY=;
 b=H4GfPzrbBrAUqBVPIKVkt82jvPmsrQZWrKa3h+zmX4L8+K/b1zbVONfEwCTWftxQgP
 UORHESvVME2cmpqzJvDQIJdW+n9oBYLH+8WZHTL7WvUhDE0wl4r3Xf5oXUUvbin3HN8M
 S+vPu+1eYwLBZktW4o8Xl7wnuH0gd5J5K1wukO9n3Ow4c8JunpbUVbm7yE646YBlK+Yi
 nvnRvfJsI4/RJPazUhL95wQIMMNDMu2pweqrQoRL+iPJ5NytN5jSFVhMBIlrTfluVLhj
 nKM5J3v2GJbGrt1rgXltskZm2bLzKTlQVUcX8Msgh1RWn5zJ4MZycV4fsV5Tmc+IplM3
 Sq8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H4GfPzrb
Subject: [Buildroot] [PATCH 08/15] package/jquery: remove package
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
 Config.in.legacy                              |  54 ++++++++
 DEVELOPERS                                    |   4 -
 package/Config.in                             |  13 --
 package/jquery-datetimepicker/Config.in       |   7 --
 .../jquery-datetimepicker.hash                |   3 -
 .../jquery-datetimepicker.mk                  |  19 ---
 package/jquery-keyboard/Config.in             |   7 --
 package/jquery-keyboard/jquery-keyboard.hash  |   3 -
 package/jquery-keyboard/jquery-keyboard.mk    |  24 ----
 package/jquery-mobile/Config.in               |  25 ----
 package/jquery-mobile/jquery-mobile.hash      |   2 -
 package/jquery-mobile/jquery-mobile.mk        |  47 -------
 package/jquery-sidebar/Config.in              |   6 -
 package/jquery-sidebar/jquery-sidebar.hash    |   3 -
 package/jquery-sidebar/jquery-sidebar.mk      |  17 ---
 package/jquery-sparkline/Config.in            |  12 --
 .../jquery-sparkline/jquery-sparkline.hash    |   2 -
 package/jquery-sparkline/jquery-sparkline.mk  |  21 ----
 package/jquery-ui-themes/Config.in            | 117 ------------------
 .../jquery-ui-themes/jquery-ui-themes.hash    |   3 -
 package/jquery-ui-themes/jquery-ui-themes.mk  |  30 -----
 package/jquery-ui/Config.in                   |   9 --
 package/jquery-ui/jquery-ui.hash              |   3 -
 package/jquery-ui/jquery-ui.mk                |  29 -----
 package/jquery-validation/Config.in           |   8 --
 .../jquery-validation/jquery-validation.hash  |   3 -
 .../jquery-validation/jquery-validation.mk    |  24 ----
 package/jquery/Config.in                      |   8 --
 package/jquery/jquery.hash                    |   2 -
 package/jquery/jquery.mk                      |  22 ----
 30 files changed, 54 insertions(+), 473 deletions(-)
 delete mode 100644 package/jquery-datetimepicker/Config.in
 delete mode 100644 package/jquery-datetimepicker/jquery-datetimepicker.hash
 delete mode 100644 package/jquery-datetimepicker/jquery-datetimepicker.mk
 delete mode 100644 package/jquery-keyboard/Config.in
 delete mode 100644 package/jquery-keyboard/jquery-keyboard.hash
 delete mode 100644 package/jquery-keyboard/jquery-keyboard.mk
 delete mode 100644 package/jquery-mobile/Config.in
 delete mode 100644 package/jquery-mobile/jquery-mobile.hash
 delete mode 100644 package/jquery-mobile/jquery-mobile.mk
 delete mode 100644 package/jquery-sidebar/Config.in
 delete mode 100644 package/jquery-sidebar/jquery-sidebar.hash
 delete mode 100644 package/jquery-sidebar/jquery-sidebar.mk
 delete mode 100644 package/jquery-sparkline/Config.in
 delete mode 100644 package/jquery-sparkline/jquery-sparkline.hash
 delete mode 100644 package/jquery-sparkline/jquery-sparkline.mk
 delete mode 100644 package/jquery-ui-themes/Config.in
 delete mode 100644 package/jquery-ui-themes/jquery-ui-themes.hash
 delete mode 100644 package/jquery-ui-themes/jquery-ui-themes.mk
 delete mode 100644 package/jquery-ui/Config.in
 delete mode 100644 package/jquery-ui/jquery-ui.hash
 delete mode 100644 package/jquery-ui/jquery-ui.mk
 delete mode 100644 package/jquery-validation/Config.in
 delete mode 100644 package/jquery-validation/jquery-validation.hash
 delete mode 100644 package/jquery-validation/jquery-validation.mk
 delete mode 100644 package/jquery/Config.in
 delete mode 100644 package/jquery/jquery.hash
 delete mode 100644 package/jquery/jquery.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1c6b9abdd9..ead8e942da 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,60 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_JQUERY_VALIDATION
+	bool "jquery-validation has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_UI_THEMES
+	bool "jquery-ui-themes has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_UI
+	bool "jquery-ui has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_SPARK
+	bool "jquery-spark has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_SIDEBAR
+	bool "jquery-sidebar has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_MOBILE
+	bool "jquery-mobile has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_KEYBOARD
+	bool "jquery-keyboard has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY_DATETIMEPICKER
+	bool "jquery-datetimepicker has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_JQUERY
+	bool "jquery has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_FORGE
 	bool "forge has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 80171a5e70..60cb2fe051 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3056,8 +3056,6 @@ F:	package/czmq/
 F:	package/filemq/
 F:	package/googlefontdirectory/
 F:	package/jansson/
-F:	package/jquery-ui/
-F:	package/jquery-ui-themes/
 F:	package/json-javascript/
 F:	package/lcdapi/
 F:	package/libfreefare/
@@ -3473,8 +3471,6 @@ F:	package/dhcpcd/
 F:	package/feh/
 F:	package/hostapd/
 F:	package/imlib2/
-F:	package/jquery-datetimepicker/
-F:	package/jquery-sidebar/
 F:	package/kmod/
 F:	package/libftdi1/
 F:	package/libical/
diff --git a/package/Config.in b/package/Config.in
index 40d2a9ef6c..4c560dff1f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,19 +1892,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/jquery/Config.in"
-if BR2_PACKAGE_JQUERY
-menu "External jQuery plugins"
-	source "package/jquery-datetimepicker/Config.in"
-	source "package/jquery-keyboard/Config.in"
-	source "package/jquery-mobile/Config.in"
-	source "package/jquery-sidebar/Config.in"
-	source "package/jquery-sparkline/Config.in"
-	source "package/jquery-ui/Config.in"
-	source "package/jquery-ui-themes/Config.in"
-	source "package/jquery-validation/Config.in"
-endmenu
-endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
 	source "package/jszip/Config.in"
diff --git a/package/jquery-datetimepicker/Config.in b/package/jquery-datetimepicker/Config.in
deleted file mode 100644
index 9da37188ae..0000000000
--- a/package/jquery-datetimepicker/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_JQUERY_DATETIMEPICKER
-	bool "jquery-datetimepicker"
-	help
-	  Use this plugin to unobtrusively add a datetimepicker,
-	  datepicker or timepicker dropdown to your forms.
-
-	  http://xdsoft.net/jqplugins/datetimepicker
diff --git a/package/jquery-datetimepicker/jquery-datetimepicker.hash b/package/jquery-datetimepicker/jquery-datetimepicker.hash
deleted file mode 100644
index 1fbd428e75..0000000000
--- a/package/jquery-datetimepicker/jquery-datetimepicker.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  2f362a8acd149d1487a9460942f135d1037f01ee0cbfecba8c352fa2f79c34c9  jquery-datetimepicker-2.4.5.tar.gz
-sha256  491add640b4678b78571d3b4c0840422b48a5b397e47e2104c1942ff1fce1a68  MIT-LICENSE.txt
diff --git a/package/jquery-datetimepicker/jquery-datetimepicker.mk b/package/jquery-datetimepicker/jquery-datetimepicker.mk
deleted file mode 100644
index e4d47997f1..0000000000
--- a/package/jquery-datetimepicker/jquery-datetimepicker.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# jquery-datetimepicker
-#
-################################################################################
-
-JQUERY_DATETIMEPICKER_VERSION = 2.4.5
-JQUERY_DATETIMEPICKER_SITE = $(call github,xdan,datetimepicker,$(JQUERY_DATETIMEPICKER_VERSION))
-JQUERY_DATETIMEPICKER_LICENSE = MIT
-JQUERY_DATETIMEPICKER_LICENSE_FILES = MIT-LICENSE.txt
-
-define JQUERY_DATETIMEPICKER_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/jquery.datetimepicker.css \
-		$(TARGET_DIR)/var/www/jquery-plugins/datetimepicker/jquery.datetimepicker.css
-	$(INSTALL) -m 0644 -D $(@D)/jquery.datetimepicker.js \
-		$(TARGET_DIR)/var/www/jquery-plugins/datetimepicker/jquery.datetimepicker.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
deleted file mode 100644
index 117c4a5665..0000000000
--- a/package/jquery-keyboard/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_JQUERY_KEYBOARD
-	bool "jquery-keyboard"
-	select BR2_PACKAGE_JQUERY_UI
-	help
-	  Virtual Keyboard using jQuery UI
-
-	  https://github.com/Mottie/Keyboard
diff --git a/package/jquery-keyboard/jquery-keyboard.hash b/package/jquery-keyboard/jquery-keyboard.hash
deleted file mode 100644
index a0d9d7d88c..0000000000
--- a/package/jquery-keyboard/jquery-keyboard.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  6a20a1cdc9367c218048125eeb6f78d775175a964b3b9b781a931b63c0f98c66  jquery-keyboard-1.18.12.tar.gz
-sha256  0ad9a0e7291b45cdb5abe2a517d8b82282a816d41c9224660849792ce01fe983  README.markdown
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
deleted file mode 100644
index 5066aa2c66..0000000000
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# jquery-keyboard
-#
-################################################################################
-
-JQUERY_KEYBOARD_VERSION = 1.18.12
-JQUERY_KEYBOARD_SITE = $(call github,Mottie,Keyboard,v$(JQUERY_KEYBOARD_VERSION))
-JQUERY_KEYBOARD_LICENSE = MIT WTFPL
-JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
-
-define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
-		$(TARGET_DIR)/var/www/css/keyboard.css
-	$(INSTALL) -m 0644 $(@D)/js/jquery.keyboard*.js \
-		$(TARGET_DIR)/var/www
-	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
-		$(TARGET_DIR)/var/www/jquery.mousewheel.js
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/layouts
-	$(INSTALL) -m 0644 $(@D)/layouts/*.js \
-		$(TARGET_DIR)/var/www/layouts
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
deleted file mode 100644
index fa31a3630c..0000000000
--- a/package/jquery-mobile/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-config BR2_PACKAGE_JQUERY_MOBILE
-	bool "jquery-mobile"
-	help
-	  jQuery-Mobile is a unified, HTML5-based user interface
-	  system for all popular mobile device platforms, built on the
-	  rock-solid jQuery and jQuery UI foundation. Its lightweight
-	  code is built with progressive enhancement, and has a
-	  flexible, easily themeable design.
-
-	  http://jquerymobile.com
-
-if BR2_PACKAGE_JQUERY_MOBILE
-
-config BR2_PACKAGE_JQUERY_MOBILE_FULL
-	bool "jquery-mobile development files"
-	help
-	  Installs the development versions.
-
-config BR2_PACKAGE_JQUERY_MOBILE_DEMOS
-	bool "jquery-mobile demo files"
-	help
-	  Installs the demo files.
-	  The main demo page is http://hostname/demos/index.html
-
-endif
diff --git a/package/jquery-mobile/jquery-mobile.hash b/package/jquery-mobile/jquery-mobile.hash
deleted file mode 100644
index 3dfaa07a06..0000000000
--- a/package/jquery-mobile/jquery-mobile.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  7ed156b191dc3e262e3f450aede43adfb738ff0085afed87eb18fe4f43dfc681  jquery.mobile-1.4.3.zip
diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
deleted file mode 100644
index 1171e60d0a..0000000000
--- a/package/jquery-mobile/jquery-mobile.mk
+++ /dev/null
@@ -1,47 +0,0 @@
-################################################################################
-#
-# jquery-mobile
-#
-################################################################################
-
-JQUERY_MOBILE_VERSION = 1.4.3
-JQUERY_MOBILE_SITE = http://jquerymobile.com/resources/download
-JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
-JQUERY_MOBILE_LICENSE = MIT
-
-define JQUERY_MOBILE_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(JQUERY_MOBILE_DL_DIR)/$(JQUERY_MOBILE_SOURCE)
-endef
-
-JQUERY_MOBILE_INSTALLED_FILES = \
-	jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).min.css \
-	jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).min.css \
-	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.css \
-	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.map \
-	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.js
-
-ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_FULL),y)
-JQUERY_MOBILE_INSTALLED_FILES += \
-	jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).css \
-	jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).css \
-	jquery.mobile-$(JQUERY_MOBILE_VERSION).css \
-	jquery.mobile-$(JQUERY_MOBILE_VERSION).js
-endif
-
-ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_DEMOS),y)
-define JQUERY_MOBILE_INSTALL_DEMOS
-	mkdir -p $(TARGET_DIR)/var/www/demos
-	cp -r $(@D)/demos/* $(TARGET_DIR)/var/www/demos
-endef
-endif
-
-define JQUERY_MOBILE_INSTALL_TARGET_CMDS
-	for f in $(JQUERY_MOBILE_INSTALLED_FILES) ; do \
-		$(INSTALL) -m 0644 -D $(@D)/$$f $(TARGET_DIR)/var/www/$$f || break ; \
-	done
-	mkdir -p $(TARGET_DIR)/var/www/images
-	cp -r $(@D)/images/* $(TARGET_DIR)/var/www/images
-	$(JQUERY_MOBILE_INSTALL_DEMOS)
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-sidebar/Config.in b/package/jquery-sidebar/Config.in
deleted file mode 100644
index 324a20c200..0000000000
--- a/package/jquery-sidebar/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_JQUERY_SIDEBAR
-	bool "jquery-sidebar"
-	help
-	  A stupid simple sidebar jQuery plugin.
-
-	  http://jillix.github.io/jQuery-sidebar/
diff --git a/package/jquery-sidebar/jquery-sidebar.hash b/package/jquery-sidebar/jquery-sidebar.hash
deleted file mode 100644
index 5d336fee23..0000000000
--- a/package/jquery-sidebar/jquery-sidebar.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  c96e46439a87555f2200442f597cce64f21f81f94d7601ddfc3b837913ddb42f  jquery-sidebar-3.3.2.tar.gz
-sha256  f3522370f4b6accf9c1344f520bdea35f2388f1cbb124c0c179d2ca2a6a94c76  LICENSE
diff --git a/package/jquery-sidebar/jquery-sidebar.mk b/package/jquery-sidebar/jquery-sidebar.mk
deleted file mode 100644
index 7af3667b62..0000000000
--- a/package/jquery-sidebar/jquery-sidebar.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# jquery-sidebar
-#
-################################################################################
-
-JQUERY_SIDEBAR_VERSION = 3.3.2
-JQUERY_SIDEBAR_SITE = $(call github,jillix,jQuery-sidebar,$(JQUERY_SIDEBAR_VERSION))
-JQUERY_SIDEBAR_LICENSE = MIT
-JQUERY_SIDEBAR_LICENSE_FILES = LICENSE
-
-define JQUERY_SIDEBAR_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/src/jquery.sidebar.min.js \
-		$(TARGET_DIR)/var/www/jquery-plugins/sidebar/jquery.sidebar.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-sparkline/Config.in b/package/jquery-sparkline/Config.in
deleted file mode 100644
index 1741a2941a..0000000000
--- a/package/jquery-sparkline/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_JQUERY_SPARKLINE
-	bool "jquery-sparkline"
-	help
-	  This jQuery plugin generates sparklines (small inline
-	  charts) directly in the browser using data supplied either
-	  inline in the HTML, or via javascript.
-
-	  The plugin is compatible with most modern browsers and has
-	  been tested with Firefox 2+, Safari 3+, Opera 9, Google
-	  Chrome and Internet Explorer 6, 7 & 8.
-
-	  http://www.omnipotent.net/jquery.sparkline/
diff --git a/package/jquery-sparkline/jquery-sparkline.hash b/package/jquery-sparkline/jquery-sparkline.hash
deleted file mode 100644
index d8088bce00..0000000000
--- a/package/jquery-sparkline/jquery-sparkline.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  06e0242da172ab85985db3774c54ac1b53391a5b447857a100c5118b8281a543  jquery.sparkline.min.js
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
deleted file mode 100644
index 683d84f4aa..0000000000
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# jquery-sparkline
-#
-################################################################################
-
-JQUERY_SPARKLINE_VERSION = 2.1.2
-JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
-JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
-JQUERY_SPARKLINE_LICENSE = BSD-3-Clause
-
-define JQUERY_SPARKLINE_EXTRACT_CMDS
-	cp $(JQUERY_SPARKLINE_DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
-endef
-
-define JQUERY_SPARKLINE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SPARKLINE_SOURCE) \
-		$(TARGET_DIR)/var/www/jquery.sparkline.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
deleted file mode 100644
index b372d40b60..0000000000
--- a/package/jquery-ui-themes/Config.in
+++ /dev/null
@@ -1,117 +0,0 @@
-config BR2_PACKAGE_JQUERY_UI_THEMES
-	bool "jquery-ui-themes"
-	depends on BR2_PACKAGE_JQUERY_UI
-	help
-	  Themes for jQuery UI.
-
-	  http://jqueryui.com/
-
-if BR2_PACKAGE_JQUERY_UI_THEMES
-
-choice
-	prompt "theme to install"
-	help
-	  Specify the jQuery UI theme to install.
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE
-	bool "black-tie"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_BLITZER
-	bool "blitzer"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_CUPERTINO
-	bool "cupertino"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_DARK_HIVE
-	bool "dark-hive"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_DOT_LUV
-	bool "dot-luv"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_EGGPLANT
-	bool "eggplant"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_EXCITE_BIKE
-	bool "excite-bike"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_FLICK
-	bool "flick"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_HOT_SNEAKS
-	bool "hot-sneaks"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_HUMANITY
-	bool "humanity"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_LE_FROG
-	bool "le-frog"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_MINT_CHOC
-	bool "mint-choc"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_OVERCAST
-	bool "overcast"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_PEPPER_GRINDER
-	bool "pepper-grinder"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_REDMOND
-	bool "redmond"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_SMOOTHNESS
-	bool "smoothness"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_SOUTH_STREET
-	bool "south-street"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_START
-	bool "start"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_SUNNY
-	bool "sunny"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_SWANKY_PURSE
-	bool "swanky-purse"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
-	bool "trontastic"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
-	bool "ui-darkness"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
-	bool "ui-lightness"
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_VADER
-	bool "vader"
-
-endchoice
-
-config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
-	string
-	default "black-tie"		if BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE
-	default "blitzer"		if BR2_PACKAGE_JQUERY_UI_THEMES_BLITZER
-	default "cupertino"		if BR2_PACKAGE_JQUERY_UI_THEMES_CUPERTINO
-	default "dark-hive"		if BR2_PACKAGE_JQUERY_UI_THEMES_DARK_HIVE
-	default "dot-luv"		if BR2_PACKAGE_JQUERY_UI_THEMES_DOT_LUV
-	default "eggplant"		if BR2_PACKAGE_JQUERY_UI_THEMES_EGGPLANT
-	default "excite-bike"		if BR2_PACKAGE_JQUERY_UI_THEMES_EXCITE_BIKE
-	default "flick"			if BR2_PACKAGE_JQUERY_UI_THEMES_FLICK
-	default "hot-sneaks"		if BR2_PACKAGE_JQUERY_UI_THEMES_HOT_SNEAKS
-	default "humanity"		if BR2_PACKAGE_JQUERY_UI_THEMES_HUMANITY
-	default "le-frog"		if BR2_PACKAGE_JQUERY_UI_THEMES_LE_FROG
-	default "mint-choc"		if BR2_PACKAGE_JQUERY_UI_THEMES_MINT_CHOC
-	default "overcast"		if BR2_PACKAGE_JQUERY_UI_THEMES_OVERCAST
-	default "pepper-grinder"	if BR2_PACKAGE_JQUERY_UI_THEMES_PEPPER_GRINDER
-	default "redmond"		if BR2_PACKAGE_JQUERY_UI_THEMES_REDMOND
-	default "smoothness"		if BR2_PACKAGE_JQUERY_UI_THEMES_SMOOTHNESS
-	default "south-street"		if BR2_PACKAGE_JQUERY_UI_THEMES_SOUTH_STREET
-	default "start"			if BR2_PACKAGE_JQUERY_UI_THEMES_START
-	default "sunny"			if BR2_PACKAGE_JQUERY_UI_THEMES_SUNNY
-	default "swanky-purse"		if BR2_PACKAGE_JQUERY_UI_THEMES_SWANKY_PURSE
-	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
-	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
-	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
-	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_VADER
-
-endif
diff --git a/package/jquery-ui-themes/jquery-ui-themes.hash b/package/jquery-ui-themes/jquery-ui-themes.hash
deleted file mode 100644
index 5f662dad54..0000000000
--- a/package/jquery-ui-themes/jquery-ui-themes.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  90467a83abcb8d2471b0d53d21b4c09e2cf686d5350e10a6e84fa3f3616a840f  jquery-ui-themes-1.10.4.zip
-sha256  ef1fdd608b20fbea7ef269ed03bd24e637717cc193971798a394bf2fa983cd53  MIT-LICENSE.txt
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
deleted file mode 100644
index 5108389a77..0000000000
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# jquery-ui-themes
-#
-################################################################################
-
-JQUERY_UI_THEMES_VERSION = 1.10.4
-JQUERY_UI_THEMES_SITE = http://jqueryui.com/resources/download
-JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
-JQUERY_UI_THEMES_LICENSE = MIT
-JQUERY_UI_THEMES_LICENSE_FILES = MIT-LICENSE.txt
-JQUERY_UI_THEMES_DEPENDENCIES = jquery-ui
-
-define JQUERY_UI_THEMES_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(JQUERY_UI_THEMES_DL_DIR)/$(JQUERY_UI_THEMES_SOURCE)
-	mv $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)/* $(@D)
-	$(RM) -r $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)
-endef
-
-define JQUERY_UI_THEMES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D \
-		$(@D)/themes/$(call qstrip,$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME))/jquery-ui.css \
-		$(TARGET_DIR)/var/www/jquery-ui.css
-	$(INSTALL) -d $(TARGET_DIR)/var/www/images
-	cp -a $(@D)/themes/$(call qstrip,$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME))/images/*.png \
-		$(TARGET_DIR)/var/www/images
-	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
deleted file mode 100644
index fd38997ef6..0000000000
--- a/package/jquery-ui/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_JQUERY_UI
-	bool "jquery-ui"
-	help
-	  jQuery UI provides abstractions for low-level interaction and
-	  animation, advanced effects and high-level, themeable widgets,
-	  built on top of the jQuery JavaScript Library, that you can
-	  use to build highly interactive web applications.
-
-	  http://jqueryui.com/
diff --git a/package/jquery-ui/jquery-ui.hash b/package/jquery-ui/jquery-ui.hash
deleted file mode 100644
index 92bb5312da..0000000000
--- a/package/jquery-ui/jquery-ui.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  5f063f91df85431e3fea84f5d5709726d6dcd15ee4bf86b0e9a4b134912a5efd  jquery-ui-1.13.1.zip
-sha256  de33fb695880d0b07615d4b86f78cd43796906959ade5fdfef70968827a0db78  LICENSE.txt
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
deleted file mode 100644
index 98d150bbf3..0000000000
--- a/package/jquery-ui/jquery-ui.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# jquery-ui
-#
-################################################################################
-
-JQUERY_UI_VERSION = 1.13.1
-JQUERY_UI_SITE = https://jqueryui.com/resources/download
-JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
-JQUERY_UI_LICENSE = MIT
-JQUERY_UI_LICENSE_FILES = LICENSE.txt
-
-define JQUERY_UI_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(JQUERY_UI_DL_DIR)/$(JQUERY_UI_SOURCE)
-	mv $(@D)/jquery-ui-$(JQUERY_UI_VERSION)/* $(@D)
-	$(RM) -r $(@D)/jquery-ui-$(JQUERY_UI_VERSION)
-endef
-
-define JQUERY_UI_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/jquery-ui.min.js \
-		$(TARGET_DIR)/var/www/jquery-ui.js
-	$(INSTALL) -m 0644 -D $(@D)/jquery-ui.min.css \
-		$(TARGET_DIR)/var/www/jquery-ui.css
-	$(INSTALL) -d $(TARGET_DIR)/var/www/images
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/images \
-		$(@D)/images/*.png
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
deleted file mode 100644
index 39e898e853..0000000000
--- a/package/jquery-validation/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_JQUERY_VALIDATION
-	bool "jquery-validation"
-	help
-	  The jQuery Validation Plugin provides drop-in validation for
-	  your existing forms, while making all kinds of
-	  customizations to fit your application really easy.
-
-	  http://jqueryvalidation.org/
diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
deleted file mode 100644
index 31ecd62bcb..0000000000
--- a/package/jquery-validation/jquery-validation.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  52381e080f266f8bca1a17acd6a4a68be4c2606a8b16f8a12e597cc69f2c0584  jquery-validation-1.19.5.zip
-sha256  f398878cab338b869638bdac1aeae76bf3ac11b2b89da6e0b68bc1a645733440  LICENSE.md
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
deleted file mode 100644
index 1ed37ee73b..0000000000
--- a/package/jquery-validation/jquery-validation.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# jquery-validation
-#
-################################################################################
-
-JQUERY_VALIDATION_VERSION = 1.19.5
-JQUERY_VALIDATION_SITE = https://github.com/jquery-validation/jquery-validation/releases/download/$(JQUERY_VALIDATION_VERSION)
-JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
-JQUERY_VALIDATION_LICENSE = MIT
-JQUERY_VALIDATION_LICENSE_FILES = LICENSE.md
-JQUERY_VALIDATION_CPE_ID_VENDOR = jqueryvalidation
-JQUERY_VALIDATION_CPE_ID_PRODUCT = jquery_validation
-
-define JQUERY_VALIDATION_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(JQUERY_VALIDATION_DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
-endef
-
-define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/jquery.validate.min.js \
-		$(TARGET_DIR)/var/www/jquery.validate.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/jquery/Config.in b/package/jquery/Config.in
deleted file mode 100644
index 92f5604270..0000000000
--- a/package/jquery/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_JQUERY
-	bool "jQuery"
-	help
-	  jQuery is a fast and concise JavaScript Library that
-	  simplifies HTML document traversing, event handling,
-	  animating, and Ajax interactions for rapid web development.
-
-	  http://jquery.com
diff --git a/package/jquery/jquery.hash b/package/jquery/jquery.hash
deleted file mode 100644
index 173eb95ffd..0000000000
--- a/package/jquery/jquery.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed hashes, not provided by upstream
-sha256  f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d  jquery-3.5.1.min.js
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
deleted file mode 100644
index 8febed36ca..0000000000
--- a/package/jquery/jquery.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# jquery
-#
-################################################################################
-
-JQUERY_VERSION = 3.5.1
-JQUERY_SITE = http://code.jquery.com
-JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
-JQUERY_LICENSE = MIT
-JQUERY_CPE_ID_VENDOR = jquery
-
-define JQUERY_EXTRACT_CMDS
-	cp $(JQUERY_DL_DIR)/$(JQUERY_SOURCE) $(@D)
-endef
-
-define JQUERY_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SOURCE) \
-		$(TARGET_DIR)/var/www/jquery.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
