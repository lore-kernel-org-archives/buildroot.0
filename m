Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C3E77199
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB2316072C;
	Mon,  6 Jan 2025 13:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjLVm-3wW8gD; Mon,  6 Jan 2025 13:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A101D60779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A101D60779;
	Mon,  6 Jan 2025 13:42:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC326B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C7C0809E9
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMKIvFm0a0Zj for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D231980588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D231980588
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D231980588
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:47 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d8c1950da7so13481811a12.3
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170965; x=1736775765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lE/nzfFLdFx+jayeGTN6+Bg1E18cBAjZdIGhHUm3kA=;
 b=rOnZoeIEhDRHsxTFAOWhGsjUki2KC8lhzsQOWJN3Om+C5CygVNBhU89EWyEz0MaEgb
 xTiIVmwjiD88O/NIWe5VFLeIyDUDGKGVqq1h+f28KoqzDEHufeNfINiSFEyOHap9p8Pg
 IAlmOf9w/KJ9rkFpXdMPTcvD+NVnHNYdbN/9+pcaHuKD2Hz+kAo/7NVe8sdbBZ75eEEc
 Mbuo2xltQPQWEl2xKdoICAkPRUjGMaY68HznIbCE+dhpEzj9q8BGxbfamt14uCKb3aVx
 j2BsRYx+rJkCnIFCgKyJRSTLdf5lJzB0AUab36uQBjfnKPMoLLJmuZdS7DAYa3Owszbe
 N07A==
X-Gm-Message-State: AOJu0YzSHo6bQvnjiQ/19FUa80W4kvldl5ywY9d/A3ATVxhrHvNQJJVO
 2ab2towmzuEnLp7lH8pDP3+A+R9iKHlODoMD/voe4Csf4sfISWYs0HyNCg==
X-Gm-Gg: ASbGncsLoujR/gUWYDbXbFKQ3/QLgitB9u1OgnXd+KTXGKnrpg1TPzDPne6c5xwo5g1
 tJilXb/noFrYy133HrlCuQDEarF2yJRb0EDwIVweQxHUJXx/3RjBHtfoRsrONrGuZab2lrSh0dE
 EWgxB7Y5dmxaTJDx6dxHDJDPeKcBDHoKGgvfUZntlLJbmZtqCq6RDIQT64e7jkyQX+s4wiUKDev
 tEeQvGtQxwesyUox0p5v3VLH/27nRqOcoxLJ++OeTf78+Ww1FJXxcN8T+ys8NDmjFXcmiBCAA==
X-Google-Smtp-Source: AGHT+IHL+Xj00IuCCDOtMkb+uawWKCQhQA8D17SbiC+vS4pZn84GoPzwYoiZ4dZ5+Nurbr/Bcd3Nyg==
X-Received: by 2002:a17:907:3d86:b0:aa6:8e72:e50b with SMTP id
 a640c23a62f3a-aac3366a0c0mr6183918466b.56.1736170965209; 
 Mon, 06 Jan 2025 05:42:45 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:44 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:15 +0100
Message-Id: <20250106134219.1914954-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170965; x=1736775765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lE/nzfFLdFx+jayeGTN6+Bg1E18cBAjZdIGhHUm3kA=;
 b=I24kbacyJR63p0M9ag94t48Cb7P+Fcaf/8TYAuFrM3FQe7fXnB8es+0/ls5BhvYptM
 jt/WYVjU6siEovXZMKBWSPR636bJYhXevYPbpDnNJNbO0i7C6/CITp/tQPY96Iht22uE
 Lpxtty3y7ADjHouBh1gflvFycyWV7LL6LZZcdrw5elWLNBVBj2xT35a2rD1t4MwWT8rg
 Xsfwuk0nyttTSNkUPxqmnPEj2uo+jdKQN7pAXzhb18ei3ZBgblw7bgJsY7ij2LELEugK
 G+ZiqTP+5ro+WdIeX8xuoL52PPB6VFViGA8WLVDeeOUViv3rCyZmXUFU97gHoYlVcBXH
 RTDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I24kbacy
Subject: [Buildroot] [PATCH v4 3/9] package/libnetconf2: bump to version
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
v4:
    - revert changes that are related to libcrypt dependency check as
      mentioned by Thomas Petazzoni
v3:
    - no changes

v2: (after review comments from Thomas Petazzoni)
    - reworded the commit message
    - added selection of openssol package in Config.in
    - fixed inconsistency in dependency to openssl

 package/libnetconf2/Config.in        |  1 +
 package/libnetconf2/libnetconf2.hash |  2 +-
 package/libnetconf2/libnetconf2.mk   | 22 +++++++---------------
 3 files changed, 9 insertions(+), 16 deletions(-)

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
index 88163926c0..930c5e57ab 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,30 +4,23 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.28
+LIBNETCONF2_VERSION = 3.5.1
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
 LIBNETCONF2_LICENSE_FILES = LICENSE
-LIBNETCONF2_DEPENDENCIES = libyang
+LIBNETCONF2_DEPENDENCIES = libyang openssl
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
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
@@ -37,8 +30,7 @@ endif
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
