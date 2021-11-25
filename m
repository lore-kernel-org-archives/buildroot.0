Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F1BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6099460D6A;
	Thu, 25 Nov 2021 12:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o41zyhntjcjQ; Thu, 25 Nov 2021 12:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE29960A62;
	Thu, 25 Nov 2021 12:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1F91BF30B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EDA5827AF
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Q4EfEscO98J for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:56:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B497D827A5
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:56:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b12so11460155wrh.4
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5syR9w73I2GkSSW13OoXI4cVksEQwWqBNqCk4qnlbc0=;
 b=l7QKc6wJZ2dgtnth6wzoNbHYn1+CaoTThjSL5COgoEkQR0zM6mseBJ/tAevaS9rV7c
 gg823AxDGg/xZIatfOWqz8De/8M8oado+J9stvbeBbtuAGpT6UXVk4cXu1iVkCNLfLcS
 wjHWeqzf/RYNPW6fSmHCKfdumzKvtyt59O9vxPGC23lEEYAaE4CZa9fyVMwN9X2HtI9I
 Lhw3bs+wnUHr5xK6g7JSiYHaD1OUecXyMw/9fjUuMoyQwiBk6d0VgtlUNZ31BilstOdM
 NvcUZhb/AHvbAOyK10hdvylbzWLzLy1lM9IPKEQ87dqFQYODfT1zYeUY0FC4tef4/H8s
 k8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5syR9w73I2GkSSW13OoXI4cVksEQwWqBNqCk4qnlbc0=;
 b=usI41fpVNjCn/cRapazB/CK2lR8JDfLltlClpTPvSYYiT31gBRSm5DISMuAsf9td1j
 SOEYYI2RKmNBEO0yS9mxgu6i42GTprX2YpI2r1M/zL8feWzsIFPVYYRAS/jqxhpzlrCd
 HmYKUXC7Oga5gYZC4fe/zS9CV4x49UlvGg/r2dYAzY9y2DQcbHBck58gg3zqgnWRIDix
 Jz8RTGEtLJ/3Qv8JNyJW2hmaERFm6ep39jzDh9CasW+O+r+0IabspjR9xP/WxVm9BPHA
 RdIC4MUOWhaY3mrVfzKUf+bMXjj+z7o5DIMqtH0xeW1qlEPdTRIwJFHNsIIQ5oA6sbCM
 CP8Q==
X-Gm-Message-State: AOAM531X9/TtLGZEKhRpqfnE66y4VjJYFJNArQGJzYy8zD6UbEDPdqR7
 0k+OdpfCz/dh2MtMVQbQTPhpG6eVM5A=
X-Google-Smtp-Source: ABdhPJzbgEXC0ytq8eKV9l506gJ86KfJnxAjal0eirZMX6+lsQY+GXM/aheXFRZ24ut8GwFRs8SqbA==
X-Received: by 2002:a5d:67ca:: with SMTP id n10mr6182063wrw.246.1637844973712; 
 Thu, 25 Nov 2021 04:56:13 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810c:8d40:ec0:e54:15ff:fe38:2651])
 by smtp.gmail.com with ESMTPSA id r62sm2909178wmr.35.2021.11.25.04.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:56:13 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 13:55:57 +0100
Message-Id: <20211125125558.1087094-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125125558.1087094-1-heiko.thiery@gmail.com>
References: <20211125125558.1087094-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/libyang: bump verstion to 2.0.112
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/Config.in    | 3 +--
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 6 +++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libyang/Config.in b/package/libyang/Config.in
index fec1160a6f..54df061b58 100644
--- a/package/libyang/Config.in
+++ b/package/libyang/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_LIBYANG
 	bool "libyang"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PCRE2
 	help
 	  Libyang is YANG data modeling language parser and toolkit
 	  written (and providing API) in C.
diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 755ecf390a..c129896a63 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8576cad398b451b1c622b0652a2030fcf83ee1d9a39e6cd93d17b0a5a43118d6  libyang-1.0.240.tar.gz
-sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
+sha256  184dd67c66c1ad968a2ee4d0950fb6b103834917b04b17af9c7bca80967636ee  libyang-2.0.112.tar.gz
+sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index f784367ea3..7de9531bff 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.240
+LIBYANG_VERSION = 2.0.112
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
 LIBYANG_INSTALL_STAGING = YES
 LIBYANG_CPE_ID_VENDOR = cesnet
 LIBYANG_SUPPORTS_IN_SOURCE_BUILD = NO
-LIBYANG_DEPENDENCIES = pcre
-HOST_LIBYANG_DEPENDENCIES = host-pcre
+LIBYANG_DEPENDENCIES = pcre2
+HOST_LIBYANG_DEPENDENCIES = host-pcre2
 
 LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
