Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBACC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 10:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF7860BA4;
	Fri,  4 Jul 2025 10:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRLCJsyxwRg6; Fri,  4 Jul 2025 10:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A147060B95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A147060B95;
	Fri,  4 Jul 2025 10:39:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C5437AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12AFF40594
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 10:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS6CFLRkNTQI for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 10:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=marleen.vos@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DDB640367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DDB640367
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DDB640367
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 10:39:44 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so1411181a12.0
 for <buildroot@buildroot.org>; Fri, 04 Jul 2025 03:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751625583; x=1752230383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IKuKiMu+LaIaGPQIm6nTalERhKEU+MZb6S/lGZGuW0E=;
 b=Y5T6kCKfxQbgB1Oa0ndtBf/EEGZbEHIZGUymtS70WuFoh3mQbCwJ2xZ5QpEaf6tJx7
 8ESWymiwPt+DgbTp+gF1kGi2lvHebcZ4LW3BOOyWf659DM3WB4P4sSeu9euAWfmuOPtd
 WunktEIkYnf6qSHE+DjraSUjj7ra2X+Hw0kueLx3GhjDQD3FYQHlQ+OWWmgaItaDfZwo
 KIGCDDxX2ge+Sbvo2XOFlzKyYAxEmO3suezMLcFdd9v3PlhgY8yvJxI5pD/bi1cdsmp9
 9JvLFF8W3qMOJkxkxbbBo5M1pGwEKZglwv2v+KDhttUErS/wPaEVxGzjHIsO2Y4+c6HE
 DzvA==
X-Gm-Message-State: AOJu0YzJ2ssRzmJ5905dhKOAR6YQZrN8C8Mv8WczVGlnkC330oTUJMbJ
 E1qo7PyG9OAJdHVvh4UXMM5dUkOdBo+H0m8/VHRlD8gglBtWG4zhtJ5bXclDmrpg45N7z94to2N
 03Lai
X-Gm-Gg: ASbGnctGaCTmKhYSTrlZPxT8ME10Cc9pxRN6p4S4QaJjKhYUVdepCZQIfMTp+USFcy+
 xJNG4iEPu9dLnkK7Z2zYP/QGjzSzoB/JH8kLAmOmK2JkLbtdqXlFAyntTWqXh2rIE+kC44+iLRh
 OFKXD6G7aeWYFTvrAaJncCJir1kRwslN//GfLa7ZAjxHMX9cbt58eLeIScJ2pdP1p57t7iEsfP4
 Ac9JtiYD34748iR/J8wYcjrNISXgNjIMI9lUxUPucFHpHNjBbXYUlFWQJNcvZcS/disryDMhJ2T
 FpC0NkKtU/uhtblSw6DJmKf7L2/zz46fIxSvWD65QVHi7rj5jUkRHubOsu0sYFtjvlx8YF3y6Yv
 yFC2Sd938tQ7vxmdwixjn6YVRdg==
X-Google-Smtp-Source: AGHT+IHKTudrNWI30nCdgpUB18BAJcany1dBhEdcfUAURF7p3LlMGCkHU9VGsF6ZZmE80mjv28NF3w==
X-Received: by 2002:a05:6402:40c5:b0:60c:44d6:281f with SMTP id
 4fb4d7f45d1cf-60fd650a617mr1557270a12.7.1751625582811; 
 Fri, 04 Jul 2025 03:39:42 -0700 (PDT)
Received: from marleenlaptop.. (ptr-178-51-103-186.dyn.orange.be.
 [178.51.103.186]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb0c9236sm1154318a12.46.2025.07.04.03.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 03:39:42 -0700 (PDT)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 12:39:13 +0200
Message-Id: <20250704103913.2271142-1-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1751625583; x=1752230383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IKuKiMu+LaIaGPQIm6nTalERhKEU+MZb6S/lGZGuW0E=;
 b=FAQk3zRg8vM6xWOzpE3aoY64Sa9/KTSd2fJe/ob2AJ+5drUKhNPoUmhQU2VX1Bel0h
 z6hi4DMUAbq7rqWogLOCTbqgSfbXxviyVlRip/nKOIOfQ2zW8FLkmwGy6YUYJoP2oThC
 HJZk303j9Ewq0WzqFCmC2+5H5XqPCIreCSflHUV5m2wvfQ0kxjvzGxjkNO+zVsvg9Ocz
 u8saNe/smxQ5aVWszV9WYk2cB8/eUCT/ATwGRiwjregADXKu1Q7MFxa+UjOnAYMm24Oo
 5ZR6/cfntkxC2KtI5BcrrUofeq7NJdX5rsSOwNFNB3hvu0C0Jy0r38+Fgknl9WRg+CKh
 v/0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=FAQk3zRg
Subject: [Buildroot] [PATCH 1/1] Fix error with missing atomic_ops in
 autoconf for nginx package on sparc/v8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

Fixes: https://autobuild.buildroot.org/results/cd5/cd59180b05608425addffb022813031eb666bf95/
Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 package/nginx/nginx.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6ca1ac2075..13c46ad53d 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -75,6 +75,7 @@ NGINX_CONF_OPTS += --with-libatomic
 NGINX_CONF_ENV += ngx_force_have_libatomic=yes
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
+NGINX_LDFLAGS += -latomic
 endif
 else
 NGINX_CONF_ENV += ngx_force_have_libatomic=no
@@ -300,7 +301,8 @@ define NGINX_CONFIGURE_CMDS
 	cd $(@D) ; $(NGINX_CONF_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		./configure $(NGINX_CONF_OPTS) \
-			--with-cc-opt="$(TARGET_CFLAGS) $(NGINX_CFLAGS)"
+			--with-cc-opt="$(TARGET_CFLAGS) $(NGINX_CFLAGS)" \
+			--with-ld-opt="$(NGINX_LDFLAGS)"
 endef
 
 define NGINX_BUILD_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
