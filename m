Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6F6C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F404743665;
	Thu, 30 Nov 2023 22:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F404743665
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFZsO0C2FL9C; Thu, 30 Nov 2023 22:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF1C84367E;
	Thu, 30 Nov 2023 22:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1C84367E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD8591BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC8641925
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC8641925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuUuPNEB9yFA for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:49:11 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A974C41E2B
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A974C41E2B
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b4a8db331so14142275e9.3
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 14:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701384549; x=1701989349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3poF+nxiVUHzXu975QOYnql+jWIwPYhyEJuh7NfwSQo=;
 b=tUue41ivSrT5uQjDA+jsh/hVHx8TC0O74oeuMwqzNh509+GQ7K4DWJAWzzIKgyxDO+
 TAm6840d0RPISTjmRe/zMvtQlKybfMFBZKX8Vm89WYw3hTzoLPH/jmxh+G0NncCIuIV+
 jeLmZfbTWTE4CxQTJhK3/kmNP7BR9ZoHPsPKxIfBCiS8dC+nPAPHpn4jmkKALD7KvyZQ
 bcUUIh1qVgmGXNFFuUmmnsywGmfsfIUtGsJ0HCsSZEwt+SrhjABJUh8Fy5CBcu7qdZve
 VGMOXZVqX9lHH4DjiSuniKd6xKB+R+YRGwYVj3aQ6r1Wfsnik+hi4Q7Wo4pZve8yJ5BX
 JZIg==
X-Gm-Message-State: AOJu0YxDQR+YW3lp5oZN9fWHg3VwLxVC+U9cKjlZAzikAttCaKFSV2Y1
 3TbCVcRfgH3FtvPTDNu+kB0zFv6Yjzw=
X-Google-Smtp-Source: AGHT+IHu1eEIlNT/nKrZ2bNmEK3wdhp/eP4JbfmNxZ50soBkgcQbSE9akyucvQCs/d+rnqBwKvZBJQ==
X-Received: by 2002:a05:600c:3488:b0:40b:5e21:d336 with SMTP id
 a8-20020a05600c348800b0040b5e21d336mr99837wmq.63.1701384548523; 
 Thu, 30 Nov 2023 14:49:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b0040b360cc65csm3384031wmq.0.2023.11.30.14.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 14:49:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:49:04 +0100
Message-ID: <20231130224904.630657-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701384549; x=1701989349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3poF+nxiVUHzXu975QOYnql+jWIwPYhyEJuh7NfwSQo=;
 b=ZbLRqP5OcgrmNCydWjNLO3HY4xI5kdpLV91zVsiwuEaxt0WYHXnB6UIhnBWR6Stj4M
 C8Cs6koK/V5jZy3W8UNmpXpJWQcGY6JIjg1o08AtspbmZP0Wp2PMYR8z+m72TR9eQ/Oq
 t/YPKbkjOPwiw5inmce7VG/5eADt0kYH0ag7xcrMZwO3GUSJQaPMBQHBK3n+8d4zbWKm
 s3gKcI17P+UMnNS0oxLcHAY6FSK0tM1dgIjg1XpOVu+PNafx/kyls3noneY9ZHG+RmOu
 4LTlFgOOyvL1bbyyT4CfOzyQ2kpANyGyR0fMgrtfYqRrRwoKqGa9pxpidTVgqPQUR60q
 KG0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZbLRqP5O
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix wolfssl build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following wolfssl build failure raised at least since bump to
version 7.4.0 in commit 6b5907bf65d27ed98532e9783f92f5575f38b3d2:

/home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c: In function 'ssl_last_error_string':
/home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c:143:24: error: implicit declaration of function 'ERR_peek_error_line_data'; did you mean 'wolfSSL_ERR_get_error_line_data'? [-Werror=implicit-function-declaration]
  143 |         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
      |                        wolfSSL_ERR_get_error_line_data

Fixes:
 - http://autobuild.buildroot.org/results/9db9f1dcc6760de4b78771bb79f109c4efd06c36
 - http://autobuild.buildroot.org/results/16422af9469de114e552124542508c3b18ea8f19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtty/Config.in | 2 ++
 package/rtty/rtty.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index 198d465713..434c5d6ae7 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_RTTY
 	bool "rtty"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
+		!BR2_STATIC_LIBS
 	help
 	  Access your device's terminal from anywhere via the web.
 
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 964ec04ec4..8a40f584de 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -24,7 +24,7 @@ RTTY_CONF_OPTS += \
 	-DUSE_MBEDTLS=OFF \
 	-DUSE_OPENSSL=ON \
 	-DUSE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 RTTY_DEPENDENCIES += wolfssl
 RTTY_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
