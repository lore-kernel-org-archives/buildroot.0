Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DEAC61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0ED981F97;
	Thu, 23 Nov 2023 00:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0ED981F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_OgexKvOAt2; Thu, 23 Nov 2023 00:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98D781F11;
	Thu, 23 Nov 2023 00:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D98D781F11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A48201BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E28C41759
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E28C41759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vP4rcMnnNVzk for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:30 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 834234168E
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 834234168E
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b709048d8eso359118b3a.2
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698109; x=1701302909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8dpLcG1C8GkvD494Np/BCvkZmAvaxZaLdcJuJxfw4M=;
 b=tFGToqLEP7XFjVj9AT1AmBko1r2qeMFx3QLklirKYrn3r6H52inK3gPHABwNBH0b7F
 /Wz2PN0BWho44gklxY0flHxD8WFBOz88L/2nggjDCXWHZIXr3hOMZUOzLGDvZ+x85lQF
 sxesNGUmSqyuJz1U/rpzuo826AGucYCo+j9S+XeBBL4AlCxy97Qi0ad35Aska7tBI7n0
 ZRRnWBKOBqoO69QkfqtXFFzRBeiwTc6bdnq95yHf5MdCO88O8xdGzFKJGdeF7BX2rsQm
 MS7JqZ52u2sSyQxdRSCkCffp7OPMqv2g2zcNelWfxgBayIP7i/T5815hHPGy5edkyd5d
 9upw==
X-Gm-Message-State: AOJu0YynI4QPpStQkRQ831B+r0/y7Z3MN65DTzyo2GOUkXEf3ebIVuoo
 jsAARntE5F1nljLxX8k8J/n6X0bBd3lNYh0Hx8g=
X-Google-Smtp-Source: AGHT+IGfb6aj/XatOy/03N08l4BV1DbXwzP+Z47uwuUhSIzeaHRnIpqz14d3rRg4RMVANXw3/ZzjUg==
X-Received: by 2002:a05:6a21:300d:b0:182:119d:2d0e with SMTP id
 yd13-20020a056a21300d00b00182119d2d0emr3288560pzb.20.1700698109429; 
 Wed, 22 Nov 2023 16:08:29 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:10 -0700
Message-ID: <20231123000819.488595-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698109; x=1701302909;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8dpLcG1C8GkvD494Np/BCvkZmAvaxZaLdcJuJxfw4M=;
 b=FpWxu0ICUsUgkuK52hHM5ha2lVNzQdyAv6q6SmVQpYBSBhpKF1l2XCxTZykO/SzbP8
 PPkCuMUCqnBhVZ6x7VQMix0we1YA7BJQiQELaJHcfmUCmqIlrPeohdujxn4+MwHXKxGw
 u0tbccL5keN7MqNUdm3ZxOalKB9b3sgIIeVVA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FpWxu0IC
Subject: [Buildroot] [PATCH/next 04/13] package/fcft: new package
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fcft/Config.in | 52 ++++++++++++++++++++++++++++++++++++++++++
 package/fcft/fcft.hash |  3 +++
 package/fcft/fcft.mk   | 44 +++++++++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 package/fcft/Config.in
 create mode 100644 package/fcft/fcft.hash
 create mode 100644 package/fcft/fcft.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6eec905365..269cb9e765 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/vulkan-tools/
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/dmenu-wayland/
+F:	package/fcft/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
diff --git a/package/Config.in b/package/Config.in
index c203876a84..c40e7ebe2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2222,6 +2222,7 @@ menu "Text and terminal handling"
 	source "package/cli11/Config.in"
 	source "package/docopt-cpp/Config.in"
 	source "package/enchant/Config.in"
+	source "package/fcft/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
diff --git a/package/fcft/Config.in b/package/fcft/Config.in
new file mode 100644
index 0000000000..b65515a3f1
--- /dev/null
+++ b/package/fcft/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_FCFT
+	bool "fcft"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_TLLIST
+	help
+	  A simple library for font loading and glyph rasterization
+	  using FontConfig, FreeType and pixman.
+
+	  https://codeberg.org/dnkl/fcft
+
+if BR2_PACKAGE_FCFT
+
+config BR2_PACKAGE_FCFT_GRAPHEME_SHAPING
+	bool "grapheme-shaping"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	select BR2_PACKAGE_HARFBUZZ
+	help
+	  Enables shaping of individual grapheme clusters
+
+comment "grapheme-shaping needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_FCFT_RUN_SHAPING
+	bool "run-shaping"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_UTF8PROC
+	help
+	  Enables shaping of whole text runs.
+
+comment "run-shaping needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_FCFT_SVG_SUPPORT
+	bool "svg support"
+	help
+	  Enables svg support. This option increases the size of the
+	  library by approximately 55KB.
+
+endif # BR2_PACKAGE_FCFT
+
+comment "fcft needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
new file mode 100644
index 0000000000..239c2e0e6d
--- /dev/null
+++ b/package/fcft/fcft.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  95797f945faf407cb658efe6e5dcf0cc3ab08ef01e159383f9cf7cf5ee257506  3.1.6.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
new file mode 100644
index 0000000000..538d8a0748
--- /dev/null
+++ b/package/fcft/fcft.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# fcft
+#
+################################################################################
+
+FCFT_VERSION = 3.1.6
+FCFT_SOURCE = $(FCFT_VERSION).tar.gz
+FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_LICENSE = MIT
+FCFT_LICENSE_FILES = LICENSE
+FCFT_INSTALL_STAGING = YES
+
+FCFT_DEPENDENCIES = \
+	fontconfig \
+	freetype \
+	pixman \
+	tllist
+
+FCFT_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dexamples=false
+
+ifeq ($(BR2_PACKAGE_FCFT_GRAPHEME_SHAPING),y)
+FCFT_DEPENDENCIES += harfbuzz
+FCFT_CONF_OPTS += -Dgrapheme-shaping=enabled
+else
+FCFT_CONF_OPTS += -Dgrapheme-shaping=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FCFT_RUN_SHAPING),y)
+FCFT_DEPENDENCIES += harfbuzz utf8proc
+FCFT_CONF_OPTS += -Drun-shaping=enabled
+else
+FCFT_CONF_OPTS += -Drun-shaping=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FCFT_SVG_SUPPORT),y)
+FCFT_CONF_OPTS += -Dsvg-backend='nanosvg'
+else
+FCFT_CONF_OPTS += -Dsvg-backend='none'
+endif
+
+$(eval $(meson-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
