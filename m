Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC964CE7B0E
	for <buildroot@archiver.kernel.org>; Fri, 14 Nov 2025 14:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD55D83DBA;
	Fri, 14 Nov 2025 14:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2tNfB0QBVsb; Fri, 14 Nov 2025 14:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DC183CE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3DC183CE5;
	Fri, 14 Nov 2025 14:05:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34974D5
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B86140C99
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkLUfYq9zoMh for <buildroot@buildroot.org>;
 Fri, 14 Nov 2025 14:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 186F54030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 186F54030E
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 186F54030E
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 14:05:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-477775d3728so20709865e9.2
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 06:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763129123; x=1763733923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ka9lsdNDPaJrjY18wQr+t0eh9WxSYNfTEzsZD9+Syj0=;
 b=DtdUoSkZUUHN5Qru6CdY/Mi2gliMNs9wy6FtODjv8mYOugffHACVpe3lee3c8JBqC/
 plJVjwDZLIRsJvesA9tmenHbirbiqvpmVERhFdkCpCI6ypQObq9jLsAczT+H06Hvp4xr
 UOWhcgOe8xTnsSmKYe5hg7daE7HdklwsdY98X3BzX6hySy26ZO6uHO8dqhdzos9bN6nD
 u46yRn5X0QReIy6ZZc4OAI1OpmT8n7PTBXs2ursluBt8AF58qPdEQ5lFID4jCsvrW4EX
 lb0lcHDPNnDOcl9qoSUjiOgKrsSJnbR6vEWYEX59RfjBEQj4X3aWFhWpnrmX3p8Of5Py
 ZxJg==
X-Gm-Message-State: AOJu0Yxj0LQ4JitouLrK/O/JfDDYg+LqLlHUu3rYwh3afzt/o1+OfRgL
 X1njLvOfuxpCtphX+OCmLG338H3DXt8hM9vgy1T7urBIG83LLpAuNT+6Ry6n7Vah
X-Gm-Gg: ASbGnctyYysjdFhR6JIPsdie3KSvDbAH2f4SHJ8T6TwkQryvM/U5ycxeaRTYw7N3dMW
 eMO2M06qSexAm23dPaN+4ZyfofAks6HMWAanxa9F1pvozjsKS6o8wvPD0EGm6mEwvk3Rs4Vpe6E
 z+H6YAvFPuxWzkPO122CkwRyIkTlMPyjFRzoDGvCvGrK9ohsAoiTWxLRI3SgR96BLNcteCsw4Qh
 r4azj6hU+1rkKAIhGTuax3jamhA6BFJHgnU6of/TI7qg6fjuZR5X0WEnpEM7vHlRZhim1nlHqE8
 SmYn9uoSDyRYGpdXEgxNozXQRJeZQVJJ2nsCWBglsWjRJHPUk7XK26MPjm9iHyKRrIreE2ReWB7
 Jb/AC9Si65sWXKHIzWjzLQR1O5rTXEq3XH/eDA/vXHlJUUWlRKH/NaK4c1z07rjWBdUAxPigrz7
 RnuSe0xqI+UX9O5nudTe9PdKtiKrXXI3yz9qGU
X-Google-Smtp-Source: AGHT+IGU5+HwiQxOiz+9oxqzWx5GFTbhJo2f4Hl3DiLiGc/P8lyCrTv+MdqsQd1yNBmgLRDZ0v2pWQ==
X-Received: by 2002:a05:600c:3587:b0:477:5aaa:57a3 with SMTP id
 5b1f17b1804b1-4778fe55589mr33289225e9.2.1763129122549; 
 Fri, 14 Nov 2025 06:05:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb6f:7900:185:e02b:1e5b:739e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4778bd1bf5asm44462245e9.14.2025.11.14.06.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:05:22 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 14 Nov 2025 15:05:19 +0100
Message-ID: <20251114140519.541039-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/openjdk{,
 -bin}: fix wrong version reporting
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Before:

$ java --version
openjdk 17 2024-07-16
OpenJDK Runtime Environment (build 17+17)
OpenJDK 64-Bit Server VM (build 17+17, mixed mode)

After:

$ java --version
openjdk 17.0.12 2024-07-16
OpenJDK Runtime Environment (build 17.0.12+7)
OpenJDK 64-Bit Server VM (build 17.0.12+7, mixed mode)

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/openjdk-bin/openjdk-bin.mk |  8 +++++---
 package/openjdk/openjdk.mk         | 13 ++++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 17056e80b7..e6c74cf6d8 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.4_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.4
+HOST_OPENJDK_BIN_VERSION_BUILD = 7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.12
+HOST_OPENJDK_BIN_VERSION_BUILD = 7
 endif
 
 ifeq ($(HOSTARCH),x86_64)
@@ -19,7 +21,7 @@ ifeq ($(HOSTARCH),aarch64)
 HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
 endif
 
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)_$(HOST_OPENJDK_BIN_VERSION_BUILD)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index f59eb69782..1ec9863e98 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,12 +6,15 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.4+7
+OPENJDK_VERSION_MINOR = 0.4
+OPENJDK_VERSION_BUILD = 7
+
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.12+7
+OPENJDK_VERSION_MINOR = 0.12
+OPENJDK_VERSION_BUILD = 7
 endif
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
@@ -102,8 +105,8 @@ OPENJDK_CONF_OPTS = \
 	--with-native-debug-symbols=none \
 	--without-version-pre \
 	--with-sysroot=$(STAGING_DIR) \
-	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
-	--with-version-string="$(OPENJDK_VERSION_MAJOR)"
+	--with-version-build="$(OPENJDK_VERSION_BUILD)" \
+	--with-version-string="$(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)"
 
 # If building for AArch64, use the provided CPU port.
 ifeq ($(BR2_aarch64),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
