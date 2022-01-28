Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F556C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95AE1405D0;
	Fri, 28 Jan 2022 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_zNzruTwn_2; Fri, 28 Jan 2022 21:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F3340147;
	Fri, 28 Jan 2022 21:52:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EC811BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A6B3408C4
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsZQE9zBqHVQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84708408C1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:52:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m14so13104179wrg.12
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 13:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FZPC4T1HbKtlwZklV6x/s3CSsOMCeAj9xUB1FupHUk=;
 b=Hd6biAPuOfWoXuNr0PAEt5ydVi5qL3y2UCOmPBCkmsnmVpLUfLw/AoOxDgOnlD4qEJ
 LKFnttPXTROtEwKn78h7QPm6R7iEmEF2Khu8rUOPz58JpERiT6+T82DDGc+5RCd293cx
 8HVvpiWRVfebvOMRbnpYhvWqBkzZAe5HcqoFy1s8q/aKmooh1WeRYyjPe0GxeHAg+H3x
 m5qSkqFsnEIkHv0ofw7w7QFFcNjNa+c5WNkEs5bYyD3n120foWV8LH6Q9C/dU1GQr6wB
 nmvoUkYhm6PCISDwgsX+OJY7WgDK8GLj8B9HatBsyZIPGD6ZtbxbiyonFAIVhO/dS3vA
 cNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0FZPC4T1HbKtlwZklV6x/s3CSsOMCeAj9xUB1FupHUk=;
 b=DGzxlMIejpt2fXyrAvbzAjybmjlfhJc++jvj32bnp2JZ7jl5anOd2Vrt8O9crvyXZa
 049COENr8U/yb8fLN1hvSUG2zOinTLm7WpIHnIubswOUZpric1DYTgZ5mQ7rSLhYzck7
 dT4eus78UQ6YuGHH7It47WoVw5yCUUmw4Mez+Zt3NlMafj/vREiH62I2L5nNbqUKg5Tv
 zd0ChR376tkhQxS+V2BAR1ltj8acSmgtvXCks5wVyzHgMmy7/mMeET0ZPGdyQPjnAQuu
 JS/wvS1kWGhov6Asp3HRH85aRS1/J/aWf7ZyrhWCZirW0lLgFsV/1N+s+uCu7WCN36d+
 ypxg==
X-Gm-Message-State: AOAM53284nESmocWyHYm3/g2+22wMC/rm9wTgw5/L/GGYbclbdUjksgZ
 QON/9m+LkTyVQZerTk1UZg/zgcafewI=
X-Google-Smtp-Source: ABdhPJyC8JFE/VtWFDAqwyNVA18MnCeUt/buEzL6O1pQCBm9LyPDIFm286l1nKCMKX8U6g481xe5wQ==
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr8437513wry.491.1643406731596; 
 Fri, 28 Jan 2022 13:52:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id z1sm2783463wmk.32.2022.01.28.13.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 13:52:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:50:13 +0100
Message-Id: <20220128215013.2997212-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128215013.2997212-1-fontaine.fabrice@gmail.com>
References: <20220128215013.2997212-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/pkcs11-helper: bump to version 1.28
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

Drop patch (already in version)

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-nss-use-nss-pkcs11-h.patch           | 62 -------------------
 package/pkcs11-helper/pkcs11-helper.hash      |  2 +-
 package/pkcs11-helper/pkcs11-helper.mk        |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch

diff --git a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
deleted file mode 100644
index d0b573446f..0000000000
--- a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From d159a5c59c80552c3e8ea75d9bcf29b3a8e8289d Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Fri, 30 Jul 2021 20:06:36 +0300
-Subject: [PATCH] nss: use nss pkcs11.h
-
-make nss happy with its own extensions and non-standard behavior.
-[Retrieved (and updated to remove ChangeLog update) from:
-https://github.com/OpenSC/pkcs11-helper/pull/39]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog                 |  1 +
- lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
- lib/common.h              |  7 +++++++
- 3 files changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/lib/_pkcs11h-crypto-nss.c b/lib/_pkcs11h-crypto-nss.c
-index 4b70e826..f57f9e6b 100644
---- a/lib/_pkcs11h-crypto-nss.c
-+++ b/lib/_pkcs11h-crypto-nss.c
-@@ -48,15 +48,21 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#include "common.h"
--
--#include "_pkcs11h-crypto.h"
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
- 
- #if defined(ENABLE_PKCS11H_ENGINE_NSS)
--#define _PKCS11T_H_ /* required so no conflict with ours */
- #include <nss.h>
- #include <cert.h>
- 
-+/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
-+#define PKCS11_H 1
-+
-+#include "common.h"
-+
-+#include "_pkcs11h-crypto.h"
-+
- static
- int
- __pkcs11h_crypto_nss_initialize (
-diff --git a/lib/common.h b/lib/common.h
-index 61a958af..2499e9c5 100644
---- a/lib/common.h
-+++ b/lib/common.h
-@@ -72,5 +72,12 @@
- 
- #define _PKCS11H_ASSERT		assert
- 
-+#ifndef FALSE
-+#define FALSE 0
-+#endif
-+#ifndef TRUE
-+#define TRUE 1
-+#endif
-+
- #endif
- 
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index d707bcf914..4114378ab8 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  653730f0c561bbf5941754c0783976113589b2dc64a0661c908dc878bfa4e58b  pkcs11-helper-1.27.0.tar.bz2
+sha256  5bd55adafdbb708e096070dd0a910f23e1d5fd6291922398c1a15f00fff2b5ec  pkcs11-helper-1.28.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 90929404be..4fc3e21e5a 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.27
+PKCS11_HELPER_VERSION = 1.28
 PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).0.tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
