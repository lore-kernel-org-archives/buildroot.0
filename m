Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BAAE743F1
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC03605A3;
	Fri, 29 Sep 2023 07:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC03605A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZK7eoBM0Hn0q; Fri, 29 Sep 2023 07:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51D860B73;
	Fri, 29 Sep 2023 07:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51D860B73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6581BF28E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 154604058F
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154604058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku3fa7yaTcTs for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:55:21 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F4AD40122
 for <buildroot@buildroot.net>; Fri, 29 Sep 2023 07:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F4AD40122
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso1760931066b.0
 for <buildroot@buildroot.net>; Fri, 29 Sep 2023 00:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695974119; x=1696578919;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PF0gAUPlyVKVxSLLE8CNCYiajYAUheykQahi41qpX0o=;
 b=mIpWt/XMZvi5hsxIWO7hEf4BKRO8MujL362N2OKZkxsEVZKuVsbxR0CnQOTdMdDr/j
 2cGAftkLW+S96qkujZ7o5fkoWopGjCVFBQkMgV9UgPQKLgZUAkSDv3MAlXsvhL25ayh6
 N3JUw7/fx/I8iCX/JbtXTGIkB+XsjyiLQVp3N9xSLFfmbCm059dNVp879gqEacmMeJwo
 EHYvdVqN7ld4zbfP+r8jJhlkiVv/t0K337ON9dL/Ucox+9iQIondcFacXs0gwPlUMO98
 4VULeTY/g+5rXlRyFZph3afSVWms9d94reUkQlr0SBwwDJIPKTTTJan8mcDbvFnfWJ6J
 1wAA==
X-Gm-Message-State: AOJu0Yzg61cQQNx2irku0mFIym5HhKHKut5zjE5qnaRftNcMD00om5K3
 8+6c0wpND5cdOfeeUV4sRMnqlj7LLw4=
X-Google-Smtp-Source: AGHT+IERTLF4Lvja/Y8slPwlE4mN7Qrzq4AwX/uGpanVRAAK2hhp5RJXbifi05zA9E/kjW6EHjwRVA==
X-Received: by 2002:a17:906:14e:b0:9ae:73ca:bbad with SMTP id
 14-20020a170906014e00b009ae73cabbadmr2530996ejh.43.1695974119085; 
 Fri, 29 Sep 2023 00:55:19 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a170906970f00b0098733a40bb7sm12020559ejx.155.2023.09.29.00.55.18
 for <buildroot@buildroot.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 00:55:18 -0700 (PDT)
Date: Fri, 29 Sep 2023 09:55:17 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@buildroot.net
Message-ID: <ZRaC5SeWgdBvobmu@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695974119; x=1696578919; darn=buildroot.net;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PF0gAUPlyVKVxSLLE8CNCYiajYAUheykQahi41qpX0o=;
 b=LjYxfutxdtwRB9rIuIYXjq+1mgdTZNDeRLW4ofWBDX4LRF8RV1MoVlc3KA4Jblab5h
 AGveEg3mjjaEr53SSWZ03JAK4dXNc/qc0HwxXW0wnuXkinsrTOfIQl3A4Gmwn0OT9swu
 wi3u8EyXqu7Y8fHyWboA9gk/UXdG3OQIdwlOxba8MN8I4Mbz0Ean3ylj0prvIL06ri4P
 1+neIEt2Kg91ZDSYQYnsBm8ZLa3Fboe1jJgG8MPl3rw6+vEptOQHz4nvGlrBUNMYyArp
 XAg23ysstMVUkoNwhqaaLEyynyLT1lAGHc28H3K38pN5LmtpJon0KygzYpJvzV4O6YuN
 PU3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LjYxfutx
Subject: [Buildroot] [PATCH] uacme: fix build with
 BR2_PACKAGE_MBEDTLS_COMPRESSION
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/2083eca8030e3f7ed8df388a7c29bc5d672b9512/

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 9b2360937b..f1d53d8c80 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,12 +13,15 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
-UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_CONF_LIBS)"
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
+    UACME_CONF_LIBS += -lz
+endif
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
