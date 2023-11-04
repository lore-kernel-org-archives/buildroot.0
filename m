Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BF5C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE7182331;
	Sat,  4 Nov 2023 14:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE7182331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-ukky2OnYDz; Sat,  4 Nov 2023 14:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B3F82332;
	Sat,  4 Nov 2023 14:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B3F82332
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01F511BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1EB41DF1
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1EB41DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZc3fHQWOSlr for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:05:34 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3509841DED
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3509841DED
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso1699712f8f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 07:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699106731; x=1699711531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZi0OCQeMOVqFLHpkekVVKv7+FtLhZhpdZVx7qFrxGM=;
 b=PNGNTpYA+uEimbWgtf0urCXwxi47yAKWSmABzbcFKxyVMb+4pD7zXFe3EB+UQ4MHVJ
 Dw+1NE8StHDLDHR8YgFgL+tjTJEYsN0Q8wAcketae6sfSlTzLWENedXwFUmyactWSS3Z
 XVDNBMVIxqobXtNNL84Bc9ZPLvh/6aj40g5RyV6F4xgk69hQeks14VV5wzvBu0BUJPZY
 Xof7WERusLMjctCOzeigK5rui08sSrorTVGbCpQGM2TiT7tDM9duF5FsTq3mUb184qEt
 Eg/Uu5vitOp7LFf5VIL28iAM2NiU+HTwAoekinktTsWHXkRz/BZhQl6DPwsI41EFxR4/
 wJkw==
X-Gm-Message-State: AOJu0YzTXrIlPkagi1VgaTsjuk4Lg3pE/gtJMeSJ0aRkkKVJVxnn9k4k
 1pGjUiXGI4cFKkCB8jQrRtMUlMI3qgQ=
X-Google-Smtp-Source: AGHT+IE0tBABb9e3zRosaHF+aR9flBXT84Or3SF0FRH2k5o0OxW0wv/glWyonZpn8UBF+k2HwrYUQg==
X-Received: by 2002:a5d:5002:0:b0:32d:88dc:b219 with SMTP id
 e2-20020a5d5002000000b0032d88dcb219mr18319667wrt.45.1699106730911; 
 Sat, 04 Nov 2023 07:05:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020adff609000000b0032d8034724esm4480349wrp.94.2023.11.04.07.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 07:05:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 15:05:24 +0100
Message-ID: <20231104140524.46968-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104140524.46968-1-fontaine.fabrice@gmail.com>
References: <20231104140524.46968-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699106731; x=1699711531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZi0OCQeMOVqFLHpkekVVKv7+FtLhZhpdZVx7qFrxGM=;
 b=DOzC0CVpL6xzCjEAMbpLWpbqGG7HR7XB2Xp0iwNRop3fK+/9kbucdbwqd9g0xpbDdE
 tkXR1bVVzhUMqDnWQE39wY+kJSJglChq9XrYBvLI18t+OzX/Lcx8ehWnAOmU7GzWAASz
 iiEZJXjrBNdvUOIUQhp4g+RKEU0VMjtdmeBQ6Vuxi6Zb7O+j3GND5XvdiwlX7IPux7M5
 uyH5WD2T/tN/us593hQl6JkLYpRzYYMBnW9h3EW5H1YLk3fADZzozcIgP9znJyBYc9T2
 j48eB2T8r2gGCdQQWDyJYuGpBJIJZRx5EVLEC8cwiIpHbBbKrEn9G8QtC+UySQNe2KbA
 /a2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DOzC0CVp
Subject: [Buildroot] [PATCH v2,
 2/2] package/freeradius-server: bump to version 3.2.3
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh patches
- autoconf must be switched to autoreconf because of
  https://github.com/FreeRADIUS/freeradius-server/commit/7cd23f2de660fc07bdd53816c646e7600f57b8dd
- redis cache module is available since
  https://github.com/FreeRADIUS/freeradius-server/commit/575bff481005f060abb7d1a2f5e6dacda41dcbec

https://github.com/FreeRADIUS/freeradius-server/blob/release_3_2_3/doc/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add rlm_cache_redis

 .../0001-jlibtool-cross-with-host-CC.patch    |  7 ++--
 ...configure.ac-allow-cross-compilation.patch | 20 ++++++-----
 ...-execinfo-in-libc-before-searching-l.patch | 34 +++++++------------
 .../freeradius-server/freeradius-server.hash  |  4 +--
 .../freeradius-server/freeradius-server.mk    | 10 +++---
 5 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
index 398f88e4ad..0cd55071c4 100644
--- a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
+++ b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
@@ -9,6 +9,8 @@ Upstream: Not applicable
 
 Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+[Fabrice: update for 3.2.3]
+SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  scripts/libtool.mk | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -18,13 +20,14 @@ index 57915e1053..c28260dd7e 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
 @@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+
      # binary!
      ${JLIBTOOL}: ${top_makedir}/jlibtool.c
  	$(Q)mkdir -p $(dir $@)
 -	$(Q)echo CC jlibtool.c
--	$(Q)${CC} $< -o $@
+-	$(Q)${CC} $< -o $@ ${JLIBTOOL_DEFS}
 +	$(Q)echo HOSTCC jlibtool.c
-+	$(Q)${HOSTCC} $< -o $@
++	$(Q)${HOSTCC} $< -o $@ ${JLIBTOOL_DEFS}
  
      clean: jlibtool_clean
  
diff --git a/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch b/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch
index d6d1bcfc78..a34c872af7 100644
--- a/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch
+++ b/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch
@@ -19,6 +19,8 @@ Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/
 Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+[Fabrice: update for 3.2.3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/modules/rlm_krb5/configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -28,15 +30,15 @@ index efc9f29d7f..98a97e438a 100644
 --- a/src/modules/rlm_krb5/configure.ac
 +++ b/src/modules/rlm_krb5/configure.ac
 @@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
- 		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
- 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
- 			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
--				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
-+				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
-+				[AC_MSG_WARN(cross compiling: not checking)])
- 		fi
- 	else
- 		krb5threadsafe=""
+ 	FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
+ 	if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
+ 		AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
+-			[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
++			[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
++			[AC_MSG_WARN(cross compiling: not checking)])
+ 	fi
+ else
+ 	krb5threadsafe=""
 -- 
 2.17.1
 
diff --git a/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch b/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch
index b4cbc61a89..6633bd2786 100644
--- a/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch
+++ b/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch
@@ -12,6 +12,8 @@ FR_SMART_CHECK_LIB can find an incompatible library.
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+[Fabrice: update for 3.2.3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.ac | 38 +++++++++++++++++++-------------------
  1 file changed, 19 insertions(+), 19 deletions(-)
@@ -20,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index f431da6db5..faa7cfc2b4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2165,26 +2165,26 @@ dnl #
+@@ -2165,21 +2165,21 @@ dnl #
  smart_try_dir=$execinfo_include_dir
  FR_SMART_CHECK_INCLUDE(execinfo.h)
  if test "x$ac_cv_header_execinfo_h" = "xyes"; then
@@ -28,39 +30,29 @@ index f431da6db5..faa7cfc2b4 100644
 -  FR_SMART_CHECK_LIB(execinfo, backtrace_symbols)
 +  dnl # Might be provided as part of libc
 +  AC_MSG_CHECKING([if execinfo provided as part of libc])
-+  AC_TRY_LINK(
-+    [
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
 +      #include <execinfo.h>
-+    ],
-+    [
++    ]], [[
 +      void *sym[1];
-+      backtrace_symbols(&sym, sizeof(sym)) ],
-+    [
++      backtrace_symbols(&sym, sizeof(sym)) ]])],[
 +      AC_MSG_RESULT(yes)
 +      ac_cv_lib_execinfo_backtrace_symbols="yes"
-+    ],
-+    [
++    ],[
 +      AC_MSG_RESULT(no)
-+    ]
-+  )
++  ])
    if test "x$ac_cv_lib_execinfo_backtrace_symbols" != "xyes"; then
 -    dnl # Might be provided as part of libc
 -    AC_MSG_CHECKING([if execinfo provided as part of libc])
--    AC_TRY_LINK(
--      [
+-    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
 -        #include <execinfo.h>
--      ],
--      [
+-      ]], [[
 -        void *sym[1];
--        backtrace_symbols(&sym, sizeof(sym)) ],
--      [
+-        backtrace_symbols(&sym, sizeof(sym)) ]])],[
 -        AC_MSG_RESULT(yes)
 -        ac_cv_lib_execinfo_backtrace_symbols="yes"
--      ],
--      [
+-      ],[
 -        AC_MSG_RESULT(no)
--      ]
--    )
+-    ])
 +    smart_try_dir=$execinfo_lib_dir
 +    FR_SMART_CHECK_LIB(execinfo, backtrace_symbols)
    fi
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index 33ec09e7b0..a267bd6f8c 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.2.0.tar.bz2.sig
-sha256  a3071cd78ffcb4706217561d822ee4c760daeb277a63f36a9f11d412c3c39e56  freeradius-server-3.2.0.tar.bz2
+# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.2.3.tar.bz2.sig
+sha256  4a16aeffbfa1424e1f317fdf71d17e5523a4fd9564d87c747a60595ef93c5d1f  freeradius-server-3.2.3.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 5a560d9153..2dd9c4e609 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERADIUS_SERVER_VERSION = 3.2.0
+FREERADIUS_SERVER_VERSION = 3.2.3
 FREERADIUS_SERVER_SOURCE = \
 	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
 FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
@@ -16,10 +16,10 @@ FREERADIUS_SERVER_DEPENDENCIES = libtalloc
 FREERADIUS_SERVER_AUTORECONF = YES
 
 # We're patching src/modules/rlm_krb5/configure.ac
-define FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
-	cd $(@D)/src/modules/rlm_krb5; $(AUTOCONF) -I$(@D)
+define FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
+	cd $(@D)/src/modules/rlm_krb5; $(AUTORECONF) -I$(@D)/m4
 endef
-FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
 
 # some compiler checks are not supported while cross compiling.
 # instead of removing those checks, we cache the answers
@@ -73,11 +73,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_HIREDIS),y)
 FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_cache_redis \
 	--with-rlm_redis \
 	--with-rlm_rediswho
 FREERADIUS_SERVER_DEPENDENCIES += hiredis
 else
 FREERADIUS_SERVER_CONF_OPTS += \
+	--without-rlm_cache_redis \
 	--without-rlm_redis \
 	--without-rlm_rediswho
 endif
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
