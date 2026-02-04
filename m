Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B804E9538F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B6681BC6;
	Wed,  4 Feb 2026 12:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AkkryeP4qhc; Wed,  4 Feb 2026 12:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBEC981BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770207516;
	bh=Ho0SW359QRiEdGZjeX1thmnU8z/QildJDbwyDa66/j0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ocF+jHg2mwn1yUkEWAktqPvRJrNLCW9ycK4QKumXUjshfRS3/QLLNSO/HEZTmLOkM
	 2Fs/IpRIZskwlQ4ExMPMIZrTIbIP5hosU8HaewTrZ+LVLBhA17FT06q78uqwaDAxBV
	 uht5SlZM4jKsm3PNGOYDtapljBmHvzG9SwJ5LMJL7X18TDzZIjfKBe5mqiQmFPOvzR
	 exM04dR+PUPy23wvkii62Wv2iKiM8M2/AhTMwmnDA0XyGZTebNiFb4h+HGjivJXTZT
	 RYMbn5Bj6QCnQttArOPmcBi4IRFwf+w0SZH8c8Tpqdlvoawm6vU8CP7uYL+UbX5CDr
	 74RqgGWzcpPlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBEC981BCB;
	Wed,  4 Feb 2026 12:18:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A47173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8070081BCB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk6y_krU2kiX for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 138B081BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138B081BC6
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 138B081BC6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:18:31 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5A4F531E0B83; Wed, 04 Feb 2026 13:18:30 +0100 (CET)
Date: Wed, 4 Feb 2026 13:18:30 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYM5FlILmzX3apKt@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770207510; bh=a2vB2WrkR4u+rZyyLd7uu15fA3f6OKynYZ1qwjEj5Ac=;
 h=Date:From:To:Subject:From;
 b=M8Z0WEhvLnsbS8uZOh1g181drvR3/C3BL711cr5Qx+QU6V0lbCxlCeaeiXW9aHOCA
 JCJviIsXXlyV+bXgUJ36f1bXi4tB+fY+vnTqr75iVk2A4RwyqLuFF7QAn0bkJ+/I4t
 OOrM3itgZtUbmsYtPmPKN77xJ0bOGIW36v2uWC9IJsgaAelcRiVz7Ocs+6qiNUx39D
 kAjNDzjM1t9dazE4T4M3rsYZgV32cE29OkGvsDdLq4IE87M56ViE+W2vZf+JXEhD9u
 HhydFk/m35CI/im2vVbncsCO4OGUdjrAGstNLY086Jnj4IQRWzWL+/i0NnR8dcfkVf
 VX6bULfTtFZHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 4/5] package/firefox: new package
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
v2->v3:
  - update to latest esr
  - do not use system ICU, Buildroot version is too new
  - add explicitely host rust dependency
  - add python3.14 compatibility patch from LFS project
---
 package/Config.in                            |   1 +
 package/firefox/0001-python_3.14_fixes.patch | 115 +++++++++++++++++++
 package/firefox/Config.in                    |  56 +++++++++
 package/firefox/firefox.hash                 |   3 +
 package/firefox/firefox.mk                   |  95 +++++++++++++++
 5 files changed, 270 insertions(+)
 create mode 100644 package/firefox/0001-python_3.14_fixes.patch
 create mode 100644 package/firefox/Config.in
 create mode 100644 package/firefox/firefox.hash
 create mode 100644 package/firefox/firefox.mk

diff --git a/package/Config.in b/package/Config.in
index 2f9fa35fb2..84c3a98114 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
+	source "package/firefox/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
diff --git a/package/firefox/0001-python_3.14_fixes.patch b/package/firefox/0001-python_3.14_fixes.patch
new file mode 100644
index 0000000000..7dffcc2ab4
--- /dev/null
+++ b/package/firefox/0001-python_3.14_fixes.patch
@@ -0,0 +1,115 @@
+Submitted By:            Douglas R. Reno <renodr at linuxfromscratch dot org>
+Date:                    2025-11-24
+Initial Package Version: 140.5.0
+Upstream Status:         Applied in mainline Firefox
+Origin:                  Upstream (phabricator D261511, 261512, 262335)
+Description:             Fixes building Firefox, Thunderbird, and Spidermonkey
+                         with Python 3.14 by adjusting to various API changes.
+                         This includes ast.Str being removed, and changing to
+                         ast.Constant.
+
+Upstream: committed in mainline
+Signed-Off-By: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Naurp firefox-140.5.0.orig/python/mach/mach/command_util.py firefox-140.5.0/python/mach/mach/command_util.py
+--- firefox-140.5.0.orig/python/mach/mach/command_util.py	2025-11-24 11:23:51.750623267 -0600
++++ firefox-140.5.0/python/mach/mach/command_util.py	2025-11-24 11:24:21.308238189 -0600
+@@ -292,7 +292,7 @@ class DecoratorVisitor(ast.NodeVisitor):
+             kwarg_dict = {}
+ 
+             for name, arg in zip(["command", "subcommand"], decorator.args):
+-                kwarg_dict[name] = arg.s
++                kwarg_dict[name] = arg.value
+ 
+             for keyword in decorator.keywords:
+                 if keyword.arg not in relevant_kwargs:
+diff -Naurp firefox-140.5.0.orig/python/mozbuild/mozbuild/frontend/reader.py firefox-140.5.0/python/mozbuild/mozbuild/frontend/reader.py
+--- firefox-140.5.0.orig/python/mozbuild/mozbuild/frontend/reader.py	2025-11-24 11:23:51.768015306 -0600
++++ firefox-140.5.0/python/mozbuild/mozbuild/frontend/reader.py	2025-11-24 11:24:52.533651548 -0600
+@@ -470,7 +470,7 @@ class TemplateFunction:
+             return c(
+                 ast.Subscript(
+                     value=c(ast.Name(id=self._global_name, ctx=ast.Load())),
+-                    slice=c(ast.Index(value=c(ast.Str(s=node.id)))),
++                    slice=c(ast.Index(value=c(ast.Constant(value=node.id)))),
+                     ctx=node.ctx,
+                 )
+             )
+@@ -1039,8 +1039,8 @@ class BuildReader:
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
+@@ -1051,11 +1051,11 @@ class BuildReader:
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
+diff -Naurp firefox-140.5.0.orig/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py firefox-140.5.0/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
+--- firefox-140.5.0.orig/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py	2025-11-24 11:23:51.759248622 -0600
++++ firefox-140.5.0/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py	2025-11-24 11:24:52.533818626 -0600
+@@ -327,15 +327,13 @@ def assignment_node_to_source_filename_l
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
+diff -Naurp firefox-140.5.0.orig/python/mozbuild/mozbuild/vendor/vendor_python.py firefox-140.5.0/python/mozbuild/mozbuild/vendor/vendor_python.py
+--- firefox-140.5.0.orig/python/mozbuild/mozbuild/vendor/vendor_python.py	2025-11-24 11:23:51.759208183 -0600
++++ firefox-140.5.0/python/mozbuild/mozbuild/vendor/vendor_python.py	2025-11-24 13:07:12.726375733 -0600
+@@ -40,6 +40,10 @@ EXCLUDED_PACKAGES = {
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
+diff -Naurp firefox-140.5.0.orig/third_party/python/jsonschema/jsonschema/validators.py firefox-140.5.0/third_party/python/jsonschema/jsonschema/validators.py
+--- firefox-140.5.0.orig/third_party/python/jsonschema/jsonschema/validators.py	2025-11-24 11:23:51.358876258 -0600
++++ firefox-140.5.0/third_party/python/jsonschema/jsonschema/validators.py	2025-11-24 13:07:12.726605890 -0600
+@@ -875,8 +875,11 @@ class RefResolver:
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
diff --git a/package/firefox/Config.in b/package/firefox/Config.in
new file mode 100644
index 0000000000..266bfa2309
--- /dev/null
+++ b/package/firefox/Config.in
@@ -0,0 +1,56 @@
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
+	select BR2_PACKAGE_HOST_RUST
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
index 0000000000..0b72224a59
--- /dev/null
+++ b/package/firefox/firefox.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  608a739071726f30236f7100ec5e30e1b8ec342d4e91e715948c287909cb1529  firefox-140.7.0esr.source.tar.xz
+sha256  d10965daab0b819bef778c629a94cdd094ffb4ede37239b3d263884a574352c0  toolkit/content/license.html
diff --git a/package/firefox/firefox.mk b/package/firefox/firefox.mk
new file mode 100644
index 0000000000..db604fb9d5
--- /dev/null
+++ b/package/firefox/firefox.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# firefox
+#
+################################################################################
+
+FIREFOX_VERSION = 140.7.0esr
+FIREFOX_SOURCE = firefox-$(FIREFOX_VERSION).source.tar.xz
+FIREFOX_SITE = https://ftp.mozilla.org/pub/firefox/releases/$(FIREFOX_VERSION)/source
+FIREFOX_LICENSE = MPL-2.0
+FIREFOX_LICENSE_FILES = toolkit/content/license.html
+FIREFOX_DEPENDENCIES = \
+	host-rustc \
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
+	--without-system-icu \
+	--with-system-av1 \
+	--with-system-ffi \
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
