Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E90CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD5061B2C;
	Sat, 23 Jul 2022 21:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD5061B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPwI1ax3ttBl; Sat, 23 Jul 2022 21:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D6561B2B;
	Sat, 23 Jul 2022 21:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D6561B2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A71E11BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F31A61B2B
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F31A61B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LC-sRy4VP4hK for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:55:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A64ED61B28
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A64ED61B28
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:55:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4274328wmq.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEcwkc6CukaKyaQvKEoM2mjWb0wdqLDUqxUGanRWMZ8=;
 b=o3xuxsSiPi6MQ0neSjGawFq5s01OLTVdOUhnjifYgYFIgw43nRbB3Wmrpz+5fHMVr2
 5fbBVhumbIZiDWZbkJwI/IJuVImn2mVJfx+lFqYhPNByUvOxbhgftjnKCMloANH0O+Z4
 HQ0vOZc/Hfl+KYLqaMGeRL/BaUICHT7HuM4cTLfLtHNat4QmgUY82XRnh0fOs6oMG94r
 OWb+bK2cxruiNzPyOQsgnHlZgE8rd7oqlw7X7adhMVWikXSXKexvs7pKSwCVwdu21oAc
 PzdreBW7AlYH/B6aAd3rU2zoIVLf8Hw3YU0dkGhJwqIM3GEKzlQPACVid1XTmcBplAzL
 2xpg==
X-Gm-Message-State: AJIora+KwhL440JvnzHqKzWm9jnz1H0YBjZ6SHsDdKfc2Rmv2w6OLEFu
 42ZKWaW0iZueNU2fETsZgtrHk6Mv533YVg==
X-Google-Smtp-Source: AGRyM1t+Lwc2cUrF6UQfwzOsqA9kSi4Khuiu4yWbtw8+pQenLVI6MRpKzuZHCFA587t1DdL9F42KMg==
X-Received: by 2002:a05:600c:3004:b0:3a3:12b4:24c5 with SMTP id
 j4-20020a05600c300400b003a312b424c5mr3782812wmh.123.1658613301538; 
 Sat, 23 Jul 2022 14:55:01 -0700 (PDT)
Received: from jupiter.home (14.5.23.95.dynamic.jazztel.es. [95.23.5.14])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d568c000000b0021e5cc26dd0sm6227959wrv.62.2022.07.23.14.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:55:01 -0700 (PDT)
From: Abel Bernabeu <abel@x-silicon.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:54:48 +0200
Message-Id: <20220723215448.2532160-2-abel@x-silicon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723215448.2532160-1-abel@x-silicon.com>
References: <20220723215448.2532160-1-abel@x-silicon.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEcwkc6CukaKyaQvKEoM2mjWb0wdqLDUqxUGanRWMZ8=;
 b=gDEo+MKEcT/afx12iRad0renxwbjUPFNb+oAGFA0xcabjRxfyHMk+Go9dhJ2fs/axG
 ifv4mN2UJXZK2vw0NUrC0XEJItei9PogE2nrOJ2f3NZCQT/NhBRSPoOWFhOszYhwLing
 KzTO5cx1MxjtkZruTMaN9hIlFS4NV5PwPYSv0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=x-silicon.com header.i=@x-silicon.com
 header.a=rsa-sha256 header.s=google header.b=gDEo+MKE
Subject: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V vector
 extension on the architecture menu.
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Abel Bernabeu <abel@x-silicon.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new setting will allow to test new toolchains already available
that support the vector extension (more patches coming soon).

Signed-off-by: Abel Bernabeu <abel@x-silicon.com>
---
 arch/Config.in.riscv | 7 +++++++
 arch/arch.mk.riscv   | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..e4dc936cf8 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
 	bool
 
+config BR2_RISCV_ISA_RVV
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -63,6 +66,10 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+	bool "Vector Instructions (V)"
+	select BR2_RISCV_ISA_RVV
 endif
 
 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..07a94aa6a4 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,5 +26,9 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)v
+endif
+
 
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
