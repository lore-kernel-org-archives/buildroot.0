Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541A9E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB4A8117B;
	Mon,  6 Jan 2025 13:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXyRxg4ged1w; Mon,  6 Jan 2025 13:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 952DE8100F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 952DE8100F;
	Mon,  6 Jan 2025 13:43:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A90DF1F
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54123607AC
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Gv9cQcbMXOa for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 087A2607BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 087A2607BB
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 087A2607BB
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so67676466b.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170971; x=1736775771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PfeKCAarBpzoqdwmc1tqZTqVl8UkTIlXvR9OHQ1S+zk=;
 b=d9a6zjMWxYAZkA+IMoo76k1W/CaW0lOEi8+TMQl6scsYCHnnQjx/o/o7EPsOYzkiR+
 wZy4Ku/n6BLfp01barqc1ifxvO/X5NU8Qu1qb38xRP6p0vDSpJ9Zkei/wSD6cOJxJM9V
 6ClFG08jXAqrTWNZcg9c7oEaXKkr6NkzHQ9PpFetP0vdwqLplpvYXtv9FKtGggDuBwds
 O4TW88zM+r0kAE9cMw2BtFUGe3J8ZAZhP451XqbIKkwDZ0UwCQ7e4mAuHH7Fx4srauMS
 StpXXIBmYGCK7ZzfXf1s+L5yIdV5ZtLwkNHuvvKN50VgiOMWkaKk9UUlpJZ9VEOK2Ybq
 Z7Sw==
X-Gm-Message-State: AOJu0Yx9SVu+0Y0p+LnTJI5ErPpFm8BcTd/mUatLaotHBfRgAAlhMMU/
 VeDUuWHyevUNBO1j6qX1NzpIyPdyuaFmQjS/Sxy6C1UlFrjkMhb2VV474A==
X-Gm-Gg: ASbGnctCwMgRcWRXGCco6V6ogLjPY/QGdNgFZnRVBea1POfAqgQCMATmhWHgwWPuktc
 Fi6GSffhSv82DF0+BlLUADOKh5ZPKuCGZhnW72XnVg4atgAV8ZyURAd3QN9tkJ2kmTDpeEnAzMh
 tc1s3lYGtAnhnNdvzUIdm89t1u+4PS2i5JqCBRn3WqLfs+EU9DD9E0nGjMuBGwOWmAX0TaerL/g
 tvS/okBNBWg5WfTEXXYcpCDDdY2Gx8RGUwUFhxk0ia0pgJuQ9L4nPdFkY3lJQmH4bYcyR2HRA==
X-Google-Smtp-Source: AGHT+IGHrHELXJ95mrIAaV2rp0ICkqqw6GlRjSI5Lqd+T0Lb5xhC0uaKQFyJKA8kTVcJgHwDKeGjTQ==
X-Received: by 2002:a17:907:60d2:b0:aa6:7933:8b26 with SMTP id
 a640c23a62f3a-aac27028437mr4803426166b.9.1736170970650; 
 Mon, 06 Jan 2025 05:42:50 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:49 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:19 +0100
Message-Id: <20250106134219.1914954-8-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170971; x=1736775771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfeKCAarBpzoqdwmc1tqZTqVl8UkTIlXvR9OHQ1S+zk=;
 b=ZxyfYU9/J5H8heLq67hQLtEYX6ewvi2LpE3Gv1Q1e1zIJLCRKJRloU1rQ+FgH9hnC8
 Ix/2DoQD+6dN7PAS7WtYYYx8Rc8zeKLRiaYf16auo7Js+5FJ5iVVlf5Ws4cCwVaAMTMI
 ONOVPPFGPcr5uOAvb493kXesbbyxek7c/Rwkfdz2+t6zo9VQ+A4rD1QAgkBYOvVHawN+
 wAZVdK5Rqw0Iw/sPU0QcrS+h1e99I0rWf6g6tE4HRb23q9ETd5AaINCBS1gWEUiHpmCm
 OnzZQKWPcTjyOhv45yWU6jt33EwBDfqO0g6q0GF5ZRaYF5EOjaT1CmhHJw5qgmU1ZlvI
 dgRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZxyfYU9/
Subject: [Buildroot] [PATCH v4 7/9] package/netopeer2: bump to version 2.2.31
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
libnetconf2 to add TLS_SSH support. New options to set the ssh
authorized keys format and to enable/disable calling the syrepo setup
script are added.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v3: (after review comments from Thomas Pettazoni)
    - remove 'select BR2_PACKAGE_OPENSSL' since it is now required by
      libnetconf2 unconditionally
    - fix typo in help text for BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT
    - change SSH_AUTHORIZED_KEYS_FORMAT setting

 package/netopeer2/Config.in      | 17 +++++++++++++++--
 package/netopeer2/netopeer2.hash |  2 +-
 package/netopeer2/netopeer2.mk   |  9 ++++++++-
 3 files changed, 24 insertions(+), 4 deletions(-)

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
index 4853e5d176..23308cf131 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
