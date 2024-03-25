Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34642CD11DC
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF17E4079A;
	Mon, 25 Mar 2024 18:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wORoaXaxlHoc; Mon, 25 Mar 2024 18:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00E94079B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C00E94079B;
	Mon, 25 Mar 2024 18:17:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E28C1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 288D460659
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ph3RirPusNcG for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DEF3605BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DEF3605BB
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CBCC83922; Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:13:57 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e382d74ce7fcc543e7059b2e8ff59e4390cd135e
X-Git-Newrev: 77c86888f41bc6e15de8e24736b7b153f1fbab5a
X-Patchwork-Hint: ignore
Message-Id: <20240325181656.8CBCC83922@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bitcoin: add the
 wallet support option
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

commit: https://git.buildroot.net/buildroot/commit/?id=77c86888f41bc6e15de8e24736b7b153f1fbab5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The bitcoin Buildroot package has always disabled the wallet support.

This commit adds a config option to enable this support. This allows the
bitcoin-cli command to create wallets, generate addresses and send an
amount to a given address.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 958085d5f6a90c46f812c64bbe4ac2963f83bca1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/Config.in  | 10 ++++++++++
 package/bitcoin/bitcoin.mk | 15 ++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index c4a2447fc9..060cae24f5 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -36,6 +36,16 @@ config BR2_PACKAGE_BITCOIN
 
 	  https://bitcoincore.org
 
+if BR2_PACKAGE_BITCOIN
+
+config BR2_PACKAGE_BITCOIN_WALLET
+	bool "wallet support"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Enable bitcoin wallet support.
+
+endif
+
 comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 9"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 493c569336..2f8a1777a2 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -13,14 +13,27 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
+# Berkeley Database (bdb) support is always disabled. It is only
+# needed for legacy wallet format. New wallets are using SQLite.
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
-	--disable-wallet \
 	--disable-tests \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
 	--disable-hardening \
+	--without-bdb \
 	--without-gui
 
+ifeq ($(BR2_PACKAGE_BITCOIN_WALLET),y)
+BITCOIN_DEPENDENCIES += sqlite
+BITCOIN_CONF_OPTS += \
+	--enable-wallet \
+	--with-sqlite
+else
+BITCOIN_CONF_OPTS += \
+	--disable-wallet \
+	--without-sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
 BITCOIN_DEPENDENCIES += libminiupnpc
 BITCOIN_CONF_OPTS += --with-miniupnpc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
