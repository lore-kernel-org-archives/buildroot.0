Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FD4E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8A7E41922;
	Sat, 30 Sep 2023 15:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8A7E41922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frnlefohe7DB; Sat, 30 Sep 2023 15:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C96641B31;
	Sat, 30 Sep 2023 15:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C96641B31
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BB561BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C2282796
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C2282796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiYfh7MdeACP for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:55:57 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC97C8272C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC97C8272C
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso540441339f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696089357; x=1696694157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h1A2ypSSIMa4PGIa9MZ1H2CsLMSBSTMo5N9ACbvPPFg=;
 b=Njgd0E9TOqB+AKKS94SQhnXxqII6avIqlm5/KiWvIA2sJ7P3pYZQZWU3lq2n5Om5MR
 SL2bjhT81fCb76IwGy9TqKqtdSWVVGzG0/Q2kr0B4xevFxgHl60bCSbPMgh1WW7jjrFX
 2f6XNo+ye8EZ6UuYVnojv23bAnYL0/TdERvvoF2zF7S6TFvCY5YgfnJaBS3/rcN4uyBq
 P1HEa5Zv4tvbtwPKmnMVuZkDwCwDYoYcEC63905mgkF3S4s0/QEk6lBuWoZsredBTqua
 OFgoSMGIbHXozZftYLbLyQsjWQc/AeJfoH1Zb5/6fJa8D6y9EqmWy2BWP3OkoJou8u6H
 q+HQ==
X-Gm-Message-State: AOJu0Yy/QQYkYr42sRJdYRj2ynEA61QfQpLIMY/QMoEHNa/s+dViEqhM
 g6S8MClXVW/H1HJR7DSDWULnJQZ4zZg=
X-Google-Smtp-Source: AGHT+IGPX9eoP+LEOZaTj4IpkB/tl6AIBeEL1GP2tcA1+xlX/s8LTNMWYOlqUk3yrLZJC5DcmF0T9Q==
X-Received: by 2002:a05:6e02:1bef:b0:351:ab2:2621 with SMTP id
 y15-20020a056e021bef00b003510ab22621mr9446860ilv.15.1696089356628; 
 Sat, 30 Sep 2023 08:55:56 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:cb4c:29b6:d01f:bc5a])
 by smtp.gmail.com with ESMTPSA id
 z27-20020a637e1b000000b00563e1ef0491sm16583986pgc.8.2023.09.30.08.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 08:55:56 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:55:47 +0900
Message-ID: <20230930155548.1609970-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696089357; x=1696694157; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h1A2ypSSIMa4PGIa9MZ1H2CsLMSBSTMo5N9ACbvPPFg=;
 b=gsVXZ/1jRyH6z90wMRL0eUlq/xXGNpofCIX1uNpG1FD7tQZkJPeQx61WmzP1DZGcUq
 sOPdS9zoN7EupDU1zjo42bvttel8EeguvwhH53LdFvTvcgftE470T0gPS0OM3VG8agjq
 m72KYCAi1q5W7AHhvo0dplbq6lDAHrRffG9vi1wnkcRcNGSFsfl7/RMfdncm/ye8XSGj
 2lNZc69OoLXKsDxXSdqqyJaQTQeXky1FQ5dKtB4Gd+53G5cb+X+iGq0/tRRzF2G70iaR
 gXsUlaDxUvtId6CFL+dvkiLvjx1oDe7unrcbdX3K13prEdMg11tZ0V4wlF9fbAOd8zlf
 IzLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gsVXZ/1j
Subject: [Buildroot] [PATCH] package/libxml2: support python bindings
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 package/libxml2/libxml2.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 9f7774f719..672a2cb0f0 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -20,12 +20,26 @@ ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
-LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug
+LIBXML2_CONF_OPTS = --with-gnu-ld --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 LIBXML2_DEPENDENCIES = host-pkgconf
 
-HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
+HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBXML2_DEPENDENCIES += python3
+LIBXML2_CONF_OPTS += --with-python
+else
+LIBXML2_CONF_OPTS += --without-python
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
+HOST_LIBXML2_DEPENDENCIES += host-python3
+HOST_LIBXML2_CONF_OPTS += --with-python
+else
+HOST_LIBXML2_CONF_OPTS += --without-python
+endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 LIBXML2_DEPENDENCIES += icu
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
