Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99755C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22F4740635;
	Mon,  7 Nov 2022 22:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22F4740635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hE6pWYVzmahn; Mon,  7 Nov 2022 22:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E2724026A;
	Mon,  7 Nov 2022 22:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E2724026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7341BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34EF64014B
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EF64014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHxtPBC4WIJQ for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:41:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4288140329
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4288140329
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:41:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y16so18274065wrt.12
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 14:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AFoz82krAoXNqYX+4TNO806bunvLD1iFDr84EKVQswI=;
 b=K4H16wNC7l6ORJxY95yRbEsFBVQJWR9uz1kLnPhLCJyjwqQVUTDYDtEmRyA73YPU2z
 lMXwnehPA8sEMsWk3aNXKxlWpAX92m78kfAaw2MVIWr6bKkH73KubClzmH0RkwmEUZEU
 GgSjftcuncm4/3tH8z6+oIi19WwqV0suhsSQp0FzrvQo36MJOGtVeFq7qaXnDE9WfuX2
 LGgjo/TO3X17Xkd6UIB8NCKvcWodDl3SnF3xOqz40rXS7sMy5EjpXIweybNlrnNISB6m
 rF8gz5dFsq/x4ehSPOgoUhdI3kbaQq47Qv7Ogxml87jB7mC3/wOb8sSbVgNuxUZWp30M
 geUg==
X-Gm-Message-State: ACrzQf0Ygjb3dvgj57AMKWSpoNuzqawKdPMT2YJVovG0Cip3fL2geXvf
 8PdgWYqnKW7VAsSY/GwN4QDsbWGJzAQ=
X-Google-Smtp-Source: AMsMyM46laHVcY0zLT61aOqn+j2Ex9ItnX+01lzrEUqPXFrQntn3AJaj+uY1Fd88gFNPMnImjJIkog==
X-Received: by 2002:a05:6000:114d:b0:236:4a87:2c25 with SMTP id
 d13-20020a056000114d00b002364a872c25mr636177wrx.19.1667860886020; 
 Mon, 07 Nov 2022 14:41:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c12cb00b003cf75f56105sm10318408wmd.41.2022.11.07.14.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:41:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Nov 2022 23:41:05 +0100
Message-Id: <20221107224105.461499-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AFoz82krAoXNqYX+4TNO806bunvLD1iFDr84EKVQswI=;
 b=fPYhmlG4MAl2bTnKiphxpcvUgHsXeAp+G+8lgk0NfITvzYJ4kRBpxbZmE3t0VdvHaJ
 FrtaoA0FXMs3IPu3adaHc536xr4ohUFPo8ZccTc/Kt3qb+7p7Vb+/s894ZlDNKgCRNgg
 kx936FhbUlaMdzuuLfD+qqJg2Ru9L6WAypX8bWJctr9h8ZchGLWEtxjFG/+cNsBjdrsj
 jSkqQYm55q8x5FXgCHgxWxbTiBLeRa/SwMZzYfZnhPqHAuOXVtvuzqkiyt2y+MkD+/6q
 pAzy+mOrYac706ZH1gqX5ChWjWUmXe7qc3NsEgV2HV3E76Ps1aRC7Yy+z+OEMG/+LJww
 2DmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fPYhmlG4
Subject: [Buildroot] [PATCH 1/1] package/libkcapi: disable -Werror
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
Cc: Tan En De <ende.tan@starfivetech.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure (disabling -Werror seems to be the
only "solution": https://github.com/smuellerDD/libkcapi/issues/136):

lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
lib/kcapi-kernel-if.c:212:12: error: unsigned conversion from 'long int' to 'long unsigned int' changes value from '-4' to '4294967292' [-Werror=sign-conversion]
  212 |   header = CMSG_NXTHDR(&msg, header);
      |            ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c789d43e71e6075e297bef58d888228a89055bbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libkcapi/0002-Add-disable-werror.patch    | 46 +++++++++++++++++++
 package/libkcapi/libkcapi.mk                  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 package/libkcapi/0002-Add-disable-werror.patch

diff --git a/package/libkcapi/0002-Add-disable-werror.patch b/package/libkcapi/0002-Add-disable-werror.patch
new file mode 100644
index 0000000000..4f2f55f145
--- /dev/null
+++ b/package/libkcapi/0002-Add-disable-werror.patch
@@ -0,0 +1,46 @@
+From c27b154f03ad7e94447c7114d73aee60f0098093 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 7 Nov 2022 13:38:06 +0100
+Subject: [PATCH] Add --disable-werror
+
+Allow the user to disable -Werror through --disable-werror
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/libkcapi/commit/c27b154f03ad7e94447c7114d73aee60f0098093]
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 3 +++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1c95d3d..cddedac 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,10 @@ ACLOCAL_AMFLAGS = -I m4
+ AUTOMAKE_OPTIONS = subdir-objects
+ lib_LTLIBRARIES = libkcapi.la
+ 
+-COMMON_CPPFLAGS = -Wextra -Wall -pedantic -fwrapv --param ssp-buffer-size=4 -O2 -Werror -std=gnu99 -Wconversion
++COMMON_CPPFLAGS = -Wextra -Wall -pedantic -fwrapv --param ssp-buffer-size=4 -O2 -std=gnu99 -Wconversion
++if ENABLE_WERROR
++COMMON_CPPFLAGS += -Werror
++endif
+ COMMON_LDFLAGS =  -Wl,-z,relro,-z,now
+ 
+ libtool: $(LIBTOOL_DEPS)
+diff --git a/configure.ac b/configure.ac
+index cb910e2..e230577 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,6 +76,9 @@ AX_ADD_FORTIFY_SOURCE
+ 
+ AC_CHECK_API_VERSION
+ 
++AC_ARG_ENABLE([werror], [AS_HELP_STRING([--disable-werror], [Disable -Werror])], [with_werror=$enableval], [with_werror=yes])
++AM_CONDITIONAL([ENABLE_WERROR], [test "x$with_werror" = "xyes"])
++
+ AC_ARG_ENABLE([kcapi-test], [AS_HELP_STRING([--enable-kcapi-test], [Compile kcapi test program])], [with_kcapi_test=$enableval])
+ AM_CONDITIONAL([ENABLE_KCAPI_TEST], [test "x$with_kcapi_test" = "xyes"])
+ 
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index e88928a74d..c6251c286c 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_DB2PDF="" \
 	ac_cv_path_DB2PS="" \
 	ac_cv_path_XMLTO=""
+LIBKCAPI_CONF_OPTS = --disable-werror
 LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_ASYM),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
