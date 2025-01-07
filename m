Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1AE77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 09:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22762403B6;
	Tue,  7 Jan 2025 09:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRROBcW9WL0c; Tue,  7 Jan 2025 09:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47725403F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47725403F8;
	Tue,  7 Jan 2025 09:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D56FF7AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2B01403C0
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6-iTiXCgGI8 for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 09:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52C7E403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C7E403F0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52C7E403F0
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:39:29 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30227ccf803so172420311fa.2
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 01:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736242766; x=1736847566;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvste3WZjju4XuyUHIDt8ysGN7jlvGZp5iRAgwjuSzU=;
 b=SLOwZvsNjBtotaoI9uPmYihygIcig1shAJh0tlNNzw0Uhc1QjzEPe3o87DTPzMOSDV
 KzHzPLuiKqzysbxS79OlcMekU9CwtZnD0muVgseizo9c/40siFPo+Y4fSGyBQdpvqsgp
 +WevDsrd8aLMSKkBmanPi0NQebbXsWmV192BplYpPMr7WsevOz/NADLI/c8LjFrdmj46
 4So1Ge1VBBwkih2IyM1Fu7CAHulTYPXwwtN1/YyYx7wwZqmwv2VZare9lANYwHoPNvWD
 IglUQCKMwi1dqdVHEzZbTewWpAft6pZgnKwFrsYK4Mh48fzME9nD4TLVGE3cRAT/Z+Fl
 gQPA==
X-Gm-Message-State: AOJu0Yz5LXxaE8qEPJcDXw/RMnxsr5NJboKmjhw9EHnPp9igD/6KV+pw
 BOgb71leBzTm+buy8XkiZcR+qSXbpxs6ftHyMLbUFuaBFQdofboRZYt9GbNJ
X-Gm-Gg: ASbGnct2JdxT4VMvhCOK3GDKiIkynbgBMQFwC4uIsm91EcgzDxqR/VfJeXSwbJMtmZi
 RMJMfKKf15fOtyOrSOUp9cSdNMjw6yXQbAx/MLg02/2Bex+b/LIqw6wDmFZh+mMjl2I/qMg/Vxh
 GTv5rp7Oix9v5qKrmCvfqN3DAJ7ODP0LK7cGTfsZ3xacylPYzT6ME0+vPMk0Lew9Ehche+DTFhe
 JwKfnpmB+JVLQLwhPFUq1qMcEDfluUrh9k=
X-Google-Smtp-Source: AGHT+IF/+OltXhlsF0NfGBR/UfurfRanxsalIxZX5hCsbmMPKTp9o8JHyTFHXx2VucEN+Cdh+yAMPg==
X-Received: by 2002:a05:651c:1a0b:b0:302:1cdd:73c6 with SMTP id
 38308e7fff4ca-3046856e604mr183612681fa.20.1736242766261; 
 Tue, 07 Jan 2025 01:39:26 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b069e8csm58786521fa.74.2025.01.07.01.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:39:24 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Tue,  7 Jan 2025 10:39:17 +0100
Message-ID: <20250107093917.3217670-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107093917.3217670-1-troglobit@gmail.com>
References: <20250107093917.3217670-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736242766; x=1736847566; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zvste3WZjju4XuyUHIDt8ysGN7jlvGZp5iRAgwjuSzU=;
 b=LbY7s01DMR5DQBFDL5Go+nQ8MIs7ZxBv1VJ1D+nKqClxjAm6LCZfuT1Ptqn8EMmhOr
 oaKbCKkmI3p51yKH8D5OK8ZXR0H9WXGDYl7GrH24SqZsjZ1p13jI1ZM/BwI6+0UBMcWJ
 43AT2zFDOJuxAzDqdxUZd4FFbftTWj+U4jZg/gyj3HBbex8Jl39GL9WceyWBoijaMY0/
 3hTM2wHv2QEvuh+QXtVG6UYtQ16dl/TpQjbGfMa99g+Ef7ocx9quK9ziSOu3P2PVdxID
 Y4EAm734jbpQCDQGiT2eBWxRqnFlwsXFRtunnBcnqG9aYMWkZzGtk4Jqb0RR0x3FhtNf
 /qcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LbY7s01D
Subject: [Buildroot] [PATCH 1/1] package/lowdown: new package
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

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/lowdown/Config.in    | 14 ++++++++++++++
 package/lowdown/lowdown.hash |  5 +++++
 package/lowdown/lowdown.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/lowdown/Config.in
 create mode 100644 package/lowdown/lowdown.hash
 create mode 100644 package/lowdown/lowdown.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16b72eee08..39b9aa4ea3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1615,6 +1615,7 @@ F:	package/libite/
 F:	package/libnet/
 F:	package/libteam/
 F:	package/libuev/
+F:	package/lowdown/
 F:	package/mg/
 F:	package/mdnsd/
 F:	package/mini-snmpd/
diff --git a/package/Config.in b/package/Config.in
index 400183516e..58a04efc96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2765,6 +2765,7 @@ comment "Utilities"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
 	source "package/logsurfer/Config.in"
+	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
 	source "package/pdmenu/Config.in"
diff --git a/package/lowdown/Config.in b/package/lowdown/Config.in
new file mode 100644
index 0000000000..00ae6fcce6
--- /dev/null
+++ b/package/lowdown/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LOWDOWN
+	bool "lowdown"
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
+	help
+	  Simple markdown translator to HTML5, terminal, and more.
+	  Useful for providing the same help texts both for a CLI
+	  and web.
+
+	  https://kristaps.bsd.lv/lowdown/
+
+comment "lowdown needs a toolchain w/ wchar and shared library support"
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
diff --git a/package/lowdown/lowdown.hash b/package/lowdown/lowdown.hash
new file mode 100644
index 0000000000..0b4d1fd25d
--- /dev/null
+++ b/package/lowdown/lowdown.hash
@@ -0,0 +1,5 @@
+# SHA512 from release archive https://kristaps.bsd.lv/lowdown/snapshots/
+sha512  316b27384f83cb57fa414c315556fd177f2998c009e031986446e82252f276dc68adfeb263b88640deccb7084da4771d0ee8fae7d37388dba4e1a0aa426c701d  lowdown-1.4.0.tar.gz
+
+# Locally calculated
+sha256  204658eb0d5ba87935056630534cdafd21ed29597e0a9c9f8f557779a3fb99d4  LICENSE.md
diff --git a/package/lowdown/lowdown.mk b/package/lowdown/lowdown.mk
new file mode 100644
index 0000000000..d88b70327a
--- /dev/null
+++ b/package/lowdown/lowdown.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# lowdown
+#
+################################################################################
+
+LOWDOWN_VERSION = 1.4.0
+LOWDOWN_SITE = https://kristaps.bsd.lv/lowdown/snapshots
+LOWDOWN_LICENSE = ISC
+LOWDOWN_LICENSE_FILES = LICENSE.md
+
+define LOWDOWN_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+endef
+
+define LOWDOWN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LOWDOWN_INSTALL_TARGET_CMDS
+	$(INSTALL) -t $(TARGET_DIR)/usr/bin -D -m 0755 $(@D)/lowdown
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
