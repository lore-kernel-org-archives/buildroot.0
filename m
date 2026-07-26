Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0950DC531F9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 17:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC8F4065F;
	Sun, 26 Jul 2026 17:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YnebJeCPxbo; Sun, 26 Jul 2026 17:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68D940665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785088462;
	bh=ORsOWTLX/HIIJvVkfS+qmP4TgrVcGP9Di7ILCEebNV8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g34yKdKG41WR3WYT5nKUIrg4seF+kRTlcfkDQFY9kHu0t0zOY48vvFS01i5LRl2YE
	 yTTRL/XEg5CP8Cx37GH7TVgiCOes9EE7C7XJRz93q3iMnwSrkdX29ANz9JcbEmGts1
	 15HEw1C3fT0zK68Yycm0zP0erl3rx10YjeppJi731tQrDiwsaOHkEFMQJDxP6Zr8gd
	 59HPtR2k1TY9A3vpcP6rEh3x8ExSPz+KK9QLF9q85xNLuCkEyexan02Hg0HwRCTFV/
	 +lGlKOjPZNzhCHFg890r3ywOPVupWPfujSmVFynaHjDQ4p9RqdkaiPi2+lBXfa9HjG
	 W+DXvsKLuUbIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68D940665;
	Sun, 26 Jul 2026 17:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 669374C4
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 17:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 583AD606A0
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 17:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQg-_BCUSxyC for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 17:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A8E36069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8E36069F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A8E36069F
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 17:54:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0445.dip0.t-ipconnect.de [91.58.4.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1FDCA4C3FBB;
 Sun, 26 Jul 2026 19:54:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37208)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wo33J-000000004Uv-2pBs;
 Sun, 26 Jul 2026 17:54:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 26 Jul 2026 19:54:16 +0200
Message-ID: <20260726175417.4001365-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785088457;
 bh=yQ/FpaoWfT2PimAUCWwYTNe27bZK/OQ7NLewtEGsY88=;
 h=From:To:Cc:Subject:Date:From;
 b=OV6r45hftnseQR7/WteuE79zhkvsRcdZE0nQCKRxyY9zxEOi8PGABumcMhuTld5q4
 bV4zxYnbC1ytBhi3IzWxy38tqWM1rEiJoJGc0kayhUqlnyr8dW290jMBp8fsm85cu6
 Df2BIxpMY+BEYkgtQ0kiiAQ9kHcopApRGdSNTpKO/Xsqks0fINm4LRXpJxhRgqBiBn
 glAQoJM1jJa/7SSGTaquX4MhVfFGaQNhvFcM68jfUVfKghMj1mxkWkw2Xwd65sg2wQ
 HS7nTFiUpk74pNIpe5n68opLymSVtVJN1JzV/HFLEQB5yTZGszLZGtYl/mIiOtlykM
 qV4HyF3cY/7WQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OV6r45hf
Subject: [Buildroot] [PATCH 1/2] package/jpeg-turbo: use configure option
 WITH_{TESTS, TOOLS}
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

Buildroot commit c531fe65209defd356e5ee8142896478a20ab371 bumped the
package to 3.1.2. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/942ac87e479c48199d48781e9a5b2cda3b910d7b
which added configure options to disable the build of command-line
tools and tests.

This patch replaces the currrent _POST_INSTALL_TARGET_HOOK with the new
configure option and disables the build of tests.

Please note that the line wrap at -DWITH_TOOLS=ON prepares for a
subsequent patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ffb46c1044375c2566fdfdd42daefb3431bd9945

 package/jpeg-turbo/jpeg-turbo.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 9a10110766..36a0260f40 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,7 +15,7 @@ JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
-JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON -DWITH_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
@@ -43,11 +43,11 @@ ifeq ($(BR2_STATIC_LIBS),)
 JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),)
-define JPEG_TURBO_REMOVE_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
-endef
-JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
+JPEG_TURBO_CONF_OPTS += \
+	-DWITH_TOOLS=ON
+else
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
