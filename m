Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49357C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 18:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9E96112B;
	Tue, 16 Jan 2024 18:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED9E96112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyQFgGGlBaP4; Tue, 16 Jan 2024 18:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4687960E71;
	Tue, 16 Jan 2024 18:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4687960E71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA9871BF473
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 18:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8309C60E71
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 18:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8309C60E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Il5-ejIwV3g6 for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 18:36:35 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 835B3605E3
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 18:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 835B3605E3
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e760e5b49so25785655e9.1
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 10:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705430193; x=1706034993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMxnTnRq2UwBTw4wE3PXkhayxJcDZuaCaCNEdlc6R9c=;
 b=XZbTy8qu1PjLj9lA5KqSeJexbmxGpQWgdWh08BePv72Fb7+h5g1k7iH+y0Cgp9wPxY
 jgGB/Gii8Yl0235r+zD8nRH+pn2y/XfS+C8ChaLdsszx8mhbRd9R7z2L3EdHMKbJ7mCZ
 2qw/cpsmmpmdjyVDoao8eBd11NWU4NNXYULfWeGyh2snsPxZM2YFbK3PU576KOXcygmK
 2Zf7Y9wqN0DBUvZwg3ITNKkFBfFmDJZqXNRkJ1KE3OnO0zF1jPom2eh5BAKqqIG9XzIU
 IvqFiGd2SeeY5oDU89371zmRdqKErW3KrPumyywxWJGfiewQfwoPU4kpQM34fn7mi7AV
 bF1Q==
X-Gm-Message-State: AOJu0YzuZjtoLe9vtBqVkggHmyOuzrofoftqtBEEKoSca368tPFgioi+
 mu9EqJ2gsPLirDMlCyFXGTnGCWI2CIE=
X-Google-Smtp-Source: AGHT+IFUeJ0YZqm7IuXHK3vJNh+o21908JxaJdxJX/hXZSI1hF1Wl8BVWBjVvEV5tTQdS3t4LiYXzw==
X-Received: by 2002:a05:600c:3146:b0:40e:6792:2fb0 with SMTP id
 h6-20020a05600c314600b0040e67922fb0mr2479284wmo.39.1705430192414; 
 Tue, 16 Jan 2024 10:36:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b0040e541ddcb1sm20237316wms.33.2024.01.16.10.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 10:36:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 19:36:29 +0100
Message-ID: <20240116183629.365115-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705430193; x=1706034993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TMxnTnRq2UwBTw4wE3PXkhayxJcDZuaCaCNEdlc6R9c=;
 b=AdpPbkD/cvFY8r3pmACOIgj+XwaXwI5a/c/dp/aFtKtFnw7+lYQkZWVIhcrk8lNUoO
 OdwWDRfSlaK7IXuWDW9F84b7Usi+p0DuICzfUHVF3UPHFzZqVUqIH0PMF0FGMsgDiF+V
 LKCl7MjvbFstzdfDVJCMZXVOxU98RGvKSHZF1XGM2808MpyaMAYuraU2/fNM1zyWmNFF
 By/5a2p2dMfjLgeFO48HW0rpSNl9vgdgv31Uzhveg7ijtUNPUnfIjq4Q6LMFf+idKM8T
 NX2r9zu3MHw0g245yOf+RVDSZqvncuwbZuRwpjvppEMfjzuTPlBDOe3qIRpNY02vWFkG
 1Hug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AdpPbkD/
Subject: [Buildroot] [PATCH 1/1] package/micropython: libffi is optional,
 not mandatory
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libffi is optional, not mandatory since bump to version 1.22.0 in commit
1e12b7dd49d1c64a5195f226e9e4da21e84f5d0c and
https://github.com/micropython/micropython/commit/89b320737652829edbab921e86d7ad3962d86d9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/micropython/Config.in      | 1 -
 package/micropython/micropython.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index b5dc47279d..30161c8b70 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBFFI
 	help
 	  Micro Python is a lean and fast implementation of the Python
 	  3 programming language that is optimised to run on a
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 6e0af59f06..c7873ab62a 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -12,7 +12,7 @@ MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # and most of the copied code is not used in the unix build.
 MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
-MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
+MICROPYTHON_DEPENDENCIES = host-python3
 MICROPYTHON_CPE_ID_VENDOR = micropython
 
 # Use fallback implementation for exception handling on architectures that don't
@@ -36,6 +36,13 @@ MICROPYTHON_MAKE_OPTS += \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	CWARN=
 
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+MICROPYTHON_DEPENDENCIES += host-pkgconf libffi
+MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=1
+else
+MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=0
+endif
+
 define MICROPYTHON_BUILD_CMDS
 	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
 	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
