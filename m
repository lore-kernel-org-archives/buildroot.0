Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0BDCCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1D1606BF;
	Thu, 16 Oct 2025 18:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe4FgTKOj-l7; Thu, 16 Oct 2025 18:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF3960655
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF3960655;
	Thu, 16 Oct 2025 18:28:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D39A8D8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C590240174
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGOnbKqAi9h9 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:28:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8A6D40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A6D40169
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8A6D40169
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:28:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so8139915e9.3
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760639298; x=1761244098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVVjyfJBvTkvmhTT4iR1fBpHbh1Xi6/iOBAT36CAX1Q=;
 b=CckITI10aCCkKHdYMejnMfHWxJYHlV9TW39PbjpDsOLvkKVr+c+NL31BM/lWiXAXXr
 ZL2H1HMgcLCgFuEBXlrgeDKeX0ZJZwD5w2Uq87uEfgSedxRNUt/89OJZSjCiS80mOJ43
 8W3T8RabLITmZx4TwS+hyE6YJVEhIiuf3dz6SygUkIk45infIHsF0NYNbwnym3pZxk0y
 VupFZPYKOo1ClsW61/bxVZkOfkD8jBgA/R7j1o4/mEkfTOwdVP8TaJJNIBKDaSevi062
 xB/W22vOAtJPwVsQqIST0Q9Fu3gJ43Pq2cd/TPPsJVDAI8eAL24BgzwiFOH5ePbtg9Lt
 iXQw==
X-Gm-Message-State: AOJu0Ywn1WdpVIJDQvi6loRBHqDylwGMRI/i/M5y8jhXhwke5AA6NctV
 z5sCaE4VlaFAIl+ghIXPFMnJw959wQggEC4gPV6bSfppUj6rrGlJ17UAKCJKX2zFMyHOYO1fj1L
 YtjTUyEo=
X-Gm-Gg: ASbGnctQ8CcU2dnGYJrhDEMqglhXSuqFy8Lrrjga/ErwkMPt2JWmEyPECVIh3XGkb9j
 YYpi83/tI2pe95IpLVdn6WdhbUW0TRrrQP3t8yMgdskX+6+hfK/0g4rnxYwdP5XRlJrSuW/MLuk
 jo1s4is6pU0+msQ3ebiTqiTK9EFP/MYb2u5OnF5sxzL0gd3on7U8fV3Bk8vUiZEv1h8jCFt0eBE
 peJAjfLDwla2Gq8BJ8psVWhafPe1mcbTVfe4K/X3vF1mfELczs4kjDfU4w7TZpsy57dOYwuiGSp
 G6+sCNPI03j/DdYIVKJg4Jx/UBR3I+TtXSzKtJjqzPlNN3+nmBOD1c/IkOlzzD8zV0WOjxeLtuv
 s2rVHUg5nG0TPncZUeNo6El+/9GOyFj2W4G+6ZPpyO8HzixTBLoVJaSwGr0nkB0t14Xrq5S4ctK
 QQA21ePY/EskiJ5WoYTBXm9uk5940Ixlb4jKLGRvh0rAjacFpmrQ==
X-Google-Smtp-Source: AGHT+IHt1v0pfdr7LMKuoBlXoTdt6VOnk69vrydakGdruy0hY42GTcZu0jDd2qfmlYxyOCAEQFlQWQ==
X-Received: by 2002:a05:600c:1f0e:b0:46d:7fa2:7579 with SMTP id
 5b1f17b1804b1-471178a2eadmr7340135e9.9.1760639298348; 
 Thu, 16 Oct 2025 11:28:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442dbaesm42228635e9.8.2025.10.16.11.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 11:28:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 20:28:15 +0200
Message-ID: <20251016182815.166644-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760639298; x=1761244098;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVVjyfJBvTkvmhTT4iR1fBpHbh1Xi6/iOBAT36CAX1Q=;
 b=RRCEmfRpaj2MFH4CCtcxV4LUNndjiR+Fs5GQfqQhJgOEhWwjPYYd0l6hyRHkKoc3Yz
 ayf8PVsGoA8fiZ+05pWMAzHHCL/I3Wv1DagXzuo/4RxKVQqyHMitvxEC0I7Ab0BAMoYR
 KZDk7cQRmhGiL+d28rD9h3NPYXp0X94+RVVvk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RRCEmfRp
Subject: [Buildroot] [PATCH 1/1] package/jimtcl: bump to version 0.83
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes since 0.81:
https://jim.tcl-lang.org/home/doc/www/www/articles/jim-release-0-82/
https://jim.tcl-lang.org/home/doc/www/www/articles/jim-release-0-83/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/jimtcl/jimtcl.hash | 2 +-
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index d4174a3da68f..906d2ccc2321 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ab7eb3680ba0d16f4a9eb1e05b7fcbb7d23438e25185462c55cd032a1954a985  jimtcl-0.81.tar.gz
+sha256  6f2df00009f5ac4ad654c1ae1d2f8ed18191de38d1f5a88a54ea99cc16936686  jimtcl-0.83.tar.gz
 sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 3d68ca8f6452..f2d59265adc3 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.81
+JIMTCL_VERSION = 0.83
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
