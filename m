Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113F6ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 07:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8304C4036F;
	Sun, 28 Aug 2022 07:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8304C4036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-usCbiSS3mG; Sun, 28 Aug 2022 07:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D24140339;
	Sun, 28 Aug 2022 07:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D24140339
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1D61BF33C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 07:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12F8482438
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 07:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F8482438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75WbbCOISHWd for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 07:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9838081CE9
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9838081CE9
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 07:15:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e20so6470890wri.13
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 00:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=l0dsEeK03RmoyMmO1lG6/LJHA9acdZIfeVBKXo4H77k=;
 b=pLGFNNShEukyGxv8U1ZskAmrlJIt4+9lY685mRr9ndcvQERo6/oCLAScwW4mshImUo
 EVf0oI4+pF+56cDn85vWOto1OPcTVQvbUkExfGx6NP4OqNqo6GW6ejW18ML0liVvte6t
 aRiZkK+1bw37oY5Tp8+VUt/xwPeHVhLrZqJF+BtKHfzfaBdtsCZ9BU/8fXVUVPnd/OUr
 9MTV5XmyFT7gaOH8RAlNpkSsZvsbh1yCK3WOYq7Ot/vgteIvICXh+HPY9iWmq/ZS2l8b
 souhilajQDtActMhWyExr+Plv636SmAkqdJOcVLvHBxW5PjxFxsDVOoE3ATtgrwuzCTu
 IZ8w==
X-Gm-Message-State: ACgBeo29eXSgVYvRcXPaTKzMWKnPvKv7mFNyQYquYj7fy4j0G0qZA8Px
 ojrhdnG+yEuPJFZAuGLg/yP9HsM+Vtc=
X-Google-Smtp-Source: AA6agR5M8OpiYy52radqWt/gu7Hv0g7nBhmvjdqLxbJ4ic5a0vMUt5DOjOpEmTS1x0Fo1rW7xrt32w==
X-Received: by 2002:a5d:6d0f:0:b0:225:273b:d0a2 with SMTP id
 e15-20020a5d6d0f000000b00225273bd0a2mr3341597wrq.668.1661670907533; 
 Sun, 28 Aug 2022 00:15:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a31fd05e0fsm6675007wms.2.2022.08.28.00.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 00:15:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 09:14:22 +0200
Message-Id: <20220828071422.267165-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=l0dsEeK03RmoyMmO1lG6/LJHA9acdZIfeVBKXo4H77k=;
 b=fvdYXPM+xmqih49ecwIUdVe/86UKRg8F6w2nVDWr1CFpYIV8qiUCJGVoIuipiLo5iK
 RGwH6imOuU3P/uQFvz10QszD19L3pfz5RTBWJY3X1P/ANPSi3EIoKr3GW3BgZkRaWZ6c
 ti1WMWjfUyj2RQLLBekON2eJlkS2cBaNY5BarITCHE6Nu7Zz3lm0KhErnT6ryI01eEn7
 vFvS+LDg05zp8DENm8sO10NvH8d5FjnUJplPojFJtK+A+OqQ1biAiKTm8T3nf4Qw/Adg
 iOmGmBdOniLtUFfFORji7maUcvrC8B7GP9CiLVKNEE++xXF/9JuFHiqKbIKomNOLM7Vl
 eBKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fvdYXPM+
Subject: [Buildroot] [PATCH 1/1] package/memcached: disable -Werror
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -Werror to avoid the following build failure:

In file included from hash.c:7:
xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
 2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
      |     ^~~~~~~
xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]

Fixes:
 - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0003-configure.ac-add-disable-werror.patch | 65 +++++++++++++++++++
 package/memcached/memcached.mk                |  2 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/memcached/0003-configure.ac-add-disable-werror.patch

diff --git a/package/memcached/0003-configure.ac-add-disable-werror.patch b/package/memcached/0003-configure.ac-add-disable-werror.patch
new file mode 100644
index 0000000000..dab9b8835d
--- /dev/null
+++ b/package/memcached/0003-configure.ac-add-disable-werror.patch
@@ -0,0 +1,65 @@
+From 8497f7ed38146378a988bc22800b3a5eba38b0fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 13 Jun 2022 16:29:38 +0200
+Subject: [PATCH] configure.ac: add --disable-werror
+
+Allow the user to disable -Werror to avoid the following build failure:
+
+In file included from hash.c:7:
+xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
+ 2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
+      |     ^~~~~~~
+xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/memcached/memcached/pull/926]
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3337fe7..7683b8f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,6 +114,9 @@ AC_ARG_ENABLE(static,
+ AC_ARG_ENABLE(unix_socket,
+   [AS_HELP_STRING([--disable-unix-socket], [Disable unix domain socket])])
+ 
++AC_ARG_ENABLE(werror,
++  [AS_HELP_STRING([--disable-werror], [Disable -Werror])])
++
+ dnl **********************************************************************
+ dnl DETECT_SASL_CB_GETCONF
+ dnl
+@@ -783,6 +786,10 @@ AM_CONDITIONAL([BUILD_SPECIFICATIONS],
+                [test "x$enable_docs" != "xno" -a "x$XML2RFC" != "xno" -a "x$XSLTPROC" != "xno"])
+ 
+ 
++if test "x$enable_werror" != "xno"; then
++   CFLAGS="$CFLAGS -Werror"
++fi
++
+ dnl Let the compiler be a bit more picky. Please note that you cannot
+ dnl specify these flags to the compiler before AC_CHECK_FUNCS, because
+ dnl the test program will generate a compilation warning and hence fail
+@@ -790,12 +797,12 @@ dnl to detect the function ;-)
+ if test "$ICC" = "yes"
+ then
+    dnl ICC trying to be gcc.
+-   CFLAGS="$CFLAGS -diag-disable 187 -Wall -Werror"
++   CFLAGS="$CFLAGS -diag-disable 187 -Wall"
+    AC_DEFINE([_GNU_SOURCE],[1],[make sure IOV_MAX is defined])
+ elif test "$GCC" = "yes"
+ then
+   GCC_VERSION=`$CC -dumpversion`
+-  CFLAGS="$CFLAGS -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
++  CFLAGS="$CFLAGS -Wall -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
+   if test "x$enable_asan" = "xyes"; then
+     CFLAGS="$CFLAGS -fsanitize=address"
+   fi
+-- 
+2.35.1
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 5249195c2e..bddb713458 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -8,7 +8,7 @@ MEMCACHED_VERSION = 1.6.16
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-MEMCACHED_CONF_OPTS = --disable-coverage
+MEMCACHED_CONF_OPTS = --disable-coverage --disable-werror
 MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
