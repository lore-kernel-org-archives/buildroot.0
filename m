Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECF3C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B7860E90;
	Tue, 14 Jan 2025 07:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDJhim1naQmg; Tue, 14 Jan 2025 07:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F27960F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F27960F15;
	Tue, 14 Jan 2025 07:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C3DB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DB8060E90
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRVOBP1Hgyja for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36D6560F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D6560F7C
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D6560F7C
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:38 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso2541459a12.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839835; x=1737444635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xc5mm1NTi4xtKBnH9ugguoLo6vO3s0QioD/GrERstPM=;
 b=EUgClzrbrTHK38SiL1vV9xh5ccaZ+dd6xPlJIxyehrEpETo3bDMuY5/nhIqDD4KfIa
 ksE9aaGuU2xI2lxTh+OROBhiEvN2+5HPgsFTolgMqjqFm+giRl3IWFgLr20uMVNQJcgF
 PEFo/f9FuBCN7hOTEgIZxJG8wVnpVVU16tGkxuaKg6nZqi3xC085kq1CBzIgxpkqHLtb
 j/eSJdKGw/52A8HOcwuh1RN0aePQI10iax4TQ1ynr9GFAnrfR3Xa55enrD4tWGM7Z4oO
 ezm3TbtcFGG0t+YYA7CHpGizC3Ov3NC5yf3Oc+8yQ+L+PdkVWA6gRUhNJ86kRcILnbyA
 LhWg==
X-Gm-Message-State: AOJu0YwbOCY+LyktvyQgKc9+ZVeGYI7FdZVfhkaR2QeuWMMgEapVee9T
 dA338DN+jeP9zsSqwqvK56kk6XYGUvk5KhUKgD6A9Cc95AlLNKKYN+H6wg==
X-Gm-Gg: ASbGncsow4yJ1OosUVKNtDopG4iCxHmDImiYmas5EZQhstuTXKhlrOj0ySWO/dLu/42
 wnc+UcNFzQiC1ShwMjkQ6D50Z8tH6vRyGyrtOeR5T/tX3taqLpzj2NoUJTCSsuElNlr6QRif71J
 CBK7c/UnSYUM9Nm01XK++IBZw4gG/+t5KfLiYgyqSlFpo+EGupLTGYsYFBpOchMwuCCXNc0vl+T
 rA/YuqV5B6PA6+YyzrniS8VKBm9ERGBPM0ElPSwQe9feyQ06L+iEYYpG3OGrO+q4E9Sk09Fbw==
X-Google-Smtp-Source: AGHT+IEACjJL+1LNov68igb3gOwaLRJiRzWr4r8WM5goeVYho++HPScX0IA6aZtJXXB72NqJ0Br7Kw==
X-Received: by 2002:a05:6402:240f:b0:5d3:d79a:6d6d with SMTP id
 4fb4d7f45d1cf-5d985981c40mr17465916a12.0.1736839835586; 
 Mon, 13 Jan 2025 23:30:35 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:34 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:52 +0100
Message-Id: <20250114072947.284965-7-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839835; x=1737444635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xc5mm1NTi4xtKBnH9ugguoLo6vO3s0QioD/GrERstPM=;
 b=hBgSepRrKWmYExsv93S6LBT8G7Drf6xt8MM8wtrmjbhzsMmhaxjN//jMw8FT85NVBy
 wAWhk81gHrR/surG7y3LoafIrGFuhY8gbCZy9N/I+oQEZOeUv7eIi4Oac8UMWG1RIbqA
 /TdrSM8uKXbYdybyruIpV32PN4ZhZfNnKXPN3u5yesmiASzidsDEUFfoacj7MyfWOXBx
 mnf/rOPpxeCKjysnrTTT/C6Fh6xosdrjLTDmKPXts40jNAZ9ud2U9bXo6xB9EdxpEiUa
 bTMIZxA3zs0XHTpk+v1m5PUVPCToiuluc0uBhgvDHGjwa0jJ8ZdLs68oC7T1rqVC31Lg
 9UVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hBgSepRr
Subject: [Buildroot] [PATCH v5 6/9] package/netopeer2: bump version to 2.2.35
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

v5:
    - meanwhile project version updated to 2.2.35

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
index 6a278fbbaf..f6a3741cdf 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d  netopeer2-2.1.49.tar.gz
+sha256  f3e43362b7cfecdec52cb5d1f3cc06c61070857fc304779400ea9f12c6e8c5ae  netopeer2-2.2.35.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 4853e5d176..6163c169cd 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.49
+NETOPEER2_VERSION = 2.2.35
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
