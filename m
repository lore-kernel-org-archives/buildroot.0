Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1A4C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F3E417D1;
	Thu, 26 Oct 2023 09:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F3E417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1SxvtID4mN9; Thu, 26 Oct 2023 09:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06A441730;
	Thu, 26 Oct 2023 09:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06A441730
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A50401BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AAC86124D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AAC86124D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ff4vZvjZjYdS for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:15 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CAC66124C
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAC66124C
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so106698266b.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312433; x=1698917233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oVGjYPl+F2op/lBS61+Hk+kafaSQvEpq6s4BuLZIAI=;
 b=vbuzY+OY89Vxwxh91KMxavKEwi3ntd4YY72E5gIIlloliGAeq7CD3+OnScb8vbDcdr
 wZSBn3vi4B0nA7IFixjMOARz4I5l2WwKs+0wUfGL+nR3vFoe/j0DNcGiJZY28ikJwFIV
 c89+VpT5zXMCvdQA5JfKAc4ypP3fPN0ILUIkhooLi1sA0B91iCBijnF1luDhXyNmbvXK
 ADyZCfIL3QWPVuoM3EsQo2jNi8dWZzBg4phcGP0O6+PIPE/t/wl9ffe0p3z1JDe6eVkE
 0eucYtwdIGxPOhQBqIGhK//YA++HFt45cGoE7/7jE2ARHqyhM36LpaEoRuQueSyJ485N
 wHgQ==
X-Gm-Message-State: AOJu0YzbbJ6QNmOusdmKdZk0TsE05J7Xr2aVFtwvU/phqPE+d6fank24
 f0vukrxM1e8lzO+mDcr5Hsk8zkOQfdM1DtrThvlHzjgmx4ExGkjy
X-Google-Smtp-Source: AGHT+IE/1iFnVmfMKndb3/2/HwEEslf7LsoAZvlIszd3U9hVa+1UIT6qZ4sX4Zr1tQp6DIuKw8oGpg==
X-Received: by 2002:a17:907:94c1:b0:9ae:55f5:180a with SMTP id
 dn1-20020a17090794c100b009ae55f5180amr15076374ejc.9.1698312433385; 
 Thu, 26 Oct 2023 02:27:13 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:41 +0200
Message-ID: <20231026092701.12345-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312433; x=1698917233;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oVGjYPl+F2op/lBS61+Hk+kafaSQvEpq6s4BuLZIAI=;
 b=BlVjuzoJrcmFWzJUhTQeDfZAtxcDpRPHSvMXgilLI7IkwaHqmq5A6uTphbhvzPIdnU
 mtWh2ce2TVbffs6T+bZAO10A27ZA2uqVaTebnG9YTJo4Mw6H6MvNfjeEjQe0S01nZo1S
 P6jsNHKgqTQU1NXpX/tZKmpbcBjKaAlqjNZyU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BlVjuzoJ
Subject: [Buildroot] [PATCH 10/30] package/python3: use upstream build
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
 ...-Add-an-option-to-disable-CJK-codecs.patch | 30 -------------------
 package/python3/python3.mk                    | 15 ++++++++--
 3 files changed, 13 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8778c52ae2..da17dd32f0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1166,7 +1166,6 @@ package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
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
