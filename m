Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B78CAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 06:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35EC184A0E;
	Fri, 26 Sep 2025 06:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lxw9tbppllnX; Fri, 26 Sep 2025 06:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD4C84A14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD4C84A14;
	Fri, 26 Sep 2025 06:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BCF412D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 295FD61B63
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1JtKubF4649 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 06:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.46;
 helo=mail-ed1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B94461B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B94461B56
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B94461B56
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-628f29d68ecso3773835a12.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 23:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758866589; x=1759471389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9GlljpSOzMPAD9HRIHavCbZRzi7fbsCwFdq88V+IXw=;
 b=gIvTP8MXCMBHJf3XYJBGTJ2p5BgQMTYCqki9TYZZMO4wRLDKSOW5zPJ2Tq5tneYb0U
 MnnTO0Mf3wjgiFFhAySzivsM3Pb78jdFNRgQiY4d0CHRSjUZIXeGl7ODzxXOBLpTmw4U
 QYYD48aZFGdUWvBUHQCqmoxrBpK0uNpozEbMFMT/1+11bWrV+2jApJ+Zy6NNApPjV3UL
 8augyN1HZHRjm4KHC/vHm5Y+EuoJo3J1NusPnsDYzBP5yEKihOEfenAlHv0wLxt2vbg6
 9Lzb3zYMlBfWU3N6Cuzsr6rZpu1+xb+gU7Ys1BoomTApKb7U5fI7EzHX/Y7TdPKX/av4
 3PEg==
X-Gm-Message-State: AOJu0Yz1yRkJq0edc+zmEMZaBj8Q1YLW3dQMMjhj1rdRAdYDRSXyJeWH
 DBruVpQf/EQaYbtWeTgcr3Uto0oMyjpAOL9vWnueHvTWu64w9P3Jlnnz2gwb9i+i
X-Gm-Gg: ASbGncti7WOdk4UKd0/8WAWWXXzEtu5P0oEXGfMSjanT7JyFw2DbOPKfZAVZk75qzr1
 wJKHG2R1lnYm/XMMeNKw+eze6fEJ2OC5Ug/1kbF35g1msLv4UoNtljLHH2qdeIdkkfgv01cX8PE
 e194wdB1k9td+Y4XAutFgRQ9OnO4ugv81GJ97IEQrdJBkEievtAReGeIMFRMcC8rwyht0jE+7Kq
 2ejUy+8slgrtXBWNrx06Di8TNDPnWkqVvlS0mRXrVmpT0LG5bgCM6vw96f/SQY0f4DZd1FzC0Au
 oNPCFCfwX2b1ZIAnPRXaVdwd1rDvAM9N4E7XwqaCncOQGaVkqJfz85w6+p/Vdi/eqIxxayDO7UT
 dRAqrJCORj35frYKBK6+VyM3HpzV6JW/pe10rlmTAg0Rptth0ZFtp3Mjf7n18tcXe/E2C7O5Of7
 cTs3NWrnowo97J2ofW2VxkDvkapUS2
X-Google-Smtp-Source: AGHT+IGH6+Cja2Zo5LWFYlkhcdh6ompL6PVsizMpUmaqQGtukGPCGSCXU/ojzvBy76FN2L7obtINCg==
X-Received: by 2002:a17:907:6d0c:b0:b04:830f:822d with SMTP id
 a640c23a62f3a-b34bcb5f5a7mr644507466b.63.1758866589105; 
 Thu, 25 Sep 2025 23:03:09 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:3020:9fd6:5911:46c8])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b3545a9c3e1sm298650466b.105.2025.09.25.23.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 23:03:08 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 26 Sep 2025 08:03:02 +0200
Message-ID: <20250926060303.259618-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926060303.259618-1-thomas@devoogdt.com>
References: <20250926060303.259618-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4 3/3] package/librsvg: bump version to 2.61.1
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
---
 ...o_wrapper-fixup-the-usage-of-cargo_c.patch | 57 ++++++++++++++++++
 ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 -------------
 ...ake-building-rsvg-convert-selectable.patch | 59 ++++++++++++++++++
 package/librsvg/librsvg.hash                  |  4 +-
 package/librsvg/librsvg.mk                    | 60 +++++++++++++------
 5 files changed, 159 insertions(+), 62 deletions(-)
 create mode 100644 package/librsvg/0001-cargo_wrapper-fixup-the-usage-of-cargo_c.patch
 delete mode 100644 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
 create mode 100644 package/librsvg/0002-meson-make-building-rsvg-convert-selectable.patch

diff --git a/package/librsvg/0001-cargo_wrapper-fixup-the-usage-of-cargo_c.patch b/package/librsvg/0001-cargo_wrapper-fixup-the-usage-of-cargo_c.patch
new file mode 100644
index 0000000000..b9410f2ad7
--- /dev/null
+++ b/package/librsvg/0001-cargo_wrapper-fixup-the-usage-of-cargo_c.patch
@@ -0,0 +1,57 @@
+From 487eabde9ddac7571cbfdbccb33fd911ad4b17da Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 20 Sep 2025 18:36:19 +0200
+Subject: [PATCH] cargo_wrapper: fixup the usage of cargo_c
+
+The wrong bin file was used, so add a second --cargo-c arg,
+which point to the right bin.
+
+Upstream: https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/1136
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build            | 1 +
+ meson/cargo_wrapper.py | 9 ++++++++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ed8989939..3e7387348 100644
+--- a/meson.build
++++ b/meson.build
+@@ -466,6 +466,7 @@ endif
+ 
+ cargo_wrapper_args = [
+   '--cargo', cargo.full_path(),
++  '--cargo-c', cargo_c.full_path(),
+   '--manifest-path', cargo_toml,
+   '--project-build-root', meson.project_build_root(),
+   '--prefix', get_option('prefix'),
+diff --git a/meson/cargo_wrapper.py b/meson/cargo_wrapper.py
+index 5f1761cd2..54293154a 100755
+--- a/meson/cargo_wrapper.py
++++ b/meson/cargo_wrapper.py
+@@ -20,6 +20,10 @@ parser.add_argument(
+     "--cargo", required=True, type=Path, help="Path to the cargo executable"
+ )
+ 
++parser.add_argument(
++    "--cargo-c", required=True, type=Path, help="Path to the cargo-c executable"
++)
++
+ parser.add_argument(
+     "--manifest-path", required=True, type=Path, help="Path to Cargo.toml"
+ )
+@@ -136,7 +140,10 @@ cargo_prefixes = [
+     (Path(args.prefix) / args.libdir).as_posix(),
+ ]
+ 
+-cargo_cmd = [Path(args.cargo).as_posix()]
++if args.command == "cbuild":
++    cargo_cmd = [Path(args.cargo_c).as_posix()]
++else:
++    cargo_cmd = [Path(args.cargo).as_posix()]
+ 
+ if args.toolchain_version is not None:
+     if args.build_triplet is not None:
+-- 
+2.43.0
+
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
diff --git a/package/librsvg/0002-meson-make-building-rsvg-convert-selectable.patch b/package/librsvg/0002-meson-make-building-rsvg-convert-selectable.patch
new file mode 100644
index 0000000000..4f37a5eaaf
--- /dev/null
+++ b/package/librsvg/0002-meson-make-building-rsvg-convert-selectable.patch
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
