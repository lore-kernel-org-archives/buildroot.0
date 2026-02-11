Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45773E9E31B
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 15:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D6E409C9;
	Wed, 11 Feb 2026 15:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nizYebx68a9j; Wed, 11 Feb 2026 15:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AEBC40A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770824568;
	bh=gmcowzmdnpUI5QOs6Tx3PxmmViGeo/WS0TP7lJCmDd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WxF1gqtJhYB+6OAhMs1/pPQ3HUcHz7ShqYKWSb5rj+ivltV7RMGuXFd/MJQaNSXB+
	 tEzkSXgR1w2YhLO29/qpk4A/7oTg5MODxTicALAkE19sFd8i0faykQq9Z9Rr2JUJUP
	 XwARnckyNTTFwJGK4vtuiTzRd3JWg+VbHDjuu9jyZJ6qWxiAWETPfV8c+cAoaNFz1R
	 09ypBM4Av0MK7BJXpdI0WBD07SME4g6IPTc3iuY9zkOoQ5CZmFE2knUyG24raOea4f
	 hSn75UUz2gbVNsi7XaOSy8vZxBhK5bKoJkH6AjmQMfWlHtD+sPlHfWY+OS4flLSuwQ
	 QabDIwDcwjwvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AEBC40A43;
	Wed, 11 Feb 2026 15:42:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2AC523D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 15:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCCB640A43
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 15:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Obfanvr9fRl for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 15:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8BD0409C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8BD0409C9
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8BD0409C9
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 15:42:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 459931814B9; Wed, 11 Feb 2026 16:42:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 16:42:09 +0100
Message-ID: <20260211154210.4018909-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770824562; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=lerPOv/vwE8ljgrfUidrcry1+tQFSmofiS7V0G9IcsM=;
 b=Lh0QW7o48ULG4Us18OhrnEa++7/cW/P6mgiOsEybDL5sVm7WX3Px5wS0Soqsg9UAnZD0XK
 biCY5QXWhKn4q2hs1aYiIU+pIcaVak68akwDpyrLDy+XsAofero+i8Wzd6SbhuGRP+SLcR
 FppGmWFhnlT/Z0E5C/hrgr78pmbPd9c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Lh0QW7o4
Subject: [Buildroot] [PATCH] package/i2pd: bump to version 2.59.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Requirement for Boost.DateTime was removed in 2.54.0 [0]
- Requirement for Boost.System was removed in 2.59.0 [1]
- drop "WITH_GUI" conf_opt as it was dropped in 2.32.0 [2]
- LICENSE hash changed due to year bump.

Release notes:
https://github.com/PurpleI2P/i2pd/releases/tag/2.59.0

[0] https://github.com/PurpleI2P/i2pd/commit/0992a5124fc9d214624fccdf4386a50f53d6f8ef
[1] https://github.com/PurpleI2P/i2pd/commit/06a86f31a12815fbd16615cc9fa17199bac1ac17
[2] https://github.com/PurpleI2P/i2pd/commit/db6a0e6ad9124ef9b6217af487b3c844234ba5e1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/i2pd/Config.in | 2 --
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index c1ba08ef75..cb6f7894ea 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -9,10 +9,8 @@ config BR2_PACKAGE_I2PD
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index a539a4dd1a..0d7755b585 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.58.0/SHA512SUMS
-sha512  d5d87a04ff5f8481516c00b07dd46726dfb3f0de67f4932874a0655b4adfa448a434056a131d727dd79a2f3ee1f6cc9aef5dc176a0b5ab546d8e94b6c0b38ee5  i2pd-2.58.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.59.0/SHA512SUMS
+sha512  5fa4365eaa6fbc0e448732d3c96b867e27db21927727aeb9df8241d56fea08561028a7b6d51ba7fa1141d53c95b848108806edb9f420c2ebbed85f627f045af7  i2pd-2.59.0.tar.gz
 # Locally computed:
-sha256  5ec428c65b0bc8680e08daa75aa060fe72b5b3c3b89082ac02031e0f2d3d0039  LICENSE
+sha256  eb5ac2a5ede8cd6bed9e6d93ad943119a73bfaba378f21bafa307f9b026b2034  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 3681e6006e..ac0348c24a 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.58.0
+I2PD_VERSION = 2.59.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
@@ -15,8 +15,6 @@ I2PD_DEPENDENCIES = \
 	openssl \
 	zlib
 
-I2PD_CONF_OPTS += -DWITH_GUI=OFF
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 I2PD_CONF_OPTS += \
 	-DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
