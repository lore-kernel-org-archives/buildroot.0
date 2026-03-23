Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39171F46137
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 15:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86AD8230B;
	Mon, 23 Mar 2026 15:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUbmfDLCME65; Mon, 23 Mar 2026 15:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B82A68230D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774278216;
	bh=ky4Ui65thBpEFNTWaibjWUlKJsQ53fDxwW5Xg/ADPaY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m8gudPFTt1/dC/6/QQ6f/XDQJ/TCQE/maDy3px0kedXursOpujr0rui6B91SgigDO
	 5ncwzs0p3vJopElar34WsVfjPP4K16y1CgHe1Ymo8oqZIlqL9z1RIz4L/AGKP18HWX
	 qzijZxBxM42nN9+nSHcs8oqMGnBDmRUCAdVi8ZpTVbSg8ZAEKbrxj130Y7A7tpogSF
	 /QTIrBRY2YuzOQV08ce/196itEpDSCY6SKnciZ5mXTwwrRG4inIOyULZxzq4E6PJTs
	 VLiWr/ztxBpwZEAypxx0ShSPJoFa6+yS2PXbVqBxBLXVoC4dsbroSHtBMM7U4aQrL5
	 Ahvlx9zpr9sUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82A68230D;
	Mon, 23 Mar 2026 15:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD45E1D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE5088230D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yl21w3e4X5ib for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 15:03:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F9E88230B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F9E88230B
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F9E88230B
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 15:03:30 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 4goQwRpFEtpTf4goRwvkD8; Mon, 23 Mar 2026 16:03:27 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Mar 2026 16:03:24 +0100
Message-ID: <20260323150325.670050-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF4Z/hEy/fabx46rTVyBI30vc6jeiVz73H5wlZ/MGfBddQnMnDwdvrVShAUx5xKIeTI3KEqpp9K6LYFu8tngNP11Ngq38gX9tPwUQkPZNQbKHvn1FQ9E
 RiJfz+2X8MQnRcGhLuz+fkUnOIgjXu1X9GIktBjUiGV6aUvBVPumj2ZyGItjeyA1GtnuNcOUIpxCCoMtNg4nbSn+SukQLigbpBFX6j9a+0vhH4nBYXX7m/2+
 7YwvT6JAbwHiZZswYdbM1lBkKiIc6ApVfoPLF5X6mNY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774278207; bh=lE/ttrtFoU4tDjk5sKD4Cc6uEmrx5K92xLqulHRxeGk=;
 h=From:To:Subject:Date:MIME-Version;
 b=lfQan2gYmtN81ysTHtr2m6oEmueeH9eajr69YMIhg7r/EmjvGSH7N0C8MR619FexN
 aqjssW2C72TWw0PwiTmQuMwXnNiE1G4KdXGosO1X8XkVyCB9f7cYy7gXdr3kfJ0A19
 cBShFivGGg8U1msqSRoxDd/APs4PpzqbTX24LhAKxt9BKmNcbjJC4+kKm484MPOQvH
 qyTGnFRJ3UcwKe0yQo2JoMwkidlYgyw3U2yV36iaofgWJ+CKlNIHcrHKt9BVrkmkV4
 XUEmeHXVIKf/JGC3D+MmraJZq/pgqqjZeDcSpzF7IAJ170rPzRjD50Ahx6isOjL+Bx
 gh8fgu/MvCY8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lfQan2gY
Subject: [Buildroot] [PATCH] packge/swupdate: bump to version 2025.12
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

* libconfig is required by default so let's select it
* from this version crypto is required to let's add Backends:
  Openssl(by default), WolfSSL, MbedTLS
* align swupdate.config to the most basic one

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/Config.in       | 25 +++++++++++++++++++++++--
 package/swupdate/swupdate.config |  6 ++----
 package/swupdate/swupdate.hash   |  2 +-
 package/swupdate/swupdate.mk     | 17 +++++------------
 4 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 3708df0881..cdfbf35345 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -5,7 +5,9 @@ config BR2_PACKAGE_SWUPDATE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBUBOOTENV
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_WOLFSSL)
 	help
 	  swupdate provides a reliable way to update the software on
 	  an embedded system.
@@ -25,8 +27,6 @@ config BR2_PACKAGE_SWUPDATE
 	    want to have Lua support.
 	  * Select BR2_PACKAGE_LIBCURL if you want to use the download
 	    feature.
-	  * Select BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS if you
-	    want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with
 	    UBI partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip
@@ -83,6 +83,27 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	  This is necessary if you want to run swupdate with the
 	  embedded webserver and do not provide an own website to be
 	  installed to /var/www/swupdate.
+
+choice
+	prompt "Crypto Backends"
+	help
+	  Select crypto libraries to be used in swupdate.
+
+config BR2_PACKAGE_SWUPDATE_OPENSSL
+	bool "openssl"
+	default y
+	depends on BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_SWUPDATE_WOLFSSL
+	bool "wolfssl"
+	depends on BR2_PACKAGE_WOLFSSL
+
+config BR2_PACKAGE_SWUPDATE_MBEDTLS
+	bool "mbedtls"
+	depends on BR2_PACKAGE_MBEDTLS
+
+endchoice
+
 endif
 
 comment "swupdate needs a toolchain w/ dynamic library, threads"
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index a6b7a74948..da795cfb63 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -2,7 +2,6 @@
 # Automatically generated file; DO NOT EDIT.
 # Swupdate Configuration
 #
-CONFIG_HAVE_DOT_CONFIG=y
 
 #
 # Swupdate Settings
@@ -24,7 +23,6 @@ CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
 #
 CONFIG_SOCKET_CTRL_PATH="/tmp/sockinstctrl"
 CONFIG_SOCKET_PROGRESS_PATH="/tmp/swupdateprog"
-CONFIG_SOCKET_REMOTE_HANDLER_DIRECTORY="/tmp/"
 
 #
 # MTD support needs libmtd
@@ -60,7 +58,7 @@ CONFIG_BOOTLOADER_NONE=y
 #
 # U-Boot support needs libubootenv, libz
 #
-CONFIG_SSL_IMPL_NONE=y
+CONFIG_SSL_IMPL_OPENSSL=y
 
 #
 # Image downloading support needs libcurl
@@ -105,7 +103,7 @@ CONFIG_PARSERROOT=""
 # ubivol support needs libubi
 #
 # CONFIG_DISKPART is not set
-CONFIG_RAW=y
+# CONFIG_RAW is not set
 # CONFIG_RDIFFHANDLER is not set
 # CONFIG_SHELLSCRIPTHANDLER is not set
 
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index bc911d1820..b3f43648f8 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  678b47fd2419727c4d0abf5c9f3bc0dc4b67e95951132bd1c8f5603e88947779  swupdate-2025.05.tar.gz
+sha256  8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18ab1eaa533  swupdate-2025.12.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 05329d13b8..154b2dcf86 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2025.05
+SWUPDATE_VERSION = 2025.12
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
@@ -18,7 +18,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 	LICENSES/MIT.txt \
 	LICENSES/OFL-1.1.txt
 SWUPDATE_INSTALL_STAGING = YES
-SWUPDATE_DEPENDENCIES = json-c libubootenv
+SWUPDATE_DEPENDENCIES = json-c libconfig libubootenv
 
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
@@ -51,13 +51,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBBLKID=n
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
-SWUPDATE_DEPENDENCIES += libconfig
-SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=y
-else
-SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=n
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SWUPDATE_DEPENDENCIES += libcurl
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=y
@@ -107,7 +100,7 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
 endif
 
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+ifeq ($(BR2_PACKAGE_SWUPDATE_MBEDTLS),y)
 SWUPDATE_DEPENDENCIES += mbedtls
 SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=y
 else
@@ -123,7 +116,7 @@ SWUPDATE_MAKE_ENV += HAVE_LIBMTD=n
 SWUPDATE_MAKE_ENV += HAVE_LIBUBI=n
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_SWUPDATE_OPENSSL),y)
 SWUPDATE_DEPENDENCIES += openssl
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
@@ -152,7 +145,7 @@ define SWUPDATE_SET_SYSTEMD
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+ifeq ($(BR2_PACKAGE_SWUPDATE_WOLFSSL),y)
 SWUPDATE_DEPENDENCIES += wolfssl
 SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=y
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
