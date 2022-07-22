Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5662EC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6C460C0E;
	Fri, 22 Jul 2022 06:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC6C460C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XN7DCde-Ohr; Fri, 22 Jul 2022 06:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 951AF60B25;
	Fri, 22 Jul 2022 06:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 951AF60B25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 797EC1BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD6860B25
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD6860B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9ePViWaDD-w for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:09:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED2460AB8
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ED2460AB8
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:09:41 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id e1so1884063ils.13
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 23:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bfyll7xXmsn680a1xkTetqIxMfRW3SNeaIZw1UYIQeQ=;
 b=Z+l6/vc7XqH+9ZwVIydNxar2r01NcSIzEFQBaSmul5VMJGHDCF1NC1yCIgN27Ch0of
 HGnErTkBNnLqO22T/DVJRth3QjuqYCFbCKdEy4PeH6LprdXZVe8aUn9GQwnWiUSoZR0/
 oKJAkALCntvn0mPUB46rHOswrZ6mffXsXSAOUIjtp3LKuFSaSsN286aD6Nz8lG51y7K8
 yDEHkJTfLCBthJG70YCHyp1lhmcMY+uZpJ0sDsFSc035tlh+gTed9ePBb/oWOH6NSqf3
 Qd6X4GVFCFo+RKRxaf9cSn+VpkJlaqcGbPZY0J/v3U/CgzOwxr0j8jXxZHzvdSorT2I2
 6gfg==
X-Gm-Message-State: AJIora89NF685kIScgog4SnPpPjZkUEIaUcTBLtMkfTqVjUCjOHD7dnX
 K9NvT35UcBqTG8wxS2bmg5oez8bUODcNeg==
X-Google-Smtp-Source: AGRyM1tLgAFIhwRaytSetsqfQytxBRMWtB0zJzbhC26osYPVNGCjAs+EztdAROJEVQ7VnGwLQB/KTA==
X-Received: by 2002:a05:6e02:20ca:b0:2dc:90fa:af35 with SMTP id
 10-20020a056e0220ca00b002dc90faaf35mr836544ilq.302.1658470180754; 
 Thu, 21 Jul 2022 23:09:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 d3-20020a92d783000000b002dc258e3093sm1476521iln.64.2022.07.21.23.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 23:09:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 00:09:36 -0600
Message-Id: <20220722060936.566534-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bfyll7xXmsn680a1xkTetqIxMfRW3SNeaIZw1UYIQeQ=;
 b=Du7ZeaZ4vtG40rkYm7hXPz6OS/adDTZUMdLIH4hcrdlxD/ytVsV7fp8ArS/+LiV+TH
 5NOXZSj09cQFo8cgl5Q39f0P9aOdWZUTU5i1wNoxkqurjxOzi/AlOtu+t2+FOPGaug9D
 6CJjDDLKu5P6DVHzcph5HxD+qlhTcLmMG3wI/g4s9JtamMnIIUrQZ1F+IFJYWLaWkRFX
 Qqi+5fqxo1NW2jS2s7TsLn+uiII9RJwjylI/ypDP6GG2M8F9rxEcUIhnkdq/VdE2HxIY
 8h6LIUUz34TbnnkQJ8dukcPoFFoNHq7FPn9eKgKZkDof6lhNkEEHmZF4eNZMB5Y88pWZ
 PoMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Du7ZeaZ4
Subject: [Buildroot] [PATCH v3 1/1] package/pkg-meson: use meson to
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
 Samuel Martin <s.martin49@gmail.com>,
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

It appears we need to ensure the cmake prefix path is set for the
meson generated relocatable pkg-config format to work properly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - set pkgconfig to relocatable
  - set cmake pkg-config prefix path
Changes v1 -> v2:
  - update docs
---
 docs/manual/adding-packages-meson.txt         |  4 +-
 .../gobject-introspection.mk                  |  4 +-
 package/pkg-cmake.mk                          |  4 ++
 package/pkg-meson.mk                          | 61 +++++++++++++------
 package/systemd/systemd.mk                    |  4 +-
 5 files changed, 53 insertions(+), 24 deletions(-)

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
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3b1db35fb6..4fa620080d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
+		-DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
 		-DBUILD_DOCS=OFF \
@@ -123,6 +125,8 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)" \
+		-DCMAKE_PREFIX_PATH="$$(HOST_DIR)" \
+		-DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0835e08e3a..de5817d5da 100644
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
@@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
+		--pkgconfig.relocatable \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
@@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) \
-		--prefix=$$(HOST_DIR) \
+		--prefix=/ \
 		--libdir=lib \
-		--sysconfdir=$$(HOST_DIR)/etc \
-		--localstatedir=$$(HOST_DIR)/var \
+		--pkgconfig.relocatable \
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
index 46a4e8de2c..9bb87f8e39 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -746,7 +746,7 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
-SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
@@ -849,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
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
