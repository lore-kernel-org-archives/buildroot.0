Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DADC433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 13:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D389A83163;
	Fri,  7 Oct 2022 13:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D389A83163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fb4wF2Ev2C3P; Fri,  7 Oct 2022 13:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC9AE830B8;
	Fri,  7 Oct 2022 13:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC9AE830B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 799AE1BF30C
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 13:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5595B60BE0
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 13:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5595B60BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8olQj60koGf for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 13:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1502460BC7
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1502460BC7
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 13:39:17 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id g13so2549482ile.0
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 06:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeS+Rkv+97gyaxyuzwSKZSjcTVnlNqZg68e+3XBskT8=;
 b=dh5vKnkken/FrDe2fXkon2IMFpnkPbqV2ik8oXCw/3KzQOXZiyC87hFWx1eO236X+F
 t1SuwiVC76YA31l6A0ePcJE8RshtSzv7zcBttxOXlv0d+IuIcIpeDvwpXvMScZLJPpj6
 G53qYWSUtkB7iDh+mJGC0VQqi8E2c0K2np8RozhBNPYt2jx+xBqrFhBRlNmwVkUGdhta
 jjI/8dNGNC8D/5KF1G1bT/TuIobfkdCl6oKDImnsbB2L2Hf0U+Gb29KqINRDCvFxFjd3
 Jiq136l/KGgvzOKcG7052Hq6fJR6VOBoRmcKU0/Pz6aX6bD7LFksEhd1W285Ejx16PsQ
 asgw==
X-Gm-Message-State: ACrzQf28RI5g5LR0O+SEXfnUb0f7MXuFKDKJvPBF5qYjQ5K0FER2Ist/
 kMX70yC+FVGG6jzX7dNeZsgJ8Wx45ELXzQ==
X-Google-Smtp-Source: AMsMyM4MdZ3DMZITDHB33QiNCSQ1aqUVLoeOBd4H1oww9SB5pMUtf0GuLWLurLco7j8nmVlkBij7qA==
X-Received: by 2002:a05:6e02:12ca:b0:2f6:5f42:8a1b with SMTP id
 i10-20020a056e0212ca00b002f65f428a1bmr2305172ilm.109.1665149955739; 
 Fri, 07 Oct 2022 06:39:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x3-20020a92b003000000b002f6365aae11sm875861ilh.87.2022.10.07.06.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:39:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 07:39:11 -0600
Message-Id: <20221007133912.2869000-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeS+Rkv+97gyaxyuzwSKZSjcTVnlNqZg68e+3XBskT8=;
 b=RrL0q6pDQnNSGD+FqSQlzCYeCSZGZo+btKdu4WJTigGuURqdYnGnigbL9d7LKCkaWv
 PsbTQH1SVYeL7T84yvihG9IHSBBUZJjmRkF9CCuaBnYraeYUT/V2yQfxU5rpllVmP2xS
 3Zl6zrLl12RuftxM7nZxbOcLpNQRlWJxPOzm2PmMRNj4CNeOwsgxP7w+k6BHn4xUf4We
 eVDqSX4sw1Qlrk3RQYjMG3vYdCaScV9gi8ts+Y5GzVtzxDuGBL62CsJNSg90m+Z+A4Oo
 xaXITsTPsLCXBSHyFgBLzsPKh3oDWBM4AXsNPY8AKSV+h/aNTRmM2DkKnlsoapS+9c9O
 e08g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RrL0q6pD
Subject: [Buildroot] [PATCH 1/2] package/libglib2: bump to version 2.74.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Replace pcre with pcre2 dependency.

Drop no longer supported fam option.

COPYING hash changed due to formatting changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0002-remove-cpp-requirement.patch         | 87 -------------------
 package/libglib2/libglib2.hash                |  6 +-
 package/libglib2/libglib2.mk                  |  9 +-
 3 files changed, 7 insertions(+), 95 deletions(-)
 delete mode 100644 package/libglib2/0002-remove-cpp-requirement.patch

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
deleted file mode 100644
index 84511dea32..0000000000
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From dd65a8cfdeafeb18b72d8d1eb676c7ca43ae505f Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Mon, 16 Sep 2019 10:12:38 -0700
-Subject: [PATCH] remove cpp requirement
-
-The c++ test is necessary to ensure libglib doesn't accidentally use C++
-reserved keywords in public headers. Because this is just a test, it isn't
-necessary to have a C++ compiler to build libglib2.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-Upstream status: Denied (Buildroot specific)
-https://gitlab.gnome.org/GNOME/glib/issues/1748
----
- glib/glibconfig.h.in |  1 -
- meson.build          | 19 +------------------
- 2 files changed, 1 insertion(+), 19 deletions(-)
-
-diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
-index e66748d95..2173d8be6 100644
---- a/glib/glibconfig.h.in
-+++ b/glib/glibconfig.h.in
-@@ -119,7 +119,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
- @glib_vacopy@
- 
- @g_have_iso_c_varargs@
--@g_have_iso_cxx_varargs@
- 
- /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
-  * is passed ISO vararg support is turned off, and there is no work
-diff --git a/meson.build b/meson.build
-index 48fdfe864..5df242e39 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('glib', 'c', 'cpp',
-+project('glib', 'c',
-   version : '2.72.3',
-   # NOTE: We keep this pinned at 0.52 because that's what Debian Stable ships
-   meson_version : '>= 0.52.0',
-@@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
- )
- 
- cc = meson.get_compiler('c')
--cxx = meson.get_compiler('cpp')
- 
- cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
- 
-@@ -495,7 +494,6 @@ else
- endif
- 
- add_project_arguments(cc.get_supported_arguments(warning_c_args), language: 'c')
--add_project_arguments(cxx.get_supported_arguments(warning_cxx_args), language: 'cpp')
- 
- # FIXME: We cannot build some of the GResource tests with -z nodelete, which
- # means we cannot use that flag in add_project_link_arguments(), and must add
-@@ -1734,20 +1732,6 @@ if g_have_iso_c_varargs
- #endif''')
- endif
- 
--g_have_iso_cxx_varargs = cxx.compiles('''
--  void some_func (void) {
--    int a(int p1, int p2, int p3);
--    #define call_a(...) a(1,__VA_ARGS__)
--    call_a(2,3);
--  }''', name : 'ISO C99 varargs macros in C++')
--
--if g_have_iso_cxx_varargs
--  glibconfig_conf.set('g_have_iso_cxx_varargs', '''
--#ifdef __cplusplus
--# define G_HAVE_ISO_VARARGS 1
--#endif''')
--endif
--
- g_have_gnuc_varargs = cc.compiles('''
-   void some_func (void) {
-     int a(int p1, int p2, int p3);
-@@ -2381,7 +2365,6 @@ subdir('gobject')
- subdir('gthread')
- subdir('gmodule')
- subdir('gio')
--subdir('fuzzing')
- if build_tests
-   subdir('tests')
- endif
--- 
-2.34.1
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 0395ff234a..ccda94f7c1 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.72/glib-2.72.3.sha256sum
-sha256  4a39a2f624b8512d500d5840173eda7fa85f51c109052eae806acece85d345f0  glib-2.72.3.tar.xz
+# https://download.gnome.org/sources/glib/2.74/glib-2.74.0.sha256sum
+sha256  3652c7f072d7b031a6b5edd623f77ebc5dcd2ae698598abcc89ff39ca75add30  glib-2.74.0.tar.xz
 # License files, locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2970d5a7a9..a0dea81c3f 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.72
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION_MAJOR = 2.74
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -24,7 +24,6 @@ endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
-	-Dfam=false \
 	-Dglib_debug=disabled \
 	-Dlibelf=disabled \
 	-Dselinux=disabled \
@@ -35,12 +34,12 @@ HOST_LIBGLIB2_CONF_OPTS = \
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
-	libffi pcre zlib $(TARGET_NLS_DEPENDENCIES)
+	libffi pcre2 zlib $(TARGET_NLS_DEPENDENCIES)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
 	host-gettext \
 	host-libffi \
-	host-pcre \
+	host-pcre2 \
 	host-pkgconf \
 	host-util-linux \
 	host-zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
