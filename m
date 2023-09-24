Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA58CE7A8B
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62983417DC;
	Sun, 24 Sep 2023 21:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62983417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CI5xPRHpBqOL; Sun, 24 Sep 2023 21:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C52434180B;
	Sun, 24 Sep 2023 21:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52434180B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB8561BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8517C81CAF
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8517C81CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQRP9fslCjpb for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:59 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4072A81C2F
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4072A81C2F
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso4679332f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 14:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695590517; x=1696195317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HiZT6C1UfOER2afgVFZOVL5II3LyDL3ktwAGBML9oE=;
 b=HfVLzLDCb469V7/7WBA+emLrxiFJyf1lVmynVglDSaszJZT0ywW2qBMmAoxkE2M/IB
 Iz6Yxz9QvZl4DNyobjLutzrHnQm8Nl2fRaGDtPWh2u8LQaW1mPrN0VXk+3CLh1g4YvrA
 KI3E9LV4KvOjT3qL4HjkEVkcbiv7JtWf/cdH5acsMc0pq1u23ZnmrKZQYegZfwh+QZUI
 0Eo8LWQP6q6X3TjIMN0kVpYBmIduf51EkIvy3cgMxfSuav6ly4jz8BcaizhxSBT1Kfvy
 3eKxDTjwikej46NwbmwH5rEcuV+fKUw839/EhJ8y+sZ006uXbznV9qtlIfhlCAPRQ8gY
 zIzA==
X-Gm-Message-State: AOJu0Yw2dSPmEbyz340jYfxwekaW5APG1Kkv6PBU9pts/tLyF5d11bb1
 rFX+yYOT9X5+woa1GLsxWB0oVczjdLk=
X-Google-Smtp-Source: AGHT+IHv1hxd1b7w9HaFPT7T5UzJYzD3PEoR1kHJCmlaD0cZueH1H9c0S2eOkFwueWSHupfv7xno1w==
X-Received: by 2002:adf:f9cb:0:b0:319:7472:f0b6 with SMTP id
 w11-20020adff9cb000000b003197472f0b6mr4725682wrr.15.1695590516826; 
 Sun, 24 Sep 2023 14:21:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w7-20020adff9c7000000b0031912c0ffebsm10062712wrr.23.2023.09.24.14.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 14:21:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:21:53 +0200
Message-Id: <20230924212153.1624634-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695590517; x=1696195317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2HiZT6C1UfOER2afgVFZOVL5II3LyDL3ktwAGBML9oE=;
 b=c0aWPn21GaVVCLdTfZSwUDRggu1J0CCiahmoreimi2VW53f8A1moxUKJsTXIiEVHH5
 2TYbcM7TwljsYkln8Zuv/fxo+PY4n0muFNZB2u9u7wNqFtEAix/ENrEJehBj1C3m6z1g
 HBGEX7e4Xd6SKSWZUzBrKmDZGg8cxpRT674i7dYWEkIa60/YQ9ahIvIyYsTrVSLzPYNr
 xk59uAdk6/wV/K+Ac7m51dTK8tf4rlRZiKF0A/A8vFQdGILwix2Qa3ao+eodpi+aapk1
 GwRJ8AQeb+nnVTBnXJWS5hWuGIThqN9JwRRdaPoSuU+PftGU86BCHcNdoPcNBFSIxW4w
 ASpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c0aWPn21
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.11
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

Drop patch (already in version) and so also drop autoreconf

https://lists.gnu.org/archive/html/freeipmi-announce/2023-06/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                         |  1 -
 package/freeipmi/0001-add-disable-doc.patch | 72 ---------------------
 package/freeipmi/freeipmi.hash              |  2 +-
 package/freeipmi/freeipmi.mk                |  4 +-
 4 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 package/freeipmi/0001-add-disable-doc.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 7918a22c44..828d99f294 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -439,7 +439,6 @@ package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch Ups
 package/flite/0001-fix-alsa-static.patch Upstream
 package/fltk/0001-disable-tests.patch Upstream
 package/fluxbox/0001-fixes-bug-1138.patch Upstream
-package/freeipmi/0001-add-disable-doc.patch Upstream
 package/freeradius-client/0001-fix-for-nettle.patch Upstream
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
diff --git a/package/freeipmi/0001-add-disable-doc.patch b/package/freeipmi/0001-add-disable-doc.patch
deleted file mode 100644
index e410d2b52f..0000000000
--- a/package/freeipmi/0001-add-disable-doc.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 5324c88632c021a87251370b03067d857e9a9892 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 2 Nov 2022 19:02:42 +0100
-Subject: [PATCH] add --disable-doc
-
-Allow the user to disable documentation through --disable-doc to avoid
-the following build failure without makeinfo:
-
-/home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <https://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <https://www.gnu.org/software/make/>
-Makefile:442: recipe for target 'freeipmi-faq.info' failed
-
-Fixes:
- - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/61]
----
- Makefile.am  | 6 +++++-
- configure.ac | 4 ++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index cf757f634..d74952e30 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,7 +3,6 @@
- ACLOCAL_AMFLAGS = -I config
- 
- SUBDIRS = \
--	doc \
- 	etc \
- 	common \
- 	libfreeipmi \
-@@ -33,6 +32,11 @@ SUBDIRS = \
- 	rmcpping \
- 	contrib
- 
-+if ENABLE_DOC
-+SUBDIRS += \
-+	doc
-+endif
-+
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
- 
-diff --git a/configure.ac b/configure.ac
-index 54fdf6367..7a94b958b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -341,6 +341,10 @@ else
- fi
- AC_SUBST(WITH_DEBUG)
- 
-+AC_ARG_ENABLE(doc,
-+              AC_HELP_STRING([--disable-doc], [turn off documentation]))
-+AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
-+
- dnl Allow advanced developers to compile with raw dumping
- AC_ARG_ENABLE(rawdumps,
-    AC_HELP_STRING([--enable-rawdumps], [output raw packet dumps when debugging]))
--- 
-2.35.1
-
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index bc22d2ff6b..ac24b7c64e 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  fce4a1e401b6189c103d2b1203261d0bfbf45985c6f3fa44c51b186b13fe7a7d  freeipmi-1.6.10.tar.gz
+sha256  65fbd6910fc010457748695414f27c5755b4e8d75734221221f3858c6230a897  freeipmi-1.6.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 3e0ac0ffa9..ecff6f9925 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.10
+FREEIPMI_VERSION = 1.6.11
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
@@ -12,8 +12,6 @@ FREEIPMI_LICENSE_FILES = \
 	COPYING.ipmidetect COPYING.ipmi-fru COPYING.ipmimonitoring \
 	COPYING.ipmiping COPYING.ipmipower COPYING.ipmiseld COPYING.pstdout \
 	COPYING.sunbmc COPYING.ZRESEARCH
-# We're patching configure.ac
-FREEIPMI_AUTORECONF = YES
 FREEIPMI_DEPENDENCIES = host-pkgconf
 FREEIPMI_INSTALL_STAGING = YES
 # Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
