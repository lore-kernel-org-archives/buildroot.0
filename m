Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EEAC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 11:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08B361489;
	Mon, 18 Sep 2023 11:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08B361489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4cSDdJmC0Wr; Mon, 18 Sep 2023 11:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1466760AE4;
	Mon, 18 Sep 2023 11:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1466760AE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0961BF2C6
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 11:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 557F281758
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 11:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557F281758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dMZLoa1ECdl for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 11:22:35 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63DD9814B6
 for <buildroot@busybox.net>; Mon, 18 Sep 2023 11:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63DD9814B6
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3ff1c397405so47504735e9.3
 for <buildroot@busybox.net>; Mon, 18 Sep 2023 04:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695036153; x=1695640953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MYBpPwMC4001AlHKXr5HUUAhbXfGFAhxCKvliuRS/Oc=;
 b=wYlc/4IBHv5v9XmU/Ece1uLhfRrLfJgbJHdpurXv4l64vX00zYL4q/6ey5jOpM8tdY
 +PUgiM1NEC9qI79SsfOPvvDQWY912Cjj0Ep1vbdH9vFlaiLZ8uttjEJSfZJz3T5Wysiw
 lCnzPHYesXT6vEwdFvGLAaAY5ghGc46SaDeeR+EQQ1yGXqNhWJppT6ysriDMuwnOi+0Z
 hwVZ4y7StUYzuW79NdqXa2FULEnaF8RXmprYNOFgUOCjXulYNVQQA/GHSvmpozMIm133
 RDJU7WkR2To/jaZIfrhQwFjj/N7H1nR4JLGopvQKeLX16OdTgUzctJc3ewJ/lfzIk7l+
 BMOQ==
X-Gm-Message-State: AOJu0YwbasC2KQGeOsv8kuVj2aSTOFOM80zKF0a7AWLfO59asu9q/zIT
 BXgjC96eiV8fUgHAjndMxZbn2anlr6U=
X-Google-Smtp-Source: AGHT+IFb+7MuE4+UJ7+OB/8+U+iipohsJV3nPF1GDOGgpfCKgZD7qM1jks0QDgM19eR3l4OIiTJh2A==
X-Received: by 2002:a05:6000:1704:b0:320:bb1:5a76 with SMTP id
 n4-20020a056000170400b003200bb15a76mr3813974wrc.56.1695036153236; 
 Mon, 18 Sep 2023 04:22:33 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d5248000000b0031fc4c31d77sm12325874wrc.88.2023.09.18.04.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 04:22:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 18 Sep 2023 13:22:28 +0200
Message-Id: <20230918112228.2758124-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695036153; x=1695640953; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MYBpPwMC4001AlHKXr5HUUAhbXfGFAhxCKvliuRS/Oc=;
 b=Gn450rA3zmkwER6XQp8S1hUEz+OqNDt5oAcxKjbfnbFrfi+ZzADlEYjzMGXbqzfCeC
 rHAaUVQ9VHpThhGs5nBNiPIh97WgehO53jOXw7+zOd0bkCOU30kQD3k+IoE44ajFtndY
 r1MhXtTmZ9a468+mOVYjOTnI4b2TZz+IL3J6cUFX0iZ/l4Xi/rNW81KmUAJ6CMzywLEt
 06HtSjA0kCkSZDzGuwmendvUoQgzzitXnTjgDsdsMPY3QIbKQDr2TA0B8Zm+HkckxmCl
 1relMuv254pD7VaSKR87/hMDQlHRJrDoUVwAOdYeoINbOg43HmHyB3DVhJR5wVLpYlB7
 OAaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gn450rA3
Subject: [Buildroot] [PATCH] package/mbedtls: bump to version 2.28.4
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 2281bd5fe..8191d58cf 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.3:
-sha256  bdf7c5bbdc338da3edad89b2885d4f8668f9a6fffeba6ec17a60333e36dade6f  mbedtls-2.28.3.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
+sha256  578c4dcd15bbff3f5cd56aa07cd4f850fc733634e3d5947be4f7157d5bfd81ac mbedtls-2.28.4.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 8f09fd72a..62eda6ec9 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.3
+MBEDTLS_VERSION = 2.28.4
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
