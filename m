Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DFEC77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B12960720;
	Fri, 27 Jun 2025 15:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8Y7ZidfS60e; Fri, 27 Jun 2025 15:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C6E960879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6E960879;
	Fri, 27 Jun 2025 15:03:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E17511A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B3DD40595
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0c8DaN4ZAmb for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB20840441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB20840441
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB20840441
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:03:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id VAc0uAuXmzKH1VAc0uO3u2; Fri, 27 Jun 2025 17:03:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Jun 2025 16:58:19 +0200
Message-Id: <20250627145819.432279-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDeonqEGkT2jzd1v2G1KOzjNRDqSHZuq2WEZiMDDN2eretRQSYXVD9BAm/SjCnqy6zzaZrn/yQ4bHgp9WsuHFzqevTlFvKTxcJvZvky66guqReXnr0eg
 hnExHWKfb6ad9eOrbGe2haxfnNrFbecuU2YqyUzuOCaiUZKckWt+D1cM91e9Xp11KBbPkQr+dzFUI9caom4LDmsOgCd+p3W9xxECpamzBGYwMMJOoBCoN1/1
 hE1eV2pADJzbDK/5TyhxIPlAOtwb7ZAjvsFxHCIdmic=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751036612; bh=Vn7dFE1rEI1dpeh+Zdria9bki7tkjqMEEw4kfDQ6MvA=;
 h=From:To:Subject:Date:MIME-Version;
 b=QCqQVPLYXQbX+ZZFjSPtwV1r9Ai/Ch14aWoo41jDB6JA0i9mF7vgDbPbL6yWif+PH
 nhGkVNkMCUKZhPPDID9RVApxZsUVTt7ItLAXSGMoq+hycgu11IfKV1nbaqD4yM6lUW
 OgKUhxIZq6XuZ9Wg8qgaHBBNQQUi5bDVacoZN9MtxYXjZFVnlPwIB0L8ZrgiTAWum5
 eTd9hwJpHvv731nPFxZUmQp62os4qY4H8u9WgOS8+XOfnqgX6E9EtlPMHXCKcCWG/O
 NZtZEOW1xHgJz+pujMA/Bb9vB8ux0IoLhjt/4Y7xNAP+g/OPcPsY4f4wtBFD39xK2M
 9V5jS3a7oH2RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QCqQVPLY
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.0
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

Rearrange license files according to upstream.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash |  9 ++++++---
 package/cryptsetup/cryptsetup.mk   | 12 ++++++++----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e46cfbdf29..b15d820009 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,7 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
-sha256  d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522  cryptsetup-2.7.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
+sha256  cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2  cryptsetup-2.8.0.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
-sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING.Apache-2.0
+sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  COPYING.CC-BY-SA-4.0
+sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception
+sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 52f79e177f..6112b7d43d 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
+CRYPTSETUP_VERSION_MAJOR = 2.8
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
@@ -13,8 +13,12 @@ CRYPTSETUP_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
-CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
-CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
+CRYPTSETUP_LICENSE = Apache-2.0, CC-BY-SA-4.0, GPL-2.0+ (programs), LGPL-2.1+ (library)
+CRYPTSETUP_LICENSE_FILES = COPYING \
+			   docs/licenses/COPYING.Apache-2.0 \
+			   docs/licenses/COPYING.CC-BY-SA-4.0 \
+			   docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception \
+			   docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
 CRYPTSETUP_CPE_ID_VALID = YES
 CRYPTSETUP_INSTALL_STAGING = YES
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
