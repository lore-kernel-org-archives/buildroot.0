Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E93FD006E
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 15:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5697E60BCC;
	Sun,  1 Mar 2026 15:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05x4_CAxsro6; Sun,  1 Mar 2026 15:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22EC060BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772379023;
	bh=XGfhq5YbqPey3uaRe0lC6tgpEwrUwj6yYlHhwuX6l/c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vp/btDvE8vNYE6+szqQQsJeSk8K1Pes28a/oPIv1O//1IoOPDZPSBK/COqxRpH+2w
	 8V84oqJjzSoQKvJpD0Dzl3DQDoG1zjnGZ7TcuGP8TmZk7EYrKRfoZIBhYvqPNZGf+P
	 lyG+V2YXYHOcgL4FTRU9c2GkTejDfcHOiXLKjyQpRugCzLgJsaEwiJ+NgFZGLivptz
	 8bMHtTygcREsOIJxq9cxHjzZKNzVOzPleFW9DDEnVwsT6RNNRz5V/SnUKLJ3289COT
	 zJouqAm4VQg0/JoWtfC4EaW0z/q8PRhp9fV/MJcan7O6erwCX9H9aJPqliah3HzrTd
	 BDvp5bOMZqRQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EC060BEA;
	Sun,  1 Mar 2026 15:30:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F7924E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 15:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E3260BEA
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 15:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amnXJjeAmT-C for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 15:30:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD7AC60BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD7AC60BCC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD7AC60BCC
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 15:30:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 025ABA4C1F06;
 Sun,  1 Mar 2026 16:30:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48450)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwikK-000000002TM-3Yee;
 Sun, 01 Mar 2026 15:30:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun,  1 Mar 2026 16:30:13 +0100
Message-ID: <20260301153015.1981106-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772379017;
 bh=at+GdLbnBYrR381vJifgg/jWhRlsaxJOmIB8yS9tQc0=;
 h=From:To:Cc:Subject:Date:From;
 b=cswLKmzd/NktCwz6crVrPQcMAOZKBFuzRQTegkHZeqFUMAWj4ASL78kD57foBcGAY
 SxRgbNqW+6qGk/chj80XlQcql+im21JP9fdZZPPjXIlVct6okuS1OHfLpBtwIZU8Ax
 epF1NWaI/yteAnjlrsBBZpp/1M+FNvReIiaeNNg+ZzUaqE6tna0EplNfWqcyMJ1doO
 WfQ7ZjYz45vJM1tcS3TNLC/qGnvDuANGc6C9eq9bY1naYrPm4h5ppqykpA6RyOp9JD
 TuLpzcqgdvTYSxhTbB36iSyJqW+/0mNykxivG07xJGr0+REXLqdg5UDUlT4xLaugfa
 OtoKmvAf8fYkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=cswLKmzd
Subject: [Buildroot] [PATCH/next v4 1/2] package/qpdf: bump to version 12.3.2
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

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Changelog:
https://qpdf.readthedocs.io/en/stable/release-notes.html

Quoting the release notes for version 12.3.0:
"A C++20 compiler is now required to build or test qpdf."
Updated Config.in accordingly.

Updating source URL (Github) and updating build system to cmake.

Build-tested using this defconfig

BR2_PACKAGE_QPDF=y
BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_OPENSSL=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED

32 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Bernd:
 - bumped to 12.3.2
 - raised gcc version to 10
 - removed configure option -DSKIP_OS_SECURE_RANDOM=ON as suggested
   by Angelo: https://lists.buildroot.org/pipermail/buildroot/2025-August/784962.html
 - added build test results]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v4: unchanged, added cups-filter patch to series to avoid a version bump
v3: various updates after last feedback from Thomas:
    https://lists.buildroot.org/pipermail/buildroot/2025-August/784962.html

 DEVELOPERS                     |  1 +
 package/cups-filters/Config.in |  6 +++---
 package/qpdf/Config.in         |  6 +++---
 package/qpdf/qpdf.hash         |  4 ++--
 package/qpdf/qpdf.mk           | 27 +++++++++++----------------
 5 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..5b07fea884 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -243,6 +243,7 @@ F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-spidev/
 F:	package/python-web2py/
+F:	package/qpdf/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index ded99a4774..b5b9e04a28 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # qpdf
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
@@ -32,9 +32,9 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
 
-comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 5"
+comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index accf2b5f34..ccb6715110 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
@@ -16,7 +16,7 @@ config BR2_PACKAGE_QPDF
 
 	  http://qpdf.sourceforge.net/
 
-comment "qpdf needs a toolchain w/ C++, gcc >= 5"
+comment "qpdf needs a toolchain w/ C++, gcc >= 10"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 08a048f2ed..81bee9e58c 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/10.5.0/qpdf-10.5.0.sha256/download
-sha256  88257d36a44fd5c50b2879488324dd9cafc11686ae49d8c4922a4872203ce006  qpdf-10.5.0.tar.gz
+# From https://github.com/qpdf/qpdf/releases/download/v12.3.2/qpdf-12.3.2.sha256
+sha256  6cba2f9f2cd887d905faeb99e0e51a307b217920d1bbf3e9cfbb2e8178a2deda  qpdf-12.3.2.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index d479515789..c11b42f60c 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,36 +4,31 @@
 #
 ################################################################################
 
-QPDF_VERSION = 10.5.0
-QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
+QPDF_VERSION = 12.3.2
+QPDF_SITE = https://github.com/qpdf/qpdf/releases/download/v$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_CPE_ID_VALID = YES
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
+QPDF_SUPPORTS_IN_SOURCE_BUILD = NO
 
-QPDF_CONF_OPTS = --with-random=/dev/urandom
-
-ifeq ($(BR2_USE_WCHAR),)
-QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"
-endif
+QPDF_CONF_OPTS = \
+	-DUSE_IMPLICIT_CRYPTO=OFF \
+	-DREQUIRE_CRYPTO_NATIVE=ON
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-QPDF_CONF_OPTS += --enable-crypto-gnutls
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=ON
 QPDF_DEPENDENCIES += gnutls
 else
-QPDF_CONF_OPTS += --disable-crypto-gnutls
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-QPDF_CONF_OPTS += --enable-crypto-openssl
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=ON
 QPDF_DEPENDENCIES += openssl
 else
-QPDF_CONF_OPTS += --disable-crypto-openssl
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-QPDF_CONF_ENV += LIBS=-latomic
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
