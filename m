Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234CA415F8;
	Mon, 21 Mar 2022 21:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CK7EjpODW8o2; Mon, 21 Mar 2022 21:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247A24168E;
	Mon, 21 Mar 2022 21:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 346191BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39DF280005
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1rljbvHpzlz for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC5C484282
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 704ED84D6A; Mon, 21 Mar 2022 21:09:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:13:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52686b220d0c3c081f8259fc0ff6a307c519ec2f
X-Git-Newrev: 4b127b0c1b653b0e2ce3c1996a7eb370a258e712
X-Patchwork-Hint: ignore
Message-Id: <20220321210932.704ED84D6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: reorder openssl variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b127b0c1b653b0e2ce3c1996a7eb370a258e712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is mandatory since bump to version 9.16.26 in commit
8adeaec8afacbc680edebae91524f6144926ac92 so move openssl variables in
the beginning of bind.mk instead of keeping them in the middle of the
file. Moreover, drop "BIND_DEPENDENCIES += host-pkgconf zlib" as
host-pkgconf is already mandatory

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
