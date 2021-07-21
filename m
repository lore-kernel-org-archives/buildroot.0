Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0773AC6377C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19096023D
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19096023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D86440146;
	Wed, 21 Jul 2021 22:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbttXekfb0FB; Wed, 21 Jul 2021 22:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFF724010D;
	Wed, 21 Jul 2021 22:25:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29F021BF3D4
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19E456079F
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOVlW8MSRuN9 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:25:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BAFA6062A
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:25:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so1820600wms.5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 15:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykinyWqdOEFtdLPkQFjtlo9Wd16ZsPoeqI4smTYtk8o=;
 b=TKpl8fQA2cKz+0Xd8qosNABOiK0mOgTtcS8HZnRwCz9uL5ZifnnofiIgRzdIDR36ef
 3gDfygDX8IEjYxBIYj9P0r7YkXxl2iyHPj0GFAZ7wdSAE+pkqAXqiUuEsxmUMWAE/DcL
 Z6GNYgTneuugFFWbsqJS6L/PgOxOtVa5E7B/XONvBp4SmiAFO+tFgeuac9EV4YZZX0dF
 syesPYeqqAGYXc46LrT5t4+G1ZLShOqbaG9JExaX7BayqmT+0rWGsFdq18PsmZ7lrLfd
 bP8Z4ocTW8/7jRdMYeuxO/Vo7b1H+CryerlvssnEqid0ITrGOOPAaHIwbBDNQWIJ4hVD
 uXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykinyWqdOEFtdLPkQFjtlo9Wd16ZsPoeqI4smTYtk8o=;
 b=PUjHrod8ofaJzLslLCnsgRBjseL5iLcl0TaF9QBGcEByZ8Ch/+qH28BwK4fOc7r6Bz
 1/2cQUvCXaX3gVQE3qNpHyv2wYWn5Y8ngGcBMLw24zGPenXg+5ms9FHPvmLahuFMNZ9/
 sPzIELKiTVm8XXcVawa7EokKZygO3ktuwHpF6ub/ea1ZPgwZs0Ei8vEYaKXqJ/t1Jtgm
 wLMSUFPcxjwcGelDMokdaFqnR0K31Cfr5xkxblFAoMR6LgwE/1OxFxCInZs2cke8A3qU
 riKMHyxVjdzt0stlcmIm2vzBJpzrZXbFuVnhIn4Q1xwVBh6q1eAH5F8QRZkQ+MLWLKSC
 28fw==
X-Gm-Message-State: AOAM531LPpoGSBvYunhqU7/z3XtpisLdjXSW6LzxDuhhfdtGVdBBD/av
 hWbEzxXaMqfMTiII0Px9NPm26Z69BMVwBw==
X-Google-Smtp-Source: ABdhPJy8FXS8GbZCKLMh4JEL0qB1mV8spzjM2WcYcqGO4boLbY9GbyHR8TmF4kZxPvkM3zWhcat00Q==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr6244836wmk.79.1626906330946; 
 Wed, 21 Jul 2021 15:25:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id a7sm17904828wru.67.2021.07.21.15.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 15:25:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 00:24:59 +0200
Message-Id: <20210721222459.1168515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gumbo-parser: fix build without C++
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build without C++ fails since the addition of the package in commit
f6628763eb302f15f861e0ce7bfc44b34b066bea

Fixes:
 - http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-configure.ac-fix-build-without-C.patch | 63 +++++++++++++++++++
 package/gumbo-parser/gumbo-parser.mk          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch

diff --git a/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
new file mode 100644
index 0000000000..cf90e6f3b1
--- /dev/null
+++ b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
@@ -0,0 +1,63 @@
+From 968975107af5f4382e3e9410a635e32c14cea75f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Jul 2021 23:47:26 +0200
+Subject: [PATCH] configure.ac: fix build without C++
+
+Fix the following build failure raised on toolchains without C++:
+
+checking whether the C++ compiler works... no
+configure: error: in `/home/buildroot/autobuild/run/instance-0/output-1/build/gumbo-parser-0.10.1':
+configure: error: C++ compiler cannot create executables
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/google/gumbo-parser/pull/426]
+---
+ Makefile.am  | 2 ++
+ configure.ac | 6 +++++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cb62459..5bebd92 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -105,7 +105,9 @@ gumbo_test_DEPENDENCIES += check-local
+ gumbo_test_LDADD += gtest/lib/libgtest.la gtest/lib/libgtest_main.la
+ endif
+ 
++if HAVE_EXAMPLES
+ noinst_PROGRAMS = clean_text find_links get_title positions_of_class benchmark serialize prettyprint
++endif
+ LDADD = libgumbo.la
+ AM_CPPFLAGS = -I"$(srcdir)/src"
+ 
+diff --git a/configure.ac b/configure.ac
+index 32dc9b9..172a36b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -9,8 +9,8 @@ AC_CONFIG_SRCDIR([src/parser.c])
+ AC_CONFIG_FILES([Makefile gumbo.pc])
+ 
+ # Checks for programs.
+-AC_PROG_CXX
+ AC_PROG_CC_C99
++AC_PROG_CXX
+ 
+ # Checks for libraries.
+ 
+@@ -27,6 +27,10 @@ AC_CHECK_LIB([gtest_main],
+              AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [true]),
+              AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [false]))
+ 
++AC_ARG_ENABLE([examples],
++              AS_HELP_STRING([--disable-examples], [Disable examples]))
++AM_CONDITIONAL([HAVE_EXAMPLES], [test "x$enable_examples" != "xno"])
++
+ # Init Automake & libtool
+ AM_INIT_AUTOMAKE([foreign subdir-objects])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+-- 
+2.30.2
+
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index aedc56cef1..8c9330ae70 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -10,5 +10,6 @@ GUMBO_PARSER_LICENSE = Apache-2.0
 GUMBO_PARSER_LICENSE_FILES = COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES
 GUMBO_PARSER_AUTORECONF = YES
+GUMBO_PARSER_CONF_OPTS = --disable-examples
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
