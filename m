Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD77ECAAA2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 19:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C8904098F;
	Sun, 28 Aug 2022 19:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8904098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwXzU2urcDOu; Sun, 28 Aug 2022 19:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC07A4013B;
	Sun, 28 Aug 2022 19:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC07A4013B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB911BF5EA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73EF941575
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73EF941575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4lOHlTPfMrM for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 19:54:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5BD408EE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E5BD408EE
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 19:54:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id d5so3337345wms.5
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 12:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=tK42Jn49zL+18h81DRo4eX6rbdZKqdoC6KJSv0FvciM=;
 b=uOrStimQ8av32VL0xoklOxbDfefdYUnM2bCDyVWxNaEIVHlz4UzwBVLCYMXT6grE9+
 0W6B0p5XxPEPxCEqIz88+u1rSluaUbOP4M2pLx4RQqH1YSBMssd1I+F3YmjA7cfMlvN0
 IpZqvpeYgQtUkTpvmwlyl31I/Vkx3Rgk5faZXLfDXK1sGp7bjztJrVRaspUKNCxvqiRK
 YvDLPOCCJADfe/QzCNZLEPJGUidjtS32Dv2I7C/QoRciQLMKbkU9/JmKR7zo+9MFa6ag
 ZgS9Unfpr7sNDU1SVZXs3JuKLpSkKn3i6cLSfUTdS9XbugELeYqZnRZNtJgCoCEE8MLq
 RnSQ==
X-Gm-Message-State: ACgBeo2bZVer7speBT8EVxikfcvLnDHXoQDYdEqTetOu5+op6qNEb8QB
 PzwMhw0w1qyi+uRL/Zg3ww8+AzIjQyM=
X-Google-Smtp-Source: AA6agR6rQUVXZcaSxurtNRz8w38zzgiO00D5HzUiefQ2t8GVw21fKGF3NDD9J2SBnkFJUuRuegFHmg==
X-Received: by 2002:a05:600c:19cb:b0:3a8:4622:ad3d with SMTP id
 u11-20020a05600c19cb00b003a84622ad3dmr1063171wmq.37.1661716486496; 
 Sun, 28 Aug 2022 12:54:46 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600c354d00b003a5f4fccd4asm6770631wmq.35.2022.08.28.12.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 12:54:46 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 21:54:45 +0200
Message-Id: <20220828195445.3354590-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=tK42Jn49zL+18h81DRo4eX6rbdZKqdoC6KJSv0FvciM=;
 b=euoEhyvd6l6YbaVeE+XnYGAOjZwWmvgdfZ7ulITGf+Dgr3+dGDCuoJTT2fKnxo0XEt
 Mm8dJyNvnlV0utfF00GMBsvaC8EAPCdciMIQhiyXy/DIB9F13PMIkqlCw5NCMoGl99bC
 eOudalYIBkc7oYS89JxUBtwzWoUb2sga1PSLjqL1WspMN0dAmViazxpMANteqvAgTins
 p46Rfmuk8D/M8UeQEXRUwhiXYi33UauujnDBWCbePO6qdRP+rLHYmn/cIfWg5bB6g9oY
 6ToMTwxo+/aQc1Mdy6eOB/VSmdNptA6utghvrxscoZkg/Prvjhu8rqHVDrDBIKJfc/Wd
 YtJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=euoEhyvd
Subject: [Buildroot] [PATCH] package/mbedtls: use pre-configure,
 not post-patch, hooks to configure
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we use post-patch hooks to apply our configuration settings.
This works, but this is semantically wrong; post-patch hooks are there
to amend the source code to actually fix it (i.e. because it can't be
done with a patch for example).

Configuring the package, on the other hand, belong to the configure
step, and if we need to tweak the source code for configuration
purposes, this should be done in pre-configure hooks.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 1a888e8c67..49ea7886f6 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -25,7 +25,7 @@ define MBEDTLS_ENABLE_THREADING
 	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
 		$(@D)/include/mbedtls/config.h
 endef
-MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_THREADING
+MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_THREADING
 ifeq ($(BR2_STATIC_LIBS),y)
 MBEDTLS_CONF_OPTS += -DLINK_WITH_PTHREAD=ON
 endif
@@ -49,7 +49,7 @@ define MBEDTLS_ENABLE_ZLIB
 	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
 		$(@D)/include/mbedtls/config.h
 endef
-MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_ZLIB
+MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_ZLIB
 else
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
 endif
@@ -77,7 +77,7 @@ define MBEDTLS_ENABLE_DTLS_SRTP
 	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
 		$(@D)/include/mbedtls/config.h
 endef
-MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
+MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
 endif
 
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
