Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD16BCAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 08:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B39E460EA0;
	Tue, 30 Sep 2025 08:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PG2fYNjKTuJV; Tue, 30 Sep 2025 08:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7882160EA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7882160EA3;
	Tue, 30 Sep 2025 08:08:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F6ACB30
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E1F409E8
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBxaM3wLFIWY for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 08:08:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AB1940876
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AB1940876
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AB1940876
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so4375171f8f.3
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 01:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759219678; x=1759824478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2+q4Sw1vn67Vg37MgKuqG0hqoRzII2/vaeyddG+xVA=;
 b=bqtMhoVAWcJtcUNVvZ0jUZdZF2Bqsf7O4EGGmXjRp3RepTLXhaUYaMi/tCaNRyMaD6
 LEVmP5p3N1/IoYLOP0OKoeQIIEVsTCzWuIGAYUZJ83Jxo2pUTYdGUzgjdCMR9TlWaxJY
 eP5gbHhljUiVAeDVTfdrPcuTV/aSzO+rbP5HRq4dX6iYTV6vklT3Tow0ty67d0hi3EWo
 eQFyL12Aa13ZbPNXGCCu7b1h8oMT2sEvzKmr34L15qLPX4kSMChIzpGuNjk3b3cHrWZm
 zn37JrJRCbJSbxlp3jXZaKckTxRZjpBztz1ODju70Ke50+AB/FGkgcogzKczD1HITlBI
 odIQ==
X-Gm-Message-State: AOJu0Ywz+IoaMCtSEGHTmPTx0iFNGj+Ifh/n8oLt3jytqbJbyIr0Et1p
 tOVE5GOQU5SnVNSzmprfap4YFJcBxaseXtXrA4Ab/Ooj7hthmjiYeyH1u4ZjKvIzDh0=
X-Gm-Gg: ASbGnctx5TkB82ZND/KlMwiKkNhg/YjotiRh4+J2ZkOsMka5YFrxumEmjRHJ2twgWvI
 3iJsiH6Ud0XH1XKnGXxSw8rnSglq2E4P3SuN8g/nJROfBBmw0fkSLcD/5uQAvVOLJdW0di6SQxN
 9f9Kn1u2lzmNCbPe3xYLVpsOUUwHO/8zfy3wZF8kZ8onyJzIEvggezw/U8XaFWOq63qCruRBYp7
 SiGLrDxTpk87crqpY7zEGmHwWuvhwBFVUkBjMkLs8CeItlwM5BfXdOl5HL98PkhR28SAu6Vm7tx
 yO9IKNsi7qw2p1lQdBCpqrqJ4M/3itrwDL5u2qk0cdRvcmJWOq/aH1Y7duuEozrFrrfJ6LWPg0H
 sn16hS69JdU0aNEQFWm4enLaQjYVpesmVLmct3cdreGXbu1b+MyWaOaTba7c7YhRFipgXSy9H9l
 CEdlwgTkfedTmpVbzArbZxrBv29e8lzgHlQX202cRiM0LChiytE7EuK1j4qakPoWg5OyuIieVoM
 kjXI2UMug==
X-Google-Smtp-Source: AGHT+IFVTvqGL6Ey5h9BipDWeHKCiBmjeELVW2UYO5JQIMSSCb7T+Lncwk6HHdJKd+1tOzfKnf4YPA==
X-Received: by 2002:a05:6000:3101:b0:3eb:5e99:cbbc with SMTP id
 ffacd0b85a97d-40e458a9394mr13009404f8f.9.1759219677696; 
 Tue, 30 Sep 2025 01:07:57 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm21558362f8f.39.2025.09.30.01.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:07:57 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 30 Sep 2025 10:07:50 +0200
Message-ID: <20250930080750.353542-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930080750.353542-1-thomas@devoogdt.com>
References: <20250930080750.353542-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v5 3/3] package/librsvg: bump version to 2.61.1
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
---
 ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 -------------
 ...ake-building-rsvg-convert-selectable.patch | 59 ++++++++++++++++++
 package/librsvg/librsvg.hash                  |  4 +-
 package/librsvg/librsvg.mk                    | 60 +++++++++++++------
 4 files changed, 102 insertions(+), 62 deletions(-)
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
index 81a6667817..3f9721ccc2 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,31 +4,55 @@
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
+HOST_LIBRSVG_CONF_OPTS = -Dintrospection=disabled
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
