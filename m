Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678FFE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 19:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF3C611CD;
	Fri,  6 Dec 2024 19:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktYrazpalAPy; Fri,  6 Dec 2024 19:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAAE5612EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAAE5612EF;
	Fri,  6 Dec 2024 19:47:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D58ED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E98D403A3
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wus0q7V-Ait for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 19:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 441AD400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 441AD400BB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 441AD400BB
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:46:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0ADB240002;
 Fri,  6 Dec 2024 19:46:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tJeHv-007zxV-3A;
 Fri, 06 Dec 2024 20:46:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  6 Dec 2024 20:46:51 +0100
Message-Id: <20241206194652.1906454-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: fix build with openssl
 3.4.x
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/be6c679b821183b4385c74471e26d9ad7d3d8967

Similar to the patch we for openssl 3.3.x added by commit 75ec656c36b
"package/ibm-sw-tpm2: fix build with openssl 3.3.x", add another patch to
bump the maximum supported openssl version to 3.4.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lMath.h-fix-build-with-openssl-3.4.x.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch

diff --git a/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch b/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
new file mode 100644
index 0000000000..e65c1c898b
--- /dev/null
+++ b/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
@@ -0,0 +1,45 @@
+From d59535c8c605f0b23abbefd9b23200b1a5e937fe Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 6 Dec 2024 20:35:35 +0100
+Subject: [PATCH] src/BnToOsslMath.h: fix build with openssl 3.4.x
+
+Openssl 3.4.x is out:
+https://github.com/openssl/openssl/blob/openssl-3.4.0/NEWS.md#openssl-34
+
+So bump the max supported version number similar to how it was done by
+commit 89a4cb9cf8 "src/BnToOsslMath.h: fix build with openssl 3.3.x" to fix
+build failures with 3.4.x:
+
+    In file included from BnValues.h:327,
+                     from Global.h:80,
+                     from Tpm.h:78,
+                     from AuditCommands.c:62:
+    TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
+       83 | #   error Untested OpenSSL version
+          |     ^~~~~
+
+Fixes:
+- http://autobuild.buildroot.net/results/be6c679b821183b4385c74471e26d9ad7d3d8967
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/17
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 72939ea..165304d 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30300ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
