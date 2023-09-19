Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EFCCD3438
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 04:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E128822C7;
	Tue, 19 Sep 2023 04:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E128822C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiHqketk5V3Y; Tue, 19 Sep 2023 04:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF97822C5;
	Tue, 19 Sep 2023 04:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF97822C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2D601BF969
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 04:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA70360A8C
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 04:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA70360A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBQVuYAZk6gL for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 04:22:43 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D375360F0C
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 04:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D375360F0C
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7926b7f8636so130408539f.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 21:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695097361; x=1695702161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMbrCUCDNfB5ngA379qE9V2CYaKixMUJoTBWO0auiNk=;
 b=ThG4YT1BV29mGak+GCHxfgsxA2YsAaid/FOZdfCMnm7Z9qhp763cFo4QiVxM6jG8qS
 J83dHzfODKYa6o/vaChGfpLY8XE1PoHXbnpYu+0Q+ZgXrW052boRzY7ua+bMe7LFCBL2
 SONPDLKiODU1p8egDn1rtitZNMftiCFFcPhwIl1wNwhy0SNzG0Oexk9Zn44qDNOnr9nY
 L8CzxU2+3QBO6T2zSgLX+rRfMbMXhgCtqgY/K6MALSxpty6uFkCxldElsjtALCVzp310
 k5BlkDuRtf3+J6KoIYN7utVyV6O4YBAr8FszkQfx78Kuk/DfrwhTAOtrXGPfyzwq9vLn
 Kgng==
X-Gm-Message-State: AOJu0YwzE1m5Odhu3hRQDZ3QAZQrFF3yIS7B630UO8eXe7p/V6WXgR2I
 viWSzp/B4rgSccUXlLXdKgfe+p8YUoN9Rw==
X-Google-Smtp-Source: AGHT+IHP7uN6j5SsRf1o/OPtzMGQ8gjdDKlQL7vtGXDN/Vzw5HXoaio7miOKR3+9GtYfpG9R/UjLcw==
X-Received: by 2002:a05:6602:2154:b0:783:727a:8e15 with SMTP id
 y20-20020a056602215400b00783727a8e15mr1667010ioy.6.1695097361396; 
 Mon, 18 Sep 2023 21:22:41 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5e8c01000000b0078647b08ab0sm3249141ioj.6.2023.09.18.21.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 21:22:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:22:36 -0600
Message-Id: <20230919042236.557974-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695097361; x=1695702161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aMbrCUCDNfB5ngA379qE9V2CYaKixMUJoTBWO0auiNk=;
 b=F+Cc6uZfNGAAykoC1x+AYWH0YgAJihrccyHOExeoys+5y/fTuTQJ+BNYpiu8cO0IaI
 e5UayJYW7vW7lVQVec5ZLGCYzfSYAcYkTgKwB9j1gLWbVRNNrLJrGiSCfRSyvcI8XUnN
 BJb0sHYylXksyiAOcIC+w1uAReNaUFL2gdeiVKd43iE5QIZsNEb78QKSzilxb7NOll8x
 m6st5GZFTJWPZWLNAMpIkArbViniB2MVDblYTSEMAidwd2G/G3vORQo2+udzth6H0QA4
 dVqvdPH9S0SQgOAylo0LQlHP8q/gC+jWthWsYtmX0RivRItCAI9GawA8MT+Ii1RP97IH
 bYHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F+Cc6uZf
Subject: [Buildroot] [PATCH v2 1/1] package/swupdate: add embedded lua
 handler config option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are able to configure most swupdate options using a swupdate
config file, however the embedded lua source option may need to point
to a buildroot generated source path.

To simplify configuration of this swupdate option add a buildroot
config option which will pass a source file path to swupdate when
enabled in buildroot. We also need a config option to enable this
feature in swupdate which the source file path config option will
depend on.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - pass path via make opts instead of kconfig
---
 package/swupdate/Config.in   | 12 ++++++++++++
 package/swupdate/swupdate.mk | 22 ++++++++++++++++------
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 7d9fc90e10..4e3573569b 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,6 +60,18 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER
+	bool "swupdate embedded lua handler"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  Enable the embedded lua handler.
+
+config BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER_SOURCE
+	string "swupdate embedded lua handler source"
+	depends on BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER
+	help
+	  Path to the embedded lua handler source.
+
 config BR2_PACKAGE_SWUPDATE_USB
 	bool "swupdate usb"
 	depends on BR2_PACKAGE_SYSTEMD
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ea4a5a62e5..5abdf7cb34 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -27,6 +27,12 @@ SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 # we don't package EFI Boot Guard/libebgenv
 SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
 
+SWUPDATE_MAKE_OPTS = \
+	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
+
 # swupdate bundles its own version of mongoose (version 6.16)
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
@@ -113,6 +119,15 @@ define SWUPDATE_SET_LUA_VERSION
 	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
 endef
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
+ifeq ($(BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER),y)
+define SWUPDATE_SET_EMBEDDED_LUA
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUASCRIPTHANDLER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HANDLER_IN_LUA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EMBEDDED_LUA_HANDLER)
+endef
+SWUPDATE_MAKE_OPTS += CONFIG_EMBEDDED_LUA_HANDLER_SOURCE=$(BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER_SOURCE)
+endif
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
 endif
@@ -217,14 +232,9 @@ endif
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-SWUPDATE_MAKE_OPTS = \
-	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))" \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
-	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
-
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
+	$(SWUPDATE_SET_EMBEDDED_LUA)
 	$(SWUPDATE_SET_SYSTEMD)
 	$(SWUPDATE_SET_WEBSERVER)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
