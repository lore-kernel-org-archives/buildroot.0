Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECF6CCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 20:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDB16160F;
	Mon, 20 Oct 2025 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCf9xFFstoc9; Mon, 20 Oct 2025 20:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF41B614DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF41B614DA;
	Mon, 20 Oct 2025 20:05:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6623C70A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BEBE614DA
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKUyAcBmi58X for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 20:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91292614D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91292614D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91292614D2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:05:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEF92A4C0270;
 Mon, 20 Oct 2025 22:05:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32820)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAw8S-000000001Gy-1Ux7;
 Mon, 20 Oct 2025 20:05:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Mon, 20 Oct 2025 22:05:39 +0200
Message-ID: <20251020200539.2656292-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760990740;
 bh=x9jGdwlnXQ+ksZ74g1dJD02zlOwtDedbeLxOtBeJq3U=;
 h=From:To:Cc:Subject:Date:From;
 b=kL0C3o+YyTusZkisx2og3EFt9nBcfX8mJYij0ffKeTWrJ2H1YOhK8sjDva+eCSMmg
 8DcJpK8m98RHs+NVMf9PgeNDJIWZFn37fNRMdi+MFxFsxxQKy8ydHsc0pCcMgf2YHV
 egyLFbDiKqWvIYtXMWZW47Xdq2IPEiP120ddFqSSX7OiM/JVl5rc2SQZEARdQowVQM
 3SCbQKx1FjK8Xh0YVZOu1U+X5yN6LpqKYWYLSW+VyGK87cMYLC2dHNSlk1+WoeLiRy
 Hy/9zz+pBG2XP987Tupe8g9besZu7VcKLkiaRo/+MKwCoQjb/nGBr/3IOVkTUGXUnv
 ZLn+OAjmQB15A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=kL0C3o+Y
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 30.0
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

Changelog:
https://bitcoincore.org/en/releases/29.0/
https://bitcoincore.org/en/releases/30.0/

License file hash changed, due to year update in upstream commit:
https://github.com/bitcoin/bitcoin/commit/b537a2c02a9921235d1ecf8c3c7dc1836ec68131

Switch build system to CMake.

https://bitcoincore.org/en/releases/29.0/
- The minimum required CMake version is 3.22.
- In-source builds are not allowed.
- MiniUPnPc and libnatpmp have been removed as dependencies

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bitcoin/Config.in    |  1 +
 package/bitcoin/bitcoin.hash |  8 ++++----
 package/bitcoin/bitcoin.mk   | 35 +++++++++++------------------------
 3 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 425e99ce8b..3240462f56 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
+	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index c7dad34d0a..4f4061ed77 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-28.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-28.0/SHA256SUMS.asc
-sha256  700ae2d1e204602eb07f2779a6e6669893bc96c0dca290593f80ff8e102ff37f  bitcoin-28.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS.asc
+sha256  9b472a4d51dfed9aa9d0ded2cb8c7bcb9267f8439a23a98f36eb509c1a5e6974  bitcoin-30.0.tar.gz
 
 # Hash for license file
-sha256  779d9beab4eef2340bb1e86e91f8f55dea9b0985a2d03fbcbb52bd713e091e1b  COPYING
+sha256  7c4a87f43afaf667b4c2187af92ebdd27310a24cec113f973e058e3300a76002  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 9a5f4d6494..e23ef45050 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,48 +4,35 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 28.0
+BITCOIN_VERSION = 30.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
-BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
 BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
+BITCOIN_SUPPORTS_IN_SOURCE_BUILD = NO
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
-# Berkeley Database (bdb) support is always disabled. It is only
-# needed for legacy wallet format. New wallets are using SQLite.
 BITCOIN_CONF_OPTS = \
-	--disable-bench \
-	--disable-tests \
-	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
-	--disable-hardening \
-	--without-bdb \
-	--without-gui
+	-DBUILD_BENCH=OFF \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_GUI=OFF \
+	-DENABLE_IPC=OFF
 
 ifeq ($(BR2_PACKAGE_BITCOIN_WALLET),y)
 BITCOIN_DEPENDENCIES += sqlite
 BITCOIN_CONF_OPTS += \
-	--enable-wallet \
-	--with-sqlite
+	-DENABLE_WALLET=ON
 else
 BITCOIN_CONF_OPTS += \
-	--disable-wallet \
-	--without-sqlite
-endif
-
-ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
-BITCOIN_DEPENDENCIES += libminiupnpc
-BITCOIN_CONF_OPTS += --with-miniupnpc
-else
-BITCOIN_CONF_OPTS += --without-miniupnpc
+	-DENABLE_WALLET=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 BITCOIN_DEPENDENCIES += zeromq
-BITCOIN_CONF_OPTS += --with-zmq
+BITCOIN_CONF_OPTS += -DWITH_ZMQ=ON
 else
-BITCOIN_CONF_OPTS += --without-zmq
+BITCOIN_CONF_OPTS += -DWITH_ZMQ=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
