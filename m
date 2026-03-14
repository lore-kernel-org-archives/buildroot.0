Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF6310706F5
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4187C40AE6;
	Sat, 14 Mar 2026 18:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCYnNtDqf2YK; Sat, 14 Mar 2026 18:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA89413E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773513317;
	bh=M/MWQY7bE22Ul8pVBa9KwmN5xxwKUSCEXSoXuXXu9PU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qor7NSrs65DQrjm6ZDkaug1liYtwOCHy9EHdaODpDDxVAAxyrtXdo62N5L1mHx2in
	 CSeDbzWB+KsU7wuZx/3Ub3ukXJWy44PDeBiztDFj81wh1ED2/NZcBvhW8/NATBU/tS
	 ZHVt7HLP7QtKE6knTBNC0Y/lH87ZpZtzPKDgL80os1w33Et24JGWDICIHpEYtwW8Cj
	 Lzx4Gov3P4b/xnDIPX9xEOjSa0scxW4BZmlOYaUJSYzdwEKJMNP47OeEoMUh+t6xYq
	 Do991arUyYEtf28d+tc5T/Ub+TQmFvhzhqnb4M/4TiPSiOooH3/iUfvErsALlVLv9O
	 Asv3WHJ2ifKsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA89413E2;
	Sat, 14 Mar 2026 18:35:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF8A1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2214F81EBE
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb2D6UIDpXXD for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B30081EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B30081EBD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B30081EBD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:35:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BEAAA4C1174;
 Sat, 14 Mar 2026 19:35:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48286)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1TpE-000000001Yw-4BCr;
 Sat, 14 Mar 2026 18:35:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Mar 2026 19:35:00 +0100
Message-ID: <20260314183500.3159948-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314183500.3159948-1-bernd@kuhls.net>
References: <20260314183500.3159948-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773513301;
 bh=knaK1emPysxncaerrlI3FPAfIUE0b784NWOH5cKnCHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=T/QtNqv/wzYqcI3f8XSgLdWYSIWKjXPhrwA4G4NN+VpXH7070JE6c9kTVcIzdSJT7
 rkj8lvTpYj36s7CZQBaL7Q4MIZ86Z1nJDwUKCQDG0BR5xZ2NJxpCtselug9WK3ekaR
 Q7umY7NCl+K4AvVpQ4Rfci2NUfsR+Lfo+fyXHnwE0dx6xuZz8cRpBDJxbO15ckK+NT
 CpNxsVmnrKmTZvfen0PwiOMGOeFgBJTFOEnjeXHtM9oaUcwNPgW5aAPAigY//EJ7wB
 aaizG2XTpz/h/YK8oD4P+Bm6ZpEHCi8CK/7L0g4fZxssXDHxOiSBKC8ZqOQc2rcTG/
 Cod+gphX/JeKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T/QtNqv/
Subject: [Buildroot] [PATCH 2/2] package/snort3: bump version to 3.11.1.0
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

https://github.com/snort3/snort3/blob/3.11.1.0/ChangeLog.md

Removed patch which is included in this release.

Upstream switched from pcre to pcre2:
https://github.com/snort3/snort3/commit/bb80b5d754774fc8b1c9c1d9208b6b78cc609521

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-cstdint-related-clearlinux-errors.patch | 60 -------------------
 package/snort3/Config.in                      |  2 +-
 package/snort3/snort3.hash                    |  2 +-
 package/snort3/snort3.mk                      |  4 +-
 4 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch

diff --git a/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch b/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
deleted file mode 100644
index 4f24ee72d4..0000000000
--- a/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 154cf0312b3652bdfdf241e6883d7c6de9b85e01 Mon Sep 17 00:00:00 2001
-From: "Maya Dagon (mdagon)" <mdagon@cisco.com>
-Date: Mon, 24 Jul 2023 08:06:50 +0000
-Subject: [PATCH] Pull request #3925: build: fix cstdint related clearlinux
- errors
-
-Merge in SNORT/snort3 from ~MDAGON/snort3:clearlinux to master
-
-Squashed commit of the following:
-
-commit 7ef2bc13851ffa2bf7908964242859a8c05ddd96
-Author: maya dagon <mdagon@cisco.com>
-Date:   Thu Jul 20 14:34:01 2023 -0400
-
-    build: fix cstdint related clearlinux errors
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/snort3/snort3/commit/154cf0312b3652bdfdf241e6883d7c6de9b85e01
----
- src/js_norm/js_identifier_ctx.h       | 1 +
- src/packet_io/sfdaq_config.h          | 1 +
- src/service_inspectors/wizard/magic.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/utils/js_identifier_ctx.h b/src/utils/js_identifier_ctx.h
-index b8d5121a2c..6ef1ce2b23 100644
---- a/src/utils/js_identifier_ctx.h
-+++ b/src/utils/js_identifier_ctx.h
-@@ -20,6 +20,7 @@
- #ifndef JS_IDENTIFIER_CTX
- #define JS_IDENTIFIER_CTX
- 
-+#include <cstdint>
- #include <list>
- #include <string>
- #include <unordered_map>
-diff --git a/src/packet_io/sfdaq_config.h b/src/packet_io/sfdaq_config.h
-index 990c45785b..f4c1042bc3 100644
---- a/src/packet_io/sfdaq_config.h
-+++ b/src/packet_io/sfdaq_config.h
-@@ -21,6 +21,7 @@
- #ifndef SFDAQ_CONFIG_H
- #define SFDAQ_CONFIG_H
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
-diff --git a/src/service_inspectors/wizard/magic.h b/src/service_inspectors/wizard/magic.h
-index fa24d0b5a4..b9477eb95c 100644
---- a/src/service_inspectors/wizard/magic.h
-+++ b/src/service_inspectors/wizard/magic.h
-@@ -21,6 +21,7 @@
- #define MAGIC_H
- 
- #include <cassert>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 7171603aa3..8dae65381e 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_SNORT3
 	select BR2_PACKAGE_LIBDNET
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 7746547d18..599818ee24 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d787d954f21d4cd6a048e10b8c53c78cb6287ec448108fc573b951639c8947b3  snort3-3.1.40.0.tar.gz
+sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index a76b831838..273aa56709 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.40.0
+SNORT3_VERSION = 3.11.1.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
 
 SNORT3_DEPENDENCIES = \
-	host-pkgconf daq3 flex hwloc libdnet libpcap luajit openssl pcre zlib
+	host-pkgconf daq3 flex hwloc libdnet libpcap luajit openssl pcre2 zlib
 
 SNORT3_CONF_OPTS = \
 	-DENABLE_GDB=OFF \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
