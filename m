Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19136C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3BD582A28;
	Wed, 23 Mar 2022 21:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeOLdnjy-Brx; Wed, 23 Mar 2022 21:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E240D802D2;
	Wed, 23 Mar 2022 21:43:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD35C1C1135
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BBB60ADD
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wT-KjVK3SJSB for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E48A60AC3
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 296B2856ED; Wed, 23 Mar 2022 21:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:10:29 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fb37f62dfe0a4da4377c84f943c0b4c81f190b82
X-Git-Newrev: 92f0dbbcbd34ad39834fcc83dc5991a315d4a793
X-Patchwork-Hint: ignore
Message-Id: <20220323213134.296B2856ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: reorder
 openssl variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=92f0dbbcbd34ad39834fcc83dc5991a315d4a793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

openssl is mandatory since bump to version 9.16.26 in commit
8adeaec8afacbc680edebae91524f6144926ac92 so move openssl variables in
the beginning of bind.mk instead of keeping them in the middle of the
file. Moreover, drop "BIND_DEPENDENCIES += host-pkgconf zlib" as
host-pkgconf is already mandatory

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4b127b0c1b653b0e2ce3c1996a7eb370a258e712)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5b4c60b14c..72f1e4dcdc 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -28,7 +28,8 @@ BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
-	BUILD_CFLAGS="$(TARGET_CFLAGS)"
+	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
+	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
@@ -36,14 +37,17 @@ BIND_CONF_OPTS = \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--enable-filter-aaaa \
-	--disable-backtrace
+	--disable-backtrace \
+	--with-openssl=$(STAGING_DIR)/usr \
+	--with-ecdsa=yes \
+	--with-eddsa=no \
+	--with-aes=yes
 
-BIND_DEPENDENCIES = libuv
+BIND_DEPENDENCIES = host-pkgconf libuv openssl
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
-BIND_DEPENDENCIES += host-pkgconf zlib
 else
 BIND_CONF_OPTS += --without-zlib
 endif
@@ -69,13 +73,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-BIND_DEPENDENCIES += host-pkgconf openssl
-BIND_CONF_OPTS += \
-	--with-openssl=$(STAGING_DIR)/usr \
-	--with-ecdsa=yes \
-	--with-eddsa=no \
-	--with-aes=yes
-BIND_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 # GOST cipher support requires openssl extra engines
 ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 BIND_CONF_OPTS += --with-gost=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
