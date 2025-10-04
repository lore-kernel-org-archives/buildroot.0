Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB3CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 09:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19EEB612D7;
	Sat,  4 Oct 2025 09:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmFyZWYjukFS; Sat,  4 Oct 2025 09:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F2061127
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F2061127;
	Sat,  4 Oct 2025 09:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A0FE118
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C5DC41096
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ao4OYJescTni for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 09:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9251940261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9251940261
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9251940261
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:58:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso5809473a12.2
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 02:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759571882; x=1760176682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T1xEVbSJ0Uc3vwl+3jxFN2ixsG8QTdbLqXSJmL8q6CI=;
 b=nloEP3m4mCFwcXM7PU2u54vFLIJm8gPqgyfAM1Fe4LdQ9Ts0nuxwu4CyNWRCwNkgLv
 3UCdeKYydJUFyFfd43uYwyvbf8Xu4lZb/heSTR2gDy6VMAqQVNLYL2doXEGHVnO28xtu
 yr5kpNwHBLSbFXm5RlFLez7val6XxEXv8dCk4VFC7GcRj+LU705lBf4G2p+nncMFSC0Z
 Z6PBD/yjNo2FmoC9+JmatN2YB2rD4/gDYNY97zC2XbL2l5eKRQG7PnZ8iXjKahX4Ig7F
 WvLyRdC5oAlaHT9uLmnHN2XBibbv5TET9QmgO4A0eR8n2K/EKQtZAUjbMCgnzAhyoYxb
 dC5Q==
X-Gm-Message-State: AOJu0YwtR/nV21T0OJkqGZ6e5hNSDBHguvyY6nrXSEhiyi3MXKKMhWV1
 jgd8UISZGwsi4d6uvGALrhgHDpU7Lv9YB9x0bQRA/gG2eM0rzkxgkduF1M3vKc8XVJlW9ct7AfG
 chiu2
X-Gm-Gg: ASbGncsYQhr/rWc+rNlSQypX+pBoYhtg+p8vk1atTXOuuPBTUb9OiUCx0Xe9RXvkt0i
 TFlfBVzbK0ZHLosb1X+3w2BM/mpUmr0UsvTawhDKP9FvNEGZ8lxHro23oRjuze8fS+nuZRUC5lH
 B4KAPn7B/l1/ywrNF5NOgUmtShUd9uaMfMPyXVZfRD3q8yREEkVqR8PuC25dxPQDvUVz9tIg+Ge
 WFJ/W/N8W7MTp+MHm75pQkzfuRp5O3JpAyK/PUM/yNWP02zE+G6YckGQLPbi8N27THU/l8eu06C
 6yZ1c8ciUtP/Jd6qkndD4dbENDPO1+HVZxAVy9QFuBDesvh3JqE8Kulm8XlrWb8cv+JfEVwYzLc
 Z5rYf5VUbfaa9+2vexgRwFrvQ/3NClg0yQhJySCrjAWSN0V4/bo2Y/VTgOhvTVsijysfF8K8=
X-Google-Smtp-Source: AGHT+IFz3vcaey57kVl/AK050Xhsmfa2EB9B6tEjKL8YxynEO/s/Gz7GG2eRvMROIj74eJYftFVWTQ==
X-Received: by 2002:a05:6402:13c8:b0:633:e4e7:76af with SMTP id
 4fb4d7f45d1cf-63939c3520dmr6239303a12.33.1759571881621; 
 Sat, 04 Oct 2025 02:58:01 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637ef848199sm4329120a12.21.2025.10.04.02.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 02:58:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Semyon Kolganov <semenak94@mail.ru>
Date: Sat,  4 Oct 2025 11:57:51 +0200
Message-ID: <20251004095751.276084-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759571882; x=1760176682; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T1xEVbSJ0Uc3vwl+3jxFN2ixsG8QTdbLqXSJmL8q6CI=;
 b=P5tXugD61322jU4cVgqyhSmPlNCKE5Bsev/1OuzQ9E+w5uotZ7aMZXsUV0d6ahC8Rp
 T+6vbCjZ2sQGBxj7O4Bxd+1RXwNzBR8NquT1dPsgI8kM7J1mfXaZQer3zmemwaVtp3X8
 jhrTSRwyOqQa1ZTmzFrkQXG627XrOb1tJKkpolV3Y76lb693B0Wd5C1G+R67V1ejw3kf
 tO3evUvxCzk2CZzVzwSiMcSffU81mIKZe4Aun8euRBsaFx1Awir6M1T29vREfazhG2Mk
 C1JZoDunfHn7hypTBq9Ey/pjt5gVKNHdY+MYSnidev4ciBFnd2y7Ar9XUNDfh/9Tbr5R
 mPag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P5tXugD6
Subject: [Buildroot] [PATCH] package/libbson: remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream libbson repository has been archived since october 2020,
and there is a known vulnerabilities affecting it (CVE-2025-0755).

Since no other package depends on libbson, and it hasn't seen any recent
activity, let's simply remove it from Buildroot. In case anyone needs a
bson implementation, one could integrate the replacement from mongo-c-driver
instead, see https://github.com/mongodb/mongo-c-driver/tree/master/src/libbson

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy             |  6 ++++++
 DEVELOPERS                   |  1 -
 package/Config.in            |  1 -
 package/libbson/Config.in    | 11 -----------
 package/libbson/libbson.hash |  4 ----
 package/libbson/libbson.mk   | 22 ----------------------
 6 files changed, 6 insertions(+), 39 deletions(-)
 delete mode 100644 package/libbson/Config.in
 delete mode 100644 package/libbson/libbson.hash
 delete mode 100644 package/libbson/libbson.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ffcd53930a..2c5b389dc8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBBSON
+	bool "libbson has been removed"
+	select BR2_LEGACY
+	help
+	  libbson is officially deprecated upstream and has been removed
+
 config BR2_TARGET_ROOTFS_AXFS
 	bool "AXFS root filesystem has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d3fdbb49a0..e00a8a48ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2994,7 +2994,6 @@ F:	package/wlr-randr/
 
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
-F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
diff --git a/package/Config.in b/package/Config.in
index 756f48266e..e9906b066e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1924,7 +1924,6 @@ menu "JSON/XML"
 	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
-	source "package/libbson/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libjwt/Config.in"
diff --git a/package/libbson/Config.in b/package/libbson/Config.in
deleted file mode 100644
index 95f224e29e..0000000000
--- a/package/libbson/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBBSON
-	bool "libbson"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  libbson is a library providing useful routines related to
-	  building, parsing, and iterating BSON documents.
-
-	  http://mongoc.org/libbson/
-
-comment "libbson needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
deleted file mode 100644
index e4b636d2fd..0000000000
--- a/package/libbson/libbson.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  6bb51b863a4641d6d7729e4b55df8f4389ed534c34eb3a1cda906a53df11072c  libbson-1.9.5.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
-sha256  8dc5cb3146b026715e6c145621c7732f36c295d825b7b3a03076ad3f238db48e  THIRD_PARTY_NOTICES
diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
deleted file mode 100644
index 1ac7202830..0000000000
--- a/package/libbson/libbson.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# libbson
-#
-################################################################################
-
-LIBBSON_VERSION = 1.9.5
-LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
-LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
-LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
-LIBBSON_CPE_ID_VENDOR = mongodb
-LIBBSON_CONF_OPTS = \
-	--disable-tests \
-	--disable-examples \
-	--disable-man-pages \
-	--disable-html-docs
-
-LIBBSON_INSTALL_STAGING = YES
-
-# Also has CMake support, but that forces shared+static libs and static
-# lib has a different name.
-$(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
