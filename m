Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93795C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECFD460C16;
	Wed, 17 Jan 2024 19:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECFD460C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lIof1T40CAB; Wed, 17 Jan 2024 19:25:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4115A60ABA;
	Wed, 17 Jan 2024 19:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4115A60ABA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74BA31BF470
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 19:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B446436E5
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 19:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B446436E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMvtGGPNcbs0 for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 19:24:56 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7A52404A5
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 19:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7A52404A5
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so1374299466b.2
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 11:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705519494; x=1706124294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pU2Be2dgB4iZ7ursKNt3ywThT1pjVOw3u/MZXIMObJI=;
 b=e4ru6q1UZ7/tgmiIRWmzjCHL2+hnRdZ6GaWCy2Op+j5TGBawD3Au/dYJVjloZSlFf6
 XCV9c3s4CarIKs061KzPnyk+H4IepH7i7uBNlQdsdkv+3gFnso2rnJpL5Lqn0tEsBz9F
 eRb2v69b2BrpoofLIwov7IJwt7aexemOOhgAPlyk9Hh72QYjtgB5z6RfADboqFq9I58M
 Kl/mPD7ggHWiF6/KYQy95r9ggV2g0u2lUF/mBZNMAhgIasYTJHeiyHL/N/slamuAwImP
 ZJDO9ue8OWjiwhHW3IhAZanCfMoq68Jga5JEuShg9dq1fvUckXF/uJtE85oWbWlGUlHc
 UDZA==
X-Gm-Message-State: AOJu0YyhVQnKGINmZbSnnSCGnxs9BafnXNc1NTuAp5d8kzrh7YqaNT15
 UF/Biu5jhwoskrsQ/5Hz5Mfs0efvz2Y=
X-Google-Smtp-Source: AGHT+IHeWOl7fUTKQt1wvLgjEPdRImK9ioCRTlRMdTUTFvJ3Ulz3EvNyXuP9ZRCnl/hI95t7emm2ug==
X-Received: by 2002:a17:906:fe02:b0:a29:28f6:6aca with SMTP id
 wy2-20020a170906fe0200b00a2928f66acamr3871766ejb.123.1705519493610; 
 Wed, 17 Jan 2024 11:24:53 -0800 (PST)
Received: from LinkMed.fritz.box ([2a00:10:7f17:f01:158e:6095:a0bc:29ca])
 by smtp.gmail.com with ESMTPSA id
 lg13-20020a170906f88d00b00a2eae54d365sm1467066ejb.184.2024.01.17.11.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 11:24:53 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 19:23:42 +0000
Message-ID: <20240117192342.2633-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705519494; x=1706124294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pU2Be2dgB4iZ7ursKNt3ywThT1pjVOw3u/MZXIMObJI=;
 b=Mf3fOdSYL6gbdoPyUwN4kXe40jeyPjzTixFU3G1+kOKI5KtV/38/8SolxGtT6vm9NE
 DPKj74TlNMlzAS/OXu9OqML7ZG9ty8cz+q+i1L2FycS/ikyq6vqgbpHc7SnXEEZfJPSD
 aCqaqk/JIW3JYeV/QjMZd/hhIdFb2KQpiLrJDdn19eg4y7noQQTFoB58V8O56EZ2ZSW7
 +fEKg5KEEJJHN0NwTfSdfEjMo9/Bpu2adGMHh5Y8xxWIphqaka7aZXaDtG6k6RnLudO8
 ZJ4O7MiXFVfud80YJaE9WnS7Mcmgs6fN17YkGmYpqXkXnWOG2lCUkE3h9pFHU4xkm4RE
 PH/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mf3fOdSY
Subject: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version 4.14.3
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also, the new version has an optional dependency on libbsd.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 .../shadow/0001-Fix-yescrypt-support.patch    | 38 -------------------
 package/shadow/shadow.hash                    |  5 ++-
 package/shadow/shadow.mk                      |  9 ++++-
 3 files changed, 11 insertions(+), 41 deletions(-)
 delete mode 100644 package/shadow/0001-Fix-yescrypt-support.patch

diff --git a/package/shadow/0001-Fix-yescrypt-support.patch b/package/shadow/0001-Fix-yescrypt-support.patch
deleted file mode 100644
index 19427676ca..0000000000
--- a/package/shadow/0001-Fix-yescrypt-support.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7a63017b3c873a59e3482322b7824160a8c8ca67 Mon Sep 17 00:00:00 2001
-11;rgb:f6f6/f5f5/f4f4From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 9 Jul 2023 10:55:03 +0200
-Subject: [PATCH] Fix yescrypt support
-
-Fixes build error:
-newusers.c: In function 'update_passwd':
-newusers.c:433:21: error: 'sflg' undeclared (first use in this function); did you mean 'rflg'?
-
-introduced by
-https://github.com/shadow-maint/shadow/commit/5cd04d03f94622c12220d4a6352824af081b8531
-which forgot to define sflg for these configure options:
-
---without-sha-crypt --without-bcrypt --with-yescrypt
-
-Upstream: https://github.com/shadow-maint/shadow/commit/29da702491eea314b915ea9c7a83c9af80cf5797
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/newusers.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/newusers.c b/src/newusers.c
-index 7cb8434b..08f79798 100644
---- a/src/newusers.c
-+++ b/src/newusers.c
-@@ -60,7 +60,7 @@ static bool rflg = false;	/* create a system account */
- #ifndef USE_PAM
- static /*@null@*//*@observer@*/char *crypt_method = NULL;
- #define cflg (NULL != crypt_method)
--#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT)
-+#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT) || defined(USE_YESCRYPT)
- static bool sflg = false;
- #endif
- #ifdef USE_SHA_CRYPT
---
-2.39.2
-
diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 2e5c4a8168..4689a994de 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,3 +1,4 @@
-# Locally computed
-sha256  9afe245d79a2e7caac5f1ed62519b17416b057ec89df316df1c3935502f9dd2c  shadow-4.13.tar.xz
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.3/shadow-4.14.3.tar.xz.asc
+# with key A9348594CE31283A826FBDD8D57633D441E25BB5
+sha256  6969279236fe3152768573a38c9f83cb9ca109851a5a990aec1fc672ac2cfcd2  shadow-4.14.3.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 4bc3cce037..03eb16a3f4 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-SHADOW_VERSION = 4.13
+SHADOW_VERSION = 4.14.3
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
@@ -120,6 +120,13 @@ else
 SHADOW_CONF_OPTS += --without-yescrypt
 endif

+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+SHADOW_CONF_OPTS += --with-libbsd
+SHADOW_DEPENDENCIES += libbsd
+else
+SHADOW_CONF_OPTS += --without-libbsd
+endif
+
 define SHADOW_PERMISSIONS
 	/usr/bin/chage f 4755 0 0 - - - - -
 	/usr/bin/chfn f 4755 0 0 - - - - -
--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
