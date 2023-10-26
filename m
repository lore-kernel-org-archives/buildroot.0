Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46478C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F170D41730;
	Thu, 26 Oct 2023 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F170D41730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eTtScIOggdFb; Thu, 26 Oct 2023 09:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B987841742;
	Thu, 26 Oct 2023 09:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B987841742
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD221BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02D248399E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D248399E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnAaY3IsVh31 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:12 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B65C839B8
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B65C839B8
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-99de884ad25so103619566b.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312430; x=1698917230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDb6fG29q6mV8kobHUI/9g/I24drjE+24qggdoaLyKI=;
 b=jYJ/fH+xn5ALHEfUW+c6HEz1qMaX88BGvyvqLpO0rk7AXeoyXAJLEpxD1G10q1/XDe
 Fdvfi8nh5gTkNGBCmDZG9vx8540sioRjn5X6nN30dEpakcRHWaT5TB20OIeU7jVMBdQu
 cj+cubuRLgfjiiP36TXA1vOJa6T0TUxxyl+g70aP1MW6mgqruCvvmEYIMdh9VNNyY08I
 +gWjK9cklqRyAdjU5GtgWfp6rs+zJqi+GlGP7XDnPBrPZtHqx309tMhQOK+YVq7Pffmh
 beWMs5rP7VtXeMQ1aTEdnCuyhMwScPvmq3+R5oQxeogNjpzpy3bgalpUw9ETzp8c5IpE
 jRNQ==
X-Gm-Message-State: AOJu0Ywi7b6D9ulRYEpN7OMlSO6bXGM4YIWM1zKuJSiWjSuMv0u+OkI3
 vpIvnqOXaS99J981d3qjwZnBGgQA1ZoWgdzliFmcbjiRFAtFaiKc
X-Google-Smtp-Source: AGHT+IGGtJ1aiXav5Ps6WsN2TFP4to3ktHi1N/Xly/RWghvsKAocPARWRZCSZB/7OEVwJHPmS74uQg==
X-Received: by 2002:a17:907:a03:b0:9c7:5b43:a8ee with SMTP id
 bb3-20020a1709070a0300b009c75b43a8eemr13825429ejc.74.1698312430057; 
 Thu, 26 Oct 2023 02:27:10 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:37 +0200
Message-ID: <20231026092701.12345-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312430; x=1698917230;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDb6fG29q6mV8kobHUI/9g/I24drjE+24qggdoaLyKI=;
 b=GbJv4CJqbZgk3qZ3Uv5a043dzGARLoqtqVF/nf/dctI8gx0FJpC32ZbN5dIMkDVWR3
 Ma+0eUFu6kGzkCa5oTvbe48gMFp6qXZb7r7FE7xrsIK58ZVqagXPJhJoF0Ps5CCQIyzs
 ieC2b8GkXwFhF1wMi0RZu0siYbYBNEXwAs5/I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GbJv4CJq
Subject: [Buildroot] [PATCH 06/30] package/python3: use upstream build
 system to disable ossaudiodev module
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
 ...on-to-disable-the-ossaudiodev-module.patch | 30 -------------------
 package/python3/python3.mk                    |  6 ++--
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3bf861b3f1..9fe8a93a5a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1171,7 +1171,6 @@ package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
 package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
-package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index 56713a7f8f..0000000000
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
- 
- AC_MSG_RESULT($with_decimal_contextvar)
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+	[ if test "$enableval" = "no"; then
-+	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+	  fi])
-+
- # Check for libmpdec machine flavor
- AC_MSG_CHECKING(for decimal libmpdec machine)
- AS_CASE([$ac_sys_system],
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 79a89ca225..0033bec2bc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -153,10 +153,8 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON3_CONF_OPTS += --disable-ossaudiodev
+ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
 
 # Make python believe we don't have 'hg', so that it doesn't try to
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
