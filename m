Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF40CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 10:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7ABA409D0;
	Fri, 17 Oct 2025 10:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7jPvT2bBaaA; Fri, 17 Oct 2025 10:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDEC14063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDEC14063C;
	Fri, 17 Oct 2025 10:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EBA1EC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34D0E40090
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXrJqrqrYHG9 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 10:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20EAF40078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20EAF40078
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20EAF40078
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:40:30 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9E77731E0BFF; Fri, 17 Oct 2025 12:40:27 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:40:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aPIdG44W1YCmCjU_@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1760697627; bh=wQ6f7hBOf33RaTd0l0GQJwZLGEDGqbtvWJxTqaCgAIA=;
 h=Date:From:To:Subject:From;
 b=l3S20UwJo5lnIrvlIL0aeQEk3Cc7lF82rdaAJyyBabdxYoBjDskTyQYbIOTH8u71H
 SnOmxmPrmQkH/pduv0K/LeIdpYXZRBveZwkgQhWId2DU7Uwimt//iINfbn2HKbYzCi
 vcWTVEiZPok+XTB2cKu7tqhBtOZQYoKx5ggRkjoNlB6Mh5zXzvV5C+XpknBFYOjCEF
 KEubyYV9cRxImYAwEw38QD1PyGqagaFnQD+o0CwRHW+8rLCt5yF+8v9uRZb58Hh6l3
 no6At9V4a4uBkd9lFly7X3HgvEkJBwltqLWpzJCSGjPjnmK47f+Eh7IMQxVTh3NjAI
 34fQsXGP9xGcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=l3S20UwJ
Subject: [Buildroot] [PATCH v2 5/6] package/firefox: new package
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

Popular Webbrowser.

Tested on Raspberry PI4 (aarch64) and Qemu X86_64.
You need some fonts to be installed to make use of it,
f.e. Dejavu fonts.
To compile firefox you need a machine with approximately 24 GB of RAM.

The system PNG library can not be used, because it does not have APNG
support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - update to latest esr
 - use system nss
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/firefox/Config.in    | 55 +++++++++++++++++++++
 package/firefox/firefox.hash |  3 ++
 package/firefox/firefox.mk   | 94 ++++++++++++++++++++++++++++++++++++
 5 files changed, 154 insertions(+)
 create mode 100644 package/firefox/Config.in
 create mode 100644 package/firefox/firefox.hash
 create mode 100644 package/firefox/firefox.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc304ad1cd..0b257748f3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3401,6 +3401,7 @@ F:	package/asterisk/
 F:	package/cbindgen/
 F:	package/evilwm/
 F:	package/fbv/
+F:	package/firefox/
 F:	package/libaom/
 F:	package/libjwt/
 F:	package/mksh/
diff --git a/package/Config.in b/package/Config.in
index 6903272d68..7528d6d891 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
+	source "package/firefox/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
diff --git a/package/firefox/Config.in b/package/firefox/Config.in
new file mode 100644
index 0000000000..e7c908a2b5
--- /dev/null
+++ b/package/firefox/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_FIREFOX
+	bool "firefox"
+	depends on BR2_aarch64 || BR2_x86_64
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_DAV1D
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_NODEJS_SRC
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_CURSES
+	select BR2_PACKAGE_HOST_PYTHON3_SQLITE
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBAOM
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	help
+	  Popular webbrowser.
+
+	  https://www.firefox.com
+
+comment "firefox needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
+comment "firefox needs an OpenGL (GLX) provider"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/firefox/firefox.hash b/package/firefox/firefox.hash
new file mode 100644
index 0000000000..c610fc5474
--- /dev/null
+++ b/package/firefox/firefox.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  49f20673171046bc7b64f4caa340c46e1e105b9107f0ef68b7a94f379bcea4f7  firefox-140.4.0esr.source.tar.xz
+sha256  d10965daab0b819bef778c629a94cdd094ffb4ede37239b3d263884a574352c0  toolkit/content/license.html
diff --git a/package/firefox/firefox.mk b/package/firefox/firefox.mk
new file mode 100644
index 0000000000..29ec9fdda7
--- /dev/null
+++ b/package/firefox/firefox.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# firefox
+#
+################################################################################
+
+FIREFOX_VERSION = 140.4.0esr
+FIREFOX_SOURCE = firefox-$(FIREFOX_VERSION).source.tar.xz
+FIREFOX_SITE = https://ftp.mozilla.org/pub/firefox/releases/$(FIREFOX_VERSION)/source
+FIREFOX_LICENSE = MPL-2.0
+FIREFOX_LICENSE_FILES = toolkit/content/license.html
+FIREFOX_DEPENDENCIES = \
+	host-nodejs \
+	host-cbindgen \
+	host-clang \
+	host-nasm \
+	alsa-lib \
+	dav1d \
+	dbus-glib \
+	fontconfig \
+	harfbuzz \
+	jpeg \
+	libaom \
+	libgtk3 \
+	libnspr \
+	libnss \
+	libevent \
+	libvpx \
+	pango \
+	pixman \
+	zlib \
+	xlib_libXcomposite \
+	xlib_libXcursor \
+	xlib_libXdamage \
+	xlib_libXrandr \
+	xlib_libICE \
+	xlib_libSM
+
+FIREFOX_CONF_OPTS = \
+	--enable-application=browser \
+      	--enable-official-branding \
+	--enable-hardening \
+	--disable-accessibility \
+	--disable-audio-backends \
+	--disable-webrtc \
+	--disable-printing \
+	--without-wasm-sandboxed-libraries \
+	--disable-profiling \
+	--disable-pulseaudio \
+	--disable-crashreporter \
+	--disable-tests \
+	--with-system-av1 \
+	--with-system-ffi \
+	--with-system-icu \
+	--with-system-jpeg \
+	--with-system-libevent \
+	--with-system-libvpx \
+	--with-system-nspr \
+	--with-system-nss \
+	--with-system-pixman \
+	--with-system-zlib \
+	--with-clang-path=$(HOST_DIR)/bin/clang
+
+# build directory can't be the directory where configure are there, so..
+define FIREFOX_CONFIGURE_CMDS
+	(mkdir -p $(@D)/build; cd $(@D)/build; rm -rf config.cache; \
+		PATH=$(BR_PATH) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CROSS_COMPILE=1 \
+		../configure \
+		--target=$(GNU_TARGET_NAME) \
+		--with-toolchain-prefix=$(GNU_TARGET_NAME)- \
+		--prefix=/usr \
+		$(FIREFOX_CONF_OPTS) \
+	)
+endef
+
+define FIREFOX_BUILD_CMDS
+	$(MAKE) -C $(@D)/build \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		all
+endef
+
+define FIREFOX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/build \
+		DESTDIR=$(TARGET_DIR) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
