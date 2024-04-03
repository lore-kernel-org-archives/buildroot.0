Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC271C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A8BF41689;
	Wed,  3 Apr 2024 08:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymiS7FJ0WNPe; Wed,  3 Apr 2024 08:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7319A416B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7319A416B7;
	Wed,  3 Apr 2024 08:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39B5B1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 271CA810AC
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6z2VtWSiyPI for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:54:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF7A381098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7A381098
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF7A381098
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:54:32 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e0acaf69aso337446a12.1
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134471; x=1712739271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0qerrhoYKZlrWf7xQ4vIzqY73ajOnGuSnII+sNbVPQc=;
 b=TMey/4TAsCgFfos9Zsclm77p0mb7o1juXFikiZKrLMkyGre5icEty/V4/OrcFZgOya
 EtL2Ts/ygLUWTLiaXataKqAD8ZT8/2lFV2L8EBa93gHmK1/YkPPkiF1XaIG/CYCfo7TZ
 8O3zeGmJk7hDO3aXyYdRLJiOKcKz+xqk3JFBMO4Qpt+quS+7+a+/XsPLQUuGcy6tClB4
 hdFGcpy8s4feciM2Z/gayW0mc33gn6o5uxfYunASs002zbZjrW1bsQwwVhxzcT7fOuAa
 oQFUKl97KaY5MyX8wcJk6+HQTnm+8sCFSSMLX4fOFQ81X44jjI58m+NObhYeM2f/2qeE
 XI3g==
X-Gm-Message-State: AOJu0YwZOJOsl3Mb1kpI9Vu3uw5Tg4gfx0ammx4cSn+B6S2O7dA8z2ev
 WboZizfqcAF/+/qkeyBH6XRplCmuFu/kbcC42QZmP2DAnmLkYsCRyq0+xlDBbeXBrxbBqDoFC3k
 =
X-Google-Smtp-Source: AGHT+IFsbTuAH4s8tkO0d/7edfEttlwYNJN5YTXxHSGxlbJuTiMd2qZc7PqD/SMVdUQ69/tP7PHe/w==
X-Received: by 2002:a05:6402:13c3:b0:56c:24e6:ca7e with SMTP id
 a3-20020a05640213c300b0056c24e6ca7emr12714079edx.2.1712134470829; 
 Wed, 03 Apr 2024 01:54:30 -0700 (PDT)
Received: from vm.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 dh26-20020a0564021d3a00b0056e0b358e86sm245178edb.97.2024.04.03.01.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:54:30 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:54:22 +0200
Message-Id: <20240403085424.1650628-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712134471; x=1712739271; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0qerrhoYKZlrWf7xQ4vIzqY73ajOnGuSnII+sNbVPQc=;
 b=NCsZ6nHxFkQ7N01oXb1Z8YfYJGN1zchCBTltchJ5YwgK3MdJz57tVonJwQ1x3s+LKW
 juyWv+9jhiiTq9Vz0TOzHxQgVErnPEOBjwtCzx7lc0tE0etj0bgfrD2v+XXM14sDWPYU
 rFwbl2xe0obNKMdfW39euvouyJJV0DFz3Xgf1K8CG4DsCMI5BZyGKL3yCiAMN0yMJIPc
 cs1uzu35eNHfDbSQX1QwghBtty1OPf2lti5vF4NbCWs6qJwC/g13V0/ZZxn0ROWaKtQO
 wiDqYoCD6NKuKPF6ht9QnvWs8Hk4AdQQscZL9CPJqEufKUCV2+zCpnDQUHB5B08PM1Ia
 V7Fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=NCsZ6nHx
Subject: [Buildroot] [PATCH 1/3] package/lmdb: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lmdb/Config.in | 13 +++++++++++++
 package/lmdb/lmdb.hash |  3 +++
 package/lmdb/lmdb.mk   | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/lmdb/Config.in
 create mode 100644 package/lmdb/lmdb.hash
 create mode 100644 package/lmdb/lmdb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 904c7ebf2d..5b47ee4e29 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1126,6 +1126,7 @@ F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lua-inotify/
+F:	package/lmdb/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..4473169544 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1556,6 +1556,7 @@ menu "Database"
 	source "package/libodb-mysql/Config.in"
 	source "package/libodb-pgsql/Config.in"
 	source "package/libpqxx/Config.in"
+	source "package/lmdb/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/lmdb/Config.in b/package/lmdb/Config.in
new file mode 100644
index 0000000000..f4ae9f3103
--- /dev/null
+++ b/package/lmdb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LMDB
+	bool "lmdb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  OpenLDAP Lightning Memory-Mapped Database
+
+	  LMDB is compact, fast, powerful, and robust and implements
+	  a simplified variant of the BerkeleyDB (BDB) API.
+
+	  https://symas.com/lmdb/
+
+comment "lmdb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
new file mode 100644
index 0000000000..d72c66aace
--- /dev/null
+++ b/package/lmdb/lmdb.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dd70a8c67807b3b8532b3e987b0a4e998962ecc28643e1af5ec77696b081c9b0  lmdb-0.9.31.tar.gz
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
new file mode 100644
index 0000000000..5e2ad2d05a
--- /dev/null
+++ b/package/lmdb/lmdb.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# lmdb
+#
+################################################################################
+
+LMDB_VERSION = 0.9.31
+LMDB_SITE = $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
+LMDB_LICENSE = OpenLDAP Public License
+LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
+LMDB_INSTALL_STAGING = YES
+
+define LMDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		CC="$(TARGET_CC)" \
+		XCFLAGS="$(TARGET_CFLAGS)" \
+		AR="$(TARGET_CROSS)ar" \
+		all
+endef
+
+define LMDB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		DESTDIR="$(STAGING_DIR)" \
+		prefix=/usr \
+		install
+endef
+
+define LMDB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		DESTDIR="$(TARGET_DIR)" \
+		prefix=/usr \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
