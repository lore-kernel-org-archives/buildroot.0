Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D28C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EC5940A65;
	Sun,  5 Nov 2023 20:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC5940A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o50ynLURdNR1; Sun,  5 Nov 2023 20:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E5CF40A6F;
	Sun,  5 Nov 2023 20:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5CF40A6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FFD41BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D0040A73
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29D0040A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8E1spMo1Lb7 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:15 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACDD840A65
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACDD840A65
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc1e1e74beso34382945ad.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215973; x=1699820773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCIQ7LKv9CT0Q70ni43PIPPNqdWHe8wm1kxDwi28uPQ=;
 b=BrxbtE1Au3DGl8w/VFS6amRqeJit2EhCzZU5g4flEG0WEvZm6YXac9zJAfH5q/aDJh
 /kc2a4bnRINI37lEamxwHqiNi1apiYqlQsH+CqxS/Mmc5Jx7f1a2Vp8JB0ZwC0PWqK4b
 XV4ifwYX5+i9eI+XqTX3RqUy5YAJtLAekNhtwWqnxxkigAvwGt9FNptsgMdWORArHtw6
 CjNi4Xqp84XGnnD/XtbNq6N/d9BdW14yT7Zg/3mxXrg0X+TqDNlgk0PF0vRkTDRvCALG
 AwcWF7vVig5cLHMUi9QleLpRuNDOOldRqCex88Ah5jRyTLyc95e1aoyCi84+UuEPIp5m
 czag==
X-Gm-Message-State: AOJu0YxH8bRpabD6tQ9SMVKoaVX3B2tY+ul6Tf5tC1lj6BlbYB8k84mU
 k3blDwwckDIzFOiM6HfpqgurkEmCg7iKy742pZek1XeLobM=
X-Google-Smtp-Source: AGHT+IEU/PKPA/FD7XmuCQ40J9KtNuxQRDyDydPP3nWWXp34x4Kg8W7VqTjXYG0qOj8isHsVxkZctA==
X-Received: by 2002:a17:902:e892:b0:1cc:5691:5113 with SMTP id
 w18-20020a170902e89200b001cc56915113mr23079071plg.26.1699215973590; 
 Sun, 05 Nov 2023 12:26:13 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:13 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:41 -0700
Message-ID: <20231105202555.359391-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215973; x=1699820773;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCIQ7LKv9CT0Q70ni43PIPPNqdWHe8wm1kxDwi28uPQ=;
 b=RqEPg8D044tHtNX35ioF+UFwaMo0cJ9cTnWOlxrqqkBw4J5g/JLoIk3LbVr+p21KG1
 0prABtSFkjRoNcqYge1yWwBsYdUvgLoe8RiLsjyIJWZYWVWMjnF3QJ442/E524oETGFm
 HR76xvYhS9TdkG+goikdexetcx5MWDp7ZME5Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RqEPg8D0
Subject: [Buildroot] [PATCH v2 10/24] package/python3: use upstream build
 system to disable CJK codecs
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
Cc: Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...-Add-an-option-to-disable-CJK-codecs.patch | 30 -------------------
 package/python3/python3.mk                    | 15 ++++++++--
 3 files changed, 13 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 2d735a8f55..c5e183ffb2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1152,7 +1152,6 @@ package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
-package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
deleted file mode 100644
index 63a07fb514..0000000000
--- a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d8ef6a7a9f2b954cf1c1e37fc3c35055b42af0f5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:55 +0100
-Subject: [PATCH] Add an option to disable CJK codecs
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 201cad0bfc..ecdd7dbc07 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4188,6 +4188,12 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_ARG_ENABLE(codecs-cjk,
-+	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
-+	[ if test "$enableval" = "no"; then
-+		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
-+	fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 284e059c63..e4b97e7d62 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -22,7 +22,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-codecs-cjk \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -38,6 +37,12 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__curses_panel=n/a \
 	py_cv_module_nis=n/a \
 	py_cv_module_unicodedata=yes \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -123,7 +128,13 @@ PYTHON3_CONF_ENV += \
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-PYTHON3_CONF_OPTS += --disable-codecs-cjk
+PYTHON3_CONF_ENV += \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
