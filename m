Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAABE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 15:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C720642592;
	Thu, 19 Dec 2024 15:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZuLbU4cdjLp; Thu, 19 Dec 2024 15:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EACC4256B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EACC4256B;
	Thu, 19 Dec 2024 15:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EC64730
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0224028D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFDpvg69p5do for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 15:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22705400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22705400DA
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22705400DA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so1362951a12.3
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734621709; x=1735226509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6BE6NKZAQNxHuvbmhd7URr1TQep41g87+IzJ7WgQAU=;
 b=drUA2Ds+ECorlQp7gB7laO3s1rUBOxJWk1Tp/4cmpGXKsJneAsLPISC1+q9Q+e9Ypk
 XrF7BuOh9fr4LZb3OxNw1rUcpgp8leA0cVPI/D6n9+vF5IugB/V7ghDOehK/PxXMFbTI
 mAVFrtz7xCQhTzrvdwn+17ZXQ1io41jY7iECBNGFvFybLDNGGxPURHXfneun+gVEBUpq
 XUaAh0fHyNib1f9u72JXj0AOXvB3BHXLrXTxFVmxJfjDkKw754B31t/1hUZB///FlZW2
 n3hL0TugwPjND+rKT+zY27YUT4TAeOsAnrAdTwuVDKp0vE4sXibJFDAczDkyUev5BFXw
 iN7g==
X-Gm-Message-State: AOJu0YwyBst+djtzUxy6tCjdykGFJYGK1xPYLolNqJyIgSABnDySgNWs
 9qjUkXQ+8+lfVcQH0rFZg9Z7T42sR4XnC8pQcbdBYf6DQtmX+KvYo4X2rQ==
X-Gm-Gg: ASbGncuNJFTRP61CHlU1jAPMbzBdiv4UuCMN7VtGrVyHWlZBU4ONBCmMQB16+bYNCxl
 wV+R1za1Uuy/iZReztC4gURCeoD07p2p9LyeKLbNoo5855rWOgVYWyt/E8tT944Qyar1WzC92gT
 MB+K0bYHiMBK8avlhcg0up8N6jl2JV/0WTGT5BI9kvVTF3d/gyGyLpecd8nqky3x8NdycpmaOcX
 HFu8BWPPwJb2YCZx+dTky6v3tw2IWDOr4nXOzoNche7cTcsylBoaqkV2xM6VgCwwYWlqG3b1w==
X-Google-Smtp-Source: AGHT+IEnpGchilABxyInPPOt8xdcRw9mOvBbfyA2Z3ZmjkuIjThE49n4SwhpOj7k2X50jxZiS3KDXQ==
X-Received: by 2002:a17:906:b35a:b0:aab:f8e8:53b9 with SMTP id
 a640c23a62f3a-aabf8e8573bmr618054066b.58.1734621708903; 
 Thu, 19 Dec 2024 07:21:48 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f070a7bsm75504166b.201.2024.12.19.07.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:21:48 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 19 Dec 2024 16:21:07 +0100
Message-Id: <20241219152105.298310-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219152105.298310-1-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734621709; x=1735226509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6BE6NKZAQNxHuvbmhd7URr1TQep41g87+IzJ7WgQAU=;
 b=MHJxfSqnKCnEe/o+xN6JljimxHjl0YtIqVdFzgTCy78BWLk/lmu9bDtX3Xsfi5yWMl
 056t0jr0HKe6kuwIalTzD4BTiveUESvNBoFWh4WJxBc62AtfuZ17+Gz0mqrBmR2nkZAR
 ViXWAhECIQXv5bg/EdzMS8n3SgF74R0qR3l/5oWAbi5usQeNmCVMvoRMWNKA2XDh+ivU
 RtcE0NhRAWZiyoDogvrOh8gg0RxtNGBKszVi13fF/vyugRPdrYwLBccR3WDSKJ+snnGJ
 RdnsLWiztgEiHgIo+ri6/tzRb1eDQImk2c4/ukiPUYrYI2kSiTXApzuz91da/ZhnMrmu
 17KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MHJxfSqn
Subject: [Buildroot] [PATCH 4/6] package/netopeer2: bump to version 2.2.31
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
