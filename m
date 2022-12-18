Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A08C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6818C813A8;
	Sun, 18 Dec 2022 22:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6818C813A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrsVoeTZYHgr; Sun, 18 Dec 2022 22:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9991F813A5;
	Sun, 18 Dec 2022 22:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9991F813A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1E151BF38E
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A83FB813A5
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A83FB813A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROBsFdx_d0qq for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 22:02:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 996BE813A4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 996BE813A4
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 22:02:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso7608892wme.5
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RPbWKScZnHdkNxiuC8bM9Mw2OsgcbjKPSSXcsSfnskg=;
 b=vEJpegWotjudzThNfEdwnZQufdSjJcds9Q7rp46RyIAqVzpypDuXGrvlaDv/9/e1pP
 U7f0/bX49b9vBOx+Uzsk3JuUD7un2YnPAy8gPIj+LAKgwK98BVo5Xx63xoRkabP9Btn9
 OBX2BZRYNAuYryOHAfql2Mx9YgdcyFC3vUAR2eVDDaEnWybprWfY5z8oNxsmv7N6veO/
 gp+KLqXGjN/ytJcanHEADiLnYHfPhpu9ORoaT5fwz94D+RaaGuoWuWdVC3KU8HJqauvY
 hRIBRY8u1arIkCZ9PFUcHWVlnr/xSEFLjEQSxEAXt4C6rYldglWnPZlrdUQW50DDw3qE
 wz/A==
X-Gm-Message-State: ANoB5plXbUNLVMEQ4n6Gr5s9+OVT+pEaHCr/KUI6laXjHC6J4LaLgUNR
 al/bNk3DBgGbYHIj80V4LNz4V0L4W7w=
X-Google-Smtp-Source: AA0mqf5ZCfRYbz+6/HBTtH912BGF13jnZozhHOzD54UgdwqPon4MKHjkZGXvtfwTkIkO/hnN6a1L6w==
X-Received: by 2002:a1c:f216:0:b0:3cf:87c6:890e with SMTP id
 s22-20020a1cf216000000b003cf87c6890emr32516656wmc.27.1671400935374; 
 Sun, 18 Dec 2022 14:02:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i7-20020adffc07000000b00241d544c9b1sm9451569wrr.90.2022.12.18.14.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 14:02:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 23:02:11 +0100
Message-Id: <20221218220211.16371-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RPbWKScZnHdkNxiuC8bM9Mw2OsgcbjKPSSXcsSfnskg=;
 b=Cs5Pzf5Y2ZqglpXbh+8nq1bu6TxLBwqijQP5Hz69Dnrd54PSX8TuIu0qTtC9iFIPC2
 XnLSzscv6S6iB+A+XEn4X9L7KykQTcPM2u+BFm7AQq8XKH8cbzhGGnidRfb67uEglIOQ
 kfNYTUUllDH4e8MJkzPqQH+8tIVPkRPwXBWSoig0wsiwpQDWMQQqf7linkf0r+f2H9r4
 uv7DusxNMOthripfpuU04wPh12NrZPluB/AEkmu8hp1gO5udqlFnM3NlBOmZr9o13h9w
 FgDr291FMek8qq7e3ii1HguMiZchtujjjwm9K0ShigNSmtGqrJoBkci8mZ7+Kbfu/AHV
 Rrhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cs5Pzf5Y
Subject: [Buildroot] [PATCH 1/1] package/gtest: bump to version 1.12.1
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/google/googletest/releases/tag/release-1.12.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 1a93684aeb..a6dd15a8d2 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2a4f11dce6188b256f3650061525d0fe352069e5c162452818efbbf8d0b5fe1c  gtest-1.12.0.tar.gz
+sha256  81964fe578e9bd7c94dfdb09c8e4d6e6759e19967e397dbea48d1c10e45d0df2  gtest-1.12.1.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 236c8f3730..a53253228e 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.12.0
+GTEST_VERSION = 1.12.1
 GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
