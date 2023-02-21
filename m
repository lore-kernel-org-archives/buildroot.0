Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858C7C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 19:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A29D41833;
	Tue, 21 Feb 2023 19:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A29D41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOKeWtFAX9dq; Tue, 21 Feb 2023 19:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BECD541826;
	Tue, 21 Feb 2023 19:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECD541826
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8E301BF362
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BEE24184E
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BEE24184E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DE-QuFKJVne7 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 19:28:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D422441849
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D422441849
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 19:28:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z8so5335918wrm.8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TAngitrQs8zApQqb6vmNokL0oz1AZ1LUtSreGuMnNM0=;
 b=FcQqiYcs+f9w3L0yBqheO67eLXSTh6KYUMAqNR5GESYEh52IqVYC5int/Nl6zL5+b1
 ERKKiiOJlkbtdsPY7RKJhvKFIv8QAcCHfGG3unO4r3l7a2ElfKEc5d/S0GLDtwboNqKY
 TIeWNgYfQshf1b1ZIaVuoBkxNOvqTC/Q5G2aW18mjqxv2OtOL3UjljJmvIqf0XabqiYk
 Z/emHXlwkyfhPrW9DTo/+hsAtnScYOOqygn3u1NkgK/f6DB2CIyqiV57Y3NsSbGAMY6G
 aCMeJlMsWlB7x/P5eLcnrRGrJWfd58zXU0qAp93K6IFF7PDx2KGFglUHpnzIypm9n0LA
 CO8A==
X-Gm-Message-State: AO0yUKWPUCEE01KfzaMqL2VKM3KLHUjOBIVSonL0B/CNYVirhvtHIXoA
 MV2MVpKZproN9ght+jlYbDHEi5xzEjdS81pc
X-Google-Smtp-Source: AK7set+COqBsnSEGkFzGKW9TC2LK7UUwmkZBtZGCRSW9o7jjYyUHW70NCFBcsXtAaZZE/9Gi5QWbeA==
X-Received: by 2002:adf:f94d:0:b0:2c5:4c7c:6aad with SMTP id
 q13-20020adff94d000000b002c54c7c6aadmr4913102wrr.8.1677007698467; 
 Tue, 21 Feb 2023 11:28:18 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b002c56a991971sm8748163wrq.76.2023.02.21.11.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 11:28:17 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 20:28:00 +0100
Message-Id: <20230221192802.4117856-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221192802.4117856-1-thomas.devoogdt@barco.com>
References: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
 <20230221192802.4117856-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAngitrQs8zApQqb6vmNokL0oz1AZ1LUtSreGuMnNM0=;
 b=flhznSvn7ayACC8YGD4u4IvHMiytyvOjNIySu5H5KOz28vnzjsGH6Ryht1nkw5U3vl
 8/ROLqr/EXtDRD7dzWaMKwxRkJ0ymxh75mtn0ItEdtGbwOB5/cS68czrrTwh5AE2f+QJ
 TpEu9f8oULHGQi4UAJaF9hbRJ/mVP7ZZ0fxKkGd8VY/aBxPNWliiDmHlT3rTfwl80NSH
 K85W8DA8rtnO4YPjnWmkLeBA9elSRig9O0lMrz70h/aNORyQia7HariqA2lz2ZHTqglU
 Gpcs/kEuG39f/WmLWVtyOdt/HvRVzR3pnG3EiUsPwoIBVTABilyvnT1en19AGqiKNa/i
 aEVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=flhznSvn
Subject: [Buildroot] [PATCH v3 2/4] package/at-spi2-atk: remove package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Daniel Lang <d.lang@abatec.at>

at-spi2-atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-meson-add-tests-option.patch         | 43 -------------------
 package/at-spi2-atk/Config.in                 | 22 ----------
 package/at-spi2-atk/at-spi2-atk.hash          |  5 ---
 package/at-spi2-atk/at-spi2-atk.mk            | 19 --------
 7 files changed, 7 insertions(+), 91 deletions(-)
 delete mode 100644 package/at-spi2-atk/0001-meson-add-tests-option.patch
 delete mode 100644 package/at-spi2-atk/Config.in
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.hash
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7f69462f2e..0de7e6e6d6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_AT_SPI2_ATK
+	bool "at-spi2-atk removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_AT_SPI2_CORE
+	help
+	  at-spi2-atk is now part of at-spi2-core.
+
 config BR2_KERNEL_HEADERS_6_0
 	bool "kernel headers version 6.0.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..9530c4cfb2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1612,7 +1612,6 @@ F:	support/testing/tests/package/test_avocado.py
 F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
-F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/clang/
 F:	package/earlyoom/
diff --git a/package/Config.in b/package/Config.in
index 6c5238a9b0..fe64b2a8e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1553,7 +1553,6 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
-	source "package/at-spi2-atk/Config.in"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
diff --git a/package/at-spi2-atk/0001-meson-add-tests-option.patch b/package/at-spi2-atk/0001-meson-add-tests-option.patch
deleted file mode 100644
index 3a2aefa090..0000000000
--- a/package/at-spi2-atk/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 466d04a57b32417dbf2d5e818af1b7593af5f802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 May 2020 10:29:36 +0200
-Subject: [PATCH] meson: add tests option
-
-Add tests option to allow the user to build at-spi2-atk without tests,
-it is especially useful as one of the test requires libxml-2.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/at-spi2-atk/-/merge_requests/22]
----
- meson.build       | 4 +++-
- meson_options.txt | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9fce5d6..61bc93d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -61,4 +61,6 @@ install_data('at-spi2-atk.desktop',
- 
- subdir('droute')
- subdir('atk-adaptor')
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 24c9228..a4abdc2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,3 +2,7 @@ option('disable_p2p',
-        description: 'Disable peer-to-peer DBus connections',
-        type: 'boolean',
-        value: false)
-+option('tests',
-+       description: 'Whether to build tests',
-+       type: 'boolean',
-+       value: true)
--- 
-2.26.2
-
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
deleted file mode 100644
index 9a7cfde0af..0000000000
--- a/package/at-spi2-atk/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_AT_SPI2_ATK
-	bool "at-spi2-atk"
-	depends on BR2_PACKAGE_XORG7 # at-spi2-core
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The At-Spi2 Atk package contains a library that bridges
-	  ATK to At-Spi2 D-Bus service.
-
-	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
-
-comment "at-spi2-atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-atk depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
deleted file mode 100644
index 9c564c32af..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-atk/2.34/at-spi2-atk-2.34.2.sha256sum
-sha256  901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0  at-spi2-atk-2.34.2.tar.xz
-
-# locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
deleted file mode 100644
index 232b577230..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# at-spi2-atk
-#
-################################################################################
-
-AT_SPI2_ATK_VERSION_MAJOR = 2.34
-AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
-AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
-AT_SPI2_ATK_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
-AT_SPI2_ATK_LICENSE = LGPL-2.1+
-AT_SPI2_ATK_LICENSE_FILES = COPYING
-AT_SPI2_ATK_CPE_ID_VENDOR = gnome
-AT_SPI2_ATK_INSTALL_STAGING = YES
-AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
-AT_SPI2_ATK_CONF_OPTS = -Dtests=false
-
-$(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
