Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73793C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15EF840A71;
	Thu, 26 Oct 2023 09:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EF840A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYb36YdNRbyb; Thu, 26 Oct 2023 09:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E526A41773;
	Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E526A41773
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28EBE1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04447839B4
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04447839B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94YCa69gWG_q for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:08 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B48A8399E
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B48A8399E
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso102594766b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312426; x=1698917226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEGsJkSGspNUSewvf58hNLHxPSWfSMGIydqw28Cfkto=;
 b=Zxz+9nz0kmj1IyLyKKZhVhigGEn4EORwTLzIUgHmog8V1MSUg4kgJNpN9DLu9O9+iZ
 M1H3omTpbc/PUzYclHOTCxXnEFyzGD5DxXn1Cse4KNcJolO9PHUhcMZSjsFRMxgOCxkU
 5ZXTB5ulbDY1RFr3yjW9y1wxm0Tf5Spz0gxnJydjGULM4fWLZGHTsGl95wR3qqgwxOxc
 kq0aVktCeQlo3k5gbemH0els2WytLQLTJFJTAq/0UeHT/UFo+4FfsCFnQK6OOmnQt1x+
 bXzCIYkqBgTg2VTmyeBFW+4D4eKxNbbzDxj/tujAVI9AczPVscN2QjBoG+X13Mw9KA6t
 n8fQ==
X-Gm-Message-State: AOJu0Yz57byedY7MeeQfwFwpcNoCpTEd1CEt8OOhGS0hUBnsfTuumKxp
 umgFn7XgDq69cTEXw6Fjnk5xBl/AeaT0OchgBxumNgoFOWnIUPWc
X-Google-Smtp-Source: AGHT+IFAdRXrSc2qnOigNQlfzODM4dGDSik2nGcsPcpmj5JY+/gDd51+553/49BRUpkH29P1Tw8wyg==
X-Received: by 2002:a17:907:3e84:b0:9c7:4c8a:2e75 with SMTP id
 hs4-20020a1709073e8400b009c74c8a2e75mr11743843ejc.62.1698312425864; 
 Thu, 26 Oct 2023 02:27:05 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:05 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:33 +0200
Message-ID: <20231026092701.12345-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312426; x=1698917226;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEGsJkSGspNUSewvf58hNLHxPSWfSMGIydqw28Cfkto=;
 b=jEw6pxGzOsVbg7IkIxc+q6secJySII5o0rJculKHmaU7o6ucgGnRwKmydFQRcdRnnL
 lFMKZ93O64UuxEuH2Ssg9ogE8pqv46i+NyxHS6lTIK3NMOYFnW1mCN9qIwuVQ08SzlJG
 uAlqrxV5Qik9G/qRxagi2wO9d8iIk0rE90K50=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jEw6pxGz
Subject: [Buildroot] [PATCH 02/30] package/python3: use upstream build
 system to disable uuid module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...Add-an-option-to-disable-uuid-module.patch | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 85273420b7..4425eb6859 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1177,7 +1177,6 @@ package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch Upstream
 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
-package/python3/0027-Add-an-option-to-disable-uuid-module.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch Upstream
diff --git a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
deleted file mode 100644
index a9501ec189..0000000000
--- a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 58027d25c3cabcf654cb0b31a61d7cbd53dc68c0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 18 Aug 2018 10:54:56 +0200
-Subject: [PATCH] Add an option to disable uuid module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ca6c16491a..ed03b27fb1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4267,6 +4267,15 @@ if test "$CURSES" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
- fi
- 
-+AC_SUBST(UUID)
-+AC_ARG_ENABLE(uuid,
-+	AS_HELP_STRING([--disable-uuid], [disable uuid]),
-+	[ UUID="${enableval}" ], [ UUID=yes ])
-+
-+if test "$UUID" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8166d306c5..7f31f3308c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -28,7 +28,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
-	--disable-uuid \
 	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
@@ -38,6 +37,7 @@ HOST_PYTHON3_CONF_OPTS += \
 # communicate over the network during the build.
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
@@ -125,7 +125,7 @@ endif
 # Disable auto-detection of uuid.h (util-linux)
 # which would add _uuid module support, instead
 # default to the pure python implementation
-PYTHON3_CONF_OPTS += --disable-uuid
+PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
