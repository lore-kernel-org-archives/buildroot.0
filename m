Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2DDC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D6970F7E;
	Mon, 19 May 2025 11:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7UybIxiJ7K2; Mon, 19 May 2025 11:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE5570F89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE5570F89;
	Mon, 19 May 2025 11:02:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E58E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28907410C6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVoWrqGWBFOj for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C686941DE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C686941DE6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2C3683BC0; Mon, 19 May 2025 10:40:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:30:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2ad082971a4be9a7ba84336385b44e70908df946
X-Git-Newrev: eeb49a1f1f970fcd06c120c183315688be2629ea
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.C2C3683BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnetconf2: bump to
 version 3.7.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4502134113880363182=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4502134113880363182==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=eeb49a1f1f970fcd06c120c183315688be2629ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
  error-path data node
  now using proper format so in rpc-reply uses XML XPath format instead of JSON
  several bugfixes and improvements

Depends on libyang v3.12.2:

  https://github.com/CESNET/libyang/releases/tag/v3.12.2

As part of this version bump, the ENABLE_SSH and ENABLE_TLS options
have been dropped by upstream in favor of a single ENABLE_SSH_TLS
option, which requires openssl or mbedtls, libcurl and libssh. Since
this is getting quite complicated to handle as an implicit optional
dependency, we make this explicit with a new sub-option
BR2_PACKAGE_LIBNETCONF2_SSH_TLS that ensures everything needed is
enabled.

In theory, libnetconf2 can use either mbedtls or openssl for crypto,
but netopeer2 will only work if OpenSSL is used, so we only allow
using OpenSSL until that gets fixed upstream.

The netopeer2 package, which needs SSH/TLS support in libnetconf2 is
updated accordingly (and actually becomes simpler).

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetconf2/Config.in        | 18 ++++++++++++++++++
 package/libnetconf2/libnetconf2.hash |  2 +-
 package/libnetconf2/libnetconf2.mk   | 21 +++++++++------------
 package/netopeer2/Config.in          |  8 +++-----
 4 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 1763243120..59e021375d 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -12,6 +12,24 @@ config BR2_PACKAGE_LIBNETCONF2
 
 	  https://github.com/CESNET/libnetconf2
 
+if BR2_PACKAGE_LIBNETCONF2
+
+config BR2_PACKAGE_LIBNETCONF2_SSH_TLS
+	bool "SSH/TLS support"
+	depends on BR2_USE_MMU # libssh
+	depends on !BR2_STATIC_LIBS # libssh
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libssh
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBSSH_SERVER
+
+comment "SSH/TLS support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
+
 comment "libnetconf2 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 675c76a500..2d6394e81b 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
+sha256  c95c00ad887295d1fa31098c859c74e330eead78b2eee8d008701af2d9df80e5  libnetconf2-3.7.1.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 88163926c0..79d8419a11 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.28
+LIBNETCONF2_VERSION = 3.7.1
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
@@ -16,18 +16,16 @@ LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
-ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
-LIBNETCONF2_DEPENDENCIES += libssh
+ifeq ($(BR2_PACKAGE_LIBNETCONF2_SSH_TLS),y)
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
+LIBNETCONF2_DEPENDENCIES += libcurl libssh
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBNETCONF2_DEPENDENCIES += mbedtls
 else
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
 LIBNETCONF2_DEPENDENCIES += openssl
+endif
 else
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
@@ -37,8 +35,7 @@ endif
 HOST_LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
-	-DENABLE_SSH=OFF \
-	-DENABLE_TLS=OFF
+	-DENABLE_SSH_TLS=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
index db31a786a1..1e4248fa91 100644
--- a/package/netopeer2/Config.in
+++ b/package/netopeer2/Config.in
@@ -6,17 +6,15 @@ comment "netopeer2 needs a toolchain w/ gcc >= 4.8, C++, threads, dynamic librar
 
 config BR2_PACKAGE_NETOPEER2
 	bool "netopeer2"
-	depends on BR2_USE_MMU # libnetconf2, libssh, sysrepo
+	depends on BR2_USE_MMU # libnetconf2, sysrepo
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
-	depends on !BR2_STATIC_LIBS # libnetconf2, libssh, libyang, sysrepo
+	depends on !BR2_STATIC_LIBS # libnetconf2, libyang, sysrepo
 	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sysrepo
 	select BR2_PACKAGE_LIBNETCONF2
-	select BR2_PACKAGE_LIBSSH
-	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH
+	select BR2_PACKAGE_LIBNETCONF2_SSH_TLS
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS
 	select BR2_PACKAGE_SYSREPO
 	help
 	  Netopeer2 is a set of tools implementing network configuration

--===============4502134113880363182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4502134113880363182==--
