Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD389C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F3B3400EA;
	Wed,  6 Dec 2023 09:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F3B3400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsSk76G3RF7P; Wed,  6 Dec 2023 09:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5978841A81;
	Wed,  6 Dec 2023 09:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5978841A81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2482D1BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 071538206D
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 071538206D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXjA9sooHgrz for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:39:40 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC4B681490
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC4B681490
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1c8512349dso73155866b.2
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855577; x=1702460377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0qerrhoYKZlrWf7xQ4vIzqY73ajOnGuSnII+sNbVPQc=;
 b=saYR7zljC/VdgUpOwjEH+1HiOLUOxNWobwzAKQNszIEZx6zv2xHyFFv+ZR+pW1bSW6
 0LkanHkCaFX9hWtD9qXGP+FGg004BjGRe8MPy/95zCAZ1qVEsUbLTZvb/meEtRf0QelO
 OmUOJcob7zn1QNuPDfnPQrtGlaK5mW8R0CG7rbW/blU0r5ZoJcHKuHfn6yTjm9GVJIJx
 kbhDip0hkcjHv6hJR/ec1+fL6x86BONRwJooQwzH+Hqq2CyZSuchyg57epKDs4B02eGF
 F0L9mpih706fVeZir7/XagW16aG5igTQ08lyo2rTRrVFJHY9lWhEZPlY5elww9+kZmZB
 iK5A==
X-Gm-Message-State: AOJu0YxbWFlI8DmCvkL/UuEwQ6uMNLMkfXc0QrAJIvXPl+EN+v0JzgTO
 VeKw0qPLY1YTJ/abbsmAObgkmzL+X1M=
X-Google-Smtp-Source: AGHT+IEB7oStLK3ic+OfoScHyD32IG2asWyfLXV7zynqvtzo3H0Z23aY5Was+HU/xk0q2PIvkTJcEA==
X-Received: by 2002:a17:906:51ca:b0:a1d:19c9:480a with SMTP id
 v10-20020a17090651ca00b00a1d19c9480amr336699ejk.103.1701855577187; 
 Wed, 06 Dec 2023 01:39:37 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 e20-20020a1709062c1400b00a1c7b20e9e6sm2111294ejh.32.2023.12.06.01.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:39:36 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:29 +0100
Message-Id: <20231206093931.1548389-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855577; x=1702460377; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0qerrhoYKZlrWf7xQ4vIzqY73ajOnGuSnII+sNbVPQc=;
 b=Bnfa9h1ja/xdoDXLcaQZXklJVDb4zazVvpPfjRIVjloHvoxfiMSiyOIZU2EsNMcxXW
 IlUUhcA1kqChk30nyxaAvAl27UrU9FU0sCc0PMaTpiyWG15a8Yn2ujzl71z9VHt8URwd
 dGjlErojsNEpgU+v7/Rx3iTtN9Ur/sCFMgr60DYFtHS7awYWp61sTyE4nxzcjmJo4yQZ
 rNyD2OJe3siP+21/R+hbYPziA+pcTN5I6V83+7I0o8gFv/CizZgOkkarMbsCcBe6Bd2c
 GE6XR7vmldNmiUXiCTqn/Ke88+h4i4P9e1loNpYp0Cqo06J/82s0y3eGYO7X7zHyvdY0
 ah9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bnfa9h1j
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
