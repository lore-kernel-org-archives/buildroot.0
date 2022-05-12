Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC58C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 16:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4A8740BF5;
	Thu, 12 May 2022 16:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IGDt2K19I0r; Thu, 12 May 2022 16:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B66A9405CD;
	Thu, 12 May 2022 16:01:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94F571BF336
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 916F460F77
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0PmQmJfFcca for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 16:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C651960E85
 for <buildroot@buildroot.org>; Thu, 12 May 2022 16:01:21 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w24so6823906edx.3
 for <buildroot@buildroot.org>; Thu, 12 May 2022 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1JUDkCfJuSmXMQrNLZoVO4Q49NQ6784Lwbvn5AwI+Q=;
 b=EJJdcLk/PF+8GYz0Z7MdRppy+OUTTE8kOVNjcgH2mgn6O55DYoi+qzIMmMHPjHW4J8
 Xc/sbgYVqhgH8bFGsFYJvrNv8WcfpwdcWfvDZpzgzUzggkYrM+Sr+v00v5TdFA5gN7we
 xuvuwyw4FRXVXqGmgDTghwSmIangG9KkId78B6IapwZ6ZxJLj+67d1LFNTYABIG6McC4
 W2ovjmIeIxNhNVXjQqZgBxKYVq+guI8TD2gpXpYTII3ZOkLQACe9O7r05LRb+R0I1QbH
 XMarLDSx+AeRiskfo/KgCqC9q5yW1hSq0HG0PRgGVzCRp+V7Vjxim1bM1SsKmt6IkkJo
 H9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1JUDkCfJuSmXMQrNLZoVO4Q49NQ6784Lwbvn5AwI+Q=;
 b=ES0ogVLDGhDUHyNMWMsMcwLCgzJe7veJ4GrWEVxgNkSSATiZNd6+QhhHvO9LRucoLr
 W12Is2dVWcWwpW5eXXzciwuVTRCA2VSMBUefToWG5BKRs68NLFJH2BoAWbyoRCzGyPY0
 eTfPOAsMjwBjs4ozVaxBgwBxZw894o8iHpDLz6h9zCame7LXAOvjV8h0VF7JtmA1XFUp
 EGHiyv6OYfv9kzZpc+q5WuA5b8uKmsjxOPsqpJmqm1nn6k9/IsvDEFumU6pkiOt5RUAR
 UKQksuTc7HCJCMLgXhuEq2jWZN9/rBsCk5B/V+7WxISm8TOZG94mIBoGgnU6vCHv0GMi
 h9Lg==
X-Gm-Message-State: AOAM531Av5EwRD6Txw8GINWNy3sdWjq9Yh+11GFz9J3gCw/TDNFp5Qzy
 KYEvDHdhOlCMbskI4mkAdAwZ5JSQtiY4fw==
X-Google-Smtp-Source: ABdhPJzE4B513m2YC8vrkuZbWmKPOlj+5Fkl3BuKTIh45Vo/amik2XasRXv0K2P8ZIIgpK3MsFHuMQ==
X-Received: by 2002:a05:6402:3490:b0:427:b471:9e1e with SMTP id
 v16-20020a056402349000b00427b4719e1emr35536998edc.36.1652371279976; 
 Thu, 12 May 2022 09:01:19 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 lb20-20020a170907785400b006f3ef214df6sm2312382ejc.92.2022.05.12.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:01:19 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 18:01:15 +0200
Message-Id: <20220512160116.2011627-4-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512160116.2011627-1-arnout@mind.be>
References: <20220512160116.2011627-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/gnutls: add optional dependency on
 brotli, zlib, zstd
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 3.7.4 added compression options with brotli, zlib and zstd.
These are automatically discovered, which makes their inclusion depend
on the build order. Therefore, explicitly enable/disable them.

Note that the configure help text says "--without-brotli" and
"--without-zstd", but the options are actually --without-libbrotli and
--without-libzstd. --without-zlib is correct in the help text.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
NOT for stable since 3.7.3 didn't have these yet.
---
 package/gnutls/gnutls.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1d997781b0..0210d18597 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -46,6 +46,13 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+GNUTLS_CONF_OPTS += --with-libbrotli
+GNUTLS_DEPENDENCIES += brotli
+else
+GNUTLS_CONF_OPTS += --without-libbrotli
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
@@ -71,6 +78,20 @@ else
 GNUTLS_CONF_OPTS += --with-included-unistring
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GNUTLS_CONF_OPTS += --with-zlib
+GNUTLS_DEPENDENCIES += zlib
+else
+GNUTLS_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+GNUTLS_CONF_OPTS += --with-libzstd
+GNUTLS_DEPENDENCIES += zstd
+else
+GNUTLS_CONF_OPTS += --without-libzstd
+endif
+
 # Provide a default CA cert location
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 GNUTLS_CONF_OPTS += --with-default-trust-store-pkcs11=pkcs11:model=p11-kit-trust
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
