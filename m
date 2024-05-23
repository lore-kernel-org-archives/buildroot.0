Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3366AC25B7C
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 16:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9047B40847;
	Thu, 23 May 2024 16:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99hERCkcakU5; Thu, 23 May 2024 16:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EF34083A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EF34083A;
	Thu, 23 May 2024 16:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 912BF1BF286
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 16:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6FC4083A
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 16:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-moy5hPoXk7 for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 16:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF93E407C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF93E407C8
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF93E407C8
 for <buildroot@buildroot.org>; Thu, 23 May 2024 16:21:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-354f69934feso695561f8f.0
 for <buildroot@buildroot.org>; Thu, 23 May 2024 09:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716481310; x=1717086110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDP3+NqmcqBdEsomJoSthq8vu+G53TlHFtENnXE5OLg=;
 b=d/t580CAvZxAtJqB0hTPVDFyvZPcrJQitgtJ6fOP4S9KdYnjfmg33bby+gIMFBhem3
 8JY2Nh6dopj5gZ1H3HVgUP/2PzqQ3QMGz0uwlqkikaICXbbpc0EM/fIcg/gYqL9fQ/UV
 anE3arYrA17Wdaf19ceDoyEapfquCMh97usqpeqWr5L+R8IQ5Q+TxPGsewkT13jX234J
 aPy60qrswdmnzTYm6QeUbNSkKIiNj+jnfN/lbjK598uVSFA6rXIRI6/qtG0DQb3kbIp8
 WvFjaC7GOzEVsSrF0rtvLcykViHnc62Rolp+IjON8k9G9shL75HMyb1LPN1qJVLboQlF
 5xlQ==
X-Gm-Message-State: AOJu0Yw/R5vdXyt5G30ZT0DbqjZJg96Tk0yhT/hHcvcbQgyUcSREGTv2
 1MklWIBP9u2VQ801ryHYY836xJ99eyjXNx7yrRvls/faKhnvB6SSREkVqw==
X-Google-Smtp-Source: AGHT+IEVmt4+RAFZbeImaKlcJDw44dfAj4MXl2Z4xV2+4MIdAveHh39gLexgtsUDT+up5bkHg1Ausw==
X-Received: by 2002:adf:ce86:0:b0:34d:9b4d:2a43 with SMTP id
 ffacd0b85a97d-354f73b7d05mr2593973f8f.0.1716481310500; 
 Thu, 23 May 2024 09:21:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354fca5b68dsm1334440f8f.19.2024.05.23.09.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 09:21:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 18:21:48 +0200
Message-ID: <20240523162148.1468596-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716481310; x=1717086110; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cDP3+NqmcqBdEsomJoSthq8vu+G53TlHFtENnXE5OLg=;
 b=Y/piQOBQLIwPYCkigW8tiXm0rKnls5fpOwI6HBHGT2vqkvYz1JvgF1uy2ChNgn/VGP
 wwIF5/cS27B1/IGswiEWKoJ0iqU6mEQKMS2aohJ1DGVXCXkJl2/RsjVxaAG1R13zW6vV
 iMvhH/1gsUG6/92k18d13Xmf8Ih2LcRld0WOo/os4RYJO6w1y1PWOlExOMA9dTPgyNa3
 6HC/KQJj536EKGQD0iUHJAZ2611rh+YgEDMat7mQWWg7iu3+qawbz59YqWGJ5DM9EirO
 Pt11OdEUFW13gwdoHj40Z/Ggzt9z5HvI8zsXg7V61J6qqvSSH/CwQIQf1MVgfd4/BAL5
 aKrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y/piQOBQ
Subject: [Buildroot] [PATCH 1/1] package/lua-cffi: add luajit support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

luajit is supported since the addition of the package in commit
13114d0f9352531e5d7ebed45cd3f679407c61d9 and
https://github.com/q66/cffi-lua/commit/cb92c44e781d81e31eb7fe21911b01e54a2c3893

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua-cffi/Config.in   |  2 --
 package/lua-cffi/lua-cffi.mk | 10 +++++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
index f4a760ce0d..ceef16ee6f 100644
--- a/package/lua-cffi/Config.in
+++ b/package/lua-cffi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_CFFI
 	bool "lua-cffi"
-	depends on !BR2_PACKAGE_LUAJIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -13,7 +12,6 @@ config BR2_PACKAGE_LUA_CFFI
 	  https://github.com/q66/cffi-lua
 
 comment "lua-cffi needs a toolchain w/ C++, gcc >= 4.8, threads"
-	depends on !BR2_PACKAGE_LUAJIT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index 30427ac34c..d6e059d273 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -9,6 +9,14 @@ LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
 
-LUA_CFFI_DEPENDENCIES = libffi lua
+LUA_CFFI_DEPENDENCIES = libffi
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+LUA_CFFI_DEPENDENCIES += lua
+LUA_CFFI_CONF_OPTS = -Dlua_version=$(LUAINTERPRETER_ABIVER)
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUA_CFFI_DEPENDENCIES += luajit
+LUA_CFFI_CONF_OPTS = -Dlua_version=luajit
+endif
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
