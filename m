Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A28C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EFD81B69;
	Sat, 19 Mar 2022 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdEKNU0ux5tQ; Sat, 19 Mar 2022 19:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD7F81B48;
	Sat, 19 Mar 2022 19:35:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B84111BF255
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6238605C9
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWzlf4RqdJFQ for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:35:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C37ED605A2
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 05ECF83D35; Sat, 19 Mar 2022 19:26:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 20:32:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8c602fcfd2422705fec134281d99f3db8c9dc84e
X-Git-Newrev: 696eb52d74206beaa55f67bf32dcc89c887cc9ca
X-Patchwork-Hint: ignore
Message-Id: <20220319192628.05ECF83D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: bump to
 version 9.16.26
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=696eb52d74206beaa55f67bf32dcc89c887cc9ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

BIND 9.11 EOL in March, 2022. BIND 9.16 is current Stable/ESV version.

Changes:
* libuv (new dependency)
* openssl is now mandatory
* zlib must be detected with PKG_CONFIG_PATH (specifying zlib
  installation path is not supported)
* bind9-config and isc-config.sh removed
* updated COPYRIGHT hash

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8adeaec8afacbc680edebae91524f6144926ac92)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/Config.in | 12 +++++++++++-
 package/bind/bind.hash |  6 +++---
 package/bind/bind.mk   | 15 +++++++--------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index db10ceb304..9887403ed9 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_MMU # fork(), libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_OPENSSL
 	help
 	  BIND (Berkeley Internet Name Domain) is an
 	  implementation of the Domain Name System (DNS) protocols
@@ -24,6 +29,11 @@ config BR2_PACKAGE_BIND
 
 	  https://www.isc.org/bind/
 
+comment "bind needs a toolchain w/ NPTL, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
 if BR2_PACKAGE_BIND
 
 config BR2_PACKAGE_BIND_SERVER
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 70299f1677..401e389e49 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.36/bind-9.11.36.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.26/bind-9.16.26.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681  bind-9.11.36.tar.gz
-sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
+sha256  70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45  bind-9.16.26.tar.xz
+sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e329c803a3..5b4c60b14c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.36
+BIND_VERSION = 9.16.26
+BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
-BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
@@ -32,15 +32,18 @@ BIND_CONF_ENV = \
 BIND_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
-	--with-libjson=no \
+	--with-json-c=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--enable-filter-aaaa \
 	--disable-backtrace
 
+BIND_DEPENDENCIES = libuv
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
+BIND_DEPENDENCIES += host-pkgconf zlib
 else
 BIND_CONF_OPTS += --without-zlib
 endif
@@ -66,7 +69,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
 BIND_DEPENDENCIES += host-pkgconf openssl
 BIND_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr \
@@ -80,9 +82,6 @@ BIND_CONF_OPTS += --with-gost=yes
 else
 BIND_CONF_OPTS += --with-gost=no
 endif
-else
-BIND_CONF_OPTS += --with-openssl=no
-endif
 
 # Used by dnssec-keymgr
 ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
