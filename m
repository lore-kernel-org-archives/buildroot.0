Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36880C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9A3417AB;
	Thu, 26 Oct 2023 09:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9A3417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dicWAwQ7TRyc; Thu, 26 Oct 2023 09:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B5C41738;
	Thu, 26 Oct 2023 09:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B5C41738
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 667E91BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 408854114E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 408854114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LX_4diUOuLV6 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:13 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D697E41712
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D697E41712
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9b95622c620so113974066b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312431; x=1698917231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ief+4IprzscNE1+3/PD8VzHDxcHsocjL85y6oR30iWY=;
 b=uKnN4F+RpgqpEAFy5WiJgG8+AjNrIg1ooGiGMKdc2a2JOC78hwMDUY0Abllw5aBB4w
 yQtcfNGfI9FNadDLjET1Tc1IGpZ/oH79GnAUB/Yi//1vXjRFF6W909POMZ71n9g2Iz8s
 cy4BMmYjp+nHRGkrOJBrL5I6dE2KZRZ4tmKVURgIa4vG9iqj+voP56GEobCr7tbc0wdK
 YChlFVedGPlsGzl5bCDN2ZqxA08ljZ2YtiXjGOBcwQjGxD6Lr6w3p2cuu3ua5UBFWYmS
 xUde8eNOB6BELt+6D7AmSivmeM1t8hROEyhipFRIZTxRCnfoAlkR0ATLECBX9GQ2FG0R
 0etA==
X-Gm-Message-State: AOJu0YyKKWRdh0t4qaPr7YL+40RXvakUcHABT+eV3ZdQD8fFgcpC0SlY
 zy4g7VQDAVWF1eN3NH1l4Yn+Av2zJWb43OCcxw2jCcNmW23oNtI9
X-Google-Smtp-Source: AGHT+IHT5xjIQ678mQgkmHnhOeyrtC7d8ZVK5p/6p07vbDLmlPQaPzkkH46RuXbw36mBBhgDRu4F+w==
X-Received: by 2002:a17:907:36c9:b0:9be:fc31:8cd2 with SMTP id
 bj9-20020a17090736c900b009befc318cd2mr12029956ejc.24.1698312430808; 
 Thu, 26 Oct 2023 02:27:10 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:38 +0200
Message-ID: <20231026092701.12345-8-adam.duskett@amarulasolutions.com>
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
 bh=Ief+4IprzscNE1+3/PD8VzHDxcHsocjL85y6oR30iWY=;
 b=nmIFRTV34C4D9dOARMyLNk2M7bxTmG9Rg/mspBz97g/41VFwjuFjNy7TSD99uYxIa2
 4GqlEBnHptwQ3/Z7udcfWzkNtM5HvidX2CeDO454pZcJTFfG0PD4RIoYsOVWDaPaDgxI
 RVuChvuAeDFb25eKiernxdq6lL5x6hHy2kPAw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nmIFRTV3
Subject: [Buildroot] [PATCH 07/30] package/python3: use upstream build
 system to disable unicodedata module
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
 ...Add-an-option-to-disable-unicodedata.patch | 30 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 9fe8a93a5a..448357efbd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1168,7 +1168,6 @@ package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
-package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
deleted file mode 100644
index 74702b67a5..0000000000
--- a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4fe7f375a3d171d294caebdd7b7ce49bbc9ad9f3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:27 +0100
-Subject: [PATCH] Add an option to disable unicodedata
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 1bdde7f69d..ba4b0e0c1c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4200,6 +4200,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(unicodedata,
-+	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0033bec2bc..7c0473c1b0 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -24,7 +24,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--with-expat=system \
 	--disable-codecs-cjk \
 	--disable-nis \
-	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -38,6 +37,7 @@ HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
+	py_cv_module_unicodedata=yes \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -127,7 +127,7 @@ PYTHON3_CONF_OPTS += --disable-codecs-cjk
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-PYTHON3_CONF_OPTS += --disable-unicodedata
+PYTHON3_CONF_ENV += py_cv_module_unicodedata=n/a
 endif
 
 # Disable auto-detection of uuid.h (util-linux)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
