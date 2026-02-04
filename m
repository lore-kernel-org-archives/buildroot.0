Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E899BE9538C
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B3D60A80;
	Wed,  4 Feb 2026 11:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrOMqEefT531; Wed,  4 Feb 2026 11:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4343C60A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770205723;
	bh=vexu+FfdSLR7ZW0DS44jSN9t/tPmRdavVGB/IhkFGIY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ezs133bTx4S/IRZuuDzzLSsJV9dBXVsP1X6GMsbEa9JtcUXX45UZKl2s/2sHNEyF0
	 +9SQbo1UdMHXO6Kq8+qQ1JKyhykWYO+Mt/K2lu0O1Rj+m1m+aORGbr6lriFJhsub7r
	 wiSrdh/lhq4nItZucf4TTkEBtK1OFsKcn0K3v8ODiXnQvHLQktl9D3sc7Pebe/zEar
	 uOx7XQwV8vifJT835FIT00bhC/Y52rDa6wSYjYPYOGg66Q//N1ph/Ka4bbCdGhF3nx
	 pXdpKUwtnDb5S2KjdFmcqROYv6qtdYe8p/a/ZFTcjBbfwn/HQQDjmywPB2n0Osg1iZ
	 h8EWVk4RDSw6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4343C60A41;
	Wed,  4 Feb 2026 11:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DDD8173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BBB660A41
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyioRrjC6SA3 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB71560903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB71560903
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB71560903
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:48:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AD82231E0B83; Wed, 04 Feb 2026 12:48:37 +0100 (CET)
Date: Wed, 4 Feb 2026 12:48:37 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYMyFRlGg5cBF9CJ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770205717; bh=Yf8HTgJK6ffrMYkaYUlTWvsCKmg7eL2VxNAWwbKPcZA=;
 h=Date:From:To:Subject:From;
 b=c7mx/vd1/5C/2Tg5EkWjs9fVp9/a3vdQ+Esw4yEJ7YI+zHX4rFZXirpnSEJyR/QAZ
 qYyja2TkQGqgVsaNVGH9/F/XdPyEJLXTKwmK0p3h9m6u39zjVu1Z6ZN9j6De+dSO8w
 V2ph4kjvSCR7hNC6NHBtf5KlOLt6VMNzpPD3JYfNg4RFDqfNaWPFvkq64rNvFxMgds
 fe/SPqENscvC3cyRbqOl4f9pkuonR8Y/dICI6M2zJm1+gbakugYZbEt9jG5p3Eq9dK
 RftSuHUC+6J6Wa2ZyaSrFdokE3CQkpTuJAdeX3v/3EcXTKZU+TUXKwpVYjy1gdthLF
 1BjRcXXGzISqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 5/5] package/thunderbird: new package
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

Popular mail client.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - no changes
v2->v3:
  - add python3.14 compatibility patch (regenerated from firefox
    patch) from LFS project
  - do not use system ICU, too new version in Buildroot
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/firefox/0001-python_3.14_fixes.patch  |   2 +-
 .../thunderbird/0001-python_3.14_fixes.patch  | 115 ++++++++++++++++++
 package/thunderbird/Config.in                 |  54 ++++++++
 package/thunderbird/thunderbird.hash          |   3 +
 package/thunderbird/thunderbird.mk            |  88 ++++++++++++++
 7 files changed, 263 insertions(+), 1 deletion(-)
 create mode 100644 package/thunderbird/0001-python_3.14_fixes.patch
 create mode 100644 package/thunderbird/Config.in
 create mode 100644 package/thunderbird/thunderbird.hash
 create mode 100644 package/thunderbird/thunderbird.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9012ab523e..2c1fa90a02 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3435,6 +3435,7 @@ F:	package/libpam-pkcs11/
 F:	package/libaom/
 F:	package/mksh/
 F:	package/ruby/
+F:	package/thunderbird/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
 F:	package/zabbix/
diff --git a/package/Config.in b/package/Config.in
index 84c3a98114..e16222edac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2340,6 +2340,7 @@ menu "Mail"
 	source "package/libesmtp/Config.in"
 	source "package/msmtp/Config.in"
 	source "package/mutt/Config.in"
+	source "package/thunderbird/Config.in"
 endmenu
 
 menu "Miscellaneous"
diff --git a/package/thunderbird/0001-python_3.14_fixes.patch b/package/thunderbird/0001-python_3.14_fixes.patch
new file mode 100644
index 0000000000..8d97edcc49
--- /dev/null
+++ b/package/thunderbird/0001-python_3.14_fixes.patch
@@ -0,0 +1,115 @@
+Submitted By:            Douglas R. Reno <renodr at linuxfromscratch dot org>
+Date:                    2025-11-24
+Initial Package Version: 140.5.0
+Upstream Status:         Applied in mainline
+Origin:                  Upstream (phabricator D261511, 261512, 262335)
+Description:             Fixes building Firefox, Thunderbird, and Spidermonkey
+                         with Python 3.14 by adjusting to various API changes.
+                         This includes ast.Str being removed, and changing to
+                         ast.Constant.
+
+Upstream: committed in mainline
+Signed-Off-By: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur thunderbird-140.7.1.orig/python/mach/mach/command_util.py thunderbird-140.7.1/python/mach/mach/command_util.py
+--- thunderbird-140.7.1.orig/python/mach/mach/command_util.py	2026-01-24 00:23:21.000000000 +0100
++++ thunderbird-140.7.1/python/mach/mach/command_util.py	2026-02-04 02:37:04.733883568 +0100
+@@ -292,7 +292,7 @@
+             kwarg_dict = {}
+ 
+             for name, arg in zip(["command", "subcommand"], decorator.args):
+-                kwarg_dict[name] = arg.s
++                kwarg_dict[name] = arg.value
+ 
+             for keyword in decorator.keywords:
+                 if keyword.arg not in relevant_kwargs:
+diff -Nur thunderbird-140.7.1.orig/python/mozbuild/mozbuild/frontend/reader.py thunderbird-140.7.1/python/mozbuild/mozbuild/frontend/reader.py
+--- thunderbird-140.7.1.orig/python/mozbuild/mozbuild/frontend/reader.py	2026-01-24 00:23:21.000000000 +0100
++++ thunderbird-140.7.1/python/mozbuild/mozbuild/frontend/reader.py	2026-02-04 02:37:04.737883527 +0100
+@@ -470,7 +470,7 @@
+             return c(
+                 ast.Subscript(
+                     value=c(ast.Name(id=self._global_name, ctx=ast.Load())),
+-                    slice=c(ast.Index(value=c(ast.Str(s=node.id)))),
++                    slice=c(ast.Index(value=c(ast.Constant(value=node.id)))),
+                     ctx=node.ctx,
+                 )
+             )
+@@ -1039,8 +1039,8 @@
+                 else:
+                     # Others
+                     assert isinstance(target.slice, ast.Index)
+-                    assert isinstance(target.slice.value, ast.Str)
+-                    key = target.slice.value.s
++                    assert isinstance(target.slice.value, ast.Constant)
++                    key = target.slice.value.value
+             elif isinstance(target, ast.Attribute):
+                 assert isinstance(target.attr, str)
+                 key = target.attr
+@@ -1051,11 +1051,11 @@
+             value = node.value
+             if isinstance(value, ast.List):
+                 for v in value.elts:
+-                    assert isinstance(v, ast.Str)
+-                    yield v.s
++                    assert isinstance(v, ast.Constant)
++                    yield v.value
+             else:
+-                assert isinstance(value, ast.Str)
+-                yield value.s
++                assert isinstance(value, ast.Constant)
++                yield value.value
+ 
+         assignments = []
+ 
+diff -Nur thunderbird-140.7.1.orig/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py thunderbird-140.7.1/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
+--- thunderbird-140.7.1.orig/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py	2026-01-24 00:23:21.000000000 +0100
++++ thunderbird-140.7.1/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py	2026-02-04 02:37:04.737883527 +0100
+@@ -327,15 +327,13 @@
+     """
+     if isinstance(node.value, ast.List) and "elts" in node.value._fields:
+         for f in node.value.elts:
+-            if not isinstance(f, ast.Constant) and not isinstance(f, ast.Str):
++            if not isinstance(f, ast.Constant):
+                 log(
+                     "Found non-constant source file name in list: ",
+                     ast_get_source_segment(code, f),
+                 )
+                 return []
+-        return [
+-            f.value if isinstance(f, ast.Constant) else f.s for f in node.value.elts
+-        ]
++        return [f.value for f in node.value.elts]
+     elif isinstance(node.value, ast.ListComp):
+         # SOURCES += [f for f in foo if blah]
+         log("Could not find the files for " + ast_get_source_segment(code, node.value))
+diff -Nur thunderbird-140.7.1.orig/python/mozbuild/mozbuild/vendor/vendor_python.py thunderbird-140.7.1/python/mozbuild/mozbuild/vendor/vendor_python.py
+--- thunderbird-140.7.1.orig/python/mozbuild/mozbuild/vendor/vendor_python.py	2026-01-24 00:23:21.000000000 +0100
++++ thunderbird-140.7.1/python/mozbuild/mozbuild/vendor/vendor_python.py	2026-02-04 02:37:04.737883527 +0100
+@@ -40,6 +40,10 @@
+     # modified 'dummy' version of it so that the dependency checks still succeed, but
+     # if it ever is attempted to be used, it will fail gracefully.
+     "ansicon",
++    # jsonschema 4.17.3 is incompatible with Python 3.14+,
++    # but later versions use a dependency with Rust components, which we thus can't vendor.
++    # For now we apply the minimal patch to jsonschema to make it work again.
++    "jsonschema",
+ }
+ 
+ 
+diff -Nur thunderbird-140.7.1.orig/third_party/python/jsonschema/jsonschema/validators.py thunderbird-140.7.1/third_party/python/jsonschema/jsonschema/validators.py
+--- thunderbird-140.7.1.orig/third_party/python/jsonschema/jsonschema/validators.py	2026-01-24 00:23:29.000000000 +0100
++++ thunderbird-140.7.1/third_party/python/jsonschema/jsonschema/validators.py	2026-02-04 02:37:04.737883527 +0100
+@@ -875,8 +875,11 @@
+             return None
+         uri, fragment = urldefrag(url)
+         for subschema in subschemas:
++            id = subschema["$id"]
++            if not isinstance(id, str):
++                continue
+             target_uri = self._urljoin_cache(
+-                self.resolution_scope, subschema["$id"],
++                self.resolution_scope, id,
+             )
+             if target_uri.rstrip("/") == uri.rstrip("/"):
+                 if fragment:
diff --git a/package/thunderbird/Config.in b/package/thunderbird/Config.in
new file mode 100644
index 0000000000..c4efafbf65
--- /dev/null
+++ b/package/thunderbird/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_THUNDERBIRD
+	bool "thunderbird"
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
+	  Popular mail client.
+
+	  https://www.thunderbird.net
+
+comment "thunderbird needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
+comment "thunderbird needs an OpenGL (GLX) provider"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/thunderbird/thunderbird.hash b/package/thunderbird/thunderbird.hash
new file mode 100644
index 0000000000..56b28eceef
--- /dev/null
+++ b/package/thunderbird/thunderbird.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ba726695dd97d5a5971a12be90a0b53bb42f4a4507dcfda144cad345a9e5b75e  thunderbird-140.7.1esr.source.tar.xz
+sha256  d10965daab0b819bef778c629a94cdd094ffb4ede37239b3d263884a574352c0  toolkit/content/license.html
diff --git a/package/thunderbird/thunderbird.mk b/package/thunderbird/thunderbird.mk
new file mode 100644
index 0000000000..5ac5a2b1e6
--- /dev/null
+++ b/package/thunderbird/thunderbird.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# thunderbird
+#
+################################################################################
+
+THUNDERBIRD_VERSION = 140.7.1esr
+THUNDERBIRD_SOURCE = thunderbird-$(THUNDERBIRD_VERSION).source.tar.xz
+THUNDERBIRD_SITE = https://ftp.mozilla.org/pub/thunderbird/releases/$(THUNDERBIRD_VERSION)/source
+THUNDERBIRD_LICENSE = MPL-2.0
+THUNDERBIRD_LICENSE_FILES = toolkit/content/license.html
+THUNDERBIRD_DEPENDENCIES = \
+	host-nodejs \
+	host-cbindgen \
+	host-clang \
+	host-nasm \
+	alsa-lib \
+	dbus-glib \
+	fontconfig \
+	harfbuzz \
+	jpeg \
+	libgtk3 \
+	libnspr \
+	libnss \
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
+THUNDERBIRD_CONF_OPTS = \
+	--enable-application=comm/mail \
+      	--enable-official-branding \
+	--enable-hardening \
+	--disable-audio-backends \
+	--disable-webrtc \
+	--disable-printing \
+	--without-wasm-sandboxed-libraries \
+	--disable-profiling \
+	--disable-pulseaudio \
+	--disable-crashreporter \
+	--disable-tests \
+	--without-system-icu \
+	--with-system-ffi \
+	--with-system-jpeg \
+	--with-system-libvpx \
+	--with-system-nspr \
+	--with-system-nss \
+	--with-system-pixman \
+	--with-system-zlib \
+	--with-clang-path=$(HOST_DIR)/bin/clang
+
+# build directory can't be the directory where configure are there, so..
+define THUNDERBIRD_CONFIGURE_CMDS
+	(mkdir -p $(@D)/build; cd $(@D)/build; rm -rf config.cache; \
+		PATH=$(BR_PATH) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CROSS_COMPILE=1 \
+		../configure \
+		--target=$(GNU_TARGET_NAME) \
+		--with-toolchain-prefix=$(GNU_TARGET_NAME)- \
+		--prefix=/usr \
+		$(THUNDERBIRD_CONF_OPTS) \
+	)
+endef
+
+define THUNDERBIRD_BUILD_CMDS
+	$(MAKE) -C $(@D)/build \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		all
+endef
+
+define THUNDERBIRD_INSTALL_TARGET_CMDS
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
