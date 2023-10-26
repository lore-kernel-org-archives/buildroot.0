Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E55C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3E5641730;
	Thu, 26 Oct 2023 09:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E5641730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNStF_vt3D06; Thu, 26 Oct 2023 09:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9889C41745;
	Thu, 26 Oct 2023 09:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9889C41745
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C42E61BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA7D41F78
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA7D41F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCdGh90SlCei for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:13 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B96C641F77
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96C641F77
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-54041e33845so943057a12.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312431; x=1698917231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dELmXZpQ58PYchKUQEI0myfZBJj/uXkQSLBbz79RX3A=;
 b=oSKaEhvvYa77vFwQ2Vb0SjgtJXlhPR9bYWkjh3eoRyAaG2I94637UOxQWGMvHJBMHh
 6EAFQFyAnF6Vv+RrVzsUzja1xR5LMrD73erd1mbUDHfsbY0GjXUoLgsqb+pHcmLs9XAA
 4ko84Z54PU8dBNiubwP440cnuSdFv2is/EliJH+6VUAAXjFhE6eEnOP2eBaeO/CjVXpG
 YpFHSua82rm0kmye748CzW7CXbokXy4MCgpz+pdAPh282S2K8UVeHxfYVfT0Nk0W0uPP
 +uKI/Bz558dmOIqWBxzPsvhDFBjRIYgBWNr6lXccFH9isDcybQwMs9n69rDE5dSXwwpj
 7FHg==
X-Gm-Message-State: AOJu0YwLeKuK5uP34V/PsBNMTds6bCaylpWhRHT80Dm57y3Db3IURzxx
 WkJu4152E7seiC9v+STjjHUwZaj1xu6GBCzuoqLiLuxx/FfNDO9a
X-Google-Smtp-Source: AGHT+IGQGMJrDS4LTMUwEPUZRk6n07XlqBhd3vZDdxOGQIm/SqrJbhNzxR+v4zh8sZ2DFMvnIWLPSw==
X-Received: by 2002:a17:907:801:b0:9c5:7a7:3752 with SMTP id
 wv1-20020a170907080100b009c507a73752mr14106399ejb.26.1698312431646; 
 Thu, 26 Oct 2023 02:27:11 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:39 +0200
Message-ID: <20231026092701.12345-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312431; x=1698917231;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dELmXZpQ58PYchKUQEI0myfZBJj/uXkQSLBbz79RX3A=;
 b=VGi7RaTFiFX1Hr4XfUa6sCG7Th+Tii7xwfpIDUQUQharv1ZdnNRwh+PGKJqGhgpoyQ
 VCaW2QewtMBPsEEcA1TToBtyhG4AOjbcFpPl8HRVaj3ydtgKPpBPfgi+uAMdkDuMoGad
 YEKDb1V0uKyKjpK3wzGdiA+6eCnQVcMYhFNbc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VGi7RaTF
Subject: [Buildroot] [PATCH 08/30] package/python3: use upstream build
 system to disable nis module
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
 .../0018-Add-an-option-to-disable-NIS.patch   | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 448357efbd..1be6d393c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1167,7 +1167,6 @@ package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
-package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
deleted file mode 100644
index 977955d1cb..0000000000
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:11 +0100
-Subject: [PATCH] Add an option to disable NIS
-
-NIS is not necessarily available in uClibc, so we need an option to
-not compile support for it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ecdd7dbc07..1bdde7f69d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
- 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
- 	fi])
- 
-+AC_ARG_ENABLE(nis,
-+	AS_HELP_STRING([--disable-nis], [disable NIS]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7c0473c1b0..7518edf104 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -23,7 +23,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-tk \
 	--with-expat=system \
 	--disable-codecs-cjk \
-	--disable-nis \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -37,6 +36,7 @@ HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
+	py_cv_module_nis=n/a \
 	py_cv_module_unicodedata=yes \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
@@ -164,6 +164,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
+	py_cv_module_nis=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
@@ -191,7 +192,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
