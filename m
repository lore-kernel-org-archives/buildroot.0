Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E381DCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8807460FD7;
	Sun, 12 Oct 2025 09:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRQQNzPosqrb; Sun, 12 Oct 2025 09:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B825B60FE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B825B60FE2;
	Sun, 12 Oct 2025 09:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B6D712B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21DCA40F4A
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9F1epvaO1_O for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 09:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B2AD40F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2AD40F48
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B2AD40F48
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:05:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FEE6A4C64BE;
 Sun, 12 Oct 2025 11:05:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57938)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7s0q-000000001s4-2Img;
 Sun, 12 Oct 2025 09:05:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Date: Sun, 12 Oct 2025 11:05:08 +0200
Message-ID: <20251012090508.3444244-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760259909;
 bh=rPT0Z/yxjqdC0OeYqkJeTB1n7wxfkyA6ewJc99nytbU=;
 h=From:To:Cc:Subject:Date:From;
 b=VK5opLp4++QbJsQEj7UdmAm8WVpeXp7es+vwE2XR34eUuzRK8FiT8+z018fJa+hM9
 +LdY+BGdk/So9ydiApO4w4itmdfFaieYdGfI4ZXzBBMU1d1JTcooz091GKVCPi9av6
 PJAuhZJM8y8nTEbdN+oH4RjtHpdUinPYCSuklQBnrdg3XOayKGa16fH6AStdFeryge
 DVPVD09U56DAdQQyPcrBgpkeI8UyE9z0Ff29ss2r4dpXV+uQjYnKVODY4KCzQCbBFo
 aqcyxTrU9rFN06Pf8YWWZjEJAAc8+YPaFnZdu9TJkuMwoqVLbz/Hc+DtLgIMUh6vFy
 dQ9Eh3PEoQ9mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=VK5opLp4
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: add patch to fix
 builds against libopenssl 3.6.x
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

Fixes:
https://autobuild.buildroot.org/results/4bc8df69ddb9533de7d877c42e5f7c39192ca454/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0005-tpm-Update-to-OpenSSL-3.6.patch      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch

diff --git a/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch b/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch
new file mode 100644
index 0000000000..a2a54717e2
--- /dev/null
+++ b/package/ibm-sw-tpm2/0005-tpm-Update-to-OpenSSL-3.6.patch
@@ -0,0 +1,25 @@
+From 7f727710326bc0a6d6f28397253ec3a89000300e Mon Sep 17 00:00:00 2001
+From: Pedro Monreal <pmonrealgonzalez@suse.com>
+Date: Fri, 3 Oct 2025 10:35:46 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 3.6
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/22
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 26828d0..731957e 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
