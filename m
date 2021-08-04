Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A00C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1534A60FC4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1534A60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D877C400F8;
	Wed,  4 Aug 2021 10:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYm6oJpN9_E5; Wed,  4 Aug 2021 10:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7DE740105;
	Wed,  4 Aug 2021 10:07:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA5411BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA2B84064B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHNKrZDmN1Nh for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:07:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAAB34063D
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:07:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l18so1584768wrv.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t+yHElP8kfCjbJcE1kZhCt0iF24yR8rJmliuvVsIDoY=;
 b=qWmcX3RE2pB4KQH8LLUiGH4ZZ0TnjoOKqBK/wLua4dmZJklPog2Zl6XOyL1xAN2Igp
 gqo/evyuRe+QFj8E3aGq32YTJ7b8uTI02oUmZyBskap8kaSxl2SJcSMjU/pMsuda/Cyh
 vEGiZY77AjCL/MarDawHM6Jzp99vkAnANtY6XIIXLMAw3GwSb6dhbrHki+r4bbNh1L1O
 6UTReEN2LQBXzk0t3BqQvwOA5zbiAQSN33DZh4X3D6fiyNHVs5Q4jg6q993eUAIjPo6z
 SfQDcBWnoS2ESVYWgiRuGv0jiLWMR6FuRrUFt/wV4+ZXxgkHIvaN1GFR5AUOhjPJFSCV
 9BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t+yHElP8kfCjbJcE1kZhCt0iF24yR8rJmliuvVsIDoY=;
 b=LxGi1mS/O5+lD0LmweYhB4OcneujiCtInUUTeYytYkk/SqYaG+KLen/Nmb+0+g8HTI
 xO7HHIlUwfPnQwhnKp7j86mazA2Kw4RKe/9NxlMTxLVD1HbPQlSLD1gqhsthyFserF21
 vBRFFZQuUGhgEHZxGDT+keMKw86i6qcRCMX1flhLEQPcvQXds5zjpEU/4wdLoA1h17F8
 y7LlsNrQCS6qjHPacqy4x/EX6azgrW80OWUbqn1ZcZA+h/yDm9FfAeDIsHJfKSIXkQ0J
 1LzgUl/HB1EvCdaUrJTLPCST05jG2aikQ37RQeZJIfWBDh7gFSFJS6dryArCay3Yu3/i
 qyAg==
X-Gm-Message-State: AOAM531pDo9iMvAIqkmzEQeMDEYH+DfJuUpOI1EkYy8fXcBpKaZ4zMTa
 yS8mZ/AVT/f7f5pdTcxAXlUFen9jx3vHsw==
X-Google-Smtp-Source: ABdhPJyRQyb9pDD9Zp/Y4Qa18r6qqagCLWTsWyqlF97SZxoSrbUKTgf5ITzrNq0DxbDBNo7jtpP8zw==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr27935896wru.45.1628071663930; 
 Wed, 04 Aug 2021 03:07:43 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id s1sm5357297wmj.8.2021.08.04.03.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:07:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:07:36 +0200
Message-Id: <20210804100736.931756-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbguard: needs at least a crypto
 backend
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since its addition in commit fbff7d7289cc95db991184f890f4ca1fcf8a101e,
usbguard needs a crypto backend otherwise the build will fail on:

checking for sodium... no
checking for libcrypto... no
checking for powerpc-buildroot-linux-uclibc-libgcrypt-config... no
checking for libgcrypt-config... no
checking for LIBGCRYPT - version >= 1.5.0... no
configure: error: The selected crypto backend library is not available.

So select sodium as the default crypto backend as this is the default
choice in configure.ac.

Fixes:
 - http://autobuild.buildroot.org/results/fb9865e2c65ea1dd9a657e1181a6c8c49481fda7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/Config.in   |  1 +
 package/usbguard/usbguard.mk | 14 +++++---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 58ee5c4b25..41f19dc1a0 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
+	select BR2_PACKAGE_LIBSODIUM if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBOPENSSL
 	help
 	  The USBGuard software framework
 
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 1518f92fc5..a0d1c8446f 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -18,23 +18,19 @@ USBGUARD_CONF_OPTS = \
 
 USBGUARD_DEPENDENCIES += libqb protobuf
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=sodium
+USBGUARD_DEPENDENCIES += libsodium
+else ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=openssl
 USBGUARD_DEPENDENCIES += libopenssl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 USBGUARD_CONF_ENV += \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
-USBGUARD_CONF_OPTS += --with-crypto-library=sodium
-USBGUARD_DEPENDENCIES += libsodium
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 USBGUARD_CONF_OPTS += --enable-systemd
 USBGUARD_DEPENDENCIES += systemd
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
