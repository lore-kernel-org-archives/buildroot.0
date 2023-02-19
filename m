Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6CEC61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 366F44158E;
	Sun, 19 Feb 2023 16:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 366F44158E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toO4nTjmtUVk; Sun, 19 Feb 2023 16:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FFF3414F1;
	Sun, 19 Feb 2023 16:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFF3414F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97C491BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7204240B51
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7204240B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JB-eMtgI_1On for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:56:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6633A41193
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6633A41193
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:56:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g7-20020a05600c310700b003dc4fd6e61dso674543wmo.5
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 08:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Ir5i3SjLG+XO3n643PQyX9fhiRXPWldvxhWJmGh9vc=;
 b=xhNZSB9/ijo+e5AYmOTzuVRVy6jmhhQz16FfPy+wU3CShPHqoJL8krJBT9Ul9L0L0y
 4gfVBPvQxyAlGIQsOVpfkRvuqd+WxLmbwHNtwRI9smSQfvvhZMWiUIrlYCh9lj0XCy4z
 wSAeBXx4b0fl6RbnbNtZbGS9r68z+83p+q04QpAPVVc/A0gmEpznDlXrJ9fynLGmpxdJ
 GAq6RHSHr7g7Rmc41ZTCO85x/k1s8rm9YSFo/sv3IXM2Yr0SQbYxudPNgHOEUFwukZHO
 Kg4ELl5W4kjpjMje7oOB/h3hV+sydhkRCicum0nUh5V1HyTKBKXyD0FrUOFM9xGu6Zbm
 fHlA==
X-Gm-Message-State: AO0yUKU6DKsuTbzeZyGR9kPzTYW4xYx/c4ceySqUKgmOB/EEwpaMb3nZ
 iG1VjvgeBHM3uN66arvKB3W9lkLbUJs=
X-Google-Smtp-Source: AK7set8EsuJo/LCN81DH7B8iw7oHScYyMEQGmYptb+4MRKsfiEQNLwM7yJ9VCPDCBBOrbylraHdeKQ==
X-Received: by 2002:a05:600c:4d12:b0:3e2:1636:766a with SMTP id
 u18-20020a05600c4d1200b003e21636766amr8039610wmp.9.1676825803293; 
 Sun, 19 Feb 2023 08:56:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003e204158ac7sm8537698wms.47.2023.02.19.08.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:56:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:56:38 +0100
Message-Id: <20230219165638.147772-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Ir5i3SjLG+XO3n643PQyX9fhiRXPWldvxhWJmGh9vc=;
 b=IQB2GHqYvhCl4rfwUs888nMLX5w1gh46xXo/AUcOIjSkcOxe3OUCOY58tz0xHHUF4E
 SV54QREeTPDZ58h/2o8rJG1P3UnvNX6aUMDIxUCxEUjFwR5VpKEuci9Yj/AV0WN5o7rO
 Uz3Nw+9gTC9ibIfg+waTVcy4uG/s7YMbNHs/IxwnSsvVBxL1eTy1OvBEpum07QQ+uMPZ
 1CmpL73JUz1IPVd5iYFWXPEqI54T6T25StwYUSKFHTDkjADUh0VllxzRz45BR25phFXQ
 RfZwQNjCDnM7u6QVuA5N9+GtEPo3IfBQpN9sUz6X6rgq82t5DgFvVZwUBqW1qE42F4l/
 oKzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IQB2GHqY
Subject: [Buildroot] [PATCH 1/1] package/modsecurity2: disable pcre
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable pcre to avoid the following build failure if pcre-config is
found on host raised since bump to version 2.9.7 in commit
42e34cf10f9eb037aa8c48a4fb9e8f521901b983:

/home/thomas/autobuild/instance-0/output-1/per-package/modsecurity2/host/bin/../lib/gcc/mips64el-buildroot-linux-gnu/11.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: cannot find -lpcre: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/f4864f8cc1d07e357f6e5f8302c19ae94e9cf3af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modsecurity2/modsecurity2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index c251291e64..88bbf3bb29 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -21,6 +21,7 @@ MODSECURITY2_CONF_OPTS = \
 	--with-apxs=$(STAGING_DIR)/usr/bin/apxs \
 	--without-curl \
 	--without-lua \
+	--without-pcre \
 	--without-yajl \
 	--without-ssdeep
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
