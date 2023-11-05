Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178CBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB93940A62;
	Sun,  5 Nov 2023 20:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB93940A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEC_JzhzJ-wA; Sun,  5 Nov 2023 20:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64A2940A71;
	Sun,  5 Nov 2023 20:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A2940A71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 487CF1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EC0E418A8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC0E418A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THOR2DO561-T for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:07 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F76E418A7
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F76E418A7
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1cc5fa0e4d5so34768795ad.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215966; x=1699820766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCWnTlluzCeszyBSNKDCv3JO8SzAGkwcQb30uuJqIsY=;
 b=DsQKviewdPf80sB69X3w1oVglZen3yrmV2F77Y4voGvbZRchPIRb2pf78SUq9mDCLJ
 K07YUmJRO5etIdo1HldAONhPtz+aY0hme5TXzbkzc4jPHAvFydR6RRzftu0B36YJ+uEh
 a1VToQ387P7VcJmdhsItgLBFOQz8rwUWLrIOe5qkBCIwD5mM6MXIRd1g0yU4pOZPee5z
 y/k0OdBp2NzAct1xfzxxUiWkSbz/wrMozg9gAlAxkqfXdtn0DOzCSqBbXGNhpNnazSGN
 zV/CzILdOmBxcbBCI1+azeXgd5T4S1f8Szi9JoSWNhmbPgVVd3stDvtdDqN+HjsBPouz
 8exA==
X-Gm-Message-State: AOJu0YzHu1i4/C6ijq2XEq5HvT+HG3vTqyPAaxPxfGT0OGLr6+3X3zwa
 bu22BXlU4vNFZUTp0cu3nNzG0QLByHZjQNvyba5phijTuWY=
X-Google-Smtp-Source: AGHT+IGXkdTP5ewEoQUxMIIWitFuxWa9pJfJ1CPLz5sUGVQQyJcko8vAZNbZcslzUnBUFJbmHjI+MA==
X-Received: by 2002:a17:903:2310:b0:1b9:de75:d5bb with SMTP id
 d16-20020a170903231000b001b9de75d5bbmr35311766plh.7.1699215965989; 
 Sun, 05 Nov 2023 12:26:05 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:05 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:36 -0700
Message-ID: <20231105202555.359391-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215966; x=1699820766;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCWnTlluzCeszyBSNKDCv3JO8SzAGkwcQb30uuJqIsY=;
 b=T7KhCIwabpiLbbHnPTQ813ksSszCfBtvjfkPD6LiDmPbCA/N3N+g1lO6/VcY45CkOz
 ysGgqoWLjjJ0EeGRz2HCxFIXOpuiN/M/ySoWYaAtVXyITBpY5LeOy4/kv+Sh7BrS0/qq
 WtwOW0tW6yhwpACyis0Td6UuyoUJe3z3r03os=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=T7KhCIwa
Subject: [Buildroot] [PATCH v2 05/24] package/python3: use upstream build
 system to disable ssl module
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
 ...an-option-to-disable-openssl-support.patch | 30 -------------------
 package/python3/python3.mk                    |  8 +++--
 3 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 950cc471a6..bfa65f5a0a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1158,7 +1158,6 @@ package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
-package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
deleted file mode 100644
index d4c9fd43be..0000000000
--- a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 25c900e81a2fc0bbe35e7c94e2e5028cfbf6582a Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 22 Feb 2017 17:55:59 -0800
-Subject: [PATCH] Add an option to disable openssl support.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index db33d567ad..42fe6c8f5a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4219,6 +4219,12 @@ AC_ARG_ENABLE(unicodedata,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-   	  fi])
- 
-+AC_ARG_ENABLE(openssl,
-+	AS_HELP_STRING([--disable-openssl], [disable openssl support]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3843131662..79a89ca225 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -59,7 +59,9 @@ endif
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-HOST_PYTHON3_CONF_OPTS += --disable-openssl
+HOST_PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 PYTHON3_INSTALL_STAGING = YES
@@ -115,7 +117,9 @@ ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
 PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
-PYTHON3_CONF_OPTS += --disable-openssl
+PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
