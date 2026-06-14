Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EE9CD98D8
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B78960EE8;
	Sun, 14 Jun 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcXt2vewPlZa; Sun, 14 Jun 2026 15:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B5E61152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452445;
	bh=xeMsVaDzRmHPOoHe/zvOCZfeD8bfqHGLDjFedt3RRAc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dw/94HuLap0nFwd5D4abpF2xcQ5XS7KEQm6BDiIGDThRwc/4TEoVGavzcpVIWYnJ3
	 JRnT0kfx/xb2gNz1uBu/TfJv+tXaqibd3rj9+jSgjZ48pjFQYcnUHyojbQJNPuZjdZ
	 hNRvT1n2qPH8+Gh2+7soFwO+T/kYwdwYduzfRanOyEwWmR9pYSX0K0nLGrN1NCKHO/
	 LSmiW2aK3qyo1XKRgQztFZGTJiwo8ddc4fQX5tLdDLwYQOAvs1A7ia0ziAmgb72Fzn
	 v3L6CACahuGxeZYtuZh0rI0vqCzA4DVL00t9ss/MQftTHSSfQmF0aO4ZoWbL3lNQu5
	 x7y1H7oxJ7ktw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B5E61152;
	Sun, 14 Jun 2026 15:54:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EF26DE
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9173340680
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMb_0pof2PgH for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:54:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54CA14039C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54CA14039C
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54CA14039C
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5aa68dbb38aso2166719e87.2
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452440; x=1782057240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/bPMvTj4Xgcx1WQI7O3BjQkCF9L0PLmMCkv/iX98QME=;
 b=O8CExE2T/JnptnIWeMhJWbmEo3QUbUf4+QwKqZ/dkMdeaOTW9+n6WlYqmMW2/xGb27
 RpYoAH7/YjZU4JDqZ6bM2SdtVqOPb5YbQZfw0icNXDkWE62v4iRe1T6xnh43MK0qD/EV
 uCcgtx79zucTiD+msdsv9UmTGS5Xuu39xr08HBfqAfmpieh+avj2orZrvgV0j/l1Py7v
 jnJZjCe8zhAGpVSnfpoPkNvSxh/+ctH+3M4GyInnPsD9K5U1284g+Mf+OLrsm2KPziGm
 HHz/ZBCdglGmTc6yWleLqrw57Hzit4aTYA+Yibjql8PX6ox+xOCgFNI4U+CDR5CP+8QM
 m8SA==
X-Gm-Message-State: AOJu0YzmrBDoTIxfs9iiNxZtJqLE2nLDxeptdfLY9IrUZ7y5JD4Zjanh
 vZT98uhKS3fnozAkmMDx3aGEji/GGanq1eIRDem0eLsY1GZGW5C3Mpa5uwGC/6kCwjLvxQT/mV7
 2i1enrV/+Tw==
X-Gm-Gg: Acq92OE/qBfLwOwPBDu+dHO+76myPiEn6/NeFw8wD/YmOa/GLt5I2UUNCGuujd8yEep
 deLeYPwSzUKURgSLru6FcIynyC0fyjtdbf1GUZouRV+DWbECOroFK6RdvPNhiw5pvK61igoj1z5
 LFLEAXz0t2eqmaiLJtPMKI9Ja+UISba8gdP6Tszf6AT7fYCEASkV3+WHmtqSe0AHyN+CC7XrZZh
 6knYfP0uFUG03G1TRhWkK+kTg9y+TMqTHKOiv/rajp1J7SGVKc2ZutmISV+qHu4gaLXdoXz9bFJ
 X6YdX6E8qmaJ5cacYuV2RndTXdJO4nE2Tqg5fNE+lQMF8ZSqIxj/GfY+oJfOuBQ++8L+HJDyUfp
 lIS73GKTgJq/IbXhLjhXnjLftcAEUwMnp1Kc3S6b6IIyUqQCZOEynPd6B8ah2nfLNVtQ/OzG46n
 y06Fl9vJ7x+0HJSEhbKQN46LjbrJFb8AUtpg4oOm/zgN9yyN8GOXm9Tg==
X-Received: by 2002:a05:6512:31cf:b0:5aa:690c:662f with SMTP id
 2adb3069b0e04-5ad2db68b05mr2774543e87.23.1781452440027; 
 Sun, 14 Jun 2026 08:54:00 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e169603sm2071722e87.22.2026.06.14.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:58 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 17:53:27 +0200
Message-ID: <20260614155328.304282-8-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452440; x=1782057240;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/bPMvTj4Xgcx1WQI7O3BjQkCF9L0PLmMCkv/iX98QME=;
 b=gpw2zhoW5eRRJYL6y/AzkClAzREYkmHdP2qqj/KGC6t4AuC54Bg/lXXQDXyOfk2H9R
 5IuXTZTNsQ59nMQ2JVz7HcBUdMGEsVf30KqJi+L/AS8KUUuggauUEET5YpNpBp2XbmvR
 +NSbjk1uxyccoTj8/pPHjjeGYjyg4E2MoXTFD8xZd0XKz0+eeIlQewSMgVzfDZxNqCNd
 sk0YTT3tFsL5ZIPyHarsFu9+qzAZIn9Pm5OaoptOeN0lo3qXCXxN/U4Xw3jyBgSve6vg
 YJphMX/OWDKmOr61tpGxDC0JW6yXwGqrQPDdK59bOjTbgNVneWT6TMQqd5q1gC0K3yw+
 4hWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=gpw2zhoW
Subject: [Buildroot] [PATCH v2 7/8] package/python-xlib: Drop the package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, John Ernberg <j@j-ernberg.se>,
 John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has not seen any active work since late 2022. [1]
There was an attempt at finding a new maintainer in 2024, which didn't
lead anywhere. [2]

The package will no longer build with setuptools >= 82. [3]

Link: https://github.com/python-xlib/python-xlib/commits/master/ [1]
Link: https://github.com/python-xlib/python-xlib/discussions/273 [2]
Link: https://autobuild.buildroot.org/results/33ef2859c48f78552dd4a7d53b13955d3d9b05d3/ [3]
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Reviewed-by: Joseph Kogut <joseph.kogut@gmail.com>

---

v2:
 - Pick up review tag
---
 Config.in.legacy                     |  7 +++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/python-xlib/Config.in        |  7 -------
 package/python-xlib/python-xlib.hash |  5 -----
 package/python-xlib/python-xlib.mk   | 14 --------------
 6 files changed, 7 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-xlib/Config.in
 delete mode 100644 package/python-xlib/python-xlib.hash
 delete mode 100644 package/python-xlib/python-xlib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ee2e34822b..8992315454 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_PYTHON_XLIB
+	bool "python-xlib removed"
+	select BR2_LEGACY
+	help
+	  Upstream is no longer maintained, and the package does not
+	  build with setuptools >= 82.
+
 config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..d956dd96e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1759,7 +1759,6 @@ F:	package/python-raven/
 F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
-F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
diff --git a/package/Config.in b/package/Config.in
index 96e113e226..73522de358 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1516,7 +1516,6 @@ menu "External python modules"
 	source "package/python-wsaccel/Config.in"
 	source "package/python-wsproto/Config.in"
 	source "package/python-wtforms/Config.in"
-	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
 	source "package/python-xlutils/Config.in"
diff --git a/package/python-xlib/Config.in b/package/python-xlib/Config.in
deleted file mode 100644
index 081af6a2fc..0000000000
--- a/package/python-xlib/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_XLIB
-	bool "python-xlib"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	help
-	  XLib in pure Python (Py2/Py3 compatible)
-
-	  https://github.com/python-xlib/python-xlib
diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
deleted file mode 100644
index f516d7b4c4..0000000000
--- a/package/python-xlib/python-xlib.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5  20a687ac84ee632aea9b9861206aa0eb  python-xlib-0.33.tar.gz
-sha256  55af7906a2c75ce6cb280a584776080602444f75815a7aff4d287bb2d7018b32  python-xlib-0.33.tar.gz
-# Locally computed sha256 checksums
-sha256  3bb6f6bec94b99e2927a8880bf49c401f5e8f48a20ddea96310860264cae20b0  LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
deleted file mode 100644
index 23c7b39974..0000000000
--- a/package/python-xlib/python-xlib.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-xlib
-#
-################################################################################
-
-PYTHON_XLIB_VERSION = 0.33
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/86/f5/8c0653e5bb54e0cbdfe27bf32d41f27bc4e12faa8742778c17f2a71be2c0
-PYTHON_XLIB_SETUP_TYPE = setuptools
-PYTHON_XLIB_LICENSE = LGPL-2.1+
-PYTHON_XLIB_LICENSE_FILES = LICENSE
-PYTHON_XLIB_DEPENDENCIES = host-python-setuptools-scm
-
-$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
