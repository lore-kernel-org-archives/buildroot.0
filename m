Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD9EFA3745
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 21:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0578B40017;
	Fri, 28 Oct 2022 21:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0578B40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDjgmIQKW9Jz; Fri, 28 Oct 2022 21:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C66A740037;
	Fri, 28 Oct 2022 21:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C66A740037
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEF551BF855
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7F654010E
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F654010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxcYKPdY66Zo for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 21:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E3940104
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77E3940104
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:48:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o4so8204366wrq.6
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 14:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ip3YVZwxKhT8+0bTis6PwV5cQ/KX8aJIQZ7uzqI8XHQ=;
 b=gQwdrGUEShH90/LBmYajDrOqCuioLkrJPZmbNJbxq3+TJIrnj3yBr5TfXjMg+Wxcnh
 Gc9q4UBeb5NdCarpmEeD6rzRq1L6cELjrtTwjRH7AMELUlZTGwoS4hB2l6hxHsG+G1TE
 StTOlpre5fanykM+AKw19qyN7ggKwDRSBvY8/zcy9+imyrmk9k9JKCFZZElfFjKfbnGP
 2E9Z3JBjSzcbAnkkpkhWU48o5N0SQCA5vjeTV0vDliIs2U5pbbf+Y5h0R7CwVaV+XUdq
 3sROxOrOydG9nxugJAJWMD5hId53OWn7B0ITnOO/8U2P6RXz06DuRQSzCUHtNNVb9KkW
 SgFw==
X-Gm-Message-State: ACrzQf1crUpavOoaueaSxVjvFgGs6KiSMu3kiDIUnUMlwrJSN2pPanyY
 RRsBKJggJu2df7K/SsAZExkRKoan89A=
X-Google-Smtp-Source: AMsMyM4sLQd9WZ4RxjOJYXXCuDVnppj/X8OmZjb9mJ2py4VXc1KaVLaVcF+09RxdY3V5t7Q23gQOow==
X-Received: by 2002:a5d:6a90:0:b0:236:4835:ca94 with SMTP id
 s16-20020a5d6a90000000b002364835ca94mr733439wru.187.1666993697265; 
 Fri, 28 Oct 2022 14:48:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003c6c2ff7f25sm5836524wms.15.2022.10.28.14.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 14:48:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 23:48:11 +0200
Message-Id: <20221028214811.273143-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ip3YVZwxKhT8+0bTis6PwV5cQ/KX8aJIQZ7uzqI8XHQ=;
 b=cpMeWL7DTfJ5VW3cYHoHt+o5dEFSmqANIOAm7Pte96SwztSL5dzJNyiu+BTGxVW9R7
 bqgvUS0RNJCSHK/Knsml0Smru0XcT4Dbh8Zsnji4rj9eNDF8dWQsU6loawmxKQfD2hC9
 J3mEewYEMYEVVQbhgy1O3OvPj4n4RB1cVzKOHlB4fdiO2rgD5ipc1A23R/wnCwHZZzlh
 sJPVJbi8Ok2RIbbidEoANeHDgthLGHk3rzEwfiK1Kj+ufC4NgIGz3aYXfGNPrqktWUZx
 7XcsJjKTfC3krsznnsCAIGAWkpMYFvy2mTQDYEQUd75VmFz6FXjoZZKYIGb1t+ya5EFT
 hZbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cpMeWL7D
Subject: [Buildroot] [PATCH 1/1] package/sngrep: bump to version 1.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- pcre2 is an optional dependency since
  https://github.com/irontec/sngrep/commit/cac42deab5e94661e2495399bc40eaf75e0b46bc
- zlib is an optional dependency since
  https://github.com/irontec/sngrep/commit/c02f439d73f33c727909131cb4d9d01029d7492f

https://github.com/irontec/sngrep/blob/v1.6.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nssl.h-fix-build-with-libressl-3.5.0.patch | 40 -------------------
 package/sngrep/sngrep.hash                    |  6 +--
 package/sngrep/sngrep.mk                      | 21 +++++++---
 3 files changed, 19 insertions(+), 48 deletions(-)
 delete mode 100644 package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch

diff --git a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 7dbb29ab00..0000000000
--- a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Apr 2022 18:53:45 +0200
-Subject: [PATCH] src/capture_openssl.h: fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-capture_openssl.c: In function 'P_hash':
-capture_openssl.c:101:18: error: storage size of 'hm' isn't known
-  101 |         HMAC_CTX hm;
-      |                  ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/irontec/sngrep/commit/4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761]
----
- src/capture_openssl.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/capture_openssl.h b/src/capture_openssl.h
-index 780de494..1f87a5cd 100644
---- a/src/capture_openssl.h
-+++ b/src/capture_openssl.h
-@@ -67,10 +67,11 @@
- #endif
- 
- /* LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
-- * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...)
-+ * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...) until
-+ * version 3.5.0
-  */
- #if defined(LIBRESSL_VERSION_NUMBER)
--#define MODSSL_USE_OPENSSL_PRE_1_1_API (1)
-+#define MODSSL_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
- #else
- #define MODSSL_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
- #endif
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index 33fa91ef5e..60a32022e6 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.4.7/sngrep-1.4.7.tar.gz.md5sum
-md5  78fe753e24f36ddaf627bc2b734f45ba  sngrep-1.4.7.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.6.0/sngrep-1.6.0.tar.gz.md5sum
+md5  1519ca6cd1167c0722debfb96e2ac173  sngrep-1.6.0.tar.gz
 
 # Locally computed
-sha256  3c96aadd8b8c6b7adb5552d6fb4234f2000f15109b0f6c5feb632c81306cc49b  sngrep-1.4.7.tar.gz
+sha256  fd80964d6560f2ff57b4f5bef2353d1a6f7c48d2f1a5f0a167c854bd2e801999  sngrep-1.6.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 841a7bb991..7b614f1770 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SNGREP_VERSION = 1.4.7
-SNGREP_SITE = $(call github,irontec,sngrep,v$(SNGREP_VERSION))
+SNGREP_VERSION = 1.6.0
+SNGREP_SITE = \
+	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
@@ -29,11 +30,21 @@ else
 SNGREP_CONF_OPTS += --without-gnutls --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+SNGREP_DEPENDENCIES += pcre2
+SNGREP_CONF_OPTS += --without-pcre --with-pcre2 
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 SNGREP_DEPENDENCIES += pcre
-SNGREP_CONF_OPTS += --with-pcre
+SNGREP_CONF_OPTS += --with-pcre --without-pcre2
 else
-SNGREP_CONF_OPTS += --without-pcre
+SNGREP_CONF_OPTS += --without-pcre --without-pcre2
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+SNGREP_DEPENDENCIES += zlib
+SNGREP_CONF_OPTS += --with-zlib 
+else
+SNGREP_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
