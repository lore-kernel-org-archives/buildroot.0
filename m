Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8DCCCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 06:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ED4883E21;
	Sun, 19 Oct 2025 06:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxNZTYf-90Sm; Sun, 19 Oct 2025 06:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342C183E77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342C183E77;
	Sun, 19 Oct 2025 06:45:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D426343F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4238610EE
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDQDo4Nse_1J for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 06:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.41;
 helo=mail-ej1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A82961089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A82961089
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A82961089
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b00a9989633so704270766b.0
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 23:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760856314; x=1761461114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ub/BkdVLPLpq/GbzSoAjiW/QxFpOAocXfQe85lLHAU4=;
 b=ialTDwroX7nUSmCbqetix1hWmlB1KmZR15JSmPgTvv6CjtMjxHWyKmxv+V7scGsuiT
 vu6bNwyWEdK0U29hUlpH9BTc+f/SNoGdfvGBdLAa+xIvGpV9WKNDNHsAIkF1pODa1DZ5
 kb00Em0WskF0Yg7mgA1FrY4zDlHTr4ZcBE/J1119rdY/46XJFy4eDbYVnW3CELqc6Env
 szxTvkixOPoXWYzgU+sWMOkXl3bXNSjEWpsSL2a/sGnVgSRYm7Cs/lW4fpXBmqjnj1DE
 OsSIn4aw8tpXUt4pB1B0yk+FENUTv3S1BjG2U2q17aVS11MXvmv6rBnU/y6sAmqt8aFj
 vfrw==
X-Gm-Message-State: AOJu0YyFFI5lZ+t8ifgmxgW/d0J0OR9K0r/5grWaEQhmaVpMsnMmHTpr
 HznIBOufm8yBIPb6b0kBKYMogmp7hB6KazdAF3UutFGTcZxdIWdRpEW/
X-Gm-Gg: ASbGncuAsrEMrl3GOYx9Eu12iK0/G889XIKIdx7V+j9VihZtQe2FZvlcbHPLmj3etMZ
 EFv2RR3G9Of12mW/VAGLpIeyeNGREs71uYBpSHPME1+jO9ThSbvHf63Bb62yMBEeYrsmcHOv2qV
 BKKH+ZR599R1RSw+j8XJCTnonEd9F9o7j1hTLDpkHG+A2qn6d7yJbEi/DbjbkYXQEl+Y7qFYKfG
 r2osFSEzSFQnuALfC0cMz+6cSbPaeTrryRlDbv2ZXqr75eO1LYk54P+bb+pmXrQ968NnpXj+1R1
 Ic2+iv5dwKridrgPJd7+i6QFLvr7kfFpLBbw06R1ASOWZSOWoodAeq+kUF56W3dlOC5NRj8uaK5
 gUqtTOpU5nV6I8TEkSJejNxabWM8qfxGbbDqSRIEMq7FlDqA21IKQjdqHUIZK14iQ0R+1K9S6lw
 zV29ws/7CNzknYz7iRkVqLaBy8iFxBC6ITWdb1PxQvUSgIqn+T1ZHFIKLjQXAITdt3OJaSILdyk
 rUxUNV8
X-Google-Smtp-Source: AGHT+IFzCIAFGW6WoK1Wld0+Ur6XbBEMKwsN2kvTKP2wkOtsQTQnX1SYjqOEFEoU4WPu2TyRxn6uvg==
X-Received: by 2002:a17:907:3992:b0:b40:c49b:709 with SMTP id
 a640c23a62f3a-b605249d84dmr1558070866b.8.1760856313771; 
 Sat, 18 Oct 2025 23:45:13 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:c79:d46a:26fa:5c6e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b65eb525f48sm434706466b.60.2025.10.18.23.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 23:45:13 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, eric.le.bihan.dev@free.fr,
 fontaine.fabrice@gmail.com, guillaume.chaye@zeetim.com
Date: Sun, 19 Oct 2025 08:45:03 +0200
Message-ID: <20251019064503.2583945-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019064503.2583945-1-thomas@devoogdt.com>
References: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
 <20251019064503.2583945-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v6] package/librsvg: bump version to 2.61.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a major update, which replaces autotools with meson.
The package uses cargo in the background, so copy the relevant
environment from the cargo package to get things working.

Note that the download URL has been changed because cargo
vendoring needs .tar.gz for it's post_process_unpack.

Announcement (for what it's worth):
 - https://gitlab.gnome.org/GNOME/librsvg/-/releases/2.61.1

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
cat libgtk4.config
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_LIBGTK4=y

./utils/test-pkg -p libgtk4 -c libgtk4.config -a
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: SKIPPED
                    bootlin-armv5-uclibc [ 4/35]: SKIPPED
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: OK
                bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/35]: SKIPPED
             bootlin-microblazeel-uclibc [10/35]: SKIPPED
                bootlin-mipsel32r6-glibc [11/35]: SKIPPED
                   bootlin-mipsel-uclibc [12/35]: SKIPPED
                 bootlin-openrisc-uclibc [13/35]: SKIPPED
        bootlin-powerpc64le-power8-glibc [14/35]: OK
           bootlin-powerpc-e500mc-uclibc [15/35]: SKIPPED
                   bootlin-riscv32-glibc [16/35]: SKIPPED
                   bootlin-riscv64-glibc [17/35]: SKIPPED
                    bootlin-riscv64-musl [18/35]: SKIPPED
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: SKIPPED
                   bootlin-sparc64-glibc [21/35]: OK
                    bootlin-sparc-uclibc [22/35]: SKIPPED
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: SKIPPED
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: SKIPPED
                            br-arm-basic [28/35]: SKIPPED
                    br-arm-full-nothread [29/35]: SKIPPED
                      br-arm-full-static [30/35]: SKIPPED
                   br-i386-pentium4-full [31/35]: SKIPPED
                      br-mips64-n64-full [32/35]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/35]: SKIPPED
               br-powerpc-603e-basic-cpp [34/35]: SKIPPED
               br-powerpc64-power7-glibc [35/35]: OK
35 builds, 24 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

v2:
- added cargo vendoring for the DL phase
- disabled rsvg-convert by default to fix some compile errors
v3:
- Ensure that -cargo4 is part of the dl file.
v4:
- Dropped LIBRSVG_SOURCE, not needed to define.
v5:
- Dropped 0001-cargo_wrapper-fixup-the-usage-of-cargo_c.patch,
  not needed, buildroot defines the right PATH already.
v6: no change
---
 ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 -------------
 ...ake-building-rsvg-convert-selectable.patch | 59 ++++++++++++++++++
 package/librsvg/librsvg.hash                  |  4 +-
 package/librsvg/librsvg.mk                    | 61 +++++++++++++------
 4 files changed, 103 insertions(+), 62 deletions(-)
 delete mode 100644 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
 create mode 100644 package/librsvg/0001-meson-make-building-rsvg-convert-selectable.patch

diff --git a/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
deleted file mode 100644
index 761ff92605..0000000000
--- a/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2c472bf55289ccbd7f305aa3e98d6fd70be4e3ab Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 19 Feb 2022 12:02:10 +0100
-Subject: [PATCH] gdk-pixbuf-loader/Makefile.am: set GDK_PIXBUF_MODULEDIR
-
-Set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
-gdk-pixbuf-query-loaders to build a correct gdk_pixbuf_cache_file and
-gdk-pixbuf.loaders on 'exotic' systems
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/668]
----
- gdk-pixbuf-loader/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gdk-pixbuf-loader/Makefile.am b/gdk-pixbuf-loader/Makefile.am
-index c3493736..de1f9641 100644
---- a/gdk-pixbuf-loader/Makefile.am
-+++ b/gdk-pixbuf-loader/Makefile.am
-@@ -49,7 +49,7 @@ rsvg_loader_LDADD = \
- EXTRA_rsvg_loader_DEPENDENCIES = libpixbufloader-svg.la gdk-pixbuf-loaders
- 
- gdk-pixbuf-loaders: Makefile
--	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
-+	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
- 
- if CROSS_COMPILING
- RUN_QUERY_LOADER_TEST=false
-@@ -68,7 +68,7 @@ endif
- install-data-hook:
- 	@if $(RUN_QUERY_LOADER_TEST) ; then \
- 		$(mkinstalldirs) $(DESTDIR)$(gdk_pixbuf_binarydir) ; \
--		$(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
-+		GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
- 	else \
- 	  echo "***" ; \
- 	  echo "*** Warning: loaders.cache not built" ; \
--- 
-2.34.1
-
diff --git a/package/librsvg/0001-meson-make-building-rsvg-convert-selectable.patch b/package/librsvg/0001-meson-make-building-rsvg-convert-selectable.patch
new file mode 100644
index 0000000000..4f37a5eaaf
--- /dev/null
+++ b/package/librsvg/0001-meson-make-building-rsvg-convert-selectable.patch
@@ -0,0 +1,59 @@
+From 4b37621cd911def0157359322289c93cd56b05ba Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 23 Sep 2025 21:42:44 +0200
+Subject: [PATCH] meson: make building rsvg-convert selectable
+
+E.g. if only the lib is needed.
+
+Upstream: https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/1138
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build       | 6 +++++-
+ meson_options.txt | 7 +++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ed8989939..2642b92b5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -161,6 +161,8 @@ else
+ endif
+ build_vala = get_option('vala').require(meson.can_run_host_binaries() and vapigen_dep.found())
+ 
++build_rsvg_convert = get_option('rsvg-convert')
++
+ build_pixbuf_loader = get_option('pixbuf-loader').require(pixbuf_dep.found())
+ 
+ build_docs = get_option('docs')
+@@ -520,7 +522,9 @@ subdir('rsvg')
+ if build_tests
+   subdir('librsvg-c/tests-c')
+ endif
+-subdir('rsvg_convert')
++if build_rsvg_convert.allowed()
++  subdir('rsvg_convert')
++endif
+ if build_pixbuf_loader.allowed()
+   subdir('gdk-pixbuf-loader')
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+index a044ae601..d7211192c 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -13,6 +13,13 @@ option('pixbuf',
+        description: 'Build with GDK-Pixbuf'
+        )
+ 
++option('rsvg-convert',
++       type: 'feature',
++       value: 'enabled',
++       yield: true,
++       description: 'Build the rsvg-convert util to convert SVG files to other image formats'
++       )
++
+ option('pixbuf-loader',
+        type: 'feature',
+        value: 'auto',
+-- 
+2.43.0
+
diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 4eab8cdfba..c033682314 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,3 @@
-# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.9.sha256sum
-sha256  518905fffa879b6c7f3db1aae961cf31333e0eadc7b4cdd4f531707868c54b53  librsvg-2.50.9.tar.xz
-
 # Locally computed
+sha256  902edb88757cdb33bb2c660527768733a57487a8b6ed597ea492055f25345b13  librsvg-2.61.1-cargo4.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 81a6667817..e56e570b04 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,31 +4,56 @@
 #
 ################################################################################
 
-LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
-LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
-LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
+LIBRSVG_VERSION = 2.61.1
+LIBRSVG_SITE = https://gitlab.gnome.org/GNOME/librsvg/-/archive/$(LIBRSVG_VERSION)
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_CONF_ENV = \
-	LIBS=$(TARGET_NLS_LIBS) \
-	RUST_TARGET=$(RUSTC_TARGET_NAME)
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
-HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
-LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
-	$(TARGET_NLS_DEPENDENCIES)
-HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml2 host-pango host-rustc
 LIBRSVG_LICENSE = LGPL-2.1+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 LIBRSVG_CPE_ID_VENDOR = gnome
-# We're patching gdk-pixbuf-loader/Makefile.am
-LIBRSVG_AUTORECONF = YES
+
+LIBRSVG_DOWNLOAD_POST_PROCESS = cargo
+LIBRSVG_DL_ENV = $(PKG_CARGO_ENV)
+
+LIBRSVG_CONF_ENV = $(PKG_CARGO_ENV)
+LIBRSVG_NINJA_ENV = $(PKG_CARGO_ENV)
+LIBRSVG_CONF_OPTS = \
+	-Dtriplet=$(RUSTC_TARGET_NAME) \
+	-Drsvg-convert=disabled \
+	-Dpixbuf-loader=disabled \
+	-Ddocs=disabled \
+	-Dtests=false
+LIBRSVG_DEPENDENCIES = \
+	host-cairo \
+	host-cargo-c \
+	host-libxml2 \
+	host-pango \
+	host-rustc \
+	cairo \
+	gdk-pixbuf \
+	libglib2 \
+	libxml2 \
+	pango \
+	$(TARGET_NLS_DEPENDENCIES)
+
+HOST_LIBRSVG_CONF_ENV = $(HOST_PKG_CARGO_ENV)
+HOST_LIBRSVG_NINJA_ENV = $(HOST_PKG_CARGO_ENV)
+HOST_LIBRSVG_CONF_OPTS = \
+	-Dintrospection=disabled
+HOST_LIBRSVG_DEPENDENCIES = \
+	host-cairo \
+	host-cargo-c \
+	host-gdk-pixbuf \
+	host-libglib2 \
+	host-libxml2 \
+	host-pango \
+	host-rustc
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBRSVG_CONF_OPTS += --enable-introspection
+LIBRSVG_CONF_OPTS += -Dintrospection=enabled
 LIBRSVG_DEPENDENCIES += gobject-introspection
 else
-LIBRSVG_CONF_OPTS += --disable-introspection
+LIBRSVG_CONF_OPTS += -Dintrospection=disabled
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
