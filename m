Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEB8E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10331407B2;
	Mon, 30 Dec 2024 11:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbI1B_DSXVsq; Mon, 30 Dec 2024 11:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41CA407BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41CA407BE;
	Mon, 30 Dec 2024 11:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83047C8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D7D407BE
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64A-QssB5S6K for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30685407B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30685407B2
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30685407B2
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so12015507a12.1
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558649; x=1736163449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqiagKCTMH5fxWYy6qzYiEoEIlfB4fV/uPzRDJ0+h+M=;
 b=vRZCADe4TYMtX5auFpGVZJHsx4nO8iC5HNM2syrpDDxEEeNOl/+hIbLbdQUq7IQ8dT
 YpsPAk+dKQgVPJw1cccGxuKvu5mdCFPmhKQ594QVsmnuYFZm+amVlzCkL4zzPmOK84Uo
 EJCxdb2uYtk/ilyEg3m6jH+9Ui78MMddAEYtQHLhcyY15GZ3c1HZThj4BeZyFXssTz/M
 3AQnfSkzPYpYxnFdOmZkn4cuZEcaIK5bHVieR68RSijmfCkFYGFF1b/b8DL9AejoanyM
 KGhitX7tHtJZcLUokiLF34BZmZnjNSqJbX+T9BJmGoPp1r4N8XVBc88ur6/7aKS9mIzO
 oqfA==
X-Gm-Message-State: AOJu0Ywa+cq+P+vVjLuLZVprTj591oeZFYlWVm0QDyARm4VgeMrRZ/c/
 NImQ96ToA9VPn37NSnx76EPBngg6IY04iOPzxD5W6f1mK1JBqunKYZ2eDw==
X-Gm-Gg: ASbGncuqv/n2/ZlPNz+RfXMf7hk0DPLbs/amD/YFdoJyGUqOFRm7qJH4Op6IqAMyAAM
 pgPFRBfZSJFWsYjY+0/06Q1pJV1ZYrBA1m7/lEBjsd74GnBEbyvHDs8L8mebwcO28kUm/K+TKgf
 Xmkh0SGqdQfPnStAp9gh2I/80cjMunpuy8lNrxSvHWIektVTch2dCtgeMnFtkm6jgcFZGgk/8Im
 1750gGB3sdctgLS4GljekZGjt4jT1ObmgG2MrVc26VUU7gaqIkk2XpoSnOJU1RL+AwbjmBP
X-Google-Smtp-Source: AGHT+IHPO26zdNmR8XKNTIxamxF7K5CK41rjl4KRfpf4epu5TNRrM0iqBP6AB4IdwbdD2LNBIvy9Ng==
X-Received: by 2002:a05:6402:2344:b0:5d0:e410:468b with SMTP id
 4fb4d7f45d1cf-5d81dd64032mr28542659a12.2.1735558648702; 
 Mon, 30 Dec 2024 03:37:28 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:37:28 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:09 +0100
Message-Id: <20241230113710.679717-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230113710.679717-1-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558649; x=1736163449; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqiagKCTMH5fxWYy6qzYiEoEIlfB4fV/uPzRDJ0+h+M=;
 b=cn4gFGfpzf564/CO/vEg+4jF7RQY9vjmMSMXXMzuY1p/ZvJWEqoaNwGOcYqlJrszSl
 ftEiC4+OsvwLZbhL/+/E1VFC6nd8SU3fOwRK+uNdZYvZiAFzNNTvqH8h5nPcu0kbuGm1
 KMyJ6zhEnSKFC9SrZEFf9Hn8G0FYnOToPGXyPFvbSujNKqxDIVzCNxyPIFysgZS1MgQR
 0KUChgbykcXnbeqer6jWEnDhR1/yOY/WGT9yjw/7hUZiCM53qhEQa+xAZiycwIX1iur9
 u2zxz22TC6YJ0SMtZOrkdaJ2GGiOttju1I79G9WB5I9MjbeS9VJLiyM+k4vqcO/uk+A1
 jApw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cn4gFGfp
Subject: [Buildroot] [PATCH v3 2/6] package/libnetconf2: bump to version
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
ENABLE_SSH are refactored. Therefore the options are replaced by
ENABLE_SSH_TLS. In addition, the dependency on openssl is now necessary.

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
