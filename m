Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD986C43216
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:43:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77256610A2
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77256610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2C260A68;
	Thu,  5 Aug 2021 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wt981vmrcFgu; Thu,  5 Aug 2021 17:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EDCD60A3B;
	Thu,  5 Aug 2021 17:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D310E1BF3D7
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C24D8405AF
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCarXCm0yKdk for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 17:43:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D79EB4056C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 17:43:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h13so7632966wrp.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGPQeiY/VnAviA9H2KZwQ1vEhsSEnrmzmyL/mbI1PJg=;
 b=DPYB5Ni8c1b9R+QhdGY/hbnGJh/Rur3/UZkAyEmr+KVp1RSeAStaELEOXJCEoQOVTJ
 xwUPW9usAs344hibz9ZXpUNWzoWA+XROpj4EGts0eCxft7nIydwnMR1ds553M4R0Qqfi
 Mt060YP5bm0QU8bD7TvVGEXC0iXzDCQp8XWT5KUfbZEzSJMoPKbzOgD1f2l63uMNK8uB
 /kvlKSaZOqJ4c/USqMCd/I6f+emlJOnWbpbk1G/wGDkIZR/zXeqGSjZFBBL1+tkItdy2
 FH4DBC62BKKxjW6O9C8XtJkOtNyw80DmzuNmI2fR4MwfF0XLPwNhpzxm300G7adhTjV3
 lkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JGPQeiY/VnAviA9H2KZwQ1vEhsSEnrmzmyL/mbI1PJg=;
 b=f8KVX7mFqEE5v5Vgf0/GIjEActuGaX2DDrEUHBu9KCmgE5qtYz6lNRQuvzcIQDzR3+
 UBDOsc5D5CtvZYuFaokngB7Y5cscKaALIOkfATS8jHZP+ZglOsDW5dBGU3vZj4oEcKPk
 ZSXjN4gk3bcBx4jPCn4X/eJnpj5F78Y8FBISb+Y/hMgNKDRwXoUiN4xeZ7GPccONKgYQ
 AYt3YKyMVU5QsiC10VIeGmhEU4P71bEL4KORbILYNr+Smpj1GZylv1m1xZf9n/QvK5BA
 4nEafWUwSOV+8E4rBu1BvQytjNI8aMtxYp44nboZxTvFjNJpO5yOjOdnniQWEuhE9A/W
 N2KA==
X-Gm-Message-State: AOAM530MndkP9/e3QIGuH4R+b/EEiP+kL+oBgUEAp3p2uUqtL65E6GdU
 MeY0DnlapfwYwBbtWnhtYUu4Fw0a0RLqXw==
X-Google-Smtp-Source: ABdhPJwHxon4E/0zH0b5c/2m2629PoBUW6rd8T6/pPVj2seDVQC6W5Mf+p2p+oYpY8S8DhzN2f3jTQ==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr4267735wrr.28.1628185385902; 
 Thu, 05 Aug 2021 10:43:05 -0700 (PDT)
Received: from kali.home (pop.92-184-97-187.mobile.abo.orange.fr.
 [92.184.97.187])
 by smtp.gmail.com with ESMTPSA id w10sm6547308wrr.23.2021.08.05.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:43:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 19:42:52 +0200
Message-Id: <20210805174252.2661314-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805174252.2661314-1-fontaine.fabrice@gmail.com>
References: <20210805174252.2661314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libmcrypt: drop package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Drop libmcrypt which is not maintained anymore (no release since 2007).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                   |  7 +++++++
 package/Config.in                  |  1 -
 package/libmcrypt/0001-nocxx.patch | 15 ---------------
 package/libmcrypt/Config.in        |  7 -------
 package/libmcrypt/libmcrypt.hash   |  3 ---
 package/libmcrypt/libmcrypt.mk     | 15 ---------------
 6 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 package/libmcrypt/0001-nocxx.patch
 delete mode 100644 package/libmcrypt/Config.in
 delete mode 100644 package/libmcrypt/libmcrypt.hash
 delete mode 100644 package/libmcrypt/libmcrypt.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1d34f81815..b127a5b976 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_LIBMCRYPT
+	bool "libmcrypt package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is not maintained anymore
+	  (no release since 2007).
+
 config BR2_PACKAGE_MCRYPT
 	bool "mcrypt package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index ab0f74b0e3..55f4947e65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1376,7 +1376,6 @@ menu "Crypto"
 	source "package/libgpgme/Config.in"
 	source "package/libkcapi/Config.in"
 	source "package/libksba/Config.in"
-	source "package/libmcrypt/Config.in"
 	source "package/libmd/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
diff --git a/package/libmcrypt/0001-nocxx.patch b/package/libmcrypt/0001-nocxx.patch
deleted file mode 100644
index b1c28713a1..0000000000
--- a/package/libmcrypt/0001-nocxx.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-libmcrypt doesn't use C++ so remove the check.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmcrypt-2.5.8.orig/configure.in libmcrypt-2.5.8/configure.in
---- libmcrypt-2.5.8.orig/configure.in	2013-01-07 12:20:44.332200669 -0300
-+++ libmcrypt-2.5.8/configure.in	2013-01-07 12:20:50.405390565 -0300
-@@ -19,7 +19,6 @@
- 
- AC_PROG_MAKE_SET
- 
--AC_PROG_CXX
- AC_PROG_CC
- AC_PROG_CPP
- AC_PROG_INSTALL
diff --git a/package/libmcrypt/Config.in b/package/libmcrypt/Config.in
deleted file mode 100644
index 784d2c2af6..0000000000
--- a/package/libmcrypt/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBMCRYPT
-	bool "libmcrypt"
-	help
-	  libmcrypt is a library that provides uniform interface to
-	  access several encryption algorithms.
-
-	  http://mcrypt.sourceforge.net/
diff --git a/package/libmcrypt/libmcrypt.hash b/package/libmcrypt/libmcrypt.hash
deleted file mode 100644
index 30b57522b8..0000000000
--- a/package/libmcrypt/libmcrypt.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e  libmcrypt-2.5.8.tar.gz
-sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libmcrypt/libmcrypt.mk b/package/libmcrypt/libmcrypt.mk
deleted file mode 100644
index e93f0136b3..0000000000
--- a/package/libmcrypt/libmcrypt.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# libmcrypt
-#
-################################################################################
-
-LIBMCRYPT_VERSION = 2.5.8
-LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
-LIBMCRYPT_AUTORECONF = YES
-LIBMCRYPT_INSTALL_STAGING = YES
-LIBMCRYPT_LICENSE = LGPL-2.1
-LIBMCRYPT_LICENSE_FILES = COPYING.LIB
-LIBMCRYPT_CONFIG_SCRIPTS = libmcrypt-config
-
-$(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
