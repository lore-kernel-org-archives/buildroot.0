Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF99E7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DDB60AE6;
	Mon, 30 Dec 2024 10:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiIplaxv7CjP; Mon, 30 Dec 2024 10:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AB760AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4AB760AF3;
	Mon, 30 Dec 2024 10:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B31968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31A3240EA5
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6C2PxPtWmPi for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4DD840E9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4DD840E9F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4DD840E9F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:36:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso1496949566b.2
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554969; x=1736159769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6BE6NKZAQNxHuvbmhd7URr1TQep41g87+IzJ7WgQAU=;
 b=kS9PYBKTUjs6XrSJbgb5mfXuLxF6jIa32BAxatiF0ZTfWwnk6hHTl/b2KiGYA+56gD
 mnMblnSBjoLgGETzeufe13c86chv/7Rll33LvzkT2R8L1eM2NnsRgjQY9g1N262B/XKf
 lx5dx8KST/pBpsmJvS5Psaq9+8Jd++gvpV8xhMQCZXz+iNZXeH0S8oNP3pCpesXa8jwR
 AwkwvbnFcOzGksGHEAr1TSlFmD+1a14bggCl9NKQLb0I9/LdWJCv6UdrUq/foiS15+2c
 7oRKUhqDYfEvZyYYJgJYovoJ2qvGTlyHd1oNI/IthrL177VssL797LY3WYBtRsczcryi
 sxhA==
X-Gm-Message-State: AOJu0YwvaB0OXo3UY2/x9ur1qu3WGgTIhnH0ByT012SpfMTy9rJ3YuHn
 f7n73Us6mX0Nod8wUjw+6JOytkhCaZDnMhKrRGd1B2AS3IHOQAYQIDP3cg==
X-Gm-Gg: ASbGncsE8LYGw2YYGaVn/QCpV78w9PrFzQBkz/jwkrzfQlFnJcrjiLvrAyY6ueg/Wzj
 /HUs7+kAlch7nr5USUMdFRB53AzirbQy1NTN48ZGpGq68SE4ds8j63qE8ieh7frzDIcai2nrxkL
 MY4bpUMmVm0UwuEHpiBzmLaW1EbbvInH0jb7iYALWjgpGj/LKqqeg1G+hSN74QMe28OLXxOgeWa
 GK5rkRLSfIppTGEQQnWGVWKqMI0dRx7idZWw/qIcymmuPCO2mkD1ZYisVqSnGzUhYguH1EG
X-Google-Smtp-Source: AGHT+IGwPfoBf8hqaVxHV1Dl/4dE4WPZNesy6EhAnQwGhCKvl8QpHTVKZDF+xZ7pUQlliNiyexXs4A==
X-Received: by 2002:a17:906:d54f:b0:aac:622:8f6 with SMTP id
 a640c23a62f3a-aac3342d0c5mr2851471066b.17.1735554968297; 
 Mon, 30 Dec 2024 02:36:08 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89617bsm1437781766b.76.2024.12.30.02.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:36:07 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 11:35:36 +0100
Message-Id: <20241230103534.671602-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230103534.671602-1-heiko.thiery@gmail.com>
References: <20241230103534.671602-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554969; x=1736159769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6BE6NKZAQNxHuvbmhd7URr1TQep41g87+IzJ7WgQAU=;
 b=h9byeNUTXe+lEVEMBzvsCl752PYejroadByTvRTqYUkm6rzpis+CJzPxoC4txjUh/n
 FNkyU2oupApXk8QlbQyll3g3tPdmmMnLiidQiyHkFGXyoJuhbDK2RoqIWNfnsILbwok3
 jVJ5X31rXrEhqDjzfYcTUf0uwcHKOh6YqsBhM14ZkK5QyG/KOV2odtRZRc9Ez/wsGgaL
 5Myd3TOLmRE0PioSGXsAxn7EQILzEJ7xufeBIIXmRxFFwra/Oeayfs4RFgRpqjIK7mj9
 MHUPUm5emSTjrWAQYXlJsBclVdIzVT97s2uLyoHC+4Sbr0XByeVi7ffcZW5tD+CcIjiO
 pxGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h9byeNUT
Subject: [Buildroot] [PATCH v2 4/6] package/netopeer2: bump to version 2.2.31
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
 package/netopeer2/Config.in                   | 20 +++++++++++++++++--
 .../{S52netopeer2 => S52netopeer2-server}     |  2 +-
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                | 12 ++++++++---
 4 files changed, 29 insertions(+), 7 deletions(-)
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)

diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
index db31a786a1..5adff14ac7 100644
--- a/package/netopeer2/Config.in
+++ b/package/netopeer2/Config.in
@@ -14,9 +14,10 @@ config BR2_PACKAGE_NETOPEER2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sysrepo
 	select BR2_PACKAGE_LIBNETCONF2
 	select BR2_PACKAGE_LIBSSH
-	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH
+	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH/TLS support
+	select BR2_PACKAGE_LIBCURL # For libnetconf2 to have SSH/TLS support
+	select BR2_PACKAGE_OPENSSL # For libnetconf2 to have SSH/TLS support
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS
 	select BR2_PACKAGE_SYSREPO
 	help
 	  Netopeer2 is a set of tools implementing network configuration
@@ -33,4 +34,19 @@ config BR2_PACKAGE_NETOPEER2_CLI
 	help
 	  Enable netopeer2 CLI.
 
+config BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT
+	string "ssh authorized keys format"
+	help
+	  Enable netopeer2 CLI.
+	  sshd-like pattern (with '%h', '%u', '%U') for determining
+	  path to users SSH authorized_keys file
+
+config BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP
+	bool "sysrepo modules setup"
+	default y
+	help
+	  Install sysrepo modules
+	  Install required modules with their default configuration
+	  into sysrepo using a script
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
index 47fcd31acd..125451587a 100644
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
@@ -17,8 +17,14 @@ endif
 
 NETOPEER2_CONF_OPTS = \
 	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
+	-DSYSREPO_SETUP=$(if $(BR2_PACKAGE_NETOPEER2_SYSREPO_SETUP),ON,OFF) \
 	-DENABLE_TESTS=OFF
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT)),)
+NETOPEER2_CONF_OPTS += \
+	-DSSH_AUTHORIZED_KEYS_FORMAT=$(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT))
+endif
+
 # Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
 # files. This also ensures that concurrent parallel builds will not be
 # affected mutualy.
@@ -29,8 +35,8 @@ NETOPEER2_MAKE_ENV = \
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
