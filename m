Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C6C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 19:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280A481FA5;
	Tue, 13 May 2025 19:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7luhiPSMfjBF; Tue, 13 May 2025 19:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A23681F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A23681F64;
	Tue, 13 May 2025 19:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2316153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A84E340F58
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjOAdjdj-SHJ for <buildroot@buildroot.org>;
 Tue, 13 May 2025 19:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEA2140E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEA2140E24
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEA2140E24
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:18:25 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-86a07a1acffso23760939f.0
 for <buildroot@buildroot.org>; Tue, 13 May 2025 12:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747163904; x=1747768704;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6q4dVJcS0yiRvf7SjiKopcRLBMBkTh2SayZPJNZiAig=;
 b=d7rOaINCoothFwG1w2Xdh4PboeY1ebhP72k/F8mAzxGQ7tHUoNcSnTgaU3UPJwIFrE
 5lQwLcI9xB2S4Cvazx+GDZTUIX7H1NEHiBYu1x8ovXu88Sj4Kw8H/+1rOL7eyMOlszMl
 OrGlJ98y+n5Fe7v8cYW2oNVvpyAUteea37VS+0PI51WaSpCq1ZM8blQYvIjuSuA++A8r
 tYJrsj/p81iI3mUOgEwdQ9FIr9ds9SKnxGkMEt6kTEBH80PmGu9ZBvwHENOZwrnBPw36
 jpOBmB9fEC34jAyuxB+JA5HmEUM99y+upK35C6hJiLWaW+1v/hC7NBddOEgYVYDBUc0Z
 /chQ==
X-Gm-Message-State: AOJu0YztqzQ5lJgi2/BgmUd+XKfny6A6mv7p3IKxQp/Y3aEmX9/Mm6ql
 YmQ19pl7Lph4zLR6KbW3posorXqNFcnS4J9bYtVZHG+Yi8RSOpOMc2V8qycL
X-Gm-Gg: ASbGncv+bgrmcHsFmZM030kKE+0hcYnjtGbl3bLBcFONDtXb/JJDPTIXK8e/d7vncXq
 moHcw45515eJ4ystB4umYLTEK+b9OYlHhRPIEAZ5QMrwnpdBSoYY7wEOX0rBlSh/FFOQ5TLi5KP
 UjdbCm4cEx9cn587x2aK3cVRxZwmCxZrEMMG2xH4IRrvrvpGVJ/4G1QX6jyIfvd5axjY0klRn9L
 I++BMTJQnga2y/bZ3PWsLGkrAK7J+dzuQydzU+saZFaqFvrLSPjga/hgnx0xGJRamapS3LauIWb
 R0eMBXvbtuOEdC2kJFqJwPgjn44weTwzmD6CR/WZiTv7oqrK+d90cosliMl9eWwbK47fjNuVqxu
 5s8TCZ5DQ2Bzu+X6Gcyh4V84Mbad1lA==
X-Google-Smtp-Source: AGHT+IHHhzEkgd9XnIOk6RtraxVsfHScgOKGmi3w3XxUaDO7gHvQu1kGf542yPIVT3MyOrFQj6Frvw==
X-Received: by 2002:a05:6e02:258e:b0:3d9:6cb6:fa58 with SMTP id
 e9e14a558f8ab-3db6f7fd583mr7911025ab.17.1747163904400; 
 Tue, 13 May 2025 12:18:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa224e0ce4sm2254597173.38.2025.05.13.12.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 12:18:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 May 2025 13:18:22 -0600
Message-Id: <20250513191822.2112755-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747163904; x=1747768704; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6q4dVJcS0yiRvf7SjiKopcRLBMBkTh2SayZPJNZiAig=;
 b=Kvc0wRzwA8CBooVFBj9tQrK6n7U1b56RmVT5FLGPyEMTXxkuAIw6/9dhrvNmdarAYC
 Eg8ZiEpJDkWBXhEJEnBoDnl5VezuX0LwfZWgk7zbO6G4N5n85/zc462qCzTc8NZGSlI3
 /X2AKM6rktcA5pdyaRWWVtqdBxywF1lBROKV9wuUa4jaeF5QvKf6vjkJ39lENjw5o4fl
 INyqqNiqkcAyCycllxvM5N6efDZLLiOjZqBmg2qwTARx5mJpjz7EcDS87LKOaZeQN5fd
 QMvCbIU8NavcMXItz1/v+bZsTY2BBBMWJ7p7xFucDqEL5I4ooGQYrWQnAP47w4rkOm/2
 CM4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Kvc0wRzw
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: bump to version 3.6.3.1
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

Drop BR2_PACKAGE_MBEDTLS_COMPRESSION and all related references
as native zlib support has been entirely removed from mbedtls.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mbedtls/Config.in                | 12 ----------
 package/mbedtls/mbedtls.hash             |  4 ++--
 package/mbedtls/mbedtls.mk               | 28 +++++++-----------------
 package/shairport-sync/shairport-sync.mk |  3 ---
 package/uacme/uacme.mk                   |  3 ---
 5 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index abbe3356d8..21e746d842 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -17,18 +17,6 @@ config BR2_PACKAGE_MBEDTLS_PROGRAMS
 	  This option enables the installation and the build of
 	  mbed TLS companion programs.
 
-config BR2_PACKAGE_MBEDTLS_COMPRESSION
-	bool "enable compression support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable support for compression of the content data before it
-	  enters the secure channel as described in RFC 3749.
-
-	  Warning: TLS compression may make you vulnerable to the
-	  CRIME attack. You should not enable it unless you know for
-	  sure CRIME and similar attacks are not applicable to your
-	  particular situation.
-
 config BR2_PACKAGE_MBEDTLS_DTLS_SRTP
 	bool "enable DTLS-SRTP support"
 	help
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 6fc68ddac6..cc15958e3a 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.10:
-sha256  19e5b81fdac0fe22009b9e2bdcd52d7dcafbf62bc67fc59cf0a76b5b5540d149  mbedtls-2.28.10.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.3.1:
+sha256  243ed496d5f88a5b3791021be2800aac821b9a4cc16e7134aa413c58b4c20e0c  mbedtls-3.6.3.1.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index fd6682fbfd..563683e739 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.10
-MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
+MBEDTLS_VERSION = 3.6.3.1
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
@@ -22,9 +22,9 @@ MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 define MBEDTLS_ENABLE_THREADING
 	$(SED) "s://#define MBEDTLS_THREADING_C:#define MBEDTLS_THREADING_C:" \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 endef
 MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_THREADING
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -43,25 +43,13 @@ MBEDTLS_CONF_OPTS += \
 	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
-MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
-MBEDTLS_DEPENDENCIES += zlib
-define MBEDTLS_ENABLE_ZLIB
-	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
-		$(@D)/include/mbedtls/config.h
-endef
-MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_ZLIB
-else
-MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
-endif
-
 define MBEDTLS_DISABLE_ASM
 	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 endef
 
 # ARM in thumb mode breaks debugging with asm optimizations
@@ -76,7 +64,7 @@ endif
 ifeq ($(BR2_PACKAGE_MBEDTLS_DTLS_SRTP),y)
 define MBEDTLS_ENABLE_DTLS_SRTP
 	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 endef
 MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
 endif
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 4430014ec9..5d01ab042e 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -44,9 +44,6 @@ else
 SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
 SHAIRPORT_SYNC_CONF_LIBS += -lmbedx509 -lmbedcrypto
-ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
-SHAIRPORT_SYNC_CONF_LIBS += -lz
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index ec538cec12..9a2c972604 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -22,9 +22,6 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
-    UACME_LIBS += -lz
-endif
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
