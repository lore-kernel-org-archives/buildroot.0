Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8B2C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD27461053
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD27461053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7E5C400C1;
	Tue, 31 Aug 2021 19:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWZLDhdHXuCY; Tue, 31 Aug 2021 19:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3EE8401E0;
	Tue, 31 Aug 2021 19:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE031BF362
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF883406BD
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRYUo0b5Hkcc for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 19:27:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D45BE40580
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 19:27:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so240073wms.4
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 12:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZuR4MGK/+6a8Y5Mw+hcAuhH7vmf1SVa49WL7gXLWbRE=;
 b=YpxAzKSf4TkAWNN0CREFwBt6DjTI5VuOjk4VVNZ0ta3IdbauszTQ0osi54+hZYA8Dd
 AHaHDlbuAHQTtO1tVXqkSiuFyMnfTNA+fRO5Nif7y+KCiJqFIToQY6gJ1URAKgCmQ3nl
 S/SfjAnbT9iwEDX3IQ52n+Cfdd+a2mypDkA/tDtf63c6yLZ/T0boqa8PJe9wgyJto4FK
 3J7uzu49J+rjeASvgvZQN6hQmb0C42VsH4i6Q5fJZxdyBuBLmkI++LxdG7BqNiIlzdTV
 ns968fnSuhFS6qAnQSqqlXMGnMq7TRCIgWk+qJEBqb7gFl5zjuYcpwqQ+aAplhnQgVyL
 m6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZuR4MGK/+6a8Y5Mw+hcAuhH7vmf1SVa49WL7gXLWbRE=;
 b=ZirfF1z3EzEKd/FomVbEYs/MryRD71umKHGkb9q/fWLN08bKClk7kpDE18QO+2IkJG
 u3Qs9KpWs0QaJ7YExEMzHRqV6KYfbZRhrAggNROm29eu7CPocjeKonPZDwJN5Cs1k5jW
 swwjqQNBA0ZAHugs9SE1QlI9/O46cGQR2M7rdLKzVg5UaYIAc1UOKcDsLK04zjx92oM2
 JfcIrWovo3PuhTMWHU63IcVP/+/lZM+KVggVaf6aG8wvHhkTFjvRKjBP4uF3iUSPFFtt
 8MpQrLLUfUW7EdOllX7Ap8fL0aB+51c5RiL41WJSDrXkddx3h6yQxJyT04jPhmtl7jQ8
 87DA==
X-Gm-Message-State: AOAM533sQoLC6e+ycnpcBN5jTAMn4kKuRCp++wsuskanrP+cO7HLE388
 tee1W1+T+GGQHVcoRlzpS8b06eiVXM8=
X-Google-Smtp-Source: ABdhPJygki6kpMHV/ObjyeneupYb7cZsNx8cVKh3Bpz7ObAU47M9NEySaOlKXAv1LExAHP3MBh+ryw==
X-Received: by 2002:a1c:2bc6:: with SMTP id r189mr5796232wmr.183.1630438072209; 
 Tue, 31 Aug 2021 12:27:52 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o12sm3274929wmr.2.2021.08.31.12.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:27:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 21:27:29 +0200
Message-Id: <20210831192729.407412-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831192729.407412-1-romain.naour@gmail.com>
References: <20210831192729.407412-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [for-next 3/3] toolchain/toolchain-external: update Arm
 AArch64 BE toolchain 10.3-2021.07
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to gcc 10.3, gdb 10.2, binutils 2.36.1, glibc 2.33.

Remove BR2_TOOLCHAIN_HAS_NATIVE_RPC since the support for obsolete
RPC was finally dropped in glibc in 2.32 (2020-08-04).

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-aarch64-be/Config.in             | 3 +--
 .../toolchain-external-arm-aarch64-be.hash                  | 6 +++---
 .../toolchain-external-arm-aarch64-be.mk                    | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index bbd6a0703d..783ed35314 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,12 +1,11 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2020.11"
+	bool "Arm AArch64 BE 2021.07"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 8e67a96599..1079917c98 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
-md5  5da75bca337de5adade5b339709f8b16  gcc-arm-10.2-2020.11-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
+md5  54cbaef7db7eb3de27732500f9da9c6f  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
 # locally calculated
-sha256  78a472aeb80f6ff56bfdef57ce165b233bac4af7aa2e12f454900518a30ddf20  gcc-arm-10.2-2020.11-x86_64-aarch64_be-none-linux-gnu.tar.xz
+sha256  63c34cac07ceadd74620ea87f27af1aa6a6f55c20a5bc116af21a59ddb6b6a6a  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 384fc2efc5..5a6dbc60d5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2020.11
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
