Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A30CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F6F83419;
	Wed, 29 Oct 2025 21:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fnM77I1nMsP; Wed, 29 Oct 2025 21:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3560883422
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3560883422;
	Wed, 29 Oct 2025 21:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D252A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 779304086D
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILa08p1OTWCw for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 21:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D2E440713
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D2E440713
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D2E440713
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:02:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC738A4C511D;
 Wed, 29 Oct 2025 22:02:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49418)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEDJO-000000002rv-2nEd;
 Wed, 29 Oct 2025 21:02:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed, 29 Oct 2025 22:02:29 +0100
Message-ID: <20251029210230.1841049-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761771750;
 bh=f6hGub5OJ0vbrUPsPE72yK58PsY+FmmETx2xce2RiOU=;
 h=From:To:Cc:Subject:Date:From;
 b=I8w8uKivNGR3HcVpcHhnIuxOvVL/UYe+buxwPmlyCeIEMUbQOuRUc/X6qCko+ehM3
 CnMYbUbS32vb1WVaFmh3nFdH+SPeR8EI6R2sOK5DsEw1yU2unCvGTPxo3E7p8twyVA
 4P8E4oqh47eHjGJrHjSkbXeQV057o4vQLsrb685P+SligqSeNEwOeNKdcPBHLC2Imi
 lBCx8FlqKr2aRzMm/FwL9m6ZN/t7p35VUaXfc2fWZ9+53Tz3uflGNHEVEcN7mVbeeW
 jrj9CGCZ8J/sriAxKSiqRP/AnNyixjoxf570p/NmNydXDGAQl2Rsonj2UP6rXDzRua
 7aeCSciFUcwhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=I8w8uKiv
Subject: [Buildroot] [PATCH v2 1/2] package/libxml2: fix build of packages
 detecting libxml2 using libxml2-config.cmake
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

Fixes build error seen with libiio:

mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
 in cross-compilation: '-I/usr/include/libxml2'

caused by bump of libxml2 to 2.15.0 with buildroot commit
d81922c1ef8825f10b802984d9721412a1a1a377.

Upstream acknowledged the problem and waits for a fix
https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2453923
so we revert the offending commit for now.

Fixes:
https://autobuild.buildroot.net/results/fde/fde40a3d6ac58f568e49419e5176db5a62a0a4d9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added comment about buildroot commit causing the problem

 ...-installation-directories-in-libxml2.patch | 85 +++++++++++++++++++
 package/libxml2/libxml2.mk                    |  2 +
 2 files changed, 87 insertions(+)
 create mode 100644 package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch

diff --git a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
new file mode 100644
index 0000000000..75232b6f00
--- /dev/null
+++ b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -0,0 +1,85 @@
+From 81992efb40b37cc893c55575a83cdd1cec1fde2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 29 Oct 2025 21:45:09 +0100
+Subject: [PATCH] Revert "cmake: Fix installation directories in
+ libxml2-config.cmake"
+
+This reverts commit 75dde50b20215a2a3a445b62f36a67c8ed337cab.
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac            | 11 -----------
+ libxml2-config.cmake.in | 11 +++++++----
+ meson.build             |  3 ---
+ 3 files changed, 7 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4eb629bb..150e06eb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+ AC_SUBST(XML_PRIVATE_CFLAGS)
+ AC_SUBST(XML_INCLUDEDIR)
+ 
+-# for libxml2-config.cmake.in
+-AX_RECURSIVE_EVAL(["$bindir"], [INSTALL_BINDIR])
+-AX_RECURSIVE_EVAL(["$includedir"], [INSTALL_INCLUDEDIR])
+-AX_RECURSIVE_EVAL(["$libdir"], [INSTALL_LIBDIR])
+-AC_SUBST(INSTALL_BINDIR)
+-AC_SUBST(INSTALL_INCLUDEDIR)
+-AC_SUBST(INSTALL_LIBDIR)
+-AM_SUBST_NOTMAKE(INSTALL_BINDIR)
+-AM_SUBST_NOTMAKE(INSTALL_INCLUDEDIR)
+-AM_SUBST_NOTMAKE(INSTALL_LIBDIR)
+-
+ AX_RECURSIVE_EVAL(["$sysconfdir"], [XML_SYSCONFDIR])
+ AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
+                    [System configuration directory (/etc)])
+diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
+index ff6433fa..b775cfee 100644
+--- a/libxml2-config.cmake.in
++++ b/libxml2-config.cmake.in
+@@ -24,17 +24,20 @@
+ #   LibXml2::LibXml2          - the LibXml2 library
+ #   LibXml2::xmllint          - the xmllint command-line executable
+ 
++get_filename_component(_libxml2_rootdir ${CMAKE_CURRENT_LIST_DIR}/../../../ ABSOLUTE)
++
+ set(LIBXML2_VERSION_MAJOR  @LIBXML_MAJOR_VERSION@)
+ set(LIBXML2_VERSION_MINOR  @LIBXML_MINOR_VERSION@)
+ set(LIBXML2_VERSION_MICRO  @LIBXML_MICRO_VERSION@)
+ set(LIBXML2_VERSION_STRING "@VERSION@")
+ set(LIBXML2_DEFINITIONS    "@XML_CFLAGS@")
+-set(LIBXML2_INCLUDE_DIR    @INSTALL_INCLUDEDIR@/libxml2)
+-set(LIBXML2_LIBRARY_DIR    @INSTALL_LIBDIR@)
++set(LIBXML2_INSTALL_PREFIX ${_libxml2_rootdir})
++set(LIBXML2_INCLUDE_DIR    ${_libxml2_rootdir}/include/libxml2)
++set(LIBXML2_LIBRARY_DIR    ${_libxml2_rootdir}/lib)
+ 
+ find_library(LIBXML2_LIBRARY NAMES xml2 HINTS ${LIBXML2_LIBRARY_DIR} NO_DEFAULT_PATH)
+-find_program(LIBXML2_XMLCATALOG_EXECUTABLE NAMES xmlcatalog HINTS @INSTALL_BINDIR@ NO_DEFAULT_PATH)
+-find_program(LIBXML2_XMLLINT_EXECUTABLE NAMES xmllint HINTS @INSTALL_BINDIR@ NO_DEFAULT_PATH)
++find_program(LIBXML2_XMLCATALOG_EXECUTABLE NAMES xmlcatalog HINTS ${_libxml2_rootdir}/bin NO_DEFAULT_PATH)
++find_program(LIBXML2_XMLLINT_EXECUTABLE NAMES xmllint HINTS ${_libxml2_rootdir}/bin NO_DEFAULT_PATH)
+ 
+ set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
+ set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
+diff --git a/meson.build b/meson.build
+index 31c73b62..8728852c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -577,9 +577,6 @@ config_cmake = configuration_data()
+ config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
+ config_cmake.set('LIBXML_MINOR_VERSION', v_min)
+ config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
+-config_cmake.set('INSTALL_BINDIR', dir_bin)
+-config_cmake.set('INSTALL_INCLUDEDIR', dir_include)
+-config_cmake.set('INSTALL_LIBDIR', dir_lib)
+ config_cmake.set('VERSION', meson.project_version())
+ config_cmake.set10('BUILD_SHARED_LIBS',
+                    get_option('default_library') != 'static')
+-- 
+2.47.3
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index bf83ec2041..de0ec42eca 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -14,6 +14,8 @@ LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = Copyright
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
+# 0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+LIBXML2_AUTORECONF = YES
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
