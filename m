Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6F3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32D22400AF;
	Sat,  8 Jan 2022 22:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v3hvj0zimL4x; Sat,  8 Jan 2022 22:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A0540220;
	Sat,  8 Jan 2022 22:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45F3D1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 291C860A9B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6P_2Qez-xcY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:44:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D741B60A93
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:44:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o3so18764480wrh.10
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLC/YdzqxMNr1XSHwh5cpJ4xnfh08bc7In7pdb3MGO8=;
 b=Aof7kKZd9Z2QtdtN3XCfXkRDIe6uoZi/cuILFwKyjk3Zk0CeDzWCFP77Xmmi0BIfIl
 pdpidoiU23q0A5Im08sJcop7hIenus1MXbYWSY2yLivscOV6zJFOQTXKPNcmSoRAHoKI
 fSYJ40TUZQUFfF0NoopuYJqVyXa8IwDTKvJr8etk7uQIe9j/cEcVnacV1rvlRTfsKJqA
 5HNs9OTAPDfNjm5qwm+pll5qKNtifCkJHGJj29xHKqDNNDUeIyVSZXs2Hm65QT8pD8gX
 vXSe1MVYm8mBpDpjP1MGMvn0ELsUKNWnaWi0M6norDst1bsdnq2h/7VdtUZ+uRKVnV0a
 lCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLC/YdzqxMNr1XSHwh5cpJ4xnfh08bc7In7pdb3MGO8=;
 b=4FcCMYWYOkV/nfCq96pGK0biYhpT4rNI+cSEMhsrGEMr5bQ0NkFeEkWmuQSlua9GUZ
 6NDEU5hUl+Qu4DoIqr4JPADw9a5EPuW5V4KBDPIcJUpU7RU+9ViqMcMzB+P7dL5rYta0
 vJ5g1cOygXdHzgAcA5aOt1NpYEPhgTcJeQFeZtxiWRSJ/b1a7flOPzVJjnnvOJEUQNvM
 D7n5Oo+60OJKE2Mz2LZ3tGD5mAsb7oYelmDG6XYgPFYpwMdXFv9/m3Arkg4rpD4iPqXO
 rp0tngcl9kbXrX0IJjYoJcjT6BmaRYXNYyaiR00TIGUxObwOV0CZegCtOP0W/8zSoWkp
 elOg==
X-Gm-Message-State: AOAM531N55W7+N0zItbrZwKM14IeA1h+h+dmAcZlFgP/buq3GReEqKXF
 mN7OD2GTVxRLiSfXFdT9E6YL0A5iRIE=
X-Google-Smtp-Source: ABdhPJyBlJD/M2kwZCj6SUBVLqcbchdfrHMYsigIwoUe7qIwCgW9UvtCp7aWYi3aMrx/0loEKoIWbA==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr62519689wri.101.1641681886051; 
 Sat, 08 Jan 2022 14:44:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m5sm2660183wml.14.2022.01.08.14.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 14:44:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:43:36 +0100
Message-Id: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/minizip: add minizip-zlib support
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a virtual package to allow the user to select the minizip provider:
 - the current minizip (which has been renamed minizip-ng since
   https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178ceaa389cbdb5b1ba8cd97a)
 - the 'legacy' minizip provided by zlib which is still widely supported
   by various opensource packages such as domoticz

There is no need to add entries in Config.legacy as the previous options
are kept and the default provider of minizip is minizip-ng.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                    |  2 +
 .../minizip-ng.hash}                          |  2 +-
 package/minizip-ng/minizip-ng.mk              | 76 +++++++++++++++++++
 package/minizip-zlib/minizip-zlib.hash        |  4 +
 package/minizip-zlib/minizip-zlib.mk          | 24 ++++++
 package/minizip/Config.in                     | 40 +++++++++-
 package/minizip/minizip.mk                    | 69 +----------------
 7 files changed, 144 insertions(+), 73 deletions(-)
 rename package/{minizip/minizip.hash => minizip-ng/minizip-ng.hash} (82%)
 create mode 100644 package/minizip-ng/minizip-ng.mk
 create mode 100644 package/minizip-zlib/minizip-zlib.hash
 create mode 100644 package/minizip-zlib/minizip-zlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bbbb47f6ac..47a3d4bfe0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -922,6 +922,8 @@ F:	package/mbedtls/
 F:	package/mbedtls3/
 F:	package/minissdpd/
 F:	package/minizip/
+F:	package/minizip-ng/
+F:	package/minizip-zlib/
 F:	package/mongodb/
 F:	package/motion/
 F:	package/mutt/
diff --git a/package/minizip/minizip.hash b/package/minizip-ng/minizip-ng.hash
similarity index 82%
rename from package/minizip/minizip.hash
rename to package/minizip-ng/minizip-ng.hash
index 3e87e64dae..f866363c93 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip-ng/minizip-ng.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2ab219f651901a337a7d3c268128711b80330a99ea36bdc528c76b591a624c3c  minizip-3.0.4.tar.gz
+sha256  2ab219f651901a337a7d3c268128711b80330a99ea36bdc528c76b591a624c3c  minizip-ng-3.0.4.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip-ng/minizip-ng.mk b/package/minizip-ng/minizip-ng.mk
new file mode 100644
index 0000000000..ec3903d226
--- /dev/null
+++ b/package/minizip-ng/minizip-ng.mk
@@ -0,0 +1,76 @@
+################################################################################
+#
+# minizip-ng
+#
+################################################################################
+
+MINIZIP_NG_VERSION = 3.0.4
+MINIZIP_NG_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_NG_VERSION))
+MINIZIP_NG_LICENSE = Zlib
+MINIZIP_NG_LICENSE_FILES = LICENSE
+MINIZIP_NG_CPE_ID_VENDOR = minizip_project
+MINIZIP_NG_CPE_ID_PRODUCT = minizip
+MINIZIP_NG_INSTALL_STAGING = YES
+MINIZIP_NG_PROVIDES = minizip
+MINIZIP_NG_DEPENDENCIES = host-pkgconf
+MINIZIP_NG_CONF_OPTS = \
+	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DMZ_BUILD_TEST=ON) \
+	-DMZ_COMPAT=OFF \
+	-DMZ_FETCH_LIBS=OFF
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+MINIZIP_NG_DEPENDENCIES += bzip2
+MINIZIP_NG_CONF_OPTS += -DMZ_BZIP2=ON
+else
+MINIZIP_NG_CONF_OPTS += -DMZ_BZIP2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MINIZIP_NG_DEPENDENCIES += libiconv
+MINIZIP_NG_CONF_OPTS += -DMZ_ICONV=ON
+else
+MINIZIP_NG_CONF_OPTS += -DMZ_ICONV=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+MINIZIP_NG_DEPENDENCIES += libbsd
+MINIZIP_NG_CONF_OPTS += -DMZ_LIBBSD=ON
+else
+MINIZIP_NG_CONF_OPTS += -DMZ_LIBBSD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MINIZIP_NG_DEPENDENCIES += openssl
+MINIZIP_NG_CONF_OPTS += \
+	-DMZ_OPENSSL=ON \
+	-DMZ_PKCRYPT=ON \
+	-DMZ_WZAES=ON
+else
+MINIZIP_NG_CONF_OPTS += \
+	-DMZ_OPENSSL=OFF \
+	-DMZ_PKCRYPT=OFF \
+	-DMZ_WZAES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+MINIZIP_NG_DEPENDENCIES += xz
+MINIZIP_NG_CONF_OPTS += -DMZ_LZMA=ON
+else
+MINIZIP_NG_CONF_OPTS += -DMZ_LZMA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MINIZIP_NG_DEPENDENCIES += zlib
+MINIZIP_NG_CONF_OPTS += -DMZ_ZLIB=ON
+else
+MINIZIP_NG_CONF_OPTS += -DMZ_ZLIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MINIZIP_NG_DEPENDENCIES += zstd
+MINIZIP_NG_CONF_OPTS += -DMZ_ZSTD=ON
+else
+MINIZIP_NG_CONF_OPTS += -DMZ_ZSTD=OFF
+endif
+
+$(eval $(cmake-package))
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
new file mode 100644
index 0000000000..4d2c5c29d3
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -0,0 +1,4 @@
+# From http://www.zlib.net/
+sha256  4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+# License files, locally calculated
+sha256  7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
new file mode 100644
index 0000000000..67d4e31f41
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# minizip-zlib
+#
+################################################################################
+
+MINIZIP_ZLIB_VERSION = 1.2.11
+MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
+MINIZIP_ZLIB_SITE = http://www.zlib.net
+MINIZIP_ZLIB_LICENSE = Zlib
+MINIZIP_ZLIB_LICENSE_FILES = README
+MINIZIP_ZLIB_INSTALL_STAGING = YES
+MINIZIP_ZLIB_PROVIDES = minizip
+MINIZIP_ZLIB_SUBDIR = contrib/minizip
+MINIZIP_ZLIB_AUTORECONF = YES
+MINIZIP_ZLIB_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_MINIZIP_DEMOS),y)
+MINIZIP_ZLIB_CONF_OPTS += --enable-demos
+else
+MINIZIP_ZLIB_CONF_OPTS += --disable-demos
+endif
+
+$(eval $(autotools-package))
diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index e4d185d9d7..b88091e809 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,13 +1,38 @@
 config BR2_PACKAGE_MINIZIP
-	bool "minizip"
+	bool "minizip support"
+	help
+	  Select the desired minizip provider.
+
+if BR2_PACKAGE_MINIZIP
+
+choice
+	prompt "minizip variant"
+	default BR2_PACKAGE_MINIZIP_NG
+	help
+	  Select the desired minizip provider.
+
+config BR2_PACKAGE_MINIZIP_NG
+	bool "minizip-ng"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_HAS_MINIZIP
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
 	  MimarSinan Codex Suite 2002 tools, and compatible sofware.
 
-	  https://github.com/nmoinvaz/minizip
+	  https://github.com/zlib-ng/minizip-ng
+
+config BR2_PACKAGE_MINIZIP_ZLIB
+	bool "minizip-zlib"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_HAS_MINIZIP
+	help
+	  Legacy minizip provided in contrib/minizip of zlib.
+
+	  https://www.winimage.com/zLibDll/minizip.html
+
+endchoice
 
 config BR2_PACKAGE_MINIZIP_DEMOS
 	bool "minizip"
@@ -15,5 +40,12 @@ config BR2_PACKAGE_MINIZIP_DEMOS
 	help
 	  Enable minizip binary tool.
 
-comment "minizip needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+config BR2_PACKAGE_HAS_MINIZIP
+	bool
+
+config BR2_PACKAGE_PROVIDES_MINIZIP
+	string
+	default "minizip-zlib" if BR2_PACKAGE_MINIZIP_ZLIB
+	default "minizip-ng" if BR2_PACKAGE_MINIZIP_NG
+
+endif
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 07f67c1354..95f1a17156 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,71 +4,4 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.4
-MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
-MINIZIP_DEPENDENCIES = host-pkgconf
-MINIZIP_INSTALL_STAGING = YES
-MINIZIP_CONF_OPTS = \
-	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DMZ_BUILD_TEST=ON) \
-	-DMZ_COMPAT=OFF \
-	-DMZ_FETCH_LIBS=OFF
-MINIZIP_LICENSE = Zlib
-MINIZIP_LICENSE_FILES = LICENSE
-MINIZIP_CPE_ID_VENDOR = minizip_project
-
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-MINIZIP_DEPENDENCIES += bzip2
-MINIZIP_CONF_OPTS += -DMZ_BZIP2=ON
-else
-MINIZIP_CONF_OPTS += -DMZ_BZIP2=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-MINIZIP_DEPENDENCIES += libiconv
-MINIZIP_CONF_OPTS += -DMZ_ICONV=ON
-else
-MINIZIP_CONF_OPTS += -DMZ_ICONV=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBBSD),y)
-MINIZIP_DEPENDENCIES += libbsd
-MINIZIP_CONF_OPTS += -DMZ_LIBBSD=ON
-else
-MINIZIP_CONF_OPTS += -DMZ_LIBBSD=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MINIZIP_DEPENDENCIES += openssl
-MINIZIP_CONF_OPTS += \
-	-DMZ_OPENSSL=ON \
-	-DMZ_PKCRYPT=ON \
-	-DMZ_WZAES=ON
-else
-MINIZIP_CONF_OPTS += \
-	-DMZ_OPENSSL=OFF \
-	-DMZ_PKCRYPT=OFF \
-	-DMZ_WZAES=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_XZ),y)
-MINIZIP_DEPENDENCIES += xz
-MINIZIP_CONF_OPTS += -DMZ_LZMA=ON
-else
-MINIZIP_CONF_OPTS += -DMZ_LZMA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-MINIZIP_DEPENDENCIES += zlib
-MINIZIP_CONF_OPTS += -DMZ_ZLIB=ON
-else
-MINIZIP_CONF_OPTS += -DMZ_ZLIB=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ZSTD),y)
-MINIZIP_DEPENDENCIES += zstd
-MINIZIP_CONF_OPTS += -DMZ_ZSTD=ON
-else
-MINIZIP_CONF_OPTS += -DMZ_ZSTD=OFF
-endif
-
-$(eval $(cmake-package))
+$(eval $(virtual-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
