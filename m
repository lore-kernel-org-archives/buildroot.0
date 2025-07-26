Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B414C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 05:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1904419A3;
	Sat, 26 Jul 2025 05:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAFnLofwSiBB; Sat, 26 Jul 2025 05:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCCF4409E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCCF4409E4;
	Sat, 26 Jul 2025 05:59:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E74A0DA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D99AC60DEC
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-FolwnRd3nm for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 05:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D847D60AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D847D60AA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D847D60AA0
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D5A2A4C113F;
 Sat, 26 Jul 2025 07:59:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57580)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ufXw4-000000000No-1jtC;
 Sat, 26 Jul 2025 05:59:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 07:59:08 +0200
Message-Id: <20250726055908.3395125-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726055908.3395125-1-bernd@kuhls.net>
References: <20250726055908.3395125-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753509549;
 bh=HBYubIzxMJnfoysgDP5Hg3B28kSe6oOAZ+wK9kYrkgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=v+ChVpF1SsC+o7Oo/bwjKNwBOoa069Vrs90+yT9rOH0aSBmsr3PhyxPu1VHAvnqVE
 xj3IiUA5jkVI54qg2BwLJESlo99birR6XvjQxjFaqaq7t7VG8m4AarJ0FRDM79H4DO
 H+Jz1SXH/VlmV4r1wFl63EbjoBkX/mOYeOe8TBGIVl1F5DDOqDM00EW3yhU/HJfWLB
 33wjKrBgx+cdT+LPVtQimljIUFrJSYcW1LUS2M5OBvtZHLYk9h2lY4sZ2bhGfHITLo
 d84ZRUa9kjZulhVrIw7i+n5Xd/HvbGFvi9hzsquBD9ryhFF9AwRYHW+bn1V1N1qt30
 fAAl2Ga+oIeuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=v+ChVpF1
Subject: [Buildroot] [PATCH 3/3] package/libcurl: bump version to 8.15.0
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

Upstream removed optional BearSSL support:
https://github.com/curl/curl/commit/08a3e8e19a59d1530bfb208e187ac7c34c978dfd

Changelog: https://curl.se/ch/8.15.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy             | 6 ++++++
 package/libcurl/Config.in    | 4 ----
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 9 +--------
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bc917ce00..efb59dc535 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LIBCURL_BEARSSL
+	bool "libcurl removed BearSSL support"
+	select BR2_LEGACY
+	help
+	  Libcurl removed optional BearSSL support.
+
 config BR2_PACKAGE_LIBOLM
 	bool "libolm has been removed"
 	select BR2_LEGACY
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 0e52bc69c2..b86f98262c 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -63,10 +63,6 @@ config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
 
-config BR2_PACKAGE_LIBCURL_BEARSSL
-	bool "BearSSL"
-	depends on BR2_PACKAGE_BEARSSL
-
 config BR2_PACKAGE_LIBCURL_GNUTLS
 	bool "GnuTLS"
 	depends on BR2_PACKAGE_GNUTLS
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index a463e1db4e..2e36917382 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.14.1.tar.xz.asc
+# https://curl.se/download/curl-8.15.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd  curl-8.14.1.tar.xz
+sha256  6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609  curl-8.15.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 51716cd45b..1cfdda27d2 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.14.1
+LIBCURL_VERSION = 8.15.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -67,13 +67,6 @@ else
 LIBCURL_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
-LIBCURL_CONF_OPTS += --with-bearssl=$(STAGING_DIR)/usr
-LIBCURL_DEPENDENCIES += bearssl
-else
-LIBCURL_CONF_OPTS += --without-bearssl
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
 LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
 	--with-ca-fallback
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
