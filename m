Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5AFC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A41C140A71;
	Sun,  5 Nov 2023 20:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41C140A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qBNsOz9SZ5m; Sun,  5 Nov 2023 20:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8907B40A7F;
	Sun,  5 Nov 2023 20:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8907B40A7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 930A01BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA0281D47
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA0281D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTmAJY0sIhVf for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:03 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB1C81BF4
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB1C81BF4
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1cc68c1fac2so34964535ad.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215962; x=1699820762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/4LqZUBuEKzOHsZ8JKkNSiX3+K9l35aAj0zjaVxyGY=;
 b=lLE3NjLm1Dk6MvRsL3C0tZm1yZn113BirymuSZxMwGKVdqqfRxfNpdufy8qI2QiuZk
 bY9MAeD7CN66B+lcxcNiju9AUMY4pJERvsxmvqlpPVkcm3xu7z27qCuCo2m5AAN96o9N
 Wh8aHPP6e0Jwzmq18j7jaI6SHI8yPFQ+t5PgUrgBMqKCsGt4pPwteBgprWCRJ3qYUK43
 g3pHndXvC/vVxphIuyvr2rnBlstbDf4AJdtpJIIZ7YI0UiSVTgtaZSqy4mj2Hr6EbS7C
 SnloaayAlN8kqmE4BziKleRB9SJmnboXZ64BTR4d9jWUHsrnWVe9IHQO4pXUFUfxS3p2
 oItw==
X-Gm-Message-State: AOJu0Yy6QA1hDy3bNDIB938ENn/+iPR2tBI1VXomCGCp8hJHPOhDV3iV
 k83fYQHSrDpD/uxO+B5NNN2h/phze1BGV0OElp4xpjWTU3M=
X-Google-Smtp-Source: AGHT+IExR1axq2md7L7ZiRQJp0y7eAPIiF06ucxO5j9SeC3D53UaKgW+LV4Y/G+479p+g9FAKjLrvA==
X-Received: by 2002:a17:902:904a:b0:1c3:c687:478c with SMTP id
 w10-20020a170902904a00b001c3c687478cmr27863332plz.8.1699215962277; 
 Sun, 05 Nov 2023 12:26:02 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:34 -0700
Message-ID: <20231105202555.359391-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215962; x=1699820762;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/4LqZUBuEKzOHsZ8JKkNSiX3+K9l35aAj0zjaVxyGY=;
 b=kCgs6+KX92DVhVposmSZqTSOsKDpdTGUhvhpJjQ8RxgfRfeIHMlUXgUqxdK50qSLBg
 rGmuVxFVYxOk+H0xYZuPVtbjD5SuhxhVmuVWCl1pROYOHzb21mEhh0Iv/vmnwEzJneXc
 gGC0vcvEAsj1bQOZV3MrHfvL8h6uwA1NSu4zg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kCgs6+KX
Subject: [Buildroot] [PATCH v2 03/24] package/python3: use upstream build
 system to disable bzip2/zlib/xz modules
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
 ...to-disable-zlib-bzip2-and-xz-modules.patch | 42 -------------------
 package/python3/python3.mk                    |  8 ++--
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1070438ffb..66a8eb3bb2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1161,7 +1161,6 @@ package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch Upstream
-package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
deleted file mode 100644
index 70a0d6cd15..0000000000
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:31:11 +0100
-Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 19875d7d30..ca6c16491a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
- 	  fi])
- 
-+AC_ARG_ENABLE(bzip2,
-+	AS_HELP_STRING([--disable-bzip2], [disable bzip2]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bz2"
-+	  fi])
-+
-+AC_ARG_ENABLE(zlib,
-+	AS_HELP_STRING([--disable-zlib], [disable zlib]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
-+	  fi])
-+
-+AC_ARG_ENABLE(xz,
-+	AS_HELP_STRING([--disable-xz], [disable xz]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _lzma"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7f31f3308c..555afdab4f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -52,7 +52,7 @@ HOST_PYTHON3_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
 HOST_PYTHON3_DEPENDENCIES += host-bzip2
 else
-HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
@@ -130,19 +130,19 @@ PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-PYTHON3_CONF_OPTS += --disable-bzip2
+PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
 PYTHON3_DEPENDENCIES += xz
 else
-PYTHON3_CONF_OPTS += --disable-xz
+PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 else
-PYTHON3_CONF_OPTS += --disable-zlib
+PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
