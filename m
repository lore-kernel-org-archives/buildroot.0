Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C65C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 07:20:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CC460F35
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 07:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1CC460F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE756072A;
	Sat, 31 Jul 2021 07:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GymsEAcNO7ET; Sat, 31 Jul 2021 07:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DB1606FA;
	Sat, 31 Jul 2021 07:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14BCD1BF873
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 07:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B68404DD
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 07:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mt9XUOO2W9Ys for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 07:20:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 126F6404D4
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 07:20:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso395417wms.0
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6kV+yYc0xglQVwbLwpGqQ5UA5y4i19e8O0kVhFnLL/c=;
 b=lxiStLji0pRkcrTvg8m+c6RGsI0o34pNz68k///fPuNykZyQoodsA0cJ+H9zD4DvL1
 +V7Cl0FoDCvDeyCT9D2R3MN4yZBAqJcZtv7SrbySE5rbJwvwetCLHJnleXmpnRkN2e+d
 yOZNxXVCmMiCAWWkv+kBb2UHJvj2Xdcl2Em5uSZEs6QjI2ZKL42bMdTpm/ocHyUFOxjr
 zfHhuOF2oNWWGAfzcfRJf0AfhB1DD+ZDgUbYu/1yFB18WqM8xyFqzvuAIqfWRaLuPSNV
 bjPVn7DqZTlx5NnFeesNUx3P+GP598HIa7c4YLwuNpWQIkk3OKTmHG8+LdVR6tRycrvQ
 +G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6kV+yYc0xglQVwbLwpGqQ5UA5y4i19e8O0kVhFnLL/c=;
 b=SxFdI4CxxCmwFDQmCT45/Se9sWjIJvHR30Q1CYGr1FWlK/lFw9gx7AbtSWc4+uhIzU
 ovpZTpFvxTROWfecX3wsrUCXYbOjdPBPDMbSUyk0fJz7zrze0b98RzpM9l8iNwTxKf4u
 eoy/RYx9pmHi/mwdf2mLb8uNUW27Xl4o81zfyrrhHUsYnGezWIZ2EuoIIGtDUYX/Uy7x
 GKcTrpLIG+doTn8GlzB5OKKq8MF8maR/wHFOdd+2hGgHMYXWfZaoD0TNHh1nnmMllu64
 e+ACxuQY71+en5M9vXW+lmw9DFeyj02+7WaleMXagDUZiRg1DRX9dgtyyqHjbgcr6Cfi
 v4Fw==
X-Gm-Message-State: AOAM532qALYst+DZm6Uxcbsf25BykvQnnLA9fmxCIMDxWA8R/6SrmZP2
 jxSR3+ruNUjs1b7NcQcpjzZ3xSxDPZ+JYA==
X-Google-Smtp-Source: ABdhPJx2+znCB9mIxC/jhM/0Uq5tra4kAj8j7UHRQ0r6Q+K4hDd1EBORcFWIEfc/CnKVsahFxqC0/w==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr6945922wmj.148.1627716037983; 
 Sat, 31 Jul 2021 00:20:37 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id k1sm4010066wrz.61.2021.07.31.00.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 00:20:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 09:20:33 +0200
Message-Id: <20210731072033.252992-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build with libnss
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build is broken since bump of libnss to version 3.68 in commit
0a73b9b962421ce7a72c88e5f5bbd8849f21b041

Fixes:
 - http://autobuild.buildroot.org/results/1e8113d638fcb73538329511eeac9f5e7cb04d6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-nss-use-nss-pkcs11-h.patch           | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch

diff --git a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
new file mode 100644
index 0000000000..d0b573446f
--- /dev/null
+++ b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
@@ -0,0 +1,62 @@
+From d159a5c59c80552c3e8ea75d9bcf29b3a8e8289d Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Fri, 30 Jul 2021 20:06:36 +0300
+Subject: [PATCH] nss: use nss pkcs11.h
+
+make nss happy with its own extensions and non-standard behavior.
+[Retrieved (and updated to remove ChangeLog update) from:
+https://github.com/OpenSC/pkcs11-helper/pull/39]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 |  1 +
+ lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
+ lib/common.h              |  7 +++++++
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-nss.c b/lib/_pkcs11h-crypto-nss.c
+index 4b70e826..f57f9e6b 100644
+--- a/lib/_pkcs11h-crypto-nss.c
++++ b/lib/_pkcs11h-crypto-nss.c
+@@ -48,15 +48,21 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include "common.h"
+-
+-#include "_pkcs11h-crypto.h"
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
+ 
+ #if defined(ENABLE_PKCS11H_ENGINE_NSS)
+-#define _PKCS11T_H_ /* required so no conflict with ours */
+ #include <nss.h>
+ #include <cert.h>
+ 
++/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
++#define PKCS11_H 1
++
++#include "common.h"
++
++#include "_pkcs11h-crypto.h"
++
+ static
+ int
+ __pkcs11h_crypto_nss_initialize (
+diff --git a/lib/common.h b/lib/common.h
+index 61a958af..2499e9c5 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -72,5 +72,12 @@
+ 
+ #define _PKCS11H_ASSERT		assert
+ 
++#ifndef FALSE
++#define FALSE 0
++#endif
++#ifndef TRUE
++#define TRUE 1
++#endif
++
+ #endif
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
