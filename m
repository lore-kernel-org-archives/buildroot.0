Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3620CCEB2C2
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 22:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E30B606A7;
	Mon, 30 Sep 2024 22:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQMm93s0WCQ7; Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5BD46074A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BD46074A;
	Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 969651BF294
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92361402DB
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVO6DQIBsOax for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 22:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60197402D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60197402D6
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60197402D6
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 22:31:38 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a0cad8a0a5so26102895ab.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727735497; x=1728340297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9zmQh2ClPv1RA3A2hx1LTi1eqxLs9/GAYSUPiuPjxs=;
 b=GVoukat5rVTM0OLn4bmdx25sy2laMdJx8jjGNE7fh0KnEPV4I4++q8nlj2zuGOpnOG
 fE/seR4z8GAnnR4/QfwZy89FcWjLwwIL8qI2G0XQYrpidNDv5BPbCOIJslGxO1Nsnf5v
 Rq12CJFR3av7ef4V7DFZm3Jy3BT1LRCODsia0MXL6NZi22WbAAdHeKfQIdRl1HrQ31vY
 MSwSEGWPrsfMyi02hrNV/7eKDpdGkJyAm1tfYR76r0FzfwiP3pqnHgtURd6hi1gSQvmY
 GoUFXqnegU+0VR16AWWRADD7EfsZSW57wNpZt28k7vCbAcGVbc+/+FfOFSx5tBJj5aFx
 trhg==
X-Gm-Message-State: AOJu0YwmxWGXwIen4AA+pPq84KinmSqlPj67BXKp+0mxgTJEWqvMaC83
 kqsTZZ2PRKVV/2SE1u8aYl8soW0IAgXLlmmMZe+sjyAJz+LqcYYHEsXQ6g==
X-Google-Smtp-Source: AGHT+IGmDhU9qSIlJrhh1hkZQ/b8ffA9fDQvBj8zn+erGaY00mIKEuSMv2wQCKTxXwmB0e2KdBSXQA==
X-Received: by 2002:a05:6e02:2168:b0:3a3:3e17:994e with SMTP id
 e9e14a558f8ab-3a345166287mr100270445ab.9.1727735496916; 
 Mon, 30 Sep 2024 15:31:36 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888d94eesm2327929173.129.2024.09.30.15.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 15:31:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 16:31:30 -0600
Message-Id: <20240930223133.1202389-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727735497; x=1728340297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S9zmQh2ClPv1RA3A2hx1LTi1eqxLs9/GAYSUPiuPjxs=;
 b=e1C/E9AvH6n4ly2CWjrJ4WGU2696aIwkeCt/sD3121WEh6Xh8i7Uxs9/FK4i5zK8Xs
 jOxx5OBTQ3JaETDNWPvrVUEJ1cfJ5gmQzHRolsAqtNGO9TtJg2pv+Yuw2sz8gidH+C5w
 SjEnKRo/UeIfrYifBVzlaD4CpI744kBgEHPvWv6XlaZH4eZIY0J8dMTLIVXCeNFEuRwL
 WQ8s7thDVlR79j1CahGXbRZJDttfthoZx0CcmHrPWYJ/6qIaq0ZQwm5ynTMmpuLMAa3L
 M2d2ma3+xzLQ8nvv/pjIyaa/Exj6hMsspq41U6F75c8ggIQNj1FLIeT0k98nyQXjx8Mm
 LJ/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e1C/E9Av
Subject: [Buildroot] [PATCH 1/4] package/qpdf: bump to version 11.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qpdf/qpdf.hash |  4 ++--
 package/qpdf/qpdf.mk   | 31 ++++++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 08a048f2ed..0dc3a1212d 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/10.5.0/qpdf-10.5.0.sha256/download
-sha256  88257d36a44fd5c50b2879488324dd9cafc11686ae49d8c4922a4872203ce006  qpdf-10.5.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/11.9.1/qpdf-11.9.1.sha256/download
+sha256  2ba4d248f9567a27c146b9772ef5dc93bd9622317978455ffe91b259340d13d1  qpdf-11.9.1.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index d479515789..4b64e419c2 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,36 +4,53 @@
 #
 ################################################################################
 
-QPDF_VERSION = 10.5.0
+QPDF_VERSION = 11.9.1
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
+QPDF_SUPPORTS_IN_SOURCE_BUILD = NO
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_CPE_ID_VALID = YES
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
-QPDF_CONF_OPTS = --with-random=/dev/urandom
+QPDF_CONF_OPTS = \
+	-DBUILD_DOC=OFF \
+	-DENABLE_COVERAGE=OFF \
+	-DQTEST_COLOR=OFF \
+	-DINSTALL_EXAMPLES=OFF
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+QPDF_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
+else
+QPDF_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+QPDF_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else
+QPDF_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+endif
 
 ifeq ($(BR2_USE_WCHAR),)
 QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-QPDF_CONF_OPTS += --enable-crypto-gnutls
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=ON
 QPDF_DEPENDENCIES += gnutls
 else
-QPDF_CONF_OPTS += --disable-crypto-gnutls
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-QPDF_CONF_OPTS += --enable-crypto-openssl
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=ON
 QPDF_DEPENDENCIES += openssl
 else
-QPDF_CONF_OPTS += --disable-crypto-openssl
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=OFF
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 QPDF_CONF_ENV += LIBS=-latomic
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
