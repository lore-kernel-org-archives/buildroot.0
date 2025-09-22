Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F67CAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 07:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 459628451A;
	Mon, 22 Sep 2025 07:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ukBej56WGGj; Mon, 22 Sep 2025 07:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74AB8452A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A74AB8452A;
	Mon, 22 Sep 2025 07:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 861FDD3
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C9C54116C
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EO1F1Ug0MN03 for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 07:13:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B47E41159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B47E41159
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B47E41159
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so1948004f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 00:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758525233; x=1759130033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJaeAIyexJZljFfczZ95ucdxS5KcXkcJsna2i8Ecpuo=;
 b=kW7SJP0JtbhUqrG+/RpX7sTKU+2BYFNMfBhD6nl59mduZ3E5zLui8KDccG3feTEehd
 SQLGFP5fd8TwYVd74XZR0Y9rgTXK9nawbnT7C+7eQhOuZECc61hmrMmUYo0bBQzt5oEE
 HiPGurwwJVFq6IB4DpE93CL/WZ+b+H03enSVROZtLvE0ulZnfmRh2ETuphux4wa1f5DZ
 fCIEE93MAwenlFpqTdGvWqbath/n7mqABVCcbehIpE+GMn9LmPrY542el3EsQ40kG8Ib
 j5walOyjHq+JuEts3XZRBcgS9HVgabgB9Y7yg4T3MaeAsFNQEBedDVuwEh3Tj7DsBwEx
 l20g==
X-Gm-Message-State: AOJu0Yw6qauZbQIhoptRfYEuGpiRJFJ6lTRryareSk/dPyV9tuNRQAZB
 C6ozbrPxXmltJ4MtAcu1bXmarxB/x1ZFGINvC7sCbA47hsmkbE3Es7kjO9jX4M7b
X-Gm-Gg: ASbGncs+A0l/+5xfsKyLyyvG4ioM34+zACllULNbtpggOApsN6DnlopQW/fhtJEjhX3
 4QPUIKWOOk1a9Y1T0e+MJGSkhmJqsXDfGC5sHqD9+b0OdUpNU2kOb+LRJWM96ip6Hzgm5pgch6c
 JfExiRtR/yBaAdY06nvJGWXB0lOd4m1Vsh2CO6EJj7Vuo+SNa3+8xkkKqy35RnDmXvwNvYBS2P3
 WRmIfTuyXSNiBawPLd9QmkTHnjVruRt5txzzg+boksBxCrVOv7xp4aWJRMhPYq0u4+I2o/aSLJr
 sI0sW2O385QE4Ip5/Oaoe9YPpB9qNN0WrCPrfgfDzXJnyb7Hvc+JQJXwhSmmzcQcNSj7i42tuaJ
 l2Qgw/r31XC54XsRPsHU00RlJ3M8cva+YpqxZqulwlc6V9GGKEZmPNgnsLa94sT2pjvNog0lCKK
 OU94hRUzT1UzvYO326uMOH5TPBTVQdh6JBP0jLGbJ+2goAZ00=
X-Google-Smtp-Source: AGHT+IFe16toZ+TtrmfRZouUJe7Nq6V8YeP52jQYzH91Fc5sb3jc4GXH28VVgb1XLr3Xg5Zy6yj9BQ==
X-Received: by 2002:a05:6000:310e:b0:3e9:2fea:6795 with SMTP id
 ffacd0b85a97d-3ee852a434cmr10440972f8f.53.1758525232660; 
 Mon, 22 Sep 2025 00:13:52 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d8csm17746771f8f.9.2025.09.22.00.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 00:13:52 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 22 Sep 2025 09:13:44 +0200
Message-ID: <20250922071344.3864120-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922071344.3864120-1-thomas@devoogdt.com>
References: <20250922071344.3864120-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 3/3 WIP] package/librsvg: bump version to
 2.61.1
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

Announcement (for what it's worth):
 - https://gitlab.gnome.org/GNOME/librsvg/-/releases/2.61.1

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
./utils/test-pkg -p librsvg -a
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: SKIPPED
                    bootlin-armv5-uclibc [ 4/35]: SKIPPED
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: FAILED
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
                     bootlin-x86-64-musl [24/35]: FAILED
                   bootlin-x86-64-uclibc [25/35]: SKIPPED
                   bootlin-x86-i686-musl [26/35]: FAILED
                   bootlin-xtensa-uclibc [27/35]: SKIPPED
                            br-arm-basic [28/35]: SKIPPED
                    br-arm-full-nothread [29/35]: SKIPPED
                      br-arm-full-static [30/35]: SKIPPED
                   br-i386-pentium4-full [31/35]: SKIPPED
                      br-mips64-n64-full [32/35]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/35]: SKIPPED
               br-powerpc-603e-basic-cpp [34/35]: SKIPPED
               br-powerpc64-power7-glibc [35/35]: OK
35 builds, 24 skipped, 3 build failed, 0 legal-info failed, 0 show-info failed

Some tests are failing, for which I could use some help.
In prep to fix https://lore.kernel.org/buildroot/155c0a1f-c6f4-4484-a6e6-5da44d2d4100@gmx.de/,
where the exact same tests failed.

This is a meson package, but it uses cargo in the background. I'm also not sure
about cargo vendoring, see: https://gnome.pages.gitlab.gnome.org/librsvg/devel-docs/compiling.html#building-with-no-network-access
---
 ...o_wrapper-fixup-the-usage-of-cargo_c.patch | 57 +++++++++++++++++++
 ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 -------------
 package/librsvg/librsvg.hash                  |  4 +-
 package/librsvg/librsvg.mk                    | 54 ++++++++++++------
 4 files changed, 97 insertions(+), 59 deletions(-)
 create mode 100644 package/librsvg/0001-cargo_wrapper-fixup-the-usage-of-cargo_c.patch
 delete mode 100644 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch

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
diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 4eab8cdfba..2fcb170a44 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.9.sha256sum
-sha256  518905fffa879b6c7f3db1aae961cf31333e0eadc7b4cdd4f531707868c54b53  librsvg-2.50.9.tar.xz
+# From https://download.gnome.org/sources/librsvg/2.61/librsvg-2.61.1.sha256sum
+sha256  bc1bbcd419120b098db28bea55335d9de2470d4e6a9f6ee97207b410fc15867d  librsvg-2.61.1.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 81a6667817..0ecb42f129 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,31 +4,53 @@
 #
 ################################################################################
 
-LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
+LIBRSVG_VERSION_MAJOR = 2.61
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).1
 LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
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
+LIBRSVG_CONF_ENV = $(PKG_CARGO_ENV)
+LIBRSVG_NINJA_ENV = $(PKG_CARGO_ENV)
+LIBRSVG_CONF_OPTS = \
+	-Dtriplet=$(RUSTC_TARGET_NAME) \
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
