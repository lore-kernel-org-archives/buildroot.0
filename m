Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BBFC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3723C81E87;
	Wed, 27 Dec 2023 10:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3723C81E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZulGyovsHPn; Wed, 27 Dec 2023 10:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD0781E95;
	Wed, 27 Dec 2023 10:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD0781E95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23EF31BF2A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 10:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0FED81E96
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 10:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FED81E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7aYj1LOxQAgH for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 10:56:19 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECBA581E95
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 10:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBA581E95
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-336788cb261so4619108f8f.3
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 02:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703674576; x=1704279376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HZI9FdN7jwNG6fbrhKYAaKFvbFkx8xAt96B+J/6rT6w=;
 b=o2KCQnnPKiefeOPHspheH0vY2TgLZ5dRnGrddEDEegHJdTpgrmi2BUC6/4SuGMoTt8
 UNEHog23ZwocCW6R+W8ymy12VJBQbzSz7Su9fVYMYudC+ZhEKR/1SRERI1VR/TxAW9m0
 Sfw4WawABaMr7/9L/KZJomZOujHdZ6eaKFDSX4pIpPldhkFSweIt4a0XxbW3AgFbEL7h
 48YnQwhqDHNHDGDwyihmA6zqroVb9DrsX4RRqKwE2SUP4J9mhYe/fRFOlsUrkmLqUiGa
 6JbDf+FWioJCRcO4yS3Ktu4jpqISjj0VcFWQio6w452r5ooIXRmNA+EyIHBjiF8pOO+D
 KwzQ==
X-Gm-Message-State: AOJu0Yzbo0aGHDQk7YSFHwXpS7J4jehKLKANnKQ/+X6tX4B6syEsQ1ps
 /fY6+aRkhvgFnAgNMQnp30qqHkpBXS4=
X-Google-Smtp-Source: AGHT+IFGsox87cKhWCpMGLPLtuhAb9Z7mCPk2sN9GCmk71Q/qm0p/i36qkOE66453SEo85z0b4Q9pQ==
X-Received: by 2002:a5d:648d:0:b0:336:c291:24a6 with SMTP id
 o13-20020a5d648d000000b00336c29124a6mr2052436wri.141.1703674576284; 
 Wed, 27 Dec 2023 02:56:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q28-20020adfab1c000000b0033690139ea5sm12199885wrc.44.2023.12.27.02.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 02:56:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 11:56:07 +0100
Message-ID: <20231227105607.1010960-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703674576; x=1704279376; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HZI9FdN7jwNG6fbrhKYAaKFvbFkx8xAt96B+J/6rT6w=;
 b=Ln4PwHq06D7i7Va34O/hMhKKOTwRjr2qySToI7sVCRQ7C5UHqhK+ywIfpDoUtzOdUL
 ZBUFiY4uIg1w7we5Bk3zD0BjavN7FKZW5jZMZyUqo+7HwRrr7/AGmZlLQmZ5s09kcBip
 1JzweHfYPNp4RWpaTn2ZgyTxuDWGA/TZLJVJR53da4On4tppRMTRI3dbLvy/gqGXSSv1
 4LdVVkH85J+bZcMm3Gg/J/7RvcpScJWvcKerfiR77vkENvqwV3toPwelHKyBL1GXxmmJ
 +5mqT8pxTwm5mOT6lbl2UsJcasBx8zQJZ4/RxGge05ib84XH391ubrCnAjdoFIjmVDp1
 qE9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ln4PwHq0
Subject: [Buildroot] [PATCH 1/1] package/libostree: switch to libsoup3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsoup3 is supported since bump to version 2023.3 in commit
618eb375a046cc4ff007758510c883788e6ff690 and
https://github.com/ostreedev/ostree/commit/d0ea2db4300eb7871b59d0b997a7f06869120297

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libostree/libostree.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index d13f484041..a737dc047f 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -17,6 +17,7 @@ LIBOSTREE_CONF_ENV = \
 	GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
+	--without-soup \
 	--disable-gtk-doc \
 	--disable-gtk-doc-html \
 	--disable-gtk-doc-pdf \
@@ -44,10 +45,10 @@ else
 LIBOSTREE_CONF_OPTS += --without-avahi
 endif
 
-#cURL support depends on libsoup
-ifeq ($(BR2_PACKAGE_LIBSOUP),y)
-LIBOSTREE_CONF_OPTS += --with-soup
-LIBOSTREE_DEPENDENCIES += libsoup
+# cURL support depends on libsoup3
+ifeq ($(BR2_PACKAGE_LIBSOUP3),y)
+LIBOSTREE_CONF_OPTS += --with-soup3
+LIBOSTREE_DEPENDENCIES += libsoup3
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOSTREE_CONF_OPTS += --with-curl
 LIBOSTREE_DEPENDENCIES += libcurl
@@ -55,7 +56,7 @@ else
 LIBOSTREE_CONF_OPTS += --without-curl
 endif
 else
-LIBOSTREE_CONF_OPTS += --without-soup --without-curl
+LIBOSTREE_CONF_OPTS += --without-soup3 --without-curl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
