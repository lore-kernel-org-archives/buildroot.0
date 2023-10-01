Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63930E748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F2D8144F;
	Sun,  1 Oct 2023 16:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F2D8144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApbUDbOrqNw2; Sun,  1 Oct 2023 16:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB3E8143A;
	Sun,  1 Oct 2023 16:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB3E8143A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9B51BF4D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 536E3417AB
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536E3417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsPbEz5Gns8v for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:56:07 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6F68417A0
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F68417A0
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-406589e5765so26259895e9.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696179364; x=1696784164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1feM02A2xOtY3TTae1nkXpvfmL6lAV2Bi04wIiZs6zY=;
 b=hTqzRQGFO1iYTIx6QzMD9smLpENxAv7NOpVkf2qVf2BuAXud/qtv2EWK7ddOBylihF
 HIAp1AUX1ljJXRKKkz1j2Lb7k3BkHCDIWPZylSL28uO/oVcWcAybaqk0Fhk0M9ZFs1HH
 /DvNYNJ+Rruoo20y+XTtqGn1YU9psBxvRUVoTJHI2cCRMwhusXylwIZW8X6082tIwEpp
 +XbXzb8TvhNBlXETxcHJCDZFmohyOtQ0VIy2y9dqKVPYCv/5FBPnMO2mleAS7W30Xjxk
 ybvwx49NuaVQ4JPhaeFobd34TPfTMKkFXSZPY/RKJKFv3G77xe5tC02l81oX616oXW/B
 QLRw==
X-Gm-Message-State: AOJu0YyPfEahhIDJI75jX6XgVP9DOz4dqObVIv6SCDVY8mVHER8rzpAZ
 Djp8GmpYPtaDtRKekM8kjVsreBJ3ls8=
X-Google-Smtp-Source: AGHT+IEGJWBRkynlMoS2BnZXpcbKZms4ijz4yH4tAX8lixENglmYvlDlWf2OhJPKnejSqlW8YmtNLg==
X-Received: by 2002:a7b:c7d4:0:b0:405:3d04:5f52 with SMTP id
 z20-20020a7bc7d4000000b004053d045f52mr8946784wmk.24.1696179364198; 
 Sun, 01 Oct 2023 09:56:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n16-20020a7bcbd0000000b0040531f5c51asm5616318wmi.5.2023.10.01.09.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 09:56:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 18:56:01 +0200
Message-Id: <20231001165601.1193940-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696179364; x=1696784164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1feM02A2xOtY3TTae1nkXpvfmL6lAV2Bi04wIiZs6zY=;
 b=XiCHhTeCnb7j9JWWCbxW+35c5nQDRqcTlozjhGF95Dps6JXKN3P5jQbGtGX7MJg5Yf
 jxNkZP3qM5eHz470BWSAl8+KQevL7GeLFQUiRtUC8Ypl5gwcuLlYs0ty/emMKBVytMTB
 XXoMxHYTNPYOiU0tU8CfaJCmjgNq2twyuLkR8bP/wy8Y25E3FyDiDLS2lt3ZSYwr+xgx
 N/VlwywfSdt9S827hnsfKvPjHQDSkLAzp0rY2EfLGzppoG1j30u/gkbGJ8qgbgd8QV+W
 6VT2w5chGVXMpog1tko/pLcGshwSqpvgVx5HQ4tB6KJ4wxWrlKLUw1z5pmK08NlOgHuL
 m8sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XiCHhTeC
Subject: [Buildroot] [PATCH 1/1] package/sslh: add SSLH_CPE_ID_VENDOR
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:sslh_project:sslh is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/3E1DF528-5507-4919-A3EC-4283949BE06F

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 897b3b6505..6ef7cda1a9 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -9,6 +9,7 @@ SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
+SSLH_CPE_ID_VENDOR = sslh_project
 SSLH_DEPENDENCIES = pcre2
 
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
