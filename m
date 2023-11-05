Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518F2C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82F5E40A62;
	Sun,  5 Nov 2023 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82F5E40A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SA718KQs5LS2; Sun,  5 Nov 2023 20:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C09640A7B;
	Sun,  5 Nov 2023 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C09640A7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D40A1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDC040A5F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDC040A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8oj_GxaqqI9 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:02 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AE2140993
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AE2140993
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so3651356b3a.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215961; x=1699820761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FaAZz5X1k9gNFgAkuMB6PL3TIN4MoWl7Z1Za4J3YoU=;
 b=oF/kDjtw89Flv5IKZ3crs+dQ9meHeVmLBlXSG3YDb0rRSMCD75cNa6dYuJ8kp3BmgZ
 W/Nvat/vDfdX4aQuj8n4aZDdvsp0po/I1DR3It1JdSf8icTXd1LXLXYVN6DPLk8LD7c/
 OUPTMUs2XZQxSoghfuuviLeBP1oPaYnpG8RsaAbznxi2FhSoui0R3OG2EbG8Qu0RX4V6
 4cpZaQNr+f2fKpQUlNZtDXlUpNRWN0nylCf6TWOOFKK8+oX7ztEgcRrv1RPXG1uRkt7W
 6RwdMS8wNhL2Ud9yj3xSUfgw+Pnl4aN9JCJc8mrjF99X1kzULYDYZ+eZ5S/q3s59a6Yi
 oo6A==
X-Gm-Message-State: AOJu0YxFAYsTV2RQ2Us2nOyWmEqBFGl2JRsngvruA5vtIZLKgp5wlyfF
 +gbw/ZEF0GmliGd13gKa6SIhgcUce0HVV0pwp9Ipqt2dNHM=
X-Google-Smtp-Source: AGHT+IHQfV+GsdAICJiZ23bFKXwZjUhVDgapWsIKdCSCTiU4Ci7GDp/LVFq8W7422L7R0XrSGTTgYw==
X-Received: by 2002:a05:6a20:da9a:b0:13d:d5bd:7593 with SMTP id
 iy26-20020a056a20da9a00b0013dd5bd7593mr30697111pzb.12.1699215960987; 
 Sun, 05 Nov 2023 12:26:00 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:00 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:33 -0700
Message-ID: <20231105202555.359391-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215961; x=1699820761;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FaAZz5X1k9gNFgAkuMB6PL3TIN4MoWl7Z1Za4J3YoU=;
 b=hIkq0aiW5N8ZwQxPv52VcxbBur4wkJfYh7cFHDdQzGuz+lhMVIsHY6AKvj8PyQuuWs
 jHhJUR00S5j8dE5KHduNiJYUCYPT83tl/JR3r/lWsBTCBISxYP8R/UihMjJrzyy+AkqD
 RX5+PWof1NUCn8nXJMCU5CYrzic8ZlkcN9MZI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hIkq0aiW
Subject: [Buildroot] [PATCH v2 02/24] package/python3: use upstream build
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
 ...Add-an-option-to-disable-uuid-module.patch | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index be46e46c04..1070438ffb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1163,7 +1163,6 @@ package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
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
