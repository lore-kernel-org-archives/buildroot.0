Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C8CCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 090D3614D3;
	Sat, 16 Aug 2025 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-K-fcolVccz; Sat, 16 Aug 2025 19:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36793614D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36793614D0;
	Sat, 16 Aug 2025 19:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BA075
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44904836A7
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tHvtiC_WbEd for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C7D2835E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7D2835E0
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C7D2835E0
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:55:53 +0000 (UTC)
Received: from argo.fritz.box (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 82EAAE001D9;
 Sat, 16 Aug 2025 21:55:50 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 21:55:41 +0200
Message-ID: <20250816195542.3748-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755374150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XnLVz6+sVQJ41iCClp1lV6CmJsbPsKhYIJNonV5rDbY=;
 b=W9V4vQZLA3psXUDcpbe6Ks0jMV6UT+xvuqoUQvOmj2oKf8VoYLHUpfyqkkfg9PyWhYEM2p
 frfGe+I5vM9TbwBOnEl/RDvwzjibKwVqA+0y/9sh8cBMBc3/gXicw3/pYREYhL1scRcL4S
 zo1TikDpeu8nmS4qnk4uOf0WbO65LJw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=W9V4vQZL
Subject: [Buildroot] [PATCH 1/1] package/libjwt: require openssl
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
Cc: Florian Larysch <fl@n621.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ever since upstream commit 01dd6da ("Rework the entire API"), first
introduced as part of release v3.0.0, openssl is a hard requirement for
building libjwt. As such, "-DWITH_OPENSSL=ON" also has become a no-op.

In Buildroot, this has been masked somewhat by the implicit select when
gnutls is disabled, but a failure can be reproduced using test-pkg with
a config like:

BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_LIBJWT=y

Fix this by requiring openssl. Furthermore, building against libressl
does not work because libjwt requires API surface that is not present
there[1], so we need to force libopenssl.

libjwt still supports linking against additional crypto providers, so we
can still link against gnutls if it is present.

[1] https://autobuild.buildroot.org/results/463/4638a7d46c149ca0f46d3fe5f5f90dc5ee9d1e03

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/libjwt/Config.in | 3 ++-
 package/libjwt/libjwt.mk | 7 ++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
index 39d1665e0e..47eb0882a3 100644
--- a/package/libjwt/Config.in
+++ b/package/libjwt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBJWT
 	bool "libjwt"
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_JANSSON
 	help
 	  JSON Web Tokens are an open, industry standard RFC 7519
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 29ca9cebf4..687432142f 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -7,7 +7,7 @@
 LIBJWT_VERSION = 3.2.0
 LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
 LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
-LIBJWT_DEPENDENCIES = host-pkgconf jansson
+LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
@@ -16,10 +16,7 @@ LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 
 LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBJWT_CONF_OPTS += -DWITH_OPENSSL=ON
-LIBJWT_DEPENDENCIES += openssl
-else
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBJWT_CONF_OPTS += -DWITH_GNUTLS=ON
 LIBJWT_DEPENDENCIES += gnutls
 endif
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
