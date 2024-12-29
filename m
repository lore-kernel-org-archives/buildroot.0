Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B589E77191
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A0E404E4;
	Sun, 29 Dec 2024 14:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcXm1lbzVyDS; Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F80E404CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F80E404CA;
	Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49EB2C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A511402E5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DF48MSBcEZ7M for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02F40404B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F40404B9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02F40404B9
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D3682E0002;
 Sun, 29 Dec 2024 14:55:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:24 +0100
Message-ID: <20241229145542.742168-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytyym1O4SBvSGLgwf8aNqZHogMRLMAU7sqtxLdF/oa8=;
 b=kbUt8VKeKq6aHiI+bNIbwJGorz5M/biUBTDFftU87UkXjW6bV+O3E4zM8P4WTeYBQKQhX0
 g1ZYLXo97scffYoL/NYO7ahA5vq/gvnv6UXqsvQ11FTV9doG1NJ2vP+nUojFysq8pCAADF
 AB0ibsbubnFUq9wK89Y9jpqti1YGUkwC1LaAb2CQO0EsDemdeQaTaVvJQQ2+Ljqt/Fkcxd
 3a69P1IPBHV1UbJcFaEY4NLbSJdmzKc5GzwIdsu+lRu3qgdvOM/mTQzpX6asxkKSv9Zep4
 vVMdMat6vcHeBXO5rUhHPCGEgMwtRhgXZXoNH4oquQjxpvBPRV1i7KEwkSmEUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kbUt8VKe
Subject: [Buildroot] [PATCH 01/12] package/directfb-examples: remove package
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

directfb.org is dead so since commit
89ab2a5a3f4588891ab1e9e76feb8c3f69402d5c (from 2022), we are
downloading from sources.buildroot.net.

Clearly DirectFB 1.x is no longer maintained. A DirectFB 2.x project
is now at https://github.com/directfb2/, but despite an attempt in
August 2024 [1], it still isn't packaged in Buildroot. Therefore it's
time to drop directfb 1.x, which doesn't prevent in the future from
adding directfb 2.x.

[1] https://lore.kernel.org/buildroot/20240705132544.351613-1-shengwen1997.tw@gmail.com/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                            |  1 -
 Config.in.legacy                               |  7 +++++++
 package/Config.in                              |  1 -
 .../directfb-examples/0001-remove-bzero.patch  | 17 -----------------
 package/directfb-examples/Config.in            | 11 -----------
 .../directfb-examples/directfb-examples.hash   |  3 ---
 package/directfb-examples/directfb-examples.mk | 18 ------------------
 7 files changed, 7 insertions(+), 51 deletions(-)
 delete mode 100644 package/directfb-examples/0001-remove-bzero.patch
 delete mode 100644 package/directfb-examples/Config.in
 delete mode 100644 package/directfb-examples/directfb-examples.hash
 delete mode 100644 package/directfb-examples/directfb-examples.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 37cd4c9460..37b3a1dd76 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -399,7 +399,6 @@ package/dht/0001-cmake.patch lib_patch.Upstream
 package/dillo/0001-usr-local-include.patch lib_patch.Upstream
 package/dillo/0002-Fix-openssl-detection.patch lib_patch.Upstream
 package/dillo/0004-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/directfb-examples/0001-remove-bzero.patch lib_patch.Sob lib_patch.Upstream
 package/directfb/0001-fix-missing-davinci-voodoo-header.patch lib_patch.Upstream
 package/directfb/0002-imlib2-config.patch lib_patch.Upstream
 package/directfb/0003-setregion-lock.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ed74bf15c2..34e2319949 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_DIRECTFB_EXAMPLES
+	bool "directfb-examples has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer maintained upstream, so it was
+	  dropped from Buildroot.
+
 config BR2_PACKAGE_HIAWATHA
 	bool "hiwatha has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 814101458d..bbd46bd491 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -345,7 +345,6 @@ comment "Graphic applications"
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
 	source "package/directfb/Config.in"
-	source "package/directfb-examples/Config.in"
 	source "package/efl/Config.in"
 	source "package/fb-test-app/Config.in"
 	source "package/fbdump/Config.in"
diff --git a/package/directfb-examples/0001-remove-bzero.patch b/package/directfb-examples/0001-remove-bzero.patch
deleted file mode 100644
index 41616b5c31..0000000000
--- a/package/directfb-examples/0001-remove-bzero.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- src/df_knuckles/matrix.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: directfb-examples-1.2.0/src/df_knuckles/matrix.c
-===================================================================
---- directfb-examples-1.2.0.orig/src/df_knuckles/matrix.c
-+++ directfb-examples-1.2.0/src/df_knuckles/matrix.c
-@@ -19,7 +19,7 @@
- static float Cosine[3600];
- static float Sine[3600];
- 
--#define M_CLEAR(m) bzero(m, MATRIX_SIZE)
-+#define M_CLEAR(m) memset(m, 0, MATRIX_SIZE)
- #define M_IDENTITY(m) memcpy(m, IdentityMatrix, MATRIX_SIZE)
- 
- static void MultiplyMatrix(float *A, float *B)
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
deleted file mode 100644
index 4d5de03068..0000000000
--- a/package/directfb-examples/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DIRECTFB_EXAMPLES
-	bool "directfb examples"
-	depends on BR2_PACKAGE_DIRECTFB
-	help
-	  The DirectFB-examples package contains a set of simple
-	  DirectFB applications that can be used to test and demonstrate
-	  various DirectFB features. As of 4 October 2015, DirectFB's
-	  website http://www.directfb.org/ is down. See alternative site
-	  listed below.
-
-	  http://elinux.org/DirectFB
diff --git a/package/directfb-examples/directfb-examples.hash b/package/directfb-examples/directfb-examples.hash
deleted file mode 100644
index 9c7f7c25a7..0000000000
--- a/package/directfb-examples/directfb-examples.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a  DirectFB-examples-1.7.0.tar.gz
-sha256  f91483684678e8aa8ccc4ee0ede3140b0494f8305e162695c7e6e3f83e54f236  COPYING
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
deleted file mode 100644
index c8d09b3e33..0000000000
--- a/package/directfb-examples/directfb-examples.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# directfb-examples
-#
-################################################################################
-
-DIRECTFB_EXAMPLES_VERSION = 1.7.0
-DIRECTFB_EXAMPLES_SITE = http://sources.buildroot.net/directfb-examples
-DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
-DIRECTFB_EXAMPLES_LICENSE = MIT
-DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
-DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
-
-ifeq ($(BR2_STATIC_LIBS),y)
-DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
-endif
-
-$(eval $(autotools-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
