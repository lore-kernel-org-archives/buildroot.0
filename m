Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99A6C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37AFF41C21;
	Wed, 27 Dec 2023 22:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37AFF41C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1vxsLBJhGys; Wed, 27 Dec 2023 22:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72B9341B9B;
	Wed, 27 Dec 2023 22:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B9341B9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42B7F1BF20F
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B757610F9
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B757610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EFRLyLsP8MD for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:59:48 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF3E7610F4
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF3E7610F4
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso15731125e9.0
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 14:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703717985; x=1704322785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SWvP29OHMFW/z5i4qul76l8g+KWIHmApFeaFlTpuPo=;
 b=Y8pfFMUg6gX0XiWifWPDuG5gTo686JZaDeYo7fX0U5gZZ/HliWQDnT7hhJyQXVfJ6k
 laC07BBT5jV/60bgTwdODQeErS62qLWR5FUxygPNNKt2LUJUjRZLMY+KDQVSrUuYaPCA
 jTDVQf9Jbt4MX4uRfVk1sk1Qj9QWTVAjUFtI+C6bnjHddRHr6247+4p+ohcMOJKixYJU
 nV6xjfixNRisOW/syZNca/9DxengGGWp++qeJAGTT8CyYqEGWP1bYhTDOnVDpv4D/Ec1
 liPCMMgNn9/jcMn1LWCDHRKgj5rmOMqmkoZYWe2hwFlykX0TK0PAQUK7mcxAOCE7vekp
 KClA==
X-Gm-Message-State: AOJu0Yxd7YGm7bf2Zuga2OoXxp/TWcaTrmPTqKhzt8MoESM1iUvi8lAd
 6hLo2nN0tVcKmlgxX4LAhPUdEEjnJlM=
X-Google-Smtp-Source: AGHT+IEFPwEjOSoOyLZIizyzHrP2dyLI2lWxt6O9QhvG0cUvqa65gHAKCuQZa6TgDodyGr6B/rkV8w==
X-Received: by 2002:a1c:7915:0:b0:40d:6293:fe79 with SMTP id
 l21-20020a1c7915000000b0040d6293fe79mr243069wme.86.1703717984709; 
 Wed, 27 Dec 2023 14:59:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a4-20020adffb84000000b00336d24b4847sm5625947wrr.114.2023.12.27.14.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 14:59:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 23:59:39 +0100
Message-ID: <20231227225940.1683593-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703717985; x=1704322785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+SWvP29OHMFW/z5i4qul76l8g+KWIHmApFeaFlTpuPo=;
 b=XVJQ6uSsRDCxZId7gwafJVhFFr7EOW5h4PWuWRqZQd9uPwkf0vNGy4gtH3EN+mPBuj
 7A5GGGbRWpTZScD5E5r2MTBTvPgOT9+5u05irbKKbcUgkfTOaowbbrliMOhEnsSo+mDj
 iaJwS3rwIjypRtgVxUSPLFY5dtyWReYHQqRgjkFJB494Gwu8Ozi9tNDGfe04o9RjrHA5
 yNmpED6iXmYwmd/VZ83/4D8hYfRHmx4zF7FLkCj0QRlIjjlJvPZ94Fq9MZZUkrpBM6uI
 IrN6cFv1+hUJ4aZ8qskMGnSe8XgsC6YZXgStogKC+Ow7gGMioSafjUYDNXXqW9hqUMfH
 T/uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XVJQ6uSs
Subject: [Buildroot] [PATCH v2,1/1] package/libostree: switch to libsoup3
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

So switch to libsoup3 and drop libsoup2 as:
 - libsoup2 is unmaintained (as stated by commit
   b45c2a048d02a0e30da8534b5c048d048b252452)
 - libsoup2 will be removed at some point (as stated by commit
   f93380ab1a36bdd019cfbc651a9df5904096e189)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update commit message and explain why libsoup2 is dropped

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
