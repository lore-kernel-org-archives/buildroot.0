Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D241C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD766408B0;
	Mon, 27 Feb 2023 10:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD766408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nE1yFcfPABDj; Mon, 27 Feb 2023 10:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA8B408C9;
	Mon, 27 Feb 2023 10:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA8B408C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 282E91BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01B7E60BDB
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B7E60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HZSFqUNs-yl for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:58:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9074F60BB0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9074F60BB0
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:58:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so3048127wmq.1
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qj+OQi8J1U1RtiJWV6dOBCaHmcczpObPUqc48QF7O9M=;
 b=W3iASpfnSneC5BJ3rqsMf5f0sa/BtQmWD+iAWAwyCsR94g52ok1jYruOcTry/zOOMU
 wwzO9b1dLo+DGY+yeH6aUWl5FqOQLUoAEs0WRSEQrb3c6PNVEAbLH1EIFbQ7ks8cW6Kq
 6DgyEuKRz3ihZzypUiT++M3TFdRaymj56ZYwhPOU7qQ2cK5KnNjEhoanhgU/Nl3YC1Uk
 AvYWaOsoI/tXH9Z4ucD37eeo3uycDhqEz7E+Ez3arpiz3XwdOwDWudryVnDscqoIQZ09
 FY/D4ZMeycjANQYepVrPb6YXPCQcVHieh3VAZS4Xa6lxxKmV4CT6/uoWTU052C8u/ZLi
 HUxg==
X-Gm-Message-State: AO0yUKUCHMzhy8h1R21A/mUc1yjTevq+5NUP+Lwotoo4XFpb1H7cEO5K
 /iunxjSwlnuR5jfiPG0rEey3EocsS8/chbTJ
X-Google-Smtp-Source: AK7set9aJVckcZkHMGurr95KVhCjZES6YQrQLVroj43bQnC5w9xvJGU4CmKtbZuWBqlC5mi+Pz7fNA==
X-Received: by 2002:a05:600c:358f:b0:3eb:3104:efef with SMTP id
 p15-20020a05600c358f00b003eb3104efefmr5561620wmq.31.1677495526381; 
 Mon, 27 Feb 2023 02:58:46 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003ea57808179sm12055048wmh.38.2023.02.27.02.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:58:46 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:58:34 +0100
Message-Id: <20230227105838.358916-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Qj+OQi8J1U1RtiJWV6dOBCaHmcczpObPUqc48QF7O9M=;
 b=U/5eGk+Zg861y5F5mhRDE/FfNOfvx4tgIRyxUxeDdW59yNPRv77KOTnx9RFUjMD6Pw
 a+AaprIUFdRTJRjts4lOStqzScd+N5q6/wB0+sTeeWyLRAj6NuAIjY/b4pycB6V4dKPY
 gqRiQ4KtfopvhB1EVLc4VD+1lpOSO8MinL3T3kRhhVEsTGYI93FinBngtILNw63Cuy8K
 I4gDg0/Lhmymjg2s8Fe7i/2WUZ4QioO5ouXr8bkK2ZnVNo3DUAoMz0hZSCIoc9FfBxGu
 GlepXNNGCEKmkSiWjJOL3gFbeqiY8tJZjZ/BjafguFeyadpbc8/OEQZ3qw+lCKWcqA33
 tLKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U/5eGk+Z
Subject: [Buildroot] [PATCH v5 1/5] package/at-spi2-core: bump to version
 2.47.1
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
Cc: Daniel Lang <d.lang@abatec.at>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Daniel Lang <d.lang@abatec.at>

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_47_1/NEWS

- X11 is now optional.
- libxml2 is no longer optional.
- atk and at-spi2-atk have been merged into at-spi2-core.
- atk introspection option added.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
v5: rebased + grouped patches
---
 package/at-spi2-core/Config.in         |  8 ++------
 package/at-spi2-core/at-spi2-core.hash |  4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 20 +++++++++++++++++---
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
index f56c5b93c4..1f6c421777 100644
--- a/package/at-spi2-core/Config.in
+++ b/package/at-spi2-core/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_AT_SPI2_CORE
 	bool "at-spi2-core"
-	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_XORG7 # optionally for X11
 	help
 	  The At-Spi2 Core package is a part of the GNOME
 	  Accessibility Project. It provides a Service Provider
@@ -19,7 +19,3 @@ config BR2_PACKAGE_AT_SPI2_CORE
 comment "at-spi2-core needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-core depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 764e4c3661..4531bf396c 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
-sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.47/at-spi2-core-2.47.1.sha256sum
+sha256  c6ba7c160434edebf09d2936933569c936f6ec972301766f2bdac5a4d418153c  at-spi2-core-2.47.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index f0b019c0ed..e98e779884 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,17 +4,31 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.36
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION_MAJOR = 2.47
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
-AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
+AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 libxml2 \
 	$(TARGET_NLS_DEPENDENCIES)
 AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+AT_SPI2_CORE_CONF_OPTS += -Dx11=enabled
+AT_SPI2_CORE_DEPENDENCIES += xlib_libXtst
+else
+AT_SPI2_CORE_CONF_OPTS += -Dx11=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+AT_SPI2_CORE_CONF_OPTS += -Dintrospection=enabled
+AT_SPI2_CORE_DEPENDENCIES += gobject-introspection
+else
+AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
+endif
+
 AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
