Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F09CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AE16069B;
	Mon,  1 Jun 2026 19:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBkEcwqze-PB; Mon,  1 Jun 2026 19:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA976069E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341889;
	bh=EwCu60zJhL3DWcy7t4moSmRgejlcrkmOSQA8LWKZMqk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PGxTFCaOZOUz89L6enLe8f3BaRqGcbPbryTOW5xoZqX4PmGalGFLlgLM30MEPBFnf
	 vsSKh+uI1JS4b4qCaUv1n5wrWNZ1C8b7/7LvdkHcIE6Hd61CdUvxoRzSLV5kzgqFVM
	 DXLvXqKzYVXacLPK89sPYJ6Wtak+oovjVvpopq8l746viLqwH6AgCil+wSx1Lw4ksg
	 zWDThpTU4wzmT11YtDjXvS7RO2mKDzhyCpZGgbq3QbVUP7xKKiem9UuBzlbJUc5YMr
	 PXDfS6KtOyWAL2twSoODdOJL3Tr/iK9RaCsWXIiBJDj2s+RKN9BZqshLXdxcW+Jv36
	 zipzPbdIRUiAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA976069E;
	Mon,  1 Jun 2026 19:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBBEF4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00AA1400D6
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heflElzDuerr for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5B76400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B76400F5
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5B76400F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:24:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id U8FfwJXJ43FmdU8FfwnV7B; Mon, 01 Jun 2026 21:24:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  1 Jun 2026 21:19:54 +0200
Message-ID: <20260601191954.55781-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOghS14MDvjxDymT7jQUcQfvlcL7zKUium7nmTP/aj14vfuKaY9naXxrygqZLqxXfMUqt+zVi/NYtg+fNSQqcJH4YZwF3X5ZAJB2+DnVjEQF+ihT9FCq
 vseU7+3vCk4NHdV4WlHtMHbH96GNucZCxo2I9c5p8eKUUwaFzMYXjk81clvLGoWeNyVIAYAkIHGEDuH5ZZZ/Zb4YMWOtl5CqefHti6RxeyBRZbd0rDrT0W2o
 ZZD78DdmANtVvKeV4FXgBPysyVCGlgEHQauY/IWJHGM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1780341883; bh=fFGXq92lHIq2uazNnupDo6N5sGltAX72TM4oaF5ZejM=;
 h=From:To:Subject:Date:MIME-Version;
 b=CL0DBoA/YiLhbQAiLCyizdgZzyTo0AcYF/OPcq2byY0JqRZSL9eRAqbPonDRRg5oo
 eK08XZo8qjD3DdhCFTPWrJ0NHO+OLTTcZ511tam8gDkY6aSorYpF1TZWkW2D5S0M9t
 0lP5uTBstKGilMUuPRuSQAQFeqoAJ+E0vwA1AoDUa8UMzEw2J1X+zyfbxZ16Wdvo1G
 YBwD9MwM+5JlZ8Rcxx+TSV2GQjsG0zWQ+ULT/vG42J+KjpdEMgYg1yZZEJ0HhxScsE
 wttLz3Bu74O7F5/cPFkFGp181k0cq+RBQN55dOQELo8zKAbcU7e79WSAM8D3DGK/tX
 WOChyTD7z+y7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CL0DBoA/
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2026.05
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

For release note, see:
https://github.com/sbabic/swupdate/releases/tag/2026.05

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...no-crypto-configuration-link-failure.patch | 67 -------------------
 package/swupdate/swupdate.hash                |  2 +-
 package/swupdate/swupdate.mk                  |  2 +-
 3 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch

diff --git a/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch b/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
deleted file mode 100644
index 15f33aa3ab..0000000000
--- a/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 4e7c2f6c4b978efae69d777705de84411a01c147 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 24 Mar 2026 14:23:58 -0600
-Subject: [PATCH] build: fix no-crypto configuration link failure
-
-When no crypto backend is selected, the crypto directory contributes
-no objects, so this kbuild variant does not generate
-crypto/built-in.o.
-
-The top-level build still linked that file unconditionally, causing
-the final link to fail.
-
-Introduce a hidden SWUPDATE_CRYPTO helper selected by the Kconfig
-options that actually populate crypto/, and only descend into the
-crypto directory when that helper is enabled.
-
-Upstream: https://github.com/sbabic/swupdate/commit/10334fb21796b75f3a1208a3d5a98a307712218b
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile       | 3 ++-
- crypto/Kconfig | 5 +++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index aa9604aa..759fd191 100644
---- a/Makefile
-+++ b/Makefile
-@@ -369,7 +369,8 @@ include $(srctree)/Makefile.flags
- # This allow a user to issue only 'make' to build a kernel including modules
- # Defaults to vmlinux, but the arch makefile usually adds further targets
- 
--objs-y		:= core handlers crypto bootloader suricatta
-+objs-y		:= core handlers bootloader suricatta
-+objs-$(CONFIG_SWUPDATE_CRYPTO) += crypto
- libs-y		:= corelib mongoose parser fs containers
- bindings-y	:= bindings
- tools-y		:= tools
-diff --git a/crypto/Kconfig b/crypto/Kconfig
-index 4b9db821..cc953542 100644
---- a/crypto/Kconfig
-+++ b/crypto/Kconfig
-@@ -23,9 +23,13 @@ menu "Crypto libraries"
- 		depends on HAVE_GPGME
- endmenu
- 
-+config SWUPDATE_CRYPTO
-+	bool
-+
- config HASH_VERIFY
- 	bool "Allow to add sha256 hash to each image"
- 	depends on SSL_IMPL_OPENSSL || SSL_IMPL_WOLFSSL || SSL_IMPL_MBEDTLS
-+	select SWUPDATE_CRYPTO
- 	help
- 	  Allow to add a sha256 hash to an artifact.
- 	  This is automatically set in case of Signed Image
-@@ -83,6 +87,7 @@ menu "Encryption"
- config ENCRYPTED_IMAGES
- 	bool "Images can be encrypted with a symmetric key"
- 	depends on SSL_IMPL_OPENSSL || SSL_IMPL_WOLFSSL || SSL_IMPL_MBEDTLS
-+	select SWUPDATE_CRYPTO
- comment "Image encryption needs an SSL implementation"
- 	depends on !SSL_IMPL_OPENSSL && !SSL_IMPL_WOLFSSL && !SSL_IMPL_MBEDTLS
- 
--- 
-2.47.3
-
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index b3f43648f8..06583ade35 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18ab1eaa533  swupdate-2025.12.tar.gz
+sha256  fd70cdfc7224b4209f5f657c3d6052688412325ea5d4e9e792575fa22eb65cef  swupdate-2026.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b2778d2aec..983cd6eccc 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2025.12
+SWUPDATE_VERSION = 2026.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
