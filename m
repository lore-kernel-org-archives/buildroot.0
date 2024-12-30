Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C619E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CB660AF4;
	Mon, 30 Dec 2024 10:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMZoo2Kz26jj; Mon, 30 Dec 2024 10:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0AA60AF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0AA60AF5;
	Mon, 30 Dec 2024 10:36:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E2ACA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CD28407D7
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30L7WhgE5Wuj for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F9B1407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F9B1407CA
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F9B1407CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so554776266b.3
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554959; x=1736159759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObOcCsrXw45FLpRvRW2hIrbo4OakPvj8HrIj6fpWx28=;
 b=lE2KBDLEoweUfaAuoKg6v6C0JYTyYqZQuOuWGt1/VQYpAQBzr8ayjrPXNOUvLzSEeI
 FcVia08QfoW+HcAsiwqXjaS8OuZEwTXqKPr4BAeNoDbjthDzq3Micf20RDph/WoepXZ3
 OMWJJ2mQRMY/WnNb4jyswrZhpXSk5bG+hLFEFdFPSVC11oxTK3Ea+BOtnV3PzlTlaQiq
 10Xsjxotr06RrWXUoXuPjTq7aoiwdj+7Epc7loXYlLk6FqByX6xRfYaTAs/uGoeia6K0
 bT2eXaVBtzlZbjLC45+LVdWonFRfxx7YxvDlhPAofBWJJiU1E2NJTtysfWT6d1dKkqeh
 oJUw==
X-Gm-Message-State: AOJu0YzrKrs7kLrOvW2EFN2uDoHvm/s+sOVXca43GJulOdNj4PHgnte7
 yoK8nKHKvgDxpywuim1lb2cKDrpKQ80M5GYYbPBw0hXpXEHuDm3DxyCMBw==
X-Gm-Gg: ASbGncsA/FxL+ZDUViqArjKlW1geR0YLzPsGMVeEzIVvUhGZW003LtmeVjnPGOKKums
 gyp9rEwQzynL793475Md9NlH9v+PJsxX4x5G0fE1+DjVWY/9SOfLEqVXPixYYGk6ZJGZ9yfKUDJ
 ve0QTHtNW/flmpDDy2o1BeyT2IkNC6dvxC6Ikx/0L2TDbQjgUXB5KXvhtq14eEklMOTqkkfTE7D
 MR4K5+pptMjDbfubMZPEudAXwQlPHFUeKL96qEfnDXohDGCb6ebAphb7PwFvC7FiDevfmFL
X-Google-Smtp-Source: AGHT+IGHC3FId0R/e5Enh0w4Ad/u6Q/hdDGrr7Ybt5EJat6LRd+h7mVN8fLi6D3MBuYpRz4TdcYpWA==
X-Received: by 2002:a17:906:fd87:b0:aae:bd4c:2683 with SMTP id
 a640c23a62f3a-aaebd4c2951mr2615620466b.49.1735554959397; 
 Mon, 30 Dec 2024 02:35:59 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89617bsm1437781766b.76.2024.12.30.02.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:35:58 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 11:35:33 +0100
Message-Id: <20241230103534.671602-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230103534.671602-1-heiko.thiery@gmail.com>
References: <20241230103534.671602-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554959; x=1736159759; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObOcCsrXw45FLpRvRW2hIrbo4OakPvj8HrIj6fpWx28=;
 b=GrSFmc1U3UQiCdo6KHbnHiOT7wP6bbsRjiFQP0MTiaz2qCnmbV0ko04dlqnXLJOaOK
 TM/r0oRMf0IX5edIH/V4ph+FCPonMu7nfAOwU5n9YCiFLNuo3TJYIie2aZ/iK8J9aB7X
 I7lra7pXtzVm8PBcpcvRdjyItDRVS8lwxEM+7a4k9uF9eda320Eqpc8mhjIlu85MenjE
 WSdwM7uqQsgQd4TN8dzEw5N6TgjHlCfR8cb3Xypct5OcCW816hTgJA7KqL6Lm0lg2+mU
 Yocj+DZP3OwcSlTogUtCi9rtaSI9ouyKMoPpAh8YYn4+7SAIBfc07oTSsoDP3rbYRwWN
 OutA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GrSFmc1U
Subject: [Buildroot] [PATCH v2 2/6] package/libnetconf2: bump to version
 3.5.1
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

Since version 3.x the cmake configuration options for ENABLE_TLS and
ENABLE_SSH are refactored and are replaced by ENABLE_SSH_TLS.

The ENABLE_SSH_TLS option can only be selected when BR2_PACKAGE_LIBSSH_SERVER
and BR2_PACKAGE_LIBCURL are available.

In addition, the dependency on openssl is now necessary.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2: (after review comments from Thomas Pettazoni)
    - reworded the commit message
    - added selection of openssol package in Config.in
    - fixed inconsistency in dependency to openssl

 package/libnetconf2/Config.in        |  1 +
 package/libnetconf2/libnetconf2.hash |  2 +-
 package/libnetconf2/libnetconf2.mk   | 26 +++++++-------------------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 1763243120..8f8677db62 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNETCONF2
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_OPENSSL
 	help
 	  libnetconf2 is a NETCONF library in C intended for building
 	  NETCONF clients and servers.
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 675c76a500..78fc5c8400 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
+sha256  0d49e796798015e35a08bfbd53a3dd4004cb9a26d4b1dd1f90940a427d483bbb  libnetconf2-3.5.1.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 88163926c0..85e4c2fbfd 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,41 +4,29 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.28
+LIBNETCONF2_VERSION = 3.5.1
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
 LIBNETCONF2_LICENSE_FILES = LICENSE
-LIBNETCONF2_DEPENDENCIES = libyang
+LIBNETCONF2_DEPENDENCIES = libyang libxcrypt openssl
 HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
 
 LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
-ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
-LIBNETCONF2_DEPENDENCIES += libssh
+ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBCURL),yy)
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
+LIBNETCONF2_DEPENDENCIES += libssh libcurl
 else
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
-LIBNETCONF2_DEPENDENCIES += openssl
-else
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-LIBNETCONF2_DEPENDENCIES += libxcrypt
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
 endif
 
 HOST_LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
-	-DENABLE_SSH=OFF \
-	-DENABLE_TLS=OFF
+	-DENABLE_TLS_SSH=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
