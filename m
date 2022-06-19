Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0142FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 17:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6552A4091A;
	Sun, 19 Jun 2022 17:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6552A4091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNNcdY8F_atn; Sun, 19 Jun 2022 17:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4684440913;
	Sun, 19 Jun 2022 17:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4684440913
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AACEC1BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 818638247F
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818638247F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96t23BZdECng for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 17:34:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B1782457
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3B1782457
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 17:34:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s1so11735163wra.9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 10:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YWNA87hgDd9bTBhGQWh/bgGqTSZqR7zaBYYcOYeBLU=;
 b=J07xdj8bi0HPeuko+7n2s8iwIYSaYsDnlHDdwOnwFao8D3kInjuxX/uls4Bsdt11gK
 wMkq8Qd9mp//1/hcaZRLRTj74CGVrxYTq1L3EOGUUV0mvXwA6oYF4Dv4q4D1l6ZfIrD8
 SqnkhMCSiqXrzqnWVn0B3hSQUkYR/LbbwbbvvfNLRfHzfy9JwHpeI7Ro9kp5Tpo33udf
 trAUz4riz0Ekj/T79ZEtfgkJsQmyN/MVzXnyGAJ5roXWUKD9l/7LmHjjRwncZbj31/Nc
 s0QKYRzY5BuGtTJpfzYhi1Z3cO3xmCqL4AHPNHHGXj8ialPssXf4puUVzpXhDHBLBvKc
 G9hg==
X-Gm-Message-State: AJIora8uhX8W1VNV9wjoglxfs2LnNHtOu0khuj2/x6MEGQ6UYAOwptBx
 OR6fZQzS87yhl9gxo9FOj8G5aHpuT4g=
X-Google-Smtp-Source: AGRyM1uBRUxs6N0dsQ8PcZ8OVroAqNwQV19PRJAsTEgPZBW0jaD+FNG3D9BDXXTsGLw0fpsw273XDA==
X-Received: by 2002:a05:6000:1e0a:b0:210:32e1:3b03 with SMTP id
 bj10-20020a0560001e0a00b0021032e13b03mr19909993wrb.642.1655660094872; 
 Sun, 19 Jun 2022 10:34:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b002102f2fac37sm11054534wrs.51.2022.06.19.10.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 10:34:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 19:32:06 +0200
Message-Id: <20220619173206.812991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YWNA87hgDd9bTBhGQWh/bgGqTSZqR7zaBYYcOYeBLU=;
 b=qLIHOVa4UXPlXLDQFcWJPx8vevjnm82hkSFB+KQ2vwpTkqsL2z7R8eG1Dcwc+nJp22
 YyBQIm6uAxygWOqig+FwBuaObuAWfYgpYKTUKVlp2GGPhGROD0fmus8lOrNahrdXWaAj
 uFaC9JWnETaWxBodxpPcskMYHaX76D2HjXCZ0sQVrMhwUONrW/V4d2MO0tJQHIfIB10M
 1SzGyFllGSmktXSI/B9SZfS8oHlzTNDttii+3RxtZT5rYMK10JqPqzD9lET+n5dETdeG
 Ib9Ag/webpJam0rF8xMgfeXk86fdbCxfOsvL5a9w3/NbzDMweSY/CsoDFJPpATjyTzdx
 Ax5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qLIHOVa4
Subject: [Buildroot] [PATCH 1/1] package/upower: bump to version 0.99.19
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to get latest release
- Switch to meson-package (autotools dropped since version 0.99.14)
- libusb is not a dependency since
  https://gitlab.freedesktop.org/upower/upower/-/commit/64582256a8c75127c3de23f5542c8467e2e9484a
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/upower/upower/-/blob/v0.99.19/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upower/Config.in   |  9 +++------
 package/upower/upower.hash |  4 ++--
 package/upower/upower.mk   | 20 ++++++++++++--------
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/package/upower/Config.in b/package/upower/Config.in
index 612a2b74b9..e2bcdd12c3 100644
--- a/package/upower/Config.in
+++ b/package/upower/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_UPOWER
 	bool "upower"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev
 	depends on BR2_USE_MMU # libgudev
 	depends on BR2_USE_WCHAR # libgudev
 	select BR2_PACKAGE_LIBGUDEV
-	select BR2_PACKAGE_LIBUSB
 	help
 	  UPower is an abstraction for enumerating power devices,
 	  listening to device events and querying history and
@@ -23,7 +21,6 @@ comment "upower needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "upower needs a toolchain w/ threads, wchar, gcc >= 4.9"
+comment "upower needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/upower/upower.hash b/package/upower/upower.hash
index e69ad20cbc..cabce1f558 100644
--- a/package/upower/upower.hash
+++ b/package/upower/upower.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 64b5ffbfccd5bdb15d925777979a4dbee1a957f9eaeb158dc76175267eddbdef  upower-0.99.11.tar.xz
-sha256 c1753877db41d798d63369a825ad9225bbeb5e10a407be5fcd8de96182f1c50d  COPYING
+sha256  e5bda2f5837ee311f5b7b6ec9549b029c88f4958011c6a8f5550b54408ee06ae  upower-v0.99.19.tar.bz2
+sha256  c1753877db41d798d63369a825ad9225bbeb5e10a407be5fcd8de96182f1c50d  COPYING
diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index a6f39d2f46..49aac8c7a2 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UPOWER_VERSION = 0.99.11
-UPOWER_SOURCE = upower-$(UPOWER_VERSION).tar.xz
-UPOWER_SITE = https://upower.freedesktop.org/releases
+UPOWER_VERSION = 0.99.19
+UPOWER_SOURCE = upower-v$(UPOWER_VERSION).tar.bz2
+UPOWER_SITE = https://gitlab.freedesktop.org/upower/upower/-/archive/v$(UPOWER_VERSION)
 UPOWER_LICENSE = GPL-2.0+
 UPOWER_LICENSE_FILES = COPYING
 
@@ -17,16 +17,20 @@ UPOWER_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	libgudev \
-	libusb \
 	udev
 
-UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
+UPOWER_CONF_OPTS = \
+	-Dgtk-doc=false \
+	-Dman=false \
+	-Dsystemdsystemunitdir=/usr/lib/systemd/system \
+	-Dudevhwdbdir=/lib/udev/hwdb.d \
+	-Dudevrulesdir=/lib/udev/rules.d
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-UPOWER_CONF_OPTS += --enable-introspection
+UPOWER_CONF_OPTS += -Dintrospection=enabled
 UPOWER_DEPENDENCIES += gobject-introspection
 else
-UPOWER_CONF_OPTS += --disable-introspection
+UPOWER_CONF_OPTS += -Dintrospection=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
