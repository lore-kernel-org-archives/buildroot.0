Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E453C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 13:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29887843FA;
	Wed,  6 Aug 2025 13:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg92Lk6v633C; Wed,  6 Aug 2025 13:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 348CB843F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348CB843F0;
	Wed,  6 Aug 2025 13:21:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3DB233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC172411F7
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnfCB1VgOKMe for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 13:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEC0240E72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC0240E72
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEC0240E72
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:21:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so5556505f8f.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754486477; x=1755091277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YY93oLJpn8BjqA6em1C8k7gcdeY6DMSegjCUVRBuFoQ=;
 b=KlpU56I9eQIPift7nVTmrYZsEpkkf1ltrX6CoLYR3coExNSfdViP+r7QZZDb8/S3F+
 2snuvPso+XxTpNiH/9qawtGh6VQ9iT7fAYvDj9api2NQ9yVOc+CVvCGhPUnUblJMQlD7
 w19kFwaa2ciREjW2zLb1Nj/htNLEvxMYvpjBpXHWvakZMQbdaN4x/frFcs9JK8DUecZA
 ArC3mjkJxUh0bGJVUskk5rpM/DY9CQ7q/t67xCwdM/bPVmuUse1SV0MxQ05Fn7iLBlF0
 RBN7g/LBb5/t7EuogsfPEaauZi2iGtB9D7S81Rablc0ciq3uV4aszm/G3FjT+SNOzzFM
 X3+g==
X-Gm-Message-State: AOJu0YyudhRoOxNxyF50yAnql9PWOBczDGhvLLwybuSGZQOh6fNzR7ei
 CKkOVA0s7IKhem0ViFy9g68J8ogiDtN5MBVLi92DuvgFXQVs/bYvU/lL/pOsRQ==
X-Gm-Gg: ASbGncsQxh9xtrCdhvg6m1uDoD/jaIBLBpL25Wpf2dFWlYiUZwFmns29SiY8gEIDNJn
 vrXE0vf+UIVLXSgW5VM+8X63mSVBD0wcYJzFVcBtYphqONiuJJuqOv3lBvPqwi6yiEDntlLwPZ/
 Z1Jxx3GIzbqy+wW+ZtvGpXV724ymg6+e5UF97w/nR3qCauJ8j5TgjQBSWcERLkjWvjl75+v4vSh
 ckYPohHTEQ3eYQTfME6QJRBqK0qDcC8l65IpfQZLzmMjy5s+FzzEit8oAi24YiTUCKBZpr2Eqts
 4xle+OdLBlTCyipLr7Pl72FPaz2fqztN6TXtOTrvuRro74/lwjzxl+D4FbVcyA1sVSamaX3l4+V
 HO4bEj0IbSIMM+9Q=
X-Google-Smtp-Source: AGHT+IGpQMe0O8f6PxxTItIFHwzDzqEMdk3K4KvzhNKU34/7R6wQjU0GZAQDDISKAAcl8CrwwyNCeg==
X-Received: by 2002:a05:6000:240d:b0:3b8:d672:3cf8 with SMTP id
 ffacd0b85a97d-3b8f41b6bc6mr2250683f8f.43.1754486476667; 
 Wed, 06 Aug 2025 06:21:16 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:db1b:d131:dd6d:4a40])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm189632105e9.9.2025.08.06.06.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 06:21:16 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
	Maxime Leroy <maxime@leroys.fr>
Date: Wed,  6 Aug 2025 15:21:09 +0200
Message-ID: <20250806132109.129355-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754486477; x=1755091277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=YY93oLJpn8BjqA6em1C8k7gcdeY6DMSegjCUVRBuFoQ=;
 b=asCVpNLVEeHfOjF0DFD/kf61XwDggeTo7QyWbxAFwNPWVwhRLmwlqJ7oLkfDi2JWqY
 O3RW22zQlRAGs29f+TYWqaSL+U+LpvBcwJAom6c0ZaKzOi//QQysIlKNVcpgfLX0qPnH
 rmzOxctVmBAA5Eyp/0bIIF6OryAOo/6PxEpE+7N8D9I7lssMT22ztFRpk+9DjpqnFNER
 dOyc6tAalMdzW4fN/yn9PjJI9bvtGJFO8EhgLKhTjesjM+jcNSIqZeRCtQV9pXjL6hDv
 MEU0YQNTBLL63bQESTnF0RizcbW2ZZpkqQjBgz/biBaMAtlBSBQBJdqpYf9O1FcPPJ0v
 noVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=asCVpNLV
Subject: [Buildroot] [PATCH 1/1] package/frr: bump to version 10.4.1
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

Update FRR to the latest stable version (10.4.1 see [1], 10.4.0 see [2]).

As protobuf-c is no longer mandatory (see [3]), a new option
BR2_PACKAGE_FRR_PROTOBUF is added to enable/disable it.

[1] https://github.com/FRRouting/frr/commit/88f5c06cbc1c
[2] https://github.com/FRRouting/frr/releases/tag/frr-10.4.0
[3] https://github.com/FRRouting/frr/commit/e51c16a4ca92
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/frr/Config.in | 27 ++++++++++++++++++---------
 package/frr/frr.hash  |  2 +-
 package/frr/frr.mk    | 11 +++++++++--
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index 211eb83419..feb1aef05a 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_FRR
 	bool "frr"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  The FRRouting Protocol Suite.
 
@@ -43,11 +39,24 @@ config BR2_PACKAGE_FRR_NHRPD
 	help
 	  Build Next Hop Routing Protocol daemon.
 
+config BR2_PACKAGE_FRR_PROTOBUF
+	bool "Protobuf support (Binary-FPM and MLAG)"
+	default y
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
+	select  BR2_PACKAGE_PROTOBUF_C
+	help
+	  Build FRR with protobuf-based Binary-FPM export and MLAG
+	  peer synchronization.
+
 endif
 
-comment "frr needs a toolchain w/ threads, dynamic library, C++, host gcc >= 7"
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+comment "frr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "protobuf support for frr needs a toolchain w/ protobuf, C++, host gcc >= 7"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 414aaec7dd..12030a0df8 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  df4bc4f644f93be09f75c0e0e325b2f6a3ee6d1c6db429b6f36874e88a66ee33  frr-10.3.1.tar.gz
+sha256  8e4003eaba168626c5ea7a6735f2c85c87b04214e6f8c8f2715b21f8ae40970b  frr-10.4.1.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 23a2ca6037..fb7477a211 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.3.1
+FRR_VERSION = 10.4.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
@@ -25,7 +25,6 @@ FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
-	protobuf-c \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
@@ -89,6 +88,14 @@ else
 FRR_CONF_OPTS += --disable-bfdd
 endif
 
+# Optional protobuf support
+ifeq ($(BR2_PACKAGE_FRR_PROTOBUF),y)
+FRR_DEPENDENCIES += protobuf-c
+FRR_CONF_OPTS += --enable-protobuf
+else
+FRR_CONF_OPTS += --disable-protobuf
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
