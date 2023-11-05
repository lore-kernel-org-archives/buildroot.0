Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA9CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18C0040A93;
	Sun,  5 Nov 2023 20:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18C0040A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7E50v2ISZ7A; Sun,  5 Nov 2023 20:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A417A40A84;
	Sun,  5 Nov 2023 20:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A417A40A84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC1A1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56EDF418A7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56EDF418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlqfFK1OJ6Vr for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:10 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1A4B418A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A4B418A6
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc5916d578so34708535ad.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215969; x=1699820769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CkbkfF5ET7l8AqqkaqCOppXXAbKk7xbRzN/l27ID+eY=;
 b=FKjECdxpv8ss9CUd+rJRUXGcJfVJG0f4uPspY0XryW0xsHwpc4QmNE8AalkGSpO3La
 GpSZ6c4ZhUT3Ag902yuMJBVN8AWgYkz7RAEVlbmUl99nGTqPlJVZ08TZE3iNI+s6Jic+
 SBTtRWohBEskoEh/s9ee7aZnl/+35AX58lmekJnxE5PbcIkcBubV039AGDxl6krDLnFG
 GWwQumC2euBxlgHTPRR47AhXlLW2/cBYxL3p2mGeu3GHdLQMtZRa174txxb2yWnJPGBp
 6SFIIxn3baGv0wV8cHpd+INxDvH3hnHK9GDRsijiLja7DD80E5EETvyyGqdHFo4ISu+b
 pGFA==
X-Gm-Message-State: AOJu0YyIgp7pejkntpdnATIV+XiVdiauEd30S0glBqouYPAQsVUQdsmF
 4VLEHAKJkggCQ7lRXdV8rPp4V3kN3QkaSEGqOeIRArKE4IE=
X-Google-Smtp-Source: AGHT+IFzQk/83pqwfQdZMsxnlrAKQ5x2yXWDTjYtS9FUSZpVIs5p60cLEau2yQD8B3JfCk31t6HzoA==
X-Received: by 2002:a17:90b:3449:b0:27d:3f08:cc21 with SMTP id
 lj9-20020a17090b344900b0027d3f08cc21mr26247546pjb.5.1699215968976; 
 Sun, 05 Nov 2023 12:26:08 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:38 -0700
Message-ID: <20231105202555.359391-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215969; x=1699820769;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkbkfF5ET7l8AqqkaqCOppXXAbKk7xbRzN/l27ID+eY=;
 b=Q8r5vo4+cnB1aBLATH2LM3KAcOZ8dpIUPmGV2pVOMmbFiIK9JkCDZIpPIj3DitUoTh
 svCas4r7Pw7aNtPuEU8mt/R1nItJmz2PSuWO/ISWx+CIqZAdnZHpvoGSkd/gNTkX4oK8
 rArzNuS1+MNNPAkVf2nBi1zKReAc0Zc4NA7zo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Q8r5vo4+
Subject: [Buildroot] [PATCH v2 07/24] package/python3: use upstream build
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
 ...Add-an-option-to-disable-unicodedata.patch | 30 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 97b1f2db1a..31f4d4f7e3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1154,7 +1154,6 @@ package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
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
