Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3433FC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 12:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC97760BAD;
	Sat, 25 Feb 2023 12:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC97760BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yThNE-M6v8qL; Sat, 25 Feb 2023 12:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0156460B70;
	Sat, 25 Feb 2023 12:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0156460B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 999C21BF3BB
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 12:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F58260B70
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 12:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F58260B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xL_l_C2nKNW2 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 12:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B4B860B60
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B4B860B60
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 12:30:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so631602wmq.1
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 04:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/FduIL3uciV9OLv52OjtVQ6f9BYlng6EljKCorA57ww=;
 b=mRoxBV18yDWtuxn0iMa0MNlCJVc6GCHg0D4nxG/ISw+AGSY+KPsAu4SSC5QDoYrSSB
 6L8KSsyKCWtrvkSTGo3l/BK5HKFqaG2t6o5exwlRvZL4pXt36QDBlDa4UA9mGMaxTBaz
 IuzmHgSl91UW2CzVWnx9jOQS7yPm3m13X1E1e4mD7Aof8kW9sDCoZ3fKStadjE+MfpBU
 rQU4Hdnq2uOeZL3H6ZhpO1/sXmdrEAOh+rdXK1UgoIotWP/DvwRwN12kClEC2L2scXac
 cQvTLpdjw0kCYLXueoDdQujnienKg3HAAGp89ly+YpgkJ+yV3aSaD5cShTMnIW4Swi2W
 nN7w==
X-Gm-Message-State: AO0yUKXD9JfRvBeYtrDSiIKlGTByzMvtpDXGjQaPcHrFkL26B2CNwtgs
 /urqGQPc6NyldrO8iBNg639aWps097s=
X-Google-Smtp-Source: AK7set9osI2mFgN5avv6gBZWP4beN8kwlSbbIxvnYCOwcH8X7D3e3PsYceiykcH8AHw+sqVWPEaIeA==
X-Received: by 2002:a05:600c:44d2:b0:3ea:4af0:3475 with SMTP id
 f18-20020a05600c44d200b003ea4af03475mr7394173wmo.1.1677328227823; 
 Sat, 25 Feb 2023 04:30:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003daf672a616sm2438466wmi.22.2023.02.25.04.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 04:30:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 13:30:22 +0100
Message-Id: <20230225123022.1987160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/FduIL3uciV9OLv52OjtVQ6f9BYlng6EljKCorA57ww=;
 b=O/4u+/nPvy7FVBaeRiEh9HLEdvEAkGg0JHfMc9vbhcXjMt7vj4SBP5fGYEovIv0h9m
 e75Uq6B52dvfD73cby3Fv4ElQL7M5KIhucXC1bsQgBOfrGcJ7Lc8N07e16G4j7Il80K7
 0/8FmDyqbuTAsITwvdFbJ0KVmCjP/yD3TBtdAGx2ZHgcH7ReRtrCfr8NglfIvAmTXdKX
 OWZS6tVkXJMeVyTuKq2B9i7Bx13RlPi0kcFAWwngE0McoQ5DBw3s4NMiccLV4Zy9gnL5
 0RL3n43pN7Ph5YPeFiKyNSRfD1dKkscFPEA1s7TPYC79xmOMDQ76P2ufEh0/fhfvBCv3
 4eCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O/4u+/nP
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump to version 8.1.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with wolfssl raised, at
least, since bump of wolfssl to version 5.5.0 in commit
1891419db38e4d85595b2111db448f68eef684b8:

/tmp/instance-18/output-1/build/rtty-7.4.0/src/ssl.c:75:5: error: unknown type name 'SSL_CTX'
   75 |     SSL_CTX *ctx;
      |     ^~~~~~~

https://github.com/zhaojh329/rtty/compare/v7.4.0...v8.1.0

Fixes:
 - http://autobuild.buildroot.org/results/d045d85890ca97accfcea6c13c94757485d867c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtty/rtty.hash |  2 +-
 package/rtty/rtty.mk   | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index b2e9db2436..a6ccb5c2e6 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802  rtty-7.4.0.tar.gz
+sha256  e634939bae62bf3d52ceebae5df00179629d214634b93464eeb2294406512b30  rtty-8.1.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 4ec220394c..964ec04ec4 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.4.0
+RTTY_VERSION = 8.1.0
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
@@ -13,26 +13,26 @@ RTTY_DEPENDENCIES = libev
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
 RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=ON \
-	-DRTTY_USE_OPENSSL=OFF \
-	-DRTTY_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=ON \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 RTTY_DEPENDENCIES += host-pkgconf openssl
 RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=OFF \
-	-DRTTY_USE_OPENSSL=ON \
-	-DRTTY_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=ON \
+	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 RTTY_DEPENDENCIES += wolfssl
 RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=OFF \
-	-DRTTY_USE_OPENSSL=OFF \
-	-DRTTY_USE_WOLFSSL=ON
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=ON
 else
-RTTY_CONF_OPTS += -DRTTY_SSL_SUPPORT=OFF
+RTTY_CONF_OPTS += -DSSL_SUPPORT=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
