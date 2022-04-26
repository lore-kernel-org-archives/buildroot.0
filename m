Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4A4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F31640B53;
	Tue, 26 Apr 2022 16:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aeX5SG3nrWk; Tue, 26 Apr 2022 16:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1963240B48;
	Tue, 26 Apr 2022 16:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90A2F1BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF9282F9B
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrUAGXkXIxOa for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:41:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2090E82F80
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:41:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g6so14412579ejw.1
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qYS11bEIzGb2gUKHqR/D74SPVnylbahpz8X7SAJ8pg=;
 b=iiYd3Kt4N5/aypQHNPCbrOdH3igP0c3TJaYNFfsX4eNl9mNBRxtF3A/vgMkZTKxqqI
 bem3qluf4c0JCGrzSm08CZqlNUVqjuMnxxaDkpIpHx03QAXCDbypb5YMtKQZufHoRU58
 5I7yKWFCrnB5MKQx0sIlcaGWYOIsL1HKXAE6P0jmaDQrRG/NIu8zw/0RuD++MJ1H8wjR
 /qqaddLwC0BdsR9JURjtIggYh4H+bJgGjjRqDbJktgDU1qibQ16U4uMmth05vNwQhCKS
 QFcFiFc2grlMpBQW3uCLLZzt+dMII3dcd49tX75q1gjdJMpAvzpesHgawf5yV3CyYGYw
 0PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qYS11bEIzGb2gUKHqR/D74SPVnylbahpz8X7SAJ8pg=;
 b=DCXGsfpGW4ku+0Mv3acmblo4WgoGDppPP9TEDiSMhKBGLWxNV4bUs/8nKJDAkVRAXy
 e27FuDM6yfAf8PdIAFvGOIIvtOuELKGmtSCnnC6fZ4eUj750ToKWLwPso7QKad34rhft
 dCYvJyoHPbYLJnbZpm3bwhzNwLQjLOyqyn3gNFeikCmh/qhn5sVJq2sE3upX0jvtsAXL
 2J1AP18CZqsn6UUBVqQb/7R9sAMn8WxqiFDbZSQK1SYvuDgAE54I475+3vfxi0eET79K
 emT5ojuPFoKWgmwR6jhsTIOvwSMxk+ry8LtvhWdJ3ZrY1JeFfW8uhXt0CfKXkSGZYQQd
 2DWw==
X-Gm-Message-State: AOAM530hyool+bnTEK2IykRjhtanGEaVQEmJWTWt807rVtcpQUFAR8sf
 0wfNOMLEVtCKgma55O2L7FaxYV8AsR4=
X-Google-Smtp-Source: ABdhPJwY7t2TQXnaLC6dEcNqyo58rZoDAPGMu4qaalWdK86Ohah+XeKbmArJP/RqLmbz1Iwl2BOlyg==
X-Received: by 2002:a17:906:4884:b0:6f3:a042:c1c6 with SMTP id
 v4-20020a170906488400b006f3a042c1c6mr8009745ejq.363.1650991263310; 
 Tue, 26 Apr 2022 09:41:03 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a508d17000000b00425d41ab7afsm5208087eds.17.2022.04.26.09.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:41:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:38:35 +0200
Message-Id: <20220426113835.3544757-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.10.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove upstream patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...re.ac-add-an-option-to-disable-tests.patch |  2 +-
 ...entropy-Include-fcntl-h-and-limits-h.patch | 38 -------------------
 package/libgcrypt/libgcrypt.hash              |  4 +-
 package/libgcrypt/libgcrypt.mk                |  2 +-
 4 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index e32f93863..5ddde9df1 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3230,6 +3230,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3231,6 +3231,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
deleted file mode 100644
index 8f76f24c6..000000000
--- a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ffaef0be613121d3ee37867d82932a7a30c2bc6d Mon Sep 17 00:00:00 2001
-From: Heiko Becker <heirecka@exherbo.org>
-Date: Thu, 3 Feb 2022 22:46:41 +0000
-Subject: [PATCH] jitterentropy: Include <fcntl.h> and <limits.h>
-
-* random/jitterentropy-base-user.h: Include <fcntl.h> for O_RDONLY
-* random/jitterentropy-base-user.h: Include <limits.h> for LONG_MAX
-
---
-
-Fixes the build with musl libc.
-
-Signed-off-by: Heiko Becker <heirecka@exherbo.org>
-
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=ffaef0be613121d3ee37867d82932a7a30c2bc6d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- random/jitterentropy-base-user.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/random/jitterentropy-base-user.h b/random/jitterentropy-base-user.h
-index 326dfbed..389106ff 100644
---- a/random/jitterentropy-base-user.h
-+++ b/random/jitterentropy-base-user.h
-@@ -39,6 +39,9 @@
-  * DAMAGE.
-  */
- 
-+#include <fcntl.h>
-+#include <limits.h>
-+
- #ifndef GCRYPT_JITTERENTROPY_BASE_USER_H
- #define GCRYPT_JITTERENTROPY_BASE_USER_H
- 
--- 
-2.11.0
-
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 2ea4d74c2..96f5e6b76 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.0.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.1.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  6a00f5c05caa4c4acc120c46b63857da0d4ff61dc4b4b03933fa8d46013fae81  libgcrypt-1.10.0.tar.bz2
+sha256  ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de  libgcrypt-1.10.1.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index c6c88f607..f28552c6e 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.0
+LIBGCRYPT_VERSION = 1.10.1
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
