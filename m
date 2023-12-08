Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF227C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 19:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51F3E4382B;
	Fri,  8 Dec 2023 19:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51F3E4382B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b283Ex1sYBrf; Fri,  8 Dec 2023 19:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11B6E43826;
	Fri,  8 Dec 2023 19:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11B6E43826
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A66CB1BF337
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 19:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EDA5416AA
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 19:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDA5416AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MS_6UBL3NYGY for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 19:13:50 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2C77416A4
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 19:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C77416A4
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336121f93e3so36974f8f.0
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 11:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702062828; x=1702667628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSa/kYxGC6a8XgeGZ2DDe4VjQp3yKBJieBbn1QzjUlY=;
 b=c1lEspZHbpb9ZKtSd6roZzDHcU0Qo4BsFy5fw+E3wKW+1tRpThA/bdHSH3SdKlcSby
 4FufCNXEM6TIFisT5Gbl2YawkMqZ9p3hxALcT+qOvJwVSPjtBN/oFldk7ozMDR9rFY4G
 JmSZmO+iOTa1X6wwJuuSmMcz1im3ni/A0fN6Oal+FrBLUwPqo1j6QQ5+bOem2bBVBTf4
 wSWb/CaUyBF3O7paLF6QlT6l2a/mx3qplJQIRLq6N+CHGlYGFPN6wgvan9CruulihZzq
 IvoaWPPWu8CfkgJgCQZ0v7wavk1ksQdy+UFH35+y5Ff7chBAsP+y25+8PtgaHkG1pUPU
 RCWg==
X-Gm-Message-State: AOJu0YyalJiMV409ueZ1eJzftRSQC9t8kEAnu9fs5Fode+jSzLXSB3nn
 f9W8KqvuJu4ZGtY87d91gn7i3nIc9Fs=
X-Google-Smtp-Source: AGHT+IHPl5mpnrTyghbmCR5OqeGfxFCuzRE7l7XC7Jq0h60wHBiN4VGyecGhlsIIjD2pgjkts2zsVA==
X-Received: by 2002:a05:6000:1247:b0:332:ce79:cffe with SMTP id
 j7-20020a056000124700b00332ce79cffemr349179wrx.35.1702062827361; 
 Fri, 08 Dec 2023 11:13:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z10-20020a056000110a00b0033343804ec9sm2599904wrw.85.2023.12.08.11.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 11:13:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 20:13:44 +0100
Message-ID: <20231208191344.2432108-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702062828; x=1702667628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eSa/kYxGC6a8XgeGZ2DDe4VjQp3yKBJieBbn1QzjUlY=;
 b=LAXSxudMDXLRMM5IK8xpJKGHxW/tClO3apL2MhcL1sgLoKMegEDI5q978SXQ+yZkKT
 kaT9gI529mjvRLa4Tp8EVSGFus3j5/Ax82wg7xkXgFcfism5fmP1k69ukfnBkTIHwPcl
 CdzHN4ev677t2/eLT268f3+RqW07f6u8Vl36Hyebfh55Rv15czxGLqu4ALJziH6Z0CGB
 XiC8iaLEavAafRlKmNedcqJakpmpoaffUtVFuFGVeBYxCeWf0NA2//Uu9yqIOSH1GK8J
 kk3c0fu1lGvrffFKHURfu7vLANZO0iwfo8g1otUY1TXYKXtRSSkkXHAR70XwLJmVa7vh
 qZog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LAXSxudM
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.22
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- tools option has been dropped since
  https://github.com/jackaudio/jack2/commit/564c710eefc760a5683b88b3ecb8a29100d5274e
- sndfile is not a dependency since
  https://github.com/jackaudio/jack2/commit/c69d6097c2acc7fa0558a0b0bef509c526719cb1
- readline is not a dependency since
  https://github.com/jackaudio/jack2/commit/a0b3e3e4dd2fc22c8d3e34b0030edf3d1fab0fd5

https://github.com/jackaudio/jack2/blob/v1.9.22/ChangeLog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...U-mode-bit-for-opening-files-in-pyth.patch | 55 -------------------
 package/jack2/jack2.hash                      |  2 +-
 package/jack2/jack2.mk                        | 18 +-----
 4 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index ba1c07ea5f..34c4c7c161 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -592,7 +592,6 @@ package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch Up
 package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch Upstream
 package/iucode-tool/S00iucode-tool Variables
 package/iwd/S40iwd Shellcheck Variables
-package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch Upstream
 package/janus-gateway/0001-disable-ssp.patch Upstream
 package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch Upstream
 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch Upstream
diff --git a/package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch b/package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
deleted file mode 100644
index 9ee5a43e18..0000000000
--- a/package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 328c58967dce8be426f9208ba7717ab5afc2c4f3 Mon Sep 17 00:00:00 2001
-From: Daan De Meyer <daan.j.demeyer@gmail.com>
-Date: Mon, 11 Jul 2022 00:56:28 +0200
-Subject: [PATCH] Remove usage of 'U' mode bit for opening files in python
-
-The 'U' mode bit is removed in python 3.11. It has been
-deprecated for a long time. The 'U' mode bit has no effect
-so this change doesn't change any behavior.
-
-See https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-api
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- waflib/ConfigSet.py | 2 +-
- waflib/Context.py   | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
-index b300bb56..84736c9c 100644
---- a/waflib/ConfigSet.py
-+++ b/waflib/ConfigSet.py
-@@ -312,7 +312,7 @@ class ConfigSet(object):
- 		:type filename: string
- 		"""
- 		tbl = self.table
--		code = Utils.readf(filename, m='rU')
-+		code = Utils.readf(filename, m='r')
- 		for m in re_imp.finditer(code):
- 			g = m.group
- 			tbl[g(2)] = eval(g(3))
-diff --git a/waflib/Context.py b/waflib/Context.py
-index 9fee3fa1..761b521f 100644
---- a/waflib/Context.py
-+++ b/waflib/Context.py
-@@ -266,7 +266,7 @@ class Context(ctx):
- 				cache[node] = True
- 				self.pre_recurse(node)
- 				try:
--					function_code = node.read('rU', encoding)
-+					function_code = node.read('r', encoding)
- 					exec(compile(function_code, node.abspath(), 'exec'), self.exec_dict)
- 				finally:
- 					self.post_recurse(node)
-@@ -662,7 +662,7 @@ def load_module(path, encoding=None):
- 
- 	module = imp.new_module(WSCRIPT_FILE)
- 	try:
--		code = Utils.readf(path, m='rU', encoding=encoding)
-+		code = Utils.readf(path, m='r', encoding=encoding)
- 	except EnvironmentError:
- 		raise Errors.WafError('Could not read the file %r' % path)
- 
--- 
-2.30.2
-
diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index c98971ca1c..264e877e92 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8b044a40ba5393b47605a920ba30744fdf8bf77d210eca90d39c8637fe6bc65d  jack2-1.9.21.tar.gz
+sha256  1e42b9fc4ad7db7befd414d45ab2f8a159c0b30fcd6eee452be662298766a849  jack2-1.9.22.tar.gz
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index f7683304a6..de5d15667e 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.21
+JACK2_VERSION = 1.9.22
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ JACK2_CPE_ID_VENDOR = jackaudio
 JACK2_DEPENDENCIES = host-pkgconf alsa-lib
 JACK2_INSTALL_STAGING = YES
 
-JACK2_CONF_OPTS = --alsa --example-tools=no
+JACK2_CONF_OPTS = --alsa
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 JACK2_DEPENDENCIES += libexecinfo
@@ -26,13 +26,6 @@ else
 JACK2_CONF_OPTS += --samplerate=no
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-JACK2_DEPENDENCIES += libsndfile
-JACK2_CONF_OPTS += --sndfile=yes
-else
-JACK2_CONF_OPTS += --sndfile=no
-endif
-
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 JACK2_CONF_OPTS += --opus=yes
@@ -40,13 +33,6 @@ else
 JACK2_CONF_OPTS += --opus=no
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
-JACK2_DEPENDENCIES += readline
-JACK2_CONF_OPTS += --readline=yes
-else
-JACK2_CONF_OPTS += --readline=no
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 JACK2_DEPENDENCIES += systemd
 JACK2_CONF_OPTS += --systemd=yes
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
