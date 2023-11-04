Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F75C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 09:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44EFE40310;
	Sat,  4 Nov 2023 09:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44EFE40310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5M5aKLYAq7NA; Sat,  4 Nov 2023 09:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7959540230;
	Sat,  4 Nov 2023 09:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7959540230
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 776F21BF417
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 09:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50E4560D94
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 09:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E4560D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq_yp_wm2kW6 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 09:54:54 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DF6F60BE8
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 09:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF6F60BE8
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32ded3eb835so1977108f8f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 02:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699091692; x=1699696492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k06wmgEg8RTqoOMdxH0H6fNT4z6enFRYruWpgWj59RQ=;
 b=PAR6qd7R9g1QVS+tJ9q7gITHiKbR/KNdg/ug8mAUQAq4yS6+TTfaPZbukYsi1uzA/J
 4BX2UIVGivuSvUDQvErfECXqG76Hux8fOdqm67/DNj/O53SCFYVd2VYVguKO4wbZ2cQY
 xueVYe9iKgKq32+9t3KBW1scj5XR/JJ84bMteig97OLj/Scns6+K/frk6Dv3HCe2xCny
 DSXj2SxxPbr90XcRo3sruudsv6huT1Y8sOrMCnsS5yA3TtMkt/DyUGDSYpwpQHbpuN0e
 7YA2ChR0CBk4dkqRQPHqpY4UrqjU5tAf+y5r6wQh9Q3dvEdjhpvZTkSA/vM8R3blslVz
 kRWA==
X-Gm-Message-State: AOJu0YzejiamNjC96eCJw2c4dP0x1ale8vRPQG7CLxiXIROHq/IErQ1e
 zwqm9ylm3U/xht29kqaOQ1VXxuhYDUc=
X-Google-Smtp-Source: AGHT+IFPX8NgYaUVYRT41DOYMNZLdnMuCq3bJsoDsW360goGs2D4JkMjEb5P0o8khh8GheBdEsZEjw==
X-Received: by 2002:a5d:4242:0:b0:329:6b35:d141 with SMTP id
 s2-20020a5d4242000000b003296b35d141mr16514275wrr.44.1699091691557; 
 Sat, 04 Nov 2023 02:54:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d6550000000b0032dbf6bf7a2sm3957851wrv.97.2023.11.04.02.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 02:54:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:48 +0100
Message-ID: <20231104095448.641992-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699091692; x=1699696492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k06wmgEg8RTqoOMdxH0H6fNT4z6enFRYruWpgWj59RQ=;
 b=ewbDGUFhn5vaUEEGFnClO0goj9iLx9tj5r3fPmJWa1GDA1rHNLxAwBwb/IXVV9Z5Xa
 7gjRGD7kKYcnHXqj6s/q3odXXGLM47QYrZVoAg3MYqvdDIV7W35K1z272kcnASom/fW6
 5AwxIjmQ4x1FFj8eEsXtJa7q+w4/84z+lGlM3CwPJSbkbPUrhuusHU9qZrDzZ3xxEmOA
 aCheOKSE87OwC1bWqt6XWhTYnEXNQnlVd9GNSRPrZhmC7wni+QqV17635xD5cS2eAw3B
 r2nznMZCPng+oKg+GSR5FKpwAfWm0tbYMedFwSJOuaEWjfPT1WjTsfbfitIeW0ceNN7G
 iumA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ewbDGUFh
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: fix redis
 handling
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

redis handling is wrong since the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server
needs hiredis, not redis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../freeradius-server/freeradius-server.mk    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index af3320eb44..1931c970e8 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -71,6 +71,19 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_ippool
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_cache_redis \
+	--with-rlm_redis \
+	--with-rlm_rediswho
+FREERADIUS_SERVER_DEPENDENCIES += hiredis
+else
+FREERADIUS_SERVER_CONF_OPTS += \
+	--without-rlm_cache_redis \
+	--without-rlm_redis \
+	--without-rlm_rediswho
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C)$(BR2_PACKAGE_LIBCURL),yy)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_rest
 FREERADIUS_SERVER_DEPENDENCIES += json-c libcurl
@@ -150,13 +163,6 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-readline
 endif
 
-ifeq ($(BR2_PACKAGE_REDIS),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_redis --with-rlm_rediswho
-FREERADIUS_SERVER_DEPENDENCIES += redis
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-rlm_redis --without-rlm_rediswho
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_sqlite
 FREERADIUS_SERVER_DEPENDENCIES += sqlite
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
