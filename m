Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA95C0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD654187A;
	Fri, 21 Jul 2023 21:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD654187A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPutepE38nfw; Fri, 21 Jul 2023 21:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A3054055E;
	Fri, 21 Jul 2023 21:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3054055E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A10B91BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E131B4055E
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E131B4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1Fi12FPeVHo for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 228F141860
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228F141860
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1147787524; Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:02:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72a437101fa83906c9d3dcb4386b3ba8c5e0a97e
X-Git-Newrev: 3ecf0baa747f8b0fa3e7f483ccde1a0ae40e3749
X-Patchwork-Hint: ignore
Message-Id: <20230721210542.1147787524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: remove deprecated
 options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ecf0baa747f8b0fa3e7f483ccde1a0ae40e3749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes configure warning:
***** Deprecated options: no-crypto-mdebug-backtrace, no-ssl2

no-ssl2 option was re-added in 2016:
https://github.com/openssl/openssl/commit/e80381e1a3309f5d4a783bcaa508a90187a48882
"We warn that it's deprecated, and ignore it otherwise."
Quoting https://www.openssl.org/docs/man3.0/man3/SSLv23_method.html
"Support for SSLv2 [... was] removed in OpenSSL 1.1.0."
Therefore we do not need any legacy handling for
BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2.

no-crypto-mdebug-backtrace was removed in OpenSSL 3.0:
https://github.com/openssl/openssl/blob/master/NEWS.md?plain=1#L161

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/Config.in     | 4 ----
 package/libopenssl/libopenssl.mk | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 7a3f56a512..26c8f4c085 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -97,10 +97,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
 	bool "enable SSL"
 	default y
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2
-	bool "enable SSL2"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
 	bool "enable SSL3"
 	default y
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 7a4e0dfca2..06eac8f3d9 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -97,12 +97,11 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL),,no-whirlpool) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH),,no-bf) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL),,no-ssl) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2),,no-ssl2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3),,no-ssl3) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL),,no-weak-ssl-ciphers) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK),,no-psk) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST),,no-cast) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
