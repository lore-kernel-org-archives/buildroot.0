Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6568CECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 17:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAF5F4059D;
	Sat, 17 Sep 2022 17:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF5F4059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eu1wJci4KHHJ; Sat, 17 Sep 2022 17:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49A07400F1;
	Sat, 17 Sep 2022 17:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A07400F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A97071BF45A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 17:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82E8741D96
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 17:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E8741D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXwmGSB33M88 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 17:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89CA841D80
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89CA841D80
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 17:15:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b5so40715137wrr.5
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=uByOfJrqahwZgCFtVMh547FaTw8kzamJO9r8tRRNa5I=;
 b=oPJH2FQVpoedsbV7m812McACjDVr5f9h7iQLk/tjmv58Z3GwXy00/8se5AMGbhPofk
 mDVHUx3swYC9KQQeOkdOC+VDiqfS7mSqOd41pCiO0XlmOm1lxzowvpeYEly6gmWi+CGa
 zDKZmhliJ1zYRUaA7cCGc9ljwCbZNQTWKyM9lot/I5/h+18XNFWbUiPdjs7nj9y6BtN9
 ao3dy87C0qvGyR6FmKQ6puC8cZgkumjUX1wI6Stuq5qubZSXWrVEMIHNnhRra6GglAqx
 leZJDEeHkNhTIaeqPqLBY9OL4FbXVUDDpcxBJDGa7UcllHoiN5KB5gTYwgN+FLJ91/Vg
 BZyQ==
X-Gm-Message-State: ACrzQf1t6mjLdieS2C3xBY9K2fsG3ir+oQ62LHSlzvVjMuL5sRwkeh38
 +CMG17esilO4WjB1Ij2FOR3Gs9LJxX0=
X-Google-Smtp-Source: AMsMyM4UnE69e/LPum33SQyNyvyWn6xEK5KODxCimPsRsBMuWsA3BunRNQcnJgJAHQA5cxTpXLwd7A==
X-Received: by 2002:a05:6000:1448:b0:22a:e419:f7be with SMTP id
 v8-20020a056000144800b0022ae419f7bemr4023794wrx.715.1663434952169; 
 Sat, 17 Sep 2022 10:15:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b002238ea5750csm9901265wrt.72.2022.09.17.10.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 10:15:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 19:15:45 +0200
Message-Id: <20220917171545.130430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=uByOfJrqahwZgCFtVMh547FaTw8kzamJO9r8tRRNa5I=;
 b=XK6b23hkeFeQRPJB5dPquT7O7HbUH6YwNY52yrKX22iPPakCjf4P6+jYHryi+8+m4W
 xlYzG6jlR1ReKqx1gMQzuj83wwnREV1oFNz7w4Wf6N/kZv2YLipzj0Iwqai/BOSUt7SY
 tsvljO2YJK+aP1vzTiJXpFzgUPY31jI/Fm7X5VLdKK7hsBYnWEwhRuugFOTAHFz7wI4L
 d/KceUu+PnWH5EFBLsuFQv/s0UzuQa3Jlqq6qdsGE3DayNVM9CZKhjVaE0ErxD5+yX+Q
 hluyKDJ1f7it5rTR3SaPKHuq8KxTg8CUhqk1ka+1G5lp60u7+xJriZUDhf39tguj8xMC
 Pfmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XK6b23hk
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump to version
 1.29.0
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

Drop first pacth (already in version)

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.29.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-core.c-fix-build-without-slotevent.patch | 37 -------------------
 ...-0-does-not-have-DSA_meth_set1_name.patch} |  0
 package/pkcs11-helper/pkcs11-helper.hash      |  2 +-
 package/pkcs11-helper/pkcs11-helper.mk        |  4 +-
 4 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
 rename package/pkcs11-helper/{0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch => 0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch} (100%)

diff --git a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
deleted file mode 100644
index 5b2829c5ca..0000000000
--- a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 754911f553414a77d5b52001f5ef6e3a1314c4d5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Mar 2022 08:50:15 +0100
-Subject: [PATCH] lib/pkcs11h-core.c: fix build without slotevent
-
-Fix the following build failure with --disable-slotevent:
-
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
-
-Fixes:
- - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OpenSC/pkcs11-helper/pull/50]
----
- lib/pkcs11h-core.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/pkcs11h-core.c b/lib/pkcs11h-core.c
-index d7bb4cd..0bf11e8 100644
---- a/lib/pkcs11h-core.c
-+++ b/lib/pkcs11h-core.c
-@@ -726,9 +726,11 @@ pkcs11h_setProperty (
- 
- 	switch (property) {
- 		case PKCS11H_PROPERTY_SLOT_EVENT_HOOK:
-+#if defined(ENABLE_PKCS11H_SLOTEVENT)
- 			if ((rv = _pkcs11h_slotevent_init ()) != CKR_OK) {
- 				goto cleanup;
- 			}
-+#endif
- 		break;
- 	}
- cleanup:
--- 
-2.35.1
-
diff --git a/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
similarity index 100%
rename from package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
rename to package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index 4114378ab8..0614e8aed4 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5bd55adafdbb708e096070dd0a910f23e1d5fd6291922398c1a15f00fff2b5ec  pkcs11-helper-1.28.0.tar.bz2
+sha256  996846a3c8395e03d8c0515111dc84d82e6e3648d44ba28cb2dbbbca2d4db7d6  pkcs11-helper-1.29.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index f8fe54ecf5..d1a1e38d4e 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.28
-PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).0.tar.bz2
+PKCS11_HELPER_VERSION = 1.29.0
+PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
