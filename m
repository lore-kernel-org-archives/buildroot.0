Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13116C433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 08:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59702401F8;
	Sun, 23 Oct 2022 08:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59702401F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCTz2SwFgZA2; Sun, 23 Oct 2022 08:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 503734016A;
	Sun, 23 Oct 2022 08:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 503734016A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4EA1BF5B3
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 08:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2585F60AF4
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 08:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2585F60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtLRY2bMHLRX for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 08:52:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E32C560864
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E32C560864
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 08:52:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k8so2426337wrh.1
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 01:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WoYT6vJRbIQPLwCHAcH0mfjorESw8kd2g1taex5npKw=;
 b=STKbW1wUCicwwKHmHAQKw/TdpBm5AP/ERqvDe1I+5LcqCq2F9KOTwNM7O+eZ/Vb49O
 RLcgnGXHq45HyXZftrIo7yKa2RW/J2ZU5at2iahVt+0C0PN/oc+VisPkyAaLnMuvrlAS
 Gt6gG+F4A5TrpGixq+p0eWu2bq+CwaNj6HQDm7syVVVbHgrRRMoyXzmMr7d9L2NJLuf6
 +jMsxY2N5ECPY9yRvQIxC5KuKoQvGuJGhRzTT1o6zY8CAI4Bs+4wTPcSGcVM8GlpGybY
 IZb4LcfTz7lEcbqBv07/xoiAZRIyCqfyKfvwFI0xzquXO9SyobU4IpaVV+UnP5OOownu
 7qLw==
X-Gm-Message-State: ACrzQf0D4eE183KM6dVgPzG1uxu0LoioBJFDMAlh9dPUs4mq8iVcPdVy
 okVJ6mB2Cy9eUyxjbV5Y3q52mAvLhyg=
X-Google-Smtp-Source: AMsMyM4gWhoiVUyYwNPdgFV5smApH1vUniuAlpKanLE3rUWp4OICtDFYj27OIvrwb6FUHgSWFcqaJg==
X-Received: by 2002:a05:6000:1866:b0:22f:2616:5613 with SMTP id
 d6-20020a056000186600b0022f26165613mr16971911wri.145.1666515175416; 
 Sun, 23 Oct 2022 01:52:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6505000000b0023655e51c33sm3512806wru.4.2022.10.23.01.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 01:52:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 10:52:51 +0200
Message-Id: <20221023085251.8723-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WoYT6vJRbIQPLwCHAcH0mfjorESw8kd2g1taex5npKw=;
 b=cFcaF9aioK6hLym+sKZWXYkGmH402Qn7OPE1LVE3g7Kg7yADg3msJtf095YqGdnW0J
 wl+IwDBodQgEu/DjCawVkHFp5wlqQ3mje2IS+ZLyCiMADS1a5Wg3bY18NyViMKegQbqT
 QLbnQxgJsgjXdD/6XUEGrCuYfC1G3TeN7SmFm5hUNYB1Zb3J+ayWsyL7Fhaav1SUg/kc
 Wd9ybgS0YOdoUdBd0FLArua1vhp7Bc0gXbV+jOxOgDEgOcCFTtrzY0yLJFuA89qNOXie
 jCNGdCcKOCoZAFg8MWeLr9HhK+UqEtht3h/KKEEhVS15nHXB5Rq7XG5uSQfAqho7tLSN
 FyVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cFcaF9ai
Subject: [Buildroot] [PATCH v3, 1/1] package/usbredir: bump to version 0.13.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

usbredirserver was dropped by
https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819

Add an option to enable tools (and usbredirect binary) as a replacement
to usbredirserver

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Peter Seiderer):
 - Add libglib2 dependency
Changes v1 -> v2 (after review of Peter Seiderer):
 - Add an option to enable tools

 Config.in.legacy               |  8 ++++++++
 package/usbredir/Config.in     | 18 +++++++++++++-----
 package/usbredir/usbredir.hash |  4 ++--
 package/usbredir/usbredir.mk   | 22 ++++++++--------------
 4 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..17f0858e70 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_USBREDIR_SERVER
+	bool "usbredirserver removed"
+	select BR2_LEGACY
+	help
+	  usbredirserver has been dropped by upstream since version
+	  0.13.0. usbredir tools (which include usbredirect binary) can
+	  be used as a replacement.
+
 config BR2_KERNEL_HEADERS_5_17
 	bool "kernel headers version 5.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 8ce180a884..3e2e32568d 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -15,18 +15,26 @@ config BR2_PACKAGE_USBREDIR
 	  protocol.
 
 	  Note: only the library is installed, not the utilities. Say
-	  'y' below if you want the server too.
+	  'y' below if you want the tools too.
 
 	  http://www.spice-space.org/page/UsbRedir
 
 if BR2_PACKAGE_USBREDIR
 
-config BR2_PACKAGE_USBREDIR_SERVER
-	bool "usbredirserver on target"
+config BR2_PACKAGE_USBREDIR_TOOLS
+	bool "Enable tools"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  If you want to serve usbredir requests on your target, say
-	  'y' here to have the usbredir server on the target.
+	  'y' here to have the tools built and installed on the target
+	  (including usbredirect binary).
 
-	  Note: the server is not required to use the library.
+	  Note: the tools are not required to use the library.
+
+comment "tools needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index f738c36690..577e08efba 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,5 @@
-# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
-sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
+# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
+sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 6792a3e758..325e7313aa 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.12.0
+USBREDIR_VERSION = 0.13.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
@@ -14,21 +14,15 @@ USBREDIR_DEPENDENCIES = host-pkgconf libusb
 USBREDIR_CONF_OPTS = \
 	-Dgit_werror=disabled \
 	-Dstack_protector=disabled \
-	-Dtests=disabled \
-	-Dtools=disabled
-
-ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
+	-Dtests=disabled
 
+ifeq ($(BR2_PACKAGE_USBREDIR_TOOLS),y)
 USBREDIR_LICENSE += , GPL-2.0+ (program)
 USBREDIR_LICENSE_FILES += COPYING
-
-else # BR2_PACKAGE_USBREDIR_SERVER != y
-
-define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
-endef
-USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
-
-endif # BR2_PACKAGE_USBREDIR_SERVER
+USBREDIR_DEPENDENCIES += libglib2
+USBREDIR_CONF_OPTS += -Dtools=enabled
+else
+USBREDIR_CONF_OPTS += -Dtools=disabled
+endif
 
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
