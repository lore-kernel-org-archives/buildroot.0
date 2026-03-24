Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D29F54AB8
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 13:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D296C40F81;
	Tue, 24 Mar 2026 13:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzRdzZoSNkHv; Tue, 24 Mar 2026 13:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A5840F5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774359298;
	bh=sFVfAU5LGT6ArmL/tzNSmvvBjHmF9tNvXUFEvDUzkqU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WJ8xy5uQ2CvIeJYAcGhrwTvJQCeGm7tEeEKDjNymWf209fFhDtB8hVFzed4f2Cfm3
	 sRbDNYshZkyhP3UREco92d3zFQxAnuNQZ+1enNqvSEwWbL0tQiHpGCExeFKTF+n5Cv
	 B+wwD0ztKy6e3MkhvdODtVkMv0OK2G+KVOvNCOtsyfWV/BtNtfsVoCypOwed9gLoNl
	 oU+dm9VE57/BnKIsdUY9j+YmmoKhDX+rEzB+qkno1JfzVuiU+VVmT4pDEGcHEyGBZJ
	 eCSVwq88HQkYiQ+Ar5q7Vz7VjnUc5oTGCZkwEm8QpIr8harhPjP9/Xi/qDMRqVGdA9
	 GVozYa9ZKGRgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A5840F5D;
	Tue, 24 Mar 2026 13:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 258311D3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 167FC60C03
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q87nvj8ZMwbE for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 13:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBA2660BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA2660BF8
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBA2660BF8
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:34:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 51uDwb2yh0dL051uDwPDlE; Tue, 24 Mar 2026 14:34:49 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Mar 2026 14:34:47 +0100
Message-ID: <20260324133448.2021140-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLpj68UrqAb4jJn4Vw3Zhmmrq5uOYaP61lkIf1tewNSIiPrVOO21QQJhsKUCNYS/H5AbzyeN7w5TH01ID76wPDixVVO79GrzQkRBCCYMqhNIG4najTas
 uJczxpy0wogXbDBWeSn5ZRdp9vFbmsv/8n2ljUSc/mZiSLH+gVaUI7aTSxwc2s7RjHX9T4Q8Pp2ZmZeAG4vBnAoqh3BycdafinDvjqBmsXjYJ2v6TO4HXsDA
 1AKK7YS5Z0oo5wlAY52TIVK1EcOIsOVztShMbyCwqM0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774359289; bh=TOG9JSZx6edtWthCRjweP8yay4M1mZN2cJ6hu3yl+rs=;
 h=From:To:Subject:Date:MIME-Version;
 b=P1e6sokhZNPsDgthO8By+mMt6F1itebR7m4CXf82AjPqqnXHKqjK9Dk+bZN3cHTj1
 jN0QHxaFZScBFqbRbrp2X9CK8Gvm6AfMoMnhxgoeMzIk2XN+iARoR0YUxbMqvbiOSd
 6/Yd3ClNJebd2pumq6YtgyQxnvukTd2dlAnpROezNNskpxMP+AteiJVWJe3t9nIjm1
 0hjbzA6RRx86W0P5kGhFyqPjyew3stSULnrZ10VjIASdxdk9DIa4wfnUd3AOxwuOuJ
 AKK4YsbR+xtWzSoW6rS2QQkTVR9lAg3PwxyOnLaM5+DKi5GaRwt44IqCsMGd3sAZ3J
 8YdoTLlt552DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=P1e6sokh
Subject: [Buildroot] [PATCH v2] packge/swupdate: bump to version 2025.12
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

* as stated here[2] now swupdate requires at least one crypto backend so
  as done for libssh let's enable BR2_PACKAGE_OPENSSL if no other crypto
  backend supported by swupdate is enabled
* libconfig is required by default[1] so let's select it
* align swupdate.config to the most basic one with openssl crypto
  backend enabled by default
* drop HAVE_LIBCRYPTO since it's not used anymore by swupdate even if
  present

[1]: https://github.com/sbabic/swupdate/commit/4b9a71476c886be1a6affe21d6a0334b254a04e1
[2]: https://groups.google.com/g/swupdate/c/bLY3DyLzII0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/Config.in       |  8 ++++++--
 package/swupdate/swupdate.config |  4 +---
 package/swupdate/swupdate.hash   |  2 +-
 package/swupdate/swupdate.mk     | 20 +++++++++-----------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 3708df0881..83cdec691d 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -5,7 +5,10 @@ config BR2_PACKAGE_SWUPDATE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBUBOOTENV
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_LIBGPGME || \
+	       BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_WOLFSSL)
 	help
 	  swupdate provides a reliable way to update the software on
 	  an embedded system.
@@ -25,8 +28,9 @@ config BR2_PACKAGE_SWUPDATE
 	    want to have Lua support.
 	  * Select BR2_PACKAGE_LIBCURL if you want to use the download
 	    feature.
-	  * Select BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS if you
-	    want to add encryption support.
+	  * Select at least one of these crypto backends:
+	    BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS or
+	    BR2_PACKAGE_WOLFSSL or BR2_PACKAGE_LIBGPGME.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with
 	    UBI partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index a6b7a74948..d913d16b09 100644
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
index 05329d13b8..b2778d2aec 100644
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
@@ -82,6 +75,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+SWUPDATE_DEPENDENCIES += libgpgme
+SWUPDATE_MAKE_ENV += HAVE_GPGME=y
+else
+SWUPDATE_MAKE_ENV += HAVE_GPGME=n
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 SWUPDATE_DEPENDENCIES += liburiparser
 SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
@@ -126,10 +126,8 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SWUPDATE_DEPENDENCIES += openssl
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
-SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
-SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
