Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05AFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 04:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DB860E71;
	Tue, 26 Jul 2022 04:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DB860E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3bwidcaov8J; Tue, 26 Jul 2022 04:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD90560E86;
	Tue, 26 Jul 2022 04:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD90560E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 352761BF2B1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 04:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C8C160E7E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 04:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C8C160E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-aISL-dVck6 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 04:44:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D9C60E71
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5D9C60E71
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 04:44:34 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v185so10406437ioe.11
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 21:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0rh3NBCrsHtE9a/FDMmTCRAfoiSmDFOB5vaA0e3QKw=;
 b=hliwldsRJJXC/JYiHaMh5oRL8HOafF9XjkqGQzSmPMtCqdMROsuFqklownG0n4KqWq
 b3OGkHxuf7x9u+4f+64cuAZA1WzwEVVqLYiBkltrKXYZGsLAJzqvHmTEzwalJxaf5t7O
 MfYgQ8xSGEckfzDdJQRG4O0T8v3acBPNwDsi3Tkr0+jzsihceKeH6NRoI4MzRNbDttjm
 +q9eDFyROpQIVVuo88T+WAPlB2WPAu6oASaJLrccNIfxCdbifqNnIWM1zls24sHGBYPR
 YAywptwj5lA/32Mtkt7O2Nuhceup0hX2HkMsT+qWsu1eH6JtZl1etfjeJjIa1M6Vaixw
 v5Mg==
X-Gm-Message-State: AJIora81A3Ac9oTpIE2YEvN2LC14a/7U4rMTleNGFVR1rVrzs3IhZ1qI
 4OMH88WKlXjmTr+kovM4TFV6JJuW4XW60g==
X-Google-Smtp-Source: AGRyM1uQG3PiYVbD711PYGKplig/mNSVL9pWstX3apNs/FDqHfXDLY58EoRd2WxZ2UEg8yaRh+4Vvg==
X-Received: by 2002:a05:6602:2c8f:b0:67c:308a:ce26 with SMTP id
 i15-20020a0566022c8f00b0067c308ace26mr5193430iow.94.1658810673483; 
 Mon, 25 Jul 2022 21:44:33 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 d39-20020a0285aa000000b0033f07b375b8sm6303775jai.52.2022.07.25.21.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:44:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 22:44:25 -0600
Message-Id: <20220726044425.72570-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726044425.72570-1-james.hilliard1@gmail.com>
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0rh3NBCrsHtE9a/FDMmTCRAfoiSmDFOB5vaA0e3QKw=;
 b=BlbAAea+71eJ496wDLf1LnV7DYIWuRbpn2MD+Vt9iL4H2IDRUVUx6OgODP1qb8FMHX
 mkjn65hRKd3e1hszWi8+Uah/xft3qeQ7s+OtxKLN+pYbMM7eWJTDRKfziUR5etMccgsA
 X8Y5hqf46KIU4Q4YUjt7cJ+Af1rJN6ydItrgZdLfHebwt5rZiHcI29xLXuIpKY40l1F/
 jmBKNbkbz+HrrC5gjqT9P1YoBgrkuts61dwaqidbg63nh6WFjtgVM1QQ8KVUd5843OZd
 p2BizLjMaTHqH8xNAwJoa+f8KLoKBzzb0lE7WlqyOEfNIZ9TPvlalNpgecODUV7BY1lc
 /ijA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BlbAAea+
Subject: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of version 0.54.0 meson has had the ability to build and install
packages rather than having to run ninja directly as before.

This will allow us to use features such as meson install tags in
the future which require meson to be used for the installation.

Note that we've removed FOO_NINJA_ENV which may cause issues
in the unlikely event an external package uses it.

We need to set --pkgconfig.relocatable so that pkg-config files are
not generated with absolute paths which cause issues with per-package
directories.

Note that we need to avoid setting HOST_DIR in paths when configuring
as these will get appended to the destdir during installation which
will result in incorrect paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - split out cmake fix
  - cleanup config vars
  - clearify commit message
Changes v2 -> v3:
  - set pkgconfig to relocatable
  - set cmake pkg-config prefix path
Changes v1 -> v2:
  - update docs
---
 docs/manual/adding-packages-meson.txt         |  4 +-
 .../gobject-introspection.mk                  |  4 +-
 package/pkg-meson.mk                          | 61 +++++++++++++------
 package/systemd/systemd.mk                    |  4 +-
 4 files changed, 49 insertions(+), 24 deletions(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 029c8c2488..c8aed65c2f 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -125,8 +125,8 @@ will therefore only use a few of them.
   +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
   +pkg_config_libdir+.
 
-* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
-  +ninja+, meson companion tool in charge of the build operations. By default,
+* +FOO_MESON_ENV+, to specify additional environment variables to pass to
+  +meson+, meson tool in charge of the build/install operations. By default,
   empty.
 
 * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 41d64171a7..ea5100247d 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -30,14 +30,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
 	host-python3
 
 # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
-GOBJECT_INTROSPECTION_NINJA_ENV += \
+GOBJECT_INTROSPECTION_MESON_ENV += \
 	CC="$(TARGET_CC)"
 
 # When building, gobject-introspection uses tools/g-ir-scanner to build several
 # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
 # links to the system-installed libglib2 path. To remedy this issue, defining
 # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
-HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+HOST_GOBJECT_INTROSPECTION_MESON_ENV += \
 	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0835e08e3a..1123e3b904 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -21,13 +21,13 @@
 ################################################################################
 
 #
-# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
+# Pass PYTHONNOUSERSITE environment variable when invoking Meson, so
 # $(HOST_DIR)/bin/python3 will not look for Meson modules in
 # $HOME/.local/lib/python3.x/site-packages
 #
-MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
-NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
-NINJA_OPTS	= $(if $(VERBOSE),-v)
+MESON              = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
+MESON_BUILD_OPTS   = $(if $(VERBOSE),-v)
+MESON_INSTALL_OPTS = --no-rebuild
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
 ifeq ($(BR2_arcle)$(BR2_arceb),y)
@@ -136,6 +136,7 @@ define $(2)_CONFIGURE_CMDS
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
 	$$(MESON) \
+		--pkgconfig.relocatable \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
@@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) \
-		--prefix=$$(HOST_DIR) \
+		--pkgconfig.relocatable \
+		--prefix=/ \
 		--libdir=lib \
-		--sysconfdir=$$(HOST_DIR)/etc \
-		--localstatedir=$$(HOST_DIR)/var \
+		--sysconfdir=etc \
+		--localstatedir=var \
 		--default-library=shared \
 		--buildtype=release \
 		--wrap-mode=nodownload \
@@ -179,13 +181,23 @@ $(2)_DEPENDENCIES += host-meson
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+	$$(TARGET_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		compile \
+		$$(MESON_BUILD_OPTS) \
+		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+	$$(HOST_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		compile \
+		$$(MESON_BUILD_OPTS) \
+		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 endif
@@ -196,8 +208,13 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+	$$(HOST_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		install \
+		$$(MESON_INSTALL_OPTS) \
+		--destdir $$(HOST_DIR) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
@@ -207,8 +224,13 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+	$$(TARGET_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		install \
+		$$(MESON_INSTALL_OPTS) \
+		--destdir $$(STAGING_DIR) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
@@ -218,8 +240,13 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+	$$(TARGET_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		install \
+		$$(MESON_INSTALL_OPTS) \
+		--destdir $$(TARGET_DIR) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 47aaddf849..42d53422aa 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -749,7 +749,7 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
-SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
@@ -852,8 +852,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-python-jinja2
 
-HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
-
 # Fix RPATH After installation
 # * systemd provides a install_rpath instruction to meson because the binaries
 #   need to link with libsystemd which is not in a standard path
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
