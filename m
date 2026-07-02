Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C52EC43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 19:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BA880AA2;
	Thu,  2 Jul 2026 19:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPtD7JSRw8wO; Thu,  2 Jul 2026 19:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD23828A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783020312;
	bh=xNu5Og/9TAw8axllK95rDJdPUvDfj5h58deXZtBMWNc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DCq5MqIR2i6AIWkeBgAwHdlm0aSUDXQMH949TuoCEgFQh1W5/akFVxpeb7Hg1L41d
	 i7dN0HBElqiNQFeEtZghA5wcg0E+Kjv5MxhCwOy5AnIEA4imfwORg440WIzljapG+T
	 kCH/penW52Bzz8ijrZTta7eQZDYBn2MRlC/n/j0UFPhGQyHiR1+Tp2vVAkRi5D2wc3
	 DDm4gkUoaubvc5BpVKpM3tWaJc7KbcWF4syQ/I7O9fRZEejbM2FS2jAZJdbK0Oo81w
	 yRZuhLmFvLQncnEN2HK0TaDa4lhxfvstS1K6ORauCuti2t/w28YlzEOdtqkNXog3vY
	 P2uCQ8+sB5wgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD23828A9;
	Thu,  2 Jul 2026 19:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 462EC14F
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37F224025C
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 19:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qV6G6vH_v_9 for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 19:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 781AE401E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781AE401E7
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 781AE401E7
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 19:25:10 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-4414d76270cso1216024fac.1
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 12:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783020309; x=1783625109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jhfgQT34Ppoo/UQvrfaJPnFStxfMCNi9cGhxM8sibE=;
 b=X6wI68yze5CYh0QYaH9o3uus2iZvwfdpaCl3VtUKQlDyoymkVbsrBCUYraOtzI9naH
 EevUt2WYXMy47egI5yFn5a/YIvn5xrxAjuNE+yrNq2ltnngi4MjvoUl7TB+G2B42f9Tt
 e7AMIzzpWfbUQxdzyuA0VyG+iBLk1ywTCpyVtSQGRCFc2dPYb1YWZwJ7iQjwdRFm6UOx
 D2wcvnantyDh8biPolCBPBKkWX5+PQR54fs3cW/7TbGo0JlfvE1P5uErtlgknEkYtati
 o+aHB5Cu69OA8P6aayA6SfqDgirNt0Vlh10GCLe6BcXXHTmughfzptK5yihy8tKsE8YS
 GB/Q==
X-Gm-Message-State: AOJu0YwmgboLbUrSJapRZdsTYaqYfux/09bfkPVvyLOn7lhCR/g7EBUa
 aaQXv3Ry8yFlVSj68wAE0R2a5hTuAsjrTbYnNoiIoqmaJCMplNcBgKnXrFghyX68E+zO+Q==
X-Gm-Gg: AfdE7cmdxovjtYUORlOnuMm875UWWaMN3IkOMtj3TRlxsKLYCfr0yImRmozrhgzL0m6
 VQsbfoZ/vngDwbba1JEekjMvyI9WvmzRCc5kx0c7GU2V1kSQTXpLuvvgAmfAf2nAJ+K5Xc/nADr
 Wa4BcACA91AAyw0lxxLIWZuBh5UPnbRbJwSDKosuz4BnCmTva5lY1x4LRBfq6PnJ3Dw2iCH9a3h
 Cu3GQclf3K33aR38twTFq/PtR6ITVjFmc3Utb6kM8P4CmClbuAWckCXZBqJPRxVosFtU4c0ndOy
 0LvGhkC7si2WRNd206ADW+G2ozTbhnWBYbnXlJgDQvvYTLmpsoCz6BacbOwPqTSO8BeyURFkwEw
 Q+d+9+wZ3hEtuejlOY0+I2LUIvxOupCWGciV3PWaqndhOW8KI0E1P3pNVmMPVFT6wUgdM4m0ljQ
 NKu49Z6UNQSOI0bMGH8d2H6fQd6udI2hx6i05oqdbyNmRpoqyOfJhzEUiLSs/lR1+EETCYbEUaK
 A7BT2wLNfJdNp3I7scTDvql/tMnWOvBql31EJ4CG6RYj/uqLRb7stH/Vn9bxhElajbClZH8gLP/
 s+2MAgoy6e96N0M=
X-Received: by 2002:a05:6870:2190:b0:448:558c:d832 with SMTP id
 586e51a60fabf-44cabc24b43mr4426824fac.43.1783020309084; 
 Thu, 02 Jul 2026 12:25:09 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (97-118-25-163.hlrn.qwest.net.
 [97.118.25.163]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-44cbe30fd01sm3507514fac.0.2026.07.02.12.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 12:25:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  2 Jul 2026 13:25:03 -0600
Message-ID: <20260702192503.2620185-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783020309; x=1783625109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3jhfgQT34Ppoo/UQvrfaJPnFStxfMCNi9cGhxM8sibE=;
 b=lKloZ0/KaIhUXcaGhPU96gZ3MU69LNY99PoBZvQ/HCMQcyKh0M1Y+dD4jhDpprpY3R
 cbqP1+U4SiWJZe4wCEYU8B9IHLL6OLLhdsMHNq+KQDTl5iWwKwz9nyqK+Ijb5UvO++Bf
 uYzQMILMCSs/LTxnztthUvo4ywAUzCdg9JpGfUm69UbkbaseJaDfZ+uwH3vsVcF9qI7+
 RpTrntTKjm0XpLPXddyQqvUNXjo9EX6QyYiBkDx7x5muBTEFl0ChV5NHrUZTkxn8kVsO
 57Tskmk+cEHNCGiO4PRvmdZaAYqmbxL6ueof+JMluN38bVpx6vNQvHJ9aX6cn57Q7hSR
 nHBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lKloZ0/K
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix host FIT signature
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

U-Boot host tools use the tools configuration namespace when code
calls CONFIG_IS_ENABLED(). With USE_HOSTCC,
CONFIG_IS_ENABLED(FIT_SIGNATURE) resolves to
CONFIG_TOOLS_FIT_SIGNATURE, and CONFIG_VAL(FIT_SIGNATURE_MAX_SIZE)
resolves to CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE.

The host-uboot-tools package still generated the old
CONFIG_FIT_SIGNATURE define only. With FIT signature support enabled,
this leaves the host signing objects built against inconsistent
configuration and breaks the build with missing
checksum_algo::calculate_sign members.

Generate the tools FIT signature options needed by the host code, and
pass CONFIG_TOOLS_LIBCRYPTO=y so the OpenSSL-backed signing,
verification and cipher objects are selected. Keep CONFIG_FIT_SIGNATURE=y
in the make options because U-Boot's tools/Makefile still uses it to
decide whether to build fit_check_sign.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/uboot-tools/uboot-tools.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 6b5554da9b..ef8bcabbd9 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -126,7 +126,10 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -142,7 +145,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(HOST_DIR)/bin/fit_check_sign
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
