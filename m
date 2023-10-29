Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13278C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6486400A6;
	Sun, 29 Oct 2023 08:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6486400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6-Nqk3-Nqp9; Sun, 29 Oct 2023 08:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87A9E4312F;
	Sun, 29 Oct 2023 08:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87A9E4312F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 003BE1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDA2C40257
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA2C40257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YFgUMY9pHsw for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:59:52 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A98CB401D6
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98CB401D6
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso27506145e9.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 01:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698569990; x=1699174790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGdodra6p23Az3KTtjVIi6aj/5FzJWxNB9vlh1X7zkk=;
 b=n2QWJfRrggDqGyhzTyaDblOuVMqh2Gt1IX4ZCTYw50sqxtOSQe82palVhuEoTegkwi
 dQ4zS6zHoZ5bESisRwLrlutVS8EiPIL2lx1SE+TbkdeK13MrKTZYsxoUAqcyZm2l7bd4
 jaobqWBNh1FKo8lmhTAe2hKchad1N+JnUxJXPxDhq5R6CmanvSlaOHeaKfgzZ89+MIYn
 J4MRcW397GHhfhb98LgIWqE6795IbdrUbGQ7ZU6BJm9s3wbDktHC0XH6cOUm9l7XS46/
 Fi/453WHDPvDzWcE3wdW6+ImNOxNpsq6lHlcBCX/n+uEehG7mLnHQzs+yTHZ2/BXLvzC
 eS9w==
X-Gm-Message-State: AOJu0Ywg5eMwgbuIT39dZ1L82W7EyPOKpoT3HvuI0koXLlor91pfgCzo
 yrFj66NlnPHRnKSMJ7JVL7a26Ncn5sU=
X-Google-Smtp-Source: AGHT+IFYyKgArJAXxwZ7kQYthdfAU8o5bREwkCA+zsUoo/qqkIOVXPdbWmjsrjMtGi05gEd3+ruTfA==
X-Received: by 2002:a05:600c:5110:b0:405:34e4:14cf with SMTP id
 o16-20020a05600c511000b0040534e414cfmr5843335wms.4.1698569989928; 
 Sun, 29 Oct 2023 01:59:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b0040813e14b49sm9524722wmi.30.2023.10.29.01.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 01:59:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 09:59:47 +0100
Message-ID: <20231029085947.234836-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698569990; x=1699174790; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGdodra6p23Az3KTtjVIi6aj/5FzJWxNB9vlh1X7zkk=;
 b=CJcRHphtm24u2JMLoSBk+T04G7eRorg57n5e4ecjlv7mTOhasfwYhohiflaTXbfkLn
 U6MULNwqcVV+f0ZblEWKCHh3n3FcZKZAjHa07UfdBH9iv64rDIsZNs/GWIfHNUbuy066
 N1TOlOHOSYZcjQhzInIdH/ghp4Z4LKlWmHxtCOr+FqXJ/9cMT6vDXdrY76qSVEj1Ap03
 F7gFxrMayu+glYG2qM+1v7CtOFU8vhGhwq20NeWLJ8nCc1RQwsmg9+ydqvWrCdLUP+K6
 PI3Oo1twFpQf6l/Noepce72T+dzYBpRhJjReyFhUwswY6sY4XA1XXHSd/6YltMx1gP3H
 dVwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CJcRHpht
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-c: bump to version 0.13.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License file renamed and slightly updated with
https://github.com/alanxz/rabbitmq-c/commit/83a75b3943fd4d374e98f4eb758f0a170d8c8ffc
https://github.com/alanxz/rabbitmq-c/commit/fd51cf8fdc41c3d4f4a1e8cc7ea9aea5bfbe0a0d

https://github.com/alanxz/rabbitmq-c/blob/v0.13.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rabbitmq-c/rabbitmq-c.hash | 5 +++--
 package/rabbitmq-c/rabbitmq-c.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index dc1406d3d5..66768ef34f 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  437d45e0e35c18cf3e59bcfe5dfe37566547eb121e69fca64b98f5d2c1c2d424  rabbitmq-c-0.11.0.tar.gz
-sha256  94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422  LICENSE-MIT
+sha256  8b224e41bba504fc52b02f918d8df7e4bf5359d493cbbff36c06078655c676e6  rabbitmq-c-0.13.0.tar.gz
+sha256  3111fdaa26e86dd844d7c6cbb2723d0ed31702a840978ef116c86963c2429b0f  LICENSE
+sha256  defee723621ff1c556539af42780f449f258e47e3dcc8254bcbc095863f02b7c  README.md
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index fad6655e4e..cac0f67ddc 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = 0.11.0
+RABBITMQ_C_VERSION = 0.13.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
-RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
+RABBITMQ_C_LICENSE_FILES = LICENSE README.md
 RABBITMQ_C_CPE_ID_VENDOR = rabbitmq-c_project
 RABBITMQ_C_INSTALL_STAGING = YES
 RABBITMQ_C_CONF_OPTS = \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
