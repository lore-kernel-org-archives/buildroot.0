Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32E410D14A4
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 11:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A8B811A3;
	Mon, 30 Mar 2026 11:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCsB8q9dhoRj; Mon, 30 Mar 2026 11:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC36A8119B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774871371;
	bh=h9bQJUcnN8IGBM3oG6wMPS3eqb+vCAuX0BlQ80l9kVY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C5C1fcpNVnncUfPcSf1WdJpR/rqKFMDf19ALGBM09qkH8e8amNG13XA+cDh8wn/+Q
	 kECcwVrZxqq9KPoR5GEzpon5Kcyj307ndyu9i5QwJtSfTAeVR7+MfB/1LYupHlTBzK
	 3AGEFqcZi4kQ0Kl/AFJmy/eM2FMPuUFKbxL0GCkrqQowQ58OfIYNNNI6Palv+XCn8o
	 M/YbqAnNuzgaEtB+KPksDZCgKCEcalOGjy8eCAESVa9N6UzNg1HJwODk5xAOSRfDNQ
	 Ty7mIvVmKCRFkILXo5MvEgS5uoxmpGP9jNp0QR+HpcA4bnkp889L86HKacRuCVOkSJ
	 bwMqPjYQ4jTDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC36A8119B;
	Mon, 30 Mar 2026 11:49:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F4AF2C5
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4432260B1A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-sySavtkQoQ for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 11:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 432E260B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 432E260B16
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 432E260B16
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 11:49:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4870206f73bso26462615e9.3
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 04:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774871367; x=1775476167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZ+6qUUkrvBdcx9BoF4TPHescyOsJgCXGySA76l4r9o=;
 b=QHJPFSd4m2cQhLt+kz68c3xsSHs8ZdSp39jYgANM9J0B29cMo1czQeHenZOon+gZHP
 Di1cRG+/el1pH6awGSto+AygNqWOLuaRqeRqSr7uZoxjUsJb8uRYs7qIxKjp8a3kUCfU
 h2QLHndFez5cxijbm6LuFK0oE5w6TPW8fdZ/NU+NKJGyYtSvkJqDOZ1VCQtxZfsQuPwe
 MEm4EH8is6sV3uSDr5KRf+F74ips4JzYWQUzMpqK5WaG+EXMWLvkQWm0qA8yOKHMkdzJ
 DyVJ+awp18IZH8DuitBX9llZAEwc3ue+nZf1rQag6qmgL6evBuF8RAVG0PuC35X5FTTg
 9sww==
X-Gm-Message-State: AOJu0YzYvgLfpdoHgJGWsmehDTpvMUyJ0W2uRPAjx6gC5rxLwOiNVonF
 5RgxOXmqQyBMVf7gIFNyhHL5fxe2SVDY4hF1KrqAmAiPa2M6+L+T2pwTzJ7zlPT6uf6vLxCDUKu
 sP8x/Z+MKAY0tKqAQMUlb96hOZaTjfMuyXLnJnqdVGG/EKCuu0GBi5mtRp9DOV2rDZEij+0zjs6
 8SClovEJlDKo/he7gUh4TjYzwfQHcZ3PGHT12uahSjCVtQbpOWzKLlaQk=
X-Gm-Gg: ATEYQzyxzpXqCWeut7Sn1Ibu8U1fCSEqMt3qYBgOwHPHROlYA1787gbEGH6b0ozforK
 B3JVeaC1FfywhE5E+MuKy46nbQ3BWiL+talDkI0l9fjSb4PvE/fI/5w/G/wJrxnvKUA8V9ArG1/
 fNInfkfxbyjFl0tJCtZnJmYbyAxccu1ZJ2jFCe44rrNPSpkH0u7acgQfu/5MltB2aODBbPpNUpg
 dmyuCgt1X3me60Aq7tP7PqU2/+bmq7QFlX+t3opfMUsaPvWd1z2DN+tvw2nKrx+kS9TvUmTJSsv
 6TBFN+w+0cILIpa9s9G0br0T11JErZng5hCuOxEJLbNWH//ZElbotFV0AMS8a6ooOfemxHqGpcy
 AQMpjk+jvlbuYNLKK4iOqs3WKU13Y6/L1f2IZ3Rbl/kaWUdCYgfdGMlayj/ixM0SJQ9TKDUette
 rOlwAKUzQcefxO9wLR7idV9XlPgDybPlGEotvRuQ==
X-Received: by 2002:a05:600c:4e0e:b0:485:2a85:e5ec with SMTP id
 5b1f17b1804b1-48727ef5508mr199004905e9.2.1774871366667; 
 Mon, 30 Mar 2026 04:49:26 -0700 (PDT)
Received: from goefb.lan ([185.236.72.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf2580168sm19097566f8f.36.2026.03.30.04.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 04:49:26 -0700 (PDT)
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
X-Google-Original-From: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
To: buildroot@buildroot.org
Cc: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
Date: Mon, 30 Mar 2026 13:49:24 +0200
Message-ID: <20260330114924.1449430-1-ferdinand.bachmann@yrlf.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1774871367; x=1775476167; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IZ+6qUUkrvBdcx9BoF4TPHescyOsJgCXGySA76l4r9o=;
 b=TGSGlPx85WZX7bSDT5VG9nXkrNLiE5OMy8rGTkVhb53XoOdYTZpWOaHL7VNAErCMmB
 0mYn7zgVX3CaWUQPJs1dcYZjlEpcL7LsJjYbmQ5zViOQPbsxxSGetaK8Nf/omXdtKinI
 IW9F3S+xuCR5dNJaef9dpQU/W677VKwfg6LLgNLdobfZK+v1e3wNIvc7JiLA8tm9/nSX
 MkBvB1Z6ImUEjLVaZRK9yvlpHzQ29MY1pkj6Eij9Pt7tvMJzkrB/TvI9SNNGgRGZuNlz
 nvRy0ZZsUfuVyYiFHbsT0wwbTyUTuLWLAlfJrhQqK/6T5RWZPs09OHs8R69x9V3l6EVh
 yjHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=TGSGlPx8
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

Signed-off-by: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
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
