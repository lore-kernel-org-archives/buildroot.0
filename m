Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EDFE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9944C4074B;
	Mon, 30 Dec 2024 11:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eberKlOcKXa6; Mon, 30 Dec 2024 11:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFCDA40749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFCDA40749;
	Mon, 30 Dec 2024 11:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C16CFCA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF0CB400C8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0jKB6_reQxE for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 304A040DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 304A040DD6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 304A040DD6
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:38:12 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aabfb33aff8so1583927866b.0
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558690; x=1736163490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuM3MqBttTdRu2T9SPNeFRmPASd+HvjMFA60K+GY1Xs=;
 b=ppPyHzXLHvnncOZTIEIvoRQMcXGjBW/zjSrIHekiddHNJtiKwqwklXLh9gpnn9EBwV
 zhEU/tsOgX3Alv6sfDfLOsnTum/UmLAlPEEicOCp2N3nziR8yqBLnhP1pv7oOSiD30uu
 8dpQYI9xXIr24kj7tj8lROLlik0L9uaLJj6z6aEdgzIXZrzsFjaqXLN4quOdArT7sM2e
 GML/Xrd8BcAIgYDdnvPwBH/NEDnOnbWglDtBvBbEqTnAPRmZ9hfWcDxopjWiDbTtX4Jq
 b/9eaYJnXdwRBrODOTEwvxDJChqJCIvvtEUdDlM22UXBdRmVcNMOVDF/cEJh36Ume+dM
 apTg==
X-Gm-Message-State: AOJu0YzYAQTtdd3BCk9j1i22qiaYlgtWHQAjK6LNGLlEW3GHUoV9AvDY
 0RsWHGy53xKNf66fYUTySaauFlKvvDZcoYzZg8ley5YkIqQgJ7er9TKIvg==
X-Gm-Gg: ASbGnctOJWzkC1OZlC7SQR7O6Hzb5DkLE+4F/6Qgr1kk3IagxTi6ck0aK4ZXaGR3Pmi
 GIzHOL03+fyZBJg5OR3vYReXTE7MBIc21cwYgpMRcnkRgn/LgGZbToIad7BVztobJX7heqFWJ27
 8lAyrCqSEWwkehbBweaIwhuB9/pO+J2xssPDdyVzAz1i5I5mbsXW6W/4hnqvlxKM7gwFDx1UX1m
 9J7AIPgMaG/2/YLBmolVlRxtvv283YP5DFiOXl/swNLxfSWe2wqkZ93EJkezZI3pB7Ct+Du
X-Google-Smtp-Source: AGHT+IFnrCVuCDUpsSgbydoCSxuDMZ9QyYRH+JzhwPOILdsOQuIaMjKV36O7uHZ4CCk6QR5oaEOGuA==
X-Received: by 2002:a17:907:97ce:b0:aab:73c2:a03 with SMTP id
 a640c23a62f3a-aac33500857mr2595275866b.8.1735558689508; 
 Mon, 30 Dec 2024 03:38:09 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:38:08 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:14 +0100
Message-Id: <20241230113710.679717-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230113710.679717-1-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558690; x=1736163490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cuM3MqBttTdRu2T9SPNeFRmPASd+HvjMFA60K+GY1Xs=;
 b=CpjTUmjlD/NnZE0/xFHoeYjE+oCwhjOfKcgbXDk7cdilGFVHgkVNQpiLlsGoAK4yoe
 zduuD+OfXPvrLWu3kJui8ml+d8Ps3WZoyh+wPrZLMK+eR+RRkRR5erBZwHWPi7qNd1OC
 Y7v0QbaqO0CEHMpsemS5j21JSoLuYhkrI/rCj1I1AZ1ZG+FnLX+wI4PKP5RsfA6KEEvu
 u5uCSta0mU7hAFaz1CEOV74GiiFWaKFtg0GWx3NsuLQhWmALBfUUFRO4jRGbZPATaBtX
 ECDphfg5CXv68takiI3iFxH0pVucCH5wB0a+iMrgv+rcNgVx7747iu6H5e5EfC7P9dMK
 wFOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CpjTUmjl
Subject: [Buildroot] [PATCH v3 4/6] package/netopeer2: bump to version 2.2.31
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

Add select for BR2_PACKAGE_LIBCURL since this is a requirement for
libnetconf2 to add TLS_SSH support.
Package configuration option to set ssh authorized keys format
and option to enable/disable calling syrepo setup script.
The utils/check-package script complained about the init script, so this
is fixed in advance.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v3: (after review comments from Thomas Pettazoni)
    - remove 'select BR2_PACKAGE_OPENSSL' since it is now required by
      libnetconf2 unconditionally
    - fix typo in help text for BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT
    - change SSH_AUTHORIZED_KEYS_FORMAT setting

 package/netopeer2/Config.in                     | 17 +++++++++++++++--
 .../{S52netopeer2 => S52netopeer2-server}       |  2 +-
 package/netopeer2/netopeer2.hash                |  2 +-
 package/netopeer2/netopeer2.mk                  | 13 ++++++++++---
 4 files changed, 27 insertions(+), 7 deletions(-)
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)

diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
index db31a786a1..dc7bd647eb 100644
--- a/package/netopeer2/Config.in
+++ b/package/netopeer2/Config.in
@@ -14,9 +14,9 @@ config BR2_PACKAGE_NETOPEER2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sysrepo
 	select BR2_PACKAGE_LIBNETCONF2
 	select BR2_PACKAGE_LIBSSH
-	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH
+	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH/TLS support
+	select BR2_PACKAGE_LIBCURL # For libnetconf2 to have SSH/TLS support
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS
 	select BR2_PACKAGE_SYSREPO
 	help
 	  Netopeer2 is a set of tools implementing network configuration
@@ -33,4 +33,17 @@ config BR2_PACKAGE_NETOPEER2_CLI
 	help
 	  Enable netopeer2 CLI.
 
+config BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT
+	string "ssh authorized keys format"
+	help
+	  sshd-like pattern (with '%h', '%u', '%U') for determining
+	  path to users SSH authorized_keys file
+
+config BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP
+	bool "sysrepo modules setup"
+	default y
+	help
+	  Install required sysrepo modules with their default
+	  configuration into sysrepo using a script
+
 endif
diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2-server
similarity index 92%
rename from package/netopeer2/S52netopeer2
rename to package/netopeer2/S52netopeer2-server
index cadd6b9feb..3fd993b578 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2-server
@@ -7,7 +7,7 @@ NETOPEER2_SERVER_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 6a278fbbaf..853696ae79 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d  netopeer2-2.1.49.tar.gz
+sha256  99c4827626852f9d4028330a79efa0b291580aceb0bfd8ae9aaf4ecea66ccc3b  netopeer2-2.2.31.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 47fcd31acd..5edb59efdb 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.49
+NETOPEER2_VERSION = 2.2.31
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
@@ -17,8 +17,15 @@ endif
 
 NETOPEER2_CONF_OPTS = \
 	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
+	-DSYSREPO_SETUP=$(if $(BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP),ON,OFF) \
 	-DENABLE_TESTS=OFF
 
+NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT = $(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT))
+ifneq ($(NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT),)
+NETOPEER2_CONF_OPTS += \
+	-DSSH_AUTHORIZED_KEYS_FORMAT="$(NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT)"
+endif
+
 # Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
 # files. This also ensures that concurrent parallel builds will not be
 # affected mutualy.
@@ -29,8 +36,8 @@ NETOPEER2_MAKE_ENV = \
 	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
 
 define NETOPEER2_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
-		$(TARGET_DIR)/etc/init.d/S52netopeer2
+	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2-server \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2-server
 endef
 
 # The host sysrepo used to install the netopeer2 modules will leave
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
