Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DF8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4D960F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA4D960F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94981400D2;
	Tue, 26 Oct 2021 19:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvwitgAafWVp; Tue, 26 Oct 2021 19:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8E76400E0;
	Tue, 26 Oct 2021 19:58:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68CDC1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 643434024F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmxX45kfhA4p for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:57:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0C304011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:57:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s19so260386wra.2
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klz1m4rX2dMGMWLfOhdY3+ci/ORAb1UwFZj4YEHSvYc=;
 b=PYeSyGl9waAGj5vyReXPDUMz88pIqOWXjWF4yXmNoRwGAliloA/oQT7O+nTpv4iKav
 o6OUkk3BIzALkzcIHx1Wqvotdr1kmlxp+c9UQCabXT1RPkx5Iz5cEMbvNSZpMvhUdfte
 ucnW1nN1JLrrWzxMrIxzQdkPEvdl05y9Lt0uTEFt3qKXY0JcdhNW76byQ/NLcnq+IWTx
 KQE2C2GZrKIEEkrS1fAGCxqbTaAxR1Jg9oiARIAs6vwt3t1VbiM/0k1kjRpeICo7w2uT
 RUs9FpdL37GJLYuEC+bFLnHhrm/H5TO5zWLmZHTIhQ44kAs8XH22EsY3ciYV1yk8rnYs
 sdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klz1m4rX2dMGMWLfOhdY3+ci/ORAb1UwFZj4YEHSvYc=;
 b=Ga8+w6uJjm2yQGy/7tt71aY0/bpWhL6xZWimyO9+B3CeOeWAongMUBqqrt/pt3O3bC
 jhjyS+Z6VKM7Kydfg4aMw8q9Atg3xgJK8WDqCT9f9Ry2F89LKCt8cRah8kc4op9hFsQe
 b/hzfTC15e7Ai7ogEC3wUbeKwqS6pvzRaiid7ZqFvr1vHwTkCFYPy27sPUw6rQLnuQbZ
 WRkyEHDO5jYth2KIcwNkVX9AqZ2UHmh9kTevVwznp9NOAS475X14FJzy7FLe4hndxV0M
 U9ii0s1/F8M7a3ilwlWPkcBivdWbzV0d4QquHZ9oUMQVDw00qJMdO4So/DhuTg7b7sxJ
 MUMA==
X-Gm-Message-State: AOAM530Kx2rSiYbHISxmz6GMiH/UF60G0z+CCEBXr4Ib6rT7Uu6K8C8y
 UZoInJcSohE5bSJXoIYwa7wxw1kveHA=
X-Google-Smtp-Source: ABdhPJzjQ0NTutdeirHkrFFnELDuCOexNlsYY14BnVkqi+8k0nY/4cg43sg5EVFZgoqkq0k3VO7/0A==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr35170178wrd.73.1635278275722; 
 Tue, 26 Oct 2021 12:57:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id i14sm1388175wmb.48.2021.10.26.12.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 12:57:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:56:01 +0200
Message-Id: <20211026195601.4056614-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmediaart: bump to version 1.9.5
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package
- Drop BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE which is not supported
  anymore
- Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/libmediaart/-/blob/1.9.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              |  7 ++
 .../0001-meson-add-introspection-option.patch | 87 +++++++++++++++++++
 .../0002-meson-add-unit_tests-option.patch    | 48 ++++++++++
 package/libmediaart/Config.in                 |  8 +-
 package/libmediaart/libmediaart.hash          |  6 +-
 package/libmediaart/libmediaart.mk            | 25 ++----
 6 files changed, 155 insertions(+), 26 deletions(-)
 create mode 100644 package/libmediaart/0001-meson-add-introspection-option.patch
 create mode 100644 package/libmediaart/0002-meson-add-unit_tests-option.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 23c3ee29ee..481747a85e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
+	bool "libmediaart 'none' backend removed"
+	select BR2_LEGACY
+	help
+	  'none' backend has been removed from libmediaart since version
+	  1.9.5.
+
 config BR2_BINUTILS_VERSION_CSKY
 	bool "binutils csky version removed"
 	select BR2_LEGACY
diff --git a/package/libmediaart/0001-meson-add-introspection-option.patch b/package/libmediaart/0001-meson-add-introspection-option.patch
new file mode 100644
index 0000000000..2b849040fe
--- /dev/null
+++ b/package/libmediaart/0001-meson-add-introspection-option.patch
@@ -0,0 +1,87 @@
+From ee7d8736af172cd5ad71a0bd511c39daf401e3f6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Oct 2021 23:35:26 +0200
+Subject: [PATCH] meson: add introspection option
+
+Add introspection option
+
+Fix #3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/libmediaart/-/merge_requests/14]
+---
+ libmediaart/meson.build | 42 +++++++++++++++++++++--------------------
+ meson_options.txt       |  2 ++
+ 2 files changed, 24 insertions(+), 20 deletions(-)
+
+diff --git a/libmediaart/meson.build b/libmediaart/meson.build
+index 56e00ab..2f44e63 100644
+--- a/libmediaart/meson.build
++++ b/libmediaart/meson.build
+@@ -41,28 +41,30 @@ libmediaart = shared_library(
+   install: true,
+ )
+ 
+-gir_args = [
+-  '--quiet',
+-  '-DLIBMEDIAART_COMPILATION',
+-]
++if get_option('introspection')
++  gir_args = [
++    '--quiet',
++    '-DLIBMEDIAART_COMPILATION',
++  ]
+ 
+-libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
+-  sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
+-  nsversion: libmediaart_api_version,
+-  namespace: 'MediaArt',
+-  identifier_prefix: 'MediaArt',
+-  symbol_prefix: 'media_art',
+-  includes: ['Gio-2.0', 'GObject-2.0'],
+-  header: 'libmediaart/mediaart.h',
+-  export_packages: 'libmediaart-' + libmediaart_api_version,
+-  extra_args: gir_args,
+-  install: true
+-)
++  libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
++    sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
++    nsversion: libmediaart_api_version,
++    namespace: 'MediaArt',
++    identifier_prefix: 'MediaArt',
++    symbol_prefix: 'media_art',
++    includes: ['Gio-2.0', 'GObject-2.0'],
++    header: 'libmediaart/mediaart.h',
++    export_packages: 'libmediaart-' + libmediaart_api_version,
++    extra_args: gir_args,
++    install: true
++  )
+ 
+-libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
+-  sources: libmediaart_gir_and_typelib[0],
+-  packages: 'gio-2.0',
+-  install: true)
++  libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
++    sources: libmediaart_gir_and_typelib[0],
++    packages: 'gio-2.0',
++    install: true)
++endif
+ 
+ libmediaart_dep = declare_dependency(
+   link_with: libmediaart,
+diff --git a/meson_options.txt b/meson_options.txt
+index 3ef49ba..b8c51b1 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,7 @@
+ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'qt5'],
+        description: 'Which image processing backend to use')
++option('introspection', type : 'boolean', value : 'true',
++       description : 'Enable / disable the GObject-Introspection integration')
+ option('gtk_doc',
+   type: 'boolean',
+   value: 'false',
+-- 
+2.33.0
+
diff --git a/package/libmediaart/0002-meson-add-unit_tests-option.patch b/package/libmediaart/0002-meson-add-unit_tests-option.patch
new file mode 100644
index 0000000000..3519ff1984
--- /dev/null
+++ b/package/libmediaart/0002-meson-add-unit_tests-option.patch
@@ -0,0 +1,48 @@
+From 01d94777d9d1906750db0e27e2e7b8f228ae4343 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 23:45:53 +0200
+Subject: [PATCH] meson: add unit_tests option
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:  not sent yet (waiting feedback on first patch)]
+---
+ meson_options.txt |  2 ++
+ tests/meson.build | 14 ++++++++------
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index b8c51b1..1172f93 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,6 +2,8 @@ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'q
+        description: 'Which image processing backend to use')
+ option('introspection', type : 'boolean', value : 'true',
+        description : 'Enable / disable the GObject-Introspection integration')
++option('unit_tests', type : 'boolean', value : 'true',
++       description : 'Enable / disable unit tests')
+ option('gtk_doc',
+   type: 'boolean',
+   value: 'false',
+diff --git a/tests/meson.build b/tests/meson.build
+index 28834c0..02c96a1 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -1,7 +1,9 @@
+-mediaart_test = executable('mediaart-test',
+-  'mediaarttest.c',
+-  dependencies: libmediaart_dep,
+-)
++if get_option('unit_tests')
++  mediaart_test = executable('mediaart-test',
++    'mediaarttest.c',
++    dependencies: libmediaart_dep,
++  )
+ 
+-test('mediaart', mediaart_test,
+-     env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
++  test('mediaart', mediaart_test,
++       env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
++endif
+-- 
+2.33.0
+
diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
index c11d6f49d9..d7973444ae 100644
--- a/package/libmediaart/Config.in
+++ b/package/libmediaart/Config.in
@@ -18,13 +18,7 @@ if BR2_PACKAGE_LIBMEDIAART
 
 choice
 	prompt "media art backend"
-	default BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
-
-config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
-	bool "none"
-	help
-	  With no backend, libmediaart will not be able to process MP3
-	  album art.
+	default BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 
 config BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 	bool "gdk-pixbuf"
diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index d51c056223..d7115b20d4 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.4.sha256sum:
-sha256	a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d	libmediaart-1.9.4.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.5.sha256sum:
+sha256  07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6  libmediaart-1.9.5.tar.xz
 
 # Locally computed:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LESSER
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 0d110a43e5..b4c09d85e1 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,39 +5,32 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).4
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).5
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
 LIBMEDIAART_LICENSE = LGPL-2.1+
 LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
 LIBMEDIAART_INSTALL_STAGING = YES
-LIBMEDIAART_DEPENDENCIES = libglib2
-LIBMEDIAART_CONF_OPTS = --disable-unit-tests
+LIBMEDIAART_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
+LIBMEDIAART_CONF_OPTS = -Dunit_tests=false
+LIBMEDIAART_LDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF),y)
 LIBMEDIAART_DEPENDENCIES += gdk-pixbuf
-LIBMEDIAART_CONF_OPTS += \
-	--enable-gdkpixbuf \
-	--disable-qt
+LIBMEDIAART_CONF_OPTS += -Dimage_library=gdk-pixbuf
 else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 # qt5 needs c++11 (since qt-5.7)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 LIBMEDIAART_DEPENDENCIES += qt5base
-LIBMEDIAART_CONF_OPTS += \
-	--disable-gdkpixbuf \
-	--enable-qt
-else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE),y)
-LIBMEDIAART_CONF_OPTS += \
-	--disable-gdkpixbuf \
-	--disable-qt
+LIBMEDIAART_CONF_OPTS += -Dimage_library=qt5
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBMEDIAART_CONF_OPTS += --enable-introspection
+LIBMEDIAART_CONF_OPTS += -Dintrospection=true
 LIBMEDIAART_DEPENDENCIES += gobject-introspection
 else
-LIBMEDIAART_CONF_OPTS += --disable-introspection
+LIBMEDIAART_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
