Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431B6C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C94F7403E2;
	Wed, 27 Jul 2022 07:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C94F7403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBZa2-ve5Fe4; Wed, 27 Jul 2022 07:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 795D6403E9;
	Wed, 27 Jul 2022 07:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 795D6403E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD041BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15BAF80D1D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15BAF80D1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 321PCiaEtrXp for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9284C80CE0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9284C80CE0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:16:03 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-10e3852b463so4939326fac.3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 00:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4FXm1EG4PMbzymRaSMO2DmmDJSWqtDn8tDI+9FS3B8=;
 b=DP6vR1NjslW2VkySur62bQ4DnD61EpyiEg4FQC8n3l83GIsl2UwcnPdRV/6kROGN39
 oGos+A2DgNZtAbLeE/DkdciRcUQsmhlySqsKsM/JMPPo3T7ZRGJJqZrAOMrPCvhuXHi8
 JK7LHIVYu3bYygDql+bz49j1ADiDpY9m+y92i7QVtJC+aSZHc8An6vN0/9dm8r1LFqDW
 wdqyHyVclmwM8E7D8VjGEiP9z8P5iVFn1jsbJq1+rBGKv6XqgJyHyMbIfdEZZ4zGtgR0
 rq/PKYi8SIVUKOMrtKelAqYyrNxYDKaB1h2GqUGs9GbEKM1W3FXMG/crtHJKkp/+UZ8z
 Oswg==
X-Gm-Message-State: AJIora+Jie54u31F31RFJgwF5cJUQRVCNHA/7z4Z/zEQ3gPZqyffdmRN
 KLDJwzlsbmcJmjIurBArG8hHkEz43Fb3Bw==
X-Google-Smtp-Source: AGRyM1sbcYpKTr6iItuvwAQ0X/WN9zxHFGCXXa9oaGh+h/PBj4PYqRG80w9wOiavOZy6nb5MzafIWA==
X-Received: by 2002:a05:6870:ac10:b0:10e:43f5:762b with SMTP id
 kw16-20020a056870ac1000b0010e43f5762bmr1396747oab.107.1658906162343; 
 Wed, 27 Jul 2022 00:16:02 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 s6-20020a0568080b0600b0033a6939436bsm6887439oij.9.2022.07.27.00.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:16:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 01:15:57 -0600
Message-Id: <20220727071557.3434892-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727071557.3434892-1-james.hilliard1@gmail.com>
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4FXm1EG4PMbzymRaSMO2DmmDJSWqtDn8tDI+9FS3B8=;
 b=nORrN9QfU/r4kD5lqxc849+5a1UJSQSRMZFmO2Zj4fZE9tzfPH1mZxKXCp47xN7u6/
 NcCHZcz7x0/NYNJ9RaQEkntCJ9Z7h2pVFcP9JecJMupZvjPCv5isaGiXzUknISTESBLT
 JKN/4F7gNzDXACi88yqbVkAKhIF4NEmXdaIKuoKJHUH0q5yrZZ9PoxZfHGf2z1MzpnFW
 v67TVW7K0jHlUqsQugbCjTrYMAzYHGVJV22EBv8CFYddgU1PRLb3FUIafviBVFdvxqLF
 kUoJsyiULbLS2i+AQ9sjyq7FU9xmpbrCYJyEo6NUhB3KIbGq+76h580sBkwvwn9Zvn1g
 Zg8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nORrN9Qf
Subject: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
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

Remove conflicting host-systemd paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - don't set destdir for host install
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
 package/pkg-meson.mk                          | 67 ++++++++++++++-----
 package/systemd/systemd.mk                    |  9 +--
 4 files changed, 57 insertions(+), 27 deletions(-)

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
index 0835e08e3a..ffa1f662a9 100644
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
@@ -156,10 +157,20 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) \
+		--pkgconfig.relocatable \
 		--prefix=$$(HOST_DIR) \
-		--libdir=lib \
-		--sysconfdir=$$(HOST_DIR)/etc \
+		--bindir=$$(HOST_DIR)/bin \
+		--datadir=$$(HOST_DIR)/share \
+		--includedir=$$(HOST_DIR)/include \
+		--infodir=$$(HOST_DIR)/share/info \
+		--libdir=$$(HOST_DIR)/lib \
+		--libexecdir=$$(HOST_DIR)/libexec \
+		--localedir=$$(HOST_DIR)/share/locale \
 		--localstatedir=$$(HOST_DIR)/var \
+		--mandir=$$(HOST_DIR)/share/man \
+		--sbindir=$$(HOST_DIR)/sbin \
+		--sharedstatedir=$$(HOST_DIR)/com \
+		--sysconfdir=$$(HOST_DIR)/etc \
 		--default-library=shared \
 		--buildtype=release \
 		--wrap-mode=nodownload \
@@ -179,13 +190,23 @@ $(2)_DEPENDENCIES += host-meson
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
@@ -196,8 +217,12 @@ endif
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
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
@@ -207,8 +232,13 @@ endif
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
 
@@ -218,8 +248,13 @@ endif
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
index 47aaddf849..6efc8d636f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -749,7 +749,7 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
-SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
@@ -777,10 +777,7 @@ endef
 HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
 	-Dsplit-usr=false \
-	--prefix=/usr \
-	--libdir=lib \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
+	-Drootprefix=$(HOST_DIR) \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
@@ -852,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
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
