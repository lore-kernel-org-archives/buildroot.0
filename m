Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020ECC7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7EA541A53;
	Sun, 22 Jun 2025 10:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jI4MteUDcpj; Sun, 22 Jun 2025 10:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF05941A65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF05941A65;
	Sun, 22 Jun 2025 10:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5A5C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01A6F80F5B
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEYCo81ynSsI for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFC7981755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC7981755
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFC7981755
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:04:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E899FA4C0298
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 12:04:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54010)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTHYa-0000000054k-0E2d
 for buildroot@buildroot.org; Sun, 22 Jun 2025 10:04:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:04:12 +0200
Message-Id: <20250622100412.3836588-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750586652;
 bh=oJmiVbnjG+8Htk1Bv+hYxUE1f7LKpHr6EKoxSZts28w=;
 h=From:To:Subject:Date:From;
 b=rXJyfO5BTlrJOKCU7C9wD/CFM0VEfwGv8ys85SFGpzGfgzkITq0C3YV/ciEcw1w3R
 35ZsV1gDkCtGXZiLIpE6a37kLeMQ2jYK2WMF/xZyGGxMSEjKsMD9/2d+DAMQyIcfUM
 VPhDYE0tzGj2WSqVFjkQsF3fzR5y0yYgu9uxYQwLgF6RlRAODAYiXhGiiSqfZn3ik+
 57/9SKzGpcbsJX6AtiIhg/OWQiCOnI8CjfUSGC+D9RoHZlUTrz7SaF4pu01/GPEmBY
 4Z6hXobfSW0HSfm84AICj6fojzZBH8RVbAx88XTjJYzGVU6jOS/CS2/f6kh7ZJP44r
 0rcCRGZWTeJpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=rXJyfO5B
Subject: [Buildroot] [PATCH 1/1] package/libcrossguid: bump version
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

Needed for kodi 22.x.

Added build fix for >= gcc-13.

Switched build system to cmake following upstream:
https://github.com/graeme-hill/crossguid/commit/13683c56e559f93d75f8640488aa3335f43443ed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-pr67-include-missing-cstdint.patch   | 31 +++++++++++++++++++
 package/libcrossguid/libcrossguid.hash        |  2 +-
 package/libcrossguid/libcrossguid.mk          | 19 ++----------
 3 files changed, 35 insertions(+), 17 deletions(-)
 create mode 100644 package/libcrossguid/0001-pr67-include-missing-cstdint.patch

diff --git a/package/libcrossguid/0001-pr67-include-missing-cstdint.patch b/package/libcrossguid/0001-pr67-include-missing-cstdint.patch
new file mode 100644
index 0000000000..0986f4e9e5
--- /dev/null
+++ b/package/libcrossguid/0001-pr67-include-missing-cstdint.patch
@@ -0,0 +1,31 @@
+From 1eb9bea38c320b2b588635cffceaaa2a8d434780 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 22:09:26 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/graeme-hill/crossguid/pull/67
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/crossguid/guid.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/crossguid/guid.hpp b/include/crossguid/guid.hpp
+index 61e0f17..70966f2 100644
+--- a/include/crossguid/guid.hpp
++++ b/include/crossguid/guid.hpp
+@@ -29,6 +29,7 @@ THE SOFTWARE.
+ #include <jni.h>
+ #endif
+ 
++#include <cstdint>
+ #include <functional>
+ #include <iostream>
+ #include <array>
diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
index 17dbe35c71..3f5c56d641 100644
--- a/package/libcrossguid/libcrossguid.hash
+++ b/package/libcrossguid/libcrossguid.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
+sha256  6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4  libcrossguid-ca1bf4b810e2d188d04cb6286f957008ee1b7681.tar.gz
 sha256  779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
index 46d9a9dcc6..3573bdc807 100644
--- a/package/libcrossguid/libcrossguid.mk
+++ b/package/libcrossguid/libcrossguid.mk
@@ -4,25 +4,12 @@
 #
 ################################################################################
 
-LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
+LIBCROSSGUID_VERSION = ca1bf4b810e2d188d04cb6286f957008ee1b7681
 LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
 LIBCROSSGUID_LICENSE = MIT
 LIBCROSSGUID_LICENSE_FILES = LICENSE
 LIBCROSSGUID_INSTALL_STAGING = YES
-# only a static library
-LIBCROSSGUID_INSTALL_TARGET = NO
 LIBCROSSGUID_DEPENDENCIES = util-linux
+LIBCROSSGUID_CONF_OPTS = -DCROSSGUID_TESTS=OFF
 
-define LIBCROSSGUID_BUILD_CMDS
-	(cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
-		-c guid.cpp -o guid.o)
-	(cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
-endef
-
-define LIBCROSSGUID_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
-		$(STAGING_DIR)/usr/lib/libcrossguid.a
-	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
