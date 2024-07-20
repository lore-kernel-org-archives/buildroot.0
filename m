Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF3C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 19:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E05880B78;
	Sat, 20 Jul 2024 19:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFJBjc15CAe7; Sat, 20 Jul 2024 19:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2871F80B46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2871F80B46;
	Sat, 20 Jul 2024 19:55:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4498E1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F5176074E
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYqulauOGrCT for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 19:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E938C60731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E938C60731
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E938C60731
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 19:55:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso20970115e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721505311; x=1722110111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p3/5ofL1htaQsrbQb9ffNUXnUPSGbjL4gmlmmrrfSqg=;
 b=tOQrQYcMFf+NBV6w3NMFmhfDMW02mYczthPhhYa7IM3wk/CZ+iDk63h0c7NXuELqU4
 bD+MySZ8lQfstnhVKU3Je6pNks6mxFDDiog0IMJsIdhLO7Ho/o4IpXwOquOCneOYSa3I
 eznxC1W/47ZPxbP3Ei2QP6N2XE5IYxzGin3EBLN1F2eh+kDK5Z4vV3tLm6m639aswy6Z
 OwqEiADBaHYA/wEJEYOEKvdciZXOJV4LDgtglnib8/B2NgYncmLkyzm+4acgHy5FIxTI
 xFvw820vjkZBRIBzk12vSv2ktSe+s6ivmGm0O8+c2Kcj398xJ/jhggF6fuWuH6IaiaEr
 l5zQ==
X-Gm-Message-State: AOJu0Yy0xCZqnq55Qst+vgGe3uw6YnnJGPprTwjjZgs4yzSrA0LRrO6E
 OTwoOmcG32V/suwQm1dXgwNhH8OSWd/c9wc5Mtpe2yDL43QN2JD+Jzyo3A==
X-Google-Smtp-Source: AGHT+IH2gUDGkUVEn6sndTx3Oz/VcerWy3PXKAM76jozep+45YaQH2M2XdsuivTWYM096EDUZFjHZA==
X-Received: by 2002:a05:600c:3d14:b0:426:6675:a115 with SMTP id
 5b1f17b1804b1-427dc5298a8mr15122195e9.22.1721505311154; 
 Sat, 20 Jul 2024 12:55:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e2a1sm92668465e9.31.2024.07.20.12.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 12:55:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 21:55:05 +0200
Message-ID: <20240720195505.1052184-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721505311; x=1722110111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p3/5ofL1htaQsrbQb9ffNUXnUPSGbjL4gmlmmrrfSqg=;
 b=jqALMaiPiwbqmAtk4a9YQIsyGBOWDxSL/LDPKdNrLlmLjuj6FFQzWesKuY4RQuaxf2
 SqdL70LXnVgYmZMKokrNM/8Np3BBObSMgqw7xddn0mGk50OrwLusqAEvflGVxF4iNo/0
 NLJ1DK977BcYUs02e1/BgTd1tf2DqtADMzAByQ1z3UjNpFFO6xWl1pzsYGJ761uV1WMe
 Df+gczPZbishSRS9/8b5LTEI3Q53TttojKj0IJhQCjw2TdSdBcrjuCPIUrXvSZxw8g2s
 AmTYIWcNTKKLacy2ZL+syVHHkBzaO3oUOKutrYOmRZOdBtHITRcxAfcB8HTA9HvKIYRB
 V4cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jqALMaiP
Subject: [Buildroot] [PATCH 1/1] package/zsh: fix build with gcc >= 14
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 14:

termcap.c:45:14: error: conflicting types for 'boolcodes'; have 'char *[]'
   45 | static char *boolcodes[] = {
      |              ^~~~~~~~~
In file included from ../../Src/zshterm.h:1,
                 from ../../Src/zsh_system.h:932,
                 from ../../Src/zsh.mdh:17,
                 from termcap.mdh:17,
                 from termcap.c:38:
/home/autobuild/autobuild/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/term.h:764:56: note: previous declaration of 'boolcodes' with type 'const char * const[]'
  764 | extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolcodes[];
      |                                                        ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fe2f7170465e96cc1de3dae139a25f615331f4b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...er-types-in-terminfo-global-variable.patch | 51 +++++++++++++++++++
 package/zsh/zsh.mk                            |  2 +
 2 files changed, 53 insertions(+)
 create mode 100644 package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch

diff --git a/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch b/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
new file mode 100644
index 0000000000..c67c374918
--- /dev/null
+++ b/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
@@ -0,0 +1,51 @@
+From 4c89849c98172c951a9def3690e8647dae76308f Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 8 Dec 2023 21:58:07 +0100
+Subject: [PATCH] 52383: Avoid incompatible pointer types in terminfo global
+ variable checks
+
+Upstream: https://sourceforge.net/p/zsh/code/ci/4c89849c98172c951a9def3690e8647dae76308f
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog    |  3 +++
+ configure.ac | 12 ++++++------
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2a8221e1f..2871dcb7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1768,27 +1768,27 @@ if test x$zsh_cv_path_term_header != xnone; then
+   fi
+ 
+   AC_MSG_CHECKING(if boolcodes is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = boolcodes; puts(*test);]])],[AC_DEFINE(HAVE_BOOLCODES) boolcodes=yes],[boolcodes=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)boolcodes; puts(*test);]])],[AC_DEFINE(HAVE_BOOLCODES) boolcodes=yes],[boolcodes=no])
+   AC_MSG_RESULT($boolcodes)
+ 
+   AC_MSG_CHECKING(if numcodes is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = numcodes; puts(*test);]])],[AC_DEFINE(HAVE_NUMCODES) numcodes=yes],[numcodes=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)numcodes; puts(*test);]])],[AC_DEFINE(HAVE_NUMCODES) numcodes=yes],[numcodes=no])
+   AC_MSG_RESULT($numcodes)
+ 
+   AC_MSG_CHECKING(if strcodes is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = strcodes; puts(*test);]])],[AC_DEFINE(HAVE_STRCODES) strcodes=yes],[strcodes=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)strcodes; puts(*test);]])],[AC_DEFINE(HAVE_STRCODES) strcodes=yes],[strcodes=no])
+   AC_MSG_RESULT($strcodes)
+ 
+   AC_MSG_CHECKING(if boolnames is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = boolnames; puts(*test);]])],[AC_DEFINE(HAVE_BOOLNAMES) boolnames=yes],[boolnames=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)boolnames; puts(*test);]])],[AC_DEFINE(HAVE_BOOLNAMES) boolnames=yes],[boolnames=no])
+   AC_MSG_RESULT($boolnames)
+ 
+   AC_MSG_CHECKING(if numnames is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = numnames; puts(*test);]])],[AC_DEFINE(HAVE_NUMNAMES) numnames=yes],[numnames=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)numnames; puts(*test);]])],[AC_DEFINE(HAVE_NUMNAMES) numnames=yes],[numnames=no])
+   AC_MSG_RESULT($numnames)
+ 
+   AC_MSG_CHECKING(if strnames is available)
+-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = strnames; puts(*test);]])],[AC_DEFINE(HAVE_STRNAMES) strnames=yes],[strnames=no])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = (char **)strnames; puts(*test);]])],[AC_DEFINE(HAVE_STRNAMES) strnames=yes],[strnames=no])
+   AC_MSG_RESULT($strnames)
+ 
+   dnl There are apparently defective terminal library headers on some
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index e790bf4c5e..7e577fa9e1 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -13,6 +13,8 @@ ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 ZSH_CPE_ID_VENDOR = zsh
+# 0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
+ZSH_AUTORECONF = YES
 
 # zsh uses TRY_RUN to determine these
 ZSH_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
