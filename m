Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E2DFF8860
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 06:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434AF42D15;
	Mon, 27 Apr 2026 06:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2N-zicMOBhhX; Mon, 27 Apr 2026 06:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6854642E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777270958;
	bh=aZxbsZ7N1ESxZAlIQz0qfZ8RpCxJDmBUGrBtdURw96E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FGR0n4rLGJtyvy9/T/t5EvQCb/cW8TBbdIRtYVm/7YuTPkLU99IY6nb7052BMi243
	 t21YDQQS/JmdFE3Nv8A3LS2W8pPyd9SrD5ueen5xhCvty681vDYE5ufuq5CKrA44et
	 Bzj/betYqYOHziWAyFCcsurpjQBJnYCdiPOdoDjd38FaHIOtABEQY9TFEhMK+QUWDJ
	 w8YeuuPSw3GIPkZDCjOuCxcz2s6A5K08jsNQ21/q98uH5huaeq0TO7CH3GBmb4VPyZ
	 +bDaNmHNxQ+Wb+NEwKak8RGcUOGrpbrCcsPG0Wd02GnYpAQAIBd+GE1VR2fvzm7SHS
	 LxFRYNQXRAdpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6854642E29;
	Mon, 27 Apr 2026 06:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45CFB231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 376AE6F571
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJTwbiJUrGXG for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 06:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 127516F564
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 127516F564
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 127516F564
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:22:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20BE0A4C1322;
 Mon, 27 Apr 2026 08:22:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48410)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHFMX-0000000028q-1VJ3;
 Mon, 27 Apr 2026 06:22:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Mon, 27 Apr 2026 08:22:33 +0200
Message-ID: <20260427062233.471825-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777270954;
 bh=F9lP5p7vIXyRnPjEo2D0UsEPdsmpxMwh0U9QAklzJYI=;
 h=From:To:Cc:Subject:Date:From;
 b=SB3Cxc5WIpwfmZCjTnXOg/eggZPMH1ouxwgaEgg8aNJ/wRpoF/utkss9004vBmXHt
 dxtpEozTa5+qKonHXQ1/7UCGKtNBRJRW2b1EF1iZkv7YkROZQgzvMB/kXwSUJuPNgV
 OFPHFB+whQ3BZ6CS61GBqYyBcAOiAQHJYOCK4Q0REx9fEXh3CvQJHFGJKyHO3CHLF+
 Hv18OCbu1pTOj6vMXNVpF89i5XhCflI6wLcUdRw3LNWZBwPeS9cOw6xVCjBUXGtyqP
 3QryJZqZ5OaySS9nv28iLx8ZBDujjhtBNRJ62TfXdi2sHLXaiVnAit1iVbWVbHqgPT
 ifDU9fPtmliCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SB3Cxc5W
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: bump version to 31.0
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

https://bitcoincore.org/en/releases/31.0/
"The minimum supported GCC compiler version has been raised to 12.1"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bitcoin/Config.in    | 6 +++---
 package/bitcoin/bitcoin.hash | 6 +++---
 package/bitcoin/bitcoin.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 66c8ebbfda..835961718c 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-filesystem
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
 	select BR2_HOST_CMAKE_AT_LEAST_3_22
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BITCOIN_WALLET
 
 endif
 
-comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 11"
+comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 12"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_11
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_12
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 89fe6ce280..b1576d5e8a 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS.asc
-sha256  6fd00b8c42883d5c963901ad4109a35be1e5ec5c2dc763018c166c21a06c84cb  bitcoin-30.2.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS.asc
+sha256  0ba0ef5eea3aefd96cc1774be274c3d594812cfac0988809d706738bb067b3e3  bitcoin-31.0.tar.gz
 
 # Hash for license file
 sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 89dacaf9c7..d7019f2aa9 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 30.2
+BITCOIN_VERSION = 31.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
