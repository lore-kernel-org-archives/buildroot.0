Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC501C432BE
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 22:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E276108F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 22:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E276108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A3480D63;
	Thu, 19 Aug 2021 22:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7c99i_pkewe; Thu, 19 Aug 2021 22:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63AF580D00;
	Thu, 19 Aug 2021 22:10:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 885351BF866
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 22:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8408940176
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 22:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zq-P52IBdffm for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 22:09:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E340C400C3
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 22:09:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so7774885wme.1
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZT/2Qfwqj4+jC8bR0CjQI4pI2zF3ZcZaGsl6b/VU2c=;
 b=veHeUOqWouwY3J7aswPDVY8WIzsBTRnXiyOw0ZovXP2EPc4gK6KJJppgLs1CcSP5t4
 MhVw4/EMy/8pbZPye4ZhMJTiD9AU29ZbX3NJaI6BYUNcGf+Crh5Vy01x3OUP4VBjOlR/
 O6Lm6XTHW5mRkqyDwhym6yvctZsEpgbrZeVxGd/cvwutc8USmMx2eiiEPbZ8/UECQRBM
 iNYtMgNFv4d2l2SQhvx2TRE0XyOYL3u5qxxX23rHi4kE2t2U+SjXZ9CKnTqrWBrrEc/J
 nYDVVm6NiAl/cbCTK8VTSrJBU7hJicJReW83UgbZXF4vKyglodHQ12iVUMeGQQsYQxB2
 YCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZT/2Qfwqj4+jC8bR0CjQI4pI2zF3ZcZaGsl6b/VU2c=;
 b=Ff34+B4MN/CzuYN5NalhIW5cDkTKOa8H9G3D0jo1wFVY5TdQuRR3EW0Y/u/50gp7Gl
 BIJHCGOPTXR1khV7yW7PmcyMaNLJO1/6oD69xj9gVQgh3ITcRpbE24w0B1m+cIoTVsJp
 HTyvo+tMhcbXt9StfATIJdzhuS5x5cExn3hyFlv6ZJu0XrlE4XKFy1pPKoglPqbAemje
 /SgDSzDGjNdyntW9hv1IN6qzaKWGks2FM1o+JBbo+EvrlME+8CGrNNV785LeFj/Jig/3
 /OXF0HcJHpvYBo6u9HrrZV1otJ3vSMbrCxeMK7lJtZBoJ5cyf3/0gb3viZJLAhz8/lrQ
 h09w==
X-Gm-Message-State: AOAM530N+Yyz0gcdtRo7SNDJros8AQ17ItZ0OCFOGII99uCzzCDFyx4W
 Xs/aMMn5AtUdLhR61r06VGxbbOITHRPZSA==
X-Google-Smtp-Source: ABdhPJze/z35Fmebpnagqrbnu4n3jiqWrFhhRPKNdxJ5iRiaVvDlK2EJp/wyKN40Z+dT4hMMM2JXog==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr681558wmf.53.1629410993666;
 Thu, 19 Aug 2021 15:09:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id y14sm2195753wma.28.2021.08.19.15.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 15:09:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 00:09:45 +0200
Message-Id: <20210819220945.23041-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819220945.23041-1-fontaine.fabrice@gmail.com>
References: <20210819220945.23041-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,2/2] package/libmcrypt: drop package
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

Drop libmcrypt which is a cryptographic package that is not maintained
anymore. Here is an extract of https://en.wikipedia.org/wiki/Mcrypt:
"The last update to libmcrypt was in 2007, despite years of unmerged
patches. These facts have led security experts to declare mcrypt
abandonware and discourage its use in new development.".

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Yann E. Morin):
 - Update commit message and Config.in.legacy

 Config.in.legacy                   | 10 ++++++++++
 package/Config.in                  |  1 -
 package/libmcrypt/0001-nocxx.patch | 15 ---------------
 package/libmcrypt/Config.in        |  7 -------
 package/libmcrypt/libmcrypt.hash   |  3 ---
 package/libmcrypt/libmcrypt.mk     | 15 ---------------
 6 files changed, 10 insertions(+), 41 deletions(-)
 delete mode 100644 package/libmcrypt/0001-nocxx.patch
 delete mode 100644 package/libmcrypt/Config.in
 delete mode 100644 package/libmcrypt/libmcrypt.hash
 delete mode 100644 package/libmcrypt/libmcrypt.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7cb0c40782..68c9f3ca49 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_LIBMCRYPT
+	bool "libmcrypt package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as "the last update to libmcrypt
+	  was in 2007, despite years of unmerged patches. These facts
+	  have led security experts to declare mcrypt abandonware and
+	  discourage its use in new development" (extract from
+	  https://en.wikipedia.org/wiki/Mcrypt).
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
