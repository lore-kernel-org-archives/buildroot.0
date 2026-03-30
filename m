Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3753810D14A4
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 11:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE26D40BAE;
	Mon, 30 Mar 2026 11:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6Y4NEv46Srp; Mon, 30 Mar 2026 11:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA9F240BA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774871831;
	bh=w1EaHuMH7AtriyWaPEnuMR0BCX6cKNvaeREicGoIbpw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PGhBhdRRDU4tWpwYBbw09CzwV0y8Gdcx2JVQKNe3v7+gdZM1WbFPn/hgJMYAwNDdR
	 NnucqMuI8xApAzTGRdODSxIsJU8GrT7PcZrHrnl3zA0SOdbaPp1YsOy3SOV4PKiGYp
	 PBUyvl4muasiC+7/sLSKNRDSTfb8itLYrgFEtB+2vd2NT5FZIlQnqCJ899RYgn5iLq
	 +vd9keC4fnnnPm9WSYipVyiwKUXdupi8XUp7V0EUI958IjBVbCJ28BY16Cs6BnzdV5
	 qosx2c11uUTYcDFbxg2P7oIIoPDE7KbfFAaR/qpSGgSZagBNnHFQudmE15fiUfA+0o
	 F/fPpcZwuJGbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9F240BA3;
	Mon, 30 Mar 2026 11:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E9D11D3
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 911D740BA6
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNbBchzJ-wFV for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 11:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88BA440B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88BA440B6B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88BA440B6B
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:57:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4873ce69ba9so8924405e9.2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 04:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774871827; x=1775476627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GdFTF6x4zBveWRwgusf5zDgS7jOT2uBRSPhcBnm8j9I=;
 b=DA8+0T/nZianXwbPeDM3sMN9RnKQ9Or8/XZvOJv4tlgO36TC9yk9+jQ2jtimB8hpCs
 UwDdQQTB4mcjZ2d5USc08zN7wui6VhYjBRfI7tK4pjLuMMXHBQPVVRq9kOwXhvJ8TkD5
 PX6uE1wHRJh61Kl5LI0pvAr7T8AI0xci8MT0nO9ZrlK1t3bIGjVtHvr56DfvAb3/dE18
 ub/Bqgab1AutjBUOB8tkzyNrTJO5kR/SNRvmehtKh7oLYR3bBOf25kZBjSzY9DNZ1Xfc
 luVs3AyplaD009aw1n1R35c2dypNkNkuO1cV/83tFBisP8gz9IypFomgny9yEuWk7h20
 QQ6A==
X-Gm-Message-State: AOJu0Yyjj2KKag2pz3LpVJFaMJEVPzH5La3Lft6GVuwSCF8J0++mfpnM
 7PkhImFkPsOp0fMhd7PWbeoIulieRdz4+/Faa4IzikMKU5Kp9nlvAb4HISsIpWRI76iTjlmbAnX
 cJcrAqopjBtcpFwL+zxCeVJjGnK2/3WrzEZwTrFI4waJG6VFCSTe6SpWoINdDcFbciTLzaBCmok
 GVpJ6a8hE2KX5dBDPoM82b7sZQtA5gqKV+pw+s2T/Xwo1I7SY/KWfp
X-Gm-Gg: ATEYQzxekxSFQ56p4G313Nq3X7lgGUUZtLqCGRqjUmo+UTJZIRPGzkPYUHg4c7vQfGN
 oPAeEdCJrvLzxHweoePHdMEE5I5I8TEjBcPKD4ZkjfMFES7JTBMJ/8bGCERykqH8A6XPDJCb1t7
 aBoYJchuzMEIf4Mfnf2Ii35aFt+wNDZ/GIc4H+osijBa9rY7EqDMgGokTS7d/fWer5GXFQPyoOQ
 2ymdq2iozw2iPdlJMr6uoMROotVcncAEGtdbzscOZAaYCQg7W72iNpA3s6GoWKCqNuRxFd3I+90
 AXtF8Lny0oCDU6Cp6a5vpxXqj6cjzdk0JmC0qcxuJ7Pwm/H/gfk0Sztrg1GSNYlHYoyAJh2is0b
 loiHLJcUrdkrLxBxujp3QiU+oK0jgrJ8693vvPeuU4TI/NRQKZACJVskHuXRTXZspgtKfVWlK6H
 l5Tf/Tp2K5CrYttGa4dDLzhoq0w/Uy
X-Received: by 2002:a05:600c:1d1c:b0:483:7903:c3b1 with SMTP id
 5b1f17b1804b1-48727efacb3mr193613895e9.20.1774871826535; 
 Mon, 30 Mar 2026 04:57:06 -0700 (PDT)
Received: from goefb.lan ([185.236.72.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48730688605sm283802535e9.10.2026.03.30.04.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 04:57:06 -0700 (PDT)
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
To: buildroot@buildroot.org
Cc: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Date: Mon, 30 Mar 2026 13:57:02 +0200
Message-ID: <20260330115702.1451432-2-ferdinand.bachmann@go-e.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330115702.1451432-1-ferdinand.bachmann@go-e.com>
References: <20260330115702.1451432-1-ferdinand.bachmann@go-e.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1774871827; x=1775476627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdFTF6x4zBveWRwgusf5zDgS7jOT2uBRSPhcBnm8j9I=;
 b=hcLYnHrjpmaFWR3Htyi9UWhubMnbD0UPyp89p4KWIGXvZkNP6mfcoPRTKub0v0NcKa
 jR3z/woR2yW5TDaV9I8QnWFHQAB9VMX7HbeZ5BbAhS8E7SH5yBSxGhr2zw3gbCqpMUTt
 JhsgPdPM/+uLyvEAMBbmIIbVpNmNS0v0bCAbomUwpH6m2R9ZXtcd3zPA6aJ5SEgocRCV
 tjt6vB76mtXWPVGtPexETCDh0DVuUqRGQLcYgziRRF717yBVWYK7O3ymSn4cx/+za/7G
 xPGXBguhz98bJd0Fi9ipwgVion/FkV7UpmqR0Fbv4Y3NL3t4P+mIuS3NVLKPh/SmhsuE
 qNZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=hcLYnHrj
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix FIT signature
 support
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

uboot-tools changed how the config system works for tool builds, which
leads to buildroot's configure cmds being wrong / incomplete.

Specifically, the CONFIG_FIT_* macros are now called CONFIG_TOOLS_FIT_*,
while the make options needed to compile FIT signature support are still
CONFIG_FIT_*. Additionally, CONFIG_TOOLS_LIBCRYPTO is needed to link
uboot-tools with FIT signature support correctly.

This patch fixes the issue by adding the new CONFIG_TOOLS_FIT_* defines
to the generated autoconf.h and adding CONFIG_TOOLS_LIBCRYPTO to the
make options.

Signed-off-by: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
---
 package/uboot-tools/uboot-tools.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index fa0b6aba78..99752a9b47 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -31,9 +31,12 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 CONFIG_TOOLS_LIBCRYPTO=y
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
@@ -124,9 +127,12 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -142,7 +148,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 CONFIG_TOOLS_LIBCRYPTO=y
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(HOST_DIR)/bin/fit_check_sign
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
