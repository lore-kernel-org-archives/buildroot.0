Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E5CC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 18:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E70481452;
	Tue, 12 Mar 2024 18:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEA_XYBfFRRd; Tue, 12 Mar 2024 18:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B1581E61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B1581E61;
	Tue, 12 Mar 2024 18:38:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 786611BF82C
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 18:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71FCB608A0
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 18:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbGPqtbcWPXQ for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 18:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAC91605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC91605A7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAC91605A7
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 18:38:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E9945B005AC;
 Tue, 12 Mar 2024 19:38:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 19:38:36 +0100
Message-ID: <20240312183836.411083-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710268731;
 bh=DGDiKY7LjusnKDNNbzgiOWFPgcbFbegiuK2OIKva3fY=;
 h=From:To:Cc:Subject:Date:From;
 b=g76UeJswBZPrXlHJ/QjI5V1xaLU+AKthTL7it454t729M77oKY2dduELNcAvd6M3O
 Z6+nRYw1G3XjqSD+lOQWCAem6CxnKwmvJb+ithbr0W48qqsvtfe5Bc/HFIVuaO4/Yd
 MiFREXirCSBxKlD2R8nn2Oj95RlniWa8jB7RVh8ktn8BEwRwInklWZSDWbWr3cVtW7
 g84/X7zvX9L25bt1k5jhhnG0vJHawR67Cwhx3rYJNKkttfRAysq+brDfY9gzLvDcRR
 A4JHUbspTkP6kbKPwoly5Yr2W9z8ZEr+1m9ULS+EgJ5SXrher2+R3IYDtA50iKtuUB
 f3S88TV+RMsdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g76UeJsw
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: add the wallet support
 option
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bitcoin Buildroot package has always disabled the wallet support.

This commit adds a config option to enable this support. This allows the
bitcoin-cli command to create wallets, generate addresses and send an
amount to a given address.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: the wallet option can also be used to write a runtime test for the
bitcoin package (doing a test transaction with the regression test
network).
---
 package/bitcoin/Config.in  | 10 ++++++++++
 package/bitcoin/bitcoin.mk | 15 ++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index c4a2447fc95..060cae24f5f 100644
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
index 493c569336a..2f8a1777a26 100644
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
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
